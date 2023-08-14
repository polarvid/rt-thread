/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-08-13     Shell        File-backed page management subsystem
 */
#ifndef __MM_FILED_PAGE_H__
#define __MM_FILED_PAGE_H__

#include "mm_aspace.h"
#include "mm_page.h"

typedef struct rt_filed_page_pool {
    rt_page_t freed_page_list;
    /* counts of all physical page frames allocated to it */
    rt_base_t phy_page_frame_cnt;

    /* online(used) page frames */
    rt_base_t online_page;
    /* committed page frames to user */
    rt_base_t committed_page;

    void *private_data;
} *rt_filed_page_pool_t;

void *rt_filed_page_alloc(void);
void rt_filed_page_free(void *va);

#endif /* __MM_FILED_PAGE_H__ */
