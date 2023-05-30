/*
 * Copyright (c) 2006-2020, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-05-12     RT-Thread    first version
 */
#ifndef __LWP_PUMUTEX_H__
#define __LWP_PUMUTEX_H__

#include "syscall_generic.h"

sysret_t lwp_pmutex(void *umutex, int op, void *arg);

#endif /* __LWP_PUMUTEX_H__ */
