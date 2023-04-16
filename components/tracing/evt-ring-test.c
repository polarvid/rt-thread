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
#include "rtdef.h"

static void alloc_buffer(trace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data)
{
    if (cpuid != 0)
        return ;

    void *preloc = *(void **)data;
    RT_ASSERT(!preloc || pbuffer == preloc + 1);

    RT_ASSERT(!*pbuffer);
    preloc = pbuffer;
    *pbuffer = rt_pages_alloc2(0, PAGE_ANY_AVAILABLE);
    // rt_kprintf("buf %p\n", *pbuffer);
    RT_ASSERT(!!*pbuffer);

    /* test on event_ring_object_loc */
    void *preobj = 0;
    static size_t index = 0;
    for (size_t i = 0; i < ring->objs_per_buf; i++)
    {
        void *obj = event_ring_object_loc(ring, index, cpuid);
        RT_ASSERT(obj >= *pbuffer && obj < *pbuffer + 4096);
        RT_ASSERT(!preobj || obj == preobj + 8);
        preobj = obj;
        index += 1;
    }
}

static void _test_buffer(void *buf)
{
    static size_t start = 0;
    rt_ubase_t *array = buf;
    for (size_t i = 0; i < 4096 / sizeof(rt_ubase_t); i++)
    {
        if (!start)
            start = array[i];
        else
            RT_ASSERT(start == array[i]);
        start += 1;
    }
}

static void _test_ringbuf(void)
{
    rt_thread_control(rt_thread_self(), RT_THREAD_CTRL_BIND_CPU, (void *)0);
    const size_t cpuid = rt_hw_cpu_id();

    trace_evt_ring_t ring = event_ring_create(XCPU(0x8000), sizeof(rt_ubase_t), 4096);
    RT_ASSERT(!!ring);
    _Atomic(void *) *preloc = 0;

    event_ring_for_each_buffer_lock(ring, alloc_buffer, &preloc);

    /* test on event_ring_count */
    RT_ASSERT(0 == event_ring_count(ring, cpuid));

    rt_ubase_t data = 0x0;
    void *buf = event_ring_dequeue_mc(ring, NULL);
    RT_ASSERT(!buf);

    for (size_t i = 0; i < 0x8000; i++)
    {
        data++;
        event_ring_enqueue(ring, &data, 1);
    }
    rt_kprintf("elem cnt %d, drops %d\n", event_ring_count(ring, cpuid), ring->rings[cpuid].drop_events);
    
    for (size_t i = 0; i < ring->bufs_per_ring; i++)
    {
        void *buf;
        buf = event_ring_dequeue_mc(ring, NULL);
        if (buf)
        {
            _test_buffer(buf);

            rt_pages_free(buf, 0);
        }
    }

    rt_pages_free(*event_ring_buffer_loc(ring, ring->rings[cpuid].prod_head, cpuid), 0);

    event_ring_delete(ring);
    rt_thread_control(rt_thread_self(), RT_THREAD_CTRL_BIND_CPU, (void *)RT_CPUS_NR);
    return ;
}
MSH_CMD_EXPORT_ALIAS(_test_ringbuf, ringbuf_test, test ftrace feature);
