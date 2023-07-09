/*
 * Copyright (c) 2006-2020, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2019-11-12     Jesven       first version
 * 2023-02-23     shell        Support sigtimedwait
 * 2023-07-04     shell        Support siginfo, sigqueue
 *                             remove mask from lwp
 *                             remove lwp_signal_backup/restore()
 *                             rewrite lwp implementation of signal
 */

#include "rtdef.h"
#define DBG_TAG    "LWP_SIGNAL"
#define DBG_LVL    DBG_INFO
#include <rtdbg.h>

#include <rthw.h>
#include <rtthread.h>
#include <string.h>

#include "lwp.h"
#include "lwp_arch.h"
#include "lwp_signal.h"
#include "sys/signal.h"
#include "syscall_generic.h"

/**
 * ASSERT the operation should never failed
 * if the RT_ASSERT is disable, there tend to be
 * no effect on the running code
 */
#define NEVER_FAIL(stat)    \
    if (stat != RT_EOK)     \
        RT_ASSERT(0);

static lwp_siginfo_t siginfo_create(int signo, int code, int value)
{
    lwp_siginfo_t siginfo;
    struct rt_lwp *self_lwp;
    rt_thread_t self_thr;

    siginfo = rt_malloc(sizeof(*siginfo));
    if (siginfo)
    {
        siginfo->ksiginfo.signo = signo;
        siginfo->ksiginfo.code = code;
        siginfo->ksiginfo.value = value;

        self_lwp = lwp_self();
        self_thr = rt_thread_self();
        if (self_lwp)
        {
            siginfo->ksiginfo.from_pid = self_lwp->pid;
            siginfo->ksiginfo.from_tid = self_thr->tid;
        }
        else
        {
            siginfo->ksiginfo.from_pid = 0;
            siginfo->ksiginfo.from_tid = 0;
        }
    }

    return siginfo;
}

rt_inline void siginfo_delete(lwp_siginfo_t siginfo)
{
    rt_free(siginfo);
}

rt_inline void _sigorsets(lwp_sigset_t *dset, const lwp_sigset_t *set0, const lwp_sigset_t *set1)
{
    switch (_LWP_NSIG_WORDS)
    {
        case 4:
            dset->sig[3] = set0->sig[3] | set1->sig[3];
            dset->sig[2] = set0->sig[2] | set1->sig[2];
        case 2:
            dset->sig[1] = set0->sig[1] | set1->sig[1];
        case 1:
            dset->sig[0] = set0->sig[0] | set1->sig[0];
        default:
            return;
    }
}

rt_inline void _sigandsets(lwp_sigset_t *dset, const lwp_sigset_t *set0, const lwp_sigset_t *set1)
{
    switch (_LWP_NSIG_WORDS)
    {
        case 4:
            dset->sig[3] = set0->sig[3] & set1->sig[3];
            dset->sig[2] = set0->sig[2] & set1->sig[2];
        case 2:
            dset->sig[1] = set0->sig[1] & set1->sig[1];
        case 1:
            dset->sig[0] = set0->sig[0] & set1->sig[0];
        default:
            return;
    }
}

rt_inline void _signotsets(lwp_sigset_t *dset, const lwp_sigset_t *set)
{
    switch (_LWP_NSIG_WORDS)
    {
        case 4:
            dset->sig[3] = ~set->sig[3];
            dset->sig[2] = ~set->sig[2];
        case 2:
            dset->sig[1] = ~set->sig[1];
        case 1:
            dset->sig[0] = ~set->sig[0];
        default:
            return;
    }
}

rt_inline void _sigaddset(lwp_sigset_t *set, int _sig)
{
    unsigned long sig = _sig - 1;

    if (_LWP_NSIG_WORDS == 1)
    {
        set->sig[0] |= 1UL << sig;
    }
    else
    {
        set->sig[sig / _LWP_NSIG_BPW] |= 1UL << (sig % _LWP_NSIG_BPW);
    }
}

rt_inline void _sigdelset(lwp_sigset_t *set, int _sig)
{
    unsigned long sig = _sig - 1;

    if (_LWP_NSIG_WORDS == 1)
    {
        set->sig[0] &= ~(1UL << sig);
    }
    else
    {
        set->sig[sig / _LWP_NSIG_BPW] &= ~(1UL << (sig % _LWP_NSIG_BPW));
    }
}

