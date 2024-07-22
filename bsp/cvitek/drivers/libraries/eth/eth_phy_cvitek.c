/*
* Copyright (C) Cvitek Co., Ltd. 2019-2020. All rights reserved.
*/
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <stdbool.h>

// #include <mmio.h>

#include "cvi_eth_phy.h"
#include "mii.h"



// #define CVI_ETH_PHY_LOOPBACK
#define LOOPBACK_XMII2MAC       0x8000
#define LOOPBACK_PCS2MAC        0x2000
#define LOOPBACK_PMA2MAC        0x1000
#define LOOPBACK_RMII2PHY       0x0080

#define EPHY_EFUSE_VALID_BIT_REG 0x00000120
#define EPHY_EFUSE_TXECHORC_FLAG 0x00000100 // bit 8
#define EPHY_EFUSE_TXITUNE_FLAG 0x00000200 // bit 9
#define EPHY_EFUSE_TXRXTERM_FLAG 0x00000800 // bit 11

static inline bool phy_if_mode_is_rgmii(phy_if_mode_t interface)
{
    return interface >= PHY_IF_MODE_RGMII && interface <= PHY_IF_MODE_RGMII_TXID;
}

#if defined(CVI_ETH_PHY_LOOPBACK)
static int cv181x_set_phy_loopback(eth_phy_handle_t handle, phy_loopback_mode_t mode)
{
    return 0;
}
#endif

static inline void ephy_dev_clrsetbits(eth_phy_dev_t *dev, uint32_t reg, uint32_t clear, uint32_t set)
{
    mmio_clrsetbits_32(dev->priv->ephy_base + reg, clear, set);
}

static inline uint32_t efuse_dev_read(eth_phy_dev_t *dev, uint32_t reg)
{
    return mmio_read_32(dev->priv->efuse_base + reg);
}

static inline void ephy_dev_write(eth_phy_dev_t *dev, uint32_t reg, uint32_t val)
{
    mmio_write_32(dev->priv->ephy_base + reg, val);
}

static inline uint32_t ephy_dev_read(eth_phy_dev_t *dev, uint32_t reg)
{
    return mmio_read_32(dev->priv->ephy_base + reg);
}

