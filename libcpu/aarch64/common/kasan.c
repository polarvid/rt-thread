/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2023-02-27     WangXiaoyao  Support Software-Tagged KASAN
 */

#include <rtthread.h>
#include "backtrace.h"

#ifdef ARCH_ENABLE_SOFT_KASAN
#include "mmu.h"
#include "kasan.h"
#include "rtdef.h"
#include <mm_aspace.h>

#define DBG_TAG "hw.kasan"
#define DBG_LVL DBG_LOG
#include <rtdbg.h>

#define SUPER_TAG (0xff)
#define RET_ADDR (_PTR(__builtin_return_address(0)))
#define FRAME_PTR (_PTR(__builtin_frame_address(0)))
#define _PC ({ __label__ __here; __here: (unsigned long)&&__here; })
#define _V2P(ptr) (rt_hw_mmu_kernel_v2p((void *)((rt_ubase_t)ptr | 0xff00000000000000)))
#define _PTR(integer) ((void *)(integer))

#ifndef ALWAYS_INLINE
#define ALWAYS_INLINE inline __attribute__((always_inline))
#endif

#define NON_TAG_WIDTH (8 * (sizeof(rt_ubase_t) - 1))
#define NON_TAG_MASK ((1ul << NON_TAG_WIDTH) - 1)

#define PTR2TAG(ptr) (((rt_ubase_t)(ptr) >> NON_TAG_WIDTH) & 0xff)
#define TAG2PTR(ptr, tag) (((rt_ubase_t)(ptr) & NON_TAG_MASK) | ((tag) << NON_TAG_WIDTH))

#define SKIP_SUPER(tag, replace) ((tag) == SUPER_TAG ? (replace) : (tag))

struct rt_varea kasan_area;

static const char *get_name(rt_varea_t varea)
{
    return "kasan-shadow-area";
}

static void on_page_fault(rt_varea_t varea, struct rt_mm_fault_msg *msg)
{
    RT_ASSERT(varea == &kasan_area);

    rt_mm_dummy_mapper.on_page_fault(varea, msg);
    if (msg->response.status == MM_FAULT_STATUS_OK)
    {
        memset(msg->response.vaddr, SUPER_TAG, ARCH_PAGE_SIZE);
    }
}

struct rt_mem_obj kasan_mapper = {
    .on_varea_close = RT_NULL,
    .on_varea_open = RT_NULL,
    .get_name = get_name,
    .hint_free = RT_NULL,
    .on_page_fault = on_page_fault,
};

char *kasan_area_start;
static int kasan_enable;

/**
 * @brief Init data kasan needs
 */
void kasan_init()
{
    kasan_enable = 1;
    return ;
}

static inline char *_addr_to_shadow(void *addr)
{
    /* whole ARCH_VADDR_WIDTH is counted */
    rt_ubase_t offset = (rt_ubase_t)addr & ((1ul << ARCH_VADDR_WIDTH) - 1);
    offset = offset / KASAN_WORD_SIZE;
    return kasan_area_start + offset;
}

static rt_bool_t handle_fault(void *start, rt_size_t length, rt_bool_t is_write, void *ret_addr, char tag)
{
    LOG_E("[KASAN]: Invalid %s Access", is_write ? "WRITE" : "READ");
    LOG_E("(%p) try to access 0x%lx bytes at %p; tag %x shadow %x\n",
          TAG2PTR(ret_addr, 0xfful), length, start, PTR2TAG(ret_addr), tag);

    rt_backtrace_skipn(3);
    return RT_FALSE;
}

static rt_bool_t _shadow_accessible(char *shadow, const size_t shadow_words)
{
    const void *sha_end = shadow + shadow_words;
    void *sha_pg = _PTR((rt_ubase_t)shadow & ~ARCH_PAGE_MASK);
    void *sha_pg_end = _PTR(RT_ALIGN((rt_ubase_t)sha_end, ARCH_PAGE_SIZE));

    do {
        void *phyaddr = _V2P(sha_pg);
        if (phyaddr == ARCH_MAP_FAILED)
            return RT_FALSE;
        sha_pg += ARCH_PAGE_SIZE;
    } while (sha_pg != sha_pg_end);
    return RT_TRUE;
}

