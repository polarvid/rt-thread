/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-05-08     WangXiaoyao  provide generic consumer API
 */
#include "ftrace.h"
#include "event-ring.h"
#include "rtdef.h"

/** Consumer Core API */

long ftrace_consumer_session_refresh(ftrace_consumer_session_t session_const, time_t timeout)
{
    ftrace_evt_ring_t ring;

    time_t loop_latency;
    loop_latency = session_const->latency ? session_const->latency : 1;

    struct ftrace_consumer_session *session;
    session = (struct ftrace_consumer_session *)session_const;
    ring = session->ring;

    void *consumed;
    long evt_count;
    time_t waiting_time = 0;
    const long cpuid = session_const->cpuid;

    while (1)
    {
        consumed = event_ring_dequeue_mc(ring, session->buffer, cpuid);
        if (consumed)
        {
            /* successfully consumed */
            session->buffer = consumed;
            evt_count = session->ring->objs_per_buf;
            break;
        }
        else if (session->tracer->session->unregistered)
        {
            /* it's certainly that no more event will enqueue */
            evt_count = ftrace_consumer_session_count_event(session);
            session->buffer = event_ring_switch_buffer_lock(ring, session->buffer, cpuid);
            break;
        }
        else
        {
            /* not found currently, waiting before it's ready */
            rt_err_t retval;
            waiting_time += loop_latency;
            retval = rt_thread_mdelay(loop_latency);
            loop_latency *= 2;

            if (waiting_time > timeout || retval != RT_EOK)
            {
                /* return as failure */
                evt_count = -RT_EBUSY;
                break;
            }
        }
    }

    /* latency is the prediction of next waiting time */
    session->latency = (session->latency + waiting_time) / 2;

    return evt_count;
}

size_t ftrace_consumer_session_count_event(ftrace_consumer_session_t session)
{
    RT_ASSERT(session);
    ftrace_evt_ring_t ring;
    size_t count = 0;

    ring = session->ring;
    for (size_t i = 0; i < RT_CPUS_NR; i++)
        count += event_ring_count(ring, i);

    return count;
}

size_t ftrace_consumer_session_count_drops(ftrace_consumer_session_t session)
{
    RT_ASSERT(session);
    ftrace_evt_ring_t ring;
    size_t count = 0;

    ring = session->ring;
    for (size_t i = 0; i < RT_CPUS_NR; i++)
        count += ring->rings[i].drop_events;

    return count;
}
