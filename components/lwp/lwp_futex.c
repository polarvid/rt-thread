/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2021/01/02     bernard      the first version
 * 2023-07-25     Shell        Remove usage of rt_hw_interrupt API in the lwp
 *                             Coding style: remove multiple `return` in a routine
 */

#include "lwp_internal.h"
#include "lwp_pid.h"

#include <rtthread.h>
#include <lwp.h>
#ifdef ARCH_MM_MMU
#include <lwp_user_mm.h>
#endif
#include "sys/time.h"

struct rt_futex
{
    int *uaddr;
    rt_list_t waiting_thread;
    struct lwp_avl_struct node;
    struct rt_object *custom_obj;
};

/* must have futex address_search_head taken */
static rt_err_t _futex_destroy_locked(void *data)
{
    rt_err_t ret = -1;
    struct rt_futex *futex = (struct rt_futex *)data;

    if (futex)
    {
        /**
         * @brief Delete the futex from lwp address_search_head
         *
         * @note Critical Section
         * - the lwp (READ. share by thread)
         * - the lwp address_search_head (RW. protected by caller. for destroy
         *   routine, it's always safe because it already take a write lock to
         *   the lwp.)
         */
        lwp_avl_remove(&futex->node, (struct lwp_avl_struct **)futex->node.data);

        /* release object */
        rt_free(futex);
        ret = 0;
    }
    return ret;
}

/* must have futex address_search_head taken */
static struct rt_futex *_futex_create_locked(int *uaddr, struct rt_lwp *lwp)
{
    struct rt_futex *futex = RT_NULL;
    struct rt_object *obj = RT_NULL;

    /**
     * @brief Create a futex under current lwp
     *
     * @note Critical Section
     * - lwp (READ; share with thread)
     */
    if (lwp)
    {
        futex = (struct rt_futex *)rt_malloc(sizeof(struct rt_futex));
        if (futex)
        {
            obj = rt_custom_object_create("futex", (void *)futex, _futex_destroy_locked);
            if (!obj)
            {
                rt_free(futex);
                futex = RT_NULL;
            }
            else
            {
                /**
                 * @brief Add futex to user object tree for resource recycling
                 *
                 * @note Critical Section
                 * - lwp user object tree (RW; protected by API)
                 * - futex (if the adding is successful, others can find the
                 *   unready futex. However, only the lwp_free will do this,
                 *   and this is protected by the ref taken by the lwp thread
                 *   that the lwp_free will never execute at the same time)
                 */
                if (lwp_user_object_add(lwp, obj))
                {
                    rt_object_delete(obj);
                    rt_free(futex);
                    futex = RT_NULL;
                }
                else
                {
                    futex->uaddr = uaddr;
                    futex->node.avl_key = (avl_key_t)uaddr;
                    futex->node.data = &lwp->address_search_head;
                    futex->custom_obj = obj;
                    rt_list_init(&(futex->waiting_thread));

                    /**
                     * @brief Insert into futex head
                     *
                     * @note Critical Section
                     * - lwp address_search_head (RW; protected by caller)
                     */
                    lwp_avl_insert(&futex->node, &lwp->address_search_head);
                }

            }
        }
    }
    return futex;
}

/* must have futex address_search_head taken */
static struct rt_futex *_futex_get_locked(void *uaddr, struct rt_lwp *lwp)
{
    struct rt_futex *futex = RT_NULL;
    struct lwp_avl_struct *node = RT_NULL;

    /**
     * @note Critical Section
     * protect lwp address_search_head (READ)
     */
    node = lwp_avl_find((avl_key_t)uaddr, lwp->address_search_head);

    if (!node)
    {
        return RT_NULL;
    }
    futex = rt_container_of(node, struct rt_futex, node);
    return futex;
}

