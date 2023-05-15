/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-15     WangXiaoyao  fgraph support
 */
#ifndef __TRACE_FTRACE_GRAPH_H__
#define __TRACE_FTRACE_GRAPH_H__

#include "ftrace.h"

#include <rtthread.h>

typedef struct ftrace_graph_evt {
    /* millisecond timestamp */
    rt_ubase_t entry_address;
    time_t entry_time;
    time_t exit_time;
    rt_ubase_t tid;
} *ftrace_graph_evt_t;

typedef struct ftrace_thread_evt {
    rt_ubase_t tid;
    char name[sizeof(void *)];
} *ftrace_thread_evt_t;

/**
 * @brief Create a pair of FGraph tracers
 * 
 * @param buffer_size size of buffer in total (sum of all cpus)
 * @return ftrace_tracer_t the head address of the tracers pairs as [entry, exit]
 */
ftrace_tracer_t ftrace_graph_tracer_create(size_t buffer_size, rt_bool_t override);
void ftrace_graph_tracer_delete(ftrace_tracer_t tracer);

ftrace_consumer_session_t ftrace_graph_create_cons_session(ftrace_tracer_t tracer,
                                                           enum ftrace_event_type type,
                                                           size_t cpuid);

void ftrace_graph_delete_cons_session(ftrace_tracer_t tracer, ftrace_consumer_session_t session);

#endif /* __TRACE_FTRACE_GRAPH_H__ */
