/*
 * Copyright (c) 2006-2020, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2020-02-23     Jesven       first version.
 * 2023-07-06     Shell        Rewrite implementation of POSIX signal
 */

#ifndef LWP_SIGNAL_H__
#define LWP_SIGNAL_H__

#include "syscall_generic.h"

#include <rtthread.h>
#include <sys/signal.h>

#define LWP_SIG_IGNORE_SET      (sigmask(SIGCHLD) | sigmask(SIGURG))
#define LWP_SIG_ACT_DFL         ((lwp_sighandler_t)0)
#define LWP_SIG_ACT_IGN         ((lwp_sighandler_t)1)

#ifdef __cplusplus
extern "C" {
#endif

#define USER_SA_FLAGS                                                       \
    (SA_NOCLDSTOP | SA_NOCLDWAIT | SA_SIGINFO | SA_ONSTACK | SA_RESTART |   \
     SA_NODEFER | SA_RESETHAND | SA_EXPOSE_TAGBITS)

typedef enum {
    LWP_SIG_MASK_CMD_BLOCK,
    LWP_SIG_MASK_CMD_UNBLOCK,
    LWP_SIG_MASK_CMD_SET_MASK,
    __LWP_SIG_MASK_CMD_WATERMARK
} lwp_sig_mask_cmd_t;

/**
 * LwP implementation of POSIX signal
 */
struct lwp_signal {
    struct rt_mutex sig_lock;

    struct lwp_sigqueue sig_queue;

    lwp_sigset_t sig_mask[_LWP_NSIG];
    rt_thread_t sig_action_thr[_LWP_NSIG];
    lwp_sighandler_t sig_action[_LWP_NSIG];
    int sig_action_flag[_LWP_NSIG];
    lwp_sigset_t sig_action_siginfo;
    lwp_sigset_t sig_action_altstack;
    lwp_sigset_t sig_action_restart;
};

struct rt_lwp;

void lwp_sighandler_set(int sig, lwp_sighandler_t func);
#ifndef ARCH_MM_MMU
void lwp_thread_sighandler_set(int sig, lwp_sighandler_t func);
#endif

rt_inline void lwp_sigqueue_init(lwp_sigqueue_t sigq)
{
    memset(&sigq->sigset_pending, 0, sizeof(lwp_sigset_t));
    rt_list_init(&sigq->siginfo_list);
}

void lwp_sigqueue_clear(lwp_sigqueue_t sigq);

rt_inline rt_err_t lwp_signal_init(struct lwp_signal *sig)
{
    rt_err_t rc;
    rc = rt_mutex_init(&sig->sig_lock, "lwpsig", RT_IPC_FLAG_FIFO);
    if (rc == RT_EOK)
    {
        memset(&sig->sig_action, 0, sizeof(sig->sig_action));
        memset(&sig->sig_action_flag, 0, sizeof(sig->sig_action_flag));
        lwp_sigqueue_init(&sig->sig_queue);
    }
    return rc;
}

rt_err_t lwp_signal_detach(struct lwp_signal *signal);

/**
 * @brief check for signal to handle of current thread
 *
 * @return int 0 if no signals to handle, otherwise the signo will be returned
 */
int lwp_signal_check(void);

/**
 * @brief send a signal to the process
 *
 * @param lwp the process to be killed
 * @param signo the signal number
 * @param code as in siginfo
 * @param value as in siginfo
 * @return rt_err_t RT_EINVAL if the parameter is invalid, RT_EOK as successful
 *
 * @note the *signal_kill have the same definition of a successful return as
 *       kill() in IEEE Std 1003.1-2017
 */
rt_err_t lwp_signal_kill(struct rt_lwp *lwp, long signo, long code, long value);

/**
 * @brief set or examine the signal action of signo
 *
 * @param signo signal number
 * @param act the signal action
 * @param oact 
 * @return rt_err_t 
 */
rt_err_t lwp_signal_action(struct rt_lwp *lwp, int signo,
                           const struct lwp_sigaction *restrict act,
                           struct lwp_sigaction *restrict oact);

rt_inline void lwp_thread_signal_detach(struct lwp_thread_signal *tsig)
{
    lwp_sigqueue_clear(&tsig->sig_queue);
}

rt_err_t lwp_thread_signal_kill(rt_thread_t thread, long signo, long code, long value);

/**
 * @brief set signal mask of target thread
 * 
 * @param thread the target thread
 * @param how command
 * @param sigset operand
 * @param oset the address to old set
 * @return rt_err_t
 */
rt_err_t lwp_thread_signal_mask(rt_thread_t thread, lwp_sig_mask_cmd_t how,
                                const lwp_sigset_t *sigset, lwp_sigset_t *oset);

/**
 * @brief Catch signal if exists and no return, otherwise return with no side effect
 */
void lwp_thread_signal_catch(void *exp_frame);

int lwp_thread_signal_timedwait(rt_thread_t thread, lwp_sigset_t *sigset,
                                siginfo_t *info, struct timespec *timeout);

rt_noreturn void arch_thread_signal_enter(int signo, siginfo_t *psiginfo,
                                          void *exp_frame, void *entry_uaddr);

#ifdef __cplusplus
}
#endif

#endif
