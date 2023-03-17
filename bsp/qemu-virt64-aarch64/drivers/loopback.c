#include <board.h>
#include <rtthread.h>
#include <rtdevice.h>

#include <netif/ethernetif.h>
#include <lwipopts.h>

#include "mmu.h"

static struct eth_device lo_emac = {0};
rt_uint8_t enetaddr[6];         /* MAC address  */

static rt_err_t loop_emac_init(rt_device_t dev)
{
    return RT_EOK;
}

static rt_err_t loop_emac_control(rt_device_t dev, int cmd, void *args)
{
    switch(cmd)
    {
    case NIOCTL_GADDR:
        /* get MAC address */
        if(args) rt_memcpy(args, enetaddr, 6);
        else return -RT_ERROR;
        break;

    default :
        break;
    }
    return RT_EOK;
}

#ifdef RT_USING_DEVICE_OPS
const static struct rt_device_ops loop_emac_ops = 
{
    loop_emac_init,
    RT_NULL,
    RT_NULL,
    RT_NULL,
    RT_NULL,
    loop_emac_control
};
#endif

struct pbuf *lo_emac_rx(rt_device_t dev)
{
    struct pbuf* p = RT_NULL;

    return p;
}

rt_err_t lo_emac_tx(rt_device_t dev, struct pbuf* p)
{
    return 0;
}

void lo_eth_device_linkchange(struct eth_device* dev, rt_bool_t up)
{
    rt_uint32_t level;

    RT_ASSERT(dev != RT_NULL);

    level = rt_hw_interrupt_disable();
    dev->link_changed = 0x01;
    if (up == RT_TRUE)
        dev->link_status = 0x01;
    else
        dev->link_status = 0x00;
    rt_hw_interrupt_enable(level);
}

int lo_emac_hw_init(void)
{
    /* test MAC address */
    enetaddr[0] = 0x11;
    enetaddr[1] = 0x22;
    enetaddr[2] = 0x33;
    enetaddr[3] = 0x33;
    enetaddr[4] = 0x22;
    enetaddr[5] = 0x11;

#ifdef RT_USING_DEVICE_OPS
    lo_emac.parent.ops        = &loop_emac_ops;
#else
    lo_emac.parent.init        = loop_emac_init;
    lo_emac.parent.open       = RT_NULL;
    lo_emac.parent.close      = RT_NULL;
    lo_emac.parent.read       = RT_NULL;
    lo_emac.parent.write      = RT_NULL;
    lo_emac.parent.control    = loop_emac_control;
#endif
    lo_emac.parent.user_data  = RT_NULL;
    lo_emac.eth_rx     = RT_NULL;
    lo_emac.eth_tx     = lo_emac_tx;

    extern rt_err_t eth_device_init(struct eth_device * dev, const char *name);
    /* register ETH device */
    eth_device_init(&lo_emac, "lo");

    lo_eth_device_linkchange(&lo_emac, RT_TRUE);

    return 0;
}
INIT_APP_EXPORT(lo_emac_hw_init);


