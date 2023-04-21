/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2022-11-10     RT-Thread    The first version
 * 2023-03-13     WangXiaoyao  syscall metadata as structure
 * 2023-04-22     WangXiaoyao  strace support & syscall meta extension
 */
#ifndef __SYSCALL_DATA_H__
#define __SYSCALL_DATA_H__

#include <rtthread.h>

#define __NARGS(a,aa,b,bb,c,cc,d,dd,e,ee,f,ff,g,gg,n,...) n
#define _NARGS(...) __NARGS(__VA_ARGS__,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0)

#define _TYPE(type, arg)            #type
#define _ARG(type, arg)             #arg
#define _SIGNATURE(type, arg)       type arg

#define _SEL0(func)
#define _SEL1(func, type, arg)      func(type, arg)
#define _SEL2(func, type, arg, ...) func(type, arg), _SEL1(func, __VA_ARGS__)
#define _SEL3(func, type, arg, ...) func(type, arg), _SEL2(func, __VA_ARGS__)
#define _SEL4(func, type, arg, ...) func(type, arg), _SEL3(func, __VA_ARGS__)
#define _SEL5(func, type, arg, ...) func(type, arg), _SEL4(func, __VA_ARGS__)
#define _SEL6(func, type, arg, ...) func(type, arg), _SEL5(func, __VA_ARGS__)
#define _SEL7(func, type, arg, ...) func(type, arg), _SEL6(func, __VA_ARGS__)

#define __META_TYPES(narg, ...)     _SEL##narg(_TYPE, __VA_ARGS__)
#define _META_TYPES(narg, ...)      __META_TYPES(narg, __VA_ARGS__)
#define __META_ARGS(narg, ...)      _SEL##narg(_ARG, __VA_ARGS__)
#define _META_ARGS(narg, ...)       __META_ARGS(narg, __VA_ARGS__)
#define __PARAM_LIST(narg, ...)     _SEL##narg(_SIGNATURE, __VA_ARGS__)
#define _PARAM_LIST(narg, ...)      __PARAM_LIST(narg, __VA_ARGS__)

#define _SYSCALL_METADATA(name, ...) \
const char *_sys_##name##_param_type[] = {_META_TYPES(_NARGS(__VA_ARGS__), __VA_ARGS__)}; \
const char *_sys_##name##_param_name[] = {_META_ARGS(_NARGS(__VA_ARGS__), __VA_ARGS__)}

#define SYSCALL_DEFINE_VARG(name, ...)  \
_SYSCALL_METADATA(name, __VA_ARGS__);   \
sysret_t sys_##name(_PARAM_LIST(_NARGS(__VA_ARGS__), __VA_ARGS__), ...)

typedef long sysret_t;

struct rt_syscall_def
{
    void *func;
#ifdef TRACING_SYSCALL
    char *name;

    #ifdef TRACING_SYSCALL_EXT
        const char **param_list_types;
        const char **param_list_name;
        const int param_cnt;
    #endif
#endif
};

#ifdef TRACING_SYSCALL
    #ifdef TRACING_SYSCALL_EXT
        #define SYSCALL_META(func)          \
            &RT_STRINGIFY(func)[4],         \
            (void *)&_##func##_param_type,  \
            (void *)&_##func##_param_name,  \
            sizeof(_##func##_param_type)/sizeof(_##func##_param_type[0])
    #else
        #define SYSCALL_META &RT_STRINGIFY(func)[4]
    #endif
#else
    #define SYSCALL_META()
#endif

/**
 * @brief signature for syscall, used to locate syscall metadata.
 *
 * We don't allocate an exclusive section in ELF like Linux do
 * to avoid initializing necessary data by iterating that section,
 * which increases system booting time.
 *
 * Each syscall is described by a signature as `rt_syscall_def`
 * in syscall table. This make it easy to locate every syscall's
 * metadata by syscall id.
 */
#define SYSCALL_SIGN(func) {    \
    (void *)(func),             \
    &RT_STRINGIFY(func)[4],     \
}

#define SYSCALL_SIGN_EXT(func) {    \
    (void *)(func),                 \
    SYSCALL_META(func),             \
}

#define SET_ERRNO(no) rt_set_errno(-(no))
#define GET_ERRNO() ({int _errno = rt_get_errno(); _errno > 0 ? -_errno : _errno;})

#define _SYS_WRAP(func) ({int _ret = func; _ret < 0 ? GET_ERRNO() : _ret;})

#endif /* __SYSCALL_DATA_H__ */
