/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  extract kernel symbols from ksymtbl BLOB
 */
#include "ksymtbl.h"
#include "rtthread.h"

struct ksymtbl {
    rt_uint32_t magic_number;
    rt_uint32_t symbol_counts;
    rt_uint32_t blob_size;
    rt_uint32_t base_low;
    rt_uint32_t base_high;

    /* offset to sub-sections */
    rt_uint32_t off_o2s;
    rt_uint32_t off_s2o;
    rt_uint32_t off_oft;
    rt_uint32_t off_syt;
    rt_uint32_t off_str;
};

extern void *__ksymtbl_blob;
static struct ksymtbl *ksymtbl = (struct ksymtbl *)&__ksymtbl_blob;

#define GET_SECTION(sec)        ((void *)ksymtbl + ksymtbl->sec)
#define OBJIDX_TO_OFFSET(idx)   (arr + ((idx) << objsz_order))
#define OFT_ORDER               (2)

static long _search(void *arr, long objcnt, long objsz_order, void *target, int (*cmp)(const void *, const void *))
{
    long left = 0;
    long right = objcnt - 1;

    while (left <= right)
    {
        long mid = left + (right - left) / 2;
        int cmp_result = cmp(OBJIDX_TO_OFFSET(mid), target);

        if (cmp_result == 0)
        {
            return mid;
        }
        else if (cmp_result < 0)
        {
            left = mid + 1;
        }
        else
        {
            right = mid - 1;
        }
    }
    return -1;
}

static int _compare_address(const void *a, const void *b)
{
    rt_uint32_t aa = *(rt_uint32_t *)a;
    rt_uint32_t bb = *(rt_uint32_t *)b;
    return aa == bb ? 0 : (aa > bb ? 1 : -1);
}

int ksymtbl_find_by_address(void *address, size_t *off2entry, char *symbol_buf, size_t bufsz, rt_ubase_t *size, char *class_char)
{
    int oft_idx;
    int syt_idx;
    rt_ubase_t base = (ksymtbl->base_low |
                        ((rt_ubase_t)ksymtbl->base_high << 32));
    RT_ASSERT(base == ((rt_ubase_t)address & 0xffffffff00000000));
    rt_uint32_t *oft = GET_SECTION(off_oft);
    rt_uint16_t *off2sym = GET_SECTION(off_o2s);
    rt_uint32_t *symbol_table = GET_SECTION(off_syt);
    char *str_sec = GET_SECTION(off_str);
    rt_uint32_t offset = (rt_ubase_t)address & 0xffffffff;
    
    /* find oft_idx */
    oft_idx =
        _search(oft, ksymtbl->symbol_counts, OFT_ORDER, &offset, _compare_address);
    if (oft_idx < 0)
        return -1;

    RT_ASSERT((void *)base + oft[oft_idx] == address);
    /* find syt_idx */
    syt_idx = off2sym[oft_idx];
    size_t str_off = symbol_table[syt_idx];
    char *pclass = &str_sec[str_off];
    char *symbol = &str_sec[str_off + 1];

    if (off2entry)
        *off2entry = 0;
    if (symbol_buf)
        rt_strncpy(symbol_buf, symbol, bufsz);
    if (size)
        *size = -1;
    if (class_char)
        *class_char = *pclass;

    return 0;
}

static void _dump_all_symbols_symasc(void)
{
    rt_ubase_t base = (ksymtbl->base_low |
                        ((rt_ubase_t)ksymtbl->base_high << 32));

    const size_t counts = ksymtbl->symbol_counts;
    char *iter = GET_SECTION(off_str);
    rt_uint32_t *symbol_table = GET_SECTION(off_syt);
    rt_uint16_t *sym2off = GET_SECTION(off_s2o);
    rt_uint32_t *offset_table = GET_SECTION(off_oft);

    for (size_t i = 0; i < counts; i++)
    {
        rt_ubase_t off_idx = sym2off[i];
        rt_ubase_t addr = base + offset_table[off_idx];
        size_t str_off = symbol_table[i];
        char *pclass = &iter[str_off];
        char *symbol = &iter[str_off + 1];
        rt_kprintf("%lx %c %s\n", addr, *pclass, symbol);
    }
}

static void _dump_all_symbols_offasc(void)
{
    rt_ubase_t base = (ksymtbl->base_low |
                        ((rt_ubase_t)ksymtbl->base_high << 32));

    const size_t counts = ksymtbl->symbol_counts;
    char *iter = GET_SECTION(off_str);
    rt_uint32_t *symbol_table = GET_SECTION(off_syt);
    rt_uint16_t *off2sym = GET_SECTION(off_o2s);
    rt_uint32_t *offset_table = GET_SECTION(off_oft);

    for (size_t i = 0; i < counts; i++)
    {
        rt_ubase_t sym_idx = off2sym[i];
        rt_ubase_t addr = base + offset_table[i];
        // int search_idx = _search(offset_table, ksymtbl->symbol_counts, OFT_ORDER, &offset_table[i], _compare_address);
        // RT_ASSERT(search_idx == i || offset_table[search_idx] == offset_table[i]);
        size_t str_off = symbol_table[sym_idx];
        char *pclass = &iter[str_off];
        char *symbol = &iter[str_off + 1];
        rt_kprintf("%lx %c %s\n", addr, *pclass, symbol);
    }
}

static void _debug_dump(void)
{
    rt_uint32_t *iter = (void *)ksymtbl;
    rt_kputs("header\n");
    for (size_t i = 0; i < 10; i++)
        rt_kprintf("0x%x\n", *iter++);
    rt_kputs("kallsyms\n");
    _dump_all_symbols_offasc();
}
MSH_CMD_EXPORT_ALIAS(_debug_dump, dump_ksymtbl, dump kernel symbol table);
