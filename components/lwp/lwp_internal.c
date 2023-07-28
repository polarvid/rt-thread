/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-07-25     Shell        first version
 */

#define DBG_TAG "lwp.internal"
#define DBG_LVL DBG_LOG
#include <rtdbg.h>

#include <backtrace.h>
#include "lwp_internal.h"

rt_err_t lwp_mutex_take_safe(rt_mutex_t mtx, rt_int32_t timeout, rt_bool_t interruptable)
{
    DEF_RETURN_CODE(rc);

    if (rt_hw_interrupt_is_disabled())
        rt_backtrace();

    if (interruptable)
        rc = rt_mutex_take_interruptible(mtx, timeout);
    else
        rc = rt_mutex_take(mtx, timeout);

    if (rt_mutex_hold_get(mtx) > 1)
    {
        LOG_W("Already hold the lock");
        rt_backtrace();
    }

#ifdef RT_USING_DEBUG
    if (rc != RT_EOK && rc != -RT_ETIMEOUT && rc != -RT_EINTR)
    {
        char tname[RT_NAME_MAX];
        rt_thread_get_name(rt_thread_self(), tname, sizeof(tname));
        LOG_W("Possible kernel corruption detected on thread %s with errno %ld", tname, rc);
    }
#endif /* RT_USING_DEBUG */

    RETURN(rc);
}

rt_err_t lwp_mutex_release_safe(rt_mutex_t mtx)
{
    DEF_RETURN_CODE(rc);

    rc = rt_mutex_release(mtx);
    if (rc)
    {
        LOG_I("%s: release failed with code %ld", __func__, rc);
        rt_backtrace();
    }

    RETURN(rc);
}

rt_err_t lwp_critical_enter(struct rt_lwp *lwp)
{
    return lwp_mutex_take_safe(&lwp->lwp_mtx, RT_WAITING_FOREVER, 0);
}

rt_err_t lwp_critical_exit(struct rt_lwp *lwp)
{
    return lwp_mutex_release_safe(&lwp->lwp_mtx);
}
