/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  generic lockless events ring
 */
#ifndef __TRACE_EVENT_RING_H__
#define __TRACE_EVENT_RING_H__

#include "rtdef.h"
#include <rtthread.h>
#include <rthw.h>
#include <cpuport.h>
#include <ftrace.h>

#include <stdint.h>
#include <stdatomic.h>

#ifndef ARCH_L1_CACHE_SIZE
#define CACHE_LINE_SIZE 64
#else
#define CACHE_LINE_SIZE ARCH_L1_CACHE_SIZE
#endif

/**
 * @brief Events Ring is an interruptive-writer, multiple-readers
 * lockless ring buffer designed for the scene of recording trace events.
 *
 * The reader and writer interact with the events ring in a distinctive
 * manner that makes the ring buffer looks like a differential gear.
 */

typedef struct trace_evt_ring
{
    struct {
        /** aligned for each ring */
        rt_align(CACHE_LINE_SIZE)
        _Atomic(uint32_t) prod_head;
        _Atomic(uint32_t) prod_tail;
        int prod_size;
        int prod_mask;

        /** count of dropped events,
         * can be the latest or oldest */
        _Atomic(uint64_t) drop_events;

        /** reader can hook a buffer and wait for
         * the asynchronous completion */
        void *listener;

        /** reading is allowed on any cores */
        rt_align(CACHE_LINE_SIZE)
        _Atomic(uint32_t) cons_head;
        _Atomic(uint32_t) cons_tail;
        int cons_size;
        int cons_mask;

    } rings[RT_CPUS_NR];

    int objs_per_buf;
    /* idx shift of buffer in buftbl */
    int buftbl_shift;
    int bufs_per_ring;
    int objsz;
    _Atomic(void *) buftbl[0];
} *trace_evt_ring_t;

#define _R(ring)                                (&(ring)->rings[cpuid])

/* reference to buffer in table, buffer := ring->buftbl[idx, cpuid] */
#define IDX_TO_BUF_OFF(ring, idx)               (((rt_ubase_t)(idx) & ~(ring->objs_per_buf - 1)) >> (__builtin_ffsl(ring->objs_per_buf) - 1))
#define _BUFTBL(ring, cpuid)                    (&((ring)->buftbl[(cpuid) << (ring)->buftbl_shift]))
#define IDX_TO_BUF(ring, idx, cpuid)            (atomic_load_explicit(&_BUFTBL(ring, cpuid)[IDX_TO_BUF_OFF(ring, idx)], memory_order_acquire))

/* reference to object in buffer, obj := buffer[idx, cpuid] */
#define IDX_TO_OBJ_OFF(ring, idx)               ((rt_ubase_t)(idx) & (ring->objs_per_buf - 1))
#define OFF_TO_OBJ(ring, idx, objshift, cpuid)  (IDX_TO_BUF(ring, idx, cpuid) + (IDX_TO_OBJ_OFF(ring, idx) << (objshift)))

#define XCPU(num)   ((num) * RT_CPUS_NR)

#if 0
#define rb_preempt_disable()    rt_preempt_disable()
#define rb_preempt_enable()     rt_preempt_enable()
#else
#define rb_preempt_disable()    rt_ubase_t level = rt_hw_local_irq_disable();
#define rb_preempt_enable()     rt_hw_local_irq_enable(level)
#endif

rt_inline rt_notrace
void *event_ring_event_loc(trace_evt_ring_t ring, const int index, const int cpuid)
{
    const size_t objshift = __builtin_ffsl(ring->objsz) - 1;
    return OFF_TO_OBJ(ring, index, objshift, cpuid);
}

rt_inline rt_notrace
_Atomic(void *) *event_ring_buffer_loc(trace_evt_ring_t ring, const int index, const int cpuid)
{
    const size_t bufoff = IDX_TO_BUF_OFF(ring, index);
    return &(_BUFTBL(ring, cpuid)[bufoff]);
}

trace_evt_ring_t event_ring_create(size_t totalsz, size_t objsz, size_t bufsz);

void event_ring_delete(trace_evt_ring_t ring);

