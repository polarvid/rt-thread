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
#include "arch/aarch64/aarch64.h"
#include "ftrace.h"
#include "rtdef.h"
#include "rtthread.h"

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
static rt_base_t get_checksum(rt_base_t *array, int array_size)
{
    rt_base_t checksum = 0;

    for (int i = 0; i < array_size; i++)
    {
        checksum += array[i];
    }

    return checksum;
}

#define CHECKSUM

rt_notrace
rt_err_t ftrace_arch_put_context(ftrace_context_t context, ftrace_session_t session)
{
    rt_err_t rc;
    rt_base_t *buffer;
    ftrace_arch_context_t arch = context->arch_context;
    const rt_ubase_t trace_sp = arch->args[FTRACE_REG_SP];
    size_t num_words = session->data_buf_num_words;

#ifdef CHECKSUM
    num_words += 1;
#endif

    /* save the context that is needed by exit tracer in vice stack */
    buffer = ftrace_vice_stack_push_frame(context, session, trace_sp, num_words);

    if (buffer)
    {
        rc = RT_EOK;
#ifdef CHECKSUM
        rt_base_t checksum_source[] = {context->pc, context->ret_addr, (rt_base_t)session};
        int checksum_src_cnt = sizeof(checksum_source) / sizeof(checksum_source[0]);
        rt_ubase_t checksum = get_checksum(checksum_source, checksum_src_cnt);
        *buffer++ = checksum;
#endif /* CHECKSUM */
    }
    else
    {
        rc = -RT_ENOMEM;
    }

    context->data_buf = buffer;
    return rc;
}

rt_notrace
void ftrace_arch_get_context(ftrace_context_t context, ftrace_session_t *psession)
{
    rt_base_t *data_buf = ftrace_vice_stack_get_data_buf(context);

    ftrace_vice_stack_get_context(context, psession);

#ifdef CHECKSUM
    rt_ubase_t old_check = *data_buf++;
    rt_base_t array[] = {context->pc, context->ret_addr, (rt_base_t)*psession};
    rt_ubase_t checksum = get_checksum(array, sizeof(array)/sizeof(array[0]));
    if (checksum != old_check)
    {
        rt_hw_local_irq_disable();
        while (1);
    }
#endif
    context->data_buf = data_buf;

    return ;
}
