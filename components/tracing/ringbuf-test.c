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
    struct ring_buf *rb = ring_buf_create(1ul << 20, 8);

    ring_buf_delete(rb);
    return ;
}
MSH_CMD_EXPORT_ALIAS(_test_ringbuf, ringbuf_test, test ftrace feature);
