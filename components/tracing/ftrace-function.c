/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-30     WangXiaoyao  ftrace function tracer
 */

#include "event-ring.h"
#include "ftrace.h"
#include "ftrace-function.h"
#include "internal.h"

#include <mmu.h>
#include <page.h>
#include <rtthread.h>

#define TRACER_GET_RING(tracer)         ((void *)((size_t)(tracer)->data & ~0x1))
#define TRACER_GET_OVERRIDE(tracer)     (((size_t)(tracer)->data & 0x1))
#define TRACER_SET_OVERRIDE(data)       ((void *)((size_t)data | (override)))

/* ftrace function is the tracer implement of entry interface */
static rt_notrace
rt_base_t _ftrace_function_handler(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context)
{
    rt_thread_t tcb = rt_thread_self();

    time_t timestamp = ftrace_timestamp();
    ftrace_evt_ring_t ring = TRACER_GET_RING(tracer);

    struct ftrace_function_evt event = {
        .entry_address = pc - 4,
        .from_pc = ret_addr,
        .tcb = tcb,
        .timestamp = timestamp
    };

    // unsigned int *stacked_trace = &((ftrace_host_data_t)tcb->ftrace_host_session)->stacked_trace;
    // if (*stacked_trace)
    //     return -1;
    // else
    //     *stacked_trace += 1;
    event_ring_enqueue(ring, &event, TRACER_GET_OVERRIDE(tracer));
    // *stacked_trace -= 1;
    return 0;
}

void ftrace_function_alloc_buffer(ftrace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    *pbuffer = rt_pages_alloc_ext(0, PAGE_ANY_AVAILABLE);
    RT_ASSERT(!!*pbuffer);  /* TODO handling */
}

/* factory */
ftrace_tracer_t ftrace_function_tracer_create(size_t buffer_size, rt_bool_t override)
{
    ftrace_tracer_t tracer;
    ftrace_trace_fn_t handler = &_ftrace_function_handler;
    ftrace_evt_ring_t ring;

    ring = event_ring_create(buffer_size, sizeof(struct ftrace_function_evt), ARCH_PAGE_SIZE);
    tracer = rt_malloc(sizeof(*tracer));

    if (!ring || !tracer)
    {
        if (ring)
            event_ring_delete(ring);
        if (tracer)
            rt_free(tracer);

        tracer = RT_NULL;
    }
    else
    {
        ftrace_tracer_init(tracer, TRACER_ENTRY, handler, TRACER_SET_OVERRIDE(ring));
        event_ring_for_each_buffer_lock(ring, ftrace_function_alloc_buffer, NULL);
    }

    return tracer;
}

void ftrace_function_tracer_delete(ftrace_tracer_t tracer)
{
    RT_ASSERT(tracer);
    event_ring_delete(TRACER_GET_RING(tracer));
    ftrace_tracer_detach(tracer);
    rt_free(tracer);
}

ftrace_consumer_session_t ftrace_function_create_cons_session(ftrace_tracer_t tracer)
{
    ftrace_consumer_session_t session;
    ftrace_evt_ring_t ring;
    void *buffer;
    ring = TRACER_GET_RING(tracer);

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
            ftrace_consumer_session_init(session, tracer, ring, buffer);
        }
    }
    return session;
}

void ftrace_function_delete_cons_session(ftrace_tracer_t tracer, ftrace_consumer_session_t session)
{
    RT_ASSERT(session);
    RT_ASSERT(session->buffer);

    ftrace_consumer_session_detach(session);
    rt_pages_free(session->buffer, 0);
    rt_free((void *)session);
}
