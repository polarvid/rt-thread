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
    ftrace_vice_frame_t vice_ctx;

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

    if (vice_ctx.fp && vice_ctx.fp != vice_ctx.sp)
        PANIC("Assert failed");
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
rt_err_t ftrace_vice_stack_verify(ftrace_host_data_t data, ftrace_arch_context_t context)
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
                if (vsp != data->vice_ctx.fp && data->vice_ctx.fp)
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

const static size_t ftrace_ctrl_ctx_len = sizeof(ftrace_ctrl_ctx_t)/sizeof(rt_base_t);

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
void *ftrace_vice_stack_push_frame(ftrace_context_t context,
                                   ftrace_session_t session,
                                   rt_ubase_t trace_sp, size_t num_words)
{
    int success;
    rt_err_t rc;
    ftrace_vice_frame_t vice_ctx;
    ftrace_vice_frame_t vice_data_old;
    ftrace_host_data_t data = context->host_data;

    /* allocate frame */
    do {
        vice_ctx.data = atomic_load(&data->vice_ctx.data);
        vice_data_old.data = vice_ctx.data;

        vice_ctx.sp -= ftrace_ctrl_ctx_len + num_words;
        vice_ctx.fp = vice_ctx.sp;

        /* overflow checking */
        if (vice_ctx.sp < data->vice_stack_size)
        {
            unsigned long expected = vice_data_old.data;
            success = atomic_compare_exchange_weak(&data->vice_ctx.data, &expected, vice_ctx.data);
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
        ftrace_ctrl_ctx_t *ctx = (ftrace_ctrl_ctx_t *)&data->vice_stack[vice_ctx.sp];
        (*ctx)[0] = trace_sp;
        (*ctx)[1] = vice_data_old.fp;
        (*ctx)[2] = context->pc;
        (*ctx)[3] = context->ret_addr;
        (*ctx)[4] = (rt_base_t)session;

        rc = RT_EOK;
    }
    else
        rc = -RT_ENOSPC;

    if (rc)
        return RT_NULL;
    else
        return ftrace_vice_stack_get_data_buf(context);
}

rt_notrace
void ftrace_vice_stack_get_context(ftrace_context_t context, ftrace_session_t *session)
{
    ftrace_host_data_t data = context->host_data;
    ftrace_ctrl_ctx_t *ctx = (ftrace_ctrl_ctx_t *)&data->vice_stack[data->vice_ctx.sp];

    context->pc = (*ctx)[2];
    context->ret_addr = (*ctx)[3];
    *session = (ftrace_session_t)(*ctx)[4];
    return ;
}

int ftrace_vice_stack_init(ftrace_host_data_t data)
{
    int err;
    const size_t alloc_size = 0x1000;
    data->vice_stack = rt_pages_alloc_ext(rt_page_bits(alloc_size), PAGE_ANY_AVAILABLE);
    if (data->vice_stack)
    {
        data->vice_stack_size = alloc_size / sizeof(data->vice_stack[0]);
        data->vice_ctx.sp = data->vice_stack_size;
        data->vice_ctx.fp = 0;
        err = 0;
    }
    else
    {
        err = -RT_ENOMEM;
    }
    return err;
}
