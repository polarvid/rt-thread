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

void rt_filed_page_free(void *va);