/* detect accessibility of shadow region, then compare a given tag with the region */
static inline rt_bool_t _is_region_valid(char *shadow, char tag, rt_size_t region_sz,
    void *start, rt_bool_t is_write, void *ret_addr)
{
    const size_t shadow_words = RT_ALIGN(region_sz, KASAN_WORD_SIZE) / KASAN_WORD_SIZE;

    /* unaccessible shadow area indicated a poisoned tag */
    if (!_shadow_accessible(shadow, shadow_words))
        return handle_fault(start, region_sz, is_write, ret_addr, SUPER_TAG);

    /* check all the tags in given region */
    for (size_t i = 0; i < shadow_words; shadow++, i++)
    {
        if (*shadow != tag)
            return handle_fault(start, region_sz, is_write, ret_addr, *shadow);
    }
    return RT_TRUE;
}

static void _shadow_set_tag(char *shadow, const char tag, rt_size_t region_sz)
{
    const size_t shadow_words = RT_ALIGN(region_sz, KASAN_WORD_SIZE) / KASAN_WORD_SIZE;
    for (size_t i = 0; i < shadow_words; shadow++, i++)
    {
        *shadow = tag;
    }
    return ;
}

/**
 * @brief entry of kasan address verification routine on each access (load/store)
 */
static inline rt_bool_t _kasan_verify(void *start, rt_size_t length, rt_bool_t is_write, void *ret_addr)
{
    if (length == 0 || !kasan_enable)
        return RT_TRUE;

    char tag = PTR2TAG(start);

    if (tag == SUPER_TAG || tag == 0)
        return RT_TRUE;

    /* is legal address ? we should not check vaddr accessible because it's allowed
        to access unaccessible in situations like demanding pages */
    char *shadow;
    shadow = _addr_to_shadow(start);
    if (!_is_region_valid(shadow, tag, length, start, is_write, ret_addr))
        return RT_FALSE;

    return RT_TRUE;
}

/**
 * @brief Tag Generations
 */
static rt_uint8_t _tag_alloc(void *start, rt_size_t length)
{
    /* check shadow accessible: find the corresponding pages and check the accessibility each of them */
    void *shadow = _addr_to_shadow(start);
    const size_t shadow_words = RT_ALIGN(length, KASAN_WORD_SIZE) / KASAN_WORD_SIZE;

    const void *sha_end = shadow + shadow_words;
    void *sha_pg = _PTR((rt_ubase_t)shadow & ~ARCH_PAGE_MASK);
    void *sha_pg_end = _PTR(RT_ALIGN((rt_ubase_t)sha_end, ARCH_PAGE_SIZE));

    do {
        void *phyaddr = _V2P(sha_pg);
        if (phyaddr == ARCH_MAP_FAILED)
        {
            /**
             * populate page if not exist
             * noted that a new page is poisoned on allocation by kasan_mapper
             */
            int err;
            err = rt_aspace_load_page(&rt_kernel_space, sha_pg, 1);
            if (err)
            {
                LOG_E("%s: populate page failed at %p", __func__, sha_pg);

                /** 
                 * restore all influence to maintain atomicity
                 * we don't free the pages if failed to simplify implementation
                 * it's a rare case where system consumed most the resource it needs
                 */
                RT_ASSERT(err == -RT_ENOMEM);
                return SUPER_TAG;
            }
        }
        sha_pg += ARCH_PAGE_SIZE;
    } while (sha_pg != sha_pg_end);

    /* calculate a new tag */
    char left, right;
    char *pleft = _addr_to_shadow(start - 1);
    char *pright = _addr_to_shadow(start + length);

    if (_V2P(pleft) != ARCH_MAP_FAILED)
        left = *pleft;
    else
        left = SUPER_TAG;

    if (_V2P(pright) != ARCH_MAP_FAILED)
        right = *pright;
    else
        right = SUPER_TAG;

    /* try to sparse tags allocated */
    static char iter;
    iter++;
    char tag = iter + 1;
    while (tag == right || tag == left || tag == SUPER_TAG)
        tag++;

    return tag;
}

