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

static struct ftrace_tracer app_tracer;

typedef struct sample_event {
    void *entry_address;
    rt_uint64_t entry_time;
    rt_uint64_t exit_time;
    void *tid;
} fgraph_event_t;

typedef struct thread_event {
    void *tid;
    char name[sizeof(void *)];
} thread_event_t;

typedef struct fgraph_session {
    trace_evt_ring_t function;
    trace_evt_ring_t thread;
} *fgraph_session_t;

static pid_t pid;

static rt_notrace
rt_ubase_t _test_graph_on_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    rt_ubase_t retval;

    /* maybe disable tracer on lwp_free & compare pid */
    if ((char *)&sys_exit == (char *)FTRACE_PC_TO_SYM(pc) ||
        (char *)&lwp_free == (char *)FTRACE_PC_TO_SYM(pc))
    {
        ftrace_tracer_set_status(tracer, RT_FALSE);
        /* not to trace exit */
        LOG_I("tracing stop");
        retval = 0;
    }
    else if (pc >= 0xffff0000000ed158 && pc <= 0xffff0000000ed81c)
    {
        retval = 0;
    }
    else
    {
        rt_ubase_t time = ftrace_timestamp();
        time = time ? time : 1;
        retval = time;

        rt_thread_t tid = rt_thread_self();
        char expected = 0;
        if (atomic_compare_exchange_strong(&tid->trace_recorded, &expected, 1))
        {
            thread_event_t thread;
            thread.tid = tid;

            /* This maybe unsafe, but it's ok on current implementation */
            rt_ubase_t *src = (rt_ubase_t *)&tid->parent.name;
            rt_ubase_t *dst = (rt_ubase_t *)&thread.name;
            for (size_t i = 0; i < (sizeof(thread.name) / sizeof(rt_ubase_t)); i++)
                *dst++ = *src++;

            trace_evt_ring_t thread_ring = ((fgraph_session_t)tracer->data)->thread;
            event_ring_enqueue(thread_ring, &thread, 0);
        }
    }

    return retval;
}

static rt_notrace
void _test_graph_on_exit(ftrace_tracer_t tracer, rt_ubase_t entry_pc, rt_ubase_t stat, void *context)
{
    rt_ubase_t entry_time = stat;
    rt_ubase_t exit_time = ftrace_timestamp();
    trace_evt_ring_t func_ring = ((fgraph_session_t)tracer->data)->function;

    fgraph_event_t event = {
        .entry_address = (void *)FTRACE_PC_TO_SYM(entry_pc),
        .entry_time = entry_time,
        .exit_time = exit_time,
        /* use ftrace id instead */
        .tid = rt_thread_self(),
    };
    event_ring_enqueue(func_ring, &event, 0);
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

static void _report_functions(trace_evt_ring_t ring, size_t cpuid, void *pevent, void *data)
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
    ssize_t ret = write(fd, event, sizeof(*event));
    if (ret == -1) {
        RT_ASSERT(0);
    }
}

static void _report_threads(trace_evt_ring_t ring, size_t cpuid, void *pevent, void *data)
{
    thread_event_t *event = pevent;
    char *name = event->name;
    int count = sizeof(event->name);

    rt_kprintf("TID: %p Name: ", event->tid);
    while (*name && count--)
    {
        rt_kprintf("%c", *name++);
    }
    rt_kputs("\n");
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
    fgraph_session_t session;
    session = rt_malloc(sizeof(*session));
    RT_ASSERT(session);

    session->function = event_ring_create(RT_CPUS_NR * (8ul << 20), sizeof(fgraph_event_t), ARCH_PAGE_SIZE);
    event_ring_for_each_buffer_lock(session->function, _alloc_buffer, NULL);
    session->thread = event_ring_create(RT_CPUS_NR * ARCH_PAGE_SIZE, sizeof(thread_event_t), ARCH_PAGE_SIZE);
    event_ring_for_each_buffer_lock(session->thread, _alloc_buffer, NULL);

    ftrace_tracer_init(&app_tracer, _test_graph_on_entry, session);
    ftrace_tracer_set_on_exit(&app_tracer, _test_graph_on_exit);

    /* set trace point */
    void *notrace[] = {&rt_kmem_pvoff, &rt_page_addr2page, &rt_hw_spin_lock, &rt_hw_spin_unlock,
                       &rt_page_ref_inc, &rt_kmem_v2p, &rt_page_ref_get, &rt_cpu_index,
                       &rt_cpus_lock, &rt_cpus_unlock};
    ftrace_tracer_set_except(&app_tracer, notrace, sizeof(notrace)/sizeof(notrace[0]));

    /* ftrace enabled */
    ftrace_tracer_register(&app_tracer);

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
    fgraph_session_t session = app_tracer.data;
    /* ftrace disabled */
    ftrace_tracer_unregister(&app_tracer);
    /* sync data */
    atomic_thread_fence(memory_order_acquire);

    /**
     * @brief Reporting
     */
    LOG_I("==> Summary:");
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
        LOG_I("cpu-%03d count 0x%x/0x%lx drops %ld",
            cpuid,
            event_ring_count(session->function, cpuid),
            event_ring_capability_percpu(session->function),
            session->function->rings[cpuid].drop_events);


    LOG_I("==> Recording to file system:");
    int fds[RT_CPUS_NR];
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
    {
        char buf[32];
        rt_snprintf(buf, sizeof(buf), "/logging-%d.bin", cpuid);
        fds[cpuid] = open(buf, O_WRONLY | O_CREAT, 0);
    }
    event_ring_for_each_event_lock(session->function, _report_functions, (void *)fds);
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
    {
        close(fds[cpuid]);
    }

    LOG_I("==> Active threads:");
    event_ring_for_each_event_lock(session->thread, _report_threads, NULL);

    /**
     * @brief Termination
     */
    event_ring_for_each_buffer_lock(session->function, _free_buffer, 0);
    event_ring_delete(session->function);
    event_ring_for_each_buffer_lock(session->thread, _free_buffer, 0);
    event_ring_delete(session->thread);

    rt_free(session);

    return ;
}
MSH_CMD_EXPORT_ALIAS(_fgraph_stop, fgraph_test_stop, test ftrace feature);
