/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-07-25     Shell        first version
 */
#define DBG_TAG "LWP"
#define DBG_LVL DBG_LOG
#include <rtdbg.h>

#include <backtrace.h>
#include "lwp_internal.h"

rt_err_t lwp_critical_enter(struct rt_lwp *lwp)
{
    rt_err_t rc;

    rc = rt_mutex_take(&lwp->lwp_mtx, RT_WAITING_FOREVER);

    if (lwp->lwp_mtx.hold > 1)
    {
        LOG_W("Already hold the lock");
        rt_backtrace();
    }

    return rc;
}

rt_err_t lwp_critical_exit(struct rt_lwp *lwp)
{
    rt_err_t rc;
    rc = rt_mutex_release(&lwp->lwp_mtx);
    return rc;
}
