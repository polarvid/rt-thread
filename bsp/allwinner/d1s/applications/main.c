/*
 * Copyright (c) 2006-2022, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 */

#include <rtthread.h>
#include <stdio.h>

#include <rtthread.h>
#include <rthw.h>
#include <stdio.h>
#include <string.h>
#include <lwp.h>

#include <rtthread.h>
#include <sys/time.h>

#define DBG_LVL DBG_INFO
#define DBG_TAG "timestamp"
#include <rtdbg.h>

rt_inline rt_notrace
rt_ubase_t ftrace_timestamp(void)
{
    uint64_t cycles;
    __asm__ volatile("rdtime %0":"=r"(cycles));
    cycles = (cycles * NANOSECOND_PER_SECOND) / CPUTIME_TIMER_FREQ;
    return cycles;
}

extern rt_ubase_t sys_exit_timestamp;
static void _app_test(void)
{
    const size_t times = 2;
    size_t total = 0;
    for (size_t i = 0; i < times; i++)
    {
        time_t baseline = ftrace_timestamp();
        static pid_t pid;

        char *argv[1] = {"./rv64/stress_mem.elf"};
        pid = exec(argv[0], 0, 1, argv);

        struct rt_lwp* lwp;
        do
        {
            lwp = lwp_from_pid(pid);
            rt_thread_mdelay(100);
        } while (lwp);

        baseline = sys_exit_timestamp - baseline;
        total += baseline;
        LOG_I("Baseline 0x%lx\n", baseline);
    }

    LOG_I("Total 0x%lx, Avg %ld", total, total / times);
}
MSH_CMD_EXPORT_ALIAS(_app_test, test_app, test ftrace feature);

int main(void)
{
    printf("Hello RISC-V\n");

#ifdef BSP_USING_LCD
    extern int rt_hw_lcd_init(void);
    rt_hw_lcd_init();
#endif // BSP_USING_LCD

    return 0;
}
