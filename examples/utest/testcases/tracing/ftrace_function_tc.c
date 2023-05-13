/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */

#include <ksymtbl.h>
#include <ftrace-function.h>

#include <dfs_file.h>
#include <lwp.h>
#include <mm_aspace.h>
#include <mm_page.h>
#include <mmu.h>
#include <rtthread.h>
#include <rthw.h>
#include <utest.h>

#include <stdatomic.h>

/* APP Runner */
static void _app_test(void)
{
    static pid_t pid;

    char *argv[1] = {"./rv64/stress_mem.elf"};
    pid = exec(argv[0], 0, 1, argv);

    struct rt_lwp* lwp;
    do
    {
        rt_thread_mdelay(1);
        lwp = lwp_from_pid(pid);
    } while (lwp);
}

#define BUFFER_SIZE (16ul << 20)

typedef struct test_session {
    struct ftrace_session session;

    ftrace_tracer_t stopwatch;
    ftrace_tracer_t function_tracer;
} *test_session_t;

static time_t sys_exit_timestamp = 1;

rt_notrace
rt_base_t _exit_stopwatch_handler(struct ftrace_tracer *tracer, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context)
{
    if (FTRACE_PC_TO_SYM(pc) == &sys_exit || pc - 32 == (rt_ubase_t)sys_exit || pc - 48 == (rt_ubase_t)sys_exit)
    {
        sys_exit_timestamp = ftrace_timestamp();
        ftrace_session_set_status(tracer->session, RT_FALSE);
    }

    return 0;
}

static ftrace_tracer_t _get_stopwatch(void)
{
    ftrace_tracer_t exit_stopwatch;

    ftrace_trace_fn_t exit_stopwatch_handler = &_exit_stopwatch_handler;
    exit_stopwatch = ftrace_tracer_create(TRACER_ENTRY, exit_stopwatch_handler, NULL);
    return exit_stopwatch;
}

static ftrace_session_t _get_custom_session(rt_bool_t override)
{
    test_session_t session;
    ftrace_tracer_t function_tracer;

    /* Setup session by ftrace API */

    session = rt_malloc(sizeof(*session));
    uassert_true(!!session);
    ftrace_session_init(&session->session);

    function_tracer = ftrace_function_tracer_create(BUFFER_SIZE, override);
    uassert_true(!!function_tracer);

    ftrace_tracer_t exit_stopwatch;
    exit_stopwatch = _get_stopwatch();

    ftrace_session_bind(&session->session, function_tracer);
    ftrace_session_bind(&session->session, exit_stopwatch);

    session->function_tracer = function_tracer;
    session->stopwatch = exit_stopwatch;
    return &session->session;
}

static void _delete_custom_session(ftrace_session_t session)
{
    test_session_t custom = rt_container_of(session, struct test_session, session);

    ftrace_function_tracer_delete(custom->function_tracer);
    ftrace_tracer_delete(custom->stopwatch);

    ftrace_session_detach(session);
    rt_free(custom);
}

static void _summary_test(ftrace_session_t session)
{
    test_session_t custom = rt_container_of(session, struct test_session, session);
    ftrace_consumer_session_t cons_session;
    cons_session = ftrace_function_create_cons_session(custom->function_tracer);

    size_t drops = ftrace_consumer_session_count_drops(cons_session);
    size_t inbuffer = ftrace_consumer_session_count_event(cons_session);
    LOG_I("Event Summary: drops 0x%lx in-buffer 0x%lx total 0x%lx\n", drops, inbuffer, drops + inbuffer);

    ftrace_function_delete_cons_session(custom->function_tracer, cons_session);
}

