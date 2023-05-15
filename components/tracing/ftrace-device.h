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

#endif /* __FTRACE_DEVICE_H__ */
