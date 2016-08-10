# Introduction
Here, we will look at the differences between how x86 and x86_64 access global variables differently in programs compiled with PIC support (-fPIC).

# x86
## Getting the instruction pointer address
Before we start looking at how x86 handles PIC, we need to know that x86 lacks a way to reference the instruction pointer address. This presents a problem, as we don't have a otherwise fixed frame of reference to offset from. Unless, there is a way.

Actually, we can use a trick to get the instruction pointer address. This is an interesting line of code:
```nasm
4f3:	e8 19 00 00 00       	call   511 <__x86.get_pc_thunk.ax>
```

That calls a function called \_\_x86.get_pc_thunk.ax. Below is the code:
```
00000511 <__x86.get_pc_thunk.ax>:
 511:	8b 04 24             	mov    (%esp),%eax
 514:	c3                   	ret    
```
What it does is it moves the address of the next instruction to EAX. When you call a function, it pushes the address of the next instruction onto the stack. This simply moves the value stored at ESP (the pushed address of the next instruction) into EAX. When we return, we have the address nice and safe in EAX.

## PIC
We will be looking at test-32.so, which is the 32 bit compiler version of test.c. The disassembly from objdump is in test-32.S, which I will be referencing.

What it does is simple. There is a global integer called base with a value of 2, and a function called myfunc that returns base + the value passed into myfunc.

We can start at 0x4f3, where it calls the \_\_x86.get_pc_thunk.ax function I explained up there. It puts the address of where EIP is pointing into eax. The next line:

```nasm
4f8:	05 08 1b 00 00       	add    $0x1b08,%eax
```

adds 0x1b08 to eax. This makes EAX point to somwhere in the GOT (global offset table). The reason why this works is because the offset of the GOT from each section is known at link time, so this is easy to calculate. It doesn't need to be at the beginning, as long as in the end the offset is correct.

```nasm
4fd:	8b 80 e8 ff ff ff    	mov    -0x18(%eax),%eax
```

This line subtracts 0x18 from eax, which is the address of the GOT entry for our global variable, "base".

```nasm
503:	8b 10                	mov    (%eax),%edx
```

This line takes the value of the variable pointed to in EAX (our global variable) and moves it into EDX.

After this, it finishes the rest of the function, but we are only interested in those couple lines.

## Checking
We can see what's going on by doing some math. We can start at 0x4f3 as before.

That returns 0x4f8, the next instruction, and puts it into eax. Then we add 0x1b08 to 0x4f8, which equals 0x2000. This should place us somewhere in the GOT. If we run readelf with the -S argument on it, we get:
```
 [10] .plt.got          PROGBITS        000003b0 0003b0 000010 00  AX  0   0  8
 [19] .got              PROGBITS        00001fe8 000fe8 000018 04  WA  0   0  4
 [20] .got.plt          PROGBITS        00002000 001000 00000c 04  WA  0   0  4
```
As you can see, 0x2000 is the end of the GOT section, and the start of the .got.plt section. However, we aren't done yet. The next instruction subtracts 0x18 from 0x2000, which gives us 0x1fe8, the start of the .got. Is this the right GOT entry though? We can check with readelf -r again:
```
Relocation section '.rel.dyn' at offset 0x334 contains 9 entries:
 Offset     Info    Type            Sym.Value  Sym. Name
00001f14  00000008 R_386_RELATIVE   
00001f18  00000008 R_386_RELATIVE   
0000200c  00000008 R_386_RELATIVE   
00001fe8  00000806 R_386_GLOB_DAT    00002010   base
00001fec  00000106 R_386_GLOB_DAT    00000000   _ITM_deregisterTMClone
00001ff0  00000206 R_386_GLOB_DAT    00000000   __cxa_finalize@GLIBC_2.1.3
00001ff4  00000306 R_386_GLOB_DAT    00000000   __gmon_start__
00001ff8  00000406 R_386_GLOB_DAT    00000000   _Jv_RegisterClasses
00001ffc  00000506 R_386_GLOB_DAT    00000000   _ITM_registerTMCloneTa
```

