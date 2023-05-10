/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */

#include "arch/riscv64/riscv64.h"
#define DBG_TAG "tracing.ftrace"
#define DBG_LVL DBG_WARNING
#include <rtdbg.h>

#include "event-ring.h"
#include "ksymtbl.h"
#include "ftrace.h"
#include "internal.h"
#include <cpuport.h>

#include <rtthread.h>
#include <rthw.h>
#include <mm_page.h>

/* for qsort utility */
#include <stdatomic.h>
#include <stdlib.h>

void ftrace_tracer_init(ftrace_tracer_t tracer, enum ftrace_tracer_type type, void *handler, void *data)
{
    tracer->type = type;
    tracer->on_entry = handler;
    tracer->data = data;
    tracer->session = RT_NULL;
    rt_list_init(&tracer->node);

    return ;
}

ftrace_tracer_t ftrace_tracer_create(enum ftrace_tracer_type type, void *handler, void *data)
{
    ftrace_tracer_t tracer;
    tracer = rt_malloc(sizeof(*tracer));
    if (!tracer)
        return RT_NULL;

    tracer->type = type;
    tracer->on_entry = handler;
    tracer->data = data;
    tracer->session = RT_NULL;
    rt_list_init(&tracer->node);

    return tracer;
}

void ftrace_tracer_delete(ftrace_tracer_t tracer)
{
    rt_free(tracer);
}

void ftrace_session_init(ftrace_session_t session)
{
    session->enabled = 0;
    session->unregistered = 0;
    session->trace_point_cnt = 0;
    session->around = RT_NULL;
    rt_list_init(&session->entry_tracers);
    rt_list_init(&session->exit_tracers);
    return ;
}

ftrace_session_t ftrace_session_create(void)
{
    ftrace_session_t session;
    session = rt_malloc(sizeof(*session));
    if (!session)
        return RT_NULL;

    ftrace_session_init(session);
    return session;
}

void ftrace_session_delete(ftrace_session_t session)
{
    rt_free(session);
}

int ftrace_session_bind(ftrace_session_t session, ftrace_tracer_t tracer)
{
    int err = RT_EOK;

    RT_ASSERT(session && tracer);
    tracer->session = session;
    switch (tracer->type)
    {
        case TRACER_ENTRY:
            rt_list_insert_after(&session->entry_tracers, &tracer->node);
            break;
        case TRACER_EXIT:
            rt_list_insert_after(&session->exit_tracers, &tracer->node);
            break;
        case TRACER_AROUND:
            if (session->around == RT_NULL)
                session->around = tracer;
            else
                err = -RT_ERROR;
            break;
        default:
            tracer->session = RT_NULL;
            err = -RT_EINVAL;
    }
    return err;
}

static int _set_trace(ftrace_session_t session, void *fn)
{
    int err;
    err = ftrace_arch_hook_session(fn, session, RT_TRUE);

    if (!err)
    {
        err = ftrace_arch_patch_code(fn, RT_TRUE);
        if (!err)
        {
            session->trace_point_cnt += 1;
        }
    }
    else if (session == ftrace_arch_get_session(fn))
    {
        err = RT_EOK;
    }

    return err;
}

/* for several trace points only */
int ftrace_session_set_trace(ftrace_session_t session, void *fn)
{
    int err;
    rt_bool_t existed;

    existed = ftrace_entries_exist(fn);

    if (existed == RT_TRUE)
    {
        err = _set_trace(session, fn);
    }
    else
    {
        LOG_W("%s: symbol (%p) unlikely to be existed", __func__, fn);
        err = -RT_ENOENT;
    }
    return err;
}

rt_notrace
int ftrace_session_remove_trace(ftrace_session_t session, void *fn)
{
    int err;

    err = ftrace_arch_patch_code(fn, RT_FALSE);
    if (!err)
    {
        err = ftrace_arch_hook_session(fn, session, RT_FALSE);
        if (!err)
        {
            session->trace_point_cnt -= 1;
        }
    }

    return err;
}

