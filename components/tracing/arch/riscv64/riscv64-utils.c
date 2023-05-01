/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#include "../../ftrace.h"
#include <opcode.h>
#include <rtdef.h>

#include <stdatomic.h>
#include <stddef.h>
#include <rthw.h>
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
     * Its offset from the address of this instruction, in the range +/-2KB
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
    int32_t offset = ((size_t)newpc >> 12) - ((size_t)oldpc >> 12);
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
    int16_t old16;

    old32 = atomic_load(word_ptr);
    old16 = (uint16_t)((old32 >> ((rt_ubase_t)entry & 2) * 8) & 0xffff);
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
        uint32_t old = _insn_gen_jalr(insn + 1, &mcount);
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
    void *hook_point = (char *)ENTRY_FLOOR(entry) - 2 - sizeof(hook_point);

    if (enabled)
        err = _hook_session(hook_point, (uint64_t)session, nopnop);
    else
        err = _hook_session(hook_point, nopnop, (uint64_t)session);
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
