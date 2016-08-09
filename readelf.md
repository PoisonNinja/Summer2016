# readelf
readelf is a powerful tool that allows us to examine ELF files in detail. As with nm, it is part of the binutils package.

People often recommend using objdump, but I strongly discourage that. As shown by a post on [stackoverflow](http://stackoverflow.com/questions/22160621/why-does-objdump-not-show-bss-shstratab-symtab-and-strtab-sections), objdump's backend is actually libbfd, the library that most, but not all, binutil tools use. The problem with libbfd is that it abstracts a lot of things, which means that the level of detail that we can get from libbfd, and by extension, objdump, is a lot less then readelf.

# Useful options
* -h : Dumps the header of the ELF executable

ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           Intel 80386
  Version:                           0x1
  Entry point address:               0x111fd1
  Start of program headers:          52 (bytes into file)
  Start of section headers:          400812 (bytes into file)
  Flags:                             0x0
  Size of this header:               52 (bytes)
  Size of program headers:           32 (bytes)
  Number of program headers:         2
  Size of section headers:           40 (bytes)
  Number of section headers:         19
  Section header string table index: 16

* -S : Lists the sections in a ELF file

There are 19 section headers, starting at offset 0x61dac:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .text             PROGBITS        00100000 001000 0124c1 00  AX  0   0 4096
  [ 2] .init             PROGBITS        001124c1 0134c1 000005 00  AX  0   0  1
  [ 3] .fini             PROGBITS        001124c6 0134c6 000005 00  AX  0   0  1
  [ 4] .rodata           PROGBITS        00113000 014000 02ad7e 00   A  0   0 4096
  [ 5] .eh_frame         PROGBITS        0013dd80 03ed80 00371c 00   A  0   0  4
  [ 6] .data             PROGBITS        00142000 043000 015858 00  WA  0   0 4096
  [ 7] .bss              NOBITS          00158000 058858 004fd8 00  WA  0   0 4096
  [ 8] .comment          PROGBITS        00000000 058858 000011 01  MS  0   0  1
  [ 9] .debug_info       PROGBITS        00000000 058869 002556 00      0   0  1
  [10] .debug_abbrev     PROGBITS        00000000 05adbf 0004f9 00      0   0  1
  [11] .debug_loc        PROGBITS        00000000 05b2b8 000b3d 00      0   0  1
  [12] .debug_aranges    PROGBITS        00000000 05bdf5 000040 00      0   0  1
  [13] .debug_ranges     PROGBITS        00000000 05be35 000070 00      0   0  1
  [14] .debug_line       PROGBITS        00000000 05bea5 0004a2 00      0   0  1
  [15] .debug_str        PROGBITS        00000000 05c347 000e0d 01  MS  0   0  1
  [16] .shstrtab         STRTAB          00000000 061d00 0000ac 00      0   0  1
  [17] .symtab           SYMTAB          00000000 05d154 002cc0 10     18 246  4
  [18] .strtab           STRTAB          00000000 05fe14 001eec 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
  L (link order), O (extra OS processing required), G (group), T (TLS),
  C (compressed), x (unknown), o (OS specific), E (exclude),
  p (processor specific)

* -x : List the hex dump of a section in a ELF file

Hex dump of section '.text':
  0x00100000 02b0ad1b 03000000 fb4f52e4 5589e557 .........OR.U..W
  0x00100010 565381ec ac000000 8b4510a3 2c801500 VS.......E..,...
  0x00100020 c745e000 000000c7 45e40000 0000c745 .E......E......E
  0x00100030 dc000000 00c745d8 00000000 c705ac8e ......E.........
  0x00100040 15000100 00008b45 088b4030 8945d4eb .......E..@0.E..
  0x00100050 1f8b45d4 8b50108b 400c0145 e01155e4 ..E..P..@..E..U.
  0x00100060 8b45d48b 108b45d4 01d083c0 048945d4 .E....E.......E.
  0x00100070 8b45088b 50308b45 088b402c 01c28b45 .E..P0.E..@,...E
