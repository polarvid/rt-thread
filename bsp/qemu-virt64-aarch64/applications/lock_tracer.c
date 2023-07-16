
/**
 * @brief using ring buffer to debug mapping
 */
#include <rtthread.h>
#include <rthw.h>
#include <mmu.h>
#include <mm_aspace.h>
#include <ringbuffer.h>
#include "mm_flag.h"
#include "lock_tracer.h"
#include "rtdef.h"

/* RING BUFFER for lock tracer */
const static size_t _lock_tracer_rbuf_sz = 1ul << 20;
static ring_buffer_t _lock_tracer_rbuf;
static void *_lock_tracer_rbuf_va;

/* INNER STATUS */
static int _enable;

/* SPIN LOCK */
static rt_hw_spinlock_t rbuf_spinlock;

static int _backtrace_skipn(int level, void *buf[], int slot_cnt);

void lock_tracer_init(void)
{
    void *prefer = NULL;
    int ret;
    rt_hw_spin_lock_init(&rbuf_spinlock);

    ret = rt_aspace_map(&rt_kernel_space, &prefer, _lock_tracer_rbuf_sz, MMU_MAP_K_RWCB, MMF_PREFETCH, &rt_mm_dummy_mapper, 0);
    _lock_tracer_rbuf_va = prefer;
    RT_ASSERT(ret == 0);
}

void lock_tracer_start(rt_thread_t thread)
{
    ring_buffer_init(&_lock_tracer_rbuf, _lock_tracer_rbuf_va, _lock_tracer_rbuf_sz);

    _enable = 0;
}

rt_inline rt_bool_t _not_the_thread(rt_thread_t thread)
{
    return !(strcmp(thread->parent.name, "timer_thread") == 0);
}

RT_CTASSERT(power_of_2, RING_BUFFER_IS_POWER_OF_TWO(sizeof(struct lock_trace_entry)));

#define BACKTRACE_SLOT (sizeof(struct lock_trace_entry)/sizeof(void *))

void lock_tracer_add(rt_thread_t thread, rt_bool_t is_lock)
{
    // return ;
    if (!_enable || _not_the_thread(thread))
        return ;

    struct lock_trace_entry entry;
    entry.current_nest = thread->cpus_lock_nest;
    entry.is_lock = is_lock;
    entry.tid = thread->tid;
    _backtrace_skipn(1, entry.backtrace, BACKTRACE_SLOT);

    rt_hw_spin_lock(&rbuf_spinlock);
    ring_buffer_queue_arr(&_lock_tracer_rbuf, (void *)&entry, sizeof(entry));
    rt_hw_spin_unlock(&rbuf_spinlock);
}

void _dump_backtrace(lock_trace_entry_t entry)
{
    void **buf = entry->backtrace;
    for (size_t i = 0; i < BACKTRACE_SLOT && buf[i]; i++)
    {
        rt_kprintf("%p ", buf[i]);
    }
}

void lock_trace_dump(rt_thread_t thread)
{
    if (!_enable || _not_the_thread(thread))
        return ;

    size_t item;

    /* ASPACE operations */
    rt_kprintf("lock operations & backtrace\n");
    item = ring_buffer_num_items(&_lock_tracer_rbuf);
    item /= sizeof(struct lock_trace_entry);

    for (size_t i = 0; i < item; i++)
    {
        lock_trace_entry_t iter = &((lock_trace_entry_t)_lock_tracer_rbuf_va)[i];
        rt_kprintf("%s nested-layer %d tid %d: ", iter->is_lock ? "LOCK":"UNLOCK", iter->current_nest, iter->tid);
        _dump_backtrace(iter);
        rt_kprintf("\n\n");
    }
}

void lock_tracer_stop(rt_thread_t thread)
{
    if (!_enable || _not_the_thread(thread))
        return ;
    rt_kprintf("tracing stop\n");

    _enable = 0;
}

/* TRACER BACKTRACE */

struct bt_frame
{
    unsigned long fp;
    unsigned long pc;
};

static int unwind_frame(struct bt_frame *frame)
{
    unsigned long fp = frame->fp;

#ifdef ARCH_ENABLE_SOFT_KASAN
    fp |= 0xff00000000000000;
#endif

    if ((fp & 0x7)
#ifdef RT_USING_LWP
         || fp < KERNEL_VADDR_START
#endif
            )
    {
        return 1;
    }
    frame->fp = *(unsigned long *)fp;
    frame->pc = *(unsigned long *)(fp + 8);
    return 0;
}

static inline void put_in(void *buf[], int slot_cnt, void *data)
{
    if (slot_cnt > 0)
        *buf = data;
}

static void walk_unwind(unsigned long pc, unsigned long fp, void *buf[], int slot_cnt)
{
    struct bt_frame frame;
    unsigned long lr = pc;

    frame.fp = fp;
    while (slot_cnt > 1)
    {
        put_in(buf++, slot_cnt--, (void *)lr - 4);
        if (unwind_frame(&frame))
        {
            break;
        }
        lr = frame.pc;
    }
}

static void backtrace(unsigned long lr, unsigned long fp, void *buf[], int slot_cnt)
{
    // rt_kprintf("please use: addr2line -e rtthread.elf -a -f ");
    walk_unwind(lr, fp, buf, slot_cnt);
}

static int _backtrace_skipn(int level, void *buf[], int slot_cnt)
{
    unsigned long lr;
    unsigned long fp = (unsigned long)__builtin_frame_address(0U);

    /* skip current frames */
    struct bt_frame frame;
    frame.fp = fp;

    /* skip n frames */
    do
    {
        if (unwind_frame(&frame))
            return -RT_ERROR;
        lr = frame.pc;

        /* INFO: level is signed integer */
    } while (level-- > 0);

    backtrace(lr, frame.fp, buf, slot_cnt);
    return 0;
}
