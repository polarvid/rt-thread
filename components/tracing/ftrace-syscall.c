/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-19     WangXiaoyao  syscall tracer with fgraph
 */

#define DBG_TAG "tracing.syscall"
#define DBG_LVL DBG_INFO
#include <rtdbg.h>

#include "event-ring.h"
#include "ftrace.h"
#include "internal.h"

#include <dfs_file.h>
#include <lwp.h>
#include <lwp_syscall.h>
#include <mm_aspace.h>
#include <mm_page.h>
#include <mmu.h>
#include <rtthread.h>
#include <rthw.h>

#include <stdatomic.h>
#include <unistd.h>

static struct ftrace_tracer syscall_tracer;

typedef struct fgraph_session {
} *fgraph_session_t;

static struct rt_spinlock print_lock;

rt_inline void _log_param(struct ftrace_context *ctx, const char **types, const char **names, size_t i)
{
    /* use a more generic way */
    if (!strstr(types[i], "char *"))
    {
        dbg_raw("%s=0x%lx", names[i], ctx->args[i]);
    }
    else
    {
        dbg_raw("%s=\"%s\"", names[i], ctx->args[i]);
    }
}

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

static rt_notrace
rt_base_t _syscall_on_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context)
{
    rt_thread_t tcb = rt_thread_self();
    struct ftrace_context *ctx = context;
    rt_ubase_t syscall = ctx->args[7];
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
            _log_param(ctx, types, names, i);
            dbg_raw(", ");
        }
        _log_param(ctx, types, names, param_cnt - 1);

        dbg_raw(")\n");
        dbg_log_epilogue(DBG_INFO);
    }
    else
    {
        LOG_I("[%s:%x] %s(0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx)",
            tcb->parent.name, (rt_ubase_t)tcb, lwp_get_syscall_name(syscall), ctx->args[0],
            ctx->args[1], ctx->args[2], ctx->args[3], ctx->args[4], ctx->args[5], ctx->args[6]);
    }
    rt_spin_unlock(&print_lock);

    /* some syscall never return */
    if (syscall != 1)
        _push_syscall_id(syscall, ftrace_arch_get_sp(context));
    return 0;
}

static rt_notrace
void _syscall_on_exit(ftrace_tracer_t tracer, rt_ubase_t entry_pc, ftrace_context_t context)
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

static struct syscall_session {
    struct ftrace_session session;
    struct ftrace_tracer entry_tracer;
    struct ftrace_tracer exit_tracer;
} syscall_session;

static void _syscall_tracer_init(ftrace_tracer_t entry, ftrace_tracer_t exit)
{
    ftrace_trace_fn_t entry_handler = &_syscall_on_entry;
    ftrace_exit_fn_t exit_handler = &_syscall_on_exit;
    ftrace_tracer_init(entry, TRACER_ENTRY, entry_handler, NULL);
    ftrace_tracer_init(exit, TRACER_EXIT, exit_handler, NULL);
}

static ftrace_session_t _get_custom_session(void)
{
    ftrace_session_t session = &syscall_session.session;
    ftrace_tracer_t entry_tracer = &syscall_session.entry_tracer;
    ftrace_tracer_t exit_tracer = &syscall_session.exit_tracer;

    ftrace_session_init(session);

    _syscall_tracer_init(entry_tracer, exit_tracer);

    ftrace_session_bind(session, entry_tracer);
    ftrace_session_bind(session, exit_tracer);

    return session;
}

static void _delete_custom_session(ftrace_session_t session)
{
}

static void syscall_trace_start(int argc, char **argv)
{
    /* init */
    rt_spin_lock_init(&print_lock);
    ftrace_session_t session = _get_custom_session();

    /* set trace point */
    size_t trace_point_cnt = 0;
    for (size_t id = 1; ; id++)
    {
        const void *syscall = lwp_get_sys_api(id);
        if (!syscall)
            break;

        int ret = ftrace_session_set_trace(session, (void *)syscall);
        if (ret == RT_EOK)
            trace_point_cnt++;
    }
    LOG_I("%ld syscalls registered", trace_point_cnt);

    /* ftrace enabled */
    ftrace_session_register(session);

    return ;
}
MSH_CMD_EXPORT_ALIAS(syscall_trace_start, strace, test ftrace feature);

static void syscall_trace_stop(int argc, char **argv)
{
    /* TODO implement a auto termination version */
    /* ftrace disabled */
    ftrace_session_unregister(&syscall_session.session);

    return ;
}
MSH_CMD_EXPORT_ALIAS(syscall_trace_stop, strace_stop, test ftrace feature);
