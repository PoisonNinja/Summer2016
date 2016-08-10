# Introduction
Here, we will look at the differences between how x86 and x86_64 access global variables differently in programs compiled with PIC support (-fPIC).

# x86
We will first look at how x86 PIC handles global variables. For this, we will be using the 32-bit version of test, compiled with the -fPIC option. The assembly dump is in test32.S

Before we start, we need to know a couple things. First, x86 does not have the concept of instruction offset addresses. Therefore, x86 uses a trick to get the address of the current address pointer. In assembly, we can see the call:
```nasm
8048464:	e8 d7 fe ff ff       	call   8048340 <__x86.get_pc_thunk.bx>
```

The assembly for that is:
```nasm
08048340 <__x86.get_pc_thunk.bx>:
 8048340:	8b 1c 24             	mov    (%esp),%ebx
 8048343:	c3                   	ret    
 8048344:	66 90                	xchg   %ax,%ax
 8048346:	66 90                	xchg   %ax,%ax
 8048348:	66 90                	xchg   %ax,%ax
 804834a:	66 90                	xchg   %ax,%ax
 804834c:	66 90                	xchg   %ax,%ax
 804834e:	66 90                	xchg   %ax,%ax
```
We can ignore everything after the ret. What this section basically does is it gets the current EIP into ebx. Another way of doing this is:
```nasm
call get_eip
get_eip:
    pop ebx
```
However, the second method apparently has a high performance impact, because it screws with the processor instruction pipeline (MSDN).

Now that we know how x86 gets the instruction address, we can move into the actual disassembly. We start at 0x804841a, the start of our actual code.
```
804841a:	e8 38 00 00 00       	call   8048457 <__x86.get_pc_thunk.ax>
804841f:	05 e1 1b 00 00       	add    $0x1be1,%eax
8048424:	8b 88 20 00 00 00    	mov    0x20(%eax),%ecx
804842a:	8d 15 1c a0 04 08    	lea    0x804a01c,%edx
```
Unlike our example above, the code at 0x804841a gets the address into EAX instead of EBX. We then add 0x1be1 to EAX, which contains our instruction pointer address.

At this point, we must make another detour again. 32-bit uses something known as a Global Offset Table.
