/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-15     WangXiaoyao  fgraph support
 */

#include <rtthread.h>
#include <rthw.h>
#include "arch/aarch64.h"
#include "ftrace.h"
#include "internal.h"

#include <stdatomic.h>

static struct ftrace_tracer dummy_fgraph;

static int _debug_test_fn2(char *str)
{
    rt_kputs(str);
    return 0xabadcafe;
}

static rt_notrace
rt_ubase_t _test_graph_on_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    // const struct ftrace_context*ctx = context;

    // rt_kprintf("message[0x%lx]\n", ftrace_timestamp());
    // rt_kprintf("%s(%p, 0x%lx, 0x%lx, %p)\n", __func__, tracer, pc, ret_addr, context);
    // for (int i = 0; i < FTRACE_REG_CNT; i += 2)
    //     rt_kprintf("%d %p, %p\n", i, ctx->args[i], ctx->args[i + 1]);

    return 1;
}

static rt_notrace
void _test_graph_on_exit(ftrace_tracer_t tracer, rt_ubase_t stat, void *context)
{
    // const struct ftrace_context*ctx = context;

    // rt_kprintf("message[0x%lx]\n", ftrace_timestamp());
    // rt_kprintf("%s(%p, 0x%lx, %p)\n", __func__, tracer, stat, context);
    // for (int i = 0; i < FTRACE_REG_CNT; i += 2)
    //     rt_kprintf("%d %p, %p\n", i, ctx->args[i], ctx->args[i + 1]);

    return ;
}

static void _debug_fgraph(void)
{
    // while (1) {
    /* test gen bl */
    extern void _ftrace_entry_insn(void);
    // RT_ASSERT(!_ftrace_patch_code(_ftrace_entry_insn, 0));
    // RT_ASSERT(!_ftrace_patch_code(_ftrace_entry_insn, 1));

    /* init */
    ftrace_tracer_init(&dummy_fgraph, _test_graph_on_entry, RT_NULL);
    ftrace_tracer_set_on_exit(&dummy_fgraph, _test_graph_on_exit);

    /* test recursion */
    // ftrace_tracer_set_trace(&dummy_fgraph, _debug_test_fn2);
    // ftrace_tracer_set_trace(&dummy_fgraph, );

    /* test every functions */
    ftrace_tracer_set_except(&dummy_fgraph, NULL, 0);

    /* a dummy instrumentation */
    _debug_test_fn2("1: no tracer\n");

    /* ftrace enabled */
    ftrace_tracer_register(&dummy_fgraph);
    __asm__ volatile("mov x1, 1");
    __asm__ volatile("mov x2, 2");
    __asm__ volatile("mov x3, 3");
    __asm__ volatile("mov x4, 4");
    __asm__ volatile("mov x5, 5");
    __asm__ volatile("mov x6, 6");
    __asm__ volatile("mov x7, 7");
    __asm__ volatile("mov x8, 8");
    int ret = _debug_test_fn2("2: dummy tracer enable\n");
    rt_kprintf("ret val: %x\n", ret);

    void utest_testcase_run(int argc, char** argv);
    utest_testcase_run(1,0);

    /* ftrace disabled */
    ftrace_tracer_unregister(&dummy_fgraph);
    _debug_test_fn2("dummy tracer unregistered\n");

    // rt_thread_mdelay(100);
    // }
    return ;
}
MSH_CMD_EXPORT_ALIAS(_debug_fgraph, fgraph_test, test ftrace feature);
