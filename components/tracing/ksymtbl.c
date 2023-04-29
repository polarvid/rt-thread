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
#include "internal.h"
#include "rtthread.h"
#include <lwp.h>

#include <stdio.h>

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

extern struct ksymtbl __ksymtbl_blob;
static struct ksymtbl *ksymtbl = &__ksymtbl_blob;
#define OFT_ORDER (2)

static int _compare_addroff(const void *a, const void *b)
{
    rt_uint32_t aa = *(rt_uint32_t *)a;
    rt_uint32_t bb = *(rt_uint32_t *)b;
    return aa == bb ? 0 : (aa > bb ? 1 : -1);
}

rt_inline int _is_kernel_symbol(void *address)
{
    extern void *__text_end;
    extern void *__text_start;
    return address >= (void *)&__text_start && address < (void *)&ksymtbl;
}

int ksymtbl_find_by_address(void *address, size_t *off2entry, char *symbol_buf, size_t bufsz, rt_ubase_t *size, char *class_char)
{
    int oft_idx;
    int syt_idx;
    if (!_is_kernel_symbol(address))
        return -1;

    rt_ubase_t base = (ksymtbl->base_low |
                        ((rt_ubase_t)ksymtbl->base_high << 32));
    RT_ASSERT(base == ((rt_ubase_t)address & 0xffffffff00000000));
    rt_uint32_t *oft = GET_SECTION(off_oft);
    rt_uint16_t *off2sym = GET_SECTION(off_o2s);
    rt_uint32_t *symbol_table = GET_SECTION(off_syt);
    char *str_sec = GET_SECTION(off_str);
    rt_uint32_t offset = (rt_ubase_t)address & 0xffffffff;
    rt_size_t entry_offset;

    /* find oft_idx */
    oft_idx =
        tracing_binary_search(oft, ksymtbl->symbol_counts, OFT_ORDER, &offset, _compare_addroff);

    if (oft_idx < 0)
    {
        /* it's unlikely that the address is out of range */
        oft_idx = -(1 + oft_idx);
        entry_offset = oft[oft_idx];
    }
    else
    {
        entry_offset = offset;
    }

    RT_ASSERT((void *)base + oft[oft_idx] <= address);
    RT_ASSERT(oft_idx < ksymtbl->symbol_counts && (void *)base + oft[oft_idx + 1] >= address);

    /* find syt_idx */
    syt_idx = off2sym[oft_idx];
    size_t str_off = symbol_table[syt_idx];
    char *pclass = &str_sec[str_off];
    char *symbol = &str_sec[str_off + 1];

    if (off2entry)
        *off2entry = offset - entry_offset;
    if (symbol_buf)
        rt_strncpy(symbol_buf, symbol, bufsz);
    if (size)
        *size = -1;
    if (class_char)
        *class_char = *pclass;

    return 0;
}

// static void _dump_all_symbols_symasc(void)
// {
//     rt_ubase_t base = (ksymtbl->base_low |
//                         ((rt_ubase_t)ksymtbl->base_high << 32));

//     const size_t counts = ksymtbl->symbol_counts;
//     char *iter = GET_SECTION(off_str);
//     rt_uint32_t *symbol_table = GET_SECTION(off_syt);
//     rt_uint16_t *sym2off = GET_SECTION(off_s2o);
//     rt_uint32_t *offset_table = GET_SECTION(off_oft);

//     for (size_t i = 0; i < counts; i++)
//     {
//         rt_ubase_t off_idx = sym2off[i];
//         rt_ubase_t addr = base + offset_table[off_idx];
//         size_t str_off = symbol_table[i];
//         char *pclass = &iter[str_off];
//         char *symbol = &iter[str_off + 1];
//         rt_kprintf("%lx %c %s\n", addr, *pclass, symbol);
//     }
// }

static void _dump_all_symbols_offasc(void)
{
    rt_ubase_t base = (ksymtbl->base_low |
                        ((rt_ubase_t)ksymtbl->base_high << 32));

    /* open file */
    int fd;
    fd = open("/smart-ksymtbl.txt", O_WRONLY | O_CREAT, 0);
    static char buf[128];

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
        snprintf(buf, sizeof(buf), "%016lx %c %s\n", addr, *pclass, symbol);
        write(fd, buf, strlen(buf));
    }
    close(fd);
}

static void _debug_dump(void)
{
    rt_uint32_t *iter = (void *)ksymtbl;
    rt_kputs("header\n");
    for (size_t i = 0; i < 10; i++)
        rt_kprintf("0x%x\n", *iter++);
    rt_kputs("kallsyms\n");
    _dump_all_symbols_offasc();
    rt_kputs("done\n");
}
MSH_CMD_EXPORT_ALIAS(_debug_dump, dump_ksymtbl, dump kernel symbol table);
