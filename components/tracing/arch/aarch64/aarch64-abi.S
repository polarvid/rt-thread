/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#include "aarch64.h"

/* It is safe to clobber these registers by AAPCS64 */
#define TEMPX           x9
#define TRACERX         x9
#define RETVALX         x10

/**
 * it's safe to reuse x9, because the implementation
 * guarantee that sp will not be modified until we migrate
 * the trace point's sp to TRACE_SP.
 */
#define TRACE_SP        x9
#define TRACE_IP        x11
#define TRACE_FP        x12
#define TRACE_LR        x10
/* register size in bytes */
#define REGSZ           (8)
/* offset to the register reference by index */
#define OFFTO(index)    ((index) * 8)

.local _trace_exit
_trace_exit:
    sub     sp, sp, FTRACE_REG_CNT * REGSZ
    stp     x0, x1, [sp, #OFFTO(FTRACE_REG_X0)]
    stp     x2, x3, [sp, #OFFTO(FTRACE_REG_X2)]
    stp     x4, x5, [sp, #OFFTO(FTRACE_REG_X4)]
    stp     x6, x7, [sp, #OFFTO(FTRACE_REG_X6)]

    /* restore session of caller */
    mov     x0, sp
    bl      ftrace_trace_exit
    mov     lr, x0

    ldp     x0, x1, [sp, #OFFTO(FTRACE_REG_X0)]
    ldp     x2, x3, [sp, #OFFTO(FTRACE_REG_X2)]
    ldp     x4, x5, [sp, #OFFTO(FTRACE_REG_X4)]
    ldp     x6, x7, [sp, #OFFTO(FTRACE_REG_X6)]
    add     sp, sp, FTRACE_REG_CNT * REGSZ
    ret

.global mcount
/* name convention following gprof */
mcount:

/**
 * the real ftrace implementation
 *
 * imaginary blocks before _do_ftrace:
 * mov  TRACE_LR, lr
 * bl   _do_ftrace
 */
.local _do_ftrace
_do_ftrace:
    /**
     * Fake a call frame for trace point.
     * Because the call is made apparently so that caller cannot notice,
     * the callee have to save & restore the frame for caller instead.
     */
    mov     TRACE_SP, sp
    sub     TRACE_IP, lr, #4
    mov     TRACE_FP, fp

    /* simulate the frame of trace point */
    stp     TRACE_FP, TRACE_LR, [sp, -16]!
    mov     fp, sp
    /* the frame of _do_ftrace */
    stp     fp, lr, [sp, -16]!
    mov     fp, sp

    /* save the context for ftrace */
    sub     sp, sp, FTRACE_REG_CNT * REGSZ
    stp     x0, x1, [sp, #OFFTO(FTRACE_REG_X0)]
    stp     x2, x3, [sp, #OFFTO(FTRACE_REG_X2)]
    stp     x4, x5, [sp, #OFFTO(FTRACE_REG_X4)]
    stp     x6, x7, [sp, #OFFTO(FTRACE_REG_X6)]
    stp     x8, xzr, [sp, #OFFTO(FTRACE_REG_X8)]

    stp     TRACE_SP, TRACE_IP, [sp, #OFFTO(FTRACE_REG_SP)]
    stp     TRACE_FP, TRACE_LR, [sp, #OFFTO(FTRACE_REG_FP)]

    /* retrieve the ops from the instrument points */
    bic     x0, lr, #0x7
    ldr     x0, [x0, #-0x10]
    /* nop,nop? reduce memory access */
    mov     x1, 8223
    movk    x1, 0xd503, lsl 16
    movk    x1, 0x201f, lsl 32
    movk    x1, 0xd503, lsl 48
    cmp     x0, x1
    /* prepare parameters for ftrace_trace_entry */
    csel    x0, x0, xzr, ne
    str     x0, [sp, #OFFTO(FTRACE_TRACER)]

    mov     x1, TRACE_IP    /* PC */
    mov     x2, TRACE_LR    /* return address */
    mov     x3, sp

    bl      ftrace_trace_entry
    cmp     x0, xzr

    /* restore the context and return */
    ldp     x0, x1, [sp, #OFFTO(FTRACE_REG_X0)]
    ldp     x2, x3, [sp, #OFFTO(FTRACE_REG_X2)]
    ldp     x4, x5, [sp, #OFFTO(FTRACE_REG_X4)]
    ldp     x6, x7, [sp, #OFFTO(FTRACE_REG_X6)]
    ldp     x8, xzr, [sp, #OFFTO(FTRACE_REG_X8)]
    add     sp, sp, FTRACE_REG_CNT * REGSZ

    /**
     * rewind the frame of _do_ftrace and then
     * destroy the frame of simulated trace point.
     * This looks like a normal subroutine return, except that
     * we have to recover the fp, lr from the faked frame
     * mentioned above
     */
    ldp     fp, TEMPX, [sp], 16
    beq     1f

    ldr     lr, =_trace_exit
    ldp     fp, xzr, [sp], 16
    b       2f

1:
    ldp     fp, lr, [sp], 16
2:
    br      TEMPX

.global _tracer_dummy
_tracer_dummy:
_tracer_dummy:
    sub     sp, sp, #32
    str     x0, [sp, 24]
    str     x1, [sp, 16]
    str     x2, [sp, 8]
    str     x3, [sp]
    mov     w0, 0
    add     sp, sp, 32
    ret

.global _ftrace_entry_insn
.balign 8
_ftrace_entry_insn:
    mov     TRACE_LR, lr
    bl      mcount
    nop
    nop
