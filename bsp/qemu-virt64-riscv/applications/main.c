/*
 * Copyright (c) 2006-2018, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 */

#include <rtthread.h>
#include <rthw.h>
#include <stdio.h>
#include <string.h>
#include <lwp.h>

#include <ftrace.h>

static void _app_test(void)
{
    time_t baseline = ftrace_timestamp();
    static pid_t pid;

    char *argv[1] = {"./rv64/stress_mem.elf"};
    pid = exec(argv[0], 0, 1, argv);

    struct rt_lwp* lwp;
    do
    {
        lwp = lwp_from_pid(pid);
    } while (lwp);
    baseline = ftrace_timestamp() - baseline;
}
MSH_CMD_EXPORT_ALIAS(_app_test, test_app, test ftrace feature);


int main(void)
{
    printf("Hello RISC-V\n");

    return 0;
}