rt_inline int _sigisemptyset(lwp_sigset_t *set)
{
    switch (_LWP_NSIG_WORDS)
    {
        case 4:
            return (set->sig[3] | set->sig[2] |
                    set->sig[1] | set->sig[0]) == 0;
        case 2:
            return (set->sig[1] | set->sig[0]) == 0;
        case 1:
            return set->sig[0] == 0;
        default:
            return 1;
    }
}

rt_inline int _sigismember(lwp_sigset_t *set, int _sig)
{
    unsigned long sig = _sig - 1;

    if (_LWP_NSIG_WORDS == 1)
    {
        return 1 & (set->sig[0] >> sig);
    }
    else
    {
        return 1 & (set->sig[sig / _LWP_NSIG_BPW] >> (sig % _LWP_NSIG_BPW));
    }
}

rt_inline int _next_signal(lwp_sigset_t *pending, lwp_sigset_t *mask)
{
    unsigned long i, *s, *m, x;
    int sig = 0;

    s = pending->sig;
    m = mask->sig;

    x = *s & ~*m;
    if (x)
    {
        sig = rt_hw_ffz(~x) + 1;
        return sig;
    }

    switch (_LWP_NSIG_WORDS)
    {
        default:
            for (i = 1; i < _LWP_NSIG_WORDS; ++i)
            {
                x = *++s &~ *++m;
                if (!x)
                    continue;
                sig = rt_hw_ffz(~x) + i*_LWP_NSIG_BPW + 1;
                break;
            }
            break;

        case 2:
            x = s[1] &~ m[1];
            if (!x)
                break;
            sig = rt_hw_ffz(~x) + _LWP_NSIG_BPW + 1;
            break;

        case 1:
            /* Nothing to do */
            break;
    }

    return sig;
}

#define _SIGQ(tp) (&(tp)->signal.sig_queue)

rt_inline int sigqueue_isempty(lwp_sigqueue_t sigqueue)
{
    return _sigisemptyset(&sigqueue->sigset_pending);
}

rt_inline int sigqueue_ismember(lwp_sigqueue_t sigqueue, int signo)
{
    return _sigismember(&sigqueue->sigset_pending, signo);
}

rt_inline int sigqueue_peek(lwp_sigqueue_t sigqueue, lwp_sigset_t *mask)
{
    _next_signal(&sigqueue->sigset_pending, mask);
}

static void sigqueue_enqueue(lwp_sigqueue_t sigqueue, lwp_siginfo_t siginfo)
{
    lwp_siginfo_t idx;
    rt_list_for_each_entry(idx, &sigqueue->siginfo_list, node)
    {
        if (idx->ksiginfo.signo < siginfo->ksiginfo.signo)
            continue;
        rt_list_insert_after(&idx->node, &siginfo->node);
    }

    _sigaddset(&sigqueue->sigset_pending, siginfo->ksiginfo.signo);
    return ;
}

static lwp_siginfo_t sigqueue_dequeue(lwp_sigqueue_t sigqueue, int signo)
{
    lwp_siginfo_t found;
    lwp_siginfo_t candidate;

    found = RT_NULL;
    rt_list_for_each_entry(candidate, &sigqueue->siginfo_list, node)
    {
        if (candidate->ksiginfo.signo == signo)
            found = candidate;
        else if (candidate->ksiginfo.signo > signo)
            break;
    }

    return found;
}

static void siginfo_copy_to_user(lwp_siginfo_t ksigi, siginfo_t *usigi)
{
    usigi->si_code = ksigi->ksiginfo.code;
    usigi->si_signo = ksigi->ksiginfo.signo;
    usigi->si_errno = 0;
}

rt_inline lwp_sighandler_t _sighandler_get_locked(struct rt_lwp *lwp, int signo)
{
    return lwp->signal.sig_action[signo - 1];
}

void lwp_sigqueue_clear(lwp_sigqueue_t sigq)
{
    lwp_siginfo_t this, next;
    if (!sigqueue_isempty(sigq))
    {
        rt_list_for_each_entry_safe(this, next, &sigq->siginfo_list, node)
        {
            rt_free(this);
        }
    }
}

int lwp_suspend_sigcheck(rt_thread_t thread, int suspend_flag)
{
    struct rt_lwp *lwp = (struct rt_lwp*)thread->lwp;
    int ret = 0;

    switch (suspend_flag)
    {
        case RT_INTERRUPTIBLE:
            if (!sigqueue_isempty(_SIGQ(thread)))
            {
                break;
            }
            if (thread->lwp && !sigqueue_isempty(_SIGQ(lwp)))
            {
                break;
            }
            ret = 1;
            break;
        case RT_KILLABLE:
            if (sigqueue_ismember(_SIGQ(thread), SIGKILL))
            {
                break;
            }
            if (thread->lwp && sigqueue_ismember(_SIGQ(lwp), SIGKILL))
            {
                break;
            }
            ret = 1;
            break;
        case RT_UNINTERRUPTIBLE:
            ret = 1;
            break;
        default:
            RT_ASSERT(0);
            break;
    }
    return ret;
}

