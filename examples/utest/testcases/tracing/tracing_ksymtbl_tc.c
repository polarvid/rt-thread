/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-28     WangXiaoyao  the first version
 */
#include <utest.h>
#include <ksymtbl.h>

#define TEST_ENTRY_OFFSET 4
static void test_ksymtbl_find_by_address(void)
{
    /* robustness */
    int retval;
    char symbol[64];
    char class_char;
    size_t off2entry;

    retval = ksymtbl_find_by_address(
        &test_ksymtbl_find_by_address + TEST_ENTRY_OFFSET,
        &off2entry,
        symbol,
        sizeof(symbol),
        NULL,
        &class_char
    );

    uassert_true(!retval);
    uassert_true(!strncmp(__func__, symbol, sizeof(symbol)));
    uassert_true(off2entry == TEST_ENTRY_OFFSET);
    uassert_true(class_char == 't');
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
    UTEST_UNIT_RUN(test_ksymtbl_find_by_address);
}
UTEST_TC_EXPORT(testcase, "testcases.tracing.ksymtbl", utest_tc_init, utest_tc_cleanup, 20);
