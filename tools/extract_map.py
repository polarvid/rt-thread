
"""
Copyright (c) 2006-2023, RT-Thread Development Team

SPDX-License-Identifier: Apache-2.0

Change Logs:
Date           Author       Notes
2023-03-23     WangXiaoyao  first version

Usage:

```bash
python extract_sym.py rtthread.map > ksymtbl.c
"""

class BlockEntry:
    def __init__(self, offset, len, path):
        # {symbol_name} -> {address} mapping
        self.entries = {}
        self.offset = offset
        self.len = len
        self.path = path

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
        self.text_base = 0
        self.text_size = 0
        self.symbol_cnt = 0
        self.block_list = []

    def compile(self):
        oft_str = '\n'
        all_symbols = []
        # 1. compile offset table (all offset of symbols to TEXT_BASE)
        for block in self.block_list:
            block:BlockEntry
            # 1.1. build offset table in ascending order
            for value in block.entries.values():
                offset = int(value, 16) - self.text_base
                oft_str += '0x{0:x},\n'.format(offset)
            # 1.2. collect symbols in this block to `all_symbols`
            all_symbols.append(block.entries.keys())

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

        self.__oft_str = oft_str
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
    def debug_gen_symbols(self):
        return ''

"""
Compile a .map file by MapInfo() & generate header file to C compiler
"""
def extract_sym(file_path):
    with open(file_path, 'r') as f:
        import re
        lines = f.read().splitlines()
        map_info = MapInfo()

        # 1. find the 'Linker script and memory map' section
        while True:
            line = lines.pop(0)
            if line == 'Linker script and memory map':
                break

        # 2. skip LOAD by matching .text
        hex_regstr = r'0x[0-9a-fA-F]+'
        regex_firstmap = re.compile(r'\.text\s+' + hex_regstr + '\s+' + hex_regstr)
        spaces_regex = re.compile(r'\s+')
        while True:
            line = lines.pop(0)
            match = regex_firstmap.search(line)
            if match:
                pairs = spaces_regex.split(match.group())
                map_info.text_base = int(pairs[1], 16)
                map_info.text_size = int(pairs[2], 16)
                break

        # 3. build dictionary
        # we seen the map file as a structure in the form:
        # block := header content+
        # header := base total_sz path
        # content := base symbol_name
        #
        # and we collect all the information in map file to build a
        # list of `BlockEntry` which represent the block and storage
        # the message we are interested in
        entry_regstr = r'[a-zA-Z0-9_\-\.]+'
        path_regstr = r'\/?(' + entry_regstr + r'\/)*(' + entry_regstr + r'\.o)'
        symbol_regstr = r'[a-zA-Z_][a-zA-Z0-9_]*'
        header_regex = re.compile(hex_regstr + '\s+' + hex_regstr + '\s+' + path_regstr)
        content_regex = re.compile(r'^\s+' + hex_regstr + '\s+' + symbol_regstr)

        while True:
            # read one block
            line = lines.pop(0)
            match = header_regex.search(line)
            if match:
                # parse header
                header = spaces_regex.split(match.group())
                block = BlockEntry(header[0], header[1], header[2])

                # read content under this header
                while True:
                    line = lines.pop(0)
                    match = content_regex.search(line)
                    if match:
                        # split into (address, symbol_name) pair
                        line = match.group()
                        pair = spaces_regex.split(line)
                        # this must success
                        address = pair[1]
                        symbol = pair[2]

                        # collect it in block.entries
                        block.entries[symbol] = address
                    else:
                        # nothing under this header
                        lines.insert(0, line)
                        break

                # strip empty block
                if len(block.entries.keys()) > 0:
                    map_info.symbol_cnt += len(block.entries)
                    map_info.block_list.append(block)
            elif '*(__patchable_function_entries)' in line:
                # stop once reach __patchable_function_entries section
                break

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
    ({magic_src} << 16) | {symbol_cnt_src},
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
        magic_src = '0x2023'
        offset_baselo = map_info.text_base & 0xffffffff
        offset_basehi = (map_info.text_base - offset_baselo) >> 32
        # 4.2 generate other symbols
        oft_str = map_info.get_offset_table()
        syt_str = map_info.get_symbol_table()
        str_str = map_info.get_string_section()

        print(wrap_src.format(symbol_cnt_src=map_info.symbol_cnt,
                            magic_src=magic_src,
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
    extract_sym(file_path)