rt_err_t lwp_signal_detach(struct lwp_signal *signal)
{
    rt_err_t ret;

    lwp_sigqueue_clear(&signal->sig_queue);
    ret = rt_mutex_detach(&signal->sig_lock);

    return ret;
}

void lwp_thread_signal_catch(void *exp_frame)
{
    int signo;
    struct rt_thread *thread;
    struct rt_lwp *lwp;
    lwp_siginfo_t siginfo;
    lwp_sigqueue_t pending;
    lwp_sigset_t *mask;
    lwp_sighandler_t handler;
    siginfo_t usiginfo;
    siginfo_t *p_usi;

    thread = rt_thread_self();
    lwp = (struct rt_lwp*)thread->lwp;

    NEVER_FAIL(rt_mutex_take(&lwp->signal.sig_lock, RT_WAITING_FOREVER));

    if (!sigqueue_isempty(_SIGQ(thread)))
    {
        pending = _SIGQ(thread);
        mask = &thread->signal.sigset_mask;
    }
    else if (!sigqueue_isempty(_SIGQ(lwp)))
    {
        pending = _SIGQ(lwp);
        mask = &thread->signal.sigset_mask;
    }
    else
    {
        pending = RT_NULL;
    }

    if (pending)
    {
        signo = sigqueue_peek(pending, mask);
        if (signo)
        {
            siginfo = sigqueue_dequeue(pending, signo);
            RT_ASSERT(siginfo != RT_NULL);
            handler = _sighandler_get_locked(lwp, signo);

            NEVER_FAIL(rt_mutex_release(&lwp->signal.sig_lock));

            /* arch signal entry */
            if (lwp->signal.sig_action_flags[signo] & SA_SIGINFO)
            {
                siginfo_copy_to_user(siginfo, &usiginfo);
                p_usi = &usiginfo;
            }
            else
                p_usi = RT_NULL;

            /* FIXME: rt_free() of sigqueue should be done in internal API */
            rt_free(siginfo);

            /**
             * enter signal action of user
             * Noted that the p_usi is release before entering signal action by
             * reseting the kernel sp.
             */
            arch_thread_signal_enter(signo, p_usi, exp_frame, handler);
        }
    }
    NEVER_FAIL(rt_mutex_release(&lwp->signal.sig_lock));
}

#if 0
int lwp_signal_check(void)
{
    int signal;

    struct rt_thread *thread;
    struct rt_lwp *lwp;
    lwp_sigqueue_t pending;
    lwp_sigset_t *mask;

    thread = rt_thread_self();
    lwp = (struct rt_lwp*)thread->lwp;

    NEVER_FAIL(rt_mutex_take(&lwp->signal.sig_lock, RT_WAITING_FOREVER));

    if (!sigqueue_isempty(_SIGQ(thread)))
    {
        pending = _SIGQ(thread);
        mask = &thread->signal.sigset_mask;
    }
    else if (!sigqueue_isempty(_SIGQ(lwp)))
    {
        pending = _SIGQ(lwp);
        mask = &thread->signal.sigset_mask;
    }
    else
    {
        pending = RT_NULL;
    }

    if (pending)
    {
        signal = sigqueue_peek(pending, mask);
        RT_ASSERT(signal != 0);
        _sigdelset(pending, signal);
    }
    else
    {
        signal = 0;
    }

    NEVER_FAIL(rt_mutex_release(&lwp->signal.sig_lock));

    return signal;
}
#endif

static void _do_signal_wakeup(rt_thread_t thread, int sig)
{
    if ((thread->stat & RT_THREAD_SUSPEND_MASK) == RT_THREAD_SUSPEND_MASK)
    {
        int need_schedule = 1;

        if ((thread->stat & RT_SIGNAL_COMMON_WAKEUP_MASK) != RT_SIGNAL_COMMON_WAKEUP_MASK)
        {
            rt_thread_wakeup(thread);
        }
        else if ((sig == SIGKILL) && ((thread->stat & RT_SIGNAL_KILL_WAKEUP_MASK) != RT_SIGNAL_KILL_WAKEUP_MASK))
        {
            rt_thread_wakeup(thread);
        }
        else
        {
            need_schedule = 0;
        }

        /* do schedule */
        if (need_schedule)
        {
            rt_schedule();
        }
    }
}

