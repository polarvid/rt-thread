/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#ifndef __TRACE_FTRACE_H__
#define __TRACE_FTRACE_H__

#ifdef ARCH_ARMV8
#include "arch/aarch64.h"
#endif

#include <rtthread.h>

#define rt_notrace __attribute__((no_instrument_function))

typedef int (*ftrace_trace_fn_t)(void *tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context);

/* user should not access this structure directly */
typedef struct ftrace_tracer {
    /* management of tracer */
    rt_list_t node;

    /* handler of tracer */
    ftrace_trace_fn_t handler;

    /* custom private data */
    void *data;

    /* number of trace points this tracer handle */
    size_t trace_point_cnt;

    /* control bits, default as 0 */
    unsigned int skip_recursion:1;
    unsigned int enabled:1;
    unsigned int unregistered:1;
} *ftrace_tracer_t;

int ftrace_trace_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context);

void ftrace_tracer_init(ftrace_tracer_t tracer, ftrace_trace_fn_t handler, void *data);

rt_inline void ftrace_tracer_ctrl_skip_recursion(ftrace_tracer_t tracer, rt_bool_t enabled)
{
    tracer->skip_recursion = enabled;
}

rt_inline void *ftrace_tracer_get_data(ftrace_tracer_t tracer)
{
    return tracer->data;
}

rt_inline void ftrace_tracer_set_data(ftrace_tracer_t tracer, void *data)
{
    tracer->data = data;
}

int ftrace_tracer_register(ftrace_tracer_t tracer);

int ftrace_tracer_unregister(ftrace_tracer_t tracer);

int ftrace_tracer_set_trace(ftrace_tracer_t tracer, void *fn);

int ftrace_tracer_set_except(ftrace_tracer_t tracer, void *notrace[], size_t notrace_cnt);

#endif /* __TRACE_FTRACE_H__ */
