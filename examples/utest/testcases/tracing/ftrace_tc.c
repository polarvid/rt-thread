/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-28     WangXiaoyao  the first version
 */

#include "utest_assert.h"
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

struct tracee_ret {
    long data[4];
};

static const long magic_numbers[4] = {0xabadcafe, 0x20232320, 0xbaabfeef, 0x04303004};

static struct tracee_ret _test_tracee(char *str, ...)
{
    LOG_I(str);

    struct tracee_ret ret;
    /* set test data */
    for (size_t i = 0; i < sizeof(magic_numbers)/sizeof(magic_numbers[0]); i++)
        ret.data[i] = magic_numbers[i];

    return ret;
}

static rt_notrace
rt_base_t _test_handler(struct ftrace_tracer *tracer, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context)
{
    const struct ftrace_context *ctx = context;

    rt_kprintf("timestamp [0x%lx]\n", ftrace_timestamp());
    rt_kprintf("%s(%p, 0x%lx, 0x%lx, %p)\n", __func__, tracer, pc, ret_addr, context);
    for (int i = 0; i < FTRACE_REG_CNT; i += 2)
        rt_kprintf("%d %p, %p\n", i, ctx->args[i], ctx->args[i + 1]);
}

static void test_set_trace_api(void)
{
    /* init */
    rt_err_t retval;
    ftrace_tracer_t tracer;
    ftrace_session_t session;
    ftrace_trace_fn_t handler = &_test_handler;

    tracer = ftrace_tracer_create(TRACER_ENTRY, handler, NULL);
    uassert_true(!!tracer);
    session = ftrace_session_create();
    uassert_true(!!session);

    retval = ftrace_session_bind(session, tracer);
    RT_ASSERT(retval == RT_EOK);

    _test_tracee("no tracer");

    ftrace_session_set_trace(session, &_test_tracee);

    /* a dummy instrumentation */

    /* ftrace enabled */
    ftrace_session_register(session);
    struct tracee_ret ret = _test_tracee("dummy tracer enable\n", 1, 2, 3, 4, 5, 6, 7);
    /* test test-data */
    for (size_t i = 0; i < sizeof(magic_numbers)/sizeof(magic_numbers[0]); i++)
        uassert_true(ret.data[i] == magic_numbers[i]);

    /* ftrace disabled */
    ftrace_session_unregister(session);
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