Here we can see the relocation entry for base, which is right where we expect it to be: 0x1fe8.

## Summary
So, for x86, referencing variables in PIC is relatively easy.
1. We call a special function to get the current EIP
2. We add a known offset to get into somewhere around the GOT
3. We subtract or add a offset to get to the GOT entry
4. Dereference the entry there to get our final entry

# x86-64
x86_64 is a little different from x86. We will be using the same source code as before (test.c), but compiled into 64-bit code. The disassembled code can be found in test-64.S.

## PIC
Once again, we start in myfunc. We can skip the first four instructions, which are just the function prologue. We start at 0x69a.

```nasm
69a:	48 8b 05 2f 09 20 00 	mov    0x20092f(%rip),%rax        # 200fd0 <_DYNAMIC+0x190>
```

Here is the instruction that does what took x86 several instructions to do: it adds an offset to the address of the instruction pointer. This is what is different: x86_64 has the capability to use what is known as instruction pointer relative addressing. We can use RIP like any other register (except for writing to it).

0x69a adds 0x20092f to RIP, which as we know from before, brings us somewhere into the .got section. However, as the next instruction indicates, we are already in the correct got entry, since we do not need to subtract or add another offset.

```nasm
6a1:	8b 10                	mov    (%rax),%edx
```

This instruction does the same as in x86: It loads the value pointed to by RAX into EDX.

## Checking
We add 0x20092f to the next instruction, at 0x6a1. That gives us 0x200FD0, which lands us right at the start of the .got section.
```
[10] .plt.got          PROGBITS         0000000000000580  00000580
[19] .got              PROGBITS         0000000000200fd0  00000fd0
[20] .got.plt          PROGBITS         0000000000201000  00001000
```
0x200FD0 is also the address of the GOT entry for base, which we can verify:
```
Relocation section '.rela.dyn' at offset 0x470 contains 9 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000200e28  000000000008 R_X86_64_RELATIVE                    660
000000200e30  000000000008 R_X86_64_RELATIVE                    620
000000201018  000000000008 R_X86_64_RELATIVE                    201018
000000200fd0  000900000006 R_X86_64_GLOB_DAT 0000000000201020 base + 0
000000200fd8  000200000006 R_X86_64_GLOB_DAT 0000000000000000 _ITM_deregisterTMClone + 0
000000200fe0  000300000006 R_X86_64_GLOB_DAT 0000000000000000 __gmon_start__ + 0
000000200fe8  000400000006 R_X86_64_GLOB_DAT 0000000000000000 _Jv_RegisterClasses + 0
000000200ff0  000500000006 R_X86_64_GLOB_DAT 0000000000000000 _ITM_registerTMCloneTa + 0
000000200ff8  000600000006 R_X86_64_GLOB_DAT 0000000000000000 __cxa_finalize@GLIBC_2.2.5 + 0
```
As expected, base is at 0x200FD0.

## Summary
1. We add the offset to the address pointed to by RIP
2. We dereference the pointer.

# Difference between x86 and x86_64
The main difference is x86 requires the assistance of a trick to get the value of the EIP (see the "Getting the instruction pointer address" section in the x86 part), while in x64, you can simply offset from the RIP directly.

For example, this is what x86 needs:
```nasm
4f3:	e8 19 00 00 00       	call   511 <__x86.get_pc_thunk.ax>
4f8:	05 08 1b 00 00       	add    $0x1b08,%eax
4fd:	8b 80 e8 ff ff ff    	mov    -0x18(%eax),%eax
503:	8b 10                	mov    (%eax),%edx

00000511 <__x86.get_pc_thunk.ax>:
 511:	8b 04 24             	mov    (%esp),%eax
 514:	c3                   	ret    
```

While this is what x64 needs:
```nasm
69a:	48 8b 05 2f 09 20 00 	mov    0x20092f(%rip),%rax        # 200fd0 <_DYNAMIC+0x190>
6a1:	8b 10                	mov    (%rax),%edx
```

Thats it.
