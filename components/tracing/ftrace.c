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
#include "ksymtbl.h"

static void _debug_dump(void)
{
    extern void *__patchable_function_entries_start;
    extern void *__patchable_function_entries_end;
    void **entries = &__patchable_function_entries_start;
    void **end = &__patchable_function_entries_end;
    char symbol_buf[128];
    while (entries < end)
    {
        int err;
        err =
            ksymtbl_find_by_address(*entries, RT_NULL, symbol_buf, 128, RT_NULL, RT_NULL);
        if (!err)
            rt_kprintf("%s %p\n", symbol_buf, *entries);
        else
            rt_kprintf("\n");
        entries++;
    }
}
MSH_CMD_EXPORT_ALIAS(_debug_dump, dump_entries, dump patchable function entries);
