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

do_ftrace:
    .xword  dummy_ftrace
dummy_ftrace:
    mov     TEMPX, lr
    mov     lr, TRACE_LR
    br      TEMPX

.global mcount
/* name convention follow gprof */
mcount:
    /* reduce conditional branching */
    adrp    TEMPX, do_ftrace
    add     TEMPX, TEMPX, :lo12:do_ftrace
    ldr     TEMPX, [TEMPX]
    br      TEMPX
    /* normally, we will never reach here */
    ret

/**
 * the real ftrace implementation
 *
 * imaginary blocks before _do_ftrace:
 * mov  TRACE_LR, lr
 * bl   _do_ftrace
 */
.local _do_ftrace
_do_ftrace:
    /* setup context of trace point */
    mov     TRACE_SP, sp
    sub     TRACE_IP, lr, #4
    mov     TRACE_FP, fp

    /* simulate the frame of trace point */
    stp     TRACE_FP, TRACE_LR, [sp, -16]!
    mov     fp, sp
    /* simulate the frame of _do_ftrace */
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

    /* setup the ops from the instrument buffer */
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

    mov     x1, TRACE_IP    /* PC */
    mov     x2, TRACE_LR    /* return address */
    mov     x3, sp

    bl      ftrace_trace_entry

    /* restore the context and return */
    ldp     x0, x1, [sp, #OFFTO(FTRACE_REG_X0)]
    ldp     x2, x3, [sp, #OFFTO(FTRACE_REG_X2)]
    ldp     x4, x5, [sp, #OFFTO(FTRACE_REG_X4)]
    ldp     x6, x7, [sp, #OFFTO(FTRACE_REG_X6)]
    ldp     x8, xzr, [sp, #OFFTO(FTRACE_REG_X8)]
    ldp     TRACE_SP, TRACE_IP, [sp, #OFFTO(FTRACE_REG_SP)]
    ldp     TRACE_FP, TRACE_LR, [sp, #OFFTO(FTRACE_REG_FP)]
    add     sp, sp, FTRACE_REG_CNT * REGSZ

    /* rewind the frame of _do_ftrace */
    ldp     fp, lr, [sp], 16
    mov     TEMPX, lr

    /**
     * rewind the frame of trace point
     * noted that we also restore ip & sp meanwhile
     */
    ldp     fp, lr, [sp], 16
    br      TEMPX

.global _ftrace_enable_global
_ftrace_enable_global:
    /* *do_ftrace = &_do_ftrace */
    adrp    x0, do_ftrace
    add     x0, x0, :lo12:do_ftrace
    adrp    x1, _do_ftrace
    add     x1, x1, :lo12:_do_ftrace
    str     x1, [x0]
    ret

.global _ftrace_disable_global
_ftrace_disable_global:
    /* *do_ftrace = &dummy_ftrace */
    adrp    x0, do_ftrace
    add     x0, x0, :lo12:do_ftrace
    adrp    x1, dummy_ftrace
    add     x1, x1, :lo12:dummy_ftrace
    str     x1, [x0]
    ret

.global _ftrace_entry_insn
.balign 8
_ftrace_entry_insn:
    mov     TRACE_LR, lr
    bl      mcount
    nop
    nop
