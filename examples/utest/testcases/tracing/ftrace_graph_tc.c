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
 * Besides this will calculating the average latency of the fgraph tracer
 */

/* APP Runner */

#define BUFFER_SIZE (16ul << 20)
#define TEST_CORE   0

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

    session->func_evt = ftrace_graph_create_cons_session(graph_tracer, FTRACE_EVENT_FGRAPH, TEST_CORE);
    uassert_true(!!session->func_evt);
    session->thread_evt = ftrace_graph_create_cons_session(graph_tracer, FTRACE_EVENT_THREAD, TEST_CORE);
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
static struct rt_semaphore subthread_exit_cnt;

/* consumer thread for reading */
static struct rt_thread thread_consumer_thread;
static struct rt_thread func_consumer_thread;

static void _thread_consumer(void *param)
{
    ftrace_consumer_session_t events;
    long consumed;
    events = param;
    consumed = ftrace_consumer_session_refresh(events, 10000);
    uassert_true(consumed > 0);

    LOG_I("consumed %ld: thread %s, tid %p", consumed,
        ((ftrace_thread_evt_t)events->buffer)->name,
        ((ftrace_thread_evt_t)events->buffer)->tid);
    rt_sem_release(&subthread_exit_cnt);
    return ;
}

static void thread_consumer(void *param)
{
    ftrace_consumer_session_t events;
    long consumed;
    events = param;
    consumed = ftrace_consumer_session_refresh(events, 10000);
    uassert_true(consumed > 0);

    LOG_I("consumed %ld: thread %s, tid %p", consumed,
        ((ftrace_thread_evt_t)events->buffer)->name,
        ((ftrace_thread_evt_t)events->buffer)->tid);
    rt_sem_release(&subthread_exit_cnt);
    return ;
}

static void func_consumer(void *param)
{
    ftrace_consumer_session_t events;
    long total_consumed = 0;
    long consumed;
    events = param;

    do {
        consumed = ftrace_consumer_session_refresh(events, 10000);
        if (consumed < 0)
            uassert_true(0);
        total_consumed += consumed;
    } while (consumed == events->ring->objs_per_buf);

    uassert_true(total_consumed == testtimes);
    LOG_I("Dumping part of events: (%p, %p, 0x%lx, 0x%lx)",
        ((ftrace_graph_evt_t)events->buffer)->entry_address,
        ((ftrace_graph_evt_t)events->buffer)->tid,
        ((ftrace_graph_evt_t)events->buffer)->entry_time,
        ((ftrace_graph_evt_t)events->buffer)->exit_time);

    rt_sem_release(&subthread_exit_cnt);
    return ;
}

static void _tester(ftrace_session_t session)
{
    test_session_t custom = rt_container_of(session, struct test_session, session);
    const size_t stack_size = 0x2000;
    rt_err_t retval;
    void *thread_stk, *func_stk;

    /* environment setup */
    retval = rt_sem_init(&subthread_exit_cnt, "subthread_exit_cnt", 0, RT_IPC_FLAG_FIFO);
    uassert_true(retval == RT_EOK);
    /* --> thread-consumer thread startup */
    thread_stk = rt_pages_alloc_ext(rt_page_bits(stack_size), PAGE_ANY_AVAILABLE);
    uassert_true(!!thread_stk);
    retval = rt_thread_init(&thread_consumer_thread,
                            "fgraph_thread_consumer",
                            &thread_consumer,
                            (void *)custom->thread_evt,
                            thread_stk,
                            stack_size,
                            20,
                            100);
    uassert_true(retval == RT_EOK);
    retval = rt_thread_startup(&thread_consumer_thread);
    uassert_true(retval == RT_EOK);
    /* --> function-consumer thread startup */
    func_stk = rt_pages_alloc_ext(rt_page_bits(stack_size), PAGE_ANY_AVAILABLE);
    uassert_true(!!func_stk);
    retval = rt_thread_init(&func_consumer_thread,
                            "fgraph_func_consumer",
                            &func_consumer,
                            (void *)custom->func_evt,
                            func_stk,
                            stack_size,
                            20,
                            100);
    uassert_true(retval == RT_EOK);
    retval = rt_thread_startup(&func_consumer_thread);
    uassert_true(retval == RT_EOK);

    /* Testing */
    ftrace_session_register(session);
    for (size_t i = 0; i < testtimes; i++)
    {
        _testee();
        if (!(i % (testtimes/10)))
            LOG_I("processing: %ld/%ld", i, testtimes);
    }
    ftrace_session_unregister(session);

    /* environment cleanup */
    /* --> wait for sub-thread exit */
    retval = rt_sem_take(&subthread_exit_cnt, RT_WAITING_FOREVER);
    uassert_true(retval == RT_EOK);
    retval = rt_sem_take(&subthread_exit_cnt, RT_WAITING_FOREVER);
    uassert_true(retval == RT_EOK);

    retval = rt_thread_detach(&thread_consumer_thread);
    uassert_true(retval == RT_EOK);
    retval = rt_thread_detach(&func_consumer_thread);
    uassert_true(retval == RT_EOK);
    retval = rt_sem_detach(&subthread_exit_cnt);
    uassert_true(retval == RT_EOK);
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
    uassert_true(total < custom->func_evt->ring->objs_per_buf);
    LOG_I("  Function: drops 0x%lx in-buffer 0x%lx total 0x%lx", drops, inbuffer, drops + inbuffer);

    drops = ftrace_consumer_session_count_drops(custom->thread_evt);
    inbuffer = ftrace_consumer_session_count_event(custom->thread_evt);
    total = drops + inbuffer;
    uassert_true(total == 1);
    LOG_I("  Thread: drops 0x%lx in-buffer 0x%lx total 0x%lx", drops, inbuffer, drops + inbuffer);
}

static void _test_api()
{
    rt_err_t error;
    error = rt_thread_control(rt_thread_self(), RT_THREAD_CTRL_BIND_CPU, (void *)TEST_CORE);
    uassert_true(!error);

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
    _tester(session);

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
