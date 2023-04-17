/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-15     WangXiaoyao  fgraph support
 */

#include "arch/aarch64.h"
#include "event-ring.h"
#include "ftrace.h"
#include "internal.h"

#include <mm_aspace.h>
#include <mm_page.h>
#include <mmu.h>
#include <rtthread.h>
#include <rthw.h>

#include <stdatomic.h>

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
    trace_evt_ring_t ring = tracer->data;

    fgraph_event_t event = {
        .entry_address = (void *)(entry_pc - 4),
        .entry_time = entry_time,
        .exit_time = exit_time,
        /* use ftrace id instead */
        .tid = rt_thread_self(),
    };
    event_ring_enqueue(ring, &event, 0);
    return ;
}

static void _alloc_buffer(trace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    *pbuffer = rt_pages_alloc_ext(0, PAGE_ANY_AVAILABLE);
    RT_ASSERT(!!*pbuffer);
}

static void _dump_buf(trace_evt_ring_t ring, size_t cpuid, void *pevent, void *data)
{
    // int *fds = data;
    // int fd = fds[cpuid];
    fgraph_event_t *event = pevent;

    /* print progress */
    // static size_t stride = 0;
    // static size_t progree = 0;
    // static size_t step = 0;
    // if (!stride)
    // {
    //     stride = (event_ring_count(ring, cpuid) + 99) / 100;
    // }

    rt_thread_t tid = event->tid;
    rt_kprintf("[%3d]-%s func %p: calltime 0x%lx rettime 0x%lx\n", cpuid, tid->parent.name,
        event->entry_address, event->entry_time, event->exit_time);

    // if (step++ % stride == 0)
    // {
    //     rt_kprintf("cpuid %d: %d%%\n", cpuid, progree);
    //     progree = progree < 99 ? progree+1 : 0;
    // }

    // ssize_t ret = write(fd, &event->entry_address, 8);
    // if (ret == -1) {
    //     RT_ASSERT(0);
    // }
}


static void _debug_fgraph(void)
{
    /* init */
    trace_evt_ring_t ring;
    ring = event_ring_create(RT_CPUS_NR * (4ul << 20), sizeof(fgraph_event_t), ARCH_PAGE_SIZE);
    event_ring_for_each_buffer_lock(ring, _alloc_buffer, NULL);

    ftrace_tracer_init(&dummy_fgraph, _test_graph_on_entry, ring);
    ftrace_tracer_set_on_exit(&dummy_fgraph, _test_graph_on_exit);

    /* set trace point */
    void *notrace[] = {&rt_kmem_pvoff, &rt_page_addr2page, &rt_hw_spin_lock, &rt_hw_spin_unlock,
                       &rt_page_ref_inc, &rt_kmem_v2p, &rt_page_ref_get, &rt_cpu_index};
    ftrace_tracer_set_except(&dummy_fgraph, notrace, sizeof(notrace)/sizeof(notrace[0]));

    /* ftrace enabled */
    ftrace_tracer_register(&dummy_fgraph);

    /* do the tracing */

    /* ftrace disabled */
    ftrace_tracer_unregister(&dummy_fgraph);

    /* report */
    event_ring_for_each_event_lock(ring, _dump_buf, (void *)0);

    return ;
}
MSH_CMD_EXPORT_ALIAS(_debug_fgraph, fgraph_test, test ftrace feature);