static rt_thread_t _signal_find_catcher(struct rt_lwp *lwp, int signo)
{
    rt_thread_t catcher;
    rt_thread_t candidate;

    candidate = lwp->signal.sig_action_thr[signo];
    if (candidate != RT_NULL)
    {
        catcher = candidate;
    }
    else
    {
        candidate = rt_thread_self();

        /** @note: lwp of current is a const value that can be safely read */
        if (candidate->lwp == lwp &&
            !_sigismember(&candidate->signal.sigset_mask, signo))
        {
            catcher = candidate;
        }
        else
        {
            catcher = RT_NULL;
            rt_list_for_each_entry(candidate, &lwp->t_grp, sibling)
            {
                if (!_sigismember(&candidate->signal.sigset_mask, signo))
                {
                    catcher = candidate;
                    break;
                }
            }

            /* fall back to main thread */
            if (catcher == RT_NULL)
                catcher = rt_list_entry(lwp->t_grp.prev, struct rt_thread, sibling);
        }
    }

    return catcher;
}

static int _siginfo_deliver_to_lwp(struct rt_lwp *lwp, lwp_siginfo_t siginfo)
{
    rt_thread_t catcher;

    NEVER_FAIL(rt_mutex_take(&lwp->signal.sig_lock, RT_WAITING_FOREVER));

    catcher = _signal_find_catcher(lwp, siginfo->ksiginfo.signo);

    sigqueue_enqueue(&lwp->signal.sig_queue, siginfo);
    NEVER_FAIL(rt_mutex_release(&lwp->signal.sig_lock));

    _do_signal_wakeup(catcher, siginfo->ksiginfo.signo);

    return 0;
}

rt_inline rt_bool_t _sighandler_is_ignored(struct rt_lwp *lwp, int signo)
{
    rt_bool_t is_ignored;
    lwp_sighandler_t action;

    NEVER_FAIL(rt_mutex_take(&lwp->signal.sig_lock, RT_WAITING_FOREVER));
    action = _sighandler_get_locked(signo);
    NEVER_FAIL(rt_mutex_release(&lwp->signal_sig_lock));

    if (action == LWP_SIG_ACT_IGN)
        is_ignored = RT_TRUE;
    else if (action == LWP_SIG_ACT_DFL && _sigismember(LWP_SIG_IGNORE_SET, signo))
        is_ignored = RT_TRUE;
    else
        is_ignored = RT_FALSE;

    return is_ignored;
}

rt_err_t lwp_signal_kill(struct rt_lwp *lwp, int signo, int code, int value)
{
    rt_err_t ret;
    lwp_siginfo_t siginfo;

    if (!lwp || signo < 0 || signo >= _LWP_NSIG)
    {
        ret = -RT_EINVAL;
    }
    else
    {
        /* short-circuit code for inactive task, ignored signals */
        if (lwp->terminated || _sighandler_is_ignored(lwp, signo))
            ret = 0;
        else
        {
            siginfo = siginfo_create(signo, code, value);

            if (siginfo)
                ret = _siginfo_deliver_to_lwp(lwp, siginfo);
            else
            {
                LOG_I("%s: siginfo malloc failed", __func__);
                ret = -RT_ENOMEM;
            }
        }
    }
    return ret;
}

int lwp_thread_kill(rt_thread_t thread, int sig)
{
    rt_base_t level;
    int ret = -RT_EINVAL;

    if (!thread)
    {
        rt_set_errno(ESRCH);
        return ret;
    }
    if (sig < 0 || sig >= _LWP_NSIG)
    {
        rt_set_errno(EINVAL);
        return ret;
    }
    level = rt_hw_interrupt_disable();
    if (!thread->lwp)
    {
        rt_set_errno(EPERM);
        goto out;
    }
    if (!_sigismember(&thread->signal_mask, sig)) /* if signal masked */
    {
        _sigaddset(&thread->signal, sig);
        _do_signal_wakeup(thread, sig);
    }
    ret = 0;
out:
    rt_hw_interrupt_enable(level);
    return ret;
}

rt_inline int _lwp_check_ignore(int sig)
{
    if (sig == SIGCHLD || sig == SIGCONT)
    {
        return 1;
    }
    return 0;
}

