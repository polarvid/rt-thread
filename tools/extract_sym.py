
"""
Copyright (c) 2006-2023, RT-Thread Development Team

SPDX-License-Identifier: Apache-2.0

Change Logs:
Date           Author       Notes
2023-03-23     WangXiaoyao  first version

Usage:

```bash
python extract_sym.py rtthread.nm > ksymtbl.c
"""

class SymbolEntry:
    # (system V format): Name Value Class Type Size Line Section
    def __init__(self, symbol, addr, class_char, type, size, line, section):
        self.symbol = symbol
        self.addr = addr
        self.class_char = class_char
        self.type = type
        self.size = size
        self.line = line
        self.section = section

"""
BLOB generator
This will build the 6 sections of BLOB with the compile() method

An entry following the structure of:
(symbol:str, address:int)

While in actual, we split it to 2 separated mapping:
- {symbol} -> {address}
- {address} -> {symbol}

This makes it easier to looking up in both direction.

To accelerate the process of implementation, we sorted the symbols and
address which give us a chance to choose a log(n) searching algorithm.
Now it looks like:
{ordering_sym_idx} -> {symbol} -> {address}
{ordering_addr_idx} -> {address} -> {symbol}

Now we have to save some space in RAM. This is done by modifying address
to an offset by `text_base` and symbol to an offset to `string_section`
Finally we get 4 mappings:
{ordering_sym_idx} -> {symbol.offset} -> {address.offset}
{ordering_addr_idx} -> {address.offset} -> {symbol.offset}
{address} -> {address.offset}
{symbol} -> {symbol.offset}

the BLOB file format is specified in variable `wrap_src`
And its imaginary structure is:

```c
    #include <stdint.h>

    static uint32_t
    __attribute__((section(".ksymtbl.header")))
    header[8] = {
        (MAGIC_NUMBER << 16) | SYMBOL_CNT,
        offset_base_lo,
        offset_base_hi,

        (uintptr_t)offset_to_sym - (uintptr_t)header,
        (uintptr_t)sym_to_offset - (uintptr_t)header,
        (uintptr_t)all_offset - (uintptr_t)header,
        (uintptr_t)all_symbol - (uintptr_t)header,
        (uintptr_t)strings - (uintptr_t)header,
    };

    static uint16_t
    __attribute__((section(".ksymtbl.off_to_symbol")))
    offset_to_sym[SYMBOL_CNT] = {
        0
    };

    static uint16_t
    __attribute__((section(".ksymtbl.sym_to_offset")))
    sym_to_offset[SYMBOL_CNT] = {
        0
    };

    static uint32_t
    __attribute__((section(".ksymtbl.idx_to_offset")))
    all_offset[SYMBOL_CNT] = {
        0
    };

    static uint32_t
    __attribute__((section(".ksymtbl.idx_to_symbol")))
    all_symbol[SYMBOL_CNT] = {
        0
    };

    static char
    __attribute__((section(".ksymtbl.strings")))
    strings[] = "placeholder";
```

For uint16_t, we encode 2 of it in one uint32_t. For example, we have
idx 1 as `0x2211` and 2 as `0x4433`. Now the entry in array will be `0x44332211`
For little-endian machine, this will be:
char memory[] = [0x11, 0x22, 0x33, 0x44]

For big-endian machine, this will be:
char memory[] = [0x44, 0x33, 0x22, 0x11]

We will NOT get correct value by just referencing ((u16)memory)[idx] in both case.
So there is a compile time processing to dealing with it
"""
class MapInfo:
    def __init__(self):
        self.entry_list = []
        self.__oft_str_dict = {}

    def __oft_str_insert(self, base, offset):
        oft_str = '0x{0:x},\n'.format(offset)
        if base in self.__oft_str_dict:
            self.__oft_str_dict[base] += oft_str
        else:
            self.__oft_str_dict[base] = '\n' + oft_str + ',\n'

    def compile(self):
        # 1. compile offset table (assuming entry_list in asc order)
        for entry in self.entry_list:
            entry:SymbolEntry
            # 1.1. build offset table in ascending order
            addr = int(entry.addr, 16)
            offset = addr & 0xffffffff
            base = addr & 0xffffffff00000000
            self.__oft_str_insert(base, offset)

        syt_str = '\n'
        str_str = ''
        offset = 0
        # 2. compile symbol table & string section
        # The 2 describe all symbols in ascending order in simply
        all_symbols_asc = sorted(all_symbols)
        str_off_list = []   # {idx} -> {str_off_to_string_section_base}
                            # e.g. string0 = (char *)(str_base + str_off_list[0])
                            # this will be store in symbol table section
        for symbol in all_symbols_asc:
            # 2.1. append entry symbol table
            str_off_list.append(offset)

            # 2.2. entry for the string section
            sym_entry_str = '{0}\\0'.format(symbol)
            offset += len(sym_entry_str)    # next entry in symbol table
            str_str += sym_entry_str

        # 2.3. convert symbol table to array of uint32_t
        if len(str_off_list) % 2 != 0:
            # padding to '\0' if the length of array is odd
            str_off_list.append(offset - 1)
        for i in range(0, len(str_off_list), 2):
            syt_str += 'MERGE(0x{0:x}, 0x{1:x}),\n'.format(str_off_list[i], str_off_list[i + 1])

        # 2.4. convert string section to array of uint32_t
        bytes = bytearray(str_str, 'utf-8')
        str_str = ''
        remainder = 4 - len(bytes) % 4
        while remainder > 0:
            # padding with '\0'
            bytes.append(0)
            remainder -= 1
        for i in range(0, len(bytes), 4):
            value32 = bytes[i] | bytes[i + 1] << 8 | bytes[i + 2] << 16 | bytes[i + 3] << 24
            str_str += '0x{0:x},\n'.format(value32)


        self.__syt_str = syt_str
        self.__str_str = str_str
    def get_offset_table(self):
        return self.__oft_str
    def get_symbol_table(self):
        return self.__syt_str
    def get_string_section(self):
        return self.__str_str
    def get_string(self):
        return self.__str_str
    def get_symbol_count(self) -> int:
        return len(self.entry_list)
    def debug_gen_symbols(self):
        return ''

