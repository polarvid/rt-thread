/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */

#define DBG_TAG "tracing.ftrace"
#define DBG_LVL DBG_INFO
#include <rtdbg.h>

#include "../../internal.h"
#include "ksymtbl.h"
#include <opcode.h>
#include <rtdef.h>
#include <rthw.h>

#include <stdatomic.h>
#include <stddef.h>
#include <stdint.h>

extern const void *_ftrace_entry_insn;
extern void mcount(void);

#define INSN_AUIPC(rd, offset) \
    (((offset) << 12) | ((rd) << 7) | 0x17)
#define INSN_JALR(rd, rs, simm12) \
    ((((simm12) & 0x0fff) << 20) | ((rs) << 15) | ((rd) << 7) | 0x67)
/* No support for "C" Standard Extension for Compressed Instructions */
#define INSN_NOP    0x00000013ul
#define INSN_NOP2_C 0x00010001ul
#define INSN_NOP2   ((INSN_NOP << 32) | INSN_NOP)
#define INSN_NOP4_C ((INSN_NOP2_C << 32) | INSN_NOP2_C)

rt_notrace rt_inline
uint32_t _insn_gen_jalr(void *oldpc, void *newpc)
{
    /**
     * Calculate the offset between oldpc and newpc,
     * Its offset from the address of this instruction, in the range +2KB
     */
    int32_t offset = ((size_t)newpc - (size_t)oldpc) & 0x0fff;
    uint32_t jalr = INSN_JALR(REG_TRACE_IP, REG_TEMPX, offset);
    return jalr;
}
/* pc + off32 = pc + off[31:12] + off[11:0] */
rt_notrace rt_inline
uint32_t _insn_gen_auipc(void *oldpc, void *newpc)
{
    /**
     * Calculate the offset between oldpc and newpc,
     * Its offset from the address of this instruction, in the range +/-2GB
     */
    int32_t diff = (size_t)newpc - (size_t)oldpc;
    int32_t offset = diff >> 12;
    if (diff & 0x0800) {
        offset += 1;
    }
    uint32_t auipc = INSN_AUIPC(REG_TEMPX, offset);
    return auipc;
}

/**
 * we don't want to mess up with endian, hence,
 * the code is patched one by one and synchronized in defined way.
 * Besides, the routine is suitable for dprobe also.
 */
rt_inline rt_notrace
int _patch_code32(void *entry, uint32_t new, uint32_t *old)
{
    int cmp;
    _Atomic(uint32_t) *pc = entry;

    cmp = atomic_compare_exchange_strong_explicit(pc, old, new,
        memory_order_acq_rel, memory_order_acquire);

    return !cmp;
}

/* bypass half-word atomic operation */
rt_inline rt_notrace
int _patch_code16(void *entry, uint16_t new, uint16_t *old)
{
    int cmp;
    _Atomic(uint32_t) *word_ptr = (void *)((rt_ubase_t)entry & ~0x3);
    uint32_t old32;
    uint32_t new32;
    uint32_t old16;

    old32 = atomic_load(word_ptr);
    old16 = ((old32 >> ((rt_ubase_t)entry & 2) * 8) & 0x0000ffff);
    if (old16 != *old)
    {
        *old = old16;
        return -1;
    }

    new32 = (old32 & ~(0xffff << ((rt_ubase_t)entry & 2) * 8)) | (new << ((rt_ubase_t)entry & 2) * 8);
    cmp = atomic_compare_exchange_strong_explicit(word_ptr, &old32, new32, memory_order_acq_rel, memory_order_acquire);

    return !cmp;
}

/* entry is floored to 4-byte bound */
#define ENTRY_FLOOR(entry)  ((uint32_t *)(((rt_ubase_t)(entry) + 3) & ~3))

