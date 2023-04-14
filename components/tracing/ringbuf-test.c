/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#include <rtthread.h>
#include <page.h>

#include "ringbuffer.h"

static void _test_ringbuf(void)
{
    int retval;
    rt_ubase_t data = 0xabcd1234;
    struct ring_buf *rb = ring_buf_create(4096, sizeof(data), 4096);
    for (size_t i = 0; i < sizeof(data); i++)
        rb->buftbl[i] = rt_pages_alloc(0);

    rt_kprintf("Elem cnt %d\n", buf_ring_count(rb));
    rt_kprintf("Test idx 0x30f(mask %lx), tbl idx %d, off %d\n", rb->buf_mask,
        IDX_TO_OFF_IN_TBL(rb, 0x30f), IDX_TO_OFF_IN_BUF(rb, 0x30f));

    retval = ring_buf_enqueue(rb, &data, sizeof(data), 0);
    rt_kprintf("enqueue get retval %d, elem cnt %d\n", retval, buf_ring_count(rb));

    data = 0x0;
    void *buf = ring_buf_dequeue_mc(rb, rt_pages_alloc(0), sizeof(data));
    rt_kprintf("dequeue %p\n", buf);
    // rt_pages_free(buf, 0);

    for (size_t i = 0; i < rb->cons_size; i++)
    {
        data += i;
        ring_buf_enqueue(rb, &data, sizeof(data), 1);
    }
    rt_kprintf("elem cnt %d, drops %d\n", buf_ring_count(rb), rb->drops);

    for (size_t i = 0; i < sizeof(data); i++)
        rt_pages_free(rb->buftbl[i], 0);
    ring_buf_delete(rb);
    return ;
}
MSH_CMD_EXPORT_ALIAS(_test_ringbuf, ringbuf_test, test ftrace feature);
