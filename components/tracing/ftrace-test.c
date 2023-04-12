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
#include "arch/aarch64.h"
#include "ftrace.h"
#include "internal.h"

static struct ftrace_tracer dummy_tracer;

static void _debug_test_fn(char *str)
{
    rt_kputs(str);
}

static int handler(void *tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    const struct ftrace_context*ctx = context;

    rt_kprintf("message[0x%lx]\n", ftrace_timestamp());
    rt_kprintf("%s(%p, 0x%lx, 0x%lx, %p)\n", __func__, tracer, pc, ret_addr, context);
    for (int i = 0; i < FTRACE_REG_CNT; i += 2)
        rt_kprintf("%d %p, %p\n", i, ctx->args[i], ctx->args[i + 1]);

    return 0;
}

static void _debug_ftrace(void)
{
    /* test gen bl */
    extern void _ftrace_entry_insn(void);
    // RT_ASSERT(!_ftrace_patch_code(_ftrace_entry_insn, 0));
    // RT_ASSERT(!_ftrace_patch_code(_ftrace_entry_insn, 1));

    /* init */
    ftrace_tracer_init(&dummy_tracer, handler, RT_NULL);
    ftrace_tracer_set_trace(&dummy_tracer, _debug_test_fn);

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

    /* ftrace disabled */
    ftrace_tracer_unregister(&dummy_tracer);
    _debug_test_fn("dummy tracer unregistered\n");

    return ;

}
MSH_CMD_EXPORT_ALIAS(_debug_ftrace, ftrace_test, test ftrace feature);
