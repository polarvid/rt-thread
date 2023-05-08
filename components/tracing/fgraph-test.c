/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-15     WangXiaoyao  fgraph support
 */

#include "event-ring.h"
#include "ftrace.h"
#include "internal.h"

#include <dfs_file.h>
#include <lwp.h>
#include <mm_aspace.h>
#include <mm_page.h>
#include <mmu.h>
#include <rtthread.h>
#include <rthw.h>

#include <stdatomic.h>
#include <unistd.h>

static struct ftrace_tracer dummy_fgraph;

typedef struct sample_event {
    void *entry_address;
    rt_uint64_t entry_time;
    rt_uint64_t exit_time;
    void *tid;
} fgraph_event_t;

static rt_notrace
rt_ubase_t _test_graph_on_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    rt_ubase_t time = ftrace_timestamp();
    return time ? time : 1;
}

static rt_notrace
void _test_graph_on_exit(ftrace_tracer_t tracer, rt_ubase_t entry_pc, rt_ubase_t stat, void *context)
{
    rt_ubase_t entry_time = stat;
    rt_ubase_t exit_time = ftrace_timestamp();
    ftrace_evt_ring_t ring = tracer->data;

    fgraph_event_t event = {
        .entry_address = (void *)FTRACE_PC_TO_SYM(entry_pc),
        .entry_time = entry_time,
        .exit_time = exit_time,
        /* use ftrace id instead */
        .tid = rt_thread_self(),
    };
    event_ring_enqueue(ring, &event, 0);
    return ;
}

static void _alloc_buffer(ftrace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    *pbuffer = rt_pages_alloc_ext(0, PAGE_ANY_AVAILABLE);
    RT_ASSERT(!!*pbuffer);
}

static void _free_buffer(ftrace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    rt_pages_free(*pbuffer, 0);
    return;
}

static void _report_buf(ftrace_evt_ring_t ring, size_t cpuid, void *pevent, void *data)
{
    int *fds = data;
    int fd = fds[cpuid];
    fgraph_event_t *event = pevent;

    /* print progress */
    static size_t precpuid = -1;
    static size_t total;
    static size_t stride = 0;
    static size_t step;
    if (precpuid != cpuid)
    {
        total = event_ring_count(ring, cpuid);
        stride = (total + 31) / 32;
        step = 0;
        precpuid = cpuid;
    }

    if (step++ % stride == 0)
    {
        rt_kprintf("cpu-%d: %lx/%lx\n", cpuid, step, total);
    }

    // rt_kprintf("[%3d]-%s func %p: calltime 0x%lx rettime 0x%lx\n", cpuid, tid->parent.name,
    //     event->entry_address, event->entry_time, event->exit_time);

    ssize_t ret = write(fd, event, sizeof(*event));
    if (ret == -1) {
        RT_ASSERT(0);
    }
}

/* tester */
#define WRITE_SIZE ((1ul << 10) / sizeof(rt_ubase_t))

void _app_test(void)
{
    int fd;
    fd = open("/dev/shm/logging.txt", O_WRONLY | O_CREAT, 0);

    // size_t stride = WRITE_SIZE / 100;
    for (size_t i = 0; i < WRITE_SIZE; i++)
    {
        /* print progress */
        // if (i % stride == 0)
        // {
        //     rt_kprintf("write 0x%lx/0x%lx\n", i, WRITE_SIZE);
        // }
        rt_ubase_t time = ftrace_timestamp();
        write(fd, &time, sizeof(time));
    }

    close(fd);
}

static void _debug_fgraph(void)
{
    /* init */
    rt_thread_control(rt_thread_self(), RT_THREAD_CTRL_BIND_CPU, (void *)0);
    ftrace_evt_ring_t ring;
    ring = event_ring_create(RT_CPUS_NR * (4ul << 20), sizeof(fgraph_event_t), ARCH_PAGE_SIZE);
    event_ring_for_each_buffer_lock(ring, _alloc_buffer, NULL);

    ftrace_tracer_init(&dummy_fgraph, _test_graph_on_entry, ring);
    ftrace_tracer_set_on_exit(&dummy_fgraph, _test_graph_on_exit);

    /* set trace point */
    void *notrace[] = {&rt_kmem_pvoff, &rt_page_addr2page, &rt_hw_spin_lock, &rt_hw_spin_unlock,
                       &rt_page_ref_inc, &rt_kmem_v2p, &rt_page_ref_get, &rt_cpu_index,
                       &rt_hw_dmb};
    ftrace_tracer_set_except(&dummy_fgraph, notrace, sizeof(notrace)/sizeof(notrace[0]));

    /* ftrace enabled */
    ftrace_tracer_register(&dummy_fgraph);

    /* do the tracing */
    _app_test();

    /* ftrace disabled */
    ftrace_tracer_unregister(&dummy_fgraph);

    /* report */
    int fds[RT_CPUS_NR];
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
    {
        char buf[32];
        rt_snprintf(buf, sizeof(buf), "/dev/shm/logging-%d.bin", cpuid);
        fds[cpuid] = open(buf, O_WRONLY | O_CREAT, 0);
    }

    atomic_thread_fence(memory_order_acquire);
    event_ring_for_each_event_lock(ring, _report_buf, (void *)fds);
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
    {
        close(fds[cpuid]);

        /* persistent storage */
        char src[64];
        rt_snprintf(src, sizeof(src), "/dev/shm/logging-%d.bin", cpuid);
        void copy(const char *src, const char *dst);
        rt_kprintf("cpu-%d: recording 0x%lx, drops 0x%lx\n", cpuid,
            event_ring_count(ring, cpuid), ring->rings[cpuid].drop_events);
        rt_kprintf("Save to filesystem[%s]\n", src + 8);
        copy(src, src + 8);
    }

    /* delete */
    event_ring_for_each_buffer_lock(ring, _free_buffer, 0);
    event_ring_delete(ring);
    rt_thread_control(rt_thread_self(), RT_THREAD_CTRL_BIND_CPU, (void *)RT_CPUS_NR);
    return ;
}
MSH_CMD_EXPORT_ALIAS(_debug_fgraph, fgraph_test, test ftrace feature);
