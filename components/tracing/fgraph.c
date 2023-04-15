/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-04-08     WangXiaoyao  fgraph support
 */

#include "ftrace.h"

#include <rtthread.h>

static rt_notrace
rt_ubase_t handler(void *tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    // const struct ftrace_context*ctx = context;

    // rt_kprintf("message[0x%lx]\n", ftrace_timestamp());
    // rt_kprintf("%s(%p, 0x%lx, 0x%lx, %p)\n", __func__, tracer, pc, ret_addr, context);
    // for (int i = 0; i < FTRACE_REG_CNT; i += 2)
    //     rt_kprintf("%d %p, %p\n", i, ctx->args[i], ctx->args[i + 1]);

    return 0;
}

int fgraph_create()
{
    ftrace_tracer_t tracer;
    tracer = rt_malloc(sizeof(*tracer));
    if (!tracer)
        return -RT_ENOMEM;

    ftrace_tracer_init(tracer, handler, RT_NULL);

    return 0;
}