struct _param {
    ftrace_session_t session;
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

static void _set_session_in_entires(void *symbol, void *data)
{
    // skip notrace here
    struct _param *param = data;
    if (param->notrace_cnt && _is_notrace(symbol, param))
        return ;

    int err;
    err = _set_trace(param->session, symbol);
    if (err)
    {
        LOG_I("set trace failed %d", err);
    }
}

static int _compare_address_asc(const void *a, const void *b)
{
   return (*(int*)a - *(int*)b);
}

/* for several notrace points only */
int ftrace_session_set_except(ftrace_session_t session, void *notrace[], size_t notrace_cnt)
{
    struct _param param = {
        .session = session,
        .notrace = notrace,
        .notrace_cnt = notrace_cnt
    };
    qsort(notrace, notrace_cnt, sizeof(void*), _compare_address_asc);
    ftrace_entries_for_each(_set_session_in_entires, &param);
    return 0;
}

int ftrace_session_register(ftrace_session_t session)
{
    RT_ASSERT(session->enabled == 0);

    session->enabled = RT_TRUE;
    /* cache flush smp, mb */
    rt_hw_dmb();
    rt_hw_isb();
    return 0;
}

int ftrace_session_unregister(ftrace_session_t session)
{
    session->enabled = 0;
    /* free to remove the trace point */
    session->unregistered = 1;
    /* cache flush smp, mb */
    rt_hw_dmb();

    /* we exploit a lazy method to restore codes modification */

    return 0;
}

/* current implementation of enter/exit critical is unreasonable */
#define stack_prot_threshold    0x2000

/* generic entry to test if session is ready to handle trace event */
rt_notrace
rt_err_t ftrace_trace_entry(ftrace_session_t session, rt_ubase_t pc, rt_ubase_t ret_addr, void *context)
{
    rt_err_t stat = 0;
    if (session)
    {
        if (session->enabled)
        {
            /* handling entry */
            ftrace_tracer_t tracer;
            rt_list_for_each_entry(tracer, &session->entry_tracers, node)
            {
                int retval;
                retval = tracer->on_entry(tracer, pc, ret_addr, context);
                if (retval)
                    break;
            }

            /* handling around */
            /* handling exit */
            if (rt_list_len(&session->exit_tracers) > 0)
            {
                ftrace_arch_push_context(session, pc, ret_addr, context);
                stat = FTE_OVERRIDE_EXIT;
            }
        }
        else if (session->unregistered)
        {
            /* we don't care if the disabled fails */
            void *symbol;
            symbol = FTRACE_PC_TO_SYM(pc);
            ftrace_session_remove_trace(session, symbol);
        }
    }

    return stat;
}

rt_notrace
rt_ubase_t ftrace_trace_exit(void *context)
{
    ftrace_session_t session;
    rt_ubase_t pc;
    rt_ubase_t ret_addr;
    ftrace_arch_pop_context(&session, &pc, &ret_addr, context);

    ftrace_tracer_t tracer;
    rt_list_for_each_entry(tracer, &session->exit_tracers, node)
    {
        tracer->on_exit(tracer, pc, context);
    }

    return ret_addr;
}

int ftrace_trace_host_setup(rt_thread_t host)
{
    ftrace_host_data_t data = rt_calloc(1, sizeof(struct ftrace_host_data));
    if (data)
    {
        const size_t alloc_size = 0x1000;
        data->stack = rt_pages_alloc_ext(rt_page_bits(alloc_size), PAGE_ANY_AVAILABLE);
        if (data->stack)
        {
            data->stack_pointer = (rt_ubase_t *)(data->stack + alloc_size);
            host->ftrace_host_session = data;
        }

        data->stacked_trace = 0;
    }
    // atomic_store_explicit(&host->stacked_trace, 0, memory_order_relaxed);
    // atomic_store_explicit(&host->stacked_exit, 0, memory_order_relaxed);
    // atomic_store_explicit(&host->trace_recorded, 0, memory_order_relaxed);
}