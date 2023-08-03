/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2021-01-15     shaojinchun  first version
 */

#include "lwp.h"
#include <rthw.h>
#include <rtthread.h>

#define DBG_TAG    "lwp.tid"
#define DBG_LVL    DBG_LOG
#include <rtdbg.h>

#include "lwp_internal.h"

#ifdef ARCH_MM_MMU
#include "lwp_user_mm.h"
#endif

#define TID_MAX 10000

#define TID_CT_ASSERT(name, x) \
    struct assert_##name {char ary[2 * (x) - 1];}

TID_CT_ASSERT(tid_min_nr, LWP_TID_MAX_NR > 1);
TID_CT_ASSERT(tid_max_nr, LWP_TID_MAX_NR < TID_MAX);

static struct lwp_avl_struct lwp_tid_ary[LWP_TID_MAX_NR];
static struct lwp_avl_struct *lwp_tid_free_head = RT_NULL;
static int lwp_tid_ary_alloced = 0;
static struct lwp_avl_struct *lwp_tid_root = RT_NULL;
static int current_tid = 0;

#include "pfrwlock.h"

static struct p64_pfrwlock tid_lock;

int lwp_tid_init(void)
{
    p64_pfrwlock_init(&tid_lock);
    return 0;
}

void lwp_tid_lock_take(enum lwp_tid_lock_cmd cmd)
{
    switch (cmd)
    {
        case LWP_TID_LOCK_READ:
            p64_pfrwlock_acquire_rd(&tid_lock);
            break;
        case LWP_TID_LOCK_WRITE:
            p64_pfrwlock_acquire_wr(&tid_lock);
            break;
        default:
            RT_ASSERT(0);
    }
}

void lwp_tid_lock_release(enum lwp_tid_lock_cmd cmd)
{
    switch (cmd)
    {
        case LWP_TID_LOCK_READ:
            p64_pfrwlock_release_rd(&tid_lock);
            break;
        case LWP_TID_LOCK_WRITE:
            p64_pfrwlock_release_wr(&tid_lock);
            break;
        default:
            RT_ASSERT(0);
    }
}

int lwp_tid_get(void)
{
    struct lwp_avl_struct *p;
    int tid = 0;

    lwp_tid_lock_take(LWP_TID_LOCK_WRITE);
    p = lwp_tid_free_head;
    if (p)
    {
        lwp_tid_free_head = (struct lwp_avl_struct *)p->avl_right;
    }
    else if (lwp_tid_ary_alloced < LWP_TID_MAX_NR)
    {
        p = lwp_tid_ary + lwp_tid_ary_alloced;
        lwp_tid_ary_alloced++;
    }
    if (p)
    {
        int found_noused = 0;

        RT_ASSERT(p->data == RT_NULL);
        for (tid = current_tid + 1; tid < TID_MAX; tid++)
        {
            if (!lwp_avl_find(tid, lwp_tid_root))
            {
                found_noused = 1;
                break;
            }
        }
        if (!found_noused)
        {
            for (tid = 1; tid <= current_tid; tid++)
            {
                if (!lwp_avl_find(tid, lwp_tid_root))
                {
                    found_noused = 1;
                    break;
                }
            }
        }
        p->avl_key = tid;
        lwp_avl_insert(p, &lwp_tid_root);
        current_tid = tid;
    }
    lwp_tid_lock_release(LWP_TID_LOCK_WRITE);
    return tid;
}

void lwp_tid_put(int tid)
{
    struct lwp_avl_struct *p;

    lwp_tid_lock_take(LWP_TID_LOCK_WRITE);
    p  = lwp_avl_find(tid, lwp_tid_root);
    if (p)
    {
        p->data = RT_NULL;
        lwp_avl_remove(p, &lwp_tid_root);
        p->avl_right = lwp_tid_free_head;
        lwp_tid_free_head = p;
    }
    lwp_tid_lock_release(LWP_TID_LOCK_WRITE);
}

rt_thread_t lwp_tid_get_thread_locked(int tid)
{
    struct lwp_avl_struct *p;
    rt_thread_t thread = RT_NULL;
    // RT_ASSERT(rt_mutex_owner_get(&tid_lock) == rt_thread_self());

    p  = lwp_avl_find(tid, lwp_tid_root);
    if (p)
    {
        thread = (rt_thread_t)p->data;
    }
    return thread;
}

void lwp_tid_set_thread(int tid, rt_thread_t thread)
{
    struct lwp_avl_struct *p;

    lwp_tid_lock_take(LWP_TID_LOCK_WRITE);
    p  = lwp_avl_find(tid, lwp_tid_root);
    if (p)
    {
        p->data = thread;
    }
    lwp_tid_lock_release(LWP_TID_LOCK_WRITE);
}
