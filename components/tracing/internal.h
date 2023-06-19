/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#ifndef __TRACE_FTRACE_INTERNAL_H__
#define __TRACE_FTRACE_INTERNAL_H__

#include "ftrace.h"
#include <stdatomic.h>

typedef union ftrace_vice_frame {
    struct {
        atomic_uint sp;
        atomic_uint fp;
    };
    atomic_ulong data;
} ftrace_vice_frame_t;

RT_CTASSERT(compact_value, sizeof(ftrace_vice_frame_t) == sizeof(atomic_ulong));

typedef struct ftrace_host_data {
    /* vice stack context */
    rt_ubase_t *vice_stack;
    size_t vice_stack_size;

    ftrace_vice_frame_t vice_ctx;

    atomic_uint trace_recorded;
    unsigned int tracer_stacked_count;
} *ftrace_host_data_t;

typedef rt_base_t ftrace_ctrl_ctx_t[5];

#ifdef TRACING_FTRACE_DEBUG
#define CONTROL_DISABLE _ftrace_global_disable
extern long _ftrace_global_disable;
#else
#define CONTROL_DISABLE 0
#endif

/* ftrace entry and its return status */
#define FTE_NOTRACE_EXIT    0
#define FTE_OVERRIDE_EXIT   1
rt_err_t ftrace_controller_entry(ftrace_session_t session, rt_ubase_t pc, rt_ubase_t ret_addr, void *context);

/* architecture specific */
int ftrace_arch_patch_code(void *entry, rt_bool_t enabled);
int ftrace_arch_hook_session(void *entry, ftrace_session_t session, rt_bool_t enabled);
ftrace_session_t ftrace_arch_get_session(void *entry);

rt_err_t ftrace_arch_put_context(ftrace_context_t context, ftrace_session_t session);
void ftrace_arch_get_context(ftrace_context_t context, ftrace_session_t *session);

/* vice stack */
rt_err_t ftrace_vice_stack_verify(ftrace_host_data_t data, ftrace_arch_context_t context);
void *ftrace_vice_stack_push_frame(ftrace_context_t context,
                                   ftrace_session_t session,
                                   rt_ubase_t trace_sp, size_t num_words);
void ftrace_vice_stack_get_context(ftrace_context_t context, ftrace_session_t *session);

rt_inline rt_notrace
void ftrace_vice_stack_pop_frame(ftrace_context_t context)
{
    ftrace_vice_frame_t vice_ctx;
    ftrace_host_data_t data;
    data = context->host_data;
    /* getting the sp, and pop up the vice frame data */
    vice_ctx.data = data->vice_ctx.data;

    /* it's interruptable, so no atomic ops is used */
    vice_ctx.fp = data->vice_stack[vice_ctx.sp + 1];
    if (vice_ctx.fp)
    {
        vice_ctx.sp = vice_ctx.fp;
    }
    else
    {
        vice_ctx.sp = data->vice_stack_size;
    }

    atomic_store(&data->vice_ctx.data, vice_ctx.data);

    return ;
}

rt_inline rt_notrace
void *ftrace_vice_stack_get_data_buf(ftrace_context_t context)
{
    ftrace_host_data_t data = context->host_data;
    const long offset = sizeof(ftrace_ctrl_ctx_t)/sizeof(rt_base_t);
    return &data->vice_stack[data->vice_ctx.sp + offset];
}

/* binary search utils */
#define GET_SECTION(sec)        ((void *)ksymtbl + ksymtbl->sec)
#define OBJIDX_TO_OFFSET(idx)   (arr + ((idx) << objsz_order))
long tracing_binary_search(void *arr, long objcnt, long objsz_order, void *target,
                           int (*cmp)(const void *, const void *));

/* entries look up */
rt_bool_t ftrace_entries_exist(void *entry);
void ftrace_entries_for_each(void (*fn)(void *symbol, void *data), void *data);

/* syscall tracer */
int ftrace_arch_trace_syscall(ftrace_session_t session);
rt_base_t ftrace_arch_syscall_on_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context);
void ftrace_arch_syscall_on_exit(ftrace_tracer_t tracer, rt_ubase_t entry_pc, ftrace_context_t context);

/* vice stack */
int ftrace_vice_stack_init(ftrace_host_data_t data);

#endif /* __TRACE_FTRACE_INTERNAL_H__ */
