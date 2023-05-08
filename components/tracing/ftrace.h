/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#ifndef __TRACE_FTRACE_H__
#define __TRACE_FTRACE_H__

#ifndef __ASSEMBLY__

#include <rtthread.h>

#ifdef ARCH_ARMV8
#include "arch/aarch64/aarch64.h"
#elif defined(ARCH_RISCV64)
#include "arch/riscv64/riscv64.h"
#endif

#ifndef RT_CPUS_NR
#define RT_CPUS_NR 1
#endif

/**
 * @brief A context for arguments passing
 */

struct ftrace_tracer;

typedef rt_base_t (*ftrace_trace_fn_t)(struct ftrace_tracer *tracer, rt_ubase_t pc, rt_ubase_t ret_addr, ftrace_context_t context);
typedef void (*ftrace_exit_fn_t)(struct ftrace_tracer * tracer, rt_ubase_t entry_pc, ftrace_context_t context);

enum ftrace_tracer_type {
    TRACER_ENTRY,
    TRACER_EXIT,
    TRACER_AROUND,
};

typedef struct ftrace_session {
    /* number of trace points this tracer handle */
    size_t trace_point_cnt;

    /* list of tracers, serving in the order one by one */
    rt_list_t entry_tracers;
    struct ftrace_tracer *around;
    rt_list_t exit_tracers;

    /* control bits, default as zero */
    unsigned int enabled:1;
    unsigned int unregistered:1;

} *ftrace_session_t;

/* user should not access this structure directly */
typedef struct ftrace_tracer {
    /* management of tracer */
    rt_list_t node;

    /* handler of tracer */
    union {
        ftrace_trace_fn_t on_entry;
        ftrace_exit_fn_t on_exit;
        ftrace_trace_fn_t around;
    };

    /* type of the tracer for identification on runtime */
    enum ftrace_tracer_type type;

    /* the session it belongs to */
    ftrace_session_t session;

    /* private custom data */
    void *data;
} *ftrace_tracer_t;

ftrace_tracer_t ftrace_tracer_create(enum ftrace_tracer_type type, void *handler, void *data);
void ftrace_tracer_init(ftrace_tracer_t tracer, enum ftrace_tracer_type type, void *handler, void *data);

void ftrace_tracer_delete(ftrace_tracer_t tracer);
rt_inline void ftrace_tracer_detach(ftrace_tracer_t tracer) {}

void ftrace_session_init(ftrace_session_t session);

ftrace_session_t ftrace_session_create(void);

void ftrace_session_delete(ftrace_session_t session);

rt_inline void ftrace_session_detach(ftrace_session_t session) {}

int ftrace_session_bind(ftrace_session_t session, ftrace_tracer_t tracer);

int ftrace_session_set_trace(ftrace_session_t session, void *fn);

int ftrace_session_set_except(ftrace_session_t session, void *notrace[], size_t notrace_cnt);

int ftrace_session_remove_trace(ftrace_session_t session, void *fn);

int ftrace_session_register(ftrace_session_t session);

int ftrace_session_unregister(ftrace_session_t session);

rt_notrace rt_inline
void ftrace_session_set_status(ftrace_session_t session, rt_bool_t enable)
{
    session->enabled = enable;
}

#endif /* __ASSEMBLY__ */

#endif /* __TRACE_FTRACE_H__ */