rt_notrace
int ftrace_arch_patch_code(void *entry, rt_bool_t enabled)
{
    int err;
    uint32_t *insn = ENTRY_FLOOR(entry);
    if (enabled)
    {
        uint32_t new = _insn_gen_auipc(insn, &mcount);
        uint32_t old = INSN_NOP;
        err = _patch_code32(insn, new, &old);

        /* for RISC-V compressed instruction */
        if (err && old == INSN_NOP2_C)
            err = _patch_code32(insn, new, &old);

        if (!err)
        {
            new = _insn_gen_jalr(insn, &mcount);
            insn++;
            err = _patch_code32(insn, new, &old);
        }
    }
    else
    {
        /* noted the ordered here is different */
        uint32_t new = INSN_NOP;
        uint32_t old = _insn_gen_jalr(insn, &mcount);
        err = _patch_code32(insn + 1, new, &old);

        if (!err)
        {
            old = _insn_gen_auipc(insn, &mcount);
            err = _patch_code32(insn, new, &old);
        }
    }

    if (!err)
    {
        rt_hw_cpu_icache_ops(RT_HW_CACHE_INVALIDATE, entry, 8);
    }
    else
    {
        RT_ASSERT(0 && "Should NEVER fail");
    }
    return 0;
}

#define SESSION_PATCH_STEP   (sizeof(void *)/sizeof(uint16_t))
rt_inline rt_notrace
int _hook_session(void *hook_point, uint64_t new, uint64_t old)
{
    int retval;
    uint16_t *loc = hook_point;
    uint16_t *loc_end = loc + SESSION_PATCH_STEP;
    uint16_t old_value;

    for ( ; loc < loc_end; loc++)
    {
        /**
         * the `old' is a 64-bit variable, which is not possible to pass to _patch_code16
         * which requires a reference to a 32-bit variable.
         */
        old_value = (uint16_t)old;
        retval = _patch_code16(loc, (uint16_t)new, &old_value);
        if (retval != 0)
            break;

        new >>= sizeof(*loc) * 8;
        old >>= sizeof(*loc) * 8;
    }
    return retval;
}

rt_notrace
int ftrace_arch_hook_session(void *entry, ftrace_session_t session, rt_bool_t enabled)
{
    int err;
    uint64_t nopnop = INSN_NOP4_C;
    /* relocate to 2-byte backward fn entry */
    uint16_t *hook_point = (uint16_t *)ENTRY_FLOOR(entry) - 1 - (sizeof(void *)/sizeof(uint16_t));


    if (enabled)
    {
        uint16_t old16 = (uint16_t)INSN_NOP2_C;
        if ((rt_ubase_t)entry & 0x0002)
            _patch_code16(hook_point - 1, 0, &old16);
        else
            _patch_code16(hook_point + 4, 0, &old16);
        RT_ASSERT(old16 == (uint16_t)INSN_NOP2_C || old16 == 0);
        err = _hook_session(hook_point, (uint64_t)session, nopnop);
    }
    else
    {
        err = _hook_session(hook_point, nopnop, (uint64_t)session);
    }
    return err;
}

rt_notrace
ftrace_session_t ftrace_arch_get_session(void *entry)
{
    uint16_t *loc = (uint16_t *)(ENTRY_FLOOR(entry) - 2 - sizeof(ftrace_session_t));
    rt_ubase_t session = 0;

    for (size_t i = 0; i < SESSION_PATCH_STEP; i++)
    {
        session <<= sizeof(*loc) * 8;
        session |= loc[SESSION_PATCH_STEP - 1 - i];

    }
    return (void *)session;
}

#if 0
rt_notrace
rt_err_t ftrace_arch_put_context(ftrace_session_t session, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_arch_context_t context)
{
    rt_err_t rc;
    rc = ftrace_vice_stack_push_word(context, ret_addr);
    return rc;
}

rt_notrace
void ftrace_arch_pop_context(ftrace_session_t *psession, rt_ubase_t *ppc, rt_ubase_t *pret_addr, ftrace_arch_context_t context)
{
    *pret_addr = ftrace_vice_stack_pop_word(context);
}
#else

#ifndef DEBUG
// #define DEBUG
#endif

#define CHECKSUM

