/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support for RV64
 */
#ifndef __TRACE_RISCV64_H__
#define __TRACE_RISCV64_H__

/**
 * we are following the `RISC-V ABIs Specification, Document Version 1.0',
 * Editors Kito Cheng and Jessica Clarke, RISC-V International, November 2022
 */

/* index to ftrace context registers */
#define FTRACE_REG_A0   0
#define FTRACE_REG_A1   1
#define FTRACE_REG_A2   2
#define FTRACE_REG_A3   3
#define FTRACE_REG_A4   4
#define FTRACE_REG_A5   5
#define FTRACE_REG_A6   6
#define FTRACE_REG_A7   7
#define FTRACE_REG_SP   8
#define FTRACE_REG_FP   9
#define FTRACE_REG_CNT  10

/* order of the length of the entry in ftrace entry table */
#define FTRACE_ENTRY_ORDER 3

#define TRACING_INSN_BYTES 4

/* entries table conversion */
#define ENTRIES_TO_SYM(entry)   ((void *)((rt_ubase_t)(entry) + 5 * 2))
#define SYM_TO_ENTRIES(entry)   ((void *)((rt_ubase_t)(entry) - 5 * 2))

/* FTrace convention */
#define REG_TEMPX       5
#define REG_TRACE_SP    28
#define REG_TRACE_IP    29
#define REG_TRACE_FP    30
#define __REG(num)      x##num
#define _REG(num)       __REG(num)

#define TEMPX           _REG(REG_TEMPX)
#define TRACE_SP        _REG(REG_TRACE_SP)
#define TRACE_IP        _REG(REG_TRACE_IP)
#define TRACE_FP        _REG(REG_TRACE_FP)

#ifndef __ASSEMBLY__
#include <rtthread.h>

rt_inline rt_notrace
void _ftrace_enable_global(void)
{
    return ;
}

rt_inline rt_notrace
rt_ubase_t ftrace_timestamp(void)
{
#if 0
    rt_ubase_t freq;
    rt_ubase_t clock;

    clock = (clock * NANOSECOND_PER_SECOND) / freq;
    return clock;
#endif
    uint64_t cycles;
    __asm__ volatile("rdcycle %0":"=r"(cycles));
    return cycles;
}

#endif /* __ASSEMBLY__ */

#endif /* __TRACE_RISCV64_H__ */
