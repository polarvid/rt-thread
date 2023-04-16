/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#include <rtthread.h>
#include <rthw.h>
#include "arch/aarch64.h"
#include "event-ring.h"
#include "ftrace.h"
#include "internal.h"
#include "mm_page.h"

#include <stdatomic.h>

static struct ftrace_tracer dummy_tracer;

static void _debug_test_fn(char *str)
{
    rt_kputs(str);
}

#ifndef RT_CPUS_NR
#define RT_CPUS_NR 1
#endif

static _Atomic(size_t) count[RT_CPUS_NR * 16];

static rt_notrace
rt_ubase_t _test_handler(void *tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    // const struct ftrace_context*ctx = context;

    // rt_kprintf("message[0x%lx]\n", ftrace_timestamp());
    // rt_kprintf("%s(%p, 0x%lx, 0x%lx, %p)\n", __func__, tracer, pc, ret_addr, context);
    // for (int i = 0; i < FTRACE_REG_CNT; i += 2)
    //     rt_kprintf("%d %p, %p\n", i, ctx->args[i], ctx->args[i + 1]);

    // call counter
    // atomic_fetch_add(&count[rt_hw_cpu_id() << 4], 1);
    return 0;
}

static void _debug_ftrace(void)
{
    extern void _ftrace_entry_insn(void);
    // RT_ASSERT(!_ftrace_patch_code(_ftrace_entry_insn, 0));
    // RT_ASSERT(!_ftrace_patch_code(_ftrace_entry_insn, 1));

    /* init */
    trace_evt_ring_t ring;
    ring = event_ring_create(RT_CPUS_NR * (4ul << 20), sizeof(rt_ubase_t), 4096);

    for (size_t i = 0; i < RT_CPUS_NR; i++)
        for (size_t j = 0; j < (4ul << 20) / 4096; j++)
            ring->rings[i].buftbl[j] = rt_pages_alloc(0);

    // while (1) {
    /* test gen bl */
    ftrace_tracer_init(&dummy_tracer, _test_handler, ring);

    /* test recursion */
    // ftrace_tracer_set_trace(&dummy_tracer, _debug_test_fn);
    // ftrace_tracer_set_trace(&dummy_tracer, _test_handler);

    /* test every functions */
    ftrace_tracer_set_except(&dummy_tracer, NULL, 0);

    /* a dummy instrumentation */
    _debug_test_fn("no tracer\n");

    /* ftrace enabled */
    ftrace_tracer_register(&dummy_tracer);
    rt_kprintf("ftrace enabled\n");
    __asm__ volatile("mov x1, 1");
    __asm__ volatile("mov x2, 2");
    __asm__ volatile("mov x3, 3");
    __asm__ volatile("mov x4, 4");
    __asm__ volatile("mov x5, 5");
    __asm__ volatile("mov x6, 6");
    __asm__ volatile("mov x7, 7");
    __asm__ volatile("mov x8, 8");
    _debug_test_fn("dummy tracer enable\n");

    // void utest_testcase_run(int argc, char** argv);
    // utest_testcase_run(1,0);

    /* ftrace disabled */
    ftrace_tracer_unregister(&dummy_tracer);
    _debug_test_fn("dummy tracer unregistered\n");

    for (size_t i = 0; i < RT_CPUS_NR; i++)
    {
        size_t calltimes = count[i << 4];
        count[i << 4] = 0;
        rt_kprintf("count 0x%lx\n", calltimes);
    }
    // rt_thread_mdelay(100);
    // }

    for (size_t i = 0; i < RT_CPUS_NR; i++)
        for (size_t j = 0; j < (4ul << 20) / 4096; j++)
            rt_pages_free(ring->rings[i].buftbl[j], 0);
    return ;

}
MSH_CMD_EXPORT_ALIAS(_debug_ftrace, ftrace_test, test ftrace feature);
