/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-03-20     WangXiaoyao  the first version
 */

#include "rtdef.h"
#define DBG_TAG "tracing.ftrace.device"
#define DBG_LVL DBG_LOG
#include <rtdbg.h>

#include "ftrace-device.h"
#include "ftrace-graph.h"

#include <rtthread.h>
#include <lwp.h>
#include <dfs_file.h>
#include <lwp_user_mm.h>
#include <mm_aspace.h>
#include <mmu.h>

struct fgraph_session {
    ftrace_tracer_t tracer;
    struct ftrace_device_fgraph_cons_session cons_session[RT_CPUS_NR];
};

typedef struct ftrace_dev_session {
    struct ftrace_session session;

    /** Event Generation Tracer */
    union {
        struct fgraph_session fgraph;
    };

    enum ftrace_event_class event_generator_class;
    atomic_uint initialized;
} *ftrace_dev_session_t;

static struct ftrace_dev_session _dev_session;

static struct rt_device ftrace_dev;

rt_err_t ftrace_init(rt_device_t dev)
{
    dev->user_data = RT_NULL;
    return RT_EOK;
}

#define FTRACE_SESSION(session) (&session->session)

static void _cleanup_function_tracer(ftrace_dev_session_t session)
{
    return ;
}

static rt_ssize_t _setup_function_tracer(ftrace_dev_session_t session, ftrace_device_control_t control)
{
    return -ENOSYS;
    // return sizeof(*control);
}

static rt_ssize_t _function_tracer_read(ftrace_dev_session_t session, rt_off_t pos, rt_base_t *buffer, rt_size_t size)
{
    return -ENOSYS;
}

static void _cleanup_fgraph_tracer(ftrace_dev_session_t session)
{
    ftrace_tracer_t fgraph = session->fgraph.tracer;
    /* delete all consumer */
    for (size_t i = 0; i < RT_CPUS_NR; i++)
    {
        ftrace_graph_delete_cons_session(fgraph, session->fgraph.cons_session[i].func_evt);
        ftrace_graph_delete_cons_session(fgraph, session->fgraph.cons_session[i].thread_evt);
    }

    /* delete tracer */
    ftrace_graph_tracer_delete(fgraph);
}

static rt_ssize_t _setup_fgraph_tracer(ftrace_dev_session_t session, ftrace_device_control_t control)
{
    rt_err_t retval;
    ftrace_tracer_t fgraph;
    fgraph = ftrace_graph_tracer_create(control->buffer_size, control->override);

    if ((retval = ftrace_session_bind(&session->session, &fgraph[0])) ||
        (retval = ftrace_session_bind(&session->session, &fgraph[1])))
    {
        ftrace_graph_tracer_delete(fgraph);
        /* it's likely that tracer is unknown to controller */
        retval = -ENOSYS;
    }
    else
    {
        /* the size of reading commands */
        retval = sizeof(*control);
    }

    /* setup consumer thread */
    ftrace_consumer_session_t thread_evt, func_evt;
    for (size_t i = 0; i < RT_CPUS_NR; i++)
    {
        func_evt = ftrace_graph_create_cons_session(fgraph, FTRACE_EVENT_THREAD, i);
        thread_evt = ftrace_graph_create_cons_session(fgraph, FTRACE_EVENT_FGRAPH, i);

        /* failed to create new consumer session */
        if (!func_evt || !thread_evt)
        {
            do {
                if (func_evt)
                    ftrace_graph_delete_cons_session(fgraph, func_evt);
                if (thread_evt)
                    ftrace_graph_delete_cons_session(fgraph, thread_evt);

                i--;
                func_evt = session->fgraph.cons_session[i].func_evt;
                session->fgraph.cons_session[i].func_evt = 0;
                thread_evt = session->fgraph.cons_session[i].thread_evt;
                session->fgraph.cons_session[i].thread_evt = 0;
            } while (i >= 0 && (func_evt || thread_evt));
            retval = -ENOMEM;
            break;
        }

        session->fgraph.cons_session[i].thread_evt = (void *)thread_evt;
        session->fgraph.cons_session[i].func_evt = (void *)func_evt;
    }
    
    if (retval > 0)
        session->fgraph.tracer = fgraph;
    else
        LOG_W("FTrace session setup failed, return code %ld", retval);

    return retval;
}

