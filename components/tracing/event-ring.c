/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  generic lockless events ring
 */

#define DBG_TAG "tracing.event-ring"
#define DBG_LVL DBG_INFO
#include <rtdbg.h>

#include "event-ring.h"

#include <lwp_arch.h>
#include <mm_aspace.h>
#include <mmu.h>
#include <rtthread.h>

#define POWER_OF_2(n)   ((n) != 0 && ((n) & ((n) - 1)) == 0)

trace_evt_ring_t event_ring_create(size_t totalsz, size_t objsz, size_t bufsz)
{
    trace_evt_ring_t ring;

    /* size of each ring */
    const size_t ringsz = totalsz / RT_CPUS_NR;

    RT_ASSERT(POWER_OF_2(ringsz));
    /* single buffer */
    RT_ASSERT(POWER_OF_2(bufsz));
    /* objsz should be multiples of 8 */
    RT_ASSERT(!(objsz & (sizeof(rt_ubase_t) - 1)));
    RT_ASSERT(ringsz >= bufsz);

    const size_t objs_per_ring = ringsz / objsz;
    const size_t bufs_per_ring = ringsz / bufsz;
    const size_t tblsz_per_ring = bufs_per_ring * sizeof(ring->buftbl[0]);
    const size_t tblsz_total = RT_CPUS_NR * tblsz_per_ring;

    ring = rt_malloc(sizeof(*ring) + tblsz_total);

    if (!ring)
        return RT_NULL;

    ring->bufs_per_ring = bufs_per_ring;
    ring->buftbl_shift = __builtin_ffsl(bufs_per_ring) - 1;
    /* objects per buffer */
    ring->objs_per_buf = bufsz / objsz;
    ring->objsz = objsz;

    rt_memset(ring->buftbl, 0, tblsz_total);

    for (size_t i = 0; i < RT_CPUS_NR; i++)
    {
        ring->rings[i].drop_events = 0;
        ring->rings[i].prod_size = objs_per_ring;
        ring->rings[i].prod_mask = objs_per_ring - 1;
        ring->rings[i].prod_head = 0;
        ring->rings[i].prod_tail = 0;

        ring->rings[i].cons_size = objs_per_ring;
        ring->rings[i].cons_mask = objs_per_ring - 1;
        ring->rings[i].cons_head = 0;
        ring->rings[i].cons_tail = 0;
    }

    return ring;
}

void event_ring_delete(trace_evt_ring_t ring)
{
    rt_free(ring);
}
