/*
 * Copyright (c) 2006-2022, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-09     WangXiaoyao  Test for kasan
 */
#include "rtdef.h"
#include <rtthread.h>
#include <rthw.h>
#include <string.h>
#include <stdlib.h>

#if defined(RT_USING_UTEST) && defined(RT_USING_SMART) && defined(TRACING_SOFT_KASAN)
#include <utest.h>
#include <kasan.h>

static rt_err_t utest_tc_init(void)
{
    return RT_EOK;
}

static rt_err_t utest_tc_cleanup(void)
{
    return RT_EOK;
}

/**
 * ==============================================================
 * TEST FEATURE
 * out-of-bound read left
 * out-of-bound read right
 * out-of-bound write left
 * out-of-bound write right
 * use-after-free
 * out-of-bound memset
 * out-of-bound memcpy
 * out-of-bound strncpy
 * thread overflow
 * ==============================================================
 */

static const size_t kasan_buf_sz = 4096;

static void test_memset(void)
{
    void *buf = rt_calloc(1, kasan_buf_sz);
    uassert_false(!buf);
    LOG_I("out-of-bound memset test");
    uassert_true(!memset(buf, 'a', kasan_buf_sz + 1));
}

static void test_memcpy(void)
{
    void *oob_read = rt_malloc(kasan_buf_sz / 2);
    uassert_false(!oob_read);
    void *src = rt_malloc(kasan_buf_sz + 1);
    uassert_false(!src);
    void *buf = rt_calloc(1, kasan_buf_sz);
    uassert_false(!buf);

    LOG_I("out-of-bound memcpy test: reading");
    uassert_true(!memcpy(buf, oob_read, kasan_buf_sz));

    LOG_I("out-of-bound memcpy test: writing");
    uassert_true(!memcpy(buf, src, kasan_buf_sz + 1));
}

static void test_strncpy(void)
{
    void *oob_read = rt_malloc(kasan_buf_sz / 2);
    uassert_false(!oob_read);
    void *src = rt_malloc(kasan_buf_sz + 1);
    uassert_false(!src);
    void *buf = rt_calloc(1, kasan_buf_sz);
    uassert_false(!buf);

    LOG_I("out-of-bound strncpy test: reading");
    uassert_true(!!rt_strncpy(buf, oob_read, kasan_buf_sz));

    LOG_I("out-of-bound strncpy test: writing");
    uassert_true(!rt_strncpy(buf, src, kasan_buf_sz + 1));
}

static void _thread_overflow(void *param)
{
    char chunk[kasan_buf_sz];
    for (size_t i = 0; i < kasan_buf_sz; i++)
    {
        chunk[i] = 0;
    }

    uassert_false(strchr(chunk, 'a'));
    return ;
}

struct rt_thread tcb;
#define _PADDING 8192
#define _TST_STK 2048

rt_align(16) static rt_uint8_t _thread_stack[_PADDING + _TST_STK];

static void test_stack_overflow(void)
{
    LOG_I("test stack overflow");

    void *sp = kasan_unpoisoned(_thread_stack + _PADDING, _TST_STK);

    uassert_false(rt_thread_init(
        &tcb,
        "overflow",
        _thread_overflow,
        RT_NULL,
        sp,
        _TST_STK,
        8, 20));

    rt_thread_startup(&tcb);
    rt_thread_mdelay(1000);
    rt_thread_detach(&tcb);
}

static void testcase(void)
{
    UTEST_UNIT_RUN(test_memset);
    UTEST_UNIT_RUN(test_memcpy);
    UTEST_UNIT_RUN(test_strncpy);
    // UTEST_UNIT_RUN(test_stack_overflow);
}

UTEST_TC_EXPORT(testcase, "testcases.libcpu.kasan", utest_tc_init, utest_tc_cleanup, 10);
#endif /* RT_USING_UTEST && ENABLE_VECTOR */
