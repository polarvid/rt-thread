/**************************************************************************
 *
 * Copyright (c) 2007,2008 Kip Macy kmacy@freebsd.org
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. The name of Kip Macy nor the names of other
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 *
 ***************************************************************************/
#define DBG_TAG "tracing.ringbuffer"
#define DBG_LVL DBG_INFO
#include <rtdbg.h>

#include "ringbuffer.h"

#include <lwp_arch.h>
#include <mm_aspace.h>
#include <mmu.h>
#include <rtthread.h>

#define POWER_OF_2(n) (n != 0 && ((n) & ((n) - 1)) == 0)

rt_inline int clz(unsigned long number)
{
    return rt_hw_ffz(~number);
}

struct ring_buf *
ring_buf_create(size_t count, size_t objsz, size_t bufsz)
{
    struct ring_buf *rb;

    RT_ASSERT(POWER_OF_2(count));
    RT_ASSERT(POWER_OF_2(bufsz));
    /* objsz should be multiples of 8 */
    RT_ASSERT(!(objsz & (sizeof(rt_ubase_t) - 1)));
    RT_ASSERT(count * objsz > bufsz);

    const size_t tblsz = (count * objsz / bufsz) * sizeof(rb->buftbl[0]);

    rb = rt_malloc(sizeof(*rb) + tblsz);

    if (!rb)
        return RT_NULL;
    rt_memset(&rb->buftbl, 0, tblsz);
    rb->buf_mask = bufsz / objsz - 1;

#ifdef DEBUG_BUFRING
    rb->br_lock = lock;
#endif
    rb->prod_size = rb->cons_size = count;
    rb->prod_mask = rb->cons_mask = count - 1;
    rb->prod_head = rb->cons_head = 0;
    rb->prod_tail = rb->cons_tail = 0;

    return rb;
}

void
ring_buf_delete(struct ring_buf *rb)
{
    rt_free(rb);
}
