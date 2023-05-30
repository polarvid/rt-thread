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

typedef struct ftrace_host_data {
    rt_ubase_t *vice_stack;
    size_t vice_stack_size;
    int arch_ctx_level;
    _Atomic(size_t) vice_sp;
    atomic_uint stacked_trace;
    atomic_uint trace_recorded;
} *ftrace_host_data_t;

/* ftrace entry and its return status */
#define FTE_NOTRACE_EXIT    0
#define FTE_OVERRIDE_EXIT   1
rt_err_t ftrace_trace_entry(ftrace_session_t session, rt_ubase_t pc, rt_ubase_t ret_addr, void *context);

/* architecture specific */
int ftrace_arch_patch_code(void *entry, rt_bool_t enabled);
int ftrace_arch_hook_session(void *entry, ftrace_session_t session, rt_bool_t enabled);
ftrace_session_t ftrace_arch_get_session(void *entry);
rt_err_t ftrace_arch_push_context(ftrace_session_t session, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context);
void ftrace_arch_pop_context(ftrace_session_t *session, rt_ubase_t *pc, rt_ubase_t *ret_addr, ftrace_context_t context);

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
