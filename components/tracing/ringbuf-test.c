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
#include "ringbuffer.h"

static void _test_ringbuf(void)
{
    int retval;
    rt_ubase_t data = 0xabcd1234;
    struct ring_buf *rb = ring_buf_create(1ul << 20, sizeof(data));

    rt_kprintf("Elem cnt %d\n", buf_ring_count(rb));
    retval = buf_ring_enqueue(rb, &data, sizeof(data));
    rt_kprintf("enqueue %d, elem cnt %d\n", retval, buf_ring_count(rb));

    data = 0x0;
    buf_ring_dequeue_mc(rb, &data, sizeof(data));
    rt_kprintf("dequeue 0x%lx\n", data);

    ring_buf_delete(rb);
    return ;
}
MSH_CMD_EXPORT_ALIAS(_test_ringbuf, ringbuf_test, test ftrace feature);
