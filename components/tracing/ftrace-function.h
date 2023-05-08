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

size_t ftrace_function_cons_event(ftrace_tracer_t tracer, void **buffer);

size_t ftrace_function_evt_count(ftrace_tracer_t tracer);

size_t ftrace_function_drops(ftrace_tracer_t tracer);

#endif /* __TRACE_FTRACE_FUNCTION_H__ */
