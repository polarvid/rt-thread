/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  extract kernel symbols from ksymtbl BLOB
 */
#include "internal.h"

/**
 * @brief Generic binary search routine
 * 
 * @param arr 
 * @param objcnt 
 * @param objsz_order 
 * @param target 
 * @param cmp 
 * @return long the index of the symbol if matched, otherwise (-1 - index_to_nearest_lower_symbol)
 */
rt_notrace
long tracing_binary_search(void *arr, long objcnt, long objsz_order, void *target,
                            int (*cmp)(const void *, const void *))
{
    RT_ASSERT(objcnt > 0);
    long left = 0;
    long right = objcnt - 1;
    long mid = 0;
    int cmp_result;

    while (left <= right)
    {
        mid = left + (right - left) / 2;
        cmp_result = cmp(OBJIDX_TO_OFFSET(mid), target);

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

    mid = mid < right ? mid : right;
    return -1 - mid;
}
