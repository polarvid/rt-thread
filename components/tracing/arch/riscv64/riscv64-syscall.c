/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-05-08     WangXiaoyao  ftrace trap entry
 */

#define DBG_TAG "tracing.ftrace"
#define DBG_LVL DBG_INFO
#include <rtdbg.h>

#include "../../internal.h"
#include <opcode.h>
#include <rtdef.h>
#include <rthw.h>
#include <stack.h>
#include <lwp.h>
#include <lwp_syscall.h>

#include <stdatomic.h>
#include <stddef.h>
#include <stdint.h>


static struct rt_spinlock print_lock;

#ifndef TRACING_SYSCALL_EXT
#define lwp_get_syscall_param_list(syscall, types, names)   (-1)
#endif

rt_notrace
void _push_syscall_id(long syscall_id, rt_ubase_t sp)
{
    // TODO pc to symbol
    rt_thread_t thread;
    thread = rt_thread_self();
    if (thread)
    {
        ftrace_host_data_t data = thread->ftrace_host_session;
        if (data)
        {
            rt_ubase_t *frame = atomic_fetch_add(&data->stack_pointer, -1 * sizeof(void *));
            *--frame = syscall_id;
        }
        else
        {
            LOG_W("Not data found");
        }
    }
}

rt_notrace
long _pop_syscall_id(void)
{
    // TODO pc to symbol
    rt_thread_t thread;
    thread = rt_thread_self();
    long syscall_id = -1;
    if (thread)
    {
        ftrace_host_data_t data = thread->ftrace_host_session;
        if (data)
        {
            rt_ubase_t *frame = atomic_fetch_add(&data->stack_pointer, -1 * sizeof(void *));

            syscall_id = frame[0];
        }
    }
    return syscall_id;
}

rt_inline void _log_param(struct rt_hw_stack_frame *frame, const char **types, const char **names, size_t i)
{
    /* use a more generic way */
    if (!strstr(types[i], "char *"))
    {
        dbg_raw("%s=0x%lx", names[i], frame->a0 + i);
    }
    else
    {
        dbg_raw("%s=\"%s\"", names[i], frame->a0 + i);
    }
}

rt_notrace
rt_base_t ftrace_arch_syscall_on_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context)
{
    rt_thread_t tcb = rt_thread_self();
    struct rt_hw_stack_frame *frame = (void *)context->args[0];
    int syscall = frame->a7;
    const char **types;
    const char **names;

    /* filter out massive futex ops */
    if (syscall == 131 || syscall == 132)
        return 0;

    const int param_cnt = lwp_get_syscall_param_list(syscall, &types, &names);
    rt_spin_lock(&print_lock);
    if (param_cnt != -1)
    {
        dbg_log_prologue(DBG_INFO);
        dbg_raw("[%s:%x] %s(", tcb->parent.name, (rt_ubase_t)tcb, lwp_get_syscall_name(syscall));

        for (size_t i = 0; i < param_cnt - 1; i++)
        {
            _log_param(frame, types, names, i);
            dbg_raw(", ");
        }
        _log_param(frame, types, names, param_cnt - 1);

        dbg_raw(")\n");
        dbg_log_epilogue(DBG_INFO);
    }
    else
    {
        LOG_I("[%s:%x] %s(0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx)",
            tcb->parent.name, (rt_ubase_t)tcb, lwp_get_syscall_name(syscall), frame->a0,
            frame->a1, frame->a2, frame->a3, frame->a4, frame->a5, frame->a6);
    }
    rt_spin_unlock(&print_lock);

    /* some syscall never return */
    if (syscall != 1)
        _push_syscall_id(syscall, ftrace_arch_get_sp(context));
    return 0;
}

rt_notrace
void ftrace_arch_syscall_on_exit(ftrace_tracer_t tracer, rt_ubase_t entry_pc, ftrace_context_t context)
{
    long syscall = _pop_syscall_id();
    rt_thread_t tcb = rt_thread_self();
    struct ftrace_context *ctx = context;
    rt_ubase_t retval = ctx->args[0];

    rt_spin_lock(&print_lock);
    if (retval > -4096ul)
        LOG_W("[%s:%x] %s() => 0x%lx (-%ld)", tcb->parent.name, (rt_ubase_t)tcb, lwp_get_syscall_name(syscall), retval, -retval);
    else
        LOG_I("[%s:%x] %s() => 0x%lx", tcb->parent.name, 
              (rt_ubase_t)tcb, lwp_get_syscall_name(syscall), retval);

    rt_spin_unlock(&print_lock);
    return ;
}

int ftrace_arch_trace_syscall(ftrace_session_t session)
{
    int err;
    extern void syscall_handler(void);
    err = ftrace_session_set_trace(session, syscall_handler);

    return err;
}
