/*-
 * SPDX-License-Identifier: BSD-2-Clause-FreeBSD
 *
 * Copyright (c) 2007-2009 Kip Macy <kmacy@freebsd.org>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 * $FreeBSD$
 *
 */

#ifndef    _SYS_BUF_RING_H_
#define    _SYS_BUF_RING_H_

#include <rtthread.h>
#include <rthw.h>
#include <cpuport.h>
#include <ftrace.h>

#include <stdatomic.h>

#define CACHE_LINE_SIZE 64
#define IDX_TO_OFF_IN_BUF(rb, idx)      ((rt_ubase_t)(idx) & (rb)->buf_mask)
#define IDX_TO_OFF_IN_TBL(rb, idx)      (((rt_ubase_t)(idx) & ~(rb)->buf_mask) >> (__builtin_ffsl(~(rb)->buf_mask) - 1))
#define IDX_TO_BUF(rb, idx)             (atomic_load_explicit(&(rb)->buftbl[IDX_TO_OFF_IN_TBL(rb, idx)], memory_order_acquire))
#define OFF_TO_OBJ(rb, idx, objshift)   (IDX_TO_BUF(rb, idx) + (IDX_TO_OFF_IN_BUF(rb, idx) << (objshift)))

struct ring_buf {
    _Atomic(uint32_t)   prod_head;
    _Atomic(uint32_t)   prod_tail;
    int                 prod_size;
    int                 prod_mask;
    uint64_t            drops;

    rt_align(CACHE_LINE_SIZE)
    _Atomic(uint32_t)   cons_head;
    _Atomic(uint32_t)   cons_tail;
    int                 cons_size;
    int                 cons_mask;

    rt_align(CACHE_LINE_SIZE)
#ifdef DEBUG_BUFRING
    struct mtx          *br_lock;
#endif
    int                 buf_mask;
    _Atomic(void *)     buftbl[0];
};

/* current implementation of enter/exit critical is unreasonable */
// rt_enter_critical();
#define rb_preempt_disable()    rt_ubase_t level = rt_hw_local_irq_disable();

// rt_exit_critical();
#define rb_preempt_enable()     rt_hw_local_irq_enable(level)

/**
 * multi-producer safe lock-free ring buftbl enqueue
 *
 */
