/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-19     WangXiaoyao  syscall tracer with fgraph
 */

#include "ksymtbl.h"
#include "rtdef.h"
#include <string.h>
#define DBG_TAG "tracing.syscall"
#define DBG_LVL DBG_INFO
#include <rtdbg.h>

#include "arch/aarch64.h"
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

static rt_hw_spinlock_t print_lock;

rt_inline void _log_param(struct ftrace_context *ctx, const char **types, const char **names, size_t i)
{
    if (!strstr(types[i], "char *"))
    {
        dbg_raw("%s=0x%lx", names[i], ctx->args[FTRACE_REG_X0 + i]);
    }
    else
    {
        dbg_raw("%s=\"%s\"", names[i], ctx->args[FTRACE_REG_X0 + i]);
    }
}

static rt_notrace
rt_ubase_t _test_graph_on_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    rt_thread_t tcb = rt_thread_self();
    struct ftrace_context *ctx = context;
    rt_ubase_t syscall = ctx->args[FTRACE_REG_X7];
    const char **types;
    const char **names;

    /* filter out massive futex ops */
    if (syscall == 131 || syscall == 132)
        return 0;

    const int param_cnt = lwp_get_syscall_param_list(syscall, &types, &names);
    rt_hw_spin_lock(&print_lock);
    if (param_cnt != -1)
    {
        dbg_log_prologue(DBG_INFO);
        dbg_raw("[%s] %s(", tcb->parent.name, lwp_get_syscall_name(syscall));

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
        LOG_I("[%s] %s(0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx)",
            tcb->parent.name, lwp_get_syscall_name(syscall), ctx->args[FTRACE_REG_X0],
            ctx->args[FTRACE_REG_X1], ctx->args[FTRACE_REG_X2], ctx->args[FTRACE_REG_X3],
            ctx->args[FTRACE_REG_X4], ctx->args[FTRACE_REG_X5], ctx->args[FTRACE_REG_X6]);
    }
    rt_hw_spin_unlock(&print_lock);

    return syscall;
}

static rt_notrace
void _test_graph_on_exit(ftrace_tracer_t tracer, rt_ubase_t entry_pc, rt_ubase_t stat, void *context)
{
    rt_thread_t tcb = rt_thread_self();
    struct ftrace_context *ctx = context;

    rt_hw_spin_lock(&print_lock);
    LOG_I("[%s] %s() => 0x%lx",
        tcb->parent.name, lwp_get_syscall_name(stat),
        ctx->args[FTRACE_REG_X0]);
    rt_hw_spin_unlock(&print_lock);
    return ;
}

static void syscall_trace_start(int argc, char **argv)
{
    /* init */
    fgraph_session_t session;
    session = rt_malloc(sizeof(*session));
    RT_ASSERT(session);

    rt_hw_spin_lock_init(&print_lock);

    ftrace_tracer_init(&syscall_tracer, _test_graph_on_entry, session);
    ftrace_tracer_set_on_exit(&syscall_tracer, _test_graph_on_exit);

    /* set trace point */
    size_t trace_point_cnt = 0;
    for (size_t id = 1; ; id++)
    {
        const void *syscall = lwp_get_sys_api(id);
        if (!syscall)
            break;

        int ret = ftrace_tracer_set_trace(&syscall_tracer, (void *)syscall);
        if (ret == RT_EOK)
            trace_point_cnt++;
    }
    LOG_I("%ld syscalls registered", trace_point_cnt);

    /* ftrace enabled */
    ftrace_tracer_register(&syscall_tracer);

    return ;
}
MSH_CMD_EXPORT_ALIAS(syscall_trace_start, strace, test ftrace feature);

static void syscall_trace_stop(int argc, char **argv)
{
    /* TODO implement a auto termination version */
    /* ftrace disabled */
    ftrace_tracer_unregister(&syscall_tracer);

    rt_free(syscall_tracer.data);

    return ;
}
MSH_CMD_EXPORT_ALIAS(syscall_trace_stop, strace_stop, test ftrace feature);
