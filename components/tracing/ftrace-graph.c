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
#include "ftrace-graph.h"
#include "ftrace-function.h"
#include "internal.h"

#include <mmu.h>
#include <page.h>
#include <rtthread.h>

struct _fgraph_private {
    ftrace_evt_ring_t thread_ring;
    ftrace_evt_ring_t func_ring;
    unsigned int override;
};

#define TRACER_GET_THREAD_RING(tracer)  (((struct _fgraph_private *)tracer->data)->thread_ring)
#define TRACER_GET_FUNC_RING(tracer)    (((struct _fgraph_private *)tracer->data)->func_ring)
#define TRACER_GET_OVERRIDE(tracer)     (((struct _fgraph_private *)tracer->data)->override)

static rt_notrace
rt_base_t _graph_on_entry(
    ftrace_tracer_t tracer,
    rt_ubase_t pc,
    rt_ubase_t ret_addr,
    ftrace_context_t context)
{
    rt_err_t rc;
    rt_ubase_t time = ftrace_timestamp();
    rc = ftrace_vice_stack_push_word(context, time);

    return rc;
}

rt_inline rt_notrace
char* _strncpy_notrace(char* dest, const char* src, size_t n) {
    size_t i;
    for (i = 0; i < n && src[i] != '\0'; i++)
    {
        dest[i] = src[i];
    }
    for (; i < n; i++)
    {
        dest[i] = '\0';
    }
    return dest;
}

static rt_notrace
void _graph_on_exit(
    ftrace_tracer_t tracer,
    rt_ubase_t entry_pc,
    ftrace_context_t context)
{
    /* thread event */
    rt_thread_t tcb = rt_thread_self_sync();
    ftrace_host_data_t host_data = tcb->ftrace_host_session;

    /* TODO: handling the enqueue if the session is disable */

    unsigned int expected = 0;
    if (atomic_compare_exchange_strong(&host_data->trace_recorded, &expected, (rt_ubase_t)tracer))
    {
        struct ftrace_thread_evt thread;
        thread.tid = (rt_ubase_t)tcb;

        _strncpy_notrace(thread.name, tcb->parent.name, sizeof(thread.name));

        ftrace_evt_ring_t thread_ring = TRACER_GET_THREAD_RING(tracer);
        event_ring_enqueue(thread_ring, &thread, TRACER_GET_OVERRIDE(tracer));
    }

    /* function event */
    rt_ubase_t entry_time = ftrace_vice_stack_pop_word(context);
    rt_ubase_t exit_time = ftrace_timestamp();
    ftrace_evt_ring_t func_ring = TRACER_GET_FUNC_RING(tracer);
    struct ftrace_graph_evt event = {
        .entry_address = entry_pc,
        .entry_time = entry_time,
        .exit_time = exit_time,
        .tid = (rt_ubase_t)tcb,
    };
    event_ring_enqueue(func_ring, &event, TRACER_GET_OVERRIDE(tracer));
    return ;
}

/* factory */
ftrace_tracer_t ftrace_graph_tracer_create(size_t buffer_size, rt_bool_t override)
{

    ftrace_tracer_t entry_tracer, exit_tracer;
    ftrace_trace_fn_t entry_handler = &_graph_on_entry;
    ftrace_exit_fn_t exit_handler = &_graph_on_exit;
    ftrace_evt_ring_t thread_ring;
    ftrace_evt_ring_t func_ring;
    struct _fgraph_private *private_data;

    func_ring = event_ring_create(
        buffer_size,
        sizeof(struct ftrace_graph_evt),
        ARCH_PAGE_SIZE);

    thread_ring = event_ring_create(
        RT_CPUS_NR * ARCH_PAGE_SIZE * 2,
        sizeof(struct ftrace_thread_evt),
        ARCH_PAGE_SIZE);

    entry_tracer = rt_malloc(2 * sizeof(*entry_tracer));
    exit_tracer = entry_tracer + 1;
    private_data = rt_malloc(sizeof(struct _fgraph_private));

    if (!func_ring || !thread_ring || !entry_tracer || !private_data)
    {
        if (func_ring)
            event_ring_delete(func_ring);
        if (thread_ring)
            event_ring_delete(thread_ring);
        if (entry_tracer)
            rt_free(entry_tracer);
        if (private_data)
            rt_free(private_data);

        entry_tracer = RT_NULL;
    }
    else
    {
        private_data->override = override;
        private_data->func_ring = func_ring;
        private_data->thread_ring = thread_ring;
        ftrace_tracer_init(entry_tracer, TRACER_ENTRY, entry_handler, private_data);
        ftrace_tracer_init(exit_tracer, TRACER_EXIT, exit_handler, private_data);
        event_ring_for_each_buffer_lock(func_ring, ftrace_tracer_alloc_buffer, NULL);
        event_ring_for_each_buffer_lock(thread_ring, ftrace_tracer_alloc_buffer, NULL);
    }

    return entry_tracer;
}

void ftrace_graph_tracer_delete(ftrace_tracer_t tracer)
{
    RT_ASSERT(tracer);
    event_ring_delete(TRACER_GET_THREAD_RING(tracer));
    event_ring_delete(TRACER_GET_FUNC_RING(tracer));

    RT_ASSERT(atomic_load_explicit(&tracer->session->reference, memory_order_acquire) == 0);
    event_ring_for_each_buffer_lock(TRACER_GET_FUNC_RING(tracer), ftrace_tracer_free_buffer, NULL);
    event_ring_for_each_buffer_lock(TRACER_GET_THREAD_RING(tracer), ftrace_tracer_free_buffer, NULL);

    ftrace_tracer_detach(&tracer[0]);
    ftrace_tracer_detach(&tracer[1]);
    rt_free(tracer);
}

ftrace_consumer_session_t ftrace_graph_create_cons_session(ftrace_tracer_t tracer,
                                                           enum ftrace_event_type type,
                                                           size_t cpuid)
{
    ftrace_consumer_session_t session;
    ftrace_evt_ring_t ring;
    void *buffer;

    switch (type)
    {
        case FTRACE_EVENT_THREAD:
            ring = TRACER_GET_THREAD_RING(tracer);
            break;
        case FTRACE_EVENT_FGRAPH:
            ring = TRACER_GET_FUNC_RING(tracer);
            break;
        default:
            ring = RT_NULL;
    }

    if (!ring)
        return RT_NULL;

    session = rt_malloc(sizeof(*session));
    if (session)
    {
        buffer = rt_pages_alloc_ext(0, PAGE_ANY_AVAILABLE);
        if (!buffer)
        {
            rt_free((void *)session);
            session = RT_NULL;
        }
        else
        {
            ftrace_consumer_session_init(session, tracer, ring, buffer, cpuid);
        }
    }
    return session;
}

void ftrace_graph_delete_cons_session(ftrace_tracer_t tracer, ftrace_consumer_session_t session)
{
    RT_ASSERT(session);
    RT_ASSERT(session->buffer);

    ftrace_consumer_session_detach(session);
    rt_pages_free(session->buffer, 0);
    rt_free((void *)session);
}