rt_notrace
rt_err_t ftrace_arch_put_context(ftrace_session_t session, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_arch_context_t context)
{
    rt_ubase_t implicit_retval = context->args[0];  /* RISC-V ABI */
#ifdef DEBUG
    /* event format print */
    int enable = session->enable;
    session->enabled = 0;

    int height = ((ftrace_host_data_t)rt_thread_self_sync()->ftrace_host_session)->vice_sp;

    char symbol_name[32];
    symbol_name[0] = 0;
    // ksymtbl_find_by_address((void *)pc, 0, symbol_name, sizeof(symbol_name), 0, 0);
    // rt_kprintf("push [height %d] [thread %s] [pc 0x%x:%s]", height, rt_thread_self_sync()->parent.name, pc, symbol_name);
    // ksymtbl_find_by_address((void *)ret_addr, 0, symbol_name, sizeof(symbol_name), 0, 0);
    // rt_kprintf(" [sp 0x%x] [ret_addr 0x%x:%s]\n", context->args[FTRACE_REG_SP], ret_addr, symbol_name);
    static long count = 64 * 1024;
    count --;
    if (count < 0)
        rt_kprintf("push [height %d] [thread %s] [pc 0x%x] [sp 0x%lx] [ret_addr 0x%x]\n", height, rt_thread_self_sync()->parent.name, pc, context->args[FTRACE_REG_SP], ret_addr);

    session->enabled = enable;
#endif /* DEBUG */

#ifdef CHECKSUM
    /* the push counter */
    rt_ubase_t sp = context->args[FTRACE_REG_SP];
    /* checksum */
    rt_ubase_t check = pc + ret_addr + implicit_retval + (rt_ubase_t)session;
    sp &= 0xffffffff;
    sp |= check << 32;
#endif /* CHECKSUM */

    int push_counter = 0;
    rt_ubase_t values_to_push[] = {pc, ret_addr, implicit_retval, (rt_ubase_t)session};
    int num_values = sizeof(values_to_push) / sizeof(values_to_push[0]);

    for (int i = 0; i < num_values; i++)
    {
        if (ftrace_vice_stack_push_word(context, values_to_push[i]) != 0)
        {
            for (int j = 0; j < push_counter; j++)
            {
                ftrace_vice_stack_pop_word(context);
            }
            return -RT_ERROR;
        }
        push_counter++;
    }

#ifdef CHECKSUM
    ftrace_vice_stack_push_word(context, sp);
#endif /* DEBUG */

    return RT_EOK;
}

rt_notrace
void ftrace_arch_pop_context(ftrace_session_t *psession, rt_ubase_t *ppc, rt_ubase_t *pret_addr, ftrace_arch_context_t context)
{
    ftrace_session_t session;
    rt_ubase_t ret_addr, pc;

#ifdef CHECKSUM
    rt_ubase_t sp = ftrace_vice_stack_pop_word(context);

    rt_ubase_t old_check = sp >> 32;
    sp &= 0xffffffff;
    if (sp != context->args[FTRACE_REG_SP])
    {
        session->enabled = 0;
        dbg_log(DBG_ERROR, "%s: invalid sp\n", __func__);
        while (1) ;
    }
#endif

    *psession = session = (ftrace_session_t)ftrace_vice_stack_pop_word(context);
    /* 0 and 1 for explicit return value, 2 for implicit return value by reference */
    context->args[2] = ftrace_vice_stack_pop_word(context);
    *pret_addr = ret_addr = ftrace_vice_stack_pop_word(context);
    *ppc = pc = ftrace_vice_stack_pop_word(context);

#ifdef CHECKSUM
    /* checksum */
    int enable = session->enabled;
    session->enabled = 0;

    rt_ubase_t check = (rt_ubase_t)session + context->args[2] + ret_addr + pc;
    rt_ubase_t level = rt_hw_interrupt_disable();
    if ((check & 0xffffffff) != old_check)
    {
        int height = ((ftrace_host_data_t)rt_thread_self_sync()->ftrace_host_session)->vice_sp;
        rt_kprintf("pop [height %d] [thread %s] [pc 0x%lx] [sp 0x%lx] [ret_addr 0x%lx]\n", height, rt_thread_self_sync()->parent.name, pc, sp, ret_addr);
        rt_kprintf("session 0x%lx, a2 0x%lx, ret_addr 0x%lx, pc 0x%lx\n", (rt_ubase_t)session, context->args[2], ret_addr, pc);
        dbg_log(DBG_ERROR, "%s: vice-stack data corruption detected\n", __func__);
        while (1) ;
    }
    rt_hw_interrupt_enable(level);
    session->enabled = enable;
#endif /* CHECKSUM */
}

#endif/* one by one */
