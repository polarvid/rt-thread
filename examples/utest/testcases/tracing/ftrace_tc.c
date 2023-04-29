/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-28     WangXiaoyao  the first version
 */

#include <ksymtbl.h>
#include <event-ring.h>
#include <ftrace.h>

#include <dfs_file.h>
#include <lwp.h>
#include <mm_aspace.h>
#include <mm_page.h>
#include <mmu.h>
#include <rtthread.h>
#include <rthw.h>
#include <utest.h>

#include <stdatomic.h>

static struct ftrace_tracer tracer_test;

static void _test_tracee(char *str, ...)
{
    rt_kputs(str);
}

static rt_notrace
rt_ubase_t _test_handler(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    const struct ftrace_context *ctx = context;

    rt_kprintf("message[0x%lx]\n", ftrace_timestamp());
    rt_kprintf("%s(%p, 0x%lx, 0x%lx, %p)\n", __func__, tracer, pc, ret_addr, context);
    for (int i = 0; i < FTRACE_REG_CNT; i += 2)
        rt_kprintf("%d %p, %p\n", i, ctx->args[i], ctx->args[i + 1]);
}

static void test_set_trace_api(void)
{
    /* init */
    ftrace_tracer_init(&tracer_test, _test_handler, NULL);
    ftrace_tracer_set_trace(&tracer_test, &_test_tracee);

    /* a dummy instrumentation */
    _test_tracee("no tracer\n");

    /* ftrace enabled */
    ftrace_tracer_register(&tracer_test);
    rt_kprintf("ftrace enabled\n");
    _test_tracee("dummy tracer enable\n", 1, 2, 3, 4, 5, 6, 7);

    /* ftrace disabled */
    ftrace_tracer_unregister(&tracer_test);
    _test_tracee("dummy tracer unregistered\n");

    return ;
}

static void test_api(void)
{
    test_set_trace_api();
}

static rt_err_t utest_tc_init(void)
{
    return RT_EOK;
}

static rt_err_t utest_tc_cleanup(void)
{
    return RT_EOK;
}

static void testcase(void)
{
    UTEST_UNIT_RUN(test_api);
}
UTEST_TC_EXPORT(testcase, "testcases.tracing.ftrace", utest_tc_init, utest_tc_cleanup, 20);
