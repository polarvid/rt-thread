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

#define _R(ring)                            (&(ring)->rings[cpuid])
#define IDX_TO_OFF_IN_BUF(ring, idx)        ((rt_ubase_t)(idx) & _R(ring)->buf_mask)
#define IDX_TO_OFF_IN_TBL(ring, idx)        (((rt_ubase_t)(idx) & ~_R(ring)->buf_mask) >> (__builtin_ffsl(~_R(ring)->buf_mask) - 1))
#define IDX_TO_BUF(ring, idx)               (atomic_load_explicit(&_R(ring)->buftbl[IDX_TO_OFF_IN_TBL(ring, idx)], memory_order_acquire))
#define OFF_TO_OBJ(ring, idx, objshift)     (IDX_TO_BUF(ring, idx) + (IDX_TO_OFF_IN_BUF(ring, idx) << (objshift)))

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
        rt_uint64_t drop_events;

        /** reading is allowed on any cores */
        rt_align(CACHE_LINE_SIZE)
        _Atomic(uint32_t) cons_head;
        _Atomic(uint32_t) cons_tail;
        int cons_size;
        int cons_mask;

        /** reader can hook a buffer and wait for
         * the asynchronous completion */
        void *listener;

        rt_align(CACHE_LINE_SIZE)
        int buf_mask;
        _Atomic(void *) buftbl[0];
    } rings[RT_CPUS_NR];

} *trace_evt_ring_t;

/* current implementation of enter/exit critical is unreasonable */
// rt_enter_critical();
#define rb_preempt_disable()    rt_ubase_t level = rt_hw_local_irq_disable();

// rt_exit_critical();
#define rb_preempt_enable()     rt_hw_local_irq_enable(level)

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
    rt_uint32_t cons_head, cons_next;
    cons_head = _R(ring)->cons_head;

    /* optimized consumer index to reduce calculations */
    cons_next = (cons_head + _R(ring)->buf_mask + 1) & _R(ring)->cons_mask;

    if (cons_head == _R(ring)->prod_tail)
    {
        return 0;
    }

    if (atomic_compare_exchange_strong(&_R(ring)->cons_head, &cons_head, cons_next))
    {
        drops = _R(ring)->buf_mask + 1;
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
int event_ring_enqueue(trace_evt_ring_t ring, void *buf, const size_t objsz, const rt_bool_t override)
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
                    _R(ring)->drop_events += event_ring_drop(ring, cpuid);
                }
                else
                {
                    rt_kprintf("drop one\n");
                    _R(ring)->drop_events++;
                    rb_preempt_enable();
                    return -RT_ENOBUFS;
                }
            }
            continue;
        }
    } while (!atomic_compare_exchange_weak(&_R(ring)->prod_head, &prod_head, prod_next));

    const size_t objshift = __builtin_ffsl(objsz) - 1;
    rt_ubase_t *src = buf;
    rt_ubase_t *dst = OFF_TO_OBJ(ring, prod_head, objshift);
    /* give more chance for compiler optimization */
    for (size_t i = 0; i < (objsz / sizeof(rt_ubase_t)); i++)
        *dst = *src;

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
    return (0);
}

/**
 * multi-consumer safe dequeue
 * @note Not in interrupt context, reason same as a normal spin-lock
 */
rt_inline rt_notrace
void *event_ring_dequeue_mc(trace_evt_ring_t ring, void *newbuf, const size_t objsz)
{
    const size_t cpuid = rt_hw_cpu_id();
    rt_uint32_t cons_head, cons_next;
    void *buf;

    rb_preempt_disable();
    do {
        cons_head = _R(ring)->cons_head;
        cons_next = (cons_head + _R(ring)->buf_mask + 1) & _R(ring)->cons_mask;

        if (cons_next > _R(ring)->prod_tail)
        {
            rb_preempt_enable();
            return (NULL);
        }
    } while (!atomic_compare_exchange_weak(&_R(ring)->cons_head, &cons_head, cons_next));

    _Atomic(void *) *pbuf = &_R(ring)->buftbl[IDX_TO_OFF_IN_TBL(ring, cons_head)];
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
    return ((_R(ring)->prod_head + 1) & _R(ring)->prod_mask) == _R(ring)->cons_tail;
}

rt_inline int event_ring_is_empty(trace_evt_ring_t ring, const size_t cpuid)
{
    return _R(ring)->cons_head == _R(ring)->prod_tail;
}

rt_inline int event_ring_count(trace_evt_ring_t ring, const size_t cpuid)
{
    return (_R(ring)->prod_size + _R(ring)->prod_tail - _R(ring)->cons_tail) & _R(ring)->prod_mask;
}

#undef _R

#endif /* __TRACE_EVENT_RING_H__ */
