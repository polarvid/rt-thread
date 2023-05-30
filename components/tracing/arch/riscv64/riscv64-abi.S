/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support for RV64
 */
#include "riscv64.h"
#include <cpuport.h>

#define REGSZ           (8)
#define OFFTO(idx)      ((idx) * REGSZ)

.global _trace_exit
_trace_exit:
    mv      TRACE_SP, sp

    addi    sp, sp, -FTRACE_REG_CNT * REGSZ
    STORE   a0, OFFTO(FTRACE_REG_A0)(sp)
    STORE   a1, OFFTO(FTRACE_REG_A1)(sp)
    STORE   TRACE_SP, OFFTO(FTRACE_REG_SP)(sp)
    STORE   s0, OFFTO(FTRACE_REG_FP)(sp)

    mv      a0, sp
    call    ftrace_trace_exit
    mv      ra, a0

    LOAD    a0, OFFTO(FTRACE_REG_A0)(sp)
    LOAD    a1, OFFTO(FTRACE_REG_A1)(sp)
    addi    sp, sp, FTRACE_REG_CNT * REGSZ

    ret

.local _dummy_mcount
_dummy_mcount:
    jr      TRACE_IP

.global mcount
/* name convention following gprof */
mcount:
    // j       _dummy_mcount
    /**
     * Fake a call frame for trace point.
     * Because the call is made apparently so that caller cannot notice,
     * the callee have to save & restore the frame for caller instead.
     * the previous 2 instruction:
     *
     * auipc TEMPX, off[31:12]
     * jalr TRACE_IP, TEMPX, off[11:0]
     */
    mv      TRACE_SP, sp
    mv      TRACE_FP, s0
    mv      TRACE_RA, ra

    /* simulate the frame of trace point */
    addi    sp, sp, -16
    STORE   TRACE_RA, 8(sp)
    STORE   s0, 0(sp)
    addi    s0, sp, 16

    /* build the frame for mcount */
    addi    sp, sp, -16
    STORE   TRACE_IP, 8(sp)
    STORE   s0, 0(sp)
    addi    s0, sp, 16

    addi    TRACE_IP, TRACE_IP, -4

    /* allocate and setup the context */
    addi    sp, sp, -FTRACE_REG_CNT * REGSZ
    STORE   a0, OFFTO(FTRACE_REG_A0)(sp)
    STORE   a1, OFFTO(FTRACE_REG_A1)(sp)
    STORE   a2, OFFTO(FTRACE_REG_A2)(sp)
    STORE   a3, OFFTO(FTRACE_REG_A3)(sp)
    STORE   a4, OFFTO(FTRACE_REG_A4)(sp)
    STORE   a5, OFFTO(FTRACE_REG_A5)(sp)
    STORE   a6, OFFTO(FTRACE_REG_A6)(sp)
    STORE   a7, OFFTO(FTRACE_REG_A7)(sp)
    STORE   TRACE_SP, OFFTO(FTRACE_REG_SP)(sp)
    STORE   TRACE_FP, OFFTO(FTRACE_REG_FP)(sp)

    /* prepare arguments for entry */
    addi    a0, TRACE_IP, -(6 + 8)
    call    ftrace_arch_fetch_tracer
    mv      a1, TRACE_IP
    mv      a2, TRACE_RA
    mv      a3, sp
    call    ftrace_trace_entry

    /* reserve the return value */
    mv      TEMPX, a0

    /* restore arguments */
    LOAD    a0, OFFTO(FTRACE_REG_A0)(sp)
    LOAD    a1, OFFTO(FTRACE_REG_A1)(sp)
    LOAD    a2, OFFTO(FTRACE_REG_A2)(sp)
    LOAD    a3, OFFTO(FTRACE_REG_A3)(sp)
    LOAD    a4, OFFTO(FTRACE_REG_A4)(sp)
    LOAD    a5, OFFTO(FTRACE_REG_A5)(sp)
    LOAD    a6, OFFTO(FTRACE_REG_A6)(sp)
    LOAD    a7, OFFTO(FTRACE_REG_A7)(sp)
    addi    sp, sp, FTRACE_REG_CNT * REGSZ

    /**
     * rewind the frame of _do_ftrace and then
     * destroy the frame of simulated trace point.
     * This looks like a normal subroutine return, except that
     * we have to recover the fp, lr from the faked frame
     * mentioned above
     */
    LOAD    TRACE_IP, 8(sp)
    addi    sp, sp, 16

    LOAD    s0, 0(sp)
    /* should trace exit ? */
    beqz    TEMPX, 1f
    la      ra, _trace_exit
    j       2f

1:
    LOAD    ra, 8(sp)
2:
    addi    sp, sp, 16
    jr      TRACE_IP

/**
 * @brief load tracer from the trace point in a little endian order
 *
 * @param a0 is the address of hook point
 */
.global ftrace_arch_fetch_tracer
ftrace_arch_fetch_tracer:
    lhu     a3,6(a0)
    lhu     a4,4(a0)
    lhu     a5,2(a0)
    slli    a3,a3,16
    or      a4,a4,a3
    lhu     a0,0(a0)
    slli    a4,a4,16
    or      a5,a5,a4
    slli    a5,a5,16
    or      a0,a0,a5
    ret
