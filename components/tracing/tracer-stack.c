/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-05-01     WangXiaoyao  standalone vice stack for tracer
 */

/** TODO make it round back by using index to reference */

#include "rtdef.h"
#define DBG_TAG "tracing.ftrace"
#define DBG_LVL DBG_WARNING
#include <rtdbg.h>

#include "internal.h"

#include <page.h>

rt_notrace
void ftrace_vice_stack_push_word(ftrace_context_t context, rt_base_t word)
{
    rt_thread_t thread;
    thread = rt_thread_self();
    if (thread)
    {
        ftrace_host_data_t data = thread->ftrace_host_session;
        if (data)
        {
            size_t sp = atomic_fetch_add(&data->vice_sp, -1) - 1;
            sp &= data->vice_stack_size - 1;
            data->vice_stack[sp] = word;
        }
        else
        {
            LOG_W("%s: Not data found", __func__);
        }
    }
}

rt_notrace
rt_base_t ftrace_vice_stack_pop_word(ftrace_context_t context)
{
    rt_thread_t thread;
    thread = rt_thread_self();
    rt_base_t word = -1;
    if (thread)
    {
        ftrace_host_data_t data = thread->ftrace_host_session;
        if (data)
        {
            size_t sp = atomic_fetch_add(&data->vice_sp, 1);
            sp &= data->vice_stack_size - 1;
            word = data->vice_stack[sp];
        }
    }
    return word;
}

int ftrace_vice_stack_init(ftrace_host_data_t data)
{
    int err;
    const size_t alloc_size = 0x1000;
    data->vice_stack = rt_pages_alloc_ext(rt_page_bits(alloc_size), PAGE_ANY_AVAILABLE);
    if (data->vice_stack)
    {
        data->vice_stack_size = alloc_size / sizeof(data->vice_stack[0]);
        data->vice_sp = data->vice_stack_size;
        err = 0;
    }
    else
    {
        err = -RT_ENOMEM;
    }
    return err;
}