static int _futex_wait(struct rt_futex *futex, struct rt_lwp *lwp, int value, const struct timespec *timeout)
{
    rt_thread_t thread;
    rt_err_t ret = -RT_EINTR;

    if (*(futex->uaddr) == value)
    {
        /**
         * @brief Remove current thread from scheduler, besides appends it to
         * the waiting thread list of the futex. If the timeout is specified
         * a timer will be setup for current thread
         *
         * @note Critical Section
         * - lwp (READ; share with thread)
         */

        thread = rt_thread_self();
        LWP_LOCK(lwp);

        /**
         * @note Critical Section
         * - the local cpu
         */
        rt_enter_critical();

        ret = rt_thread_suspend_with_flag(thread, RT_INTERRUPTIBLE);

        if (ret == RT_EOK)
        {
            /**
             * @brief Add current thread into futex waiting thread list
             *
             * @note Critical Section
             * - the futex waiting_thread list (RW)
             */
            rt_list_insert_before(&(futex->waiting_thread), &(thread->tlist));

            if (timeout)
            {
                /* start the timer of thread */
                rt_int32_t time = timeout->tv_sec * RT_TICK_PER_SECOND + timeout->tv_nsec * RT_TICK_PER_SECOND / NANOSECOND_PER_SECOND;

                if (time < 0)
                {
                    time = 0;
                }

                rt_timer_control(&(thread->thread_timer),
                                RT_TIMER_CTRL_SET_TIME,
                                &time);
                rt_timer_start(&(thread->thread_timer));
            }
        }
        else
        {
            ret = EINTR;
        }

        rt_exit_critical();

        LWP_UNLOCK(lwp);

        if (ret == RT_EOK)
        {
            /* do schedule */
            rt_schedule();
            ret = thread->error;
            /* check errno */
        }
        rt_set_errno(ret);
    }
    else
    {
        rt_set_errno(EAGAIN);
    }

    return ret;
}

static void _futex_wake(struct rt_futex *futex, struct rt_lwp *lwp, int number)
{
    int is_empty = 0;
    rt_thread_t thread;

    /**
     * @brief Wakeup a suspended thread on the futex waiting thread list
     *
     * @note Critical Section
     * - the futex waiting_thread list (RW)
     */
    while (number && !is_empty)
    {
        LWP_LOCK(lwp);
        is_empty = rt_list_isempty(&(futex->waiting_thread));
        if (!is_empty)
        {
            thread = rt_list_entry(futex->waiting_thread.next, struct rt_thread, tlist);
            /* remove from waiting list */
            rt_list_remove(&(thread->tlist));

            thread->error = RT_EOK;
            /* resume the suspended thread */
            rt_thread_resume(thread);

            number--;
        }
        LWP_UNLOCK(lwp);
    }

    /* do schedule */
    rt_schedule();
}

#include <syscall_generic.h>

rt_inline rt_bool_t _timeout_ignored(int op)
{
    /**
     * if (op & (FUTEX_WAKE|FUTEX_FD|FUTEX_WAKE_BITSET|FUTEX_TRYLOCK_PI|FUTEX_UNLOCK_PI)) was TRUE
     * `timeout` should be ignored by implementation, according to POSIX futex(2) manual.
     * since only FUTEX_WAKE is implemented in rt-smart, only FUTEX_WAKE was omitted currently
     */
    return (op & (FUTEX_WAKE));
}

sysret_t sys_futex(int *uaddr, int op, int val, const struct timespec *timeout,
                   int *uaddr2, int val3)
{
    struct rt_lwp *lwp = RT_NULL;
    struct rt_futex *futex = RT_NULL;
    sysret_t ret = 0;

    if (!lwp_user_accessable(uaddr, sizeof(int)))
    {
        rt_set_errno(EINVAL);
        ret = -RT_EINVAL;
    }
    else if (timeout && !_timeout_ignored(op) && !lwp_user_accessable((void *)timeout, sizeof(struct timespec)))
    {
        rt_set_errno(EINVAL);
        ret = -RT_EINVAL;
    }
    else
    {
        lwp = lwp_self();
        ret = lwp_futex(lwp, futex, uaddr, op, val, timeout);
        rt_set_errno(ret);
    }

    return ret;
}

rt_err_t lwp_futex(struct rt_lwp *lwp, struct rt_futex *futex, int *uaddr, int op, int val, const struct timespec *timeout)
{
    rt_err_t rc = 0;

    /**
     * @brief Check if the futex exist, otherwise create a new one
     *
     * @note Critical Section
     * - lwp address_search_head (READ)
     */
    LWP_LOCK(lwp);
    futex = _futex_get_locked(uaddr, lwp);
    if (futex == RT_NULL)
    {
        /* create a futex according to this uaddr */
        futex = _futex_create_locked(uaddr, lwp);
        if (futex == RT_NULL)
        {
            rt_set_errno(ENOMEM);
            rc = -ENOMEM;
        }
    }
    LWP_UNLOCK(lwp);

    if (!rc)
    {
        switch (op)
        {
            case FUTEX_WAIT:
                rc = _futex_wait(futex, lwp, val, timeout);
                break;
            case FUTEX_WAKE:
                _futex_wake(futex, lwp, val);
                break;
            default:
                rc = -ENOSYS;
                break;
        }
    }

    return rc;
}