lwp_sighandler_t lwp_sighandler_get(int sig)
{
    lwp_sighandler_t func = RT_NULL;
    struct rt_lwp *lwp;
    rt_thread_t thread;
    rt_base_t level;

    if (sig == 0 || sig > _LWP_NSIG)
    {
        return func;
    }
    level = rt_hw_interrupt_disable();
    thread = rt_thread_self();
#ifndef ARCH_MM_MMU
    if (thread->signal_in_process)
    {
        func = thread->signal_handler[sig - 1];
        goto out;
    }
#endif
    lwp = (struct rt_lwp*)thread->lwp;

    func = lwp->signal_handler[sig - 1];
    if (!func)
    {
        if (_lwp_check_ignore(sig))
        {
            goto out;
        }
        if (lwp->signal_in_process)
        {
            lwp_terminate(lwp);
        }
        sys_exit(0);
    }
out:
    rt_hw_interrupt_enable(level);

    if (func == (lwp_sighandler_t)SIG_IGN)
    {
        func = RT_NULL;
    }
    return func;
}

void lwp_sighandler_set(int sig, lwp_sighandler_t func)
{
    rt_base_t level;

    if (sig == 0 || sig > _LWP_NSIG)
        return;
    if (sig == SIGKILL || sig == SIGSTOP)
        return;
    level = rt_hw_interrupt_disable();
    ((struct rt_lwp*)rt_thread_self()->lwp)->signal.sig_action[sig - 1] = func;
    rt_hw_interrupt_enable(level);
}

#ifndef ARCH_MM_MMU
void lwp_thread_sighandler_set(int sig, lwp_sighandler_t func)
{
    rt_base_t level;

    if (sig == 0 || sig > _LWP_NSIG)
        return;
    level = rt_hw_interrupt_disable();
    rt_thread_self()->signal_handler[sig - 1] = func;
    rt_hw_interrupt_enable(level);
}
#endif

int lwp_sigaction(int sig, const struct lwp_sigaction *act,
             struct lwp_sigaction *oact, size_t sigsetsize)
{
    rt_base_t level;
    struct rt_lwp *lwp;
    int ret = -RT_EINVAL;
    lwp_sigset_t newset;

    level = rt_hw_interrupt_disable();
    lwp = (struct rt_lwp*)rt_thread_self()->lwp;
    if (!lwp)
    {
        goto out;
    }
    if (sigsetsize != sizeof(lwp_sigset_t))
    {
        goto out;
    }
    if (!act && !oact)
    {
        goto out;
    }
    if (oact)
    {
        oact->sa_flags = lwp->sa_flags;
        oact->sa_mask = lwp->signal_mask;
        oact->sa_restorer = RT_NULL;
        oact->__sa_handler._sa_handler = lwp->signal_handler[sig - 1];
    }
    if (act)
    {
        lwp->sa_flags = act->sa_flags;
        newset = act->sa_mask;
        _sigdelset(&newset, SIGKILL);
        _sigdelset(&newset, SIGSTOP);
        lwp->signal_mask = newset;
        lwp_sighandler_set(sig, act->__sa_handler._sa_handler);
    }
    ret = 0;
out:
    rt_hw_interrupt_enable(level);
    return ret;
}

int lwp_sigprocmask(int how, const lwp_sigset_t *sigset, lwp_sigset_t *oset)
{
    int ret = -1;
    rt_base_t level;
    struct rt_lwp *lwp;
    struct rt_thread *thread;
    lwp_sigset_t newset;

    level = rt_hw_interrupt_disable();

    thread = rt_thread_self();
    lwp = (struct rt_lwp*)thread->lwp;
    if (!lwp)
    {
        goto out;
    }
    if (oset)
    {
        rt_memcpy(oset, &lwp->signal_mask, sizeof(lwp_sigset_t));
    }

    if (sigset)
    {
        switch (how)
        {
            case SIG_BLOCK:
                _sigorsets(&newset, &lwp->signal_mask, sigset);
                break;
            case SIG_UNBLOCK:
                _sigandsets(&newset, &lwp->signal_mask, sigset);
                break;
            case SIG_SETMASK:
                newset = *sigset;
                break;
            default:
                ret = -RT_EINVAL;
                goto out;
        }

        _sigdelset(&newset, SIGKILL);
        _sigdelset(&newset, SIGSTOP);

        lwp->signal_mask = newset;
    }
    ret = 0;
out:
    rt_hw_interrupt_enable(level);
    return ret;
}

