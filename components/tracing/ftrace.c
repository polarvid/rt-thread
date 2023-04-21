/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */

#include <stdatomic.h>
#define DBG_TAG "tracing.ftrace"
#define DBG_LVL DBG_INFO
#include <rtdbg.h>

#include <rtthread.h>
#include <rthw.h>
#include "arch/aarch64.h"
#include "event-ring.h"
#include "ftrace.h"
#include "internal.h"
#include <cpuport.h>

/* for qsort utility */
#include <stdlib.h>

static ftrace_tracer_t tracers_list;

void ftrace_tracer_init(ftrace_tracer_t tracer, ftrace_trace_fn_t handler, void *data)
{
    RT_ASSERT(tracer);
    rt_memset(tracer, 0, sizeof(*tracer));

    tracer->on_entry = handler;
    tracer->data = data;
    rt_list_init(&tracer->node);
    return ;
}

int ftrace_tracer_register(ftrace_tracer_t tracer)
{
    RT_ASSERT(tracer->enabled == 0);

    if (tracers_list)
    {
        rt_list_insert_after(&tracers_list->node, &tracer->node);
    }
    else
    {
        tracers_list = tracer;
        _ftrace_enable_global();
    }

    tracer->enabled = RT_TRUE;
    /* cache flush smp, mb */
    rt_hw_dmb();
    rt_hw_isb();
    return 0;
}

int ftrace_tracer_unregister(ftrace_tracer_t tracer)
{
    tracer->enabled = 0;
    /* free to remove the trace point */
    tracer->unregistered = 1;
    /* cache flush smp, mb */
    rt_hw_dmb();

    if (tracers_list != tracer)
    {
        rt_list_remove(&tracer->node);
    }
    else
    {
        tracers_list = RT_NULL;
    }

    /* we exploit a lazy method to restore codes modification */

    return 0;
}

static int _set_trace(ftrace_tracer_t tracer, void *fn)
{
    int err;
    err = _ftrace_patch_code(fn, RT_TRUE);
    if (!err)
    {
        err = _ftrace_hook_tracer(fn, tracer, RT_TRUE);
        if (!err)
        {
            tracer->trace_point_cnt += 1;
        }
    }
    else if (tracer == _ftrace_get_tracer(fn))
    {
        err = RT_EOK;
    }
    return err;
}

/* for several trace points only */
int ftrace_tracer_set_trace(ftrace_tracer_t tracer, void *fn)
{
    int err;
    rt_bool_t existed;

    existed = _ftrace_symtbl_entry_exist(fn);

    if (existed == RT_TRUE)
    {
        err = _set_trace(tracer, fn);
    }
    else
    {
        err = -RT_ENOENT;
    }
    return err;
}

rt_notrace
int ftrace_tracer_remove_trace(ftrace_tracer_t tracer, void *fn)
{
    int err;

    err = _ftrace_patch_code(fn, RT_FALSE);
    if (!err)
    {
        err = _ftrace_hook_tracer(fn, tracer, RT_FALSE);
        if (!err)
        {
            tracer->trace_point_cnt -= 1;
        }
    }

    return err;
}

struct _param {
    ftrace_tracer_t tracer;
    void **notrace;
    size_t notrace_cnt;
};

static int _is_notrace(void *entry, struct _param *param)
{
    while (1)
    {
        if (entry < param->notrace[0])
            return 0;

        if (entry == param->notrace[0])
        {
            param->notrace_cnt--;
            param->notrace++;
            return 1;
        }
        else
        {
            param->notrace_cnt--;
            param->notrace++;
        }
    }
}

static void _set_trace_with_entires(void *symbol, void *data)
{
    // skip notrace here
    struct _param *param = data;
    if (param->notrace_cnt && _is_notrace(symbol, param))
        return ;

    int err;
    err = _set_trace(param->tracer, symbol);
    if (err)
    {
        LOG_W("set trace failed %d", err);
    }
}

static int _compare_address_asc(const void *a, const void *b)
{
   return (*(int*)a - *(int*)b);
}

/* for several notrace points only */
int ftrace_tracer_set_except(ftrace_tracer_t tracer, void *notrace[], size_t notrace_cnt)
{
    struct _param param = {
        .tracer = tracer,
        .notrace = notrace,
        .notrace_cnt = notrace_cnt
    };
    qsort(notrace, notrace_cnt, sizeof(void*), _compare_address_asc);
    _ftrace_symtbl_for_each(_set_trace_with_entires, &param);
    return 0;
}

/* current implementation of enter/exit critical is unreasonable */
#define stack_prot_threshold    0x2000

/* generic entry to test if tracer is ready to handle trace event */
rt_notrace
rt_ubase_t ftrace_trace_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    rt_ubase_t stat = TRACER_STAT_NONE;

    if (tracer)
    {
        if (tracer->enabled || tracer->unregistered)
        {
            /* detect recursion & stack overflow */
            rt_thread_t tid = rt_thread_self();
            rb_preempt_disable();
            if (tid && (
                    (tid->stacked_trace > 0 && rt_interrupt_get_nest() > 1)
                    || ((char *)tid->sp - stack_prot_threshold < (char *)tid->stack_addr)))
            {
                rb_preempt_enable();
                return 0;
            }
            rb_preempt_enable();

            if (tracer->enabled)
            {
                atomic_fetch_add_explicit(&tid->stacked_trace, 1, memory_order_relaxed);
                stat = tracer->on_entry(tracer, pc, ret_addr, context);
                atomic_fetch_add_explicit(&tid->stacked_trace, -1, memory_order_relaxed);
            }
            else
            {
                /* we don't care if the disabled fails */
                ftrace_tracer_remove_trace(tracer, FTRACE_PC_TO_SYM(pc));
            }
        }
    }

    return stat;
}

rt_notrace
void ftrace_trace_exit(ftrace_tracer_t tracer, rt_ubase_t entry_pc, rt_ubase_t stat, void *context)
{
    /* tracer always exist & enabled */
    if (tracer->on_exit)
    {
        /* no need for recursion test */

        tracer->on_exit(tracer, entry_pc, stat, context);
    }
    return ;
}
