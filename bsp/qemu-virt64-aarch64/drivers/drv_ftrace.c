/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-20     WangXiaoyao  the first version
 */

#include "mm_aspace.h"
#include "mmu.h"
#include <rtthread.h>
#include <lwp.h>
#include <dfs_file.h>
#include <lwp_user_mm.h>

#define DBG_TAG "ftrace"
#define DBG_LVL DBG_LOG
#include <rtdbg.h>

/* export ring buffer in kernel space to user by a imaginary device ftrace */

static struct rt_device ftrace_dev;

static int ftrace_mmap(struct dfs_mmap2_args *mmap)
{
    rt_varea_t varea;
    struct rt_lwp *lwp = lwp_self();

    /* create a va area in user space (lwp) */
    varea = lwp_map_user_varea(lwp, mmap->addr, mmap->length);
    if (varea)
    {
        /* alloc a page frame for the area */
        void *page = rt_pages_alloc(0);
        strncpy(page, "ftrace sample message", 128);

        /* map the page frame to user */
        rt_varea_map_page(varea, varea->start, page);

        /* let varea free the page automatically on unmap */
        rt_varea_pgmgr_insert(varea, page);

        mmap->ret = varea->start;
    }
    else
    {
        LOG_W("%s(va:%p, sz:%lx): failed to create varea in user space",
            __func__, mmap->addr, mmap->length);
    }

    return RT_EOK;
}

#include <rmem.h>
#include <board.h>
extern struct mm_allocator rmem_slab;

static struct mm_rmem_region ftrace_pool = {
    .name = "ftrace",
    .allocator = &rmem_slab,
    .size = 32ul << 20,
};

rt_err_t ftrace_init(rt_device_t dev)
{
    ftrace_pool.start_phy = (void *)PAGE_END + PV_OFFSET;
    rt_dma_rmem_register(dev, &ftrace_pool);

    return RT_EOK;
}

rt_err_t ftrace_open(rt_device_t dev, rt_uint16_t oflag)
{
    void *buf = rt_dma_alloc(dev, 4096, 0);
    rt_kprintf("%s alloc %p\n", __func__, buf);
    dev->user_data = buf;
    return RT_EOK;
}

rt_err_t ftrace_close(rt_device_t dev)
{
    void *buf = dev->user_data;
    rt_kprintf("%s ret %d\n", __func__, rt_dma_free(dev, buf, 4096, 0));
    return RT_EOK;
}

static rt_ssize_t ftrace_read(rt_device_t dev, rt_off_t pos, void *buffer, rt_size_t size)
{
    return 0;
}

static rt_err_t ftrace_control(rt_device_t dev, int cmd, void *args)
{
    rt_err_t err;

    switch (cmd)
    {
        case RT_FIOMMAP2:
            err = ftrace_mmap((struct dfs_mmap2_args *)args);
            break;
        default:
            err = -RT_ENOSYS;
    }
    return err;
}

#ifdef RT_USING_DEVICE_OPS
const static struct rt_device_ops ftrace_ops =
{
    ftrace_init,
    ftrace_open,
    ftrace_close,
    ftrace_read,
    RT_NULL,
    ftrace_control
};
#endif

int ftrace_device_init(void)
{
    static rt_bool_t init_ok = RT_FALSE;

    if (init_ok)
    {
        return 0;
    }
    RT_ASSERT(!rt_device_find("ftrace"));
    ftrace_dev.type     = RT_Device_Class_Char;

#ifdef RT_USING_DEVICE_OPS
    ftrace_dev.ops      = &ftrace_ops;
#else
    ftrace_dev.init     = ftrace_init;
    ftrace_dev.open     = ftrace_open;
    ftrace_dev.close    = ftrace_close;
    ftrace_dev.read     = ftrace_read;
    ftrace_dev.write    = RT_NULL;
    ftrace_dev.control  = ftrace_control;
#endif
    ftrace_dev.user_data = RT_NULL;

    rt_device_register(&ftrace_dev, "ftrace", RT_DEVICE_FLAG_RDONLY);

    init_ok = RT_TRUE;

    return 0;
}
INIT_DEVICE_EXPORT(ftrace_device_init);