/**
  \brief       Configure the cv181x before make it start up.
  \param[in]   handle  phy handle
  \return      error code
*/
/* CVITEK cv181x */
int32_t cv181x_config(eth_phy_handle_t handle)
{
    assert(handle);
    eth_phy_dev_t *dev = (eth_phy_dev_t *)handle;
    uint32_t val = 0;

    // eth_phy_reset(dev);

    // set rg_ephy_apb_rw_sel 0x0804@[0]=1/APB by using APB interface
    ephy_dev_write(dev, 0x804, 0x0001);

    // Release 0x0800[0]=0/shutdown
    // ephy_dev_write(dev, 0x800, 0x0900);

    // Release 0x0800[2]=1/dig_rst_n, Let mii_reg can be accessabile
    // ephy_dev_write(dev, 0x800, 0x0904);

    //mdelay(10);

    // ANA INIT (PD/EN), switch to MII-page5
    ephy_dev_write(dev, 0x07c, 0x0500);
    // Release ANA_PD p5.0x10@[13:8] = 6'b001100
    ephy_dev_write(dev, 0x040, 0x0c00);
    // Release ANA_EN p5.0x10@[7:0] = 8'b01111110
    ephy_dev_write(dev, 0x040, 0x0c7e);

    // Wait PLL_Lock, Lock_Status p5.0x12@[15] = 1
    //mdelay(1);

    // Release 0x0800[1] = 1/ana_rst_n
    ephy_dev_write(dev, 0x800, 0x0906);

    // ANA INIT
    // @Switch to MII-page5
    ephy_dev_write(dev, 0x07c, 0x0500);

// Efuse register
    // Set Double Bias Current
    //Set rg_eth_txitune1  0x03009064 [15:8]
    //Set rg_eth_txitune0  0x03009064 [7:0]
    if ((efuse_dev_read(dev, EPHY_EFUSE_VALID_BIT_REG) & EPHY_EFUSE_TXITUNE_FLAG) ==
        EPHY_EFUSE_TXITUNE_FLAG) {
        val = ((efuse_dev_read(dev, 0x1024) >> 24) & 0xFF) |
                (((efuse_dev_read(dev, 0x1024) >> 16) & 0xFF) << 8);
        ephy_dev_clrsetbits(dev, 0x064, 0xFFFF, val);
    } else
        ephy_dev_write(dev, 0x064, 0x5a5a);

    // Set Echo_I
    // Set rg_eth_txechoiadj 0x03009054  [15:8]
    if ((efuse_dev_read(dev, EPHY_EFUSE_VALID_BIT_REG) & EPHY_EFUSE_TXECHORC_FLAG) ==
        EPHY_EFUSE_TXECHORC_FLAG) {
        ephy_dev_clrsetbits(dev, 0x054, 0xFF00, ((efuse_dev_read(dev, 0x1024) >> 8) & 0xFF) << 8);
    } else
        ephy_dev_write(dev, 0x054, 0x0000);

    //Set TX_Rterm & Echo_RC_Delay
    // Set rg_eth_txrterm_p1  0x03009058 [11:8]
    // Set rg_eth_txrterm     0x03009058  [7:4]
    // Set rg_eth_txechorcadj 0x03009058  [3:0]
    if ((efuse_dev_read(dev, EPHY_EFUSE_VALID_BIT_REG) & EPHY_EFUSE_TXRXTERM_FLAG) ==
        EPHY_EFUSE_TXRXTERM_FLAG) {
        val = (((efuse_dev_read(dev, 0x1020) >> 28) & 0xF) << 4) |
                (((efuse_dev_read(dev, 0x1020) >> 24) & 0xF) << 8);
        ephy_dev_clrsetbits(dev, 0x058, 0xFF0, val);
    } else
        ephy_dev_write(dev, 0x058, 0x0bb0);

// ETH_100BaseT
    // Set Rise update
    ephy_dev_write(dev, 0x05c, 0x0c10);

    // Set Falling phase
    ephy_dev_write(dev, 0x068, 0x0003);

    // Set Double TX Bias Current
    ephy_dev_write(dev, 0x054, 0x0000);

    // Switch to MII-page16
    ephy_dev_write(dev, 0x07c, 0x1000);

    // Set MLT3 Positive phase code, Set MLT3 +0
    ephy_dev_write(dev, 0x068, 0x1000);
    ephy_dev_write(dev, 0x06c, 0x3020);
    ephy_dev_write(dev, 0x070, 0x5040);
    ephy_dev_write(dev, 0x074, 0x7060);

    // Set MLT3 +I
    ephy_dev_write(dev, 0x058, 0x1708);
    ephy_dev_write(dev, 0x05c, 0x3827);
    ephy_dev_write(dev, 0x060, 0x5748);
    ephy_dev_write(dev, 0x064, 0x7867);

    // Switch to MII-page17
    ephy_dev_write(dev, 0x07c, 0x1100);

    // Set MLT3 Negative phase code, Set MLT3 -0
    ephy_dev_write(dev, 0x040, 0x9080);
    ephy_dev_write(dev, 0x044, 0xb0a0);
    ephy_dev_write(dev, 0x048, 0xd0c0);
    ephy_dev_write(dev, 0x04c, 0xf0e0);

    // Set MLT3 -I
    ephy_dev_write(dev, 0x050, 0x9788);
    ephy_dev_write(dev, 0x054, 0xb8a7);
    ephy_dev_write(dev, 0x058, 0xd7c8);
    ephy_dev_write(dev, 0x05c, 0xf8e7);

    // @Switch to MII-page5
    ephy_dev_write(dev, 0x07c, 0x0500);

    // En TX_Rterm
    ephy_dev_write(dev, 0x040, (0x0001 | ephy_dev_read(dev, 0x040)));

//  Link Pulse
    // Switch to MII-page10
    ephy_dev_write(dev, 0x07c, 0x0a00);

    // Set Link Pulse
    ephy_dev_write(dev, 0x040, 0x2000);
    ephy_dev_write(dev, 0x044, 0x3832);
    ephy_dev_write(dev, 0x048, 0x3132);
    ephy_dev_write(dev, 0x04c, 0x2d2f);
    ephy_dev_write(dev, 0x050, 0x2c2d);
    ephy_dev_write(dev, 0x054, 0x1b2b);
    ephy_dev_write(dev, 0x058, 0x94a0);
    ephy_dev_write(dev, 0x05c, 0x8990);
    ephy_dev_write(dev, 0x060, 0x8788);
    ephy_dev_write(dev, 0x064, 0x8485);
    ephy_dev_write(dev, 0x068, 0x8283);
    ephy_dev_write(dev, 0x06c, 0x8182);
    ephy_dev_write(dev, 0x070, 0x0081);

// TP_IDLE
    // Switch to MII-page11
    ephy_dev_write(dev, 0x07c, 0x0b00);

// Set TP_IDLE
    ephy_dev_write(dev, 0x040, 0x5252);
    ephy_dev_write(dev, 0x044, 0x5252);
    ephy_dev_write(dev, 0x048, 0x4B52);
    ephy_dev_write(dev, 0x04c, 0x3D47);
    ephy_dev_write(dev, 0x050, 0xAA99);
    ephy_dev_write(dev, 0x054, 0x989E);
    ephy_dev_write(dev, 0x058, 0x9395);
    ephy_dev_write(dev, 0x05C, 0x9091);
    ephy_dev_write(dev, 0x060, 0x8E8F);
    ephy_dev_write(dev, 0x064, 0x8D8E);
    ephy_dev_write(dev, 0x068, 0x8C8C);
    ephy_dev_write(dev, 0x06C, 0x8B8B);
    ephy_dev_write(dev, 0x070, 0x008A);

// ETH 10BaseT Data
    // Switch to MII-page13
    ephy_dev_write(dev, 0x07c, 0x0d00);

    ephy_dev_write(dev, 0x040, 0x1E0A);
    ephy_dev_write(dev, 0x044, 0x3862);
    ephy_dev_write(dev, 0x048, 0x1E62);
    ephy_dev_write(dev, 0x04c, 0x2A08);
    ephy_dev_write(dev, 0x050, 0x244C);
    ephy_dev_write(dev, 0x054, 0x1A44);
    ephy_dev_write(dev, 0x058, 0x061C);

    // Switch to MII-page14
    ephy_dev_write(dev, 0x07c, 0x0e00);

    ephy_dev_write(dev, 0x040, 0x2D30);
    ephy_dev_write(dev, 0x044, 0x3470);
    ephy_dev_write(dev, 0x048, 0x0648);
    ephy_dev_write(dev, 0x04c, 0x261C);
    ephy_dev_write(dev, 0x050, 0x3160);
    ephy_dev_write(dev, 0x054, 0x2D5E);

    // Switch to MII-page15
    ephy_dev_write(dev, 0x07c, 0x0f00);

    ephy_dev_write(dev, 0x040, 0x2922);
    ephy_dev_write(dev, 0x044, 0x366E);
    ephy_dev_write(dev, 0x048, 0x0752);
    ephy_dev_write(dev, 0x04c, 0x2556);
    ephy_dev_write(dev, 0x050, 0x2348);
    ephy_dev_write(dev, 0x054, 0x0C30);

    // Switch to MII-page16
    ephy_dev_write(dev, 0x07c, 0x1000);

    ephy_dev_write(dev, 0x040, 0x1E08);
    ephy_dev_write(dev, 0x044, 0x3868);
    ephy_dev_write(dev, 0x048, 0x1462);
    ephy_dev_write(dev, 0x04c, 0x1A0E);
    ephy_dev_write(dev, 0x050, 0x305E);
    ephy_dev_write(dev, 0x054, 0x2F62);

// LED PAD MUX
//    mmio_write_32(0x030010e0, 0x05);
//    mmio_write_32(0x030010e4, 0x05);
    //(SD1_CLK selphy)
//    mmio_write_32(0x050270b0, 0x11111111);
    //(SD1_CMD selphy)
//    mmio_write_32(0x050270b4, 0x11111111);

// LED
    // Switch to MII-page1
    ephy_dev_write(dev, 0x07c, 0x0100);

    // select LED_LNK/SPD/DPX out to LED_PAD
    ephy_dev_write(dev, 0x068, (ephy_dev_read(dev, 0x068) & ~0x0f00));

    // @Switch to MII-page0
    ephy_dev_write(dev, 0x07c, 0x0000);

    // PHY_ID
    ephy_dev_write(dev, 0x008, 0x0043);
    ephy_dev_write(dev, 0x00c, 0x5649);

    // Switch to MII-page19
    ephy_dev_write(dev, 0x07c, 0x1300);
    ephy_dev_write(dev, 0x058, 0x0012);
    // set agc max/min swing
    ephy_dev_write(dev, 0x05C, 0x6848);

    // Switch to MII-page18
    ephy_dev_write(dev, 0x07c, 0x1200);
    // p18.0x12, lpf
    ephy_dev_write(dev, 0x048, 0x0808);
    ephy_dev_write(dev, 0x04C, 0x0808);
// hpf
//sean
    ephy_dev_write(dev, 0x050, 0x32f8);
    ephy_dev_write(dev, 0x054, 0xf8dc);

    // Switch to MII-page0
    ephy_dev_write(dev, 0x07c, 0x0000);
    // EPHY start auto-neg procedure
    ephy_dev_write(dev, 0x800, 0x090e);

    // switch to MDIO control by ETH_MAC
    ephy_dev_write(dev, 0x804, 0x0000);

    genphy_config(dev);

#if defined(CVI_ETH_PHY_LOOPBACK)
    cv181x_set_phy_loopback(handle, LOOPBACK_PCS2MAC);
#endif

    return 0;
}

