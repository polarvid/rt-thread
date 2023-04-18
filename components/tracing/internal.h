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

/* ftrace entry */
rt_ubase_t ftrace_trace_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context);

/* architecture specific */
int _ftrace_patch_code(void *entry, rt_bool_t enabled);
int _ftrace_hook_tracer(void *entry, ftrace_tracer_t tracer, rt_bool_t enabled);
ftrace_tracer_t _ftrace_get_tracer(void *entry);
void _ftrace_enable_global(void);
void _ftrace_disable_global(void);

/* binary search utils */
#define GET_SECTION(sec)        ((void *)ksymtbl + ksymtbl->sec)
#define OBJIDX_TO_OFFSET(idx)   (arr + ((idx) << objsz_order))
long tracing_binary_search(void *arr, long objcnt, long objsz_order, void *target,
                           int (*cmp)(const void *, const void *));

/* entries look up */
rt_bool_t _ftrace_symtbl_entry_exist(void *entry);
void _ftrace_symtbl_for_each(void (*fn)(void *symbol, void *data), void *data);

#endif /* __TRACE_FTRACE_INTERNAL_H__ */
