/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2021-01-15     shaojinchun  first version
 */

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
static struct rt_mutex tid_mtx;

int lwp_tid_init(void)
{
    rt_mutex_init(&tid_mtx, "tidmtx", RT_IPC_FLAG_PRIO);
    return 0;
}

void lwp_tid_lock_take(void)
{
    DEF_RETURN_CODE(rc);

    rc = lwp_mutex_take_safe(&tid_mtx, RT_WAITING_FOREVER, 0);
    /* should never failed */
    RT_ASSERT(rc == RT_EOK);
}

void lwp_tid_lock_release(void)
{
    DEF_RETURN_CODE(rc);

    rc = lwp_mutex_release_safe(&tid_mtx);
    /* should never failed */
    RT_ASSERT(rc == RT_EOK);
}

int lwp_tid_get(void)
{
    struct lwp_avl_struct *p;
    int tid = 0;

    lwp_tid_lock_take();
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
    lwp_tid_lock_release();
    return tid;
}

void lwp_tid_put(int tid)
{
    struct lwp_avl_struct *p;

    lwp_tid_lock_take();
    p  = lwp_avl_find(tid, lwp_tid_root);
    if (p)
    {
        p->data = RT_NULL;
        lwp_avl_remove(p, &lwp_tid_root);
        p->avl_right = lwp_tid_free_head;
        lwp_tid_free_head = p;
    }
    lwp_tid_lock_release();
}

rt_thread_t lwp_tid_get_thread_locked(int tid)
{
    struct lwp_avl_struct *p;
    rt_thread_t thread = RT_NULL;
    RT_ASSERT(rt_mutex_owner_get(&tid_mtx) == rt_thread_self());

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

    lwp_tid_lock_take();
    p  = lwp_avl_find(tid, lwp_tid_root);
    if (p)
    {
        p->data = thread;
    }
    lwp_tid_lock_release();
}
