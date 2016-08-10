# nm
nm is a tool included with the binutils package, that allows us to see a map of the symbols in a ELF file.

# Basic Usage
To see all the symbols, use `nm <file>`. Using nm without a file name specified will by default use the file `a.out`, which is created by GCC by default. So, you could be really lazy and do `gcc test.c && nm`. The output of nm will have the address of the symbol on the left, and and symbol name on the right. Below is some sample output:

```
00111ffe t .flush
001121e8 t .page_loop
00000001 a ALIGN
e4524ffb a CHECKSUM
00000003 a FLAGS
1badb002 a MAGIC
decade21 a MAGIC
00000002 a MEMINFO
00156160 D PciClassCodeTable
001565c0 D PciCommandFlags
00156640 D PciDevSelFlags
00146740 D PciDevTable
00156600 D PciStatusFlags
00142100 D PciVenTable
0013c524 r __func__.1889
0013c530 r __func__.1897
0013c53c r __func__.1905
0013c548 r __func__.1925
0013c554 r __func__.1947
0013c560 r __func__.1954
```

The middle column describes the type or location of the symbol. For more details, see <http://linux.die.net/man/1/nm> or `man nm`.

To sort the output, simply pipe it into sort: `nm <file> | sort`.

```
00000001 a ALIGN
00000002 a MEMINFO
00000003 a FLAGS
00111ffe t .flush
001121e8 t .page_loop
0013c524 r __func__.1889
0013c530 r __func__.1897
0013c53c r __func__.1905
0013c548 r __func__.1925
0013c554 r __func__.1947
0013c560 r __func__.1954
00142100 D PciVenTable
00146740 D PciDevTable
00156160 D PciClassCodeTable
001565c0 D PciCommandFlags
00156600 D PciStatusFlags
00156640 D PciDevSelFlags
1badb002 a MAGIC
decade21 a MAGIC
e4524ffb a CHECKSUM
```

To search for a symbol name, pipe nm into grep. You can also search for addresses too. For example, if you figured out where your program was segmentation faulting, you can use the nm output to figure roughly what function it was crashing in. However, it has become a lot less useful with dynamic libraries in the mix.
