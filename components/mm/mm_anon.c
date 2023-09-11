/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-08-19     Shell        Support PRIVATE mapping and COW
 */

#define DBG_TAG "mm.anon"
#define DBG_LVL DBG_INFO
#include <rtdbg.h>

#include <string.h>
#include "mm_private.h"
#include <mmu.h>

/**
 * Anonymous Object directly represent the mappings without backup files in the
 * aspace. Their only backup is in the aspace->pgtbl.
 */

typedef struct rt_private_obj {
    struct rt_mem_obj mem_obj;
    rt_aspace_t backup_aspace;
} *rt_private_obj_t;

rt_inline rt_aspace_t _aono_obj_get_backup(rt_mem_obj_t mem_obj)
{
    rt_private_obj_t priv_obj;
    rt_aspace_t backup;
    priv_obj = rt_container_of(mem_obj, struct rt_private_obj, mem_obj);
    backup = priv_obj->backup_aspace;
    return backup;
}

static const char *_anon_get_name(rt_varea_t varea)
{
    return "anonymous";
}

static void _anon_varea_open(struct rt_varea *varea)
{
    varea->offset = MM_PA_TO_OFF(varea->start);
    varea->data = NULL;
}

static void _anon_varea_close(struct rt_varea *varea)
{
}

static rt_err_t _anon_varea_expand(struct rt_varea *varea, void *new_vaddr, rt_size_t size)
{
    return RT_EOK;
}

static rt_err_t _anon_varea_shrink(rt_varea_t varea, void *new_start, rt_size_t size)
{
    return rt_mm_dummy_mapper.on_varea_shrink(varea, new_start, size);
}

static rt_err_t _anon_varea_split(struct rt_varea *existed, void *unmap_start, rt_size_t unmap_len, struct rt_varea *subset)
{
    _anon_varea_open(subset);
    return rt_mm_dummy_mapper.on_varea_split(existed, unmap_start, unmap_len, subset);
}

static rt_err_t _anon_varea_merge(struct rt_varea *merge_to, struct rt_varea *merge_from)
{
    _anon_varea_close(merge_from);
    return rt_mm_dummy_mapper.on_varea_merge(merge_to, merge_from);
}

static void _anon_page_read(struct rt_varea *varea, struct rt_aspace_io_msg *iomsg);

static void _anon_page_fault(struct rt_varea *varea, struct rt_aspace_fault_msg *msg)
{
    struct rt_aspace_io_msg iomsg;
    rt_mm_dummy_mapper.on_page_fault(varea, msg);
    if (msg->response.status != MM_FAULT_STATUS_UNRECOVERABLE
        && varea->aspace != _aono_obj_get_backup(varea->mem_obj))
    {
        /* copy data from backup aspace */
        rt_mm_io_msg_init(&iomsg, msg->off, msg->fault_vaddr, msg->response.vaddr);
        _anon_page_read(varea, &iomsg);
        msg->response.status = iomsg.response.status;
        if (iomsg.response.status == MM_FAULT_STATUS_UNRECOVERABLE)
        {
            /* revoke the allocated page */
            rt_varea_pgmgr_pop(varea, msg->response.vaddr, ARCH_PAGE_SIZE);
        }
    }
}

#define GET_KERNEL_ADDR_FROM_ASPACE(aspace, va) rt_kmem_p2v(rt_hw_mmu_v2p((aspace), (void *)(va)));

static void read_by_mte(rt_aspace_t aspace, struct rt_aspace_io_msg *iomsg)
{
    void *src_k;
    src_k = GET_KERNEL_ADDR_FROM_ASPACE(aspace, iomsg->fault_vaddr);
    if (src_k)
    {
        memcpy(iomsg->buffer_vaddr, src_k, ARCH_PAGE_SIZE);
        iomsg->response.status = MM_FAULT_STATUS_OK;
    }
}

static void _anon_page_read(struct rt_varea *varea, struct rt_aspace_io_msg *iomsg)
{
    rt_err_t error;
    rt_aspace_t backup = _aono_obj_get_backup(varea->mem_obj);

    LOG_D("%s:%d", __FILE__, __LINE__);
    if (rt_hw_mmu_v2p(backup, iomsg->fault_vaddr) == ARCH_MAP_FAILED)
    {
        /* do synchronization between different threads by backup */
        RDWR_LOCK(backup);
        /* re-check if page is existed */
        if (rt_hw_mmu_v2p(backup, iomsg->fault_vaddr) == ARCH_MAP_FAILED)
        {
            struct rt_aspace_fault_msg msg;
            msg.fault_op = MM_FAULT_OP_READ;
            msg.fault_type = MM_FAULT_TYPE_PAGE_FAULT;
            msg.fault_vaddr = iomsg->fault_vaddr;
            _anon_page_fault(varea, &msg);
            if (msg.response.status == MM_FAULT_STATUS_OK)
            {
                error = rt_varea_map_with_msg(varea, &msg);
                if (error == RT_EOK)
                {
                    memcpy(iomsg->buffer_vaddr, msg.response.vaddr, ARCH_PAGE_SIZE);
                    iomsg->response.status = MM_FAULT_STATUS_OK;
                }
            }
            RDWR_UNLOCK(backup);
        }
        else
        {
            RDWR_UNLOCK(backup);
            read_by_mte(backup, iomsg);
        }
    }
    else
    {
        read_by_mte(backup, iomsg);
    }
}

