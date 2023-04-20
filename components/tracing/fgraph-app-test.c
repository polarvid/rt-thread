/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-15     WangXiaoyao  fgraph support
 */

#define DBG_TAG "tracing.fgraph"
#define DBG_LVL DBG_INFO
#include <rtdbg.h>

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
#include <unistd.h>

static struct ftrace_tracer fgraph_app;

typedef struct sample_event {
    void *entry_address;
    rt_uint64_t entry_time;
    rt_uint64_t exit_time;
    void *tid;
} fgraph_event_t;

static pid_t pid;

static rt_notrace
rt_ubase_t _test_graph_on_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    rt_ubase_t time = ftrace_timestamp();
    // struct ftrace_context *ctx = context;

    /* maybe disable tracer on lwp_free & compare pid */
    if ((char *)&sys_exit == (char *)FTRACE_PC_TO_SYM(pc) ||
        (char *)&lwp_free == (char *)FTRACE_PC_TO_SYM(pc))
    {
        ftrace_tracer_set_status(tracer, RT_FALSE);
        /* not to trace exit */
        LOG_I("tracing stop");
        time = 0;
    }
    else
        time = time ? time : 1;

    return time;
}

static rt_notrace
void _test_graph_on_exit(ftrace_tracer_t tracer, rt_ubase_t entry_pc, rt_ubase_t stat, void *context)
{
    rt_ubase_t entry_time = stat;
    rt_ubase_t exit_time = ftrace_timestamp();
    trace_evt_ring_t ring = tracer->data;

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

static void _alloc_buffer(trace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    *pbuffer = rt_pages_alloc_ext(0, PAGE_ANY_AVAILABLE);
    RT_ASSERT(!!*pbuffer);
}

static void _free_buffer(trace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    rt_pages_free(*pbuffer, 0);
    return;
}

static void _report_buf(trace_evt_ring_t ring, size_t cpuid, void *pevent, void *data)
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
        stride = (total + 15) / 16;
        step = 0;
        precpuid = cpuid;
    }

    if (step++ % stride == 0)
    {
        LOG_I("cpu-%d: 0x%lx/0x%lx", cpuid, step, total);
    }

    /** TODO should use a tracing time recording instead */
    rt_thread_t tid = event->tid;
    if (tid->trace_recorded == 0 && (tid->trace_recorded = 1))
        rt_kprintf("tcb %p lwp 0x%lx name %s\n", tid, tid->lwp, tid->parent.name);

    ssize_t ret = write(fd, event, sizeof(*event));
    if (ret == -1) {
        RT_ASSERT(0);
    }
}

/* tester */
#define WRITE_SIZE ((1ul << 10) / sizeof(rt_ubase_t))

void _app_test(int argc, char **argv)
{
    pid = exec(argv[0], 0, argc - 1, argv + 1);
    struct rt_lwp* lwp = lwp_from_pid(pid);
    rt_thread_t thread = rt_list_entry(lwp->t_grp.prev, struct rt_thread, sibling);
    rt_thread_control(thread, RT_THREAD_CTRL_BIND_CPU, (void *)1);
}

static void _debug_fgraph(int argc, char **argv)
{
    /* init */
    // rt_thread_control(rt_thread_self(), RT_THREAD_CTRL_BIND_CPU, (void *)0);
    trace_evt_ring_t ring;
    ring = event_ring_create(RT_CPUS_NR * (8ul << 20), sizeof(fgraph_event_t), ARCH_PAGE_SIZE);
    event_ring_for_each_buffer_lock(ring, _alloc_buffer, NULL);

    ftrace_tracer_init(&fgraph_app, _test_graph_on_entry, ring);
    ftrace_tracer_set_on_exit(&fgraph_app, _test_graph_on_exit);

    /* set trace point */
    void *notrace[] = {&rt_kmem_pvoff, &rt_page_addr2page, /* &rt_hw_spin_lock, &rt_hw_spin_unlock, */
                       &rt_page_ref_inc, &rt_kmem_v2p, &rt_page_ref_get, &rt_cpu_index,
                       &rt_cpus_lock, &rt_cpus_unlock};
    ftrace_tracer_set_except(&fgraph_app, notrace, sizeof(notrace)/sizeof(notrace[0]));

    /* ftrace enabled */
    ftrace_tracer_register(&fgraph_app);

    /**
     * @brief Start the Tracing
     */
    if (argc > 1)
        _app_test(argc - 1, &argv[1]);

    return ;
}
MSH_CMD_EXPORT_ALIAS(_debug_fgraph, fgraph_test, test ftrace feature);

static void _fgraph_stop(int argc, char **argv)
{
    trace_evt_ring_t ring = fgraph_app.data;
    /* ftrace disabled */
    ftrace_tracer_unregister(&fgraph_app);

    /**
     * @brief Reporting
     */

    LOG_I("==> Summary:");
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
        LOG_I("cpu-%03d count 0x%x/0x%lx drops %ld",
            cpuid,
            event_ring_count(ring, cpuid),
            event_ring_capability_percpu(ring),
            ring->rings[cpuid].drop_events);


    LOG_I("==> Recording to file system:");
    int fds[RT_CPUS_NR];
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
    {
        char buf[32];
        rt_snprintf(buf, sizeof(buf), "/logging-%d.bin", cpuid);
        fds[cpuid] = open(buf, O_WRONLY | O_CREAT, 0);
    }
    event_ring_for_each_event_lock(ring, _report_buf, (void *)fds);
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
    {
        close(fds[cpuid]);
    }

    /**
     * @brief Termination
     */
    event_ring_for_each_buffer_lock(ring, _free_buffer, 0);
    event_ring_delete(ring);
    // rt_thread_control(rt_thread_self(), RT_THREAD_CTRL_BIND_CPU, (void *)RT_CPUS_NR);
    return ;
}
MSH_CMD_EXPORT_ALIAS(_fgraph_stop, fgraph_test_stop, test ftrace feature);