int lwp_thread_sigprocmask(int how, const lwp_sigset_t *sigset, lwp_sigset_t *oset)
{
    rt_base_t level;
    struct rt_thread *thread;
    lwp_sigset_t newset;

    level = rt_hw_interrupt_disable();
    thread = rt_thread_self();

    if (oset)
    {
        rt_memcpy(oset, &thread->signal_mask, sizeof(lwp_sigset_t));
    }

    if (sigset)
    {
        switch (how)
        {
            case SIG_BLOCK:
                _sigorsets(&newset, &thread->signal_mask, sigset);
                break;
            case SIG_UNBLOCK:
                _sigandsets(&newset, &thread->signal_mask, sigset);
                break;
            case SIG_SETMASK:
                newset = *sigset;
                break;
            default:
                goto out;
        }

        _sigdelset(&newset, SIGKILL);
        _sigdelset(&newset, SIGSTOP);

        thread->signal_mask = newset;
    }
out:
    rt_hw_interrupt_enable(level);
    return 0;
}

static rt_bool_t _dequeue_info(rt_thread_t thread, siginfo_t *info, int sig)
{
    rt_bool_t isempty; 
    ksiginfo_t iter;
    ksiginfo_t candidate = RT_NULL;

    /* TODO: COMPLETE siginfo list */
    return RT_TRUE; // TODO
    rt_list_for_each_entry(iter, &_KSI(thread->siginfo_list)->node, node)
    {
        if (iter->si.si_signo == sig)
        {
            candidate = iter;
        }
    }
    /* real-time signals should check if same signal is still queuing */
    isempty = RT_TRUE;

    if (candidate)
    {
        memcpy(info, &candidate->si, sizeof(*info));
    }
    return isempty;
}

static int _dequeue_signal(rt_thread_t thread, lwp_sigset_t *mask, siginfo_t *info)
{
    lwp_sigset_t *pending;
    int sig;
    pending = &thread->signal;
    sig = _next_signal(pending, mask);
    if (!sig)
    {
        pending = &((struct rt_lwp *)thread->lwp)->signal;
        sig = _next_signal(pending, mask);
    }

    if (!sig)
        return sig;

    if (_dequeue_info(thread, info, sig))
    {
        /* No more signal */
        _sigdelset(pending, sig);
    }

    info->si_code = SI_TIMER;
    _sigdelset(pending, sig);
    return sig;
}

int lwp_sigtimedwait(lwp_sigset_t *sigset, siginfo_t *info, struct timespec *timeout)
{
    rt_err_t ret;
    int sig;
    rt_thread_t thread = rt_thread_self();

    /**
     * @brief POSIX
     * If one of the signals in set is already pending for the calling thread,
     * sigwaitinfo() will return immediately
     */

    /* Create a mask of signals user dont want or cannot catch */
    _sigdelset(sigset, SIGKILL);
    _sigdelset(sigset, SIGSTOP);
    _signotsets(sigset, sigset);

    sig = _dequeue_signal(thread, sigset, info);
    if (sig)
        return sig;

    /* WARNING atomic problem, what if pending signal arrives before we sleep */

    /**
     * @brief POSIX
     * if none of the signals specified by set are pending, sigtimedwait() shall
     * wait for the time interval specified in the timespec structure referenced
     * by timeout.
     */
    if (timeout)
    {
        /* TODO verify timeout valid ? not overflow 32bits, nanosec valid, ... */
        rt_uint32_t time;
        time = rt_timespec_to_tick(timeout);

        /**
         * @brief POSIX
         * If the timespec structure pointed to by timeout is zero-valued and
         * if none of the signals specified by set are pending, then 
         * sigtimedwait() shall return immediately with an error
         */
        if (time == 0)
            return -EAGAIN;

        rt_enter_critical();
        ret = rt_thread_suspend_with_flag(thread, RT_INTERRUPTIBLE);
        rt_timer_control(&(thread->thread_timer),
                         RT_TIMER_CTRL_SET_TIME,
                         &timeout);
        rt_timer_start(&(thread->thread_timer));
        rt_exit_critical();
    }
    else
    {
        /* suspend kernel forever until signal was received */
        ret = rt_thread_suspend_with_flag(thread, RT_INTERRUPTIBLE);
    }

    if (ret == RT_EOK)
    {
        rt_schedule();
        ret = -EAGAIN;
    }
    /* else ret == -EINTR */

    sig = _dequeue_signal(thread, sigset, info);

    return sig ? sig : ret;
}
