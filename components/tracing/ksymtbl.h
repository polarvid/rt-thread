
/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  extract kernel symbols from ksymtbl BLOB
 */
#ifndef __TRACING_KSYMTBL_H__
#define __TRACING_KSYMTBL_H__

#include <rtthread.h>
#include <stdint.h>
#include <stddef.h>

int ksymtbl_find_by_address(void *address, size_t *off2entry, char *symbol_buf, size_t bufsz, rt_ubase_t *size, char *class_char);

#endif /* __TRACING_KSYMTBL_H__ */
