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

#include "internal.h"

struct tracee_ret {
    long data[4];
};

static const long magic_numbers[] = {12826212334541059438ul, 15087704365839300601ul, 14339533210297058355ul, 4206045298161606937ul, 7956564612695610633ul, 15047219555744982329ul, 15230866504987122018ul, 14535292288262951240ul};
static const long pad[1024 * 1024];
static struct tracee_ret _test_tracee(size_t start, ...)
{
    struct tracee_ret ret;
    va_list args;
    va_start(args, start);
    /* set test data */
    if (start)
    {
        for (size_t i = 0; i < sizeof(magic_numbers)/sizeof(magic_numbers[0]); i++)
        {
            uassert_true(va_arg(args, long) == magic_numbers[sizeof(magic_numbers)/sizeof(magic_numbers[0]) - i - 1]);
        }
        for (size_t i = 0; i < sizeof(ret.data)/sizeof(ret.data[0]); i++)
            ret.data[i] = magic_numbers[i];
    }
    va_end(args);
    return ret;
}

static rt_notrace
rt_base_t _test_handler(struct ftrace_tracer *tracer, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context)
{
    rt_kprintf("timestamp [0x%lx]\n", ftrace_timestamp());
    rt_kprintf("%s(%p, 0x%lx, 0x%lx, %p, %p)\n", __func__, tracer, pc, ret_addr, context, context->args[0]);
    /* API to extract arguments */
    rt_kprintf("%p - %p/%p\n", FTRACE_PC_TO_SYM(pc), _test_tracee, sys_exit);
    uassert_true(FTRACE_PC_TO_SYM(pc) == &_test_tracee || FTRACE_PC_TO_SYM(pc) == &sys_exit);
    return 0;
}

static rt_notrace
void _exit_handler(struct ftrace_tracer *tracer, rt_ubase_t entry_pc, ftrace_context_t context)
{
    struct tracee_ret *ret = (void *)context->args[2];
    for (size_t i = 0; i < sizeof(ret->data)/sizeof(ret->data[0]); i++)
        uassert_true(ret->data[i] == magic_numbers[i]);
    return ;
}

static void test_set_trace_api(void)
{
    /* Initialization */
    rt_err_t retval;
    ftrace_session_t session;
    /* entry tracer */
    ftrace_tracer_t entry_tracer;
    ftrace_trace_fn_t entry_handler = &_test_handler;
    /* exit tracer */
    ftrace_tracer_t exit_tracer;
    ftrace_exit_fn_t exit_handler = &_exit_handler;

    entry_tracer = ftrace_tracer_create(TRACER_ENTRY, entry_handler, NULL);
    uassert_true(!!entry_tracer);
    exit_tracer = ftrace_tracer_create(TRACER_EXIT, exit_handler, NULL);
    uassert_true(!!exit_handler);

    session = ftrace_session_create();
    uassert_true(!!session);

    /* Binding */
    retval = ftrace_session_bind(session, entry_tracer);
    uassert_true(retval == RT_EOK);
    retval = ftrace_session_bind(session, exit_tracer);
    uassert_true(retval == RT_EOK);

    _test_tracee(0);

    ftrace_session_set_trace(session, &_test_tracee);

    /* ftrace enabled */
    ftrace_session_register(session);

    struct tracee_ret ret = _test_tracee(1,
        magic_numbers[7], magic_numbers[6], magic_numbers[5], magic_numbers[4],
        magic_numbers[3], magic_numbers[2], magic_numbers[1], magic_numbers[0]);

    /* test test-data */
    LOG_I("Return value verification");
    for (size_t i = 0; i < sizeof(ret.data)/sizeof(ret.data[0]); i++)
        uassert_true(ret.data[i] == magic_numbers[i]);

    /* sys exit */
    // sys_exit(0);

    /* ftrace disabled */
    ftrace_session_unregister(session);
    _test_tracee(0);

    /* Delete */
    ftrace_tracer_delete(entry_tracer);
    ftrace_tracer_delete(exit_tracer);
    ftrace_session_delete(session);

    return ;
}

void test_vice_stack(void)
{
    const size_t test_times = ARCH_PAGE_SIZE / sizeof(size_t);

    /**
     * @brief Functionality Test
     * stack should return proper value on pop
     */
    for (size_t i = 0; i < test_times; i++)
    {
        ftrace_vice_stack_push_word(0, i);
    }
    for (long i = test_times - 1; i >= 0; i--)
    {
        if (ftrace_vice_stack_pop_word(0) != i)
        {
            uassert_true(0);
            break;
        }
    }
    uassert_true(1);
}

static void test_api(void)
{
    test_set_trace_api();
    test_vice_stack();
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
