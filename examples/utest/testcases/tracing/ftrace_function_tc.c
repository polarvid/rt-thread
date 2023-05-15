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

/**
 * @brief Benchmark test case for function tracer
 */

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
    cons_session = ftrace_function_create_cons_session(custom->function_tracer, 0);

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
