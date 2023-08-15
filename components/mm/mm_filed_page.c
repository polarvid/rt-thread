/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-08-13     Shell        File-backed page management subsystem
 */

#include "avl_adpt.h"
#include "mm_filed_page.h"

static struct {
    /* counts of available page pool */
    rt_base_t pool_count;

    /* list of page pool */
    rt_list_t pool_list;

    /* mapping of page pool aspace */
    struct _aspace_node page_pool_mapping;
} _dispatch_session;

void *rt_filed_page_alloc(void)
{
    if (_dispatch_session.pool_count)
    {
        /* choose a free page pool */
    }
}

rt_err_t rt_filed_page_register_pool(rt_filed_page_pool_t pool, rt_base_t capability)
{
    rt_err_t rc = RT_EOK;

    rt_list_insert_after(&_dispatch_session.pool_list, &pool->list_node);
    _dispatch_session.pool_count += 1;

    return rc;
}

void rt_filed_page_free(void *va);
