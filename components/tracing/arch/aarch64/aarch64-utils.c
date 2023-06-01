/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#include "../../internal.h"
#include <rtdef.h>

#include <stdatomic.h>
#include <stddef.h>
#include <rthw.h>

extern const void *_ftrace_entry_insn;
extern void mcount(void);

#define MOV_TEMPX_LR    (0)
#define BL_MCOUNT       (1)
#define NOP             (2)
#define INSN(idx)       (((uint32_t *)&_ftrace_entry_insn)[idx])

rt_inline rt_notrace
uint32_t _insn_gen_bl(void *oldpc, void *newpc)
{
    /**
     * Calculate the offset between oldpc and newpc,
     * Its offset from the address of this instruction, in the range +/-128MB
     */
    ptrdiff_t offset = newpc - oldpc;
    uint32_t instruction = 0x94000000 | ((offset >> 2) & 0x03ffffff);
    return instruction;
}

/**
 * we don't want to mess up with endian, hence,
 * the code is patched one by one and synchronized in defined way.
 * Besides, the routine is suitable for dprobe also.
 */
rt_notrace
static int _patch_code(void *entry, uint32_t new, uint32_t old)
{
    uint32_t expected = old;
    _Atomic(uint32_t) *pc = entry;

    atomic_compare_exchange_strong_explicit(pc, &expected, new,
        memory_order_acq_rel, memory_order_acquire);

    if (expected == old)
        return 0;
    else
        return -1;
}

rt_notrace
int ftrace_arch_patch_code(void *entry, rt_bool_t enabled)
{
    int err;
    uint32_t *insn = entry;
    if (enabled)
    {
        uint32_t new = INSN(MOV_TEMPX_LR);
        uint32_t old = INSN(NOP);
        err = _patch_code(insn, new, old);

        if (!err)
        {
            insn++;
            new = _insn_gen_bl(insn, &mcount);
            err = _patch_code(insn, new, old);
        }
    }
    else
    {
        /* noted the ordered here is different */
        uint32_t new = INSN(NOP);
        uint32_t old = _insn_gen_bl(insn, &mcount);
        err = _patch_code(insn + 1, new, old);

        if (!err)
        {
            old = INSN(MOV_TEMPX_LR);
            err = _patch_code(insn, new, old);
        }
    }

    if (!err)
    {
        rt_hw_cpu_icache_ops(RT_HW_CACHE_INVALIDATE, entry, 8);
    }
    return err;
}

rt_notrace
static int _hook_tracer(void *entry, uint64_t new, uint64_t old)
{
    uint64_t expected = old;
    _Atomic(uint64_t) *loc = entry;

    atomic_compare_exchange_strong_explicit(loc, &expected, new,
        memory_order_acq_rel, memory_order_acquire);

    if (expected == old)
        return 0;
    else
        return -1;
}

rt_notrace
int ftrace_arch_hook_session(void *entry, ftrace_session_t session, rt_bool_t enabled)
{
    int err;
    uint64_t nopnop = ((uint64_t *)&_ftrace_entry_insn)[1];

    /* relocate to first 8 byte aligned address before entry */
    entry -= 8;
    entry = (void *)((uint64_t)entry & ~0x7);

    if (enabled)
        err = _hook_tracer(entry, (uint64_t)session, nopnop);
    else
        err = _hook_tracer(entry, nopnop, (uint64_t)session);
    return err;
}

rt_notrace
ftrace_session_t ftrace_arch_get_session(void *entry)
{
    entry -= 8;
    return *(ftrace_session_t *)((uint64_t)entry & ~0x7);
}

rt_notrace
static uint16_t get_checksum(rt_ubase_t *array, int array_size)
{
    uint32_t checksum = 0;

    /* Iterate through the array and add each 64-bit value to the checksum */
    for (int i = 0; i < array_size; i++)
    {
        checksum += (array[i] & 0xFFFF) + ((array[i] >> 16) & 0xFFFF) + ((array[i] >> 32) & 0xFFFF) + ((array[i] >> 48) & 0xFFFF);
    }

    /* Fold the 32-bit checksum to 16 bits */
    checksum = (checksum & 0xFFFF) + (checksum >> 16);

    /* If there is a carry, add it to the checksum */
    if (checksum > 0xFFFF)
    {
        checksum = (checksum & 0xFFFF) + 1;
    }

    return (uint16_t)checksum;
}

rt_notrace
static void panic(const char *func, long line)
{
    int panic = 1;
    rt_hw_interrupt_disable();
    while (panic);
}

#define CHECKSUM

rt_notrace
rt_err_t ftrace_arch_push_context(ftrace_session_t session, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context)
{
    int push_counter = 0;
    rt_ubase_t values_to_push[] = {pc, ret_addr, (rt_ubase_t)session};
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
    rt_ubase_t array[] = {pc, ret_addr, (rt_ubase_t)session};
    rt_ubase_t checksum = get_checksum(array, sizeof(array)/sizeof(array[0]));

    rt_ubase_t sp = context->args[FTRACE_REG_SP];
    sp &= 0x0000ffffffffffff;
    sp |= checksum << 48;
    ftrace_vice_stack_push_word(context, sp);
#endif /* CHECKSUM */

    return RT_EOK;
}

rt_notrace
void ftrace_arch_pop_context(ftrace_session_t *psession, rt_ubase_t *ppc, rt_ubase_t *pret_addr, ftrace_context_t context)
{
    ftrace_session_t session;
    rt_ubase_t pc, ret_addr;
#ifdef CHECKSUM
    rt_ubase_t sp = ftrace_vice_stack_pop_word(context);

    rt_ubase_t old_check = sp >> 48;
    sp |= 0xffff000000000000;
    if (sp != context->args[FTRACE_REG_SP])
        panic(__func__, __LINE__);
#endif

    *psession = session = (ftrace_session_t)ftrace_vice_stack_pop_word(context);
    *pret_addr = ret_addr = ftrace_vice_stack_pop_word(context);
    *ppc = pc = ftrace_vice_stack_pop_word(context);

#ifdef CHECKSUM
    rt_ubase_t array[] = {pc, ret_addr, (rt_ubase_t)session};
    rt_ubase_t checksum = get_checksum(array, sizeof(array)/sizeof(array[0]));
    if (checksum != old_check)
        panic(__func__, __LINE__);
#endif
}
