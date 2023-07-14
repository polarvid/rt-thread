/*
 * Copyright (c) 2006-2022, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-17     WangXiaoyao  the first version
 */

#ifndef __MAP_TRACER_H__
#define __MAP_TRACER_H__

#include <stddef.h>
#include <mm_aspace.h>

typedef struct lock_trace_entry {
    rt_uint32_t current_nest;
    rt_uint32_t is_lock:1;
    rt_uint32_t tid:31;
    void *backtrace[15];
} *lock_trace_entry_t;

void lock_tracer_init(void);
void lock_tracer_start(rt_thread_t thread);
void lock_tracer_add(rt_thread_t thread, rt_bool_t is_lock);
void lock_tracer_stop(rt_thread_t thread);
void lock_trace_dump(rt_thread_t thread);

#endif /* __MAP_TRACER_H__ */
