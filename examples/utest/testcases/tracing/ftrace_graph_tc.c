/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-05-12     WangXiaoyao  fgraph functionality test cases
 */

#include "ftrace-graph.h"
#include "ftrace.h"
#include "rtdef.h"
#include "utest_assert.h"
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
 * @brief Test case for function graph tracer API
 * Requirement:
 * Event generation and gathering should work properly
 *
 * Test by hooking a function, and call it multiple times to get fake data
 */

/* APP Runner */

#define BUFFER_SIZE (16ul << 20)

/**
 * @brief Test Session Create and Delete
 */

typedef struct test_session {
    struct ftrace_session session;

    ftrace_tracer_t graph_tracer;
    ftrace_consumer_session_t thread_evt;
    ftrace_consumer_session_t func_evt;
} *test_session_t;

static ftrace_session_t _get_custom_session(rt_bool_t override)
{
    test_session_t session;
    ftrace_tracer_t graph_tracer;

    /* Setup session by ftrace API */

    session = rt_malloc(sizeof(*session));
    uassert_true(!!session);

    ftrace_session_init(&session->session);
    uassert_true(session->session.enabled == 0);
    uassert_true(session->session.trace_point_cnt == 0);
    uassert_true(session->session.unregistered == 0);

    graph_tracer = ftrace_graph_tracer_create(BUFFER_SIZE, override);
    uassert_true(!!graph_tracer);
    uassert_true(graph_tracer[0].data != RT_NULL);
    uassert_true(graph_tracer[1].data != RT_NULL);
    uassert_true(graph_tracer[0].type == TRACER_ENTRY);
    uassert_true(graph_tracer[1].type == TRACER_EXIT);

    ftrace_session_bind(&session->session, &graph_tracer[0]);
    ftrace_session_bind(&session->session, &graph_tracer[1]);
    uassert_true(graph_tracer[0].session == &session->session);
    uassert_true(graph_tracer[1].session == &session->session);

    session->graph_tracer = graph_tracer;

    session->func_evt = ftrace_graph_create_cons_session(graph_tracer, FTRACE_EVENT_FUNCTION_GRAPH);
    uassert_true(!!session->func_evt);
    session->thread_evt = ftrace_graph_create_cons_session(graph_tracer, FTRACE_EVENT_FUNCTION_GRAPH);
    uassert_true(!!session->thread_evt);

    return &session->session;
}

static void _delete_custom_session(ftrace_session_t session)
{
    test_session_t custom = rt_container_of(session, struct test_session, session);

    ftrace_graph_delete_cons_session(custom->graph_tracer, custom->func_evt);
    ftrace_graph_delete_cons_session(custom->graph_tracer, custom->thread_evt);

    ftrace_graph_tracer_delete(custom->graph_tracer);

    ftrace_session_detach(session);
    rt_free(custom);
}

/** the function being traced */
rt_optimize(0)
static void _testee(void)
{
    return ;
}

const static size_t testtimes = 0x100000;

static void _tester(void)
{
    for (size_t i = 0; i < testtimes; i++)
    {
        _testee();
        if (!(i % (testtimes/10)))
            LOG_I("in progress: %ld/%ld", i, testtimes);
    }
}

static void _summary_test(ftrace_session_t session)
{
    size_t drops;
    size_t inbuffer;
    size_t total;
    test_session_t custom = rt_container_of(session, struct test_session, session);
    LOG_I("Event Summary: ");

    drops = ftrace_consumer_session_count_drops(custom->func_evt);
    inbuffer = ftrace_consumer_session_count_event(custom->func_evt);
    total = drops + inbuffer;
    uassert_true(total == testtimes);
    LOG_I("  Function: drops 0x%lx in-buffer 0x%lx total 0x%lx", drops, inbuffer, drops + inbuffer);

    drops = ftrace_consumer_session_count_drops(custom->thread_evt);
    inbuffer = ftrace_consumer_session_count_event(custom->thread_evt);
    uassert_true(total == testtimes);
    LOG_I("  Thread: drops 0x%lx in-buffer 0x%lx total 0x%lx", drops, inbuffer, drops + inbuffer);
}

static void _test_api()
{
    rt_err_t error;

    /**
     * @brief The following API are considered:
     * ftrace_tracer_t ftrace_graph_tracer_create(size_t buffer_size, rt_bool_t override);
     * void ftrace_graph_tracer_delete(ftrace_tracer_t tracer);
     */
    ftrace_session_t session;
    session = _get_custom_session(0);

    /* Define the events set */
    error = ftrace_session_set_trace(session, &_testee);
    uassert_true(error == RT_EOK);
    uassert_true(session->trace_point_cnt == 1);

    /* Test function tracer */
    ftrace_session_register(session);
    _tester();
    ftrace_session_unregister(session);

    /* Summary */
    _summary_test(session);
    _delete_custom_session(session);

    return ;
}

static rt_err_t utest_tc_init(void)
{
    return RT_EOK;
}

static rt_err_t utest_tc_cleanup(void)
{
    return RT_EOK;
}

static void testcase(void)
{
    UTEST_UNIT_RUN(_test_api);
}
UTEST_TC_EXPORT(testcase, "testcases.tracing.ftrace.graph", utest_tc_init, utest_tc_cleanup, 20);