/**
 * @brief drop a buf from ring buffer if there is no other racer
 * assuming that the local scheduler is disable
 */
rt_inline rt_notrace
int event_ring_drop(trace_evt_ring_t ring, const size_t cpuid)
{
    int drops;
    rt_uint32_t cons_head, cons_next, objs_per_buf;
    cons_head = _R(ring)->cons_head;
    objs_per_buf = ring->objs_per_buf;
    /* optimized consumer index to reduce calculations */
    cons_next = (cons_head + objs_per_buf) & _R(ring)->cons_mask;

    if (_R(ring)->prod_tail - cons_head >= objs_per_buf)
    {
        return 0;
    }

    if (atomic_compare_exchange_strong(&_R(ring)->cons_head, &cons_head, cons_next))
    {
        drops = ring->objs_per_buf;
        while (atomic_compare_exchange_weak(&_R(ring)->cons_tail, &cons_head, cons_next))
            ;

        return drops;
    }
    else
        return 0;
}

/**
 * multi-producer safe lock-free ring buftbl enqueue
 *
 */
rt_inline rt_notrace
int event_ring_enqueue(trace_evt_ring_t ring, void *buf, const rt_bool_t override)
{
    const size_t cpuid = rt_hw_cpu_id();

    rt_uint32_t prod_head, prod_next, cons_tail;

    rb_preempt_disable();
    do {
        prod_head = _R(ring)->prod_head;
        prod_next = (prod_head + 1) & _R(ring)->prod_mask;
        cons_tail = _R(ring)->cons_tail;

        /**
         * give a second chance so if a consumer existed meanwhile
         * we may still enqueue and no event will be dropped
         */
        if (prod_next == cons_tail)
        {
            /* applying an atomic with barrier */
            if (prod_head == _R(ring)->prod_head &&
                cons_tail == atomic_load_explicit(&_R(ring)->cons_tail, memory_order_acquire))
            {
                if (override)
                {
                    atomic_fetch_add_explicit(&_R(ring)->drop_events, event_ring_drop(ring, cpuid), memory_order_relaxed);
                }
                else
                {
                    atomic_fetch_add_explicit(&_R(ring)->drop_events, 1, memory_order_relaxed);
                    rb_preempt_enable();
                    return -RT_ENOBUFS;
                }
            }
            continue;
        }
    } while (!atomic_compare_exchange_weak(&_R(ring)->prod_head, &prod_head, prod_next));

    rt_ubase_t *src = buf;
    rt_ubase_t *dst = event_ring_event_loc(ring, prod_head, cpuid);
    /* give more chance for compiler optimization */
    for (size_t i = 0; i < (ring->objsz / sizeof(rt_ubase_t)); i++)
        *dst++ = *src++;

    /**
     * @brief only the outer most writer will update prod_tail to prod_head
     * noted that writer might be interrupted at any time, and the prod_head will be outdated
     *
     * the critical section contains steps:
     * 1. load ring->prod_head
     * 2. load ring->prod_tail and load prod_head, cmp
     * 3. store to prod_tail/prod_head
     *
     * Only after the value updated to prod_tail and the local prod_head match ring->prod_head
     * coherently during can we safely return.
     */
    if (atomic_compare_exchange_strong(&_R(ring)->prod_tail, &prod_head, _R(ring)->prod_head))
    {
        /* now we exit the critical section of ring->prod_head */
        do {
            /* force a memory loading */
            rt_uint32_t head_after_cri_sec;
            head_after_cri_sec = atomic_load_explicit(&_R(ring)->prod_head, memory_order_relaxed);

            /* verify if there are no nested writers during critical section */
            if (head_after_cri_sec != prod_head)
            {
                prod_head = head_after_cri_sec;
                /* no writer competition on this, so no barrier applying */
                atomic_store_explicit(&_R(ring)->prod_tail, prod_head, memory_order_relaxed);
            }
            else
                break;
        } while (1);
    }

    rb_preempt_enable();
    return RT_EOK;
}

/**
 * multi-consumer safe dequeue
 * @note Not in interrupt context, reason same as a normal spin-lock
 */
