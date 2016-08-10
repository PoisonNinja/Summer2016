
test-64.so:     file format elf64-x86-64


Disassembly of section .init:

0000000000000548 <_init>:
 548:	48 83 ec 08          	sub    $0x8,%rsp
 54c:	48 8b 05 8d 0a 20 00 	mov    0x200a8d(%rip),%rax        # 200fe0 <_DYNAMIC+0x1a0>
 553:	48 85 c0             	test   %rax,%rax
 556:	74 05                	je     55d <_init+0x15>
 558:	e8 23 00 00 00       	callq  580 <_init+0x38>
 55d:	48 83 c4 08          	add    $0x8,%rsp
 561:	c3                   	retq   

Disassembly of section .plt:

0000000000000570 <.plt>:
 570:	ff 35 92 0a 20 00    	pushq  0x200a92(%rip)        # 201008 <_GLOBAL_OFFSET_TABLE_+0x8>
 576:	ff 25 94 0a 20 00    	jmpq   *0x200a94(%rip)        # 201010 <_GLOBAL_OFFSET_TABLE_+0x10>
 57c:	0f 1f 40 00          	nopl   0x0(%rax)

Disassembly of section .plt.got:

0000000000000580 <.plt.got>:
 580:	ff 25 5a 0a 20 00    	jmpq   *0x200a5a(%rip)        # 200fe0 <_DYNAMIC+0x1a0>
 586:	66 90                	xchg   %ax,%ax
 588:	ff 25 6a 0a 20 00    	jmpq   *0x200a6a(%rip)        # 200ff8 <_DYNAMIC+0x1b8>
 58e:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000000590 <deregister_tm_clones>:
 590:	48 8d 3d 91 0a 20 00 	lea    0x200a91(%rip),%rdi        # 201028 <__TMC_END__>
 597:	48 8d 05 91 0a 20 00 	lea    0x200a91(%rip),%rax        # 20102f <__TMC_END__+0x7>
 59e:	55                   	push   %rbp
 59f:	48 29 f8             	sub    %rdi,%rax
 5a2:	48 89 e5             	mov    %rsp,%rbp
 5a5:	48 83 f8 0e          	cmp    $0xe,%rax
 5a9:	76 15                	jbe    5c0 <deregister_tm_clones+0x30>
 5ab:	48 8b 05 26 0a 20 00 	mov    0x200a26(%rip),%rax        # 200fd8 <_DYNAMIC+0x198>
 5b2:	48 85 c0             	test   %rax,%rax
 5b5:	74 09                	je     5c0 <deregister_tm_clones+0x30>
 5b7:	5d                   	pop    %rbp
 5b8:	ff e0                	jmpq   *%rax
 5ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 5c0:	5d                   	pop    %rbp
 5c1:	c3                   	retq   
 5c2:	0f 1f 40 00          	nopl   0x0(%rax)
 5c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 5cd:	00 00 00 

00000000000005d0 <register_tm_clones>:
 5d0:	48 8d 3d 51 0a 20 00 	lea    0x200a51(%rip),%rdi        # 201028 <__TMC_END__>
 5d7:	48 8d 35 4a 0a 20 00 	lea    0x200a4a(%rip),%rsi        # 201028 <__TMC_END__>
 5de:	55                   	push   %rbp
 5df:	48 29 fe             	sub    %rdi,%rsi
 5e2:	48 89 e5             	mov    %rsp,%rbp
 5e5:	48 c1 fe 03          	sar    $0x3,%rsi
 5e9:	48 89 f0             	mov    %rsi,%rax
 5ec:	48 c1 e8 3f          	shr    $0x3f,%rax
 5f0:	48 01 c6             	add    %rax,%rsi
 5f3:	48 d1 fe             	sar    %rsi
 5f6:	74 18                	je     610 <register_tm_clones+0x40>
 5f8:	48 8b 05 f1 09 20 00 	mov    0x2009f1(%rip),%rax        # 200ff0 <_DYNAMIC+0x1b0>
 5ff:	48 85 c0             	test   %rax,%rax
 602:	74 0c                	je     610 <register_tm_clones+0x40>
 604:	5d                   	pop    %rbp
 605:	ff e0                	jmpq   *%rax
 607:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 60e:	00 00 
 610:	5d                   	pop    %rbp
 611:	c3                   	retq   
 612:	0f 1f 40 00          	nopl   0x0(%rax)
 616:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 61d:	00 00 00 

0000000000000620 <__do_global_dtors_aux>:
 620:	80 3d fd 09 20 00 00 	cmpb   $0x0,0x2009fd(%rip)        # 201024 <_edata>
 627:	75 27                	jne    650 <__do_global_dtors_aux+0x30>
 629:	48 83 3d c7 09 20 00 	cmpq   $0x0,0x2009c7(%rip)        # 200ff8 <_DYNAMIC+0x1b8>
 630:	00 
 631:	55                   	push   %rbp
 632:	48 89 e5             	mov    %rsp,%rbp
 635:	74 0c                	je     643 <__do_global_dtors_aux+0x23>
 637:	48 8b 3d da 09 20 00 	mov    0x2009da(%rip),%rdi        # 201018 <__dso_handle>
 63e:	e8 45 ff ff ff       	callq  588 <_init+0x40>
 643:	e8 48 ff ff ff       	callq  590 <deregister_tm_clones>
 648:	5d                   	pop    %rbp
 649:	c6 05 d4 09 20 00 01 	movb   $0x1,0x2009d4(%rip)        # 201024 <_edata>
 650:	f3 c3                	repz retq 
 652:	0f 1f 40 00          	nopl   0x0(%rax)
 656:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 65d:	00 00 00 

0000000000000660 <frame_dummy>:
 660:	48 8d 3d d1 07 20 00 	lea    0x2007d1(%rip),%rdi        # 200e38 <__JCR_END__>
 667:	48 83 3f 00          	cmpq   $0x0,(%rdi)
 66b:	75 0b                	jne    678 <frame_dummy+0x18>
 66d:	e9 5e ff ff ff       	jmpq   5d0 <register_tm_clones>
 672:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 678:	48 8b 05 69 09 20 00 	mov    0x200969(%rip),%rax        # 200fe8 <_DYNAMIC+0x1a8>
 67f:	48 85 c0             	test   %rax,%rax
 682:	74 e9                	je     66d <frame_dummy+0xd>
 684:	55                   	push   %rbp
 685:	48 89 e5             	mov    %rsp,%rbp
 688:	ff d0                	callq  *%rax
 68a:	5d                   	pop    %rbp
 68b:	e9 40 ff ff ff       	jmpq   5d0 <register_tm_clones>

0000000000000690 <myfunc>:
 690:	55                   	push   %rbp
 691:	48 89 e5             	mov    %rsp,%rbp
 694:	89 7d fc             	mov    %edi,-0x4(%rbp)
 697:	89 75 f8             	mov    %esi,-0x8(%rbp)
 69a:	48 8b 05 2f 09 20 00 	mov    0x20092f(%rip),%rax        # 200fd0 <_DYNAMIC+0x190>
 6a1:	8b 10                	mov    (%rax),%edx
 6a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
 6a6:	01 c2                	add    %eax,%edx
 6a8:	8b 45 f8             	mov    -0x8(%rbp),%eax
 6ab:	01 d0                	add    %edx,%eax
 6ad:	5d                   	pop    %rbp
 6ae:	c3                   	retq   

Disassembly of section .fini:

00000000000006b0 <_fini>:
 6b0:	48 83 ec 08          	sub    $0x8,%rsp
 6b4:	48 83 c4 08          	add    $0x8,%rsp
 6b8:	c3                   	retq   
