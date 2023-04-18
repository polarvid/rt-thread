/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-30     WangXiaoyao  ftrace support
 */

/**
 * @brief This file contains generic implementation of arch specific
 * routine for ftrace front end that routing data to ring buffer
 * and implementation function graph tracer
 */

/* dummy implementation just return */
static void dummy_ftrace(void) {}
/* trampoline entry of mcount */
static void (*do_ftrace)(void) = dummy_ftrace;

/* name convention follow gprof */
void mcount(void)
{
    do_ftrace();
}
