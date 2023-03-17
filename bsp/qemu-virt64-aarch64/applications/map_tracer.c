
/**
 * @brief using ring buffer to debug mapping
 */
#include "map_tracer.h"
#include "mm_flag.h"
#include "rtdef.h"
#include <mmu.h>
#include <mm_aspace.h>
#include <ringbuffer.h>

const static size_t _trace_buf_size = 16ul << 10;
static ring_buffer_t _trace_ring_buf;
static void *_trace_buffer_va;
static int _enable;
static rt_aspace_t watch_aspace;

void maping_tracer_init(void)
{
    void *prefer = NULL;
    int ret = rt_aspace_map(&rt_kernel_space, &prefer, _trace_buf_size, MMU_MAP_K_RWCB, MMF_PREFETCH, &rt_mm_dummy_mapper, 0);
    _trace_buffer_va = prefer;
    RT_ASSERT(ret == 0);
}

void maping_tracer_start(rt_aspace_t aspace)
{
    ring_buffer_init(&_trace_ring_buf, _trace_buffer_va, _trace_buf_size);
    _enable = 1;
    watch_aspace = aspace;
    rt_kprintf("tracing start\n");
}

RT_CTASSERT(power_of_2, RING_BUFFER_IS_POWER_OF_TWO(sizeof(struct mtracer_entry)));

void maping_tracer_add(void *pgtbl, mtracer_entry_t entry)
{
    if (!_enable || watch_aspace->page_table != pgtbl)
        return ;

    ring_buffer_queue_arr(&_trace_ring_buf, (void *)entry, sizeof(struct mtracer_entry));
}

void maping_trace_dump(rt_aspace_t aspace)
{
    if (!_enable || watch_aspace != aspace)
        return ;

    rt_kprintf("start dumping\n");
    /* count item */
    size_t item = ring_buffer_num_items(&_trace_ring_buf);
    item /= sizeof(struct mtracer_entry);

    for (size_t i = 0; i < item; i++)
    {
        mtracer_entry_t iter = &((mtracer_entry_t)_trace_buffer_va)[i];
        rt_kprintf("%s: %p\n", iter->is_unmap ? "unmap" : "map", iter->vaddr);
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