static int _fgraph_tracer_mmap(ftrace_dev_session_t session, struct dfs_mmap2_args *mmap)
{
    int rc;
    rt_varea_t varea;
    struct rt_lwp *lwp = lwp_self();
    /* find the corresponding consumer stream */

    /* create a va area in user space (lwp) */
    varea = lwp_map_user_varea(lwp, mmap->addr, mmap->length);

    if (varea)
    {
        /* alloc a page frame for the area */
        void *page = rt_pages_alloc(0);
        strncpy(page, "ftrace sample message", 128);

        /* map the page frame to user */
        rc = rt_varea_map_page(varea, varea->start, page);

        /* let varea free the page automatically on unmap */
        rt_varea_pgmgr_insert(varea, page);

        mmap->ret = varea->start;
    }
    else
    {
        rc = -RT_ENOMEM;
        LOG_W("%s(va:%p, sz:%lx): failed to create varea in user space",
            __func__, mmap->addr, mmap->length);
    }

    return rc;
}

#define FUNC_STR            1
#define THREAD_STR          (FUNC_STR + RT_CPUS_NR)
#define POS2IDX(pos, start) (((pos)-sizeof(struct ftrace_device_control))/sizeof(rt_base_t) - (start))
static rt_ssize_t _fgraph_tracer_read(ftrace_dev_session_t session, rt_off_t pos, rt_base_t *buffer, rt_size_t size)
{
    const rt_ssize_t rc = size;

    /* filter out unaligned input */
    if (size & (sizeof(rt_base_t) - 1))
        return -EINVAL;

    const rt_base_t *bufend = (rt_base_t *)((char *)buffer + size);

    /* Reading number of cores */
    if (POS2IDX(pos, 0) == 0 && buffer != bufend)
    {
        *buffer++ = ARCH_PAGE_SIZE;
        pos += sizeof(rt_base_t);
    }

    if (POS2IDX(pos, 1) == 0 && buffer != bufend)
    {
        *buffer++ = RT_CPUS_NR;
        pos += sizeof(rt_base_t);
    }

    // while (POS2IDX(pos, FUNC_STR) < RT_CPUS_NR && buffer != bufend)
    // {
    //     *buffer++ = (rt_base_t)session->fgraph.func_evt[POS2IDX(pos, FUNC_STR)];
    //     pos += sizeof(rt_base_t);
    // }

    // while (size && POS2IDX(pos, THREAD_STR) < RT_CPUS_NR)
    // {
    //     *buffer++ = (rt_base_t)session->fgraph.thread_evt[POS2IDX(pos, THREAD_STR)];
    //     pos += sizeof(rt_base_t);
    // }

    return rc;
}

static rt_err_t _setup_session(rt_device_t dev, rt_uint16_t oflag)
{
    ftrace_dev_session_t session = &_dev_session;
    ftrace_session_init(FTRACE_SESSION(session));
    dev->user_data = session;
    return 0;
}

static rt_err_t ftrace_open(rt_device_t dev, rt_uint16_t oflag)
{
    rt_err_t retval;
    unsigned int expected = 0;
    if (atomic_compare_exchange_strong(&_dev_session.initialized, &expected, 1))
        retval = _setup_session(dev, oflag);
    else
        retval = -RT_EBUSY;

    return retval;
}

static rt_err_t ftrace_close(rt_device_t dev)
{
    ftrace_dev_session_t session = dev->user_data;

    /* clean up tracer if exist */
    switch (session->event_generator_class)
    {
        case FTRACE_EVT_CLZ_FUNCTION:
            _cleanup_function_tracer(session);
            break;
        case FTRACE_EVT_CLZ_FGRAPH:
            _cleanup_fgraph_tracer(session);
            break;
        default:
            break;
    }
    session->event_generator_class = 0;

    /* clean up current ftrace session */
    dev->user_data = RT_NULL;
    ftrace_session_detach(FTRACE_SESSION(session));
    atomic_store(&_dev_session.initialized, 0);

    return RT_EOK;
}

