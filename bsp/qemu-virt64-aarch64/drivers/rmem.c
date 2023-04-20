/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2022-12-13     WangXiaoyao  the first version
 */
#define DBG_LVL DBG_INFO
#define DBG_TAG "rmem"
#include <rtdbg.h>

#include <rtthread.h>
#include <mmu.h>
#include "rmem.h"
#include "uthash.h"

struct rmem_list_node {
    mm_rmem_region_t region;
    rt_list_t node;
};

struct device_rmem_entry {
    rt_device_t device; // key
    rt_list_t rmem_list;

    UT_hash_handle hh;
};

/* map device to rmem */
struct device_rmem_entry *hash_table;

int _add_to_rmem_list(struct device_rmem_entry *entry, mm_rmem_region_t region)
{
    struct rmem_list_node *node;
    node = rt_malloc(sizeof(*node));
    if (!node)
        return -RT_ENOMEM;

    node->region = region;
    rt_list_insert_after(&entry->rmem_list, &node->node);
    return RT_EOK;
}

int rt_dma_rmem_register(rt_device_t device, mm_rmem_region_t region)
{
    int err;
    struct device_rmem_entry *entry;
    HASH_FIND_PTR(hash_table, device, entry);
    if (entry)
    {
        /* TODO: common sub-routine */
        err = _add_to_rmem_list(entry, region);
        region->allocator->init(region);
    }
    else
    {
        // malloc entry & reg to hash table
        entry = rt_malloc(sizeof(*entry));
        if (!entry)
        {
            err = -RT_ENOMEM;
        }
        else
        {
            entry->device = device;
            rt_list_init(&entry->rmem_list);
            HASH_ADD_PTR(hash_table, device, entry);
            err = _add_to_rmem_list(entry, region);
            region->allocator->init(region);
        }
    }

    return err;
}

static void *_device_alloc(rt_device_t device, rt_size_t size, rt_size_t flags)
{
    void *buf = RT_NULL;
    struct device_rmem_entry *entry;
    HASH_FIND_PTR(hash_table, &device, entry);
    if (entry)
    {
        struct rmem_list_node *node;
        rt_list_for_each_entry(node, &entry->rmem_list, node)
        {
            mm_rmem_region_t region = node->region;
            buf = region->allocator->alloc(region, size, flags);
        }
    }
    return buf;
}

void *rt_dma_alloc(rt_device_t device, rt_size_t size, rt_size_t flags)
{
    // 1 try dedicated memory pool
    void *buf;
    buf = _device_alloc(device, size, flags);
    if (!buf)
    {
        //
        // 2 shared pool ?
        // 3 page/heap
    }

    return buf;
}

static int _device_free(rt_device_t device, void *vaddr, rt_size_t size, rt_size_t flags)
{
    int err = -RT_ENOENT;
    struct device_rmem_entry *entry;
    HASH_FIND_PTR(hash_table, &device, entry);
    if (entry)
    {
        struct rmem_list_node *node;
        rt_list_for_each_entry(node, &entry->rmem_list, node)
        {
            mm_rmem_region_t region = node->region;
            void *paddr = rt_kmem_v2p(vaddr);
            if (paddr >= region->start_phy && paddr < (region->start_phy + region->size))
            {
                err = region->allocator->free(region, vaddr, size, flags);
                break;
            }
        }
    }
    return err;
}

rt_err_t rt_dma_free(rt_device_t device, void *vaddr, rt_size_t size, rt_size_t flags)
{
    int err;
    err = _device_free(device, vaddr, size, flags);
    if (err == -RT_ENOENT)
    {
        err = -RT_ERROR;
    }
    return err;
}