static void write_by_mte(rt_aspace_t aspace, struct rt_aspace_io_msg *iomsg)
{
    void *dst_k;
    dst_k = GET_KERNEL_ADDR_FROM_ASPACE(aspace, iomsg->fault_vaddr);
    if (dst_k)
    {
        memcpy(dst_k, iomsg->buffer_vaddr, ARCH_PAGE_SIZE);
        iomsg->response.status = MM_FAULT_STATUS_OK;
    }
}

static void _anon_page_write(struct rt_varea *varea, struct rt_aspace_io_msg *iomsg)
{
    rt_err_t error;
    rt_aspace_t backup = _aono_obj_get_backup(varea->mem_obj);
    RT_ASSERT(backup == varea->aspace); /* write is only allowed from backup aspace */

    LOG_D("%s:%d", __FILE__, __LINE__);
    /* do synchronization between different threads by backup */
    RDWR_LOCK(backup);
    if (rt_hw_mmu_v2p(backup, iomsg->fault_vaddr) == ARCH_MAP_FAILED)
    {
        struct rt_aspace_fault_msg msg;
        msg.fault_op = MM_FAULT_OP_READ;
        msg.fault_type = MM_FAULT_TYPE_PAGE_FAULT;
        msg.fault_vaddr = iomsg->fault_vaddr;
        _anon_page_fault(varea, &msg);
        if (msg.response.status == MM_FAULT_STATUS_OK)
        {
            memcpy(msg.response.vaddr, iomsg->buffer_vaddr, ARCH_PAGE_SIZE);
            error = rt_varea_map_with_msg(varea, &msg);
            if (error == RT_EOK)
            {
                iomsg->response.status = MM_FAULT_STATUS_OK;
            }
        }
    }
    else
    {
        write_by_mte(backup, iomsg);
    }
    RDWR_UNLOCK(backup);
}

static struct rt_private_obj _priv_obj = {
    .mem_obj.get_name = _anon_get_name,
    .mem_obj.on_page_fault = _anon_page_fault,
    .mem_obj.hint_free = NULL,
    .mem_obj.on_varea_open = _anon_varea_open,
    .mem_obj.on_varea_close = _anon_varea_close,
    .mem_obj.on_varea_shrink = _anon_varea_shrink,
    .mem_obj.on_varea_split = _anon_varea_split,
    .mem_obj.on_varea_expand = _anon_varea_expand,
    .mem_obj.on_varea_merge = _anon_varea_merge,
    .mem_obj.page_read = _anon_page_read,
    .mem_obj.page_write = _anon_page_write,
};

rt_inline rt_private_obj_t rt_private_obj_create_n_bind(rt_aspace_t aspace)
{
    rt_private_obj_t private_object;
    private_object = rt_malloc(sizeof(struct rt_private_obj));
    if (private_object)
    {
        memcpy(&private_object->mem_obj, &_priv_obj, sizeof(_priv_obj));

        private_object->backup_aspace = aspace;
        aspace->private_object = &private_object->mem_obj;
    }

    return private_object;
}

rt_inline rt_mem_obj_t _get_private_obj(rt_aspace_t aspace)
{
    rt_private_obj_t priv;
    rt_mem_obj_t rc;
    rc = aspace->private_object;
    if (!aspace->private_object)
    {
        priv = rt_private_obj_create_n_bind(aspace);
        if (priv)
        {
            rc = &priv->mem_obj;
        }
    }
    return rc;
}

