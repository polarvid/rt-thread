/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-08-13     Shell        The first version
 */

#include <rtthread.h>

#ifdef LWP_PAGE_RECYCLER
#include "lwp_page_recy.h"

static struct {
    rt_bool_t global_enabled;
    lwp_page_recycler_t recy;
} _ctrl_session;

rt_mem_obj_t lwp_get_mmap_obj(struct rt_lwp *lwp)
{
    rt_mem_obj_t object;

    if (_ctrl_session.global_enabled)
        object = _ctrl_session.recy->mem_obj_create(lwp);
    else
        object = &lwp->lwp_obj->mem_obj;

    /* Nullable */
    return object;
}

rt_err_t lwp_page_recy_register(lwp_page_recycler_t recy)
{
    rt_err_t rc = RT_EOK;
    if (!_ctrl_session.recy)
    {
        _ctrl_session.recy = recy;
        _ctrl_session.global_enabled = RT_TRUE;
    }
    else
        rc = -RT_ENOSPC;

    return rc;
}

#endif /* LWP_PAGE_RECYCLER */
