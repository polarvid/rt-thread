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
#include "arch/aarch64.h"
#include "ftrace.h"
#include "internal.h"
#include <cpuport.h>

static ftrace_tracer_t tracers_list;

void ftrace_tracer_init(ftrace_tracer_t tracer, ftrace_trace_fn_t handler, void *data)
{
    RT_ASSERT(tracer);
    rt_memset(tracer, 0, sizeof(*tracer));

    tracer->handler = handler;
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

    tracer->enabled = 1;
    /* cache flush smp, mb */
    rt_hw_dmb();
    return 0;
}

int ftrace_tracer_unregister(ftrace_tracer_t tracer)
{
    RT_ASSERT(tracer->enabled == 1);
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
        _set_trace(tracer, fn);
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
    rt_bool_t existed;

    existed = _ftrace_symtbl_entry_exist(fn);

    if (existed == RT_TRUE)
    {
        err = _ftrace_patch_code(fn, RT_FALSE);
        if (!err)
        {
            err = _ftrace_hook_tracer(fn, tracer, RT_FALSE);
            if (!err)
            {
                tracer->trace_point_cnt -= 1;
            }
        }
    }
    else
    {
        err = -RT_ENOENT;
    }
    return err;
}

struct _param {
    ftrace_tracer_t tracer;
    void **notrace;
    size_t notrace_cnt;
};

static void _set_trace_with_entires(void *entry, void *data)
{
    // skip notrace here
    struct _param *param = data;
    int err;
    err = _set_trace(param->tracer, entry);
    if (err)
    {
        rt_kprintf("set trace failed %d\n", err);
    }
}

/* for several notrace points only */
int ftrace_tracer_set_except(ftrace_tracer_t tracer, void *notrace[], size_t notrace_cnt)
{
    struct _param param = {
        .tracer = tracer,
        .notrace = notrace,
        .notrace_cnt = notrace_cnt
    };

    _ftrace_symtbl_for_each(_set_trace_with_entires, &param);
    return 0;
}

/* generic entry to test if tracer is ready to handle trace event */
rt_notrace
int ftrace_trace_entry(ftrace_tracer_t tracer, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    int err;

    if (tracer)
    {
        if (tracer->enabled)
        {
            /* detect recursion */
            rt_thread_t tid = rt_thread_self();
            if (tid && tid->stacked_trace > 0 && !rt_interrupt_get_nest())
            {
                err = -RT_ERROR;
            }
            else
            {
                tid->stacked_trace++;
                err = tracer->handler(tracer, pc, ret_addr, context);
                tid->stacked_trace--;
            }
        }
        else if (tracer->unregistered)
        {
            /* we don't care if the disabled fails */
            ftrace_tracer_remove_trace(tracer, FTRACE_PC_TO_SYM(pc));
        }
    }
    else
    {
        err = RT_EOK;
    }

    return err;
}
