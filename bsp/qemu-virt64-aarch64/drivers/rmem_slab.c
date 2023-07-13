/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-25     WangXiaoyao  slab as rmem
 */

#include <rtthread.h>
#include <mm_aspace.h>
#include <rmem.h>

static void _init(struct mm_rmem_region *region)
{
    /**
     * we use it with normal attribution(cached),
     * besides the mapping is done on initialization as linear
     */
    rt_slab_t rmem;
    rmem = rt_slab_init("rmem_cached", region->start_phy - PV_OFFSET, region->size);

    if (rmem)
    {
        region->status = MM_RMEM_STAT_OK;
        region->data = rmem;
    }
}

void * _alloc(struct mm_rmem_region *region, size_t length, size_t flags)
{
    return rt_slab_alloc(region->data, length);
}

int _free(struct mm_rmem_region *region, void *buf, size_t length, size_t flags)
{
    rt_slab_free(region->data, buf);
    return RT_EOK;
}

struct mm_allocator rmem_slab = {
    .alloc = _alloc,
    .free = _free,
    .init = _init,
};
