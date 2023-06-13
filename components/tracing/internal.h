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
#include "rtdef.h"
#include <stdatomic.h>

typedef union ftrace_vice_ctx {
    struct {
        atomic_uint sp;
        atomic_uint fp;
    };
    atomic_ulong data;
} ftrace_vice_ctx_t;

RT_CTASSERT(compact_value, sizeof(ftrace_vice_ctx_t) == sizeof(atomic_ulong));

typedef struct ftrace_host_data {
    /* vice stack context */
    rt_ubase_t *vice_stack;
    size_t vice_stack_size;

    ftrace_vice_ctx_t vice_ctx;

    atomic_uint trace_recorded;
    unsigned int tracer_stacked_count;
} *ftrace_host_data_t;

#define CONTROL_DISABLE _ftrace_global_disable
extern long _ftrace_global_disable;

/* ftrace entry and its return status */
#define FTE_NOTRACE_EXIT    0
#define FTE_OVERRIDE_EXIT   1
rt_err_t ftrace_trace_entry(ftrace_session_t session, rt_ubase_t pc, rt_ubase_t ret_addr, void *context);

/* architecture specific */
int ftrace_arch_patch_code(void *entry, rt_bool_t enabled);
int ftrace_arch_hook_session(void *entry, ftrace_session_t session, rt_bool_t enabled);
ftrace_session_t ftrace_arch_get_session(void *entry);

/* vice stack */
rt_err_t ftrace_arch_push_context(ftrace_host_data_t data, ftrace_session_t session, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context);
void ftrace_arch_pop_context(ftrace_host_data_t data, ftrace_session_t *session, rt_ubase_t *pc, rt_ubase_t *ret_addr, ftrace_context_t context);
rt_err_t ftrace_vice_stack_verify(ftrace_host_data_t data, ftrace_context_t context);
rt_err_t ftrace_vice_stack_push_frame(ftrace_host_data_t data, rt_ubase_t trace_sp, rt_base_t *words, size_t num_words);
rt_base_t ftrace_vice_stack_pop_frame(ftrace_host_data_t data, rt_ubase_t trace_sp, rt_base_t *words, size_t num_words);

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
