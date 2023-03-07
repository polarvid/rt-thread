/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-02-27     WangXiaoyao  Support Software-Tagged KASAN
 */

#ifndef __KASAN_H__
#define __KASAN_H__

#include <rtthread.h>

#ifdef ARCH_ENABLE_SOFT_KASAN

struct rt_varea;
struct rt_mem_obj;

#define KASAN_WORD_SIZE (8)

#define KASAN_AREA_SIZE ((1ul << ARCH_VADDR_WIDTH) / KASAN_WORD_SIZE)

extern char *kasan_area_start;

extern struct rt_varea kasan_area;
extern struct rt_mem_obj kasan_mapper;

void kasan_init(void);

void *kasan_unpoisoned(void *start, rt_size_t length);
int kasan_poisoned(void *start);

#else
#define kasan_unpoisoned(ptr, sz) (ptr)
#define kasan_poisoned(ptr, sz)
#endif /* ARCH_ENABLE_SOFT_KASAN */

#endif /* __KASAN_H__ */
