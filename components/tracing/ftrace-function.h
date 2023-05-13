/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#ifndef __TRACE_FTRACE_FUNCTION_H__
#define __TRACE_FTRACE_FUNCTION_H__

#include "ftrace.h"
#include "event-ring.h"

#include <rtthread.h>

typedef struct ftrace_function_evt {
    /* millisecond timestamp */
    time_t timestamp;
    rt_thread_t tcb;
    rt_ubase_t entry_address;
    rt_ubase_t from_pc;
} *ftrace_function_evt_t;

ftrace_tracer_t ftrace_function_tracer_create(size_t buffer_size, rt_bool_t override);

void ftrace_function_tracer_delete(ftrace_tracer_t tracer);

void ftrace_function_alloc_buffer(ftrace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data);

ftrace_consumer_session_t ftrace_function_create_cons_session(ftrace_tracer_t tracer);

void ftrace_function_delete_cons_session(ftrace_tracer_t tracer, ftrace_consumer_session_t session);

#endif /* __TRACE_FTRACE_FUNCTION_H__ */
