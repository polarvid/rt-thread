/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2021-05-18     Jesven       first version
 */

#include <armv8.h>
#include <rthw.h>
#include <rtthread.h>
#include <string.h>

#ifdef ARCH_MM_MMU

#define DBG_TAG "lwp.arch"
#define DBG_LVL DBG_INFO
#include <rtdbg.h>

#include <lwp_arch.h>
#include <lwp_user_mm.h>

extern size_t MMUTable[];

int arch_user_space_init(struct rt_lwp *lwp)
{
    size_t *mmu_table;

    mmu_table = (size_t *)rt_pages_alloc_ext(0, PAGE_ANY_AVAILABLE);
    if (!mmu_table)
    {
        return -RT_ENOMEM;
    }

    lwp->end_heap = USER_HEAP_VADDR;

    memset(mmu_table, 0, ARCH_PAGE_SIZE);
    rt_hw_cpu_dcache_ops(RT_HW_CACHE_FLUSH, mmu_table, ARCH_PAGE_SIZE);

    lwp->aspace = rt_aspace_create(
        (void *)USER_VADDR_START, USER_VADDR_TOP - USER_VADDR_START, mmu_table);
    if (!lwp->aspace)
    {
        return -RT_ERROR;
    }

    return 0;
}

void *arch_kernel_mmu_table_get(void)
{
    return (void *)NULL;
}

void arch_user_space_free(struct rt_lwp *lwp)
{
    if (lwp)
    {
        RT_ASSERT(lwp->aspace);
        void *pgtbl = lwp->aspace->page_table;
        rt_aspace_delete(lwp->aspace);

        /* must be freed after aspace delete, pgtbl is required for unmap */
        rt_pages_free(pgtbl, 0);
        lwp->aspace = NULL;
    }
    else
    {
        LOG_W("%s: NULL lwp as parameter", __func__);
        RT_ASSERT(0);
    }
}

int arch_expand_user_stack(void *addr)
{
    int ret = 0;
    size_t stack_addr = (size_t)addr;

    stack_addr &= ~ARCH_PAGE_MASK;
    if ((stack_addr >= (size_t)USER_STACK_VSTART) &&
        (stack_addr < (size_t)USER_STACK_VEND))
    {
        void *map =
            lwp_map_user(lwp_self(), (void *)stack_addr, ARCH_PAGE_SIZE, 0);

        if (map || lwp_user_accessable(addr, 1))
        {
            ret = 1;
        }
    }
    return ret;
}

#endif
#define ALGIN_BYTES (16)

void *arch_ucontext_save(rt_base_t user_sp, siginfo_t *psiginfo,
                         struct rt_hw_exp_stack *exp_frame, rt_base_t elr,
                         rt_base_t spsr)
{
    rt_base_t *new_sp;
    size_t item_copied = sizeof(*exp_frame) / sizeof(rt_base_t);

    /* push psiginfo */
    if (psiginfo)
    {
        new_sp = (void *)RT_ALIGN_DOWN(user_sp - sizeof(*psiginfo), ALGIN_BYTES);
        memcpy(new_sp, psiginfo, sizeof(*psiginfo));
        user_sp = (rt_base_t)new_sp;
    }

    /* exp frame is already aligned as AAPCS64 required */
    new_sp = (rt_base_t *)user_sp - item_copied;;
    if (lwp_user_accessable(new_sp, sizeof(*exp_frame)))
        memcpy(new_sp, exp_frame, sizeof(*exp_frame));
    else
    {
        LOG_I("%s: User stack overflow", __func__);
        sys_exit(EXIT_FAILURE);
    }

    /* fix the 3 fields in exception frame, so that memcpy will be fine */
    ((struct rt_hw_exp_stack *)new_sp)->pc = elr;
    ((struct rt_hw_exp_stack *)new_sp)->cpsr = spsr;
    ((struct rt_hw_exp_stack *)new_sp)->sp_el0 = user_sp;

    /* copy lwp_sigreturn */
    extern void lwp_sigreturn(void);
    void *fn_sigreturn = &lwp_sigreturn;
    new_sp -= ALGIN_BYTES / sizeof(new_sp);
    memcpy(new_sp, fn_sigreturn, 8);

    return new_sp;
}
