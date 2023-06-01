/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-05-12     WangXiaoyao  fgraph functionality test cases
 */

#define DBG_TAG "tracing.ftrace"
#define DBG_LVL DBG_LOG
#include <rtdbg.h>

#include <ftrace-graph.h>
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

#define BUFFER_SIZE (8ul << 20)
#define TEST_CORE   0

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

    ftrace_session_init(&session->session);

    graph_tracer = ftrace_graph_tracer_create(BUFFER_SIZE, override);

    ftrace_session_bind(&session->session, &graph_tracer[0]);
    ftrace_session_bind(&session->session, &graph_tracer[1]);

    session->graph_tracer = graph_tracer;

    session->func_evt = ftrace_graph_create_cons_session(graph_tracer, FTRACE_EVENT_FGRAPH, TEST_CORE);
    session->thread_evt = ftrace_graph_create_cons_session(graph_tracer, FTRACE_EVENT_THREAD, TEST_CORE);
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

static struct rt_semaphore subthread_exit_cnt;

/* consumer thread for reading */
static struct rt_thread thread_consumer_thread;
static struct rt_thread func_consumer_thread;

static void _report_thread_buffer(ftrace_thread_evt_t buffer, size_t size)
{
    char name_buf[sizeof(buffer->name) + 1] = {0};
    static char temp[128];

    /* write to a file */
    int fd;
    snprintf(temp, sizeof(temp), "./func-name-%d.txt", rt_hw_cpu_id());
    fd = open(temp, O_WRONLY | O_CREAT, 0);

    for (size_t i = 0; i < size; i++)
    {
        strncpy(name_buf, buffer[i].name, sizeof(buffer->name));
        name_buf[sizeof(buffer->name)] = '\0';
        sprintf(temp, "%p %s\n", (void *)buffer[i].tid, name_buf);
        write(fd, temp, strlen(temp));
    }
    close(fd);
}

pid_t trace_pid;
ftrace_session_t trace_session;

static void thread_consumer(void *param)
{
    ftrace_consumer_session_t events;
    long consumed;
    events = param;
    consumed = ftrace_consumer_session_refresh(events, 10000);
    _report_thread_buffer(events->buffer, consumed);
    LOG_I("Summary: session %p (cpu-%d) recorded 0x%lx activity thread", events->ring, events->cpuid, consumed);

    rt_sem_release(&subthread_exit_cnt);
    return ;
}

static void _report_func_buffer(int fd, ftrace_graph_evt_t buffer, size_t size)
{
    // LOG_D("%s: consume buffer", __func__);
    for (size_t i = 0; i < size; i++)
        write(fd, &buffer[i], sizeof(*buffer));
}

static void func_consumer(void *param)
{
    ftrace_consumer_session_t events;
    long total_consumed = 0;
    long consumed;
    events = param;

    /* open file */
    char buf[32];
    int fd;
    snprintf(buf, sizeof(buf), "./logging-%d.bin", rt_hw_cpu_id());
    fd = open(buf, O_WRONLY | O_CREAT, 0);

    /* keep dumping data */
    do {
        consumed = ftrace_consumer_session_refresh(events, 10000);
        if (consumed < 0)
            RT_ASSERT(0);
        _report_func_buffer(fd, events->buffer, consumed);
        // rt_kprintf("Remains/Consumed: %ld/%ld\n", ftrace_consumer_session_count_event(events), consumed);
        total_consumed += consumed;
    } while (consumed == events->ring->objs_per_buf);
    close(fd);

    LOG_I("Summary: cpu %d recorded 0x%lx events", events->cpuid, total_consumed);
    rt_sem_release(&subthread_exit_cnt);
    return ;
}

void _fgraph_stop(void)
{
    ftrace_session_unregister(trace_session);
}

static void _app_test(int argc, char **argv)
{
    LOG_I("Execution Start");
    trace_pid = exec(argv[0], 0, argc - 1, argv + 1);
    if (trace_pid <= 0)
    {
        LOG_W("Execution Error: APP running failed");
        _fgraph_stop();
    }
}

static void _tester(ftrace_session_t session, int argc, char **argv)
{
    test_session_t custom = rt_container_of(session, struct test_session, session);
    const size_t stack_size = 0x2000;
    void *thread_stk, *func_stk;

    /* environment setup */
    rt_sem_init(&subthread_exit_cnt, "subthread_exit_cnt", 0, RT_IPC_FLAG_FIFO);

    /* --> function-consumer thread startup */
    func_stk = rt_pages_alloc_ext(rt_page_bits(stack_size), PAGE_ANY_AVAILABLE);
    rt_thread_init(&func_consumer_thread,
                            "fgc_func",
                            &func_consumer,
                            (void *)custom->func_evt,
                            func_stk,
                            stack_size,
                            30,
                            100);
    rt_thread_startup(&func_consumer_thread);

    /* --> thread-consumer thread startup */
    thread_stk = rt_pages_alloc_ext(rt_page_bits(stack_size), PAGE_ANY_AVAILABLE);
    rt_thread_init(&thread_consumer_thread,
                            "fgc_thread",
                            &thread_consumer,
                            (void *)custom->thread_evt,
                            thread_stk,
                            stack_size,
                            30,
                            100);
    rt_thread_startup(&thread_consumer_thread);

    /* Testing */
    ftrace_session_register(session);
    if (argc > 1)
        _app_test(argc - 1, &argv[1]);

    /* --> wait for sub-thread exit */
    rt_sem_take(&subthread_exit_cnt, RT_WAITING_FOREVER);
    rt_sem_take(&subthread_exit_cnt, RT_WAITING_FOREVER);

    ftrace_session_unregister(session);
    LOG_I("unregistered");

    /* environment cleanup */
    rt_sem_detach(&subthread_exit_cnt);
}


static void _debug_ftrace(int argc, char *argv[])
{
    rt_thread_control(rt_thread_self(), RT_THREAD_CTRL_BIND_CPU, (void *)TEST_CORE);

    /**
     * @brief The following API are considered:
     * ftrace_tracer_t ftrace_graph_tracer_create(size_t buffer_size, rt_bool_t override);
     * void ftrace_graph_tracer_delete(ftrace_tracer_t tracer);
     */
    ftrace_session_t session;
    session = _get_custom_session(0);
    trace_session = session;

    /* Define the events set */
    // void *notrace[] = {&rt_schedule};
    // size_t notrace_cnt = sizeof(notrace)/sizeof(notrace[0]);
    // ftrace_session_set_except(session, notrace, notrace_cnt);
    ftrace_session_set_except(session, 0, 0);

    _tester(session, argc, argv);

    _delete_custom_session(session);

    return ;
}
MSH_CMD_EXPORT_ALIAS(_debug_ftrace, fgraph, test ftrace feature);
