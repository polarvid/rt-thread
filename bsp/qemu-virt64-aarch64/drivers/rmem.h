/*
 * Copyright (c) 2006-2022, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2022-12-13     WangXiaoyao  the first version
 */
#ifndef __MM_RMEM_H__
#define __MM_RMEM_H__

#include "rtdef.h"
#include <stddef.h>
#include <rtthread.h>

#define MM_RMEM_MAX_REGION (16)

struct mm_rmem_region;

typedef struct mm_allocator
{
    void (*init)(struct mm_rmem_region *region);
    void *(*alloc)(struct mm_rmem_region *region, size_t length, size_t flags);
    int (*free)(struct mm_rmem_region *region, void *buf, size_t length, size_t flags);
} *mm_allocator_t;

enum mm_rmem_status {
    MM_RMEM_STAT_OK,
    MM_RMEM_STAT_NOT_ALIGNED_FAILED,
};

typedef struct mm_rmem_region
{
    void *start_phy;
    size_t size;

    size_t flag;
    size_t alignment;

    mm_allocator_t allocator;

    enum mm_rmem_status status;
    char name[RT_NAME_MAX];

    void *data;
} *mm_rmem_region_t;

int rt_dma_rmem_register(rt_device_t device, mm_rmem_region_t region);

void *rt_dma_alloc(rt_device_t device, rt_size_t size, rt_size_t flags);

rt_err_t rt_dma_free(rt_device_t device, void *vaddr, rt_size_t size, rt_size_t flags);

#endif /* __MM_RMEM_H__ */