rt_inline rt_notrace
void *event_ring_dequeue_mc(trace_evt_ring_t ring, void *newbuf)
{
    const size_t cpuid = rt_hw_cpu_id();
    rt_uint32_t cons_head, cons_next, objs_per_buf;
    void *buf;

    objs_per_buf = ring->objs_per_buf;
    rb_preempt_disable();
    do {
        cons_head = _R(ring)->cons_head;
        cons_next = (cons_head + objs_per_buf) & _R(ring)->cons_mask;

        if (_R(ring)->prod_tail - cons_head < objs_per_buf)
        {
            rb_preempt_enable();
            return RT_NULL;
        }
    } while (!atomic_compare_exchange_weak(&_R(ring)->cons_head, &cons_head, cons_next));

    _Atomic(void *) *pbuf = event_ring_buffer_loc(ring, cons_head, cpuid);
    buf = atomic_load_explicit(pbuf, memory_order_relaxed);
    /* synchronize writer that reading this */
    atomic_store_explicit(pbuf, newbuf, memory_order_release);

    /**
     * If there are other dequeues in progress
     * that preceded us, we need to wait for them
     * to complete
     * @note assuming no interrupted reader existed
     */
    while (atomic_compare_exchange_weak(&_R(ring)->cons_tail, &cons_head, cons_next))
        ;

    rb_preempt_enable();
    return buf;
}

rt_inline int event_ring_is_full(trace_evt_ring_t ring, const size_t cpuid)
{
    atomic_thread_fence(memory_order_acquire);
    return ((_R(ring)->prod_head + 1) & _R(ring)->prod_mask) == _R(ring)->cons_tail;
}

rt_inline int event_ring_is_empty(trace_evt_ring_t ring, const size_t cpuid)
{
    atomic_thread_fence(memory_order_acquire);
    return _R(ring)->cons_head == _R(ring)->prod_tail;
}

rt_inline int event_ring_count(trace_evt_ring_t ring, const size_t cpuid)
{
    atomic_thread_fence(memory_order_acquire);
    return (_R(ring)->prod_size + _R(ring)->prod_tail - _R(ring)->cons_tail) & _R(ring)->prod_mask;
}

rt_inline int event_ring_capability_percpu(trace_evt_ring_t ring)
{
    const size_t cpuid = 0;
    return _R(ring)->prod_size;
}

/**
 * @brief Caller must ensure no other writers/readers working on the meanwhile
 */
rt_inline void event_ring_for_each_buffer_lock(
    trace_evt_ring_t ring,
    void (*handler)(trace_evt_ring_t ring, size_t cpuid, void **pbuffer, void *data),
    void *data)
{
    /* for each ring */
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
    {
        /* for each buffer in ring */
        for (size_t index = 0; index < ring->bufs_per_ring; index++)
        {
            _Atomic(void *) *loc = event_ring_buffer_loc(ring, index * ring->objs_per_buf, cpuid);
            handler(ring, cpuid, (void *)loc, data);
        }
    }
}

/**
 * @brief Caller must ensure no other writers/readers working on the meanwhile
 */
rt_inline void event_ring_for_each_event_lock(
    trace_evt_ring_t ring,
    void (*handler)(trace_evt_ring_t ring, size_t cpuid, void *pevent, void *data),
    void *data)
{
    for (size_t cpuid = 0; cpuid < RT_CPUS_NR; cpuid++)
    {
        atomic_thread_fence(memory_order_acquire);
        size_t first_ready = ring->rings[cpuid].cons_tail;
        size_t counts = event_ring_count(ring, cpuid);

        for (size_t index = first_ready; counts--; index = (index + 1) & ring->rings->prod_mask)
        {
            if (!*event_ring_buffer_loc(ring, index, cpuid))
                return ;
            handler(ring, cpuid, event_ring_event_loc(ring, index, cpuid), data);
        }
    }
}

#undef _R
#undef IDX_TO_BUF_OFF
#undef _BUFTBL
#undef IDX_TO_BUF
#undef IDX_TO_OBJ_OFF
#undef OFF_TO_OBJ
#endif /* __TRACE_EVENT_RING_H__ */
