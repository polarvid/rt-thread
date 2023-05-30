/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-05-01     WangXiaoyao  standalone vice stack for tracer
 */

#define DBG_TAG "tracing.ftrace"
#define DBG_LVL DBG_WARNING
#include <rtdbg.h>

#include "internal.h"

#include <page.h>

/* TODO: Handle the case of stack overflow by applying the technique of hight detection */
/**
 * This is error prone and should be taken care of.
 * Interruptable, and only processed parallel on interrupt
 */

rt_notrace
rt_err_t ftrace_vice_stack_push_word(ftrace_context_t context, rt_base_t word)
{
    size_t sp;
    int success;
    rt_err_t rc;
    rt_thread_t thread;

    thread = rt_thread_self_sync();
    if (thread)
    {
        ftrace_host_data_t data = thread->ftrace_host_session;
        if (data)
        {
            do
            {
                size_t old_sp = atomic_load(&data->vice_sp);
                sp = old_sp - 1;
                if (sp >= 0)
                    success = atomic_compare_exchange_weak(&data->vice_sp, &old_sp, sp);
                else
                    break;
            } while (!success);

            if (success)
            {
                sp &= data->vice_stack_size - 1;
                data->vice_stack[sp] = word;
                rc = RT_EOK;
            }
            else
                rc = -RT_ENOSPC;
        }
        else
        {
            rc = -RT_ENOENT;
        }
    }

    return rc;
}

rt_notrace
rt_base_t ftrace_vice_stack_pop_word(ftrace_context_t context)
{
    size_t sp;
    rt_thread_t thread;
    ftrace_host_data_t data;
    rt_base_t word;

    thread = rt_thread_self_sync();
    if (thread)
    {
        data = thread->ftrace_host_session;
        if (data)
        {
            sp = atomic_fetch_add(&data->vice_sp, 1);

            /* debug */
            if (sp >= data->vice_stack_size)
                while (1) ;
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
