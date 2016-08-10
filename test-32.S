
test-32.so:     file format elf32-i386


Disassembly of section .init:

0000037c <_init>:
 37c:	53                   	push   %ebx
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	e8 3b 00 00 00       	call   3c0 <__x86.get_pc_thunk.bx>
 385:	81 c3 7b 1c 00 00    	add    $0x1c7b,%ebx
 38b:	8b 83 f4 ff ff ff    	mov    -0xc(%ebx),%eax
 391:	85 c0                	test   %eax,%eax
 393:	74 05                	je     39a <_init+0x1e>
 395:	e8 1e 00 00 00       	call   3b8 <_init+0x3c>
 39a:	83 c4 08             	add    $0x8,%esp
 39d:	5b                   	pop    %ebx
 39e:	c3                   	ret    

Disassembly of section .plt:

000003a0 <.plt>:
 3a0:	ff b3 04 00 00 00    	pushl  0x4(%ebx)
 3a6:	ff a3 08 00 00 00    	jmp    *0x8(%ebx)
 3ac:	00 00                	add    %al,(%eax)
	...

Disassembly of section .plt.got:

000003b0 <.plt.got>:
 3b0:	ff a3 f0 ff ff ff    	jmp    *-0x10(%ebx)
 3b6:	66 90                	xchg   %ax,%ax
 3b8:	ff a3 f4 ff ff ff    	jmp    *-0xc(%ebx)
 3be:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

000003c0 <__x86.get_pc_thunk.bx>:
 3c0:	8b 1c 24             	mov    (%esp),%ebx
 3c3:	c3                   	ret    
 3c4:	66 90                	xchg   %ax,%ax
 3c6:	66 90                	xchg   %ax,%ax
 3c8:	66 90                	xchg   %ax,%ax
 3ca:	66 90                	xchg   %ax,%ax
 3cc:	66 90                	xchg   %ax,%ax
 3ce:	66 90                	xchg   %ax,%ax

