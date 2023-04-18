/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#ifndef __TRACE_AARCH64_H__
#define __TRACE_AARCH64_H__

/* index to ftrace context registers */
#define FTRACE_REG_X0   0
#define FTRACE_REG_X1   1
#define FTRACE_REG_X2   2
#define FTRACE_REG_X3   3
#define FTRACE_REG_X4   4
#define FTRACE_REG_X5   5
#define FTRACE_REG_X6   6
#define FTRACE_REG_X7   7
#define FTRACE_REG_X8   8
#define FTRACE_TRACER   9
#define FTRACE_REG_SP   10
#define FTRACE_REG_IP   11
#define FTRACE_REG_FP   12
#define FTRACE_REG_LR   13
#define FTRACE_REG_CNT  14

#define FTRACE_ENTRY_ORDER 3

#define TRACING_INSN_BYTES 4

#ifndef __ASSEMBLY__

#include <rtthread.h>
#include <sys/time.h>

#define ENTRIES_TO_SYM(entry)   ((void *)((rt_ubase_t)(entry) + 3 * 4))
#define SYM_TO_ENTRIES(entry)   ((void *)((rt_ubase_t)(entry) - 3 * 4))
#define FTRACE_PC_TO_SYM(pc)    ((void *)((rt_ubase_t)(pc) - 4))

struct ftrace_context {
    rt_ubase_t args[FTRACE_REG_CNT];
};

rt_notrace rt_inline
rt_ubase_t ftrace_timestamp(void)
{
    rt_ubase_t freq;
    rt_ubase_t clock;

    __asm__ volatile("mrs %0, cntfrq_el0":"=r"(freq));
    __asm__ volatile("mrs %0, cntpct_el0":"=r"(clock));
    __asm__ volatile("isb":::"memory");

    clock = (clock * NANOSECOND_PER_SECOND) / freq;
    return clock;
}

#else
// #define ARCH_FTRACE_INSTRUMENT __asm__ volatile("ldr lr, [fp, 8]\nnop\nnop\nnop\nmov x10, lr\nbl mcount")
.macro ARCH_FTRACE_INSTRUMENT

.endm

#endif

#endif /* __TRACE_AARCH64_H__ */