static void _debug_ftrace(int argc, char *argv[])
{
    rt_err_t error;
    ftrace_session_t session;
    session = _get_custom_session(argc > 2);

    /* Define the events set */
    error = ftrace_session_set_except(session, RT_NULL, 0);
    uassert_true(error == RT_EOK);

    /* Benchmark */
    ftrace_session_register(session);

    time_t ftrace_latency = ftrace_timestamp();
    _app_test();

    RT_ASSERT(!!sys_exit_timestamp);
    ftrace_latency = sys_exit_timestamp - ftrace_latency;

    ftrace_session_unregister(session);
    _summary_test(session);
    LOG_I("FTrace   0x%lx", ftrace_latency);

    _delete_custom_session(session);

    return ;
}
MSH_CMD_EXPORT_ALIAS(_debug_ftrace, ftrace_function, test ftrace feature);

#if 0
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

// static _Atomic(size_t) count[RT_CPUS_NR * 16];

typedef struct sample_event {
    void *entry_address;
} sample_event_t;

static void _debug_test_fn(char *str, ...)
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

    ftrace_evt_ring_t ring = tracer->data;
    sample_event_t event = {.entry_address = (void *)pc - 4};
    event_ring_enqueue(ring, &event, 0);
    return 0;
}

static void _alloc_buffer(ftrace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    RT_ASSERT(!*pbuffer);
    *pbuffer = rt_pages_alloc_ext(0, PAGE_ANY_AVAILABLE);
    RT_ASSERT(!!*pbuffer);

    /* test on event_ring_event_loc */
    void *preobj = 0;
    for (size_t i = 0; i < ring->objs_per_buf; i++)
    {
        size_t index = i + (pbuffer - (void **)&ring->buftbl[cpuid * ring->bufs_per_ring]) * ring->objs_per_buf;
        void *obj = event_ring_event_loc(ring, index, cpuid);
        RT_ASSERT(obj >= *pbuffer && obj < *pbuffer + 4096);
        RT_ASSERT(!preobj || obj == preobj + 8);
        preobj = obj;
        index += 1;
    }
}

// void (*handler)(ftrace_evt_ring_t ring, size_t cpuid, void *pevent, void *data)
static void _dump_buf(ftrace_evt_ring_t ring, size_t cpuid, void *pevent, void *data)
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

static void _free_buffer(ftrace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    rt_pages_free(*pbuffer, 0);
    return;
}

static void _debug_ftrace(void)
{
    extern void _ftrace_entry_insn(void);
    // RT_ASSERT(!ftrace_arch_patch_code(_ftrace_entry_insn, 0));
    // RT_ASSERT(!ftrace_arch_patch_code(_ftrace_entry_insn, 1));

    /* init */
    ftrace_evt_ring_t ring;
    ring = event_ring_create(RT_CPUS_NR * (4ul << 20), sizeof(sample_event_t), ARCH_PAGE_SIZE);
    event_ring_for_each_buffer_lock(ring, _alloc_buffer, NULL);

    // while (1) {
    /* test gen bl */
    ftrace_tracer_init(&dummy_tracer, _test_handler, ring);

    /* test recursion */
    // ftrace_tracer_set_trace(&dummy_tracer, _debug_test_fn);
    // ftrace_tracer_set_trace(&dummy_tracer, _test_handler);

    /* test every functions */
    void *notrace[] = {&rt_kmem_pvoff, &rt_page_addr2page, /* &rt_hw_spin_lock, &rt_hw_spin_unlock, */
                       &rt_page_ref_inc, &rt_kmem_v2p, &rt_page_ref_get, /* &rt_cpu_index, */
                       /* &rt_cpus_lock, &rt_cpus_unlock */};
    ftrace_tracer_set_except(&dummy_tracer, notrace, sizeof(notrace)/sizeof(notrace[0]));

    /* a dummy instrumentation */
    _debug_test_fn("no tracer\n");

    /* ftrace enabled */
    ftrace_tracer_register(&dummy_tracer);
    rt_kprintf("ftrace enabled\n");
    _debug_test_fn("dummy tracer enable\n", 1, 2, 3, 4, 5, 6, 7);

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
#endif