static int _override_map(rt_varea_t varea, rt_aspace_t aspace, void *fault_vaddr, struct rt_aspace_fault_msg *msg, void *page)
{
    int rc = MM_FAULT_FIXABLE_FALSE;
    rt_private_obj_t private_object;
    rt_varea_t map_varea = RT_NULL;
    rt_err_t error;
    rt_size_t flags;
    rt_size_t attr;

    LOG_D("%s", __func__);

    private_object = rt_container_of(aspace->private_object, struct rt_private_obj, mem_obj);
    if (!private_object)
        private_object = rt_private_obj_create_n_bind(aspace);

    if (private_object)
    {
        flags = varea->flag | MMF_MAP_FIXED;
        /* don't prefetch and do it latter */
        flags &= ~MMF_PREFETCH;
        attr = rt_hw_mmu_attr_add_perm(varea->attr, RT_HW_MMU_PROT_USER | RT_HW_MMU_PROT_WRITE);

        rt_size_t ex_vsz = rt_aspace_count_vsz(aspace);
        /* override existing mapping at fault_vaddr */
        error = _mm_aspace_map(
            aspace, &map_varea, &fault_vaddr, ARCH_PAGE_SIZE, attr,
            flags, &private_object->mem_obj, MM_PA_TO_OFF(fault_vaddr));

        if (ex_vsz != rt_aspace_count_vsz(aspace))
        {
            LOG_E("%s: fault_va=%p,(priv_va=%p,priv_sz=0x%lx) at %s", __func__, msg->fault_vaddr, map_varea->start, map_varea->size, VAREA_NAME(map_varea));
            RT_ASSERT((rt_aspace_print_all(aspace), 1));
            RT_ASSERT(0 && "vsz changed");
        }

        if (error == RT_EOK)
        {
            msg->response.status = MM_FAULT_STATUS_OK;
            msg->response.vaddr = page;
            msg->response.size = ARCH_PAGE_SIZE;
            if (rt_varea_map_with_msg(map_varea, msg) != RT_EOK)
            {
                LOG_E("%s: fault_va=%p,(priv_va=%p,priv_sz=0x%lx) at %s", __func__, msg->fault_vaddr, map_varea->start, map_varea->size, VAREA_NAME(map_varea));
                RT_ASSERT(0 && "should never failed");
            }
            RT_ASSERT(rt_hw_mmu_v2p(aspace, msg->fault_vaddr) == (page + PV_OFFSET));
            rc = MM_FAULT_FIXABLE_TRUE;
            rt_varea_pgmgr_insert(map_varea, page);
        }
        else
        {
            /* private object will be release on destruction of aspace */
            rt_free(map_varea);
        }
    }
    else
    {
        LOG_I("%s: out of memory", __func__);
        rc = MM_FAULT_FIXABLE_FALSE;
    }

    return rc;
}

/**
 * replace an existing mapping to a private one, this is identical to:
 * => aspace_unmap(ex_varea, )
 * => aspace_map()
 */
int rt_varea_fix_private_locked(rt_varea_t ex_varea, void *pa,
                                struct rt_aspace_fault_msg *msg,
                                rt_bool_t dont_copy)
{
    /**
     * todo: READ -> WRITE lock here
     */
    void *page;
    void *fault_vaddr;
    rt_aspace_t aspace;
    rt_mem_obj_t ex_obj;
    int rc = MM_FAULT_FIXABLE_FALSE;
    ex_obj = ex_varea->mem_obj;

    if (ex_obj)
    {
        fault_vaddr = msg->fault_vaddr;
        aspace = ex_varea->aspace;
        RT_ASSERT(!!aspace);
        
        /**
         * todo: what if multiple pages are required?
         */
        if (aspace->private_object == ex_obj)
        {
            RT_ASSERT(0 && "recursion");
        }
        else if (ex_obj->page_read)
        {
            page = rt_pages_alloc_ext(0, PAGE_ANY_AVAILABLE);
            if (page)
            {
                /** setup message & fetch the data from source object */
                if (!dont_copy)
                {
                    struct rt_aspace_io_msg io_msg;
                    rt_mm_io_msg_init(&io_msg, msg->off, msg->fault_vaddr, page);
                    ex_obj->page_read(ex_varea, &io_msg);
                    /**
                    * Note: if ex_obj have mapped into varea, it's still okay since
                    * we will override it latter
                    */
                    if (io_msg.response.status != MM_FAULT_STATUS_UNRECOVERABLE)
                    {
                        rc = _override_map(ex_varea, aspace, fault_vaddr, msg, page);
                    }
                    else
                    {
                        rt_pages_free(page, 0);
                        LOG_I("%s: page read(va=%p) fault from %s(start=%p,size=%p)", __func__,
                            msg->fault_vaddr, VAREA_NAME(ex_varea), ex_varea->start, ex_varea->size);
                    }
                }
                else
                {
                    rc = _override_map(ex_varea, aspace, fault_vaddr, msg, page);
                }
            }
            else
                LOG_I("%s: pages allocation failed", __func__);
        }
        else
            LOG_I("%s: no page read method provided from %s", __func__, VAREA_NAME(ex_varea));
    }
    else
        LOG_I("%s: unavailable memory object", __func__);

    return rc;
}

int rt_aspace_map_private(rt_aspace_t aspace, void **addr, rt_size_t length,
                          rt_size_t attr, mm_flag_t flags)
{
    int rc;
    rt_mem_obj_t priv_obj;

    priv_obj = _get_private_obj(aspace);
    if (priv_obj)
    {
        flags |= MMF_MAP_PRIVATE;
        rc = rt_aspace_map(aspace, addr, length, attr, flags, priv_obj, 0);
    }
    else
    {
        rc = -RT_ENOMEM;
    }
    return rc;
}
