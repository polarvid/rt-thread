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
#include "ftrace.h"

#include <rtthread.h>
#include <rthw.h>
#include <lwp.h>
#include <lwp_syscall.h>

#include <stdatomic.h>
#include <stddef.h>
#include <stdint.h>

static struct rt_spinlock print_lock;

#ifndef TRACING_SYSCALL_EXT
#define lwp_get_syscall_param_list(syscall, types, names)   (-1)
#endif

static unsigned long get_reg(struct rt_hw_exp_stack *frame, int reg_num)
{
    switch(reg_num) 
    {
        case 0:
            return frame->x0;
        case 1:
            return frame->x1;
        case 2:
            return frame->x2;
        case 3:
            return frame->x3;
        case 4:
            return frame->x4;
        case 5:
            return frame->x5;
        case 6:
            return frame->x6;
        case 7:
            return frame->x7;
        default:
            return 0;
    }
}

rt_inline void _log_param(struct rt_hw_exp_stack *frame, const char **types, const char **names, size_t i)
{
    /* use a more generic way */
    if (!strstr(types[i], "char *"))
    {
        dbg_raw("%s=0x%lx", names[i], get_reg(frame, i));
    }
    else
    {
        dbg_raw("%s=\"%s\"", names[i], get_reg(frame, i));
    }
}

rt_notrace
rt_base_t ftrace_arch_syscall_on_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context)
{
    rt_thread_t tcb = rt_thread_self();
    struct rt_hw_exp_stack *frame = (void *)context->args[0];
    long syscall = frame->x8;
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
            tcb->parent.name, (rt_ubase_t)tcb, lwp_get_syscall_name(syscall), frame->x0,
            frame->x1, frame->x2, frame->x3, frame->x4, frame->x5, frame->x6);
    }
    rt_spin_unlock(&print_lock);

    /* some syscall never return */
    if (syscall != 1)
        ftrace_vice_stack_push_word(context, syscall);
    return 0;
}

rt_notrace
void ftrace_arch_syscall_on_exit(ftrace_tracer_t tracer, rt_ubase_t entry_pc, ftrace_context_t context)
{
    long syscall = ftrace_vice_stack_pop_word(context);
    rt_thread_t tcb = rt_thread_self();
    rt_ubase_t retval = context->args[FTRACE_REG_X0];

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
    rt_spin_lock_init(&print_lock);

    extern void _SVC_Handler(void);
    err = ftrace_session_set_trace(session, _SVC_Handler);

    return err;
}
