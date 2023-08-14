/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-08-13     Shell        The first version
 */

#ifndef __LWP_PAGE_RECYC_H__
#define __LWP_PAGE_RECYC_H__

#include <lwp.h>
#include <mm_aspace.h>

typedef struct lwp_page_recycler {
    rt_mem_obj_t (*mem_obj_create)(struct rt_lwp *lwp);
    void (*mem_obj_destroy)(rt_mem_obj_t object);
} *lwp_page_recycler_t;

#endif /* __LWP_PAGE_RECYC_H__ */
