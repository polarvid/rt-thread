/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */
#include "arch/aarch64.h"
#include "ksymtbl.h"
#include "internal.h"

extern void *__patchable_function_entries_start;
extern void *__patchable_function_entries_end;

static void _debug_dump(void)
{
    void **entries = &__patchable_function_entries_start;
    void **end = &__patchable_function_entries_end;
    char symbol_buf[128];

    while (entries < end)
    {
        int err;
        void *address = (void *)ENTRIES_TO_SYM(*entries);
        err = ksymtbl_find_by_address(address, RT_NULL, symbol_buf, 128, RT_NULL, RT_NULL);

        if (!err)
            rt_kprintf("%p %s\n", *entries, symbol_buf);
        else
            rt_kprintf("\n");
        entries++;
    }
}
MSH_CMD_EXPORT_ALIAS(_debug_dump, dump_entries, dump patchable function entries);

/* ascending order */
rt_notrace static
int _compare_entry(const void *a, const void *b)
{
    rt_uint64_t aa = *(rt_uint64_t *)a;
    rt_uint64_t bb = *(rt_uint64_t *)b;
    return aa == bb ? 0 : (aa > bb ? 1 : -1);
}

rt_notrace
rt_bool_t _ftrace_symtbl_entry_exist(void *entry)
{
    void **entries = &__patchable_function_entries_start;
    void **end = &__patchable_function_entries_end;
    const size_t objcnt = end - entries;
    void *target = SYM_TO_ENTRIES(entry);

    int ret =
        tracing_binary_search(entries, objcnt, FTRACE_ENTRY_ORDER, &target, _compare_entry);

    return ret < 0 ? RT_FALSE : RT_TRUE;
}

void _ftrace_symtbl_for_each(void (*fn)(void *symbol, void *data), void *data)
{
    void **entries = &__patchable_function_entries_start;
    void **end = &__patchable_function_entries_end;
    const size_t objcnt = end - entries;

    for (size_t i = 0; i < objcnt; i++)
    {
        fn(ENTRIES_TO_SYM(entries[i]), data);
    }
}
