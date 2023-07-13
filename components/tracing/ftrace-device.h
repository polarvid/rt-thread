/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: GPL-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-05-12     WangXiaoyao  The first version
 */
#ifndef __FTRACE_DEVICE_H__
#define __FTRACE_DEVICE_H__

#include <stddef.h>

enum ftrace_event_class {
    FTRACE_EVT_CLZ_NONE,
    FTRACE_EVT_CLZ_FUNCTION,
    FTRACE_EVT_CLZ_FGRAPH,
};

typedef struct ftrace_device_control {
    enum ftrace_event_class event_class;

    size_t buffer_size;
    unsigned int override:1;
} *ftrace_device_control_t;

struct ftrace_consumer_session;

struct ftrace_device_fgraph_cons_session {
    struct ftrace_consumer_session *func_evt;
    struct ftrace_consumer_session *thread_evt;
};

#define EVENT_TYPE_FUNCTION 0
#define EVENT_TYPE_THREAD   1

#define FTRACE_DEV_FGRAPH_CONS_SESSION_OFF(cpuid,event_type)   \
    (((cpuid) * sizeof(struct ftrace_device_fgraph_cons_session) / sizeof(struct ftrace_consumer_session *))   \
        + event_type)

#define _FTRACE_DEV_IOCTL_UNREG_MAGIC 0xabba0000
#define _FTRACE_DEV(num)        (_FTRACE_DEV_IOCTL_UNREG_MAGIC | num)
#define FTRACE_DEV_IOCTL_UNREG  _FTRACE_DEV(0)
#define FTRACE_DEV_IOCTL_REG    _FTRACE_DEV(1)

#endif /* __FTRACE_DEVICE_H__ */