000003d0 <deregister_tm_clones>:
 3d0:	e8 17 01 00 00       	call   4ec <__x86.get_pc_thunk.dx>
 3d5:	81 c2 2b 1c 00 00    	add    $0x1c2b,%edx
 3db:	8d 8a 14 00 00 00    	lea    0x14(%edx),%ecx
 3e1:	8d 82 17 00 00 00    	lea    0x17(%edx),%eax
 3e7:	29 c8                	sub    %ecx,%eax
 3e9:	83 f8 06             	cmp    $0x6,%eax
 3ec:	76 17                	jbe    405 <deregister_tm_clones+0x35>
 3ee:	8b 82 ec ff ff ff    	mov    -0x14(%edx),%eax
 3f4:	85 c0                	test   %eax,%eax
 3f6:	74 0d                	je     405 <deregister_tm_clones+0x35>
 3f8:	55                   	push   %ebp
 3f9:	89 e5                	mov    %esp,%ebp
 3fb:	83 ec 14             	sub    $0x14,%esp
 3fe:	51                   	push   %ecx
 3ff:	ff d0                	call   *%eax
 401:	83 c4 10             	add    $0x10,%esp
 404:	c9                   	leave  
 405:	f3 c3                	repz ret 
 407:	89 f6                	mov    %esi,%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <register_tm_clones>:
 410:	e8 d7 00 00 00       	call   4ec <__x86.get_pc_thunk.dx>
 415:	81 c2 eb 1b 00 00    	add    $0x1beb,%edx
 41b:	55                   	push   %ebp
 41c:	8d 8a 14 00 00 00    	lea    0x14(%edx),%ecx
 422:	8d 82 14 00 00 00    	lea    0x14(%edx),%eax
 428:	89 e5                	mov    %esp,%ebp
 42a:	53                   	push   %ebx
 42b:	29 c8                	sub    %ecx,%eax
 42d:	c1 f8 02             	sar    $0x2,%eax
 430:	83 ec 04             	sub    $0x4,%esp
 433:	89 c3                	mov    %eax,%ebx
 435:	c1 eb 1f             	shr    $0x1f,%ebx
 438:	01 d8                	add    %ebx,%eax
 43a:	d1 f8                	sar    %eax
 43c:	74 14                	je     452 <register_tm_clones+0x42>
 43e:	8b 92 fc ff ff ff    	mov    -0x4(%edx),%edx
 444:	85 d2                	test   %edx,%edx
 446:	74 0a                	je     452 <register_tm_clones+0x42>
 448:	83 ec 08             	sub    $0x8,%esp
 44b:	50                   	push   %eax
 44c:	51                   	push   %ecx
 44d:	ff d2                	call   *%edx
 44f:	83 c4 10             	add    $0x10,%esp
 452:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 455:	c9                   	leave  
 456:	c3                   	ret    
 457:	89 f6                	mov    %esi,%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000460 <__do_global_dtors_aux>:
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	53                   	push   %ebx
 464:	e8 57 ff ff ff       	call   3c0 <__x86.get_pc_thunk.bx>
 469:	81 c3 97 1b 00 00    	add    $0x1b97,%ebx
 46f:	83 ec 04             	sub    $0x4,%esp
 472:	80 bb 14 00 00 00 00 	cmpb   $0x0,0x14(%ebx)
 479:	75 27                	jne    4a2 <__do_global_dtors_aux+0x42>
 47b:	8b 83 f0 ff ff ff    	mov    -0x10(%ebx),%eax
 481:	85 c0                	test   %eax,%eax
 483:	74 11                	je     496 <__do_global_dtors_aux+0x36>
 485:	83 ec 0c             	sub    $0xc,%esp
 488:	ff b3 0c 00 00 00    	pushl  0xc(%ebx)
 48e:	e8 1d ff ff ff       	call   3b0 <_init+0x34>
 493:	83 c4 10             	add    $0x10,%esp
 496:	e8 35 ff ff ff       	call   3d0 <deregister_tm_clones>
 49b:	c6 83 14 00 00 00 01 	movb   $0x1,0x14(%ebx)
 4a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a5:	c9                   	leave  
 4a6:	c3                   	ret    
 4a7:	89 f6                	mov    %esi,%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004b0 <frame_dummy>:
 4b0:	e8 37 00 00 00       	call   4ec <__x86.get_pc_thunk.dx>
 4b5:	81 c2 4b 1b 00 00    	add    $0x1b4b,%edx
 4bb:	8d 82 1c ff ff ff    	lea    -0xe4(%edx),%eax
 4c1:	8b 08                	mov    (%eax),%ecx
 4c3:	85 c9                	test   %ecx,%ecx
 4c5:	75 09                	jne    4d0 <frame_dummy+0x20>
 4c7:	e9 44 ff ff ff       	jmp    410 <register_tm_clones>
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d0:	8b 92 f8 ff ff ff    	mov    -0x8(%edx),%edx
 4d6:	85 d2                	test   %edx,%edx
 4d8:	74 ed                	je     4c7 <frame_dummy+0x17>
 4da:	55                   	push   %ebp
 4db:	89 e5                	mov    %esp,%ebp
 4dd:	83 ec 14             	sub    $0x14,%esp
 4e0:	50                   	push   %eax
 4e1:	ff d2                	call   *%edx
 4e3:	83 c4 10             	add    $0x10,%esp
 4e6:	c9                   	leave  
 4e7:	e9 24 ff ff ff       	jmp    410 <register_tm_clones>

000004ec <__x86.get_pc_thunk.dx>:
 4ec:	8b 14 24             	mov    (%esp),%edx
 4ef:	c3                   	ret    

000004f0 <myfunc>:
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	e8 19 00 00 00       	call   511 <__x86.get_pc_thunk.ax>
 4f8:	05 08 1b 00 00       	add    $0x1b08,%eax
 4fd:	8b 80 e8 ff ff ff    	mov    -0x18(%eax),%eax
 503:	8b 10                	mov    (%eax),%edx
 505:	8b 45 08             	mov    0x8(%ebp),%eax
 508:	01 c2                	add    %eax,%edx
 50a:	8b 45 0c             	mov    0xc(%ebp),%eax
 50d:	01 d0                	add    %edx,%eax
 50f:	5d                   	pop    %ebp
 510:	c3                   	ret    

00000511 <__x86.get_pc_thunk.ax>:
 511:	8b 04 24             	mov    (%esp),%eax
 514:	c3                   	ret    

Disassembly of section .fini:

00000518 <_fini>:
 518:	53                   	push   %ebx
 519:	83 ec 08             	sub    $0x8,%esp
 51c:	e8 9f fe ff ff       	call   3c0 <__x86.get_pc_thunk.bx>
 521:	81 c3 df 1a 00 00    	add    $0x1adf,%ebx
 527:	83 c4 08             	add    $0x8,%esp
 52a:	5b                   	pop    %ebx
 52b:	c3                   	ret    
