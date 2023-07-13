/*
 * Copyright (c) 2006-2023, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2022-11-09     WangXiaoyao  Add portable asm support
 * 2023-04-13     WangXiaoyao  Support for ftrace insn generation
 */
#ifndef __OPCODE_H__
#define __OPCODE_H__

/**
 * @brief RISC-V instruction formats
 */

/**
 * R type: .insn r opcode6, func3, func7, rd, rs1, rs2
 *
 * +-------+-----+-----+-------+----+---------+
 * | func7 | rs2 | rs1 | func3 | rd | opcode6 |
 * +-------+-----+-----+-------+----+---------+
 * 31      25    20    15      12   7        0
 */
#define __OPC_INSN_FORMAT_R(opcode, func3, func7, rd, rs1, rs2) \
    ".insn r "RT_STRINGIFY(opcode)","RT_STRINGIFY(func3)","RT_STRINGIFY(func7)","RT_STRINGIFY(rd)","RT_STRINGIFY(rs1)","RT_STRINGIFY(rs2)

/**
 * I type: .insn i opcode6, func3, rd, rs1, simm12
 *
 * +--------------+-----+-------+----+---------+
 * | simm12[11:0] | rs1 | func3 | rd | opcode6 |
 * +--------------+-----+-------+----+---------+
 * 31             20    15      12   7         0
 */
#define __OPC_INSN_FORMAT_I(opcode, func3, rd, rs1, simm12) \
    ".insn i "RT_STRINGIFY(opcode)","RT_STRINGIFY(func3)","RT_STRINGIFY(rd)","RT_STRINGIFY(rs1)","RT_STRINGIFY(rs2)","RT_STRINGIFY(simm12)

/**
 * U type: .insn u opcode6, rd, simm20
 *
 * +--------------------------+----+---------+
 * | simm20[20|10:1|11|19:12] | rd | opcode6 |
 * +--------------------------+----+---------+
 * 31                         12   7         0
 */
#define __OPC_INSN_FORMAT_U(opcode, rd, simm20) \
    ".insn u "RT_STRINGIFY(opcode)","RT_STRINGIFY(rd)","RT_STRINGIFY(simm20)

/**
 * J type: .insn j opcode6, rd, symbol
 *
 * +------------+--------------+------------+---------------+----+---------+
 * | simm20[20] | simm20[10:1] | simm20[11] | simm20[19:12] | rd | opcode6 |
 * +------------+--------------+------------+---------------+----+---------+
 * 31           30             21           20              12   7         0
 */
#define __OPC_INSN_FORMAT_J(opcode, rd, symbol) \
    ".insn j "RT_STRINGIFY(opcode)","RT_STRINGIFY(rd)","RT_STRINGIFY(symbol)

/** 
 * Control Transfer Instructions
 */

/* jump and link register */
#define OPC_JALR(rd, rs1, simm12) \
    __OPC_INSN_FORMAT_I(0x67, 0, rd, rs1, simm12)

/**
 * Integer Register-Immediate Instructions
 */

/* add upper immediate to pc */
#define OPC_AUIPC(rd, symbol) \
    __OPC_INSN_FORMAT_U(0x27, rd, symbol)

#endif /* __OPCODE_H__ */