/**
  \brief       Parse 88E1xxx's speed and duplex from status register.
  \param[in]   dev  phy device pointer
  \return      error code
*/
static int32_t cv181x_parse_status(eth_phy_dev_t *dev)
{
    assert(dev);
    assert(dev->priv);
    eth_phy_priv_t *priv = dev->priv;
    uint8_t phy_addr = dev->phy_addr;
    uint16_t mii_reg;
    int32_t ret;

    ret = eth_phy_read(priv, phy_addr, CVI_MII_BMSR, &mii_reg);

    if (ret != 0) {
        return ret;
    }

    if (mii_reg & (CVI_BMSR_100FULL | CVI_BMSR_100HALF))
        priv->link_info.speed = CSI_ETH_SPEED_100M;
    else
        priv->link_info.speed = CSI_ETH_SPEED_10M;

    if (mii_reg & (CVI_BMSR_10FULL | CVI_BMSR_100FULL))
        priv->link_info.duplex = CSI_ETH_DUPLEX_FULL;
    else
        priv->link_info.duplex = CSI_ETH_DUPLEX_HALF;

    return 0;
}

/**
  \brief       Start up the 88E1111.
  \param[in]   handle  phy handle
  \return      error code
*/
int32_t cv181x_start(eth_phy_handle_t handle)
{
    assert(handle);

    eth_phy_dev_t *dev = (eth_phy_dev_t *)handle;
    int32_t ret;

    /* Read the Status (2x to make sure link is right) */
    ret = genphy_update_link(dev);

    if (ret) {
        return ret;
    }

    return cv181x_parse_status(dev);
}

/**
  \brief       Halt the cv181x.
  \param[in]   handle  phy handle
  \return      error code
*/
int32_t cv181x_stop(eth_phy_handle_t handle)
{
    return 0;
}

/**
  \brief       Update the cv181x's link state.
  \param[in]   handle  phy handle
  \return      error code
*/
int32_t cv181x_update_link(eth_phy_handle_t handle)
{
    assert(handle);
    eth_phy_dev_t *dev = (eth_phy_dev_t *)handle;
    return cv181x_parse_status(dev);;
}


/* Support for cv181x PHYs */
eth_phy_dev_t cv181x_device = {
    .name = "CVITEK,CV181X",
    .phy_id = 0x00435649,
    .mask = 0xffffffff,
    .features = CVI_PHY_BASIC_FEATURES,
    .config = &cv181x_config,
    .start = &cv181x_start,
    .stop = &cv181x_stop,
    //.loopback = &cv181x_loopback,
    //.update_link = &cv181x_update_link,
};
