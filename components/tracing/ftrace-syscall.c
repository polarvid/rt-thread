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

static struct syscall_session {
    struct ftrace_session session;
    struct ftrace_tracer entry_tracer;
    struct ftrace_tracer exit_tracer;
} syscall_session;

void *_data_buf_get(ftrace_tracer_t tracer, ftrace_context_t context)
{
    return (context);
}

static void _syscall_tracer_init(ftrace_tracer_t entry, ftrace_tracer_t exit)
{
    ftrace_trace_fn_t entry_handler = &ftrace_arch_syscall_on_entry;
    ftrace_exit_fn_t exit_handler = &ftrace_arch_syscall_on_exit;
    ftrace_tracer_init(entry, TRACER_ENTRY, entry_handler, NULL);
    ftrace_tracer_init(exit, TRACER_EXIT, exit_handler, NULL);
}

static ftrace_session_t _get_custom_session(void)
{
    ftrace_session_t session = &syscall_session.session;
    ftrace_tracer_t entry_tracer = &syscall_session.entry_tracer;
    ftrace_tracer_t exit_tracer = &syscall_session.exit_tracer;

    ftrace_session_init(session, _data_buf_get, 1);

    _syscall_tracer_init(entry_tracer, exit_tracer);

    ftrace_session_bind(session, entry_tracer);
    ftrace_session_bind(session, exit_tracer);

    return session;
}

static pid_t pid;

void _app_test(int argc, char **argv)
{
    pid = exec(argv[0], 0, argc - 1, argv + 1);
    struct rt_lwp* lwp = lwp_from_pid(pid);
    rt_thread_t thread = rt_list_entry(lwp->t_grp.prev, struct rt_thread, sibling);
    rt_thread_control(thread, RT_THREAD_CTRL_BIND_CPU, (void *)1);
}

static void syscall_trace_start(int argc, char **argv)
{
    /* init */
    ftrace_session_t session = _get_custom_session();
    RT_ASSERT(!!session);

    /* set trace point */
    if (ftrace_arch_trace_syscall(session) != RT_EOK)
        RT_ASSERT(0);

    /* ftrace enabled */
    ftrace_session_register(session);

    if (argc > 1)
        _app_test(argc - 1, &argv[1]);

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
