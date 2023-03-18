
/**
 * @brief using ring buffer to debug mapping
 */
#include "map_tracer.h"
#include "mm_flag.h"
#include <rtthread.h>
#include <mmu.h>
#include <mm_aspace.h>
#include <ringbuffer.h>

/* RING BUFFER for map tracer */
const static size_t _map_trace_rbuf_sz = 32ul << 10;
static ring_buffer_t _map_trace_rbuf;
static void *_map_trace_rbuf_va;

/* RING BUFFER for aspace tracer */
const static size_t _aspace_trace_rbuf_sz = 16ul << 10;
static ring_buffer_t _aspace_trace_rbuf;
static void *_aspace_trace_rbuf_va;

/* INNER STATUS */
static int _enable;
static rt_aspace_t watch_aspace;

/* SPIN LOCK */
static struct rt_spinlock rbuf_spinlock;

static int _backtrace_skipn(int level, void *buf[], int slot_cnt);

void maping_tracer_init(void)
{
    void *prefer = NULL;
    int ret;
    rt_spin_lock_init(&rbuf_spinlock);

    ret = rt_aspace_map(&rt_kernel_space, &prefer, _map_trace_rbuf_sz, MMU_MAP_K_RWCB, MMF_PREFETCH, &rt_mm_dummy_mapper, 0);
    _map_trace_rbuf_va = prefer;
    RT_ASSERT(ret == 0);

    ret = rt_aspace_map(&rt_kernel_space, &prefer, _aspace_trace_rbuf_sz, MMU_MAP_K_RWCB, MMF_PREFETCH, &rt_mm_dummy_mapper, 0);
    _aspace_trace_rbuf_va = prefer;
    RT_ASSERT(ret == 0);
}

void maping_tracer_start(rt_aspace_t aspace)
{
    ring_buffer_init(&_map_trace_rbuf, _map_trace_rbuf_va, _map_trace_rbuf_sz);
    ring_buffer_init(&_aspace_trace_rbuf, _aspace_trace_rbuf_va, _aspace_trace_rbuf_sz);

    _enable = 1;
    watch_aspace = aspace;
}

RT_CTASSERT(power_of_2, RING_BUFFER_IS_POWER_OF_TWO(sizeof(struct mtracer_entry)));

void maping_tracer_mmu_add(void *pgtbl, mtracer_entry_t entry)
{
    if (!_enable || watch_aspace->page_table != pgtbl)
        return ;

    rt_spin_lock(&rbuf_spinlock);
    ring_buffer_queue_arr(&_map_trace_rbuf, (void *)entry, sizeof(struct mtracer_entry));
    rt_spin_unlock(&rbuf_spinlock);
}

#define BACKTRACE_SLOT (sizeof(struct mtracer_aspace_entry)/sizeof(void *))

void maping_tracer_aspace_add(rt_aspace_t aspace, void *vaddr, size_t size)
{
    // return ;
    if (!_enable || watch_aspace != aspace)
        return ;

    struct mtracer_aspace_entry entry;
    entry.size = size;
    entry.vaddr = vaddr;
    _backtrace_skipn(1, entry.backtrace, BACKTRACE_SLOT);

    rt_spin_lock(&rbuf_spinlock);
    ring_buffer_queue_arr(&_aspace_trace_rbuf, (void *)&entry, sizeof(entry));
    rt_spin_unlock(&rbuf_spinlock);
}

void _dump_backtrace(mtracer_aspace_entry_t entry)
{
    void **buf = entry->backtrace;
    for (size_t i = 0; i < BACKTRACE_SLOT && buf[i]; i++)
    {
        rt_kprintf("%p ", buf[i]);
    }
}

void maping_trace_dump(rt_aspace_t aspace)
{
    if (!_enable || watch_aspace != aspace)
        return ;

    size_t item;
    /* MMU operations */
    rt_kprintf("start dumping\n");
    item = ring_buffer_num_items(&_map_trace_rbuf);
    item /= sizeof(struct mtracer_entry);

    for (size_t i = 0; i < item; i++)
    {
        mtracer_entry_t iter = &((mtracer_entry_t)_map_trace_rbuf_va)[i];
        rt_kprintf("%s: %p\n", iter->is_unmap ? "unmap" : "map", iter->vaddr);
    }

    /* ASPACE operations */
    rt_kprintf("aspace operations & backtrace\n");
    item = ring_buffer_num_items(&_aspace_trace_rbuf);
    item /= sizeof(struct mtracer_aspace_entry);

    for (size_t i = 0; i < item; i++)
    {
        mtracer_aspace_entry_t iter = &((mtracer_aspace_entry_t)_aspace_trace_rbuf_va)[i];
        rt_kprintf("%p size %p: ", iter->vaddr, iter->size);
        _dump_backtrace(iter);
        rt_kprintf("\n\n");
    }
}

void maping_tracer_stop(rt_aspace_t aspace)
{
    if (!_enable || watch_aspace != aspace)
        return ;
    rt_kprintf("tracing stop\n");

    _enable = 0;
    watch_aspace = NULL;
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
