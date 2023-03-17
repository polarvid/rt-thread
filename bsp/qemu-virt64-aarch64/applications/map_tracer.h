/*
 * Copyright (c) 2006-2022, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-17     WangXiaoyao  the first version
 */

#ifndef __MAP_TRACER_H__
#define __MAP_TRACER_H__

#include <stddef.h>
#include <mm_aspace.h>

typedef struct mtracer_entry {
    void *vaddr;
    unsigned long is_unmap;
} *mtracer_entry_t;

void maping_tracer_init(void);
void maping_tracer_start(rt_aspace_t aspace);
void maping_tracer_add(void *pgtbl, mtracer_entry_t entry);
void maping_tracer_stop(rt_aspace_t aspace);
void maping_trace_dump(rt_aspace_t aspace);

#endif /* __MAP_TRACER_H__ */