def acceptable_entry(entry:SymbolEntry):
    # skip absolute class
    class_char = entry.class_char
    if class_char.upper() == 'A':
        return False

    return True
"""
Compile a .map file by MapInfo() & generate header file to C compiler
"""
def extract_sym(file_path):
    with open(file_path, 'r') as f:
        import re
        lines = f.read().splitlines()
        map_info = MapInfo()
        # 1. Skip header
        while True:
            line = lines.pop(0)
            if line.find('Symbols from') != -1:
                lines.pop(0)    # nothing
                lines.pop(0)    # header
                lines.pop(0)    # nothing
                break

        # 2. build dictionary
        # we seen the nm file as a structure in the form:
        # (addr, type, symbol)
        #
        # and we collect all the information in map file to build a
        # list of `BlockEntry` which represent the block and storage
        # the message we are interested in
        separator_regex = re.compile(r'\|')

        while True:
            # read one block
            try:
                line = lines.pop(0)
            except:
                break

            if line:
                # parse one entry in .nm
                entry = separator_regex.split(line)
                block = SymbolEntry(symbol=entry[0].strip(),
                                    addr=entry[1].strip(),
                                    class_char=entry[2].strip(),
                                    type=entry[3].strip(),
                                    size=entry[4].strip(),
                                    line=entry[5].strip(),
                                    section=entry[6].strip())
                if acceptable_entry(block):
                    map_info.entry_list.append(block)

        # 4. generate BLOB
        wrap_src = '''#include <stdint.h>
#include <stdio.h>

#ifdef __ORDER_LITTLE_ENDIAN__
#define MERGE(id1, id2)          ((id2) << 16 | ((id1) & 0xffff))
#else
#define MERGE(id1, id2)          ((id1) << 16 | ((id2) & 0xffff))
#endif /* __ORDER_LITTLE_ENDIAN__ */

// at least be 4 bytes
#define ALIGN_REQ (4)
#define FLOOR(val) (((size_t)(val) + (ALIGN_REQ)-1) & ~((ALIGN_REQ)-1))
#define SYMBOL_CNT {symbol_cnt_src}

// 8 entry in header (fixed size)
#define HEADER_SZ (8 * sizeof(uint32_t))

// maximum acceptable idx is 2^16(=64k)
#define O2S_SZ (SYMBOL_CNT * sizeof(uint16_t))
#define S2O_SZ (SYMBOL_CNT * sizeof(uint16_t))
#define OFT_SZ (SYMBOL_CNT * sizeof(uint32_t))
#define SYT_SZ (SYMBOL_CNT * sizeof(uint32_t))

#define OFF_O2S FLOOR(HEADER_SZ)
#define OFF_S2O FLOOR(OFF_O2S + O2S_SZ)
#define OFF_OFT FLOOR(OFF_S2O + S2O_SZ)
#define OFF_SYT FLOOR(OFF_OFT + OFT_SZ)
#define OFF_STR FLOOR(OFF_SYT + SYT_SZ)

uint32_t
__attribute__((section(".ksymtbl")))
ksymtbl_blob[] = {{
    {magic_src},
    {symbol_cnt_src},
    0x{string_size:x},
    0x{offset_baselo_src:x},
    0x{offset_basehi_src:x},

    OFF_O2S, // offset to `offset_to_sym` section
    OFF_S2O, // offset to `sym_to_offset` section
    OFF_OFT, // offset to `offset_table` section
    OFF_SYT, // offset to `symbol_table` section
    OFF_STR, // offset to `strings` section

    // skip padding
    [OFF_O2S/sizeof(ksymtbl_blob[0])] = {o2s_str}
    // skip padding
    [OFF_S2O/sizeof(ksymtbl_blob[0])] = {s2o_str}
    // skip padding
    [OFF_OFT/sizeof(ksymtbl_blob[0])] = {oft_str}
    // skip padding
    [OFF_SYT/sizeof(ksymtbl_blob[0])] = {syt_str}
    // skip padding
    [OFF_STR/sizeof(ksymtbl_blob[0])] = {str_str}
}};
'''
        map_info.compile()
        # 4.1 generate header with magic number, symbol_cnt and offset of five sections
        magic_src = '0x20233202'
        offset_baselo = map_info.text_base & 0xffffffff
        offset_basehi = (map_info.text_base - offset_baselo) >> 32
        # 4.2 generate other symbols
        oft_str = map_info.get_offset_table()
        syt_str = map_info.get_symbol_table()
        str_str = map_info.get_string_section()

        print(wrap_src.format(magic_src=magic_src,
                            symbol_cnt_src=map_info.get_symbol_count(),
                            offset_baselo_src=offset_baselo,
                            offset_basehi_src=offset_basehi,
                            o2s_str='0,',
                            s2o_str='0,',
                            oft_str=oft_str,
                            syt_str=syt_str,
                            str_str=str_str))

if __name__ == "__main__":
    import sys
    import os
    file_path:str
    if len(sys.argv) > 1:
        file_path = sys.argv[1]
        if not os.path.exists(file_path):
            print('#error process file not specify or not exits')
            exit(-1)
    else:
        file_path = '/home/rtthread-smart/kernel/bsp/qemu-virt64-aarch64/rtthread.nm'
    extract_sym(file_path)