rt_inline rt_notrace
int ring_buf_enqueue(struct ring_buf *rb, void *buf, const size_t objsz)
{
    uint32_t prod_head, prod_next, cons_tail;
#ifdef DEBUG_BUFRING
    int i;

    /**
     * Note: It is possible to encounter an mbuf that was removed
     * via drbr_peek(), and then re-added via drbr_putback() and
     * trigger a spurious panic.
     */
    for (i = rb->cons_head; i != rb->prod_head;
         i = ((i + 1) & rb->cons_mask))
        if(rb->buftbl[i] == buf)
            panic("buf=%p already enqueue at %d prod=%d cons=%d",
                buf, i, rb->prod_tail, rb->cons_tail);
#endif

    rb_preempt_disable();
    do {
        prod_head = rb->prod_head;
        prod_next = (prod_head + 1) & rb->prod_mask;
        cons_tail = rb->cons_tail;

        /**
         * give a second chance so if a consumer existed meanwhile
         * we may still enqueue and no event will be dropped
         */
        if (prod_next == cons_tail)
        {
            /* applying an atomic with barrier */
            if (prod_head == rb->prod_head &&
                cons_tail == atomic_load_explicit(&rb->cons_tail, memory_order_acquire))
            {
                rb->drops++;
                rb_preempt_enable();
                return -RT_ENOBUFS;
            }
            continue;
        }
    } while (!atomic_compare_exchange_weak(&rb->prod_head, &prod_head, prod_next));
#ifdef DEBUG_BUFRING
    if (rb->buftbl[prod_head] != NULL)
        panic("dangling value in enqueue");
#endif

    const size_t objshift = __builtin_ffsl(objsz) - 1;
    rt_ubase_t *src = buf;
    rt_ubase_t *dst = OFF_TO_OBJ(rb, prod_head, objshift);
    /* give more chance for compiler optimization */
    for (size_t i = 0; i < (objsz / sizeof(rt_ubase_t)); i++)
        *dst = *src;

    /**
     * @brief only the outer most writer will update prod_tail to prod_head
     * noted that writer might be interrupted at any time, and the prod_head will be outdated
     *
     * the critical section contains steps:
     * 1. load rb->prod_head
     * 2. load rb->prod_tail and load prod_head, cmp
     * 3. store to prod_tail/prod_head
     *
     * Only after the value updated to prod_tail and the local prod_head match rb->prod_head
     * coherently during can we safely return.
     */
    if (atomic_compare_exchange_strong(&rb->prod_tail, &prod_head, rb->prod_head))
    {
        /* now we exit the critical section of rb->prod_head */
        do {
            /* force a memory loading */
            uint32_t head_after_cri_sec;
            head_after_cri_sec = atomic_load_explicit(&rb->prod_head, memory_order_relaxed);

            /* verify if there are no nested writers during critical section */
            if (head_after_cri_sec != prod_head)
            {
                prod_head = head_after_cri_sec;
                /* no writer competition on this, so no barrier applying */
                atomic_store_explicit(&rb->prod_tail, prod_head, memory_order_relaxed);
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
 @note Not in interrupt context, reason same as a normal spin-lock
 */
#if 1
rt_inline rt_notrace
void *ring_buf_dequeue_mc(struct ring_buf *rb, void *newbuf, const size_t objsz)
{
    uint32_t cons_head, cons_next;
    void *buf;

    rb_preempt_disable();
    do {
        cons_head = rb->cons_head;
        cons_next = (cons_head + rb->buf_mask + 1) & rb->cons_mask;

        if (cons_head == rb->prod_tail)
        {
            rb_preempt_enable();
            return (NULL);
        }
    } while (!atomic_compare_exchange_weak(&rb->cons_head, &cons_head, cons_next));

    _Atomic(void *) *pbuf = &rb->buftbl[IDX_TO_OFF_IN_TBL(rb, cons_head)];
    buf = atomic_load_explicit(pbuf, memory_order_relaxed);
    /* synchronize writer that reading this */
    atomic_store_explicit(pbuf, newbuf, memory_order_release);

#ifdef DEBUG_BUFRING
    rb->buftbl[cons_head] = NULL;
#endif

    /**
     * If there are other dequeues in progress
     * that preceded us, we need to wait for them
     * to complete
     * @note assuming no interrupted reader existed
     */
    while (atomic_compare_exchange_weak(&rb->cons_tail, &cons_head, cons_next))
        ;

    rb_preempt_enable();

    return buf;
}
#endif

#if 0
/*
 * single-consumer dequeue
 * use where dequeue is protected by a lock
 * e.g. a network driver's tx queue lock
 */
rt_inline void *
buf_ring_dequeue_sc(struct ring_buf *br)
{
    uint32_t cons_head, cons_next;
#ifdef PREFETCH_DEFINED
    uint32_t cons_next_next;
#endif
    uint32_t prod_tail;
    void *buf;

    /*
     * This is a workaround to allow using buf_ring on ARM and ARM64.
     * ARM64TODO: Fix buf_ring in a generic way.
     * REMARKS: It is suspected that cons_head does not require
     *   load_acq operation, but this change was extensively tested
     *   and confirmed it's working. To be reviewed once again in
     *   FreeBSD-12.
     *
     * Preventing following situation:

     * Core(0) - ring_buf_enqueue()                                       Core(1) - buf_ring_dequeue_sc()
     * -----------------------------------------                                       ----------------------------------------------
     *
     *                                                                                cons_head = br->cons_head;
     * atomic_cmpset_acq_32(&br->prod_head, ...));
     *                                                                                buf = br->buftbl[cons_head];     <see <1>>
     * br->buftbl[prod_head] = buf;
     * atomic_store_rel_32(&br->prod_tail, ...);
     *                                                                                prod_tail = br->prod_tail;
     *                                                                                if (cons_head == prod_tail)
     *                                                                                        return (NULL);
     *                                                                                <condition is false and code uses invalid(old) buf>`
     *
     * <1> Load (on core 1) from br->buftbl[cons_head] can be reordered (speculative readed) by CPU.
     */
#if defined(__arm__) || defined(__aarch64__)
    cons_head = atomic_load_acq_32(&br->cons_head);
#else
    cons_head = br->cons_head;
#endif
    prod_tail = atomic_load_acq_32(&br->prod_tail);

    cons_next = (cons_head + 1) & br->cons_mask;
#ifdef PREFETCH_DEFINED
    cons_next_next = (cons_head + 2) & br->cons_mask;
#endif

    if (cons_head == prod_tail)
        return (NULL);

#ifdef PREFETCH_DEFINED
    if (cons_next != prod_tail) {
        prefetch(br->buftbl[cons_next]);
        if (cons_next_next != prod_tail)
            prefetch(br->buftbl[cons_next_next]);
    }
#endif
    br->cons_head = cons_next;
    buf = br->buftbl[cons_head];

#ifdef DEBUG_BUFRING
    br->buftbl[cons_head] = NULL;
    if (!mtx_owned(br->br_lock))
        panic("lock not held on single consumer dequeue");
    if (br->cons_tail != cons_head)
        panic("inconsistent list cons_tail=%d cons_head=%d",
            br->cons_tail, cons_head);
#endif
    br->cons_tail = cons_next;
    return (buf);
}

/*
 * single-consumer advance after a peek
 * use where it is protected by a lock
 * e.g. a network driver's tx queue lock
 */
rt_inline void
buf_ring_advance_sc(struct ring_buf *br)
{
    uint32_t cons_head, cons_next;
    uint32_t prod_tail;

    cons_head = br->cons_head;
    prod_tail = br->prod_tail;

    cons_next = (cons_head + 1) & br->cons_mask;
    if (cons_head == prod_tail)
        return;
    br->cons_head = cons_next;
#ifdef DEBUG_BUFRING
    br->buftbl[cons_head] = NULL;
#endif
    br->cons_tail = cons_next;
}

/*
 * Used to return a buftbl (most likely already there)
 * to the top of the ring. The caller should *not*
 * have used any dequeue to pull it out of the ring
 * but instead should have used the peek() function.
 * This is normally used where the transmit queue
 * of a driver is full, and an mbuf must be returned.
 * Most likely whats in the ring-buftbl is what
 * is being put back (since it was not removed), but
 * sometimes the lower transmit function may have
 * done a pullup or other function that will have
 * changed it. As an optimization we always put it
 * back (since jhb says the store is probably cheaper),
 * if we have to do a multi-queue version we will need
 * the compare and an atomic.
 */
rt_inline void
buf_ring_putback_sc(struct ring_buf *br, void *new)
{
    KASSERT(br->cons_head != br->prod_tail,
        ("Buf-Ring has none in putback")) ;
    br->buftbl[br->cons_head] = new;
}

/*
 * return a pointer to the first entry in the ring
 * without modifying it, or NULL if the ring is empty
 * race-prone if not protected by a lock
 */
rt_inline void *
buf_ring_peek(struct ring_buf *br)
{

#ifdef DEBUG_BUFRING
    if ((br->br_lock != NULL) && !mtx_owned(br->br_lock))
        panic("lock not held on single consumer dequeue");
#endif
    /*
     * I believe it is safe to not have a memory barrier
     * here because we control cons and tail is worst case
     * a lagging indicator so we worst case we might
     * return NULL immediately after a buftbl has been enqueued
     */
    if (br->cons_head == br->prod_tail)
        return (NULL);

    return (br->buftbl[br->cons_head]);
}

rt_inline void *
buf_ring_peek_clear_sc(struct ring_buf *br)
{
#ifdef DEBUG_BUFRING
    void *ret;

    if (!mtx_owned(br->br_lock))
        panic("lock not held on single consumer dequeue");
#endif

    if (br->cons_head == br->prod_tail)
        return (NULL);

#if defined(__arm__) || defined(__aarch64__)
    /*
     * The barrier is required there on ARM and ARM64 to ensure, that
     * br->buftbl[br->cons_head] will not be fetched before the above
     * condition is checked.
     * Without the barrier, it is possible, that buftbl will be fetched
     * before the enqueue will put mbuf into br, then, in the meantime, the
     * enqueue will update the array and the prod_tail, and the
     * conditional check will be true, so we will return previously fetched
     * (and invalid) buftbl.
     */
    atomic_thread_fence_acq();
#endif

#ifdef DEBUG_BUFRING
    /*
     * Single consumer, i.e. cons_head will not move while we are
     * running, so atomic_swap_ptr() is not necessary here.
     */
    ret = br->buftbl[br->cons_head];
    br->buftbl[br->cons_head] = NULL;
    return (ret);
#else
    return (br->buftbl[br->cons_head]);
#endif
}
#endif /* not used */

rt_inline int
buf_ring_full(struct ring_buf *br)
{

    return (((br->prod_head + 1) & br->prod_mask) == br->cons_tail);
}

rt_inline int
buf_ring_empty(struct ring_buf *br)
{

    return (br->cons_head == br->prod_tail);
}

rt_inline int
buf_ring_count(struct ring_buf *br)
{

    return ((br->prod_size + br->prod_tail - br->cons_tail)
        & br->prod_mask);
}

struct ring_buf *ring_buf_create(size_t count, size_t objsz, size_t bufsz);
void ring_buf_delete(struct ring_buf *br);

#endif
