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

#include "ksymtbl.h"
#include "internal.h"

#include <page.h>

#define PANIC(str)                                                  \
{                                                                   \
    _ftrace_global_disable = 1;                                     \
    rt_hw_local_irq_disable();                                      \
    LOG_E("(%s:%d %s)\n\t%s", __FILE__, __LINE__, __func__, str);   \
    while (1);                                                      \
}

/* TODO: Handle the case of stack overflow by applying the technique of hight detection */
/**
 * This is error prone and should be taken care of.
 * Interruptable, and only processed parallel on interrupt
 */

/**
 * @brief Reset the vice stack by dropping the outer most frame
 * and reseting the vsp/vfp
 * 
 * @param data 
 * @return rt_inline 
 */
rt_inline rt_notrace
void _drop_frame(ftrace_host_data_t data)
{
    rt_ubase_t prev_vfp;

    prev_vfp = data->vice_stack[data->vice_fp + 1];
    if (prev_vfp)
    {
        data->vice_sp = prev_vfp;
    }
    else
    {
        data->vice_sp = data->vice_stack_size;
    }
    data->vice_fp = prev_vfp;
}

/* verify the stack by pairing the ret_addr with the pc in the last frame */
rt_notrace
rt_err_t ftrace_vice_stack_verify(ftrace_host_data_t data, ftrace_context_t context)
{
    rt_err_t rc = -RT_ERROR;
    rt_ubase_t prev_sp;

    while (rc != RT_EOK)
    {
        if (data->vice_fp)
        {
            prev_sp = data->vice_stack[data->vice_fp];
            /**
             * sp in current context must at least equal or lower than previous one
             * Noted that it's acceptable in some ABI to avoid maintaining call frames,
             * hence the sp can be identical to previous one. 
             */
            if (prev_sp < context->args[FTRACE_REG_SP])
            {
                rt_ubase_t vsp;
                vsp = atomic_load(&data->vice_sp);

                /**
                 * debug：
                 * The corruption is generated from the what?
                 * -> the one operating on it!
                 */
                if (vsp != data->vice_fp)
                    PANIC("VSP corrupted");
                if (vsp + 2 > data->vice_stack_size)
                    PANIC("VSP overflow");

                /* rewind */
                _drop_frame(data);
            }
            else
            {
                rc = RT_EOK;
            }
        }
        else
        {
            rc = RT_EOK;
        }
    }
    return rc;
}

rt_notrace
rt_err_t ftrace_vice_stack_push(ftrace_host_data_t data, ftrace_context_t context, rt_ubase_t *words, size_t num_words)
{
    size_t push_counter = 0;
    for (int i = 0; i < num_words; i++)
    {
        if (ftrace_vice_stack_push_word(data, context, words[i]) != 0)
        {
            for (int j = 0; j < push_counter; j++)
            {
                ftrace_vice_stack_pop_word(data, context);
            }
            return -RT_ERROR;
        }
        push_counter++;
    }

    return RT_EOK;
}

/**
 * Vice stack image in the entry of exit tracer:
 *
 *       HIGH
 *   +-----------+
 *   |  VICE FP  |
 *   +-----------+
 *   |    SP     |
 *   +-----------+ <------+
 *   |           |        |
 *   |           |        |
 *   |  CONTEXT  |        |
 *   |           |        |
 *   |           |        |
 *   +-----------+        |
 *   |  VICE FP -+--------+
 *   +-----------+
 *   |    SP     |
 *   +-----------+ <-------+ vice_sp/vice_fp
 *       LOW
 *
 */
rt_notrace
rt_err_t ftrace_vice_stack_push_frame(ftrace_host_data_t data, rt_ubase_t trace_sp)
{
    long vsp;
    int success;
    rt_err_t rc;

    if (data)
    {
        do
        {
            unsigned int old_vsp = atomic_load(&data->vice_sp);
            vsp = old_vsp - 2;
            if (vsp >= 0)
                success = atomic_compare_exchange_weak(&data->vice_sp, &old_vsp, vsp);
            else
            {
                success = 0;
                break;
            }
        } while (!success);

        if (success)
        {
            data->vice_stack[vsp] = trace_sp;
            data->vice_stack[vsp + 1] = data->vice_fp;
            data->vice_fp = vsp;
            rc = RT_EOK;
        }
        else
            rc = -RT_ENOSPC;
    }
    else
    {
        rc = -RT_ENOENT;
    }

    return rc;
}

rt_notrace
rt_err_t ftrace_vice_stack_push_word(ftrace_host_data_t data, ftrace_context_t context, rt_base_t word)
{
    long sp;
    rt_err_t rc;
    int success;

    if (data)
    {
        do
        {
            unsigned int old_sp = atomic_load(&data->vice_sp);
            sp = old_sp - 1;
            if (sp >= 0)
                success = atomic_compare_exchange_weak(&data->vice_sp, &old_sp, sp);
            else
            {
                success = 0;
                break;
            }
        } while (!success);

        if (success)
        {
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

    return rc;
}

rt_notrace
rt_base_t ftrace_vice_stack_pop_word(ftrace_host_data_t data, ftrace_context_t context)
{
    long sp;
    rt_base_t word;

    if (data)
    {
        sp = atomic_load(&data->vice_sp);

        /* debug */
        if (sp >= data->vice_stack_size)
            PANIC("stack overflow");

        word = data->vice_stack[sp];
        atomic_fetch_add(&data->vice_sp, 1);
    }
    else
    {
        PANIC("Invalid data");
    }

    return word;
}

rt_notrace
rt_base_t ftrace_vice_stack_pop_frame(ftrace_host_data_t data, rt_ubase_t trace_sp)
{
    long vsp;
    rt_base_t word;

    if (data)
    {
        do {
            vsp = atomic_load(&data->vice_sp);

            /**
             * debug：
             * The corruption is generated from the what?
             * -> the one operating on it!
             */
            if (vsp != data->vice_fp)
                PANIC("VSP corrupted");
            if (vsp + 2 > data->vice_stack_size)
                PANIC("VSP overflow");

            word = data->vice_stack[vsp];
            if (word != trace_sp)
            {
                /* TODO: the protection of drop frame in interrupt context */
                _drop_frame(data);
            }
            else
            {
                break;
            }
        } while (1);

        data->vice_fp = data->vice_stack[vsp + 1];
        atomic_fetch_add(&data->vice_sp, 2);
    }
    else
    {
        PANIC("Invalid input");
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
        data->vice_fp = 0;
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
