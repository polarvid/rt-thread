/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-05-01     WangXiaoyao  standalone vice stack for tracer
 */

#include <stdatomic.h>
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
    ftrace_vice_ctx_t vice_ctx;

    prev_vfp = data->vice_stack[data->vice_ctx.fp + 1];
    if (prev_vfp)
    {
        vice_ctx.sp = prev_vfp;
    }
    else
    {
        vice_ctx.sp = data->vice_stack_size;
    }

    vice_ctx.fp = prev_vfp;
    atomic_store(&data->vice_ctx.data, vice_ctx.data);
}

/**
 * @brief Call stack and vice stack verification
 * Pairing the ret_addr with the pc in the last frame of vice stack.
 * Detecting recursion and restore.
 *
 * @param data
 * @param context
 * @return rt_err_t
 */
rt_notrace
rt_err_t ftrace_vice_stack_verify(ftrace_host_data_t data, ftrace_context_t context)
{
    rt_err_t rc = -RT_ERROR;
    rt_ubase_t prev_sp;

    while (rc != RT_EOK)
    {
        if (data->vice_ctx.fp)
        {
            prev_sp = data->vice_stack[data->vice_ctx.fp];
            /**
             * sp in current context must at least equal or lower than previous one
             * Noted that it's acceptable in some ABI to avoid maintaining call frames,
             * hence the sp can be identical to previous one. 
             */
            if (prev_sp < context->args[FTRACE_REG_SP])
            {
                rt_ubase_t vsp;
                vsp = atomic_load(&data->vice_ctx.sp);

                /**
                 * debug：
                 * The corruption is generated from the what?
                 * -> the one operating on it!
                 */
                if (vsp != data->vice_ctx.fp)
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
rt_err_t ftrace_vice_stack_push(ftrace_host_data_t data, ftrace_context_t context, rt_base_t *words, size_t num_words)
{
    long vsp;
    rt_err_t rc;
    int success;

    if (data)
    {
        do
        {
            unsigned int old_vsp = atomic_load(&data->vice_ctx.sp);
            vsp = old_vsp - num_words;
            if (vsp >= 0)
                success = atomic_compare_exchange_weak(&data->vice_ctx.sp, &old_vsp, vsp);
            else
            {
                success = 0;
                break;
            }
        } while (!success);

        if (success)
        {
            if (vsp > data->vice_stack_size)
                PANIC("vice stack overflow");

            for (size_t i = 0; i < num_words; i++)
            {
                data->vice_stack[vsp + i] = words[i];
            }
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
rt_err_t ftrace_vice_stack_push_frame(ftrace_host_data_t data, rt_ubase_t trace_sp, rt_base_t *words, size_t num_words)
{
    int success;
    rt_err_t rc;
    ftrace_vice_ctx_t vice_ctx;
    unsigned long vice_data_old;

    if (data)
    {
        /* allocate frame */
        do {
            vice_ctx.data = atomic_load(&data->vice_ctx.data);
            vice_data_old = vice_ctx.data;

            vice_ctx.sp -= 2 + num_words;
            vice_ctx.fp = vice_ctx.sp;

            /* overflow checking */
            if (vice_ctx.sp < data->vice_stack_size)
            {
                success = atomic_compare_exchange_weak(&data->vice_ctx.data, &vice_data_old, vice_ctx.data);
            }
            else
            {
                success = 0;
                break;
            }
        } while (!success);

        /* put data */
        if (success)
        {
            long vsp = vice_ctx.sp;

            typeof(data->vice_stack) idx_end;
            typeof(data->vice_stack) idx;

            data->vice_stack[vsp] = trace_sp;
            data->vice_stack[vsp + 1] = data->vice_ctx.fp;

            idx = &data->vice_stack[vsp + 2];
            idx_end = &data->vice_stack[vsp + 2 + num_words];
            while (idx < idx_end)
                *idx++ = *words++;

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
    return ftrace_vice_stack_push(data, context, &word, 1);
}

rt_notrace
rt_base_t ftrace_vice_stack_pop_word(ftrace_host_data_t data, ftrace_context_t context)
{
    long sp;
    rt_base_t word;

    if (data)
    {
        sp = atomic_load(&data->vice_ctx.sp);

        /* debug */
        if (sp >= data->vice_stack_size)
            PANIC("stack overflow");

        word = data->vice_stack[sp];
        atomic_fetch_add(&data->vice_ctx.sp, 1);
    }
    else
    {
        PANIC("Invalid data");
    }

    return word;
}

rt_notrace
rt_base_t ftrace_vice_stack_pop_frame(ftrace_host_data_t data,
                                      rt_ubase_t trace_sp, rt_base_t *words,
                                      size_t num_words)
{
    rt_base_t sp;
    ftrace_vice_ctx_t vice_ctx;

    if (data)
    {
        typeof(data->vice_stack) idx_end;
        typeof(data->vice_stack) idx;

        /* getting the sp, and pop up the vice frame data */
        do {
            vice_ctx.data = data->vice_ctx.data;

            if (vice_ctx.sp != data->vice_ctx.fp)
                PANIC("VSP corrupted");

            sp = data->vice_stack[vice_ctx.sp];
            if (sp != trace_sp)
            {
                /* TODO: the protection of drop frame in interrupt context */
                _drop_frame(data);
            }
            else
            {
                break;
            }
        } while (1);

        idx = &data->vice_stack[vice_ctx.sp + 2];
        idx_end = &data->vice_stack[vice_ctx.sp + 2 + num_words];
        while (idx < idx_end)
            *words++ = *idx++;

        /* it's interruptable, so no atomic ops is used */
        vice_ctx.fp = data->vice_stack[vice_ctx.sp + 1];
        vice_ctx.sp += 2 + num_words;

        atomic_store(&data->vice_ctx.data, vice_ctx.data);
    }
    else
    {
        PANIC("Invalid input");
    }

    return sp;
}

int ftrace_vice_stack_init(ftrace_host_data_t data)
{
    int err;
    const size_t alloc_size = 0x1000;
    data->vice_stack = rt_pages_alloc_ext(rt_page_bits(alloc_size), PAGE_ANY_AVAILABLE);
    if (data->vice_stack)
    {
        data->vice_ctx.fp = 0;
        data->vice_stack_size = alloc_size / sizeof(data->vice_stack[0]);
        data->vice_ctx.sp = data->vice_stack_size;
        err = 0;
    }
    else
    {
        err = -RT_ENOMEM;
    }
    return err;
}