static rt_ssize_t ftrace_read(rt_device_t dev, rt_off_t pos, void *buffer, rt_size_t size)
{
    rt_ssize_t rc;
    ftrace_dev_session_t session = dev->user_data;

    switch (session->event_generator_class)
    {
        case FTRACE_EVT_CLZ_FUNCTION:
            rc = _function_tracer_read(session, pos, buffer, size);
            break;
        case FTRACE_EVT_CLZ_FGRAPH:
            rc = _fgraph_tracer_read(session, pos, buffer, size);
            break;
        default:
            rc = -ENOSYS;
    }
    return rc;
}

/* User session control interface */
static rt_ssize_t ftrace_write(rt_device_t dev, rt_off_t pos, const void *buffer, rt_size_t size)
{
    rt_ssize_t rc;
    ftrace_device_control_t control = (void *)buffer;
    ftrace_dev_session_t session = dev->user_data;

    switch (control->event_class)
    {
        case FTRACE_EVT_CLZ_FUNCTION:
            session->event_generator_class = control->event_class;
            rc = _setup_function_tracer(session, control);
            break;
        case FTRACE_EVT_CLZ_FGRAPH:
            session->event_generator_class = control->event_class;
            rc = _setup_fgraph_tracer(session, control);
            break;
        default:
            rc = -ENOSYS;
    }

    return rc;
}

static int ftrace_mmap(rt_device_t dev, struct dfs_mmap2_args *mmap)
{
    int rc;
    ftrace_dev_session_t session = dev->user_data;

    /* filter out invalid argument */
    if (!mmap->length || (mmap->length & ARCH_PAGE_MASK))
        return -EINVAL;

    switch (session->event_generator_class)
    {
        // case FTRACE_EVT_CLZ_FUNCTION:
        //     session->event_generator_class = control->event_class;
        //     rc = _setup_function_tracer(session, control);
        //     break;
        case FTRACE_EVT_CLZ_FGRAPH:
            rc = _fgraph_tracer_mmap(session, mmap);
            break;
        default:
            rc = -ENOSYS;
    }

    return rc;
}

static rt_err_t ftrace_control(rt_device_t dev, int cmd, void *args)
{
    rt_err_t err;
    ftrace_dev_session_t session = dev->user_data;

    switch (cmd)
    {
        case RT_FIOMMAP2:
            err = ftrace_mmap(dev, (struct dfs_mmap2_args *)args);
            break;
        case FTRACE_DEV_IOCTL_REG:
            ftrace_session_register(&session->session);
            err = RT_EOK;
            break;
        case FTRACE_DEV_IOCTL_UNREG:
            ftrace_session_unregister(&session->session);
            err = RT_EOK;
            break;
        default:
            err = -ENOSYS;
    }
    return err;
}

#ifdef RT_USING_DEVICE_OPS
const static struct rt_device_ops ftrace_ops =
{
    ftrace_init,
    ftrace_open,
    ftrace_close,
    ftrace_read,
    ftrace_write,
    ftrace_control
};
#endif

int ftrace_device_init(void)
{
    static rt_bool_t init_ok = RT_FALSE;

    if (init_ok)
    {
        return 0;
    }
    RT_ASSERT(!rt_device_find("ftrace"));
    ftrace_dev.type     = RT_Device_Class_Char;

#ifdef RT_USING_DEVICE_OPS
    ftrace_dev.ops      = &ftrace_ops;
#else
    ftrace_dev.init     = ftrace_init;
    ftrace_dev.open     = ftrace_open;
    ftrace_dev.close    = ftrace_close;
    ftrace_dev.read     = ftrace_read;
    ftrace_dev.write    = ftrace_write;
    ftrace_dev.control  = ftrace_control;
#endif
    ftrace_dev.user_data = RT_NULL;

    rt_device_register(&ftrace_dev, "ftrace", RT_DEVICE_FLAG_RDWR);

    init_ok = RT_TRUE;

    return 0;
}
INIT_DEVICE_EXPORT(ftrace_device_init);
