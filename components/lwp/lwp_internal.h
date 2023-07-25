/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-07-25     Shell        first version
 */

#ifndef __LWP_INTERNAL_H__
#define __LWP_INTERNAL_H__

#include <rtthread.h>
#include "lwp.h"

// #define LWP_USING_CPUS_LOCK

#ifndef LWP_USING_CPUS_LOCK
rt_err_t lwp_critical_enter(struct rt_lwp *lwp);
rt_err_t lwp_critical_exit(struct rt_lwp *lwp);

#define LWP_LOCK(lwp)                           \
    do {                                        \
        if (lwp_critical_enter(lwp) != RT_EOK)  \
        {                                       \
            RT_ASSERT(0);                       \
        }                                       \
    } while (0)

#define LWP_UNLOCK(lwp)                         \
    do {                                        \
        if (lwp_critical_exit(lwp) != RT_EOK)   \
        {                                       \
            RT_ASSERT(0);                       \
        }                                       \
    } while (0)

#else

#define LWP_LOCK(lwp)           rt_base_t level = rt_hw_interrupt_disable()
#define LWP_UNLOCK(lwp)         rt_hw_interrupt_enable(level)

#endif /* LWP_USING_CPUS_LOCK */

#endif /* __LWP_INTERNAL_H__ */
