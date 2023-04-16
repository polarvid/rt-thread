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
#include <rthw.h>
#include <page.h>

#include "event-ring.h"

static void _test_ringbuf(void)
{
    int retval;
    const size_t cpuid = rt_hw_cpu_id();
    rt_ubase_t data = 0xabcd1234;
    trace_evt_ring_t ring = event_ring_create(0x8000 * RT_CPUS_NR, sizeof(data), 4096);
    for (size_t i = 0; i < sizeof(data); i++)
        ring->rings[cpuid].buftbl[i] = rt_pages_alloc(0);

    rt_kprintf("Elem cnt %d\n", event_ring_count(ring, cpuid));
    // rt_kprintf("Test idx 0x30f(mask %lx), tbl idx %d, off %d\n", ring->rings[cpuid].buf_mask,
    //     IDX_TO_OFF_IN_TBL(ring, 0x30f), IDX_TO_OFF_IN_BUF(ring, 0x30f));

    retval = event_ring_enqueue(ring, &data, sizeof(data), 0);
    rt_kprintf("enqueue get retval %d, elem cnt %d\n", retval, event_ring_count(ring, cpuid));

    data = 0x0;
    void *buf = event_ring_dequeue_mc(ring, rt_pages_alloc(0), sizeof(data));
    rt_kprintf("dequeue %p\n", buf);
    // rt_pages_free(buf, 0);

    for (size_t i = 0; i < ring->rings[cpuid].prod_size; i++)
    {
        data += i;
        event_ring_enqueue(ring, &data, sizeof(data), 1);
    }
    rt_kprintf("elem cnt %d, drops %d\n", event_ring_count(ring, cpuid), ring->rings[cpuid].drop_events);

    for (size_t i = 0; i < sizeof(data); i++)
        rt_pages_free(ring->rings[cpuid].buftbl[i], 0);
    event_ring_delete(ring);
    return ;
}
MSH_CMD_EXPORT_ALIAS(_test_ringbuf, ringbuf_test, test ftrace feature);
