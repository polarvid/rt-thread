/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#include "arch/aarch64.h"
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

static struct ftrace_tracer dummy_tracer;

#ifndef RT_CPUS_NR
#define RT_CPUS_NR 1
#endif

// static _Atomic(size_t) count[RT_CPUS_NR * 16];

typedef struct sample_event {
    void *entry_address;
} sample_event_t;

static void _debug_test_fn(char *str)
{
    rt_kputs(str);
}

static rt_notrace
rt_ubase_t _test_handler(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    // const struct ftrace_context*ctx = context;

    // rt_kprintf("message[0x%lx]\n", ftrace_timestamp());
    // rt_kprintf("%s(%p, 0x%lx, 0x%lx, %p)\n", __func__, tracer, pc, ret_addr, context);
    // for (int i = 0; i < FTRACE_REG_CNT; i += 2)
    //     rt_kprintf("%d %p, %p\n", i, ctx->args[i], ctx->args[i + 1]);

    // call counter
    // atomic_fetch_add(&count[rt_hw_cpu_id() << 4], 1);

    trace_evt_ring_t ring = tracer->data;
    sample_event_t event = {.entry_address = (void *)pc - 4};
    event_ring_enqueue(ring, &event, 0);
    return 0;
}

static void _alloc_buffer(trace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    RT_ASSERT(!*pbuffer);
    *pbuffer = rt_pages_alloc2(0, PAGE_ANY_AVAILABLE);
    RT_ASSERT(!!*pbuffer);

    /* test on event_ring_object_loc */
    void *preobj = 0;
    for (size_t i = 0; i < ring->objs_per_buf; i++)
    {
        size_t index = i + (pbuffer - (void **)&ring->buftbl[cpuid * ring->bufs_per_ring]) * ring->objs_per_buf;
        void *obj = event_ring_object_loc(ring, index, cpuid);
        RT_ASSERT(obj >= *pbuffer && obj < *pbuffer + 4096);
        RT_ASSERT(!preobj || obj == preobj + 8);
        preobj = obj;
        index += 1;
    }
}

// void (*handler)(trace_evt_ring_t ring, size_t cpuid, void *pevent, void *data)
static void _dump_buf(trace_evt_ring_t ring, size_t cpuid, void *pevent, void *data)
{
    int *fds = data;
    int fd = fds[cpuid];
    sample_event_t *event = pevent;

    /* print progress */
    static size_t stride = 0;
    static size_t progree = 0;
    static size_t step = 0;
    if (!stride)
    {
        stride = (event_ring_count(ring, cpuid) + 99) / 100;
    }

    // rt_kprintf("%p\n", event->entry_address);

    if (step++ % stride == 0)
    {
        rt_kprintf("cpuid %d: %d%%\n", cpuid, progree);
        progree = progree < 99 ? progree+1 : 0;
    }

    ssize_t ret = write(fd, &event->entry_address, 8);
    if (ret == -1) {
        RT_ASSERT(0);
    }
}

static void _free_buffer(trace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    rt_pages_free(*pbuffer, 0);
    return;
}

static void _debug_ftrace(void)
{
    extern void _ftrace_entry_insn(void);
    // RT_ASSERT(!_ftrace_patch_code(_ftrace_entry_insn, 0));
    // RT_ASSERT(!_ftrace_patch_code(_ftrace_entry_insn, 1));

    /* init */
    trace_evt_ring_t ring;
    ring = event_ring_create(RT_CPUS_NR * (4ul << 20), sizeof(sample_event_t), ARCH_PAGE_SIZE);
    event_ring_for_each_buffer_lock(ring, _alloc_buffer, NULL);

    // while (1) {
    /* test gen bl */
    ftrace_tracer_init(&dummy_tracer, _test_handler, ring);

    /* test recursion */
    // ftrace_tracer_set_trace(&dummy_tracer, _debug_test_fn);
    // ftrace_tracer_set_trace(&dummy_tracer, _test_handler);

    /* test every functions */
    void *notrace[] = {&rt_kmem_pvoff, &rt_page_addr2page, &rt_hw_spin_lock, &rt_hw_spin_unlock,
                       &rt_page_ref_inc, &rt_kmem_v2p, &rt_page_ref_get, &rt_cpu_index,
                       &rt_cpus_lock, &rt_cpus_unlock};
    ftrace_tracer_set_except(&dummy_tracer, notrace, sizeof(notrace)/sizeof(notrace[0]));

    /* a dummy instrumentation */
    _debug_test_fn("no tracer\n");

    /* ftrace enabled */
    ftrace_tracer_register(&dummy_tracer);
    rt_kprintf("ftrace enabled\n");
    __asm__ volatile("mov x1, 1");
    __asm__ volatile("mov x2, 2");
    __asm__ volatile("mov x3, 3");
    __asm__ volatile("mov x4, 4");
    __asm__ volatile("mov x5, 5");
    __asm__ volatile("mov x6, 6");
    __asm__ volatile("mov x7, 7");
    __asm__ volatile("mov x8, 8");
    _debug_test_fn("dummy tracer enable\n");

    void utest_testcase_run(int argc, char** argv);
    utest_testcase_run(1, 0);

    /* ftrace disabled */
    ftrace_tracer_unregister(&dummy_tracer);
    _debug_test_fn("dummy tracer unregistered\n");

    // for (size_t i = 0; i < RT_CPUS_NR; i++)
    // {
    //     size_t calltimes = count[i << 4];
    //     count[i << 4] = 0;
    //     rt_kprintf("count 0x%lx\n", calltimes);
    // }

    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
        rt_kprintf("cpu %d count %d drops %ld\n", cpuid, event_ring_count(ring, cpuid), ring->rings[cpuid].drop_events);
    // rt_thread_mdelay(100);
    // }
    /* output recording */
    int fds[RT_CPUS_NR];
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
    {
        char buf[32];
        rt_snprintf(buf, sizeof(buf), "/dev/shm/logging-%d.txt", cpuid);
        fds[cpuid] = open(buf, O_WRONLY | O_CREAT, 0);
    }

    event_ring_for_each_event_lock(ring, _dump_buf, (void *)fds);

    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
    {
        close(fds[cpuid]);
        char src[64];
        rt_snprintf(src, sizeof(src), "/dev/shm/logging-%d.txt", cpuid);
        void copy(const char *src, const char *dst);
        copy(src, src + 8);
    }

    event_ring_for_each_buffer_lock(ring, _free_buffer, 0);

    event_ring_delete(ring);
    return ;
}
MSH_CMD_EXPORT_ALIAS(_debug_ftrace, ftrace_test, test ftrace feature);