/* called on malloc */
void *kasan_unpoisoned(void *start, rt_size_t length)
{
    /* malloc alignment must at least be kasan word size */
    RT_ASSERT(!((rt_ubase_t)start & (KASAN_WORD_SIZE - 1)));

    if (!kasan_enable)
        return start;

    unsigned long tag;
    tag = _tag_alloc(start, length);

    _shadow_set_tag(_addr_to_shadow(start), tag, length);
    return _PTR(TAG2PTR(start, tag));
}

/**
 * called on free 
 * start must be unpoisoned before by calling kasan_unpoisoned
 */
int kasan_poisoned(void *start)
{
    /* malloc alignment must at least be kasan word size */
    RT_ASSERT(!((rt_ubase_t)start & (KASAN_WORD_SIZE - 1)));

    int err = RT_EOK;
    /* assumed that address pointed by start is legal */
    /* we poisoned every contiguous tag that is identical to start */
    if (!kasan_enable || !start)
        return err;

    // 1. try to find the tag of start
    char *tagp = _addr_to_shadow(start);

    // 2. try to get tag
    if (_V2P(tagp) != ARCH_MAP_FAILED)
    {
        char tag = PTR2TAG(start);
        char shad_tag = *tagp;
        if (shad_tag != tag)
        {
            LOG_E("%s: unmatched poisoned region %p", __func__, start);
            err = -RT_ERROR;
        }

        /**
         * while doing poisoned, we must ensure that:
         * 1. check accessibility when crossing page boundary
         * 2. stop when tag is changed
         */
        char *next_page_tagp = (char *)RT_ALIGN((rt_ubase_t)tagp, ARCH_PAGE_SIZE);
        while (1)
        {
            while (tagp < next_page_tagp && *tagp == tag)
                *tagp++ = SUPER_TAG;

            if (*tagp != tag)
                break;
            next_page_tagp += ARCH_PAGE_SIZE;
        }
    }
    else
    {
        LOG_E("%s: unallocated poisoned region %p", __func__, start);
        err = -RT_ERROR;
    }

    return err;
}

/**
 * @brief Construct the asan routine for compiler API
 */
#define KASAN_FN_TEMPLATE(size) \
    void __asan_load##size(void *p) \
    {   \
        _kasan_verify(p, size, RT_FALSE, RET_ADDR); \
    } \
    void __asan_load##size##_noabort(void *p) \
    __attribute__((alias(RT_STRINGIFY(__asan_load##size))));\
    void __asan_store##size(void *p) \
    {   \
        _kasan_verify(p, size, RT_TRUE, RET_ADDR); \
    } \
    void __asan_store##size##_noabort(void *p) \
    __attribute__((alias(RT_STRINGIFY(__asan_store##size))));

KASAN_FN_TEMPLATE(1);
KASAN_FN_TEMPLATE(2);
KASAN_FN_TEMPLATE(4);
KASAN_FN_TEMPLATE(8);
KASAN_FN_TEMPLATE(16);

void __asan_loadN(void *p, size_t size)
{
    _kasan_verify(p, size, RT_FALSE, RET_ADDR);
}
void __asan_loadN_noabort(void *p, size_t size)
__attribute__((alias("__asan_loadN")));

void __asan_storeN(void *p, size_t size)
{
    _kasan_verify(p, size, RT_TRUE, RET_ADDR);
}
void __asan_storeN_noabort(void *p, size_t size)
__attribute__((alias("__asan_storeN")));

#endif /* ARCH_ENABLE_SOFT_KASAN */
