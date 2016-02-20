
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <main>:
 8000188:	b508      	push	{r3, lr}
 800018a:	f001 fa13 	bl	80015b4 <lib_low_level_init>
 800018e:	f000 f921 	bl	80003d4 <lib_os_init>
 8000192:	4905      	ldr	r1, [pc, #20]	; (80001a8 <main+0x20>)
 8000194:	4805      	ldr	r0, [pc, #20]	; (80001ac <main+0x24>)
 8000196:	f44f 7200 	mov.w	r2, #512	; 0x200
 800019a:	2306      	movs	r3, #6
 800019c:	f000 f88a 	bl	80002b4 <create_thread>
 80001a0:	f000 f882 	bl	80002a8 <kernel_start>
 80001a4:	2000      	movs	r0, #0
 80001a6:	bd08      	pop	{r3, pc}
 80001a8:	20000680 	.word	0x20000680
 80001ac:	08000ff5 	.word	0x08000ff5

080001b0 <thread_ending>:
 80001b0:	b672      	cpsid	i
 80001b2:	4b05      	ldr	r3, [pc, #20]	; (80001c8 <thread_ending+0x18>)
 80001b4:	4a05      	ldr	r2, [pc, #20]	; (80001cc <thread_ending+0x1c>)
 80001b6:	681b      	ldr	r3, [r3, #0]
 80001b8:	210c      	movs	r1, #12
 80001ba:	fb01 2303 	mla	r3, r1, r3, r2
 80001be:	2200      	movs	r2, #0
 80001c0:	605a      	str	r2, [r3, #4]
 80001c2:	b662      	cpsie	i
 80001c4:	bf00      	nop
 80001c6:	e7fd      	b.n	80001c4 <thread_ending+0x14>
 80001c8:	200008c8 	.word	0x200008c8
 80001cc:	20000880 	.word	0x20000880

080001d0 <null_thread>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f001 fb9d 	bl	8001910 <sleep>
 80001d6:	e7fc      	b.n	80001d2 <null_thread+0x2>

080001d8 <scheduler>:
 80001d8:	b570      	push	{r4, r5, r6, lr}
 80001da:	2200      	movs	r2, #0
 80001dc:	4611      	mov	r1, r2
 80001de:	4b15      	ldr	r3, [pc, #84]	; (8000234 <scheduler+0x5c>)
 80001e0:	200c      	movs	r0, #12
 80001e2:	fb00 f501 	mul.w	r5, r0, r1
 80001e6:	195e      	adds	r6, r3, r5
 80001e8:	6874      	ldr	r4, [r6, #4]
 80001ea:	f014 0f02 	tst.w	r4, #2
 80001ee:	461c      	mov	r4, r3
 80001f0:	d10a      	bne.n	8000208 <scheduler+0x30>
 80001f2:	6876      	ldr	r6, [r6, #4]
 80001f4:	07f6      	lsls	r6, r6, #31
 80001f6:	d507      	bpl.n	8000208 <scheduler+0x30>
 80001f8:	4350      	muls	r0, r2
 80001fa:	5b5d      	ldrh	r5, [r3, r5]
 80001fc:	5a18      	ldrh	r0, [r3, r0]
 80001fe:	b2ad      	uxth	r5, r5
 8000200:	b280      	uxth	r0, r0
 8000202:	4285      	cmp	r5, r0
 8000204:	bf38      	it	cc
 8000206:	460a      	movcc	r2, r1
 8000208:	200c      	movs	r0, #12
 800020a:	4348      	muls	r0, r1
 800020c:	5a1d      	ldrh	r5, [r3, r0]
 800020e:	b2ad      	uxth	r5, r5
 8000210:	b125      	cbz	r5, 800021c <scheduler+0x44>
 8000212:	5a1d      	ldrh	r5, [r3, r0]
 8000214:	b2ad      	uxth	r5, r5
 8000216:	3d01      	subs	r5, #1
 8000218:	b2ad      	uxth	r5, r5
 800021a:	521d      	strh	r5, [r3, r0]
 800021c:	3101      	adds	r1, #1
 800021e:	2906      	cmp	r1, #6
 8000220:	d1dd      	bne.n	80001de <scheduler+0x6>
 8000222:	230c      	movs	r3, #12
 8000224:	4353      	muls	r3, r2
 8000226:	18e1      	adds	r1, r4, r3
 8000228:	8849      	ldrh	r1, [r1, #2]
 800022a:	b289      	uxth	r1, r1
 800022c:	52e1      	strh	r1, [r4, r3]
 800022e:	4b02      	ldr	r3, [pc, #8]	; (8000238 <scheduler+0x60>)
 8000230:	601a      	str	r2, [r3, #0]
 8000232:	bd70      	pop	{r4, r5, r6, pc}
 8000234:	20000880 	.word	0x20000880
 8000238:	200008c8 	.word	0x200008c8

0800023c <SysTick_Handler>:
 800023c:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000240:	f3ef 8208 	mrs	r2, MSP
 8000244:	4c0d      	ldr	r4, [pc, #52]	; (800027c <SysTick_Handler+0x40>)
 8000246:	4d0e      	ldr	r5, [pc, #56]	; (8000280 <SysTick_Handler+0x44>)
 8000248:	6823      	ldr	r3, [r4, #0]
 800024a:	3301      	adds	r3, #1
 800024c:	d005      	beq.n	800025a <SysTick_Handler+0x1e>
 800024e:	6823      	ldr	r3, [r4, #0]
 8000250:	210c      	movs	r1, #12
 8000252:	fb01 5303 	mla	r3, r1, r3, r5
 8000256:	609a      	str	r2, [r3, #8]
 8000258:	e001      	b.n	800025e <SysTick_Handler+0x22>
 800025a:	2300      	movs	r3, #0
 800025c:	6023      	str	r3, [r4, #0]
 800025e:	f7ff ffbb 	bl	80001d8 <scheduler>
 8000262:	6823      	ldr	r3, [r4, #0]
 8000264:	220c      	movs	r2, #12
 8000266:	fb02 5503 	mla	r5, r2, r3, r5
 800026a:	f06f 0306 	mvn.w	r3, #6
 800026e:	68aa      	ldr	r2, [r5, #8]
 8000270:	469e      	mov	lr, r3
 8000272:	f382 8808 	msr	MSP, r2
 8000276:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 800027a:	4770      	bx	lr
 800027c:	200008c8 	.word	0x200008c8
 8000280:	20000880 	.word	0x20000880

08000284 <sched_off>:
 8000284:	b672      	cpsid	i
 8000286:	4770      	bx	lr

08000288 <sched_on>:
 8000288:	b662      	cpsie	i
 800028a:	4770      	bx	lr

0800028c <yield>:
 800028c:	bf00      	nop
 800028e:	4770      	bx	lr

08000290 <get_thread_id>:
 8000290:	b082      	sub	sp, #8
 8000292:	b672      	cpsid	i
 8000294:	4b03      	ldr	r3, [pc, #12]	; (80002a4 <get_thread_id+0x14>)
 8000296:	681b      	ldr	r3, [r3, #0]
 8000298:	9301      	str	r3, [sp, #4]
 800029a:	b662      	cpsie	i
 800029c:	9801      	ldr	r0, [sp, #4]
 800029e:	b002      	add	sp, #8
 80002a0:	4770      	bx	lr
 80002a2:	bf00      	nop
 80002a4:	200008c8 	.word	0x200008c8

080002a8 <kernel_start>:
 80002a8:	b508      	push	{r3, lr}
 80002aa:	f001 fb1f 	bl	80018ec <sys_tick_init>
 80002ae:	bf00      	nop
 80002b0:	e7fd      	b.n	80002ae <kernel_start+0x6>
	...

080002b4 <create_thread>:
 80002b4:	f022 0203 	bic.w	r2, r2, #3
 80002b8:	3a40      	subs	r2, #64	; 0x40
 80002ba:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 80002be:	eb01 0c02 	add.w	ip, r1, r2
 80002c2:	f102 0834 	add.w	r8, r2, #52	; 0x34
 80002c6:	f102 0938 	add.w	r9, r2, #56	; 0x38
 80002ca:	323c      	adds	r2, #60	; 0x3c
 80002cc:	4488      	add	r8, r1
 80002ce:	4489      	add	r9, r1
 80002d0:	4607      	mov	r7, r0
 80002d2:	4411      	add	r1, r2
 80002d4:	2200      	movs	r2, #0
 80002d6:	b672      	cpsid	i
 80002d8:	4e11      	ldr	r6, [pc, #68]	; (8000320 <create_thread+0x6c>)
 80002da:	250c      	movs	r5, #12
 80002dc:	4355      	muls	r5, r2
 80002de:	1974      	adds	r4, r6, r5
 80002e0:	6860      	ldr	r0, [r4, #4]
 80002e2:	07c0      	lsls	r0, r0, #31
 80002e4:	d412      	bmi.n	800030c <create_thread+0x58>
 80002e6:	480f      	ldr	r0, [pc, #60]	; (8000324 <create_thread+0x70>)
 80002e8:	f8c4 c008 	str.w	ip, [r4, #8]
 80002ec:	f8c8 0000 	str.w	r0, [r8]
 80002f0:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 80002f4:	f8c9 7000 	str.w	r7, [r9]
 80002f8:	2b05      	cmp	r3, #5
 80002fa:	bf98      	it	ls
 80002fc:	2306      	movls	r3, #6
 80002fe:	6008      	str	r0, [r1, #0]
 8000300:	2001      	movs	r0, #1
 8000302:	8063      	strh	r3, [r4, #2]
 8000304:	5373      	strh	r3, [r6, r5]
 8000306:	6060      	str	r0, [r4, #4]
 8000308:	4610      	mov	r0, r2
 800030a:	e000      	b.n	800030e <create_thread+0x5a>
 800030c:	2006      	movs	r0, #6
 800030e:	b662      	cpsie	i
 8000310:	3201      	adds	r2, #1
 8000312:	2a06      	cmp	r2, #6
 8000314:	d001      	beq.n	800031a <create_thread+0x66>
 8000316:	2806      	cmp	r0, #6
 8000318:	d0dd      	beq.n	80002d6 <create_thread+0x22>
 800031a:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800031e:	bf00      	nop
 8000320:	20000880 	.word	0x20000880
 8000324:	080001b1 	.word	0x080001b1

08000328 <kernel_init>:
 8000328:	b510      	push	{r4, lr}
 800032a:	2300      	movs	r3, #0
 800032c:	490b      	ldr	r1, [pc, #44]	; (800035c <kernel_init+0x34>)
 800032e:	220c      	movs	r2, #12
 8000330:	435a      	muls	r2, r3
 8000332:	188c      	adds	r4, r1, r2
 8000334:	2000      	movs	r0, #0
 8000336:	6060      	str	r0, [r4, #4]
 8000338:	3301      	adds	r3, #1
 800033a:	2006      	movs	r0, #6
 800033c:	4283      	cmp	r3, r0
 800033e:	8060      	strh	r0, [r4, #2]
 8000340:	5288      	strh	r0, [r1, r2]
 8000342:	d1f3      	bne.n	800032c <kernel_init+0x4>
 8000344:	4b06      	ldr	r3, [pc, #24]	; (8000360 <kernel_init+0x38>)
 8000346:	4807      	ldr	r0, [pc, #28]	; (8000364 <kernel_init+0x3c>)
 8000348:	4907      	ldr	r1, [pc, #28]	; (8000368 <kernel_init+0x40>)
 800034a:	f04f 32ff 	mov.w	r2, #4294967295
 800034e:	601a      	str	r2, [r3, #0]
 8000350:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000354:	2280      	movs	r2, #128	; 0x80
 8000356:	23ff      	movs	r3, #255	; 0xff
 8000358:	f7ff bfac 	b.w	80002b4 <create_thread>
 800035c:	20000880 	.word	0x20000880
 8000360:	200008c8 	.word	0x200008c8
 8000364:	080001d1 	.word	0x080001d1
 8000368:	200008cc 	.word	0x200008cc

0800036c <set_wait_state>:
 800036c:	b507      	push	{r0, r1, r2, lr}
 800036e:	f7ff ff8f 	bl	8000290 <get_thread_id>
 8000372:	9000      	str	r0, [sp, #0]
 8000374:	b672      	cpsid	i
 8000376:	4b0d      	ldr	r3, [pc, #52]	; (80003ac <set_wait_state+0x40>)
 8000378:	9a00      	ldr	r2, [sp, #0]
 800037a:	210c      	movs	r1, #12
 800037c:	fb01 3202 	mla	r2, r1, r2, r3
 8000380:	6851      	ldr	r1, [r2, #4]
 8000382:	f041 0102 	orr.w	r1, r1, #2
 8000386:	6051      	str	r1, [r2, #4]
 8000388:	b672      	cpsid	i
 800038a:	9a00      	ldr	r2, [sp, #0]
 800038c:	210c      	movs	r1, #12
 800038e:	fb01 3202 	mla	r2, r1, r2, r3
 8000392:	6852      	ldr	r2, [r2, #4]
 8000394:	9201      	str	r2, [sp, #4]
 8000396:	b662      	cpsie	i
 8000398:	9a01      	ldr	r2, [sp, #4]
 800039a:	0791      	lsls	r1, r2, #30
 800039c:	d500      	bpl.n	80003a0 <set_wait_state+0x34>
 800039e:	bf00      	nop
 80003a0:	9a01      	ldr	r2, [sp, #4]
 80003a2:	0792      	lsls	r2, r2, #30
 80003a4:	d4f0      	bmi.n	8000388 <set_wait_state+0x1c>
 80003a6:	b003      	add	sp, #12
 80003a8:	f85d fb04 	ldr.w	pc, [sp], #4
 80003ac:	20000880 	.word	0x20000880

080003b0 <wake_up_threads>:
 80003b0:	2300      	movs	r3, #0
 80003b2:	b672      	cpsid	i
 80003b4:	4a06      	ldr	r2, [pc, #24]	; (80003d0 <wake_up_threads+0x20>)
 80003b6:	210c      	movs	r1, #12
 80003b8:	fb01 2203 	mla	r2, r1, r3, r2
 80003bc:	6851      	ldr	r1, [r2, #4]
 80003be:	f021 0102 	bic.w	r1, r1, #2
 80003c2:	6051      	str	r1, [r2, #4]
 80003c4:	b662      	cpsie	i
 80003c6:	3301      	adds	r3, #1
 80003c8:	2b06      	cmp	r3, #6
 80003ca:	d1f2      	bne.n	80003b2 <wake_up_threads+0x2>
 80003cc:	4770      	bx	lr
 80003ce:	bf00      	nop
 80003d0:	20000880 	.word	0x20000880

080003d4 <lib_os_init>:
 80003d4:	b508      	push	{r3, lr}
 80003d6:	f7ff ffa7 	bl	8000328 <kernel_init>
 80003da:	f000 f8ff 	bl	80005dc <messages_init>
 80003de:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80003e2:	f000 b8d3 	b.w	800058c <stdio_init>

080003e6 <strlen_>:
 80003e6:	2300      	movs	r3, #0
 80003e8:	5cc2      	ldrb	r2, [r0, r3]
 80003ea:	b10a      	cbz	r2, 80003f0 <strlen_+0xa>
 80003ec:	3301      	adds	r3, #1
 80003ee:	e7fb      	b.n	80003e8 <strlen_+0x2>
 80003f0:	4618      	mov	r0, r3
 80003f2:	4770      	bx	lr

080003f4 <putc_>:
 80003f4:	b538      	push	{r3, r4, r5, lr}
 80003f6:	4c06      	ldr	r4, [pc, #24]	; (8000410 <putc_+0x1c>)
 80003f8:	4605      	mov	r5, r0
 80003fa:	4620      	mov	r0, r4
 80003fc:	f000 f912 	bl	8000624 <mutex_lock>
 8000400:	4628      	mov	r0, r5
 8000402:	f000 ff61 	bl	80012c8 <uart_write>
 8000406:	4620      	mov	r0, r4
 8000408:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800040c:	f000 b926 	b.w	800065c <mutex_unlock>
 8000410:	2000094c 	.word	0x2000094c

08000414 <puts_>:
 8000414:	b510      	push	{r4, lr}
 8000416:	4604      	mov	r4, r0
 8000418:	4807      	ldr	r0, [pc, #28]	; (8000438 <puts_+0x24>)
 800041a:	f000 f903 	bl	8000624 <mutex_lock>
 800041e:	3c01      	subs	r4, #1
 8000420:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000424:	b110      	cbz	r0, 800042c <puts_+0x18>
 8000426:	f7ff ffe5 	bl	80003f4 <putc_>
 800042a:	e7f9      	b.n	8000420 <puts_+0xc>
 800042c:	4802      	ldr	r0, [pc, #8]	; (8000438 <puts_+0x24>)
 800042e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000432:	f000 b913 	b.w	800065c <mutex_unlock>
 8000436:	bf00      	nop
 8000438:	20000958 	.word	0x20000958

0800043c <puti_>:
 800043c:	b530      	push	{r4, r5, lr}
 800043e:	b085      	sub	sp, #20
 8000440:	1e03      	subs	r3, r0, #0
 8000442:	f04f 0200 	mov.w	r2, #0
 8000446:	bfa8      	it	ge
 8000448:	4614      	movge	r4, r2
 800044a:	f88d 200f 	strb.w	r2, [sp, #15]
 800044e:	bfbc      	itt	lt
 8000450:	425b      	neglt	r3, r3
 8000452:	2401      	movlt	r4, #1
 8000454:	220a      	movs	r2, #10
 8000456:	210a      	movs	r1, #10
 8000458:	fb93 f5f1 	sdiv	r5, r3, r1
 800045c:	fb01 3315 	mls	r3, r1, r5, r3
 8000460:	a801      	add	r0, sp, #4
 8000462:	3330      	adds	r3, #48	; 0x30
 8000464:	5413      	strb	r3, [r2, r0]
 8000466:	1e51      	subs	r1, r2, #1
 8000468:	462b      	mov	r3, r5
 800046a:	b10d      	cbz	r5, 8000470 <puti_+0x34>
 800046c:	460a      	mov	r2, r1
 800046e:	e7f2      	b.n	8000456 <puti_+0x1a>
 8000470:	b12c      	cbz	r4, 800047e <puti_+0x42>
 8000472:	ab04      	add	r3, sp, #16
 8000474:	440b      	add	r3, r1
 8000476:	222d      	movs	r2, #45	; 0x2d
 8000478:	f803 2c0c 	strb.w	r2, [r3, #-12]
 800047c:	460a      	mov	r2, r1
 800047e:	4410      	add	r0, r2
 8000480:	f7ff ffc8 	bl	8000414 <puts_>
 8000484:	b005      	add	sp, #20
 8000486:	bd30      	pop	{r4, r5, pc}

08000488 <putui_>:
 8000488:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800048a:	2300      	movs	r3, #0
 800048c:	f88d 300f 	strb.w	r3, [sp, #15]
 8000490:	230a      	movs	r3, #10
 8000492:	240a      	movs	r4, #10
 8000494:	fbb0 f1f4 	udiv	r1, r0, r4
 8000498:	fb04 0011 	mls	r0, r4, r1, r0
 800049c:	aa01      	add	r2, sp, #4
 800049e:	3030      	adds	r0, #48	; 0x30
 80004a0:	5498      	strb	r0, [r3, r2]
 80004a2:	1e5c      	subs	r4, r3, #1
 80004a4:	4608      	mov	r0, r1
 80004a6:	b109      	cbz	r1, 80004ac <putui_+0x24>
 80004a8:	4623      	mov	r3, r4
 80004aa:	e7f2      	b.n	8000492 <putui_+0xa>
 80004ac:	18d0      	adds	r0, r2, r3
 80004ae:	f7ff ffb1 	bl	8000414 <puts_>
 80004b2:	b004      	add	sp, #16
 80004b4:	bd10      	pop	{r4, pc}

080004b6 <putx_>:
 80004b6:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80004b8:	2300      	movs	r3, #0
 80004ba:	f88d 300f 	strb.w	r3, [sp, #15]
 80004be:	230a      	movs	r3, #10
 80004c0:	f000 010f 	and.w	r1, r0, #15
 80004c4:	2909      	cmp	r1, #9
 80004c6:	aa01      	add	r2, sp, #4
 80004c8:	bf94      	ite	ls
 80004ca:	3130      	addls	r1, #48	; 0x30
 80004cc:	3157      	addhi	r1, #87	; 0x57
 80004ce:	0900      	lsrs	r0, r0, #4
 80004d0:	54d1      	strb	r1, [r2, r3]
 80004d2:	f103 31ff 	add.w	r1, r3, #4294967295
 80004d6:	d001      	beq.n	80004dc <putx_+0x26>
 80004d8:	460b      	mov	r3, r1
 80004da:	e7f1      	b.n	80004c0 <putx_+0xa>
 80004dc:	18d0      	adds	r0, r2, r3
 80004de:	f7ff ff99 	bl	8000414 <puts_>
 80004e2:	b005      	add	sp, #20
 80004e4:	f85d fb04 	ldr.w	pc, [sp], #4

080004e8 <printf_>:
 80004e8:	b40f      	push	{r0, r1, r2, r3}
 80004ea:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80004ec:	ac06      	add	r4, sp, #24
 80004ee:	4826      	ldr	r0, [pc, #152]	; (8000588 <printf_+0xa0>)
 80004f0:	f854 5b04 	ldr.w	r5, [r4], #4
 80004f4:	f000 f896 	bl	8000624 <mutex_lock>
 80004f8:	9401      	str	r4, [sp, #4]
 80004fa:	2400      	movs	r4, #0
 80004fc:	5d28      	ldrb	r0, [r5, r4]
 80004fe:	2800      	cmp	r0, #0
 8000500:	d039      	beq.n	8000576 <printf_+0x8e>
 8000502:	2825      	cmp	r0, #37	; 0x25
 8000504:	d003      	beq.n	800050e <printf_+0x26>
 8000506:	f7ff ff75 	bl	80003f4 <putc_>
 800050a:	3401      	adds	r4, #1
 800050c:	e7f6      	b.n	80004fc <printf_+0x14>
 800050e:	192b      	adds	r3, r5, r4
 8000510:	7858      	ldrb	r0, [r3, #1]
 8000512:	2869      	cmp	r0, #105	; 0x69
 8000514:	d016      	beq.n	8000544 <printf_+0x5c>
 8000516:	d808      	bhi.n	800052a <printf_+0x42>
 8000518:	2825      	cmp	r0, #37	; 0x25
 800051a:	d028      	beq.n	800056e <printf_+0x86>
 800051c:	2863      	cmp	r0, #99	; 0x63
 800051e:	d128      	bne.n	8000572 <printf_+0x8a>
 8000520:	9b01      	ldr	r3, [sp, #4]
 8000522:	1d1a      	adds	r2, r3, #4
 8000524:	9201      	str	r2, [sp, #4]
 8000526:	7818      	ldrb	r0, [r3, #0]
 8000528:	e021      	b.n	800056e <printf_+0x86>
 800052a:	2875      	cmp	r0, #117	; 0x75
 800052c:	d011      	beq.n	8000552 <printf_+0x6a>
 800052e:	2878      	cmp	r0, #120	; 0x78
 8000530:	d016      	beq.n	8000560 <printf_+0x78>
 8000532:	2873      	cmp	r0, #115	; 0x73
 8000534:	d11d      	bne.n	8000572 <printf_+0x8a>
 8000536:	9b01      	ldr	r3, [sp, #4]
 8000538:	1d1a      	adds	r2, r3, #4
 800053a:	6818      	ldr	r0, [r3, #0]
 800053c:	9201      	str	r2, [sp, #4]
 800053e:	f7ff ff69 	bl	8000414 <puts_>
 8000542:	e016      	b.n	8000572 <printf_+0x8a>
 8000544:	9b01      	ldr	r3, [sp, #4]
 8000546:	1d1a      	adds	r2, r3, #4
 8000548:	6818      	ldr	r0, [r3, #0]
 800054a:	9201      	str	r2, [sp, #4]
 800054c:	f7ff ff76 	bl	800043c <puti_>
 8000550:	e00f      	b.n	8000572 <printf_+0x8a>
 8000552:	9b01      	ldr	r3, [sp, #4]
 8000554:	1d1a      	adds	r2, r3, #4
 8000556:	6818      	ldr	r0, [r3, #0]
 8000558:	9201      	str	r2, [sp, #4]
 800055a:	f7ff ff95 	bl	8000488 <putui_>
 800055e:	e008      	b.n	8000572 <printf_+0x8a>
 8000560:	9b01      	ldr	r3, [sp, #4]
 8000562:	1d1a      	adds	r2, r3, #4
 8000564:	6818      	ldr	r0, [r3, #0]
 8000566:	9201      	str	r2, [sp, #4]
 8000568:	f7ff ffa5 	bl	80004b6 <putx_>
 800056c:	e001      	b.n	8000572 <printf_+0x8a>
 800056e:	f7ff ff41 	bl	80003f4 <putc_>
 8000572:	3402      	adds	r4, #2
 8000574:	e7c2      	b.n	80004fc <printf_+0x14>
 8000576:	4804      	ldr	r0, [pc, #16]	; (8000588 <printf_+0xa0>)
 8000578:	f000 f870 	bl	800065c <mutex_unlock>
 800057c:	b003      	add	sp, #12
 800057e:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000582:	b004      	add	sp, #16
 8000584:	4770      	bx	lr
 8000586:	bf00      	nop
 8000588:	20000954 	.word	0x20000954

0800058c <stdio_init>:
 800058c:	b510      	push	{r4, lr}
 800058e:	480e      	ldr	r0, [pc, #56]	; (80005c8 <stdio_init+0x3c>)
 8000590:	f000 f83e 	bl	8000610 <mutex_init>
 8000594:	480d      	ldr	r0, [pc, #52]	; (80005cc <stdio_init+0x40>)
 8000596:	f000 f83b 	bl	8000610 <mutex_init>
 800059a:	480d      	ldr	r0, [pc, #52]	; (80005d0 <stdio_init+0x44>)
 800059c:	f000 f838 	bl	8000610 <mutex_init>
 80005a0:	480c      	ldr	r0, [pc, #48]	; (80005d4 <stdio_init+0x48>)
 80005a2:	f000 f835 	bl	8000610 <mutex_init>
 80005a6:	2408      	movs	r4, #8
 80005a8:	2020      	movs	r0, #32
 80005aa:	f7ff ff23 	bl	80003f4 <putc_>
 80005ae:	3c01      	subs	r4, #1
 80005b0:	d1fa      	bne.n	80005a8 <stdio_init+0x1c>
 80005b2:	2420      	movs	r4, #32
 80005b4:	200a      	movs	r0, #10
 80005b6:	f7ff ff1d 	bl	80003f4 <putc_>
 80005ba:	3c01      	subs	r4, #1
 80005bc:	d1fa      	bne.n	80005b4 <stdio_init+0x28>
 80005be:	4806      	ldr	r0, [pc, #24]	; (80005d8 <stdio_init+0x4c>)
 80005c0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005c4:	f7ff bf90 	b.w	80004e8 <printf_>
 80005c8:	2000094c 	.word	0x2000094c
 80005cc:	20000950 	.word	0x20000950
 80005d0:	20000958 	.word	0x20000958
 80005d4:	20000954 	.word	0x20000954
 80005d8:	080021e8 	.word	0x080021e8

080005dc <messages_init>:
 80005dc:	4a0a      	ldr	r2, [pc, #40]	; (8000608 <messages_init+0x2c>)
 80005de:	2300      	movs	r3, #0
 80005e0:	b510      	push	{r4, lr}
 80005e2:	6013      	str	r3, [r2, #0]
 80005e4:	6053      	str	r3, [r2, #4]
 80005e6:	6093      	str	r3, [r2, #8]
 80005e8:	60d3      	str	r3, [r2, #12]
 80005ea:	6113      	str	r3, [r2, #16]
 80005ec:	6153      	str	r3, [r2, #20]
 80005ee:	4c07      	ldr	r4, [pc, #28]	; (800060c <messages_init+0x30>)
 80005f0:	0118      	lsls	r0, r3, #4
 80005f2:	1821      	adds	r1, r4, r0
 80005f4:	3301      	adds	r3, #1
 80005f6:	2200      	movs	r2, #0
 80005f8:	2b04      	cmp	r3, #4
 80005fa:	604a      	str	r2, [r1, #4]
 80005fc:	5022      	str	r2, [r4, r0]
 80005fe:	60ca      	str	r2, [r1, #12]
 8000600:	608a      	str	r2, [r1, #8]
 8000602:	d1f4      	bne.n	80005ee <messages_init+0x12>
 8000604:	bd10      	pop	{r4, pc}
 8000606:	bf00      	nop
 8000608:	2000095c 	.word	0x2000095c
 800060c:	20000974 	.word	0x20000974

08000610 <mutex_init>:
 8000610:	b510      	push	{r4, lr}
 8000612:	4604      	mov	r4, r0
 8000614:	f7ff fe36 	bl	8000284 <sched_off>
 8000618:	2300      	movs	r3, #0
 800061a:	6023      	str	r3, [r4, #0]
 800061c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000620:	f7ff be32 	b.w	8000288 <sched_on>

08000624 <mutex_lock>:
 8000624:	b513      	push	{r0, r1, r4, lr}
 8000626:	4604      	mov	r4, r0
 8000628:	f7ff fe2c 	bl	8000284 <sched_off>
 800062c:	6823      	ldr	r3, [r4, #0]
 800062e:	9301      	str	r3, [sp, #4]
 8000630:	f7ff fe2a 	bl	8000288 <sched_on>
 8000634:	9b01      	ldr	r3, [sp, #4]
 8000636:	b10b      	cbz	r3, 800063c <mutex_lock+0x18>
 8000638:	f7ff fe98 	bl	800036c <set_wait_state>
 800063c:	9b01      	ldr	r3, [sp, #4]
 800063e:	2b00      	cmp	r3, #0
 8000640:	d1f2      	bne.n	8000628 <mutex_lock+0x4>
 8000642:	f7ff fe1f 	bl	8000284 <sched_off>
 8000646:	6823      	ldr	r3, [r4, #0]
 8000648:	9301      	str	r3, [sp, #4]
 800064a:	9b01      	ldr	r3, [sp, #4]
 800064c:	2b00      	cmp	r3, #0
 800064e:	d1eb      	bne.n	8000628 <mutex_lock+0x4>
 8000650:	2301      	movs	r3, #1
 8000652:	6023      	str	r3, [r4, #0]
 8000654:	f7ff fe18 	bl	8000288 <sched_on>
 8000658:	b002      	add	sp, #8
 800065a:	bd10      	pop	{r4, pc}

0800065c <mutex_unlock>:
 800065c:	b508      	push	{r3, lr}
 800065e:	f7ff ffd7 	bl	8000610 <mutex_init>
 8000662:	f7ff fea5 	bl	80003b0 <wake_up_threads>
 8000666:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800066a:	f7ff be0f 	b.w	800028c <yield>

0800066e <lsm9ds0_uninit>:
 800066e:	b508      	push	{r3, lr}
 8000670:	20d4      	movs	r0, #212	; 0xd4
 8000672:	2120      	movs	r1, #32
 8000674:	2200      	movs	r2, #0
 8000676:	f001 f8cd 	bl	8001814 <i2c_write_reg>
 800067a:	203c      	movs	r0, #60	; 0x3c
 800067c:	2120      	movs	r1, #32
 800067e:	2200      	movs	r2, #0
 8000680:	f001 f8c8 	bl	8001814 <i2c_write_reg>
 8000684:	203c      	movs	r0, #60	; 0x3c
 8000686:	2124      	movs	r1, #36	; 0x24
 8000688:	2200      	movs	r2, #0
 800068a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800068e:	f001 b8c1 	b.w	8001814 <i2c_write_reg>
	...

08000694 <lsm9ds0_read>:
 8000694:	b538      	push	{r3, r4, r5, lr}
 8000696:	2128      	movs	r1, #40	; 0x28
 8000698:	20d4      	movs	r0, #212	; 0xd4
 800069a:	f001 f8ce 	bl	800183a <i2c_read_reg>
 800069e:	2129      	movs	r1, #41	; 0x29
 80006a0:	4605      	mov	r5, r0
 80006a2:	20d4      	movs	r0, #212	; 0xd4
 80006a4:	f001 f8c9 	bl	800183a <i2c_read_reg>
 80006a8:	4c38      	ldr	r4, [pc, #224]	; (800078c <lsm9ds0_read+0xf8>)
 80006aa:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006ae:	81a0      	strh	r0, [r4, #12]
 80006b0:	212a      	movs	r1, #42	; 0x2a
 80006b2:	20d4      	movs	r0, #212	; 0xd4
 80006b4:	f001 f8c1 	bl	800183a <i2c_read_reg>
 80006b8:	212b      	movs	r1, #43	; 0x2b
 80006ba:	4605      	mov	r5, r0
 80006bc:	20d4      	movs	r0, #212	; 0xd4
 80006be:	f001 f8bc 	bl	800183a <i2c_read_reg>
 80006c2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006c6:	81e0      	strh	r0, [r4, #14]
 80006c8:	212c      	movs	r1, #44	; 0x2c
 80006ca:	20d4      	movs	r0, #212	; 0xd4
 80006cc:	f001 f8b5 	bl	800183a <i2c_read_reg>
 80006d0:	212d      	movs	r1, #45	; 0x2d
 80006d2:	4605      	mov	r5, r0
 80006d4:	20d4      	movs	r0, #212	; 0xd4
 80006d6:	f001 f8b0 	bl	800183a <i2c_read_reg>
 80006da:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006de:	8220      	strh	r0, [r4, #16]
 80006e0:	2108      	movs	r1, #8
 80006e2:	203c      	movs	r0, #60	; 0x3c
 80006e4:	f001 f8a9 	bl	800183a <i2c_read_reg>
 80006e8:	2109      	movs	r1, #9
 80006ea:	4605      	mov	r5, r0
 80006ec:	203c      	movs	r0, #60	; 0x3c
 80006ee:	f001 f8a4 	bl	800183a <i2c_read_reg>
 80006f2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006f6:	80e0      	strh	r0, [r4, #6]
 80006f8:	210a      	movs	r1, #10
 80006fa:	203c      	movs	r0, #60	; 0x3c
 80006fc:	f001 f89d 	bl	800183a <i2c_read_reg>
 8000700:	210b      	movs	r1, #11
 8000702:	4605      	mov	r5, r0
 8000704:	203c      	movs	r0, #60	; 0x3c
 8000706:	f001 f898 	bl	800183a <i2c_read_reg>
 800070a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800070e:	8120      	strh	r0, [r4, #8]
 8000710:	210c      	movs	r1, #12
 8000712:	203c      	movs	r0, #60	; 0x3c
 8000714:	f001 f891 	bl	800183a <i2c_read_reg>
 8000718:	210d      	movs	r1, #13
 800071a:	4605      	mov	r5, r0
 800071c:	203c      	movs	r0, #60	; 0x3c
 800071e:	f001 f88c 	bl	800183a <i2c_read_reg>
 8000722:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000726:	8160      	strh	r0, [r4, #10]
 8000728:	2128      	movs	r1, #40	; 0x28
 800072a:	203c      	movs	r0, #60	; 0x3c
 800072c:	f001 f885 	bl	800183a <i2c_read_reg>
 8000730:	2129      	movs	r1, #41	; 0x29
 8000732:	4605      	mov	r5, r0
 8000734:	203c      	movs	r0, #60	; 0x3c
 8000736:	f001 f880 	bl	800183a <i2c_read_reg>
 800073a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800073e:	8020      	strh	r0, [r4, #0]
 8000740:	212a      	movs	r1, #42	; 0x2a
 8000742:	203c      	movs	r0, #60	; 0x3c
 8000744:	f001 f879 	bl	800183a <i2c_read_reg>
 8000748:	212b      	movs	r1, #43	; 0x2b
 800074a:	4605      	mov	r5, r0
 800074c:	203c      	movs	r0, #60	; 0x3c
 800074e:	f001 f874 	bl	800183a <i2c_read_reg>
 8000752:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000756:	8060      	strh	r0, [r4, #2]
 8000758:	212c      	movs	r1, #44	; 0x2c
 800075a:	203c      	movs	r0, #60	; 0x3c
 800075c:	f001 f86d 	bl	800183a <i2c_read_reg>
 8000760:	212d      	movs	r1, #45	; 0x2d
 8000762:	4605      	mov	r5, r0
 8000764:	203c      	movs	r0, #60	; 0x3c
 8000766:	f001 f868 	bl	800183a <i2c_read_reg>
 800076a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800076e:	80a0      	strh	r0, [r4, #4]
 8000770:	2105      	movs	r1, #5
 8000772:	203c      	movs	r0, #60	; 0x3c
 8000774:	f001 f861 	bl	800183a <i2c_read_reg>
 8000778:	2106      	movs	r1, #6
 800077a:	4605      	mov	r5, r0
 800077c:	203c      	movs	r0, #60	; 0x3c
 800077e:	f001 f85c 	bl	800183a <i2c_read_reg>
 8000782:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000786:	8320      	strh	r0, [r4, #24]
 8000788:	bd38      	pop	{r3, r4, r5, pc}
 800078a:	bf00      	nop
 800078c:	20000234 	.word	0x20000234

08000790 <lsm9ds0_init>:
 8000790:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000794:	4d34      	ldr	r5, [pc, #208]	; (8000868 <lsm9ds0_init+0xd8>)
 8000796:	2400      	movs	r4, #0
 8000798:	20d4      	movs	r0, #212	; 0xd4
 800079a:	210f      	movs	r1, #15
 800079c:	802c      	strh	r4, [r5, #0]
 800079e:	806c      	strh	r4, [r5, #2]
 80007a0:	80ac      	strh	r4, [r5, #4]
 80007a2:	80ec      	strh	r4, [r5, #6]
 80007a4:	812c      	strh	r4, [r5, #8]
 80007a6:	816c      	strh	r4, [r5, #10]
 80007a8:	81ac      	strh	r4, [r5, #12]
 80007aa:	81ec      	strh	r4, [r5, #14]
 80007ac:	822c      	strh	r4, [r5, #16]
 80007ae:	826c      	strh	r4, [r5, #18]
 80007b0:	82ac      	strh	r4, [r5, #20]
 80007b2:	82ec      	strh	r4, [r5, #22]
 80007b4:	832c      	strh	r4, [r5, #24]
 80007b6:	f001 f840 	bl	800183a <i2c_read_reg>
 80007ba:	28d4      	cmp	r0, #212	; 0xd4
 80007bc:	4606      	mov	r6, r0
 80007be:	d14e      	bne.n	800085e <lsm9ds0_init+0xce>
 80007c0:	203c      	movs	r0, #60	; 0x3c
 80007c2:	210f      	movs	r1, #15
 80007c4:	f001 f839 	bl	800183a <i2c_read_reg>
 80007c8:	2849      	cmp	r0, #73	; 0x49
 80007ca:	bf18      	it	ne
 80007cc:	2602      	movne	r6, #2
 80007ce:	d147      	bne.n	8000860 <lsm9ds0_init+0xd0>
 80007d0:	4630      	mov	r0, r6
 80007d2:	2120      	movs	r1, #32
 80007d4:	22ff      	movs	r2, #255	; 0xff
 80007d6:	f001 f81d 	bl	8001814 <i2c_write_reg>
 80007da:	4630      	mov	r0, r6
 80007dc:	2123      	movs	r1, #35	; 0x23
 80007de:	2218      	movs	r2, #24
 80007e0:	f001 f818 	bl	8001814 <i2c_write_reg>
 80007e4:	203c      	movs	r0, #60	; 0x3c
 80007e6:	211f      	movs	r1, #31
 80007e8:	4622      	mov	r2, r4
 80007ea:	f001 f813 	bl	8001814 <i2c_write_reg>
 80007ee:	203c      	movs	r0, #60	; 0x3c
 80007f0:	2120      	movs	r1, #32
 80007f2:	2267      	movs	r2, #103	; 0x67
 80007f4:	f001 f80e 	bl	8001814 <i2c_write_reg>
 80007f8:	203c      	movs	r0, #60	; 0x3c
 80007fa:	2121      	movs	r1, #33	; 0x21
 80007fc:	4622      	mov	r2, r4
 80007fe:	f001 f809 	bl	8001814 <i2c_write_reg>
 8000802:	203c      	movs	r0, #60	; 0x3c
 8000804:	2124      	movs	r1, #36	; 0x24
 8000806:	22f4      	movs	r2, #244	; 0xf4
 8000808:	f001 f804 	bl	8001814 <i2c_write_reg>
 800080c:	203c      	movs	r0, #60	; 0x3c
 800080e:	2125      	movs	r1, #37	; 0x25
 8000810:	4622      	mov	r2, r4
 8000812:	f000 ffff 	bl	8001814 <i2c_write_reg>
 8000816:	203c      	movs	r0, #60	; 0x3c
 8000818:	2126      	movs	r1, #38	; 0x26
 800081a:	2280      	movs	r2, #128	; 0x80
 800081c:	f000 fffa 	bl	8001814 <i2c_write_reg>
 8000820:	f7ff ff38 	bl	8000694 <lsm9ds0_read>
 8000824:	2664      	movs	r6, #100	; 0x64
 8000826:	4627      	mov	r7, r4
 8000828:	46a0      	mov	r8, r4
 800082a:	f7ff ff33 	bl	8000694 <lsm9ds0_read>
 800082e:	f9b5 200c 	ldrsh.w	r2, [r5, #12]
 8000832:	4b0d      	ldr	r3, [pc, #52]	; (8000868 <lsm9ds0_init+0xd8>)
 8000834:	4490      	add	r8, r2
 8000836:	f9b5 200e 	ldrsh.w	r2, [r5, #14]
 800083a:	4417      	add	r7, r2
 800083c:	f9b5 2010 	ldrsh.w	r2, [r5, #16]
 8000840:	3e01      	subs	r6, #1
 8000842:	4414      	add	r4, r2
 8000844:	d1f1      	bne.n	800082a <lsm9ds0_init+0x9a>
 8000846:	2264      	movs	r2, #100	; 0x64
 8000848:	fb98 f8f2 	sdiv	r8, r8, r2
 800084c:	fb97 f7f2 	sdiv	r7, r7, r2
 8000850:	fb94 f4f2 	sdiv	r4, r4, r2
 8000854:	f8a3 8012 	strh.w	r8, [r3, #18]
 8000858:	829f      	strh	r7, [r3, #20]
 800085a:	82dc      	strh	r4, [r3, #22]
 800085c:	e000      	b.n	8000860 <lsm9ds0_init+0xd0>
 800085e:	2601      	movs	r6, #1
 8000860:	4630      	mov	r0, r6
 8000862:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000866:	bf00      	nop
 8000868:	20000234 	.word	0x20000234

0800086c <rgb_i2c_delay>:
 800086c:	bf00      	nop
 800086e:	4770      	bx	lr

08000870 <RGBSetLowSDA>:
 8000870:	b513      	push	{r0, r1, r4, lr}
 8000872:	2301      	movs	r3, #1
 8000874:	2203      	movs	r2, #3
 8000876:	24f0      	movs	r4, #240	; 0xf0
 8000878:	f88d 3004 	strb.w	r3, [sp, #4]
 800087c:	f88d 3006 	strb.w	r3, [sp, #6]
 8000880:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000884:	2300      	movs	r3, #0
 8000886:	4669      	mov	r1, sp
 8000888:	f88d 2005 	strb.w	r2, [sp, #5]
 800088c:	f88d 3007 	strb.w	r3, [sp, #7]
 8000890:	9400      	str	r4, [sp, #0]
 8000892:	f001 fb9b 	bl	8001fcc <GPIO_Init>
 8000896:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800089a:	851c      	strh	r4, [r3, #40]	; 0x28
 800089c:	f7ff ffe6 	bl	800086c <rgb_i2c_delay>
 80008a0:	b002      	add	sp, #8
 80008a2:	bd10      	pop	{r4, pc}

080008a4 <RGBSetHighSDA>:
 80008a4:	b513      	push	{r0, r1, r4, lr}
 80008a6:	2300      	movs	r3, #0
 80008a8:	2203      	movs	r2, #3
 80008aa:	24f0      	movs	r4, #240	; 0xf0
 80008ac:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80008b0:	4669      	mov	r1, sp
 80008b2:	f88d 3004 	strb.w	r3, [sp, #4]
 80008b6:	f88d 2005 	strb.w	r2, [sp, #5]
 80008ba:	f88d 3007 	strb.w	r3, [sp, #7]
 80008be:	9400      	str	r4, [sp, #0]
 80008c0:	f001 fb84 	bl	8001fcc <GPIO_Init>
 80008c4:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80008c8:	619c      	str	r4, [r3, #24]
 80008ca:	f7ff ffcf 	bl	800086c <rgb_i2c_delay>
 80008ce:	b002      	add	sp, #8
 80008d0:	bd10      	pop	{r4, pc}
	...

080008d4 <RGBSetLowSCL>:
 80008d4:	4b02      	ldr	r3, [pc, #8]	; (80008e0 <RGBSetLowSCL+0xc>)
 80008d6:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 80008da:	851a      	strh	r2, [r3, #40]	; 0x28
 80008dc:	f7ff bfc6 	b.w	800086c <rgb_i2c_delay>
 80008e0:	48000800 	.word	0x48000800

080008e4 <RGBSetHighSCL>:
 80008e4:	4b02      	ldr	r3, [pc, #8]	; (80008f0 <RGBSetHighSCL+0xc>)
 80008e6:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 80008ea:	619a      	str	r2, [r3, #24]
 80008ec:	f7ff bfbe 	b.w	800086c <rgb_i2c_delay>
 80008f0:	48000800 	.word	0x48000800

080008f4 <rgb_i2c_init>:
 80008f4:	b573      	push	{r0, r1, r4, r5, r6, lr}
 80008f6:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 80008fa:	2400      	movs	r4, #0
 80008fc:	9300      	str	r3, [sp, #0]
 80008fe:	2603      	movs	r6, #3
 8000900:	2301      	movs	r3, #1
 8000902:	4669      	mov	r1, sp
 8000904:	4812      	ldr	r0, [pc, #72]	; (8000950 <rgb_i2c_init+0x5c>)
 8000906:	f88d 3004 	strb.w	r3, [sp, #4]
 800090a:	25f0      	movs	r5, #240	; 0xf0
 800090c:	f88d 6005 	strb.w	r6, [sp, #5]
 8000910:	f88d 4006 	strb.w	r4, [sp, #6]
 8000914:	f88d 4007 	strb.w	r4, [sp, #7]
 8000918:	f001 fb58 	bl	8001fcc <GPIO_Init>
 800091c:	4669      	mov	r1, sp
 800091e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000922:	9500      	str	r5, [sp, #0]
 8000924:	f88d 4004 	strb.w	r4, [sp, #4]
 8000928:	f88d 6005 	strb.w	r6, [sp, #5]
 800092c:	f88d 4007 	strb.w	r4, [sp, #7]
 8000930:	f001 fb4c 	bl	8001fcc <GPIO_Init>
 8000934:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000938:	4629      	mov	r1, r5
 800093a:	f001 fb8d 	bl	8002058 <GPIO_SetBits>
 800093e:	f7ff ffd1 	bl	80008e4 <RGBSetHighSCL>
 8000942:	f7ff ff95 	bl	8000870 <RGBSetLowSDA>
 8000946:	f7ff ffad 	bl	80008a4 <RGBSetHighSDA>
 800094a:	b002      	add	sp, #8
 800094c:	bd70      	pop	{r4, r5, r6, pc}
 800094e:	bf00      	nop
 8000950:	48000800 	.word	0x48000800

08000954 <rgb_i2cStart>:
 8000954:	b508      	push	{r3, lr}
 8000956:	f7ff ffc5 	bl	80008e4 <RGBSetHighSCL>
 800095a:	f7ff ffa3 	bl	80008a4 <RGBSetHighSDA>
 800095e:	f7ff ffc1 	bl	80008e4 <RGBSetHighSCL>
 8000962:	f7ff ff85 	bl	8000870 <RGBSetLowSDA>
 8000966:	f7ff ffb5 	bl	80008d4 <RGBSetLowSCL>
 800096a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800096e:	f7ff bf99 	b.w	80008a4 <RGBSetHighSDA>

08000972 <rgb_i2cStop>:
 8000972:	b508      	push	{r3, lr}
 8000974:	f7ff ffae 	bl	80008d4 <RGBSetLowSCL>
 8000978:	f7ff ff7a 	bl	8000870 <RGBSetLowSDA>
 800097c:	f7ff ffb2 	bl	80008e4 <RGBSetHighSCL>
 8000980:	f7ff ff76 	bl	8000870 <RGBSetLowSDA>
 8000984:	f7ff ffae 	bl	80008e4 <RGBSetHighSCL>
 8000988:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800098c:	f7ff bf8a 	b.w	80008a4 <RGBSetHighSDA>

08000990 <rgb_i2cWrite>:
 8000990:	b538      	push	{r3, r4, r5, lr}
 8000992:	4604      	mov	r4, r0
 8000994:	2508      	movs	r5, #8
 8000996:	f7ff ff9d 	bl	80008d4 <RGBSetLowSCL>
 800099a:	0623      	lsls	r3, r4, #24
 800099c:	d502      	bpl.n	80009a4 <rgb_i2cWrite+0x14>
 800099e:	f7ff ff81 	bl	80008a4 <RGBSetHighSDA>
 80009a2:	e001      	b.n	80009a8 <rgb_i2cWrite+0x18>
 80009a4:	f7ff ff64 	bl	8000870 <RGBSetLowSDA>
 80009a8:	3d01      	subs	r5, #1
 80009aa:	f7ff ff9b 	bl	80008e4 <RGBSetHighSCL>
 80009ae:	0064      	lsls	r4, r4, #1
 80009b0:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80009b4:	b2e4      	uxtb	r4, r4
 80009b6:	d1ee      	bne.n	8000996 <rgb_i2cWrite+0x6>
 80009b8:	f7ff ff8c 	bl	80008d4 <RGBSetLowSCL>
 80009bc:	f7ff ff72 	bl	80008a4 <RGBSetHighSDA>
 80009c0:	f7ff ff90 	bl	80008e4 <RGBSetHighSCL>
 80009c4:	f7ff ff86 	bl	80008d4 <RGBSetLowSCL>
 80009c8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80009cc:	f7ff bf4e 	b.w	800086c <rgb_i2c_delay>

080009d0 <rgb_i2cRead>:
 80009d0:	2300      	movs	r3, #0
 80009d2:	b570      	push	{r4, r5, r6, lr}
 80009d4:	700b      	strb	r3, [r1, #0]
 80009d6:	704b      	strb	r3, [r1, #1]
 80009d8:	708b      	strb	r3, [r1, #2]
 80009da:	70cb      	strb	r3, [r1, #3]
 80009dc:	4606      	mov	r6, r0
 80009de:	460c      	mov	r4, r1
 80009e0:	f7ff ff78 	bl	80008d4 <RGBSetLowSCL>
 80009e4:	f7ff ff5e 	bl	80008a4 <RGBSetHighSDA>
 80009e8:	2508      	movs	r5, #8
 80009ea:	2300      	movs	r3, #0
 80009ec:	5ce2      	ldrb	r2, [r4, r3]
 80009ee:	0052      	lsls	r2, r2, #1
 80009f0:	54e2      	strb	r2, [r4, r3]
 80009f2:	3301      	adds	r3, #1
 80009f4:	2b04      	cmp	r3, #4
 80009f6:	d1f9      	bne.n	80009ec <rgb_i2cRead+0x1c>
 80009f8:	f7ff ff74 	bl	80008e4 <RGBSetHighSCL>
 80009fc:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000a00:	8a1b      	ldrh	r3, [r3, #16]
 8000a02:	b29b      	uxth	r3, r3
 8000a04:	06da      	lsls	r2, r3, #27
 8000a06:	d503      	bpl.n	8000a10 <rgb_i2cRead+0x40>
 8000a08:	7822      	ldrb	r2, [r4, #0]
 8000a0a:	f042 0201 	orr.w	r2, r2, #1
 8000a0e:	7022      	strb	r2, [r4, #0]
 8000a10:	0698      	lsls	r0, r3, #26
 8000a12:	d503      	bpl.n	8000a1c <rgb_i2cRead+0x4c>
 8000a14:	7862      	ldrb	r2, [r4, #1]
 8000a16:	f042 0201 	orr.w	r2, r2, #1
 8000a1a:	7062      	strb	r2, [r4, #1]
 8000a1c:	0659      	lsls	r1, r3, #25
 8000a1e:	d503      	bpl.n	8000a28 <rgb_i2cRead+0x58>
 8000a20:	78a2      	ldrb	r2, [r4, #2]
 8000a22:	f042 0201 	orr.w	r2, r2, #1
 8000a26:	70a2      	strb	r2, [r4, #2]
 8000a28:	061a      	lsls	r2, r3, #24
 8000a2a:	d503      	bpl.n	8000a34 <rgb_i2cRead+0x64>
 8000a2c:	78e3      	ldrb	r3, [r4, #3]
 8000a2e:	f043 0301 	orr.w	r3, r3, #1
 8000a32:	70e3      	strb	r3, [r4, #3]
 8000a34:	f7ff ff4e 	bl	80008d4 <RGBSetLowSCL>
 8000a38:	3d01      	subs	r5, #1
 8000a3a:	d1d6      	bne.n	80009ea <rgb_i2cRead+0x1a>
 8000a3c:	b10e      	cbz	r6, 8000a42 <rgb_i2cRead+0x72>
 8000a3e:	f7ff ff17 	bl	8000870 <RGBSetLowSDA>
 8000a42:	f7ff ff4f 	bl	80008e4 <RGBSetHighSCL>
 8000a46:	f7ff ff45 	bl	80008d4 <RGBSetLowSCL>
 8000a4a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000a4e:	f7ff bf0d 	b.w	800086c <rgb_i2c_delay>

08000a52 <rgb_i2c_write_reg>:
 8000a52:	b570      	push	{r4, r5, r6, lr}
 8000a54:	4605      	mov	r5, r0
 8000a56:	460c      	mov	r4, r1
 8000a58:	4616      	mov	r6, r2
 8000a5a:	f7ff ff7b 	bl	8000954 <rgb_i2cStart>
 8000a5e:	4628      	mov	r0, r5
 8000a60:	f7ff ff96 	bl	8000990 <rgb_i2cWrite>
 8000a64:	4620      	mov	r0, r4
 8000a66:	f7ff ff93 	bl	8000990 <rgb_i2cWrite>
 8000a6a:	4630      	mov	r0, r6
 8000a6c:	f7ff ff90 	bl	8000990 <rgb_i2cWrite>
 8000a70:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000a74:	f7ff bf7d 	b.w	8000972 <rgb_i2cStop>

08000a78 <rgb_i2c_read_reg>:
 8000a78:	b570      	push	{r4, r5, r6, lr}
 8000a7a:	4604      	mov	r4, r0
 8000a7c:	460d      	mov	r5, r1
 8000a7e:	4616      	mov	r6, r2
 8000a80:	f7ff ff68 	bl	8000954 <rgb_i2cStart>
 8000a84:	4620      	mov	r0, r4
 8000a86:	f7ff ff83 	bl	8000990 <rgb_i2cWrite>
 8000a8a:	4628      	mov	r0, r5
 8000a8c:	f7ff ff80 	bl	8000990 <rgb_i2cWrite>
 8000a90:	f7ff ff60 	bl	8000954 <rgb_i2cStart>
 8000a94:	f044 0001 	orr.w	r0, r4, #1
 8000a98:	f7ff ff7a 	bl	8000990 <rgb_i2cWrite>
 8000a9c:	4631      	mov	r1, r6
 8000a9e:	2000      	movs	r0, #0
 8000aa0:	f7ff ff96 	bl	80009d0 <rgb_i2cRead>
 8000aa4:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000aa8:	f7ff bf63 	b.w	8000972 <rgb_i2cStop>

08000aac <rgb_sensor_uninit>:
 8000aac:	b508      	push	{r3, lr}
 8000aae:	2008      	movs	r0, #8
 8000ab0:	f001 fb06 	bl	80020c0 <led_off>
 8000ab4:	2072      	movs	r0, #114	; 0x72
 8000ab6:	2180      	movs	r1, #128	; 0x80
 8000ab8:	2200      	movs	r2, #0
 8000aba:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000abe:	f7ff bfc8 	b.w	8000a52 <rgb_i2c_write_reg>
	...

08000ac4 <rgb_sensor_read>:
 8000ac4:	b570      	push	{r4, r5, r6, lr}
 8000ac6:	f7ff ff45 	bl	8000954 <rgb_i2cStart>
 8000aca:	2072      	movs	r0, #114	; 0x72
 8000acc:	4d4d      	ldr	r5, [pc, #308]	; (8000c04 <rgb_sensor_read+0x140>)
 8000ace:	4c4e      	ldr	r4, [pc, #312]	; (8000c08 <rgb_sensor_read+0x144>)
 8000ad0:	f7ff ff5e 	bl	8000990 <rgb_i2cWrite>
 8000ad4:	20b4      	movs	r0, #180	; 0xb4
 8000ad6:	f7ff ff5b 	bl	8000990 <rgb_i2cWrite>
 8000ada:	f7ff ff3b 	bl	8000954 <rgb_i2cStart>
 8000ade:	2073      	movs	r0, #115	; 0x73
 8000ae0:	f7ff ff56 	bl	8000990 <rgb_i2cWrite>
 8000ae4:	2001      	movs	r0, #1
 8000ae6:	4629      	mov	r1, r5
 8000ae8:	f7ff ff72 	bl	80009d0 <rgb_i2cRead>
 8000aec:	782b      	ldrb	r3, [r5, #0]
 8000aee:	8323      	strh	r3, [r4, #24]
 8000af0:	786b      	ldrb	r3, [r5, #1]
 8000af2:	8363      	strh	r3, [r4, #26]
 8000af4:	78ab      	ldrb	r3, [r5, #2]
 8000af6:	83a3      	strh	r3, [r4, #28]
 8000af8:	78eb      	ldrb	r3, [r5, #3]
 8000afa:	2001      	movs	r0, #1
 8000afc:	4629      	mov	r1, r5
 8000afe:	83e3      	strh	r3, [r4, #30]
 8000b00:	f7ff ff66 	bl	80009d0 <rgb_i2cRead>
 8000b04:	f104 0218 	add.w	r2, r4, #24
 8000b08:	2300      	movs	r3, #0
 8000b0a:	8811      	ldrh	r1, [r2, #0]
 8000b0c:	5ce8      	ldrb	r0, [r5, r3]
 8000b0e:	4e3d      	ldr	r6, [pc, #244]	; (8000c04 <rgb_sensor_read+0x140>)
 8000b10:	3301      	adds	r3, #1
 8000b12:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000b16:	2b04      	cmp	r3, #4
 8000b18:	f822 1b02 	strh.w	r1, [r2], #2
 8000b1c:	d1f5      	bne.n	8000b0a <rgb_sensor_read+0x46>
 8000b1e:	2001      	movs	r0, #1
 8000b20:	4631      	mov	r1, r6
 8000b22:	f7ff ff55 	bl	80009d0 <rgb_i2cRead>
 8000b26:	7833      	ldrb	r3, [r6, #0]
 8000b28:	8023      	strh	r3, [r4, #0]
 8000b2a:	7873      	ldrb	r3, [r6, #1]
 8000b2c:	8063      	strh	r3, [r4, #2]
 8000b2e:	78b3      	ldrb	r3, [r6, #2]
 8000b30:	80a3      	strh	r3, [r4, #4]
 8000b32:	78f3      	ldrb	r3, [r6, #3]
 8000b34:	2001      	movs	r0, #1
 8000b36:	4631      	mov	r1, r6
 8000b38:	80e3      	strh	r3, [r4, #6]
 8000b3a:	f7ff ff49 	bl	80009d0 <rgb_i2cRead>
 8000b3e:	4a33      	ldr	r2, [pc, #204]	; (8000c0c <rgb_sensor_read+0x148>)
 8000b40:	2300      	movs	r3, #0
 8000b42:	5ce8      	ldrb	r0, [r5, r3]
 8000b44:	8851      	ldrh	r1, [r2, #2]
 8000b46:	4e2f      	ldr	r6, [pc, #188]	; (8000c04 <rgb_sensor_read+0x140>)
 8000b48:	3301      	adds	r3, #1
 8000b4a:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000b4e:	2b04      	cmp	r3, #4
 8000b50:	f822 1f02 	strh.w	r1, [r2, #2]!
 8000b54:	d1f5      	bne.n	8000b42 <rgb_sensor_read+0x7e>
 8000b56:	2001      	movs	r0, #1
 8000b58:	4631      	mov	r1, r6
 8000b5a:	f7ff ff39 	bl	80009d0 <rgb_i2cRead>
 8000b5e:	7833      	ldrb	r3, [r6, #0]
 8000b60:	8123      	strh	r3, [r4, #8]
 8000b62:	7873      	ldrb	r3, [r6, #1]
 8000b64:	8163      	strh	r3, [r4, #10]
 8000b66:	78b3      	ldrb	r3, [r6, #2]
 8000b68:	81a3      	strh	r3, [r4, #12]
 8000b6a:	78f3      	ldrb	r3, [r6, #3]
 8000b6c:	2001      	movs	r0, #1
 8000b6e:	4631      	mov	r1, r6
 8000b70:	81e3      	strh	r3, [r4, #14]
 8000b72:	f7ff ff2d 	bl	80009d0 <rgb_i2cRead>
 8000b76:	4a26      	ldr	r2, [pc, #152]	; (8000c10 <rgb_sensor_read+0x14c>)
 8000b78:	2300      	movs	r3, #0
 8000b7a:	8811      	ldrh	r1, [r2, #0]
 8000b7c:	5ce8      	ldrb	r0, [r5, r3]
 8000b7e:	4e21      	ldr	r6, [pc, #132]	; (8000c04 <rgb_sensor_read+0x140>)
 8000b80:	3301      	adds	r3, #1
 8000b82:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000b86:	2b04      	cmp	r3, #4
 8000b88:	f822 1b02 	strh.w	r1, [r2], #2
 8000b8c:	d1f5      	bne.n	8000b7a <rgb_sensor_read+0xb6>
 8000b8e:	2001      	movs	r0, #1
 8000b90:	4631      	mov	r1, r6
 8000b92:	f7ff ff1d 	bl	80009d0 <rgb_i2cRead>
 8000b96:	7833      	ldrb	r3, [r6, #0]
 8000b98:	8223      	strh	r3, [r4, #16]
 8000b9a:	7873      	ldrb	r3, [r6, #1]
 8000b9c:	8263      	strh	r3, [r4, #18]
 8000b9e:	78b3      	ldrb	r3, [r6, #2]
 8000ba0:	82a3      	strh	r3, [r4, #20]
 8000ba2:	78f3      	ldrb	r3, [r6, #3]
 8000ba4:	2001      	movs	r0, #1
 8000ba6:	4631      	mov	r1, r6
 8000ba8:	82e3      	strh	r3, [r4, #22]
 8000baa:	f7ff ff11 	bl	80009d0 <rgb_i2cRead>
 8000bae:	4a19      	ldr	r2, [pc, #100]	; (8000c14 <rgb_sensor_read+0x150>)
 8000bb0:	2300      	movs	r3, #0
 8000bb2:	8811      	ldrh	r1, [r2, #0]
 8000bb4:	5ce8      	ldrb	r0, [r5, r3]
 8000bb6:	4e13      	ldr	r6, [pc, #76]	; (8000c04 <rgb_sensor_read+0x140>)
 8000bb8:	3301      	adds	r3, #1
 8000bba:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000bbe:	2b04      	cmp	r3, #4
 8000bc0:	f822 1b02 	strh.w	r1, [r2], #2
 8000bc4:	d1f5      	bne.n	8000bb2 <rgb_sensor_read+0xee>
 8000bc6:	2001      	movs	r0, #1
 8000bc8:	4631      	mov	r1, r6
 8000bca:	f7ff ff01 	bl	80009d0 <rgb_i2cRead>
 8000bce:	7833      	ldrb	r3, [r6, #0]
 8000bd0:	8423      	strh	r3, [r4, #32]
 8000bd2:	7873      	ldrb	r3, [r6, #1]
 8000bd4:	8463      	strh	r3, [r4, #34]	; 0x22
 8000bd6:	78b3      	ldrb	r3, [r6, #2]
 8000bd8:	84a3      	strh	r3, [r4, #36]	; 0x24
 8000bda:	78f3      	ldrb	r3, [r6, #3]
 8000bdc:	2000      	movs	r0, #0
 8000bde:	4631      	mov	r1, r6
 8000be0:	84e3      	strh	r3, [r4, #38]	; 0x26
 8000be2:	f7ff fef5 	bl	80009d0 <rgb_i2cRead>
 8000be6:	4a0c      	ldr	r2, [pc, #48]	; (8000c18 <rgb_sensor_read+0x154>)
 8000be8:	2300      	movs	r3, #0
 8000bea:	8811      	ldrh	r1, [r2, #0]
 8000bec:	5ce8      	ldrb	r0, [r5, r3]
 8000bee:	3301      	adds	r3, #1
 8000bf0:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000bf4:	2b04      	cmp	r3, #4
 8000bf6:	f822 1b02 	strh.w	r1, [r2], #2
 8000bfa:	d1f6      	bne.n	8000bea <rgb_sensor_read+0x126>
 8000bfc:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000c00:	f7ff beb7 	b.w	8000972 <rgb_i2cStop>
 8000c04:	200009b4 	.word	0x200009b4
 8000c08:	2000024e 	.word	0x2000024e
 8000c0c:	2000024c 	.word	0x2000024c
 8000c10:	20000256 	.word	0x20000256
 8000c14:	2000025e 	.word	0x2000025e
 8000c18:	2000026e 	.word	0x2000026e

08000c1c <rgb_sensor_init>:
 8000c1c:	4b1f      	ldr	r3, [pc, #124]	; (8000c9c <rgb_sensor_init+0x80>)
 8000c1e:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000c20:	2404      	movs	r4, #4
 8000c22:	2200      	movs	r2, #0
 8000c24:	3c01      	subs	r4, #1
 8000c26:	801a      	strh	r2, [r3, #0]
 8000c28:	811a      	strh	r2, [r3, #8]
 8000c2a:	821a      	strh	r2, [r3, #16]
 8000c2c:	841a      	strh	r2, [r3, #32]
 8000c2e:	831a      	strh	r2, [r3, #24]
 8000c30:	f103 0302 	add.w	r3, r3, #2
 8000c34:	d1f5      	bne.n	8000c22 <rgb_sensor_init+0x6>
 8000c36:	2008      	movs	r0, #8
 8000c38:	f001 fa2c 	bl	8002094 <led_on>
 8000c3c:	f7ff fe5a 	bl	80008f4 <rgb_i2c_init>
 8000c40:	2072      	movs	r0, #114	; 0x72
 8000c42:	2181      	movs	r1, #129	; 0x81
 8000c44:	22ff      	movs	r2, #255	; 0xff
 8000c46:	f7ff ff04 	bl	8000a52 <rgb_i2c_write_reg>
 8000c4a:	2072      	movs	r0, #114	; 0x72
 8000c4c:	2183      	movs	r1, #131	; 0x83
 8000c4e:	22ff      	movs	r2, #255	; 0xff
 8000c50:	f7ff feff 	bl	8000a52 <rgb_i2c_write_reg>
 8000c54:	2072      	movs	r0, #114	; 0x72
 8000c56:	218d      	movs	r1, #141	; 0x8d
 8000c58:	4622      	mov	r2, r4
 8000c5a:	f7ff fefa 	bl	8000a52 <rgb_i2c_write_reg>
 8000c5e:	2072      	movs	r0, #114	; 0x72
 8000c60:	2180      	movs	r1, #128	; 0x80
 8000c62:	2203      	movs	r2, #3
 8000c64:	f7ff fef5 	bl	8000a52 <rgb_i2c_write_reg>
 8000c68:	ad01      	add	r5, sp, #4
 8000c6a:	2072      	movs	r0, #114	; 0x72
 8000c6c:	218f      	movs	r1, #143	; 0x8f
 8000c6e:	2223      	movs	r2, #35	; 0x23
 8000c70:	f7ff feef 	bl	8000a52 <rgb_i2c_write_reg>
 8000c74:	f7ff ff26 	bl	8000ac4 <rgb_sensor_read>
 8000c78:	2072      	movs	r0, #114	; 0x72
 8000c7a:	2192      	movs	r1, #146	; 0x92
 8000c7c:	462a      	mov	r2, r5
 8000c7e:	f7ff fefb 	bl	8000a78 <rgb_i2c_read_reg>
 8000c82:	4620      	mov	r0, r4
 8000c84:	4623      	mov	r3, r4
 8000c86:	5cea      	ldrb	r2, [r5, r3]
 8000c88:	2a69      	cmp	r2, #105	; 0x69
 8000c8a:	d002      	beq.n	8000c92 <rgb_sensor_init+0x76>
 8000c8c:	2201      	movs	r2, #1
 8000c8e:	409a      	lsls	r2, r3
 8000c90:	4310      	orrs	r0, r2
 8000c92:	3301      	adds	r3, #1
 8000c94:	2b04      	cmp	r3, #4
 8000c96:	d1f6      	bne.n	8000c86 <rgb_sensor_init+0x6a>
 8000c98:	b003      	add	sp, #12
 8000c9a:	bd30      	pop	{r4, r5, pc}
 8000c9c:	2000024e 	.word	0x2000024e

08000ca0 <motors_uninit>:
 8000ca0:	b508      	push	{r3, lr}
 8000ca2:	20c0      	movs	r0, #192	; 0xc0
 8000ca4:	2100      	movs	r1, #0
 8000ca6:	2218      	movs	r2, #24
 8000ca8:	f000 fdb4 	bl	8001814 <i2c_write_reg>
 8000cac:	20c4      	movs	r0, #196	; 0xc4
 8000cae:	2100      	movs	r1, #0
 8000cb0:	2218      	movs	r2, #24
 8000cb2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000cb6:	f000 bdad 	b.w	8001814 <i2c_write_reg>
	...

08000cbc <motors_update>:
 8000cbc:	4a23      	ldr	r2, [pc, #140]	; (8000d4c <motors_update+0x90>)
 8000cbe:	b510      	push	{r4, lr}
 8000cc0:	e892 0018 	ldmia.w	r2, {r3, r4}
 8000cc4:	2b3f      	cmp	r3, #63	; 0x3f
 8000cc6:	dc05      	bgt.n	8000cd4 <motors_update+0x18>
 8000cc8:	f06f 023e 	mvn.w	r2, #62	; 0x3e
 8000ccc:	4293      	cmp	r3, r2
 8000cce:	bfb8      	it	lt
 8000cd0:	4613      	movlt	r3, r2
 8000cd2:	e000      	b.n	8000cd6 <motors_update+0x1a>
 8000cd4:	233f      	movs	r3, #63	; 0x3f
 8000cd6:	2c3f      	cmp	r4, #63	; 0x3f
 8000cd8:	dc05      	bgt.n	8000ce6 <motors_update+0x2a>
 8000cda:	f06f 023e 	mvn.w	r2, #62	; 0x3e
 8000cde:	4294      	cmp	r4, r2
 8000ce0:	bfb8      	it	lt
 8000ce2:	4614      	movlt	r4, r2
 8000ce4:	e000      	b.n	8000ce8 <motors_update+0x2c>
 8000ce6:	243f      	movs	r4, #63	; 0x3f
 8000ce8:	2b00      	cmp	r3, #0
 8000cea:	d00f      	beq.n	8000d0c <motors_update+0x50>
 8000cec:	dd06      	ble.n	8000cfc <motors_update+0x40>
 8000cee:	2b06      	cmp	r3, #6
 8000cf0:	bfb8      	it	lt
 8000cf2:	2306      	movlt	r3, #6
 8000cf4:	009b      	lsls	r3, r3, #2
 8000cf6:	f043 0202 	orr.w	r2, r3, #2
 8000cfa:	e008      	b.n	8000d0e <motors_update+0x52>
 8000cfc:	425b      	negs	r3, r3
 8000cfe:	2b06      	cmp	r3, #6
 8000d00:	bfb8      	it	lt
 8000d02:	2306      	movlt	r3, #6
 8000d04:	009b      	lsls	r3, r3, #2
 8000d06:	f043 0201 	orr.w	r2, r3, #1
 8000d0a:	e000      	b.n	8000d0e <motors_update+0x52>
 8000d0c:	221b      	movs	r2, #27
 8000d0e:	20c0      	movs	r0, #192	; 0xc0
 8000d10:	2100      	movs	r1, #0
 8000d12:	b2d2      	uxtb	r2, r2
 8000d14:	f000 fd7e 	bl	8001814 <i2c_write_reg>
 8000d18:	2c00      	cmp	r4, #0
 8000d1a:	d00f      	beq.n	8000d3c <motors_update+0x80>
 8000d1c:	dd06      	ble.n	8000d2c <motors_update+0x70>
 8000d1e:	2c06      	cmp	r4, #6
 8000d20:	bfb8      	it	lt
 8000d22:	2406      	movlt	r4, #6
 8000d24:	00a4      	lsls	r4, r4, #2
 8000d26:	f044 0201 	orr.w	r2, r4, #1
 8000d2a:	e008      	b.n	8000d3e <motors_update+0x82>
 8000d2c:	4264      	negs	r4, r4
 8000d2e:	2c06      	cmp	r4, #6
 8000d30:	bfb8      	it	lt
 8000d32:	2406      	movlt	r4, #6
 8000d34:	00a4      	lsls	r4, r4, #2
 8000d36:	f044 0202 	orr.w	r2, r4, #2
 8000d3a:	e000      	b.n	8000d3e <motors_update+0x82>
 8000d3c:	221b      	movs	r2, #27
 8000d3e:	20c4      	movs	r0, #196	; 0xc4
 8000d40:	2100      	movs	r1, #0
 8000d42:	b2d2      	uxtb	r2, r2
 8000d44:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000d48:	f000 bd64 	b.w	8001814 <i2c_write_reg>
 8000d4c:	20000478 	.word	0x20000478

08000d50 <motors_init>:
 8000d50:	b510      	push	{r4, lr}
 8000d52:	4b04      	ldr	r3, [pc, #16]	; (8000d64 <motors_init+0x14>)
 8000d54:	2400      	movs	r4, #0
 8000d56:	601c      	str	r4, [r3, #0]
 8000d58:	605c      	str	r4, [r3, #4]
 8000d5a:	f7ff ffaf 	bl	8000cbc <motors_update>
 8000d5e:	4620      	mov	r0, r4
 8000d60:	bd10      	pop	{r4, pc}
 8000d62:	bf00      	nop
 8000d64:	20000478 	.word	0x20000478

08000d68 <esp8266_send>:
 8000d68:	b510      	push	{r4, lr}
 8000d6a:	1e44      	subs	r4, r0, #1
 8000d6c:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000d70:	b110      	cbz	r0, 8000d78 <esp8266_send+0x10>
 8000d72:	f000 faa9 	bl	80012c8 <uart_write>
 8000d76:	e7f9      	b.n	8000d6c <esp8266_send+0x4>
 8000d78:	bd10      	pop	{r4, pc}

08000d7a <esp8266_send_uint>:
 8000d7a:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000d7c:	2300      	movs	r3, #0
 8000d7e:	f88d 300f 	strb.w	r3, [sp, #15]
 8000d82:	230a      	movs	r3, #10
 8000d84:	240a      	movs	r4, #10
 8000d86:	fbb0 f1f4 	udiv	r1, r0, r4
 8000d8a:	fb04 0011 	mls	r0, r4, r1, r0
 8000d8e:	aa01      	add	r2, sp, #4
 8000d90:	3030      	adds	r0, #48	; 0x30
 8000d92:	5498      	strb	r0, [r3, r2]
 8000d94:	1e5c      	subs	r4, r3, #1
 8000d96:	4608      	mov	r0, r1
 8000d98:	b109      	cbz	r1, 8000d9e <esp8266_send_uint+0x24>
 8000d9a:	4623      	mov	r3, r4
 8000d9c:	e7f2      	b.n	8000d84 <esp8266_send_uint+0xa>
 8000d9e:	18d0      	adds	r0, r2, r3
 8000da0:	f7ff ffe2 	bl	8000d68 <esp8266_send>
 8000da4:	b004      	add	sp, #16
 8000da6:	bd10      	pop	{r4, pc}

08000da8 <esp8266_find_stream>:
 8000da8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000daa:	4615      	mov	r5, r2
 8000dac:	460f      	mov	r7, r1
 8000dae:	4606      	mov	r6, r0
 8000db0:	f001 f8c6 	bl	8001f40 <timer_get_time>
 8000db4:	4405      	add	r5, r0
 8000db6:	f000 fb3f 	bl	8001438 <uart_clear_buffer>
 8000dba:	2400      	movs	r4, #0
 8000dbc:	f000 fa8e 	bl	80012dc <uart_is_char>
 8000dc0:	f64f 72ff 	movw	r2, #65535	; 0xffff
 8000dc4:	4290      	cmp	r0, r2
 8000dc6:	d00c      	beq.n	8000de2 <esp8266_find_stream+0x3a>
 8000dc8:	5d32      	ldrb	r2, [r6, r4]
 8000dca:	4282      	cmp	r2, r0
 8000dcc:	d108      	bne.n	8000de0 <esp8266_find_stream+0x38>
 8000dce:	1e7b      	subs	r3, r7, #1
 8000dd0:	429c      	cmp	r4, r3
 8000dd2:	d201      	bcs.n	8000dd8 <esp8266_find_stream+0x30>
 8000dd4:	3401      	adds	r4, #1
 8000dd6:	e004      	b.n	8000de2 <esp8266_find_stream+0x3a>
 8000dd8:	f000 fb2e 	bl	8001438 <uart_clear_buffer>
 8000ddc:	2001      	movs	r0, #1
 8000dde:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000de0:	2400      	movs	r4, #0
 8000de2:	f001 f8ad 	bl	8001f40 <timer_get_time>
 8000de6:	42a8      	cmp	r0, r5
 8000de8:	d3e8      	bcc.n	8000dbc <esp8266_find_stream+0x14>
 8000dea:	f000 fb25 	bl	8001438 <uart_clear_buffer>
 8000dee:	2000      	movs	r0, #0
 8000df0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

08000df4 <esp8266_init>:
 8000df4:	b510      	push	{r4, lr}
 8000df6:	4604      	mov	r4, r0
 8000df8:	f640 30b8 	movw	r0, #3000	; 0xbb8
 8000dfc:	f001 f8ae 	bl	8001f5c <timer_delay_ms>
 8000e00:	b10c      	cbz	r4, 8000e06 <esp8266_init+0x12>
 8000e02:	4818      	ldr	r0, [pc, #96]	; (8000e64 <esp8266_init+0x70>)
 8000e04:	e000      	b.n	8000e08 <esp8266_init+0x14>
 8000e06:	4818      	ldr	r0, [pc, #96]	; (8000e68 <esp8266_init+0x74>)
 8000e08:	f7ff ffae 	bl	8000d68 <esp8266_send>
 8000e0c:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000e10:	f001 f8a4 	bl	8001f5c <timer_delay_ms>
 8000e14:	4815      	ldr	r0, [pc, #84]	; (8000e6c <esp8266_init+0x78>)
 8000e16:	f7ff ffa7 	bl	8000d68 <esp8266_send>
 8000e1a:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000e1e:	f001 f89d 	bl	8001f5c <timer_delay_ms>
 8000e22:	4813      	ldr	r0, [pc, #76]	; (8000e70 <esp8266_init+0x7c>)
 8000e24:	f7ff ffa0 	bl	8000d68 <esp8266_send>
 8000e28:	4812      	ldr	r0, [pc, #72]	; (8000e74 <esp8266_init+0x80>)
 8000e2a:	f7ff ff9d 	bl	8000d68 <esp8266_send>
 8000e2e:	4812      	ldr	r0, [pc, #72]	; (8000e78 <esp8266_init+0x84>)
 8000e30:	f7ff ff9a 	bl	8000d68 <esp8266_send>
 8000e34:	4811      	ldr	r0, [pc, #68]	; (8000e7c <esp8266_init+0x88>)
 8000e36:	f7ff ff97 	bl	8000d68 <esp8266_send>
 8000e3a:	4811      	ldr	r0, [pc, #68]	; (8000e80 <esp8266_init+0x8c>)
 8000e3c:	f7ff ff94 	bl	8000d68 <esp8266_send>
 8000e40:	4810      	ldr	r0, [pc, #64]	; (8000e84 <esp8266_init+0x90>)
 8000e42:	2102      	movs	r1, #2
 8000e44:	f644 6220 	movw	r2, #20000	; 0x4e20
 8000e48:	f7ff ffae 	bl	8000da8 <esp8266_find_stream>
 8000e4c:	b140      	cbz	r0, 8000e60 <esp8266_init+0x6c>
 8000e4e:	b12c      	cbz	r4, 8000e5c <esp8266_init+0x68>
 8000e50:	480d      	ldr	r0, [pc, #52]	; (8000e88 <esp8266_init+0x94>)
 8000e52:	f7ff ff89 	bl	8000d68 <esp8266_send>
 8000e56:	20c8      	movs	r0, #200	; 0xc8
 8000e58:	f001 f880 	bl	8001f5c <timer_delay_ms>
 8000e5c:	2000      	movs	r0, #0
 8000e5e:	bd10      	pop	{r4, pc}
 8000e60:	2002      	movs	r0, #2
 8000e62:	bd10      	pop	{r4, pc}
 8000e64:	080021f9 	.word	0x080021f9
 8000e68:	08002207 	.word	0x08002207
 8000e6c:	08002215 	.word	0x08002215
 8000e70:	08002223 	.word	0x08002223
 8000e74:	0800222e 	.word	0x0800222e
 8000e78:	0800226c 	.word	0x0800226c
 8000e7c:	0800223b 	.word	0x0800223b
 8000e80:	08002244 	.word	0x08002244
 8000e84:	08002294 	.word	0x08002294
 8000e88:	08002248 	.word	0x08002248

08000e8c <esp8266_uninit>:
 8000e8c:	4770      	bx	lr

08000e8e <esp8266_get_nonblocking>:
 8000e8e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000e90:	4606      	mov	r6, r0
 8000e92:	460f      	mov	r7, r1
 8000e94:	4615      	mov	r5, r2
 8000e96:	2300      	movs	r3, #0
 8000e98:	42bb      	cmp	r3, r7
 8000e9a:	f04f 0400 	mov.w	r4, #0
 8000e9e:	d002      	beq.n	8000ea6 <esp8266_get_nonblocking+0x18>
 8000ea0:	54f4      	strb	r4, [r6, r3]
 8000ea2:	3301      	adds	r3, #1
 8000ea4:	e7f8      	b.n	8000e98 <esp8266_get_nonblocking+0xa>
 8000ea6:	f001 f84b 	bl	8001f40 <timer_get_time>
 8000eaa:	4405      	add	r5, r0
 8000eac:	f000 fa16 	bl	80012dc <uart_is_char>
 8000eb0:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000eb4:	4298      	cmp	r0, r3
 8000eb6:	bf1c      	itt	ne
 8000eb8:	5530      	strbne	r0, [r6, r4]
 8000eba:	3401      	addne	r4, #1
 8000ebc:	f001 f840 	bl	8001f40 <timer_get_time>
 8000ec0:	42bc      	cmp	r4, r7
 8000ec2:	d207      	bcs.n	8000ed4 <esp8266_get_nonblocking+0x46>
 8000ec4:	4285      	cmp	r5, r0
 8000ec6:	d8f1      	bhi.n	8000eac <esp8266_get_nonblocking+0x1e>
 8000ec8:	42a8      	cmp	r0, r5
 8000eca:	bf94      	ite	ls
 8000ecc:	4620      	movls	r0, r4
 8000ece:	f04f 30ff 	movhi.w	r0, #4294967295
 8000ed2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000ed4:	42a8      	cmp	r0, r5
 8000ed6:	bf8c      	ite	hi
 8000ed8:	f04f 30ff 	movhi.w	r0, #4294967295
 8000edc:	f06f 0001 	mvnls.w	r0, #1
 8000ee0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

08000ee4 <esp8266_connect>:
 8000ee4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000ee6:	4606      	mov	r6, r0
 8000ee8:	4839      	ldr	r0, [pc, #228]	; (8000fd0 <esp8266_connect+0xec>)
 8000eea:	460f      	mov	r7, r1
 8000eec:	4614      	mov	r4, r2
 8000eee:	461d      	mov	r5, r3
 8000ef0:	f7ff ff3a 	bl	8000d68 <esp8266_send>
 8000ef4:	4630      	mov	r0, r6
 8000ef6:	f7ff ff37 	bl	8000d68 <esp8266_send>
 8000efa:	4836      	ldr	r0, [pc, #216]	; (8000fd4 <esp8266_connect+0xf0>)
 8000efc:	f7ff ff34 	bl	8000d68 <esp8266_send>
 8000f00:	4638      	mov	r0, r7
 8000f02:	f7ff ff3a 	bl	8000d7a <esp8266_send_uint>
 8000f06:	4834      	ldr	r0, [pc, #208]	; (8000fd8 <esp8266_connect+0xf4>)
 8000f08:	f7ff ff2e 	bl	8000d68 <esp8266_send>
 8000f0c:	4833      	ldr	r0, [pc, #204]	; (8000fdc <esp8266_connect+0xf8>)
 8000f0e:	2107      	movs	r1, #7
 8000f10:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 8000f14:	f7ff ff48 	bl	8000da8 <esp8266_find_stream>
 8000f18:	2800      	cmp	r0, #0
 8000f1a:	d056      	beq.n	8000fca <esp8266_connect+0xe6>
 8000f1c:	4830      	ldr	r0, [pc, #192]	; (8000fe0 <esp8266_connect+0xfc>)
 8000f1e:	f7ff ff23 	bl	8000d68 <esp8266_send>
 8000f22:	4628      	mov	r0, r5
 8000f24:	f7ff ff29 	bl	8000d7a <esp8266_send_uint>
 8000f28:	482b      	ldr	r0, [pc, #172]	; (8000fd8 <esp8266_connect+0xf4>)
 8000f2a:	f7ff ff1d 	bl	8000d68 <esp8266_send>
 8000f2e:	482d      	ldr	r0, [pc, #180]	; (8000fe4 <esp8266_connect+0x100>)
 8000f30:	2101      	movs	r1, #1
 8000f32:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 8000f36:	f7ff ff37 	bl	8000da8 <esp8266_find_stream>
 8000f3a:	b108      	cbz	r0, 8000f40 <esp8266_connect+0x5c>
 8000f3c:	4425      	add	r5, r4
 8000f3e:	e007      	b.n	8000f50 <esp8266_connect+0x6c>
 8000f40:	4829      	ldr	r0, [pc, #164]	; (8000fe8 <esp8266_connect+0x104>)
 8000f42:	f7ff ff11 	bl	8000d68 <esp8266_send>
 8000f46:	2064      	movs	r0, #100	; 0x64
 8000f48:	f001 f808 	bl	8001f5c <timer_delay_ms>
 8000f4c:	2004      	movs	r0, #4
 8000f4e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000f50:	42ac      	cmp	r4, r5
 8000f52:	d004      	beq.n	8000f5e <esp8266_connect+0x7a>
 8000f54:	f814 0b01 	ldrb.w	r0, [r4], #1
 8000f58:	f000 f9b6 	bl	80012c8 <uart_write>
 8000f5c:	e7f8      	b.n	8000f50 <esp8266_connect+0x6c>
 8000f5e:	4823      	ldr	r0, [pc, #140]	; (8000fec <esp8266_connect+0x108>)
 8000f60:	2107      	movs	r1, #7
 8000f62:	2264      	movs	r2, #100	; 0x64
 8000f64:	f7ff ff20 	bl	8000da8 <esp8266_find_stream>
 8000f68:	b938      	cbnz	r0, 8000f7a <esp8266_connect+0x96>
 8000f6a:	481f      	ldr	r0, [pc, #124]	; (8000fe8 <esp8266_connect+0x104>)
 8000f6c:	f7ff fefc 	bl	8000d68 <esp8266_send>
 8000f70:	2064      	movs	r0, #100	; 0x64
 8000f72:	f000 fff3 	bl	8001f5c <timer_delay_ms>
 8000f76:	2005      	movs	r0, #5
 8000f78:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000f7a:	481d      	ldr	r0, [pc, #116]	; (8000ff0 <esp8266_connect+0x10c>)
 8000f7c:	2105      	movs	r1, #5
 8000f7e:	2264      	movs	r2, #100	; 0x64
 8000f80:	f7ff ff12 	bl	8000da8 <esp8266_find_stream>
 8000f84:	b108      	cbz	r0, 8000f8a <esp8266_connect+0xa6>
 8000f86:	2400      	movs	r4, #0
 8000f88:	e007      	b.n	8000f9a <esp8266_connect+0xb6>
 8000f8a:	4817      	ldr	r0, [pc, #92]	; (8000fe8 <esp8266_connect+0x104>)
 8000f8c:	f7ff feec 	bl	8000d68 <esp8266_send>
 8000f90:	2064      	movs	r0, #100	; 0x64
 8000f92:	f000 ffe3 	bl	8001f5c <timer_delay_ms>
 8000f96:	2006      	movs	r0, #6
 8000f98:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000f9a:	f000 f9bb 	bl	8001314 <uart_read>
 8000f9e:	283a      	cmp	r0, #58	; 0x3a
 8000fa0:	d004      	beq.n	8000fac <esp8266_connect+0xc8>
 8000fa2:	230a      	movs	r3, #10
 8000fa4:	fb03 0404 	mla	r4, r3, r4, r0
 8000fa8:	3c30      	subs	r4, #48	; 0x30
 8000faa:	e7f6      	b.n	8000f9a <esp8266_connect+0xb6>
 8000fac:	9907      	ldr	r1, [sp, #28]
 8000fae:	9806      	ldr	r0, [sp, #24]
 8000fb0:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 8000fb4:	f7ff ff6b 	bl	8000e8e <esp8266_get_nonblocking>
 8000fb8:	480b      	ldr	r0, [pc, #44]	; (8000fe8 <esp8266_connect+0x104>)
 8000fba:	f7ff fed5 	bl	8000d68 <esp8266_send>
 8000fbe:	2064      	movs	r0, #100	; 0x64
 8000fc0:	f000 ffcc 	bl	8001f5c <timer_delay_ms>
 8000fc4:	f504 707a 	add.w	r0, r4, #1000	; 0x3e8
 8000fc8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000fca:	2003      	movs	r0, #3
 8000fcc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000fce:	bf00      	nop
 8000fd0:	0800225c 	.word	0x0800225c
 8000fd4:	08002270 	.word	0x08002270
 8000fd8:	08002245 	.word	0x08002245
 8000fdc:	08002294 	.word	0x08002294
 8000fe0:	08002273 	.word	0x08002273
 8000fe4:	0800227f 	.word	0x0800227f
 8000fe8:	08002281 	.word	0x08002281
 8000fec:	0800228f 	.word	0x0800228f
 8000ff0:	08002297 	.word	0x08002297

08000ff4 <main_thread>:
 8000ff4:	b508      	push	{r3, lr}
 8000ff6:	481f      	ldr	r0, [pc, #124]	; (8001074 <main_thread+0x80>)
 8000ff8:	f7ff fa76 	bl	80004e8 <printf_>
 8000ffc:	f44f 7096 	mov.w	r0, #300	; 0x12c
 8001000:	f000 ffac 	bl	8001f5c <timer_delay_ms>
 8001004:	f000 f84a 	bl	800109c <device_wake_up>
 8001008:	491b      	ldr	r1, [pc, #108]	; (8001078 <main_thread+0x84>)
 800100a:	481c      	ldr	r0, [pc, #112]	; (800107c <main_thread+0x88>)
 800100c:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001010:	2306      	movs	r3, #6
 8001012:	f7ff f94f 	bl	80002b4 <create_thread>
 8001016:	491a      	ldr	r1, [pc, #104]	; (8001080 <main_thread+0x8c>)
 8001018:	481a      	ldr	r0, [pc, #104]	; (8001084 <main_thread+0x90>)
 800101a:	f44f 7200 	mov.w	r2, #512	; 0x200
 800101e:	2306      	movs	r3, #6
 8001020:	f7ff f948 	bl	80002b4 <create_thread>
 8001024:	4818      	ldr	r0, [pc, #96]	; (8001088 <main_thread+0x94>)
 8001026:	4919      	ldr	r1, [pc, #100]	; (800108c <main_thread+0x98>)
 8001028:	f44f 7200 	mov.w	r2, #512	; 0x200
 800102c:	2306      	movs	r3, #6
 800102e:	f7ff f941 	bl	80002b4 <create_thread>
 8001032:	f44f 7016 	mov.w	r0, #600	; 0x258
 8001036:	f000 ff91 	bl	8001f5c <timer_delay_ms>
 800103a:	f001 f8b5 	bl	80021a8 <get_key>
 800103e:	b980      	cbnz	r0, 8001062 <main_thread+0x6e>
 8001040:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001044:	f001 f826 	bl	8002094 <led_on>
 8001048:	2064      	movs	r0, #100	; 0x64
 800104a:	f000 ff87 	bl	8001f5c <timer_delay_ms>
 800104e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001052:	f001 f835 	bl	80020c0 <led_off>
 8001056:	20c8      	movs	r0, #200	; 0xc8
 8001058:	f000 ff80 	bl	8001f5c <timer_delay_ms>
 800105c:	f000 f818 	bl	8001090 <device_sleep>
 8001060:	e7eb      	b.n	800103a <main_thread+0x46>
 8001062:	f000 f81b 	bl	800109c <device_wake_up>
 8001066:	f44f 7016 	mov.w	r0, #600	; 0x258
 800106a:	f000 ff77 	bl	8001f5c <timer_delay_ms>
 800106e:	f000 f8ef 	bl	8001250 <motors_test>
 8001072:	e7e2      	b.n	800103a <main_thread+0x46>
 8001074:	0800229d 	.word	0x0800229d
 8001078:	20000278 	.word	0x20000278
 800107c:	08001119 	.word	0x08001119
 8001080:	20000034 	.word	0x20000034
 8001084:	080010a9 	.word	0x080010a9
 8001088:	08001185 	.word	0x08001185
 800108c:	20000480 	.word	0x20000480

08001090 <device_sleep>:
 8001090:	4b01      	ldr	r3, [pc, #4]	; (8001098 <device_sleep+0x8>)
 8001092:	22ff      	movs	r2, #255	; 0xff
 8001094:	701a      	strb	r2, [r3, #0]
 8001096:	4770      	bx	lr
 8001098:	20000030 	.word	0x20000030

0800109c <device_wake_up>:
 800109c:	4b01      	ldr	r3, [pc, #4]	; (80010a4 <device_wake_up+0x8>)
 800109e:	2200      	movs	r2, #0
 80010a0:	701a      	strb	r2, [r3, #0]
 80010a2:	4770      	bx	lr
 80010a4:	20000030 	.word	0x20000030

080010a8 <device_i2c_thread>:
 80010a8:	b510      	push	{r4, lr}
 80010aa:	2000      	movs	r0, #0
 80010ac:	210a      	movs	r1, #10
 80010ae:	f000 ff65 	bl	8001f7c <event_timer_set_period>
 80010b2:	2300      	movs	r3, #0
 80010b4:	2b01      	cmp	r3, #1
 80010b6:	d01e      	beq.n	80010f6 <device_i2c_thread+0x4e>
 80010b8:	d30f      	bcc.n	80010da <device_i2c_thread+0x32>
 80010ba:	2b00      	cmp	r3, #0
 80010bc:	d0fa      	beq.n	80010b4 <device_i2c_thread+0xc>
 80010be:	f7ff fad6 	bl	800066e <lsm9ds0_uninit>
 80010c2:	f7ff fded 	bl	8000ca0 <motors_uninit>
 80010c6:	2064      	movs	r0, #100	; 0x64
 80010c8:	f000 ff48 	bl	8001f5c <timer_delay_ms>
 80010cc:	4b11      	ldr	r3, [pc, #68]	; (8001114 <device_i2c_thread+0x6c>)
 80010ce:	781b      	ldrb	r3, [r3, #0]
 80010d0:	2b00      	cmp	r3, #0
 80010d2:	bf14      	ite	ne
 80010d4:	2302      	movne	r3, #2
 80010d6:	2300      	moveq	r3, #0
 80010d8:	e7ec      	b.n	80010b4 <device_i2c_thread+0xc>
 80010da:	f7ff fb59 	bl	8000790 <lsm9ds0_init>
 80010de:	4604      	mov	r4, r0
 80010e0:	f7ff fe36 	bl	8000d50 <motors_init>
 80010e4:	b13c      	cbz	r4, 80010f6 <device_i2c_thread+0x4e>
 80010e6:	f7ff fac2 	bl	800066e <lsm9ds0_uninit>
 80010ea:	f7ff fdd9 	bl	8000ca0 <motors_uninit>
 80010ee:	2002      	movs	r0, #2
 80010f0:	4621      	mov	r1, r4
 80010f2:	f000 f88d 	bl	8001210 <abort_error_>
 80010f6:	2000      	movs	r0, #0
 80010f8:	f000 ff56 	bl	8001fa8 <event_timer_wait>
 80010fc:	f7ff faca 	bl	8000694 <lsm9ds0_read>
 8001100:	f7ff fddc 	bl	8000cbc <motors_update>
 8001104:	4b03      	ldr	r3, [pc, #12]	; (8001114 <device_i2c_thread+0x6c>)
 8001106:	781b      	ldrb	r3, [r3, #0]
 8001108:	2b00      	cmp	r3, #0
 800110a:	d0f4      	beq.n	80010f6 <device_i2c_thread+0x4e>
 800110c:	2302      	movs	r3, #2
 800110e:	2b01      	cmp	r3, #1
 8001110:	e7d2      	b.n	80010b8 <device_i2c_thread+0x10>
 8001112:	bf00      	nop
 8001114:	20000030 	.word	0x20000030

08001118 <device_rgb_sensors_thread>:
 8001118:	b510      	push	{r4, lr}
 800111a:	2001      	movs	r0, #1
 800111c:	210a      	movs	r1, #10
 800111e:	f000 ff2d 	bl	8001f7c <event_timer_set_period>
 8001122:	2400      	movs	r4, #0
 8001124:	2001      	movs	r0, #1
 8001126:	f000 ff3f 	bl	8001fa8 <event_timer_wait>
 800112a:	f7ff fccb 	bl	8000ac4 <rgb_sensor_read>
 800112e:	2c01      	cmp	r4, #1
 8001130:	d01a      	beq.n	8001168 <device_rgb_sensors_thread+0x50>
 8001132:	d30d      	bcc.n	8001150 <device_rgb_sensors_thread+0x38>
 8001134:	2c02      	cmp	r4, #2
 8001136:	d1f5      	bne.n	8001124 <device_rgb_sensors_thread+0xc>
 8001138:	f7ff fcb8 	bl	8000aac <rgb_sensor_uninit>
 800113c:	2064      	movs	r0, #100	; 0x64
 800113e:	f000 ff0d 	bl	8001f5c <timer_delay_ms>
 8001142:	4b0f      	ldr	r3, [pc, #60]	; (8001180 <device_rgb_sensors_thread+0x68>)
 8001144:	781c      	ldrb	r4, [r3, #0]
 8001146:	2c00      	cmp	r4, #0
 8001148:	bf14      	ite	ne
 800114a:	2402      	movne	r4, #2
 800114c:	2400      	moveq	r4, #0
 800114e:	e7e9      	b.n	8001124 <device_rgb_sensors_thread+0xc>
 8001150:	f7ff fd64 	bl	8000c1c <rgb_sensor_init>
 8001154:	4604      	mov	r4, r0
 8001156:	b128      	cbz	r0, 8001164 <device_rgb_sensors_thread+0x4c>
 8001158:	f7ff fca8 	bl	8000aac <rgb_sensor_uninit>
 800115c:	2001      	movs	r0, #1
 800115e:	4621      	mov	r1, r4
 8001160:	f000 f856 	bl	8001210 <abort_error_>
 8001164:	2401      	movs	r4, #1
 8001166:	e7dd      	b.n	8001124 <device_rgb_sensors_thread+0xc>
 8001168:	4620      	mov	r0, r4
 800116a:	f000 ff1d 	bl	8001fa8 <event_timer_wait>
 800116e:	f7ff fca9 	bl	8000ac4 <rgb_sensor_read>
 8001172:	4b03      	ldr	r3, [pc, #12]	; (8001180 <device_rgb_sensors_thread+0x68>)
 8001174:	781b      	ldrb	r3, [r3, #0]
 8001176:	2b00      	cmp	r3, #0
 8001178:	d0f4      	beq.n	8001164 <device_rgb_sensors_thread+0x4c>
 800117a:	2402      	movs	r4, #2
 800117c:	e7d2      	b.n	8001124 <device_rgb_sensors_thread+0xc>
 800117e:	bf00      	nop
 8001180:	20000030 	.word	0x20000030

08001184 <device_wifi_thread>:
 8001184:	b570      	push	{r4, r5, r6, lr}
 8001186:	4b1f      	ldr	r3, [pc, #124]	; (8001204 <device_wifi_thread+0x80>)
 8001188:	b0a6      	sub	sp, #152	; 0x98
 800118a:	ac02      	add	r4, sp, #8
 800118c:	f103 0210 	add.w	r2, r3, #16
 8001190:	4626      	mov	r6, r4
 8001192:	6818      	ldr	r0, [r3, #0]
 8001194:	6859      	ldr	r1, [r3, #4]
 8001196:	4625      	mov	r5, r4
 8001198:	c503      	stmia	r5!, {r0, r1}
 800119a:	3308      	adds	r3, #8
 800119c:	4293      	cmp	r3, r2
 800119e:	462c      	mov	r4, r5
 80011a0:	d1f7      	bne.n	8001192 <device_wifi_thread+0xe>
 80011a2:	4630      	mov	r0, r6
 80011a4:	f7ff f91f 	bl	80003e6 <strlen_>
 80011a8:	2100      	movs	r1, #0
 80011aa:	4605      	mov	r5, r0
 80011ac:	2901      	cmp	r1, #1
 80011ae:	d01c      	beq.n	80011ea <device_wifi_thread+0x66>
 80011b0:	d30d      	bcc.n	80011ce <device_wifi_thread+0x4a>
 80011b2:	2900      	cmp	r1, #0
 80011b4:	d0fa      	beq.n	80011ac <device_wifi_thread+0x28>
 80011b6:	f7ff fe69 	bl	8000e8c <esp8266_uninit>
 80011ba:	2064      	movs	r0, #100	; 0x64
 80011bc:	f000 fece 	bl	8001f5c <timer_delay_ms>
 80011c0:	4b11      	ldr	r3, [pc, #68]	; (8001208 <device_wifi_thread+0x84>)
 80011c2:	7819      	ldrb	r1, [r3, #0]
 80011c4:	2900      	cmp	r1, #0
 80011c6:	bf14      	ite	ne
 80011c8:	2102      	movne	r1, #2
 80011ca:	2100      	moveq	r1, #0
 80011cc:	e7ee      	b.n	80011ac <device_wifi_thread+0x28>
 80011ce:	2001      	movs	r0, #1
 80011d0:	f000 ff60 	bl	8002094 <led_on>
 80011d4:	2000      	movs	r0, #0
 80011d6:	f7ff fe0d 	bl	8000df4 <esp8266_init>
 80011da:	4604      	mov	r4, r0
 80011dc:	b128      	cbz	r0, 80011ea <device_wifi_thread+0x66>
 80011de:	f7ff fe55 	bl	8000e8c <esp8266_uninit>
 80011e2:	2003      	movs	r0, #3
 80011e4:	4621      	mov	r1, r4
 80011e6:	f000 f813 	bl	8001210 <abort_error_>
 80011ea:	ab06      	add	r3, sp, #24
 80011ec:	9300      	str	r3, [sp, #0]
 80011ee:	2380      	movs	r3, #128	; 0x80
 80011f0:	9301      	str	r3, [sp, #4]
 80011f2:	f240 71da 	movw	r1, #2010	; 0x7da
 80011f6:	4632      	mov	r2, r6
 80011f8:	462b      	mov	r3, r5
 80011fa:	4804      	ldr	r0, [pc, #16]	; (800120c <device_wifi_thread+0x88>)
 80011fc:	f7ff fe72 	bl	8000ee4 <esp8266_connect>
 8001200:	e7f3      	b.n	80011ea <device_wifi_thread+0x66>
 8001202:	bf00      	nop
 8001204:	080022e4 	.word	0x080022e4
 8001208:	20000030 	.word	0x20000030
 800120c:	080022d8 	.word	0x080022d8

08001210 <abort_error_>:
 8001210:	b570      	push	{r4, r5, r6, lr}
 8001212:	4605      	mov	r5, r0
 8001214:	460e      	mov	r6, r1
 8001216:	480d      	ldr	r0, [pc, #52]	; (800124c <abort_error_+0x3c>)
 8001218:	4629      	mov	r1, r5
 800121a:	4632      	mov	r2, r6
 800121c:	f7ff f964 	bl	80004e8 <printf_>
 8001220:	2408      	movs	r4, #8
 8001222:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001226:	f000 ff35 	bl	8002094 <led_on>
 800122a:	201e      	movs	r0, #30
 800122c:	f000 fe96 	bl	8001f5c <timer_delay_ms>
 8001230:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001234:	f000 ff44 	bl	80020c0 <led_off>
 8001238:	2046      	movs	r0, #70	; 0x46
 800123a:	f000 fe8f 	bl	8001f5c <timer_delay_ms>
 800123e:	3c01      	subs	r4, #1
 8001240:	d1ef      	bne.n	8001222 <abort_error_+0x12>
 8001242:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8001246:	f000 fe89 	bl	8001f5c <timer_delay_ms>
 800124a:	e7e4      	b.n	8001216 <abort_error_+0x6>
 800124c:	080022f4 	.word	0x080022f4

08001250 <motors_test>:
 8001250:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001252:	4c1c      	ldr	r4, [pc, #112]	; (80012c4 <motors_test+0x74>)
 8001254:	2500      	movs	r5, #0
 8001256:	273f      	movs	r7, #63	; 0x3f
 8001258:	f44f 7048 	mov.w	r0, #800	; 0x320
 800125c:	f06f 063e 	mvn.w	r6, #62	; 0x3e
 8001260:	6027      	str	r7, [r4, #0]
 8001262:	6065      	str	r5, [r4, #4]
 8001264:	f000 fe7a 	bl	8001f5c <timer_delay_ms>
 8001268:	f44f 7048 	mov.w	r0, #800	; 0x320
 800126c:	6026      	str	r6, [r4, #0]
 800126e:	6065      	str	r5, [r4, #4]
 8001270:	f000 fe74 	bl	8001f5c <timer_delay_ms>
 8001274:	f44f 7048 	mov.w	r0, #800	; 0x320
 8001278:	e884 00a0 	stmia.w	r4, {r5, r7}
 800127c:	f000 fe6e 	bl	8001f5c <timer_delay_ms>
 8001280:	f44f 7048 	mov.w	r0, #800	; 0x320
 8001284:	e884 0060 	stmia.w	r4, {r5, r6}
 8001288:	f000 fe68 	bl	8001f5c <timer_delay_ms>
 800128c:	231f      	movs	r3, #31
 800128e:	f44f 7048 	mov.w	r0, #800	; 0x320
 8001292:	6023      	str	r3, [r4, #0]
 8001294:	6063      	str	r3, [r4, #4]
 8001296:	f000 fe61 	bl	8001f5c <timer_delay_ms>
 800129a:	f06f 031e 	mvn.w	r3, #30
 800129e:	f44f 7048 	mov.w	r0, #800	; 0x320
 80012a2:	6023      	str	r3, [r4, #0]
 80012a4:	6063      	str	r3, [r4, #4]
 80012a6:	f000 fe59 	bl	8001f5c <timer_delay_ms>
 80012aa:	2064      	movs	r0, #100	; 0x64
 80012ac:	6027      	str	r7, [r4, #0]
 80012ae:	6067      	str	r7, [r4, #4]
 80012b0:	f000 fe54 	bl	8001f5c <timer_delay_ms>
 80012b4:	2064      	movs	r0, #100	; 0x64
 80012b6:	6026      	str	r6, [r4, #0]
 80012b8:	6066      	str	r6, [r4, #4]
 80012ba:	f000 fe4f 	bl	8001f5c <timer_delay_ms>
 80012be:	6025      	str	r5, [r4, #0]
 80012c0:	6065      	str	r5, [r4, #4]
 80012c2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80012c4:	20000478 	.word	0x20000478

080012c8 <uart_write>:
 80012c8:	4b03      	ldr	r3, [pc, #12]	; (80012d8 <uart_write+0x10>)
 80012ca:	69da      	ldr	r2, [r3, #28]
 80012cc:	0612      	lsls	r2, r2, #24
 80012ce:	d401      	bmi.n	80012d4 <uart_write+0xc>
 80012d0:	bf00      	nop
 80012d2:	e7f9      	b.n	80012c8 <uart_write>
 80012d4:	8518      	strh	r0, [r3, #40]	; 0x28
 80012d6:	4770      	bx	lr
 80012d8:	40013800 	.word	0x40013800

080012dc <uart_is_char>:
 80012dc:	4b0a      	ldr	r3, [pc, #40]	; (8001308 <uart_is_char+0x2c>)
 80012de:	4a0b      	ldr	r2, [pc, #44]	; (800130c <uart_is_char+0x30>)
 80012e0:	6819      	ldr	r1, [r3, #0]
 80012e2:	6812      	ldr	r2, [r2, #0]
 80012e4:	4291      	cmp	r1, r2
 80012e6:	d00c      	beq.n	8001302 <uart_is_char+0x26>
 80012e8:	681a      	ldr	r2, [r3, #0]
 80012ea:	4909      	ldr	r1, [pc, #36]	; (8001310 <uart_is_char+0x34>)
 80012ec:	5c88      	ldrb	r0, [r1, r2]
 80012ee:	681a      	ldr	r2, [r3, #0]
 80012f0:	3201      	adds	r2, #1
 80012f2:	601a      	str	r2, [r3, #0]
 80012f4:	681a      	ldr	r2, [r3, #0]
 80012f6:	2a0f      	cmp	r2, #15
 80012f8:	b2c0      	uxtb	r0, r0
 80012fa:	d904      	bls.n	8001306 <uart_is_char+0x2a>
 80012fc:	2200      	movs	r2, #0
 80012fe:	601a      	str	r2, [r3, #0]
 8001300:	4770      	bx	lr
 8001302:	f64f 70ff 	movw	r0, #65535	; 0xffff
 8001306:	4770      	bx	lr
 8001308:	200009cc 	.word	0x200009cc
 800130c:	200009c8 	.word	0x200009c8
 8001310:	200009b8 	.word	0x200009b8

08001314 <uart_read>:
 8001314:	b508      	push	{r3, lr}
 8001316:	f7ff ffe1 	bl	80012dc <uart_is_char>
 800131a:	f64f 73ff 	movw	r3, #65535	; 0xffff
 800131e:	4298      	cmp	r0, r3
 8001320:	d101      	bne.n	8001326 <uart_read+0x12>
 8001322:	bf00      	nop
 8001324:	e7f7      	b.n	8001316 <uart_read+0x2>
 8001326:	b2c0      	uxtb	r0, r0
 8001328:	bd08      	pop	{r3, pc}
	...

0800132c <uart_init>:
 800132c:	b530      	push	{r4, r5, lr}
 800132e:	4b2c      	ldr	r3, [pc, #176]	; (80013e0 <uart_init+0xb4>)
 8001330:	4d2c      	ldr	r5, [pc, #176]	; (80013e4 <uart_init+0xb8>)
 8001332:	2400      	movs	r4, #0
 8001334:	601c      	str	r4, [r3, #0]
 8001336:	4b2c      	ldr	r3, [pc, #176]	; (80013e8 <uart_init+0xbc>)
 8001338:	b08b      	sub	sp, #44	; 0x2c
 800133a:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 800133e:	2101      	movs	r1, #1
 8001340:	601c      	str	r4, [r3, #0]
 8001342:	f000 fcf7 	bl	8001d34 <RCC_AHBPeriphClockCmd>
 8001346:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 800134a:	2101      	movs	r1, #1
 800134c:	f000 fd00 	bl	8001d50 <RCC_APB2PeriphClockCmd>
 8001350:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001354:	9302      	str	r3, [sp, #8]
 8001356:	2302      	movs	r3, #2
 8001358:	f88d 300c 	strb.w	r3, [sp, #12]
 800135c:	a902      	add	r1, sp, #8
 800135e:	2303      	movs	r3, #3
 8001360:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001364:	f88d 300d 	strb.w	r3, [sp, #13]
 8001368:	f88d 400e 	strb.w	r4, [sp, #14]
 800136c:	f88d 400f 	strb.w	r4, [sp, #15]
 8001370:	f000 fe2c 	bl	8001fcc <GPIO_Init>
 8001374:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001378:	2109      	movs	r1, #9
 800137a:	2207      	movs	r2, #7
 800137c:	f000 fe74 	bl	8002068 <GPIO_PinAFConfig>
 8001380:	2207      	movs	r2, #7
 8001382:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001386:	210a      	movs	r1, #10
 8001388:	f000 fe6e 	bl	8002068 <GPIO_PinAFConfig>
 800138c:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001390:	9304      	str	r3, [sp, #16]
 8001392:	4628      	mov	r0, r5
 8001394:	230c      	movs	r3, #12
 8001396:	a904      	add	r1, sp, #16
 8001398:	9308      	str	r3, [sp, #32]
 800139a:	9405      	str	r4, [sp, #20]
 800139c:	9406      	str	r4, [sp, #24]
 800139e:	9407      	str	r4, [sp, #28]
 80013a0:	9409      	str	r4, [sp, #36]	; 0x24
 80013a2:	f000 f855 	bl	8001450 <USART_Init>
 80013a6:	4628      	mov	r0, r5
 80013a8:	2101      	movs	r1, #1
 80013aa:	f000 f8b3 	bl	8001514 <USART_Cmd>
 80013ae:	2201      	movs	r2, #1
 80013b0:	4628      	mov	r0, r5
 80013b2:	490e      	ldr	r1, [pc, #56]	; (80013ec <uart_init+0xc0>)
 80013b4:	f000 f8be 	bl	8001534 <USART_ITConfig>
 80013b8:	2325      	movs	r3, #37	; 0x25
 80013ba:	f88d 4005 	strb.w	r4, [sp, #5]
 80013be:	f88d 4006 	strb.w	r4, [sp, #6]
 80013c2:	a801      	add	r0, sp, #4
 80013c4:	2401      	movs	r4, #1
 80013c6:	f88d 3004 	strb.w	r3, [sp, #4]
 80013ca:	f88d 4007 	strb.w	r4, [sp, #7]
 80013ce:	f000 f8ff 	bl	80015d0 <NVIC_Init>
 80013d2:	4628      	mov	r0, r5
 80013d4:	4621      	mov	r1, r4
 80013d6:	f000 f89d 	bl	8001514 <USART_Cmd>
 80013da:	b00b      	add	sp, #44	; 0x2c
 80013dc:	bd30      	pop	{r4, r5, pc}
 80013de:	bf00      	nop
 80013e0:	200009c8 	.word	0x200009c8
 80013e4:	40013800 	.word	0x40013800
 80013e8:	200009cc 	.word	0x200009cc
 80013ec:	00050105 	.word	0x00050105

080013f0 <USART1_IRQHandler>:
 80013f0:	b508      	push	{r3, lr}
 80013f2:	480d      	ldr	r0, [pc, #52]	; (8001428 <USART1_IRQHandler+0x38>)
 80013f4:	490d      	ldr	r1, [pc, #52]	; (800142c <USART1_IRQHandler+0x3c>)
 80013f6:	f000 f8b6 	bl	8001566 <USART_GetITStatus>
 80013fa:	b178      	cbz	r0, 800141c <USART1_IRQHandler+0x2c>
 80013fc:	480a      	ldr	r0, [pc, #40]	; (8001428 <USART1_IRQHandler+0x38>)
 80013fe:	f000 f894 	bl	800152a <USART_ReceiveData>
 8001402:	4b0b      	ldr	r3, [pc, #44]	; (8001430 <USART1_IRQHandler+0x40>)
 8001404:	490b      	ldr	r1, [pc, #44]	; (8001434 <USART1_IRQHandler+0x44>)
 8001406:	681a      	ldr	r2, [r3, #0]
 8001408:	b2c0      	uxtb	r0, r0
 800140a:	5488      	strb	r0, [r1, r2]
 800140c:	681a      	ldr	r2, [r3, #0]
 800140e:	3201      	adds	r2, #1
 8001410:	601a      	str	r2, [r3, #0]
 8001412:	681a      	ldr	r2, [r3, #0]
 8001414:	2a0f      	cmp	r2, #15
 8001416:	bf84      	itt	hi
 8001418:	2200      	movhi	r2, #0
 800141a:	601a      	strhi	r2, [r3, #0]
 800141c:	4802      	ldr	r0, [pc, #8]	; (8001428 <USART1_IRQHandler+0x38>)
 800141e:	4903      	ldr	r1, [pc, #12]	; (800142c <USART1_IRQHandler+0x3c>)
 8001420:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001424:	f000 b8be 	b.w	80015a4 <USART_ClearITPendingBit>
 8001428:	40013800 	.word	0x40013800
 800142c:	00050105 	.word	0x00050105
 8001430:	200009c8 	.word	0x200009c8
 8001434:	200009b8 	.word	0x200009b8

08001438 <uart_clear_buffer>:
 8001438:	b672      	cpsid	i
 800143a:	2300      	movs	r3, #0
 800143c:	4a03      	ldr	r2, [pc, #12]	; (800144c <uart_clear_buffer+0x14>)
 800143e:	2100      	movs	r1, #0
 8001440:	54d1      	strb	r1, [r2, r3]
 8001442:	3301      	adds	r3, #1
 8001444:	2b10      	cmp	r3, #16
 8001446:	d1f9      	bne.n	800143c <uart_clear_buffer+0x4>
 8001448:	b662      	cpsie	i
 800144a:	4770      	bx	lr
 800144c:	200009b8 	.word	0x200009b8

08001450 <USART_Init>:
 8001450:	b530      	push	{r4, r5, lr}
 8001452:	4604      	mov	r4, r0
 8001454:	b099      	sub	sp, #100	; 0x64
 8001456:	460d      	mov	r5, r1
 8001458:	bf00      	nop
 800145a:	bf00      	nop
 800145c:	bf00      	nop
 800145e:	bf00      	nop
 8001460:	bf00      	nop
 8001462:	bf00      	nop
 8001464:	bf00      	nop
 8001466:	6803      	ldr	r3, [r0, #0]
 8001468:	f023 0301 	bic.w	r3, r3, #1
 800146c:	6003      	str	r3, [r0, #0]
 800146e:	6842      	ldr	r2, [r0, #4]
 8001470:	688b      	ldr	r3, [r1, #8]
 8001472:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 8001476:	4313      	orrs	r3, r2
 8001478:	6043      	str	r3, [r0, #4]
 800147a:	686a      	ldr	r2, [r5, #4]
 800147c:	68eb      	ldr	r3, [r5, #12]
 800147e:	6801      	ldr	r1, [r0, #0]
 8001480:	431a      	orrs	r2, r3
 8001482:	692b      	ldr	r3, [r5, #16]
 8001484:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 8001488:	f021 010c 	bic.w	r1, r1, #12
 800148c:	4313      	orrs	r3, r2
 800148e:	430b      	orrs	r3, r1
 8001490:	6003      	str	r3, [r0, #0]
 8001492:	6882      	ldr	r2, [r0, #8]
 8001494:	696b      	ldr	r3, [r5, #20]
 8001496:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 800149a:	4313      	orrs	r3, r2
 800149c:	6083      	str	r3, [r0, #8]
 800149e:	a801      	add	r0, sp, #4
 80014a0:	f000 fabc 	bl	8001a1c <RCC_GetClocksFreq>
 80014a4:	4b17      	ldr	r3, [pc, #92]	; (8001504 <USART_Init+0xb4>)
 80014a6:	429c      	cmp	r4, r3
 80014a8:	d101      	bne.n	80014ae <USART_Init+0x5e>
 80014aa:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 80014ac:	e00e      	b.n	80014cc <USART_Init+0x7c>
 80014ae:	4b16      	ldr	r3, [pc, #88]	; (8001508 <USART_Init+0xb8>)
 80014b0:	429c      	cmp	r4, r3
 80014b2:	d101      	bne.n	80014b8 <USART_Init+0x68>
 80014b4:	9a10      	ldr	r2, [sp, #64]	; 0x40
 80014b6:	e009      	b.n	80014cc <USART_Init+0x7c>
 80014b8:	4b14      	ldr	r3, [pc, #80]	; (800150c <USART_Init+0xbc>)
 80014ba:	429c      	cmp	r4, r3
 80014bc:	d101      	bne.n	80014c2 <USART_Init+0x72>
 80014be:	9a11      	ldr	r2, [sp, #68]	; 0x44
 80014c0:	e004      	b.n	80014cc <USART_Init+0x7c>
 80014c2:	4b13      	ldr	r3, [pc, #76]	; (8001510 <USART_Init+0xc0>)
 80014c4:	429c      	cmp	r4, r3
 80014c6:	bf0c      	ite	eq
 80014c8:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 80014ca:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 80014cc:	6823      	ldr	r3, [r4, #0]
 80014ce:	6829      	ldr	r1, [r5, #0]
 80014d0:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 80014d4:	bf18      	it	ne
 80014d6:	0052      	lslne	r2, r2, #1
 80014d8:	fbb2 f3f1 	udiv	r3, r2, r1
 80014dc:	fb01 2213 	mls	r2, r1, r3, r2
 80014e0:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 80014e4:	6822      	ldr	r2, [r4, #0]
 80014e6:	bf28      	it	cs
 80014e8:	3301      	addcs	r3, #1
 80014ea:	0412      	lsls	r2, r2, #16
 80014ec:	d506      	bpl.n	80014fc <USART_Init+0xac>
 80014ee:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 80014f2:	f3c3 0142 	ubfx	r1, r3, #1, #3
 80014f6:	401a      	ands	r2, r3
 80014f8:	ea41 0302 	orr.w	r3, r1, r2
 80014fc:	b29b      	uxth	r3, r3
 80014fe:	81a3      	strh	r3, [r4, #12]
 8001500:	b019      	add	sp, #100	; 0x64
 8001502:	bd30      	pop	{r4, r5, pc}
 8001504:	40013800 	.word	0x40013800
 8001508:	40004400 	.word	0x40004400
 800150c:	40004800 	.word	0x40004800
 8001510:	40004c00 	.word	0x40004c00

08001514 <USART_Cmd>:
 8001514:	bf00      	nop
 8001516:	bf00      	nop
 8001518:	6803      	ldr	r3, [r0, #0]
 800151a:	b111      	cbz	r1, 8001522 <USART_Cmd+0xe>
 800151c:	f043 0301 	orr.w	r3, r3, #1
 8001520:	e001      	b.n	8001526 <USART_Cmd+0x12>
 8001522:	f023 0301 	bic.w	r3, r3, #1
 8001526:	6003      	str	r3, [r0, #0]
 8001528:	4770      	bx	lr

0800152a <USART_ReceiveData>:
 800152a:	bf00      	nop
 800152c:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 800152e:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8001532:	4770      	bx	lr

08001534 <USART_ITConfig>:
 8001534:	b510      	push	{r4, lr}
 8001536:	bf00      	nop
 8001538:	bf00      	nop
 800153a:	bf00      	nop
 800153c:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8001540:	2401      	movs	r4, #1
 8001542:	b2c9      	uxtb	r1, r1
 8001544:	2b02      	cmp	r3, #2
 8001546:	fa04 f101 	lsl.w	r1, r4, r1
 800154a:	d101      	bne.n	8001550 <USART_ITConfig+0x1c>
 800154c:	3004      	adds	r0, #4
 800154e:	e002      	b.n	8001556 <USART_ITConfig+0x22>
 8001550:	2b03      	cmp	r3, #3
 8001552:	bf08      	it	eq
 8001554:	3008      	addeq	r0, #8
 8001556:	6803      	ldr	r3, [r0, #0]
 8001558:	b10a      	cbz	r2, 800155e <USART_ITConfig+0x2a>
 800155a:	4319      	orrs	r1, r3
 800155c:	e001      	b.n	8001562 <USART_ITConfig+0x2e>
 800155e:	ea23 0101 	bic.w	r1, r3, r1
 8001562:	6001      	str	r1, [r0, #0]
 8001564:	bd10      	pop	{r4, pc}

08001566 <USART_GetITStatus>:
 8001566:	b510      	push	{r4, lr}
 8001568:	bf00      	nop
 800156a:	bf00      	nop
 800156c:	2401      	movs	r4, #1
 800156e:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8001572:	b2cb      	uxtb	r3, r1
 8001574:	42a2      	cmp	r2, r4
 8001576:	fa04 f303 	lsl.w	r3, r4, r3
 800157a:	d101      	bne.n	8001580 <USART_GetITStatus+0x1a>
 800157c:	6802      	ldr	r2, [r0, #0]
 800157e:	e003      	b.n	8001588 <USART_GetITStatus+0x22>
 8001580:	2a02      	cmp	r2, #2
 8001582:	bf0c      	ite	eq
 8001584:	6842      	ldreq	r2, [r0, #4]
 8001586:	6882      	ldrne	r2, [r0, #8]
 8001588:	4013      	ands	r3, r2
 800158a:	69c2      	ldr	r2, [r0, #28]
 800158c:	b143      	cbz	r3, 80015a0 <USART_GetITStatus+0x3a>
 800158e:	2301      	movs	r3, #1
 8001590:	0c09      	lsrs	r1, r1, #16
 8001592:	fa03 f101 	lsl.w	r1, r3, r1
 8001596:	4211      	tst	r1, r2
 8001598:	bf0c      	ite	eq
 800159a:	2000      	moveq	r0, #0
 800159c:	2001      	movne	r0, #1
 800159e:	bd10      	pop	{r4, pc}
 80015a0:	4618      	mov	r0, r3
 80015a2:	bd10      	pop	{r4, pc}

080015a4 <USART_ClearITPendingBit>:
 80015a4:	bf00      	nop
 80015a6:	bf00      	nop
 80015a8:	2301      	movs	r3, #1
 80015aa:	0c09      	lsrs	r1, r1, #16
 80015ac:	fa03 f101 	lsl.w	r1, r3, r1
 80015b0:	6201      	str	r1, [r0, #32]
 80015b2:	4770      	bx	lr

080015b4 <lib_low_level_init>:
 80015b4:	b508      	push	{r3, lr}
 80015b6:	f000 f9ad 	bl	8001914 <sytem_clock_init>
 80015ba:	f000 fd97 	bl	80020ec <gpio_init>
 80015be:	f7ff feb5 	bl	800132c <uart_init>
 80015c2:	f000 fc45 	bl	8001e50 <timer_init>
 80015c6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80015ca:	f000 b893 	b.w	80016f4 <i2c_0_init>
	...

080015d0 <NVIC_Init>:
 80015d0:	b510      	push	{r4, lr}
 80015d2:	bf00      	nop
 80015d4:	bf00      	nop
 80015d6:	bf00      	nop
 80015d8:	78c2      	ldrb	r2, [r0, #3]
 80015da:	7803      	ldrb	r3, [r0, #0]
 80015dc:	b30a      	cbz	r2, 8001622 <NVIC_Init+0x52>
 80015de:	4a16      	ldr	r2, [pc, #88]	; (8001638 <NVIC_Init+0x68>)
 80015e0:	7844      	ldrb	r4, [r0, #1]
 80015e2:	68d2      	ldr	r2, [r2, #12]
 80015e4:	43d2      	mvns	r2, r2
 80015e6:	f3c2 2202 	ubfx	r2, r2, #8, #3
 80015ea:	f1c2 0104 	rsb	r1, r2, #4
 80015ee:	b2c9      	uxtb	r1, r1
 80015f0:	fa04 f101 	lsl.w	r1, r4, r1
 80015f4:	240f      	movs	r4, #15
 80015f6:	fa44 f202 	asr.w	r2, r4, r2
 80015fa:	7884      	ldrb	r4, [r0, #2]
 80015fc:	b2c9      	uxtb	r1, r1
 80015fe:	4022      	ands	r2, r4
 8001600:	430a      	orrs	r2, r1
 8001602:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8001606:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 800160a:	0112      	lsls	r2, r2, #4
 800160c:	b2d2      	uxtb	r2, r2
 800160e:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8001612:	7803      	ldrb	r3, [r0, #0]
 8001614:	2201      	movs	r2, #1
 8001616:	0959      	lsrs	r1, r3, #5
 8001618:	f003 031f 	and.w	r3, r3, #31
 800161c:	fa02 f303 	lsl.w	r3, r2, r3
 8001620:	e006      	b.n	8001630 <NVIC_Init+0x60>
 8001622:	0959      	lsrs	r1, r3, #5
 8001624:	2201      	movs	r2, #1
 8001626:	f003 031f 	and.w	r3, r3, #31
 800162a:	fa02 f303 	lsl.w	r3, r2, r3
 800162e:	3120      	adds	r1, #32
 8001630:	4a02      	ldr	r2, [pc, #8]	; (800163c <NVIC_Init+0x6c>)
 8001632:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8001636:	bd10      	pop	{r4, pc}
 8001638:	e000ed00 	.word	0xe000ed00
 800163c:	e000e100 	.word	0xe000e100

08001640 <i2c_delay>:
 8001640:	230b      	movs	r3, #11
 8001642:	3b01      	subs	r3, #1
 8001644:	d001      	beq.n	800164a <i2c_delay+0xa>
 8001646:	bf00      	nop
 8001648:	e7fb      	b.n	8001642 <i2c_delay+0x2>
 800164a:	4770      	bx	lr

0800164c <SetLowSDA>:
 800164c:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800164e:	4d0d      	ldr	r5, [pc, #52]	; (8001684 <SetLowSDA+0x38>)
 8001650:	2301      	movs	r3, #1
 8001652:	2203      	movs	r2, #3
 8001654:	2480      	movs	r4, #128	; 0x80
 8001656:	f88d 3004 	strb.w	r3, [sp, #4]
 800165a:	f88d 3006 	strb.w	r3, [sp, #6]
 800165e:	4628      	mov	r0, r5
 8001660:	2300      	movs	r3, #0
 8001662:	4669      	mov	r1, sp
 8001664:	f88d 2005 	strb.w	r2, [sp, #5]
 8001668:	f88d 3007 	strb.w	r3, [sp, #7]
 800166c:	9400      	str	r4, [sp, #0]
 800166e:	f000 fcad 	bl	8001fcc <GPIO_Init>
 8001672:	4628      	mov	r0, r5
 8001674:	4621      	mov	r1, r4
 8001676:	f000 fcf3 	bl	8002060 <GPIO_ResetBits>
 800167a:	f7ff ffe1 	bl	8001640 <i2c_delay>
 800167e:	b003      	add	sp, #12
 8001680:	bd30      	pop	{r4, r5, pc}
 8001682:	bf00      	nop
 8001684:	48000400 	.word	0x48000400

08001688 <SetHighSDA>:
 8001688:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800168a:	4d0d      	ldr	r5, [pc, #52]	; (80016c0 <SetHighSDA+0x38>)
 800168c:	2203      	movs	r2, #3
 800168e:	2300      	movs	r3, #0
 8001690:	2480      	movs	r4, #128	; 0x80
 8001692:	f88d 2005 	strb.w	r2, [sp, #5]
 8001696:	4628      	mov	r0, r5
 8001698:	2201      	movs	r2, #1
 800169a:	4669      	mov	r1, sp
 800169c:	f88d 3004 	strb.w	r3, [sp, #4]
 80016a0:	f88d 2006 	strb.w	r2, [sp, #6]
 80016a4:	f88d 3007 	strb.w	r3, [sp, #7]
 80016a8:	9400      	str	r4, [sp, #0]
 80016aa:	f000 fc8f 	bl	8001fcc <GPIO_Init>
 80016ae:	4628      	mov	r0, r5
 80016b0:	4621      	mov	r1, r4
 80016b2:	f000 fcd1 	bl	8002058 <GPIO_SetBits>
 80016b6:	f7ff ffc3 	bl	8001640 <i2c_delay>
 80016ba:	b003      	add	sp, #12
 80016bc:	bd30      	pop	{r4, r5, pc}
 80016be:	bf00      	nop
 80016c0:	48000400 	.word	0x48000400

080016c4 <SetLowSCL>:
 80016c4:	b508      	push	{r3, lr}
 80016c6:	4804      	ldr	r0, [pc, #16]	; (80016d8 <SetLowSCL+0x14>)
 80016c8:	2140      	movs	r1, #64	; 0x40
 80016ca:	f000 fcc9 	bl	8002060 <GPIO_ResetBits>
 80016ce:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80016d2:	f7ff bfb5 	b.w	8001640 <i2c_delay>
 80016d6:	bf00      	nop
 80016d8:	48000400 	.word	0x48000400

080016dc <SetHighSCL>:
 80016dc:	b508      	push	{r3, lr}
 80016de:	4804      	ldr	r0, [pc, #16]	; (80016f0 <SetHighSCL+0x14>)
 80016e0:	2140      	movs	r1, #64	; 0x40
 80016e2:	f000 fcb9 	bl	8002058 <GPIO_SetBits>
 80016e6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80016ea:	f7ff bfa9 	b.w	8001640 <i2c_delay>
 80016ee:	bf00      	nop
 80016f0:	48000400 	.word	0x48000400

080016f4 <i2c_0_init>:
 80016f4:	b507      	push	{r0, r1, r2, lr}
 80016f6:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 80016fa:	2101      	movs	r1, #1
 80016fc:	f000 fb1a 	bl	8001d34 <RCC_AHBPeriphClockCmd>
 8001700:	23c0      	movs	r3, #192	; 0xc0
 8001702:	9300      	str	r3, [sp, #0]
 8001704:	2301      	movs	r3, #1
 8001706:	2203      	movs	r2, #3
 8001708:	480a      	ldr	r0, [pc, #40]	; (8001734 <i2c_0_init+0x40>)
 800170a:	f88d 3004 	strb.w	r3, [sp, #4]
 800170e:	4669      	mov	r1, sp
 8001710:	f88d 3006 	strb.w	r3, [sp, #6]
 8001714:	2300      	movs	r3, #0
 8001716:	f88d 2005 	strb.w	r2, [sp, #5]
 800171a:	f88d 3007 	strb.w	r3, [sp, #7]
 800171e:	f000 fc55 	bl	8001fcc <GPIO_Init>
 8001722:	f7ff ffdb 	bl	80016dc <SetHighSCL>
 8001726:	f7ff ff91 	bl	800164c <SetLowSDA>
 800172a:	f7ff ffad 	bl	8001688 <SetHighSDA>
 800172e:	b003      	add	sp, #12
 8001730:	f85d fb04 	ldr.w	pc, [sp], #4
 8001734:	48000400 	.word	0x48000400

08001738 <i2cStart>:
 8001738:	b508      	push	{r3, lr}
 800173a:	f7ff ffcf 	bl	80016dc <SetHighSCL>
 800173e:	f7ff ffa3 	bl	8001688 <SetHighSDA>
 8001742:	f7ff ffcb 	bl	80016dc <SetHighSCL>
 8001746:	f7ff ff81 	bl	800164c <SetLowSDA>
 800174a:	f7ff ffbb 	bl	80016c4 <SetLowSCL>
 800174e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001752:	f7ff bf99 	b.w	8001688 <SetHighSDA>

08001756 <i2cStop>:
 8001756:	b508      	push	{r3, lr}
 8001758:	f7ff ffb4 	bl	80016c4 <SetLowSCL>
 800175c:	f7ff ff76 	bl	800164c <SetLowSDA>
 8001760:	f7ff ffbc 	bl	80016dc <SetHighSCL>
 8001764:	f7ff ff72 	bl	800164c <SetLowSDA>
 8001768:	f7ff ffb8 	bl	80016dc <SetHighSCL>
 800176c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001770:	f7ff bf8a 	b.w	8001688 <SetHighSDA>

08001774 <i2cWrite>:
 8001774:	b538      	push	{r3, r4, r5, lr}
 8001776:	4604      	mov	r4, r0
 8001778:	2508      	movs	r5, #8
 800177a:	f7ff ffa3 	bl	80016c4 <SetLowSCL>
 800177e:	0623      	lsls	r3, r4, #24
 8001780:	d502      	bpl.n	8001788 <i2cWrite+0x14>
 8001782:	f7ff ff81 	bl	8001688 <SetHighSDA>
 8001786:	e001      	b.n	800178c <i2cWrite+0x18>
 8001788:	f7ff ff60 	bl	800164c <SetLowSDA>
 800178c:	3d01      	subs	r5, #1
 800178e:	f7ff ffa5 	bl	80016dc <SetHighSCL>
 8001792:	0064      	lsls	r4, r4, #1
 8001794:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001798:	b2e4      	uxtb	r4, r4
 800179a:	d1ee      	bne.n	800177a <i2cWrite+0x6>
 800179c:	f7ff ff92 	bl	80016c4 <SetLowSCL>
 80017a0:	f7ff ff72 	bl	8001688 <SetHighSDA>
 80017a4:	f7ff ff9a 	bl	80016dc <SetHighSCL>
 80017a8:	4b05      	ldr	r3, [pc, #20]	; (80017c0 <i2cWrite+0x4c>)
 80017aa:	8a1c      	ldrh	r4, [r3, #16]
 80017ac:	b2a4      	uxth	r4, r4
 80017ae:	f7ff ff89 	bl	80016c4 <SetLowSCL>
 80017b2:	f7ff ff45 	bl	8001640 <i2c_delay>
 80017b6:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 80017ba:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 80017be:	bd38      	pop	{r3, r4, r5, pc}
 80017c0:	48000400 	.word	0x48000400

080017c4 <i2cRead>:
 80017c4:	b570      	push	{r4, r5, r6, lr}
 80017c6:	4606      	mov	r6, r0
 80017c8:	f7ff ff7c 	bl	80016c4 <SetLowSCL>
 80017cc:	f7ff ff5c 	bl	8001688 <SetHighSDA>
 80017d0:	2508      	movs	r5, #8
 80017d2:	2400      	movs	r4, #0
 80017d4:	f7ff ff82 	bl	80016dc <SetHighSCL>
 80017d8:	4b0d      	ldr	r3, [pc, #52]	; (8001810 <i2cRead+0x4c>)
 80017da:	8a1b      	ldrh	r3, [r3, #16]
 80017dc:	0064      	lsls	r4, r4, #1
 80017de:	061a      	lsls	r2, r3, #24
 80017e0:	b2e4      	uxtb	r4, r4
 80017e2:	bf48      	it	mi
 80017e4:	3401      	addmi	r4, #1
 80017e6:	f105 35ff 	add.w	r5, r5, #4294967295
 80017ea:	bf48      	it	mi
 80017ec:	b2e4      	uxtbmi	r4, r4
 80017ee:	f7ff ff69 	bl	80016c4 <SetLowSCL>
 80017f2:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80017f6:	d1ed      	bne.n	80017d4 <i2cRead+0x10>
 80017f8:	b10e      	cbz	r6, 80017fe <i2cRead+0x3a>
 80017fa:	f7ff ff27 	bl	800164c <SetLowSDA>
 80017fe:	f7ff ff6d 	bl	80016dc <SetHighSCL>
 8001802:	f7ff ff5f 	bl	80016c4 <SetLowSCL>
 8001806:	f7ff ff1b 	bl	8001640 <i2c_delay>
 800180a:	4620      	mov	r0, r4
 800180c:	bd70      	pop	{r4, r5, r6, pc}
 800180e:	bf00      	nop
 8001810:	48000400 	.word	0x48000400

08001814 <i2c_write_reg>:
 8001814:	b570      	push	{r4, r5, r6, lr}
 8001816:	4605      	mov	r5, r0
 8001818:	460c      	mov	r4, r1
 800181a:	4616      	mov	r6, r2
 800181c:	f7ff ff8c 	bl	8001738 <i2cStart>
 8001820:	4628      	mov	r0, r5
 8001822:	f7ff ffa7 	bl	8001774 <i2cWrite>
 8001826:	4620      	mov	r0, r4
 8001828:	f7ff ffa4 	bl	8001774 <i2cWrite>
 800182c:	4630      	mov	r0, r6
 800182e:	f7ff ffa1 	bl	8001774 <i2cWrite>
 8001832:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001836:	f7ff bf8e 	b.w	8001756 <i2cStop>

0800183a <i2c_read_reg>:
 800183a:	b538      	push	{r3, r4, r5, lr}
 800183c:	4604      	mov	r4, r0
 800183e:	460d      	mov	r5, r1
 8001840:	f7ff ff7a 	bl	8001738 <i2cStart>
 8001844:	4620      	mov	r0, r4
 8001846:	f7ff ff95 	bl	8001774 <i2cWrite>
 800184a:	4628      	mov	r0, r5
 800184c:	f7ff ff92 	bl	8001774 <i2cWrite>
 8001850:	f7ff ff72 	bl	8001738 <i2cStart>
 8001854:	f044 0001 	orr.w	r0, r4, #1
 8001858:	f7ff ff8c 	bl	8001774 <i2cWrite>
 800185c:	2000      	movs	r0, #0
 800185e:	f7ff ffb1 	bl	80017c4 <i2cRead>
 8001862:	4604      	mov	r4, r0
 8001864:	f7ff ff77 	bl	8001756 <i2cStop>
 8001868:	4620      	mov	r0, r4
 800186a:	bd38      	pop	{r3, r4, r5, pc}

0800186c <Default_Handler>:
 800186c:	4668      	mov	r0, sp
 800186e:	f020 0107 	bic.w	r1, r0, #7
 8001872:	468d      	mov	sp, r1
 8001874:	bf00      	nop
 8001876:	e7fd      	b.n	8001874 <Default_Handler+0x8>

08001878 <HardFault_Handler>:
 8001878:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 800187c:	f000 fc0a 	bl	8002094 <led_on>
 8001880:	4b06      	ldr	r3, [pc, #24]	; (800189c <HardFault_Handler+0x24>)
 8001882:	3b01      	subs	r3, #1
 8001884:	d001      	beq.n	800188a <HardFault_Handler+0x12>
 8001886:	bf00      	nop
 8001888:	e7fb      	b.n	8001882 <HardFault_Handler+0xa>
 800188a:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 800188e:	f000 fc17 	bl	80020c0 <led_off>
 8001892:	4b02      	ldr	r3, [pc, #8]	; (800189c <HardFault_Handler+0x24>)
 8001894:	3b01      	subs	r3, #1
 8001896:	d0ef      	beq.n	8001878 <HardFault_Handler>
 8001898:	bf00      	nop
 800189a:	e7fb      	b.n	8001894 <HardFault_Handler+0x1c>
 800189c:	00989681 	.word	0x00989681

080018a0 <_reset_init>:
 80018a0:	4a0e      	ldr	r2, [pc, #56]	; (80018dc <_reset_init+0x3c>)
 80018a2:	480f      	ldr	r0, [pc, #60]	; (80018e0 <_reset_init+0x40>)
 80018a4:	1a80      	subs	r0, r0, r2
 80018a6:	1080      	asrs	r0, r0, #2
 80018a8:	2300      	movs	r3, #0
 80018aa:	4283      	cmp	r3, r0
 80018ac:	d006      	beq.n	80018bc <_reset_init+0x1c>
 80018ae:	490d      	ldr	r1, [pc, #52]	; (80018e4 <_reset_init+0x44>)
 80018b0:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 80018b4:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 80018b8:	3301      	adds	r3, #1
 80018ba:	e7f6      	b.n	80018aa <_reset_init+0xa>
 80018bc:	4b0a      	ldr	r3, [pc, #40]	; (80018e8 <_reset_init+0x48>)
 80018be:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 80018c2:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80018c6:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80018ca:	f503 730c 	add.w	r3, r3, #560	; 0x230
 80018ce:	685a      	ldr	r2, [r3, #4]
 80018d0:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 80018d4:	605a      	str	r2, [r3, #4]
 80018d6:	f7fe bc57 	b.w	8000188 <main>
 80018da:	bf00      	nop
 80018dc:	20000000 	.word	0x20000000
 80018e0:	20000030 	.word	0x20000030
 80018e4:	0800230c 	.word	0x0800230c
 80018e8:	e000ed00 	.word	0xe000ed00

080018ec <sys_tick_init>:
 80018ec:	4b05      	ldr	r3, [pc, #20]	; (8001904 <sys_tick_init+0x18>)
 80018ee:	4a06      	ldr	r2, [pc, #24]	; (8001908 <sys_tick_init+0x1c>)
 80018f0:	605a      	str	r2, [r3, #4]
 80018f2:	4a06      	ldr	r2, [pc, #24]	; (800190c <sys_tick_init+0x20>)
 80018f4:	21f0      	movs	r1, #240	; 0xf0
 80018f6:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 80018fa:	2200      	movs	r2, #0
 80018fc:	609a      	str	r2, [r3, #8]
 80018fe:	2207      	movs	r2, #7
 8001900:	601a      	str	r2, [r3, #0]
 8001902:	4770      	bx	lr
 8001904:	e000e010 	.word	0xe000e010
 8001908:	00029040 	.word	0x00029040
 800190c:	e000ed00 	.word	0xe000ed00

08001910 <sleep>:
 8001910:	bf30      	wfi
 8001912:	4770      	bx	lr

08001914 <sytem_clock_init>:
 8001914:	f000 b800 	b.w	8001918 <SystemInit>

08001918 <SystemInit>:
 8001918:	4b3b      	ldr	r3, [pc, #236]	; (8001a08 <SystemInit+0xf0>)
 800191a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800191e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001922:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001926:	4b39      	ldr	r3, [pc, #228]	; (8001a0c <SystemInit+0xf4>)
 8001928:	681a      	ldr	r2, [r3, #0]
 800192a:	f042 0201 	orr.w	r2, r2, #1
 800192e:	601a      	str	r2, [r3, #0]
 8001930:	6859      	ldr	r1, [r3, #4]
 8001932:	4a37      	ldr	r2, [pc, #220]	; (8001a10 <SystemInit+0xf8>)
 8001934:	400a      	ands	r2, r1
 8001936:	605a      	str	r2, [r3, #4]
 8001938:	681a      	ldr	r2, [r3, #0]
 800193a:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 800193e:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8001942:	601a      	str	r2, [r3, #0]
 8001944:	681a      	ldr	r2, [r3, #0]
 8001946:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 800194a:	601a      	str	r2, [r3, #0]
 800194c:	685a      	ldr	r2, [r3, #4]
 800194e:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8001952:	605a      	str	r2, [r3, #4]
 8001954:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001956:	f022 020f 	bic.w	r2, r2, #15
 800195a:	62da      	str	r2, [r3, #44]	; 0x2c
 800195c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800195e:	4a2d      	ldr	r2, [pc, #180]	; (8001a14 <SystemInit+0xfc>)
 8001960:	b082      	sub	sp, #8
 8001962:	400a      	ands	r2, r1
 8001964:	631a      	str	r2, [r3, #48]	; 0x30
 8001966:	2200      	movs	r2, #0
 8001968:	609a      	str	r2, [r3, #8]
 800196a:	9200      	str	r2, [sp, #0]
 800196c:	9201      	str	r2, [sp, #4]
 800196e:	681a      	ldr	r2, [r3, #0]
 8001970:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001974:	601a      	str	r2, [r3, #0]
 8001976:	4b25      	ldr	r3, [pc, #148]	; (8001a0c <SystemInit+0xf4>)
 8001978:	681a      	ldr	r2, [r3, #0]
 800197a:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 800197e:	9201      	str	r2, [sp, #4]
 8001980:	9a00      	ldr	r2, [sp, #0]
 8001982:	3201      	adds	r2, #1
 8001984:	9200      	str	r2, [sp, #0]
 8001986:	9a01      	ldr	r2, [sp, #4]
 8001988:	b91a      	cbnz	r2, 8001992 <SystemInit+0x7a>
 800198a:	9a00      	ldr	r2, [sp, #0]
 800198c:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8001990:	d1f1      	bne.n	8001976 <SystemInit+0x5e>
 8001992:	681b      	ldr	r3, [r3, #0]
 8001994:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8001998:	bf18      	it	ne
 800199a:	2301      	movne	r3, #1
 800199c:	9301      	str	r3, [sp, #4]
 800199e:	9b01      	ldr	r3, [sp, #4]
 80019a0:	2b01      	cmp	r3, #1
 80019a2:	d005      	beq.n	80019b0 <SystemInit+0x98>
 80019a4:	4b18      	ldr	r3, [pc, #96]	; (8001a08 <SystemInit+0xf0>)
 80019a6:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 80019aa:	609a      	str	r2, [r3, #8]
 80019ac:	b002      	add	sp, #8
 80019ae:	4770      	bx	lr
 80019b0:	4b19      	ldr	r3, [pc, #100]	; (8001a18 <SystemInit+0x100>)
 80019b2:	2212      	movs	r2, #18
 80019b4:	601a      	str	r2, [r3, #0]
 80019b6:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 80019ba:	685a      	ldr	r2, [r3, #4]
 80019bc:	605a      	str	r2, [r3, #4]
 80019be:	685a      	ldr	r2, [r3, #4]
 80019c0:	605a      	str	r2, [r3, #4]
 80019c2:	685a      	ldr	r2, [r3, #4]
 80019c4:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 80019c8:	605a      	str	r2, [r3, #4]
 80019ca:	685a      	ldr	r2, [r3, #4]
 80019cc:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 80019d0:	605a      	str	r2, [r3, #4]
 80019d2:	685a      	ldr	r2, [r3, #4]
 80019d4:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 80019d8:	605a      	str	r2, [r3, #4]
 80019da:	681a      	ldr	r2, [r3, #0]
 80019dc:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 80019e0:	601a      	str	r2, [r3, #0]
 80019e2:	6819      	ldr	r1, [r3, #0]
 80019e4:	4a09      	ldr	r2, [pc, #36]	; (8001a0c <SystemInit+0xf4>)
 80019e6:	0189      	lsls	r1, r1, #6
 80019e8:	d5fb      	bpl.n	80019e2 <SystemInit+0xca>
 80019ea:	6853      	ldr	r3, [r2, #4]
 80019ec:	f023 0303 	bic.w	r3, r3, #3
 80019f0:	6053      	str	r3, [r2, #4]
 80019f2:	6853      	ldr	r3, [r2, #4]
 80019f4:	f043 0302 	orr.w	r3, r3, #2
 80019f8:	6053      	str	r3, [r2, #4]
 80019fa:	4b04      	ldr	r3, [pc, #16]	; (8001a0c <SystemInit+0xf4>)
 80019fc:	685b      	ldr	r3, [r3, #4]
 80019fe:	f003 030c 	and.w	r3, r3, #12
 8001a02:	2b08      	cmp	r3, #8
 8001a04:	d1f9      	bne.n	80019fa <SystemInit+0xe2>
 8001a06:	e7cd      	b.n	80019a4 <SystemInit+0x8c>
 8001a08:	e000ed00 	.word	0xe000ed00
 8001a0c:	40021000 	.word	0x40021000
 8001a10:	f87fc00c 	.word	0xf87fc00c
 8001a14:	ff00fccc 	.word	0xff00fccc
 8001a18:	40022000 	.word	0x40022000

08001a1c <RCC_GetClocksFreq>:
 8001a1c:	4ba5      	ldr	r3, [pc, #660]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001a1e:	685a      	ldr	r2, [r3, #4]
 8001a20:	f002 020c 	and.w	r2, r2, #12
 8001a24:	2a04      	cmp	r2, #4
 8001a26:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8001a2a:	d005      	beq.n	8001a38 <RCC_GetClocksFreq+0x1c>
 8001a2c:	2a08      	cmp	r2, #8
 8001a2e:	d006      	beq.n	8001a3e <RCC_GetClocksFreq+0x22>
 8001a30:	4ba1      	ldr	r3, [pc, #644]	; (8001cb8 <RCC_GetClocksFreq+0x29c>)
 8001a32:	6003      	str	r3, [r0, #0]
 8001a34:	b9ba      	cbnz	r2, 8001a66 <RCC_GetClocksFreq+0x4a>
 8001a36:	e017      	b.n	8001a68 <RCC_GetClocksFreq+0x4c>
 8001a38:	4b9f      	ldr	r3, [pc, #636]	; (8001cb8 <RCC_GetClocksFreq+0x29c>)
 8001a3a:	6003      	str	r3, [r0, #0]
 8001a3c:	e013      	b.n	8001a66 <RCC_GetClocksFreq+0x4a>
 8001a3e:	6859      	ldr	r1, [r3, #4]
 8001a40:	685c      	ldr	r4, [r3, #4]
 8001a42:	f3c1 4183 	ubfx	r1, r1, #18, #4
 8001a46:	03e2      	lsls	r2, r4, #15
 8001a48:	f101 0102 	add.w	r1, r1, #2
 8001a4c:	d401      	bmi.n	8001a52 <RCC_GetClocksFreq+0x36>
 8001a4e:	4a9b      	ldr	r2, [pc, #620]	; (8001cbc <RCC_GetClocksFreq+0x2a0>)
 8001a50:	e006      	b.n	8001a60 <RCC_GetClocksFreq+0x44>
 8001a52:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001a54:	4b98      	ldr	r3, [pc, #608]	; (8001cb8 <RCC_GetClocksFreq+0x29c>)
 8001a56:	f002 020f 	and.w	r2, r2, #15
 8001a5a:	3201      	adds	r2, #1
 8001a5c:	fbb3 f2f2 	udiv	r2, r3, r2
 8001a60:	434a      	muls	r2, r1
 8001a62:	6002      	str	r2, [r0, #0]
 8001a64:	e000      	b.n	8001a68 <RCC_GetClocksFreq+0x4c>
 8001a66:	2200      	movs	r2, #0
 8001a68:	4f92      	ldr	r7, [pc, #584]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001a6a:	4d95      	ldr	r5, [pc, #596]	; (8001cc0 <RCC_GetClocksFreq+0x2a4>)
 8001a6c:	687b      	ldr	r3, [r7, #4]
 8001a6e:	f8df 8254 	ldr.w	r8, [pc, #596]	; 8001cc4 <RCC_GetClocksFreq+0x2a8>
 8001a72:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8001a76:	5cec      	ldrb	r4, [r5, r3]
 8001a78:	6803      	ldr	r3, [r0, #0]
 8001a7a:	b2e4      	uxtb	r4, r4
 8001a7c:	fa23 f104 	lsr.w	r1, r3, r4
 8001a80:	6041      	str	r1, [r0, #4]
 8001a82:	687e      	ldr	r6, [r7, #4]
 8001a84:	f3c6 2602 	ubfx	r6, r6, #8, #3
 8001a88:	5dae      	ldrb	r6, [r5, r6]
 8001a8a:	fa21 f606 	lsr.w	r6, r1, r6
 8001a8e:	6086      	str	r6, [r0, #8]
 8001a90:	f8d7 c004 	ldr.w	ip, [r7, #4]
 8001a94:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8001a98:	f815 500c 	ldrb.w	r5, [r5, ip]
 8001a9c:	b2ed      	uxtb	r5, r5
 8001a9e:	40e9      	lsrs	r1, r5
 8001aa0:	60c1      	str	r1, [r0, #12]
 8001aa2:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 8001aa6:	f3c9 1904 	ubfx	r9, r9, #4, #5
 8001aaa:	f009 0c0f 	and.w	ip, r9, #15
 8001aae:	f019 0f10 	tst.w	r9, #16
 8001ab2:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 8001ab6:	fa1f fc8c 	uxth.w	ip, ip
 8001aba:	d007      	beq.n	8001acc <RCC_GetClocksFreq+0xb0>
 8001abc:	f1bc 0f00 	cmp.w	ip, #0
 8001ac0:	d004      	beq.n	8001acc <RCC_GetClocksFreq+0xb0>
 8001ac2:	fbb2 fcfc 	udiv	ip, r2, ip
 8001ac6:	f8c0 c010 	str.w	ip, [r0, #16]
 8001aca:	e000      	b.n	8001ace <RCC_GetClocksFreq+0xb2>
 8001acc:	6103      	str	r3, [r0, #16]
 8001ace:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 8001ad0:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 8001ad4:	f00c 070f 	and.w	r7, ip, #15
 8001ad8:	f01c 0f10 	tst.w	ip, #16
 8001adc:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 8001ae0:	b2bf      	uxth	r7, r7
 8001ae2:	d004      	beq.n	8001aee <RCC_GetClocksFreq+0xd2>
 8001ae4:	b11f      	cbz	r7, 8001aee <RCC_GetClocksFreq+0xd2>
 8001ae6:	fbb2 f7f7 	udiv	r7, r2, r7
 8001aea:	6147      	str	r7, [r0, #20]
 8001aec:	e000      	b.n	8001af0 <RCC_GetClocksFreq+0xd4>
 8001aee:	6143      	str	r3, [r0, #20]
 8001af0:	4f70      	ldr	r7, [pc, #448]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001af2:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001af6:	f01c 0f10 	tst.w	ip, #16
 8001afa:	bf0a      	itet	eq
 8001afc:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 8001cb8 <RCC_GetClocksFreq+0x29c>
 8001b00:	6183      	strne	r3, [r0, #24]
 8001b02:	f8c0 c018 	streq.w	ip, [r0, #24]
 8001b06:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001b08:	06bf      	lsls	r7, r7, #26
 8001b0a:	bf56      	itet	pl
 8001b0c:	4f6a      	ldrpl	r7, [pc, #424]	; (8001cb8 <RCC_GetClocksFreq+0x29c>)
 8001b0e:	61c3      	strmi	r3, [r0, #28]
 8001b10:	61c7      	strpl	r7, [r0, #28]
 8001b12:	4f68      	ldr	r7, [pc, #416]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001b14:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001b18:	f01c 0f40 	tst.w	ip, #64	; 0x40
 8001b1c:	bf0a      	itet	eq
 8001b1e:	f8df c198 	ldreq.w	ip, [pc, #408]	; 8001cb8 <RCC_GetClocksFreq+0x29c>
 8001b22:	6203      	strne	r3, [r0, #32]
 8001b24:	f8c0 c020 	streq.w	ip, [r0, #32]
 8001b28:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001b2a:	05ff      	lsls	r7, r7, #23
 8001b2c:	d506      	bpl.n	8001b3c <RCC_GetClocksFreq+0x120>
 8001b2e:	4293      	cmp	r3, r2
 8001b30:	d104      	bne.n	8001b3c <RCC_GetClocksFreq+0x120>
 8001b32:	42a5      	cmp	r5, r4
 8001b34:	d102      	bne.n	8001b3c <RCC_GetClocksFreq+0x120>
 8001b36:	005f      	lsls	r7, r3, #1
 8001b38:	6247      	str	r7, [r0, #36]	; 0x24
 8001b3a:	e000      	b.n	8001b3e <RCC_GetClocksFreq+0x122>
 8001b3c:	6241      	str	r1, [r0, #36]	; 0x24
 8001b3e:	4f5d      	ldr	r7, [pc, #372]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001b40:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001b44:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 8001b48:	d008      	beq.n	8001b5c <RCC_GetClocksFreq+0x140>
 8001b4a:	4293      	cmp	r3, r2
 8001b4c:	d106      	bne.n	8001b5c <RCC_GetClocksFreq+0x140>
 8001b4e:	42a5      	cmp	r5, r4
 8001b50:	d104      	bne.n	8001b5c <RCC_GetClocksFreq+0x140>
 8001b52:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001b56:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 8001b5a:	e000      	b.n	8001b5e <RCC_GetClocksFreq+0x142>
 8001b5c:	6281      	str	r1, [r0, #40]	; 0x28
 8001b5e:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001b60:	05bf      	lsls	r7, r7, #22
 8001b62:	d506      	bpl.n	8001b72 <RCC_GetClocksFreq+0x156>
 8001b64:	4293      	cmp	r3, r2
 8001b66:	d104      	bne.n	8001b72 <RCC_GetClocksFreq+0x156>
 8001b68:	42a5      	cmp	r5, r4
 8001b6a:	d102      	bne.n	8001b72 <RCC_GetClocksFreq+0x156>
 8001b6c:	005f      	lsls	r7, r3, #1
 8001b6e:	62c7      	str	r7, [r0, #44]	; 0x2c
 8001b70:	e000      	b.n	8001b74 <RCC_GetClocksFreq+0x158>
 8001b72:	62c1      	str	r1, [r0, #44]	; 0x2c
 8001b74:	4f4f      	ldr	r7, [pc, #316]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001b76:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001b7a:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 8001b7e:	d008      	beq.n	8001b92 <RCC_GetClocksFreq+0x176>
 8001b80:	4293      	cmp	r3, r2
 8001b82:	d106      	bne.n	8001b92 <RCC_GetClocksFreq+0x176>
 8001b84:	42a5      	cmp	r5, r4
 8001b86:	d104      	bne.n	8001b92 <RCC_GetClocksFreq+0x176>
 8001b88:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001b8c:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8001b90:	e000      	b.n	8001b94 <RCC_GetClocksFreq+0x178>
 8001b92:	64c1      	str	r1, [r0, #76]	; 0x4c
 8001b94:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001b96:	053f      	lsls	r7, r7, #20
 8001b98:	d506      	bpl.n	8001ba8 <RCC_GetClocksFreq+0x18c>
 8001b9a:	4293      	cmp	r3, r2
 8001b9c:	d104      	bne.n	8001ba8 <RCC_GetClocksFreq+0x18c>
 8001b9e:	42a5      	cmp	r5, r4
 8001ba0:	d102      	bne.n	8001ba8 <RCC_GetClocksFreq+0x18c>
 8001ba2:	005f      	lsls	r7, r3, #1
 8001ba4:	6507      	str	r7, [r0, #80]	; 0x50
 8001ba6:	e000      	b.n	8001baa <RCC_GetClocksFreq+0x18e>
 8001ba8:	6501      	str	r1, [r0, #80]	; 0x50
 8001baa:	4f42      	ldr	r7, [pc, #264]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001bac:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001bb0:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 8001bb4:	d008      	beq.n	8001bc8 <RCC_GetClocksFreq+0x1ac>
 8001bb6:	4293      	cmp	r3, r2
 8001bb8:	d106      	bne.n	8001bc8 <RCC_GetClocksFreq+0x1ac>
 8001bba:	42a5      	cmp	r5, r4
 8001bbc:	d104      	bne.n	8001bc8 <RCC_GetClocksFreq+0x1ac>
 8001bbe:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001bc2:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 8001bc6:	e000      	b.n	8001bca <RCC_GetClocksFreq+0x1ae>
 8001bc8:	6501      	str	r1, [r0, #80]	; 0x50
 8001bca:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001bcc:	043f      	lsls	r7, r7, #16
 8001bce:	d506      	bpl.n	8001bde <RCC_GetClocksFreq+0x1c2>
 8001bd0:	4293      	cmp	r3, r2
 8001bd2:	d104      	bne.n	8001bde <RCC_GetClocksFreq+0x1c2>
 8001bd4:	42a5      	cmp	r5, r4
 8001bd6:	d102      	bne.n	8001bde <RCC_GetClocksFreq+0x1c2>
 8001bd8:	005a      	lsls	r2, r3, #1
 8001bda:	6582      	str	r2, [r0, #88]	; 0x58
 8001bdc:	e000      	b.n	8001be0 <RCC_GetClocksFreq+0x1c4>
 8001bde:	6581      	str	r1, [r0, #88]	; 0x58
 8001be0:	4a34      	ldr	r2, [pc, #208]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001be2:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8001be4:	07a4      	lsls	r4, r4, #30
 8001be6:	d014      	beq.n	8001c12 <RCC_GetClocksFreq+0x1f6>
 8001be8:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001bea:	f001 0103 	and.w	r1, r1, #3
 8001bee:	2901      	cmp	r1, #1
 8001bf0:	d101      	bne.n	8001bf6 <RCC_GetClocksFreq+0x1da>
 8001bf2:	6383      	str	r3, [r0, #56]	; 0x38
 8001bf4:	e00e      	b.n	8001c14 <RCC_GetClocksFreq+0x1f8>
 8001bf6:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001bf8:	f001 0103 	and.w	r1, r1, #3
 8001bfc:	2902      	cmp	r1, #2
 8001bfe:	d102      	bne.n	8001c06 <RCC_GetClocksFreq+0x1ea>
 8001c00:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001c04:	e005      	b.n	8001c12 <RCC_GetClocksFreq+0x1f6>
 8001c06:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001c08:	f001 0103 	and.w	r1, r1, #3
 8001c0c:	2903      	cmp	r1, #3
 8001c0e:	d101      	bne.n	8001c14 <RCC_GetClocksFreq+0x1f8>
 8001c10:	4929      	ldr	r1, [pc, #164]	; (8001cb8 <RCC_GetClocksFreq+0x29c>)
 8001c12:	6381      	str	r1, [r0, #56]	; 0x38
 8001c14:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001c16:	4927      	ldr	r1, [pc, #156]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001c18:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 8001c1c:	d101      	bne.n	8001c22 <RCC_GetClocksFreq+0x206>
 8001c1e:	63c6      	str	r6, [r0, #60]	; 0x3c
 8001c20:	e018      	b.n	8001c54 <RCC_GetClocksFreq+0x238>
 8001c22:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001c24:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001c28:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 8001c2c:	d101      	bne.n	8001c32 <RCC_GetClocksFreq+0x216>
 8001c2e:	63c3      	str	r3, [r0, #60]	; 0x3c
 8001c30:	e010      	b.n	8001c54 <RCC_GetClocksFreq+0x238>
 8001c32:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001c34:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001c38:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 8001c3c:	d102      	bne.n	8001c44 <RCC_GetClocksFreq+0x228>
 8001c3e:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001c42:	e006      	b.n	8001c52 <RCC_GetClocksFreq+0x236>
 8001c44:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001c46:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001c4a:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 8001c4e:	d101      	bne.n	8001c54 <RCC_GetClocksFreq+0x238>
 8001c50:	4a19      	ldr	r2, [pc, #100]	; (8001cb8 <RCC_GetClocksFreq+0x29c>)
 8001c52:	63c2      	str	r2, [r0, #60]	; 0x3c
 8001c54:	4a17      	ldr	r2, [pc, #92]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001c56:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001c58:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8001c5c:	d101      	bne.n	8001c62 <RCC_GetClocksFreq+0x246>
 8001c5e:	6406      	str	r6, [r0, #64]	; 0x40
 8001c60:	e018      	b.n	8001c94 <RCC_GetClocksFreq+0x278>
 8001c62:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001c64:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001c68:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8001c6c:	d101      	bne.n	8001c72 <RCC_GetClocksFreq+0x256>
 8001c6e:	6403      	str	r3, [r0, #64]	; 0x40
 8001c70:	e010      	b.n	8001c94 <RCC_GetClocksFreq+0x278>
 8001c72:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001c74:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001c78:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 8001c7c:	d102      	bne.n	8001c84 <RCC_GetClocksFreq+0x268>
 8001c7e:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001c82:	e006      	b.n	8001c92 <RCC_GetClocksFreq+0x276>
 8001c84:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001c86:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001c8a:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 8001c8e:	d101      	bne.n	8001c94 <RCC_GetClocksFreq+0x278>
 8001c90:	4909      	ldr	r1, [pc, #36]	; (8001cb8 <RCC_GetClocksFreq+0x29c>)
 8001c92:	6401      	str	r1, [r0, #64]	; 0x40
 8001c94:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001c96:	4907      	ldr	r1, [pc, #28]	; (8001cb4 <RCC_GetClocksFreq+0x298>)
 8001c98:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 8001c9c:	d101      	bne.n	8001ca2 <RCC_GetClocksFreq+0x286>
 8001c9e:	6446      	str	r6, [r0, #68]	; 0x44
 8001ca0:	e023      	b.n	8001cea <RCC_GetClocksFreq+0x2ce>
 8001ca2:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001ca4:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001ca8:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 8001cac:	d10c      	bne.n	8001cc8 <RCC_GetClocksFreq+0x2ac>
 8001cae:	6443      	str	r3, [r0, #68]	; 0x44
 8001cb0:	e01b      	b.n	8001cea <RCC_GetClocksFreq+0x2ce>
 8001cb2:	bf00      	nop
 8001cb4:	40021000 	.word	0x40021000
 8001cb8:	007a1200 	.word	0x007a1200
 8001cbc:	003d0900 	.word	0x003d0900
 8001cc0:	20000020 	.word	0x20000020
 8001cc4:	20000000 	.word	0x20000000
 8001cc8:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001cca:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001cce:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 8001cd2:	d102      	bne.n	8001cda <RCC_GetClocksFreq+0x2be>
 8001cd4:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001cd8:	e006      	b.n	8001ce8 <RCC_GetClocksFreq+0x2cc>
 8001cda:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001cdc:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001ce0:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 8001ce4:	d101      	bne.n	8001cea <RCC_GetClocksFreq+0x2ce>
 8001ce6:	4a11      	ldr	r2, [pc, #68]	; (8001d2c <RCC_GetClocksFreq+0x310>)
 8001ce8:	6442      	str	r2, [r0, #68]	; 0x44
 8001cea:	4a11      	ldr	r2, [pc, #68]	; (8001d30 <RCC_GetClocksFreq+0x314>)
 8001cec:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001cee:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 8001cf2:	d102      	bne.n	8001cfa <RCC_GetClocksFreq+0x2de>
 8001cf4:	6486      	str	r6, [r0, #72]	; 0x48
 8001cf6:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001cfa:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001cfc:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 8001d00:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 8001d04:	d00f      	beq.n	8001d26 <RCC_GetClocksFreq+0x30a>
 8001d06:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001d08:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001d0c:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 8001d10:	d102      	bne.n	8001d18 <RCC_GetClocksFreq+0x2fc>
 8001d12:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001d16:	e006      	b.n	8001d26 <RCC_GetClocksFreq+0x30a>
 8001d18:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001d1a:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001d1e:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8001d22:	d101      	bne.n	8001d28 <RCC_GetClocksFreq+0x30c>
 8001d24:	4b01      	ldr	r3, [pc, #4]	; (8001d2c <RCC_GetClocksFreq+0x310>)
 8001d26:	6483      	str	r3, [r0, #72]	; 0x48
 8001d28:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001d2c:	007a1200 	.word	0x007a1200
 8001d30:	40021000 	.word	0x40021000

08001d34 <RCC_AHBPeriphClockCmd>:
 8001d34:	bf00      	nop
 8001d36:	bf00      	nop
 8001d38:	4b04      	ldr	r3, [pc, #16]	; (8001d4c <RCC_AHBPeriphClockCmd+0x18>)
 8001d3a:	695a      	ldr	r2, [r3, #20]
 8001d3c:	b109      	cbz	r1, 8001d42 <RCC_AHBPeriphClockCmd+0xe>
 8001d3e:	4310      	orrs	r0, r2
 8001d40:	e001      	b.n	8001d46 <RCC_AHBPeriphClockCmd+0x12>
 8001d42:	ea22 0000 	bic.w	r0, r2, r0
 8001d46:	6158      	str	r0, [r3, #20]
 8001d48:	4770      	bx	lr
 8001d4a:	bf00      	nop
 8001d4c:	40021000 	.word	0x40021000

08001d50 <RCC_APB2PeriphClockCmd>:
 8001d50:	bf00      	nop
 8001d52:	bf00      	nop
 8001d54:	4b04      	ldr	r3, [pc, #16]	; (8001d68 <RCC_APB2PeriphClockCmd+0x18>)
 8001d56:	699a      	ldr	r2, [r3, #24]
 8001d58:	b109      	cbz	r1, 8001d5e <RCC_APB2PeriphClockCmd+0xe>
 8001d5a:	4310      	orrs	r0, r2
 8001d5c:	e001      	b.n	8001d62 <RCC_APB2PeriphClockCmd+0x12>
 8001d5e:	ea22 0000 	bic.w	r0, r2, r0
 8001d62:	6198      	str	r0, [r3, #24]
 8001d64:	4770      	bx	lr
 8001d66:	bf00      	nop
 8001d68:	40021000 	.word	0x40021000

08001d6c <RCC_APB1PeriphClockCmd>:
 8001d6c:	bf00      	nop
 8001d6e:	bf00      	nop
 8001d70:	4b04      	ldr	r3, [pc, #16]	; (8001d84 <RCC_APB1PeriphClockCmd+0x18>)
 8001d72:	69da      	ldr	r2, [r3, #28]
 8001d74:	b109      	cbz	r1, 8001d7a <RCC_APB1PeriphClockCmd+0xe>
 8001d76:	4310      	orrs	r0, r2
 8001d78:	e001      	b.n	8001d7e <RCC_APB1PeriphClockCmd+0x12>
 8001d7a:	ea22 0000 	bic.w	r0, r2, r0
 8001d7e:	61d8      	str	r0, [r3, #28]
 8001d80:	4770      	bx	lr
 8001d82:	bf00      	nop
 8001d84:	40021000 	.word	0x40021000

08001d88 <TIM_TimeBaseInit>:
 8001d88:	bf00      	nop
 8001d8a:	bf00      	nop
 8001d8c:	bf00      	nop
 8001d8e:	4a24      	ldr	r2, [pc, #144]	; (8001e20 <TIM_TimeBaseInit+0x98>)
 8001d90:	8803      	ldrh	r3, [r0, #0]
 8001d92:	4290      	cmp	r0, r2
 8001d94:	b29b      	uxth	r3, r3
 8001d96:	d012      	beq.n	8001dbe <TIM_TimeBaseInit+0x36>
 8001d98:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8001d9c:	4290      	cmp	r0, r2
 8001d9e:	d00e      	beq.n	8001dbe <TIM_TimeBaseInit+0x36>
 8001da0:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001da4:	d00b      	beq.n	8001dbe <TIM_TimeBaseInit+0x36>
 8001da6:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 8001daa:	4290      	cmp	r0, r2
 8001dac:	d007      	beq.n	8001dbe <TIM_TimeBaseInit+0x36>
 8001dae:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001db2:	4290      	cmp	r0, r2
 8001db4:	d003      	beq.n	8001dbe <TIM_TimeBaseInit+0x36>
 8001db6:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 8001dba:	4290      	cmp	r0, r2
 8001dbc:	d103      	bne.n	8001dc6 <TIM_TimeBaseInit+0x3e>
 8001dbe:	884a      	ldrh	r2, [r1, #2]
 8001dc0:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001dc4:	4313      	orrs	r3, r2
 8001dc6:	4a17      	ldr	r2, [pc, #92]	; (8001e24 <TIM_TimeBaseInit+0x9c>)
 8001dc8:	4290      	cmp	r0, r2
 8001dca:	d008      	beq.n	8001dde <TIM_TimeBaseInit+0x56>
 8001dcc:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001dd0:	4290      	cmp	r0, r2
 8001dd2:	d004      	beq.n	8001dde <TIM_TimeBaseInit+0x56>
 8001dd4:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001dd8:	890a      	ldrh	r2, [r1, #8]
 8001dda:	b29b      	uxth	r3, r3
 8001ddc:	4313      	orrs	r3, r2
 8001dde:	8003      	strh	r3, [r0, #0]
 8001de0:	684b      	ldr	r3, [r1, #4]
 8001de2:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001de4:	880b      	ldrh	r3, [r1, #0]
 8001de6:	8503      	strh	r3, [r0, #40]	; 0x28
 8001de8:	4b0d      	ldr	r3, [pc, #52]	; (8001e20 <TIM_TimeBaseInit+0x98>)
 8001dea:	4298      	cmp	r0, r3
 8001dec:	d013      	beq.n	8001e16 <TIM_TimeBaseInit+0x8e>
 8001dee:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001df2:	4298      	cmp	r0, r3
 8001df4:	d00f      	beq.n	8001e16 <TIM_TimeBaseInit+0x8e>
 8001df6:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 8001dfa:	4298      	cmp	r0, r3
 8001dfc:	d00b      	beq.n	8001e16 <TIM_TimeBaseInit+0x8e>
 8001dfe:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001e02:	4298      	cmp	r0, r3
 8001e04:	d007      	beq.n	8001e16 <TIM_TimeBaseInit+0x8e>
 8001e06:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001e0a:	4298      	cmp	r0, r3
 8001e0c:	d003      	beq.n	8001e16 <TIM_TimeBaseInit+0x8e>
 8001e0e:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001e12:	4298      	cmp	r0, r3
 8001e14:	d101      	bne.n	8001e1a <TIM_TimeBaseInit+0x92>
 8001e16:	894b      	ldrh	r3, [r1, #10]
 8001e18:	8603      	strh	r3, [r0, #48]	; 0x30
 8001e1a:	2301      	movs	r3, #1
 8001e1c:	6143      	str	r3, [r0, #20]
 8001e1e:	4770      	bx	lr
 8001e20:	40012c00 	.word	0x40012c00
 8001e24:	40001000 	.word	0x40001000

08001e28 <TIM_Cmd>:
 8001e28:	bf00      	nop
 8001e2a:	bf00      	nop
 8001e2c:	8803      	ldrh	r3, [r0, #0]
 8001e2e:	b119      	cbz	r1, 8001e38 <TIM_Cmd+0x10>
 8001e30:	b29b      	uxth	r3, r3
 8001e32:	f043 0301 	orr.w	r3, r3, #1
 8001e36:	e003      	b.n	8001e40 <TIM_Cmd+0x18>
 8001e38:	f023 0301 	bic.w	r3, r3, #1
 8001e3c:	041b      	lsls	r3, r3, #16
 8001e3e:	0c1b      	lsrs	r3, r3, #16
 8001e40:	8003      	strh	r3, [r0, #0]
 8001e42:	4770      	bx	lr

08001e44 <TIM_ClearITPendingBit>:
 8001e44:	bf00      	nop
 8001e46:	43c9      	mvns	r1, r1
 8001e48:	b289      	uxth	r1, r1
 8001e4a:	6101      	str	r1, [r0, #16]
 8001e4c:	4770      	bx	lr
	...

08001e50 <timer_init>:
 8001e50:	b530      	push	{r4, r5, lr}
 8001e52:	2300      	movs	r3, #0
 8001e54:	b085      	sub	sp, #20
 8001e56:	491f      	ldr	r1, [pc, #124]	; (8001ed4 <timer_init+0x84>)
 8001e58:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001e5c:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001e60:	491d      	ldr	r1, [pc, #116]	; (8001ed8 <timer_init+0x88>)
 8001e62:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001e66:	4a1d      	ldr	r2, [pc, #116]	; (8001edc <timer_init+0x8c>)
 8001e68:	2400      	movs	r4, #0
 8001e6a:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8001e6e:	3301      	adds	r3, #1
 8001e70:	2b04      	cmp	r3, #4
 8001e72:	4625      	mov	r5, r4
 8001e74:	d1ef      	bne.n	8001e56 <timer_init+0x6>
 8001e76:	4b1a      	ldr	r3, [pc, #104]	; (8001ee0 <timer_init+0x90>)
 8001e78:	2002      	movs	r0, #2
 8001e7a:	2101      	movs	r1, #1
 8001e7c:	601c      	str	r4, [r3, #0]
 8001e7e:	f7ff ff75 	bl	8001d6c <RCC_APB1PeriphClockCmd>
 8001e82:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001e86:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001e8a:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001e8e:	4c15      	ldr	r4, [pc, #84]	; (8001ee4 <timer_init+0x94>)
 8001e90:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001e94:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001e98:	4620      	mov	r0, r4
 8001e9a:	2331      	movs	r3, #49	; 0x31
 8001e9c:	a901      	add	r1, sp, #4
 8001e9e:	9302      	str	r3, [sp, #8]
 8001ea0:	f7ff ff72 	bl	8001d88 <TIM_TimeBaseInit>
 8001ea4:	4620      	mov	r0, r4
 8001ea6:	2101      	movs	r1, #1
 8001ea8:	f7ff ffbe 	bl	8001e28 <TIM_Cmd>
 8001eac:	68e3      	ldr	r3, [r4, #12]
 8001eae:	f043 0301 	orr.w	r3, r3, #1
 8001eb2:	60e3      	str	r3, [r4, #12]
 8001eb4:	231d      	movs	r3, #29
 8001eb6:	f88d 3000 	strb.w	r3, [sp]
 8001eba:	4668      	mov	r0, sp
 8001ebc:	2301      	movs	r3, #1
 8001ebe:	f88d 5001 	strb.w	r5, [sp, #1]
 8001ec2:	f88d 3002 	strb.w	r3, [sp, #2]
 8001ec6:	f88d 3003 	strb.w	r3, [sp, #3]
 8001eca:	f7ff fb81 	bl	80015d0 <NVIC_Init>
 8001ece:	b005      	add	sp, #20
 8001ed0:	bd30      	pop	{r4, r5, pc}
 8001ed2:	bf00      	nop
 8001ed4:	200009e4 	.word	0x200009e4
 8001ed8:	200009d8 	.word	0x200009d8
 8001edc:	200009d0 	.word	0x200009d0
 8001ee0:	200009e0 	.word	0x200009e0
 8001ee4:	40000400 	.word	0x40000400

08001ee8 <TIM3_IRQHandler>:
 8001ee8:	2300      	movs	r3, #0
 8001eea:	4a10      	ldr	r2, [pc, #64]	; (8001f2c <TIM3_IRQHandler+0x44>)
 8001eec:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001ef0:	b289      	uxth	r1, r1
 8001ef2:	b129      	cbz	r1, 8001f00 <TIM3_IRQHandler+0x18>
 8001ef4:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001ef8:	b289      	uxth	r1, r1
 8001efa:	3901      	subs	r1, #1
 8001efc:	b289      	uxth	r1, r1
 8001efe:	e007      	b.n	8001f10 <TIM3_IRQHandler+0x28>
 8001f00:	490b      	ldr	r1, [pc, #44]	; (8001f30 <TIM3_IRQHandler+0x48>)
 8001f02:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001f06:	b289      	uxth	r1, r1
 8001f08:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001f0c:	4a09      	ldr	r2, [pc, #36]	; (8001f34 <TIM3_IRQHandler+0x4c>)
 8001f0e:	2101      	movs	r1, #1
 8001f10:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001f14:	3301      	adds	r3, #1
 8001f16:	2b04      	cmp	r3, #4
 8001f18:	d1e7      	bne.n	8001eea <TIM3_IRQHandler+0x2>
 8001f1a:	4b07      	ldr	r3, [pc, #28]	; (8001f38 <TIM3_IRQHandler+0x50>)
 8001f1c:	4807      	ldr	r0, [pc, #28]	; (8001f3c <TIM3_IRQHandler+0x54>)
 8001f1e:	681a      	ldr	r2, [r3, #0]
 8001f20:	2101      	movs	r1, #1
 8001f22:	3201      	adds	r2, #1
 8001f24:	601a      	str	r2, [r3, #0]
 8001f26:	f7ff bf8d 	b.w	8001e44 <TIM_ClearITPendingBit>
 8001f2a:	bf00      	nop
 8001f2c:	200009e4 	.word	0x200009e4
 8001f30:	200009d8 	.word	0x200009d8
 8001f34:	200009d0 	.word	0x200009d0
 8001f38:	200009e0 	.word	0x200009e0
 8001f3c:	40000400 	.word	0x40000400

08001f40 <timer_get_time>:
 8001f40:	b082      	sub	sp, #8
 8001f42:	b672      	cpsid	i
 8001f44:	4b04      	ldr	r3, [pc, #16]	; (8001f58 <timer_get_time+0x18>)
 8001f46:	681b      	ldr	r3, [r3, #0]
 8001f48:	9301      	str	r3, [sp, #4]
 8001f4a:	b662      	cpsie	i
 8001f4c:	9801      	ldr	r0, [sp, #4]
 8001f4e:	230a      	movs	r3, #10
 8001f50:	fbb0 f0f3 	udiv	r0, r0, r3
 8001f54:	b002      	add	sp, #8
 8001f56:	4770      	bx	lr
 8001f58:	200009e0 	.word	0x200009e0

08001f5c <timer_delay_ms>:
 8001f5c:	b513      	push	{r0, r1, r4, lr}
 8001f5e:	4604      	mov	r4, r0
 8001f60:	f7ff ffee 	bl	8001f40 <timer_get_time>
 8001f64:	4420      	add	r0, r4
 8001f66:	9001      	str	r0, [sp, #4]
 8001f68:	9c01      	ldr	r4, [sp, #4]
 8001f6a:	f7ff ffe9 	bl	8001f40 <timer_get_time>
 8001f6e:	4284      	cmp	r4, r0
 8001f70:	d902      	bls.n	8001f78 <timer_delay_ms+0x1c>
 8001f72:	f7ff fccd 	bl	8001910 <sleep>
 8001f76:	e7f7      	b.n	8001f68 <timer_delay_ms+0xc>
 8001f78:	b002      	add	sp, #8
 8001f7a:	bd10      	pop	{r4, pc}

08001f7c <event_timer_set_period>:
 8001f7c:	b672      	cpsid	i
 8001f7e:	230a      	movs	r3, #10
 8001f80:	4359      	muls	r1, r3
 8001f82:	4b06      	ldr	r3, [pc, #24]	; (8001f9c <event_timer_set_period+0x20>)
 8001f84:	b289      	uxth	r1, r1
 8001f86:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001f8a:	4b05      	ldr	r3, [pc, #20]	; (8001fa0 <event_timer_set_period+0x24>)
 8001f8c:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001f90:	4b04      	ldr	r3, [pc, #16]	; (8001fa4 <event_timer_set_period+0x28>)
 8001f92:	2200      	movs	r2, #0
 8001f94:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 8001f98:	b662      	cpsie	i
 8001f9a:	4770      	bx	lr
 8001f9c:	200009e4 	.word	0x200009e4
 8001fa0:	200009d8 	.word	0x200009d8
 8001fa4:	200009d0 	.word	0x200009d0

08001fa8 <event_timer_wait>:
 8001fa8:	b510      	push	{r4, lr}
 8001faa:	4604      	mov	r4, r0
 8001fac:	4b06      	ldr	r3, [pc, #24]	; (8001fc8 <event_timer_wait+0x20>)
 8001fae:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 8001fb2:	b292      	uxth	r2, r2
 8001fb4:	b912      	cbnz	r2, 8001fbc <event_timer_wait+0x14>
 8001fb6:	f7ff fcab 	bl	8001910 <sleep>
 8001fba:	e7f7      	b.n	8001fac <event_timer_wait+0x4>
 8001fbc:	b672      	cpsid	i
 8001fbe:	2200      	movs	r2, #0
 8001fc0:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 8001fc4:	b662      	cpsie	i
 8001fc6:	bd10      	pop	{r4, pc}
 8001fc8:	200009d0 	.word	0x200009d0

08001fcc <GPIO_Init>:
 8001fcc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001fce:	bf00      	nop
 8001fd0:	bf00      	nop
 8001fd2:	bf00      	nop
 8001fd4:	bf00      	nop
 8001fd6:	2300      	movs	r3, #0
 8001fd8:	680e      	ldr	r6, [r1, #0]
 8001fda:	461a      	mov	r2, r3
 8001fdc:	2501      	movs	r5, #1
 8001fde:	4095      	lsls	r5, r2
 8001fe0:	ea05 0406 	and.w	r4, r5, r6
 8001fe4:	42ac      	cmp	r4, r5
 8001fe6:	d131      	bne.n	800204c <GPIO_Init+0x80>
 8001fe8:	790d      	ldrb	r5, [r1, #4]
 8001fea:	1e6f      	subs	r7, r5, #1
 8001fec:	b2ff      	uxtb	r7, r7
 8001fee:	2f01      	cmp	r7, #1
 8001ff0:	d81c      	bhi.n	800202c <GPIO_Init+0x60>
 8001ff2:	bf00      	nop
 8001ff4:	f04f 0c03 	mov.w	ip, #3
 8001ff8:	6887      	ldr	r7, [r0, #8]
 8001ffa:	fa0c fc03 	lsl.w	ip, ip, r3
 8001ffe:	ea27 070c 	bic.w	r7, r7, ip
 8002002:	6087      	str	r7, [r0, #8]
 8002004:	f891 c005 	ldrb.w	ip, [r1, #5]
 8002008:	6887      	ldr	r7, [r0, #8]
 800200a:	fa0c fc03 	lsl.w	ip, ip, r3
 800200e:	ea4c 0707 	orr.w	r7, ip, r7
 8002012:	6087      	str	r7, [r0, #8]
 8002014:	bf00      	nop
 8002016:	8887      	ldrh	r7, [r0, #4]
 8002018:	b2bf      	uxth	r7, r7
 800201a:	ea27 0404 	bic.w	r4, r7, r4
 800201e:	8084      	strh	r4, [r0, #4]
 8002020:	798c      	ldrb	r4, [r1, #6]
 8002022:	8887      	ldrh	r7, [r0, #4]
 8002024:	4094      	lsls	r4, r2
 8002026:	433c      	orrs	r4, r7
 8002028:	b2a4      	uxth	r4, r4
 800202a:	8084      	strh	r4, [r0, #4]
 800202c:	2403      	movs	r4, #3
 800202e:	6807      	ldr	r7, [r0, #0]
 8002030:	409c      	lsls	r4, r3
 8002032:	43e4      	mvns	r4, r4
 8002034:	4027      	ands	r7, r4
 8002036:	6007      	str	r7, [r0, #0]
 8002038:	6807      	ldr	r7, [r0, #0]
 800203a:	409d      	lsls	r5, r3
 800203c:	433d      	orrs	r5, r7
 800203e:	6005      	str	r5, [r0, #0]
 8002040:	68c5      	ldr	r5, [r0, #12]
 8002042:	402c      	ands	r4, r5
 8002044:	79cd      	ldrb	r5, [r1, #7]
 8002046:	409d      	lsls	r5, r3
 8002048:	432c      	orrs	r4, r5
 800204a:	60c4      	str	r4, [r0, #12]
 800204c:	3201      	adds	r2, #1
 800204e:	2a10      	cmp	r2, #16
 8002050:	f103 0302 	add.w	r3, r3, #2
 8002054:	d1c2      	bne.n	8001fdc <GPIO_Init+0x10>
 8002056:	bdf0      	pop	{r4, r5, r6, r7, pc}

08002058 <GPIO_SetBits>:
 8002058:	bf00      	nop
 800205a:	bf00      	nop
 800205c:	6181      	str	r1, [r0, #24]
 800205e:	4770      	bx	lr

08002060 <GPIO_ResetBits>:
 8002060:	bf00      	nop
 8002062:	bf00      	nop
 8002064:	8501      	strh	r1, [r0, #40]	; 0x28
 8002066:	4770      	bx	lr

08002068 <GPIO_PinAFConfig>:
 8002068:	b510      	push	{r4, lr}
 800206a:	bf00      	nop
 800206c:	bf00      	nop
 800206e:	bf00      	nop
 8002070:	f001 0307 	and.w	r3, r1, #7
 8002074:	08c9      	lsrs	r1, r1, #3
 8002076:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 800207a:	009b      	lsls	r3, r3, #2
 800207c:	6a04      	ldr	r4, [r0, #32]
 800207e:	210f      	movs	r1, #15
 8002080:	4099      	lsls	r1, r3
 8002082:	ea24 0101 	bic.w	r1, r4, r1
 8002086:	6201      	str	r1, [r0, #32]
 8002088:	6a01      	ldr	r1, [r0, #32]
 800208a:	fa02 f303 	lsl.w	r3, r2, r3
 800208e:	430b      	orrs	r3, r1
 8002090:	6203      	str	r3, [r0, #32]
 8002092:	bd10      	pop	{r4, pc}

08002094 <led_on>:
 8002094:	0401      	lsls	r1, r0, #16
 8002096:	d503      	bpl.n	80020a0 <led_on+0xc>
 8002098:	4b08      	ldr	r3, [pc, #32]	; (80020bc <led_on+0x28>)
 800209a:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800209e:	619a      	str	r2, [r3, #24]
 80020a0:	0702      	lsls	r2, r0, #28
 80020a2:	d503      	bpl.n	80020ac <led_on+0x18>
 80020a4:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80020a8:	2208      	movs	r2, #8
 80020aa:	851a      	strh	r2, [r3, #40]	; 0x28
 80020ac:	07c3      	lsls	r3, r0, #31
 80020ae:	d503      	bpl.n	80020b8 <led_on+0x24>
 80020b0:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80020b4:	2201      	movs	r2, #1
 80020b6:	619a      	str	r2, [r3, #24]
 80020b8:	4770      	bx	lr
 80020ba:	bf00      	nop
 80020bc:	48000400 	.word	0x48000400

080020c0 <led_off>:
 80020c0:	0402      	lsls	r2, r0, #16
 80020c2:	d503      	bpl.n	80020cc <led_off+0xc>
 80020c4:	4b08      	ldr	r3, [pc, #32]	; (80020e8 <led_off+0x28>)
 80020c6:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80020ca:	851a      	strh	r2, [r3, #40]	; 0x28
 80020cc:	0703      	lsls	r3, r0, #28
 80020ce:	d503      	bpl.n	80020d8 <led_off+0x18>
 80020d0:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80020d4:	2208      	movs	r2, #8
 80020d6:	619a      	str	r2, [r3, #24]
 80020d8:	07c0      	lsls	r0, r0, #31
 80020da:	d503      	bpl.n	80020e4 <led_off+0x24>
 80020dc:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80020e0:	2201      	movs	r2, #1
 80020e2:	851a      	strh	r2, [r3, #40]	; 0x28
 80020e4:	4770      	bx	lr
 80020e6:	bf00      	nop
 80020e8:	48000400 	.word	0x48000400

080020ec <gpio_init>:
 80020ec:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 80020f0:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80020f4:	2101      	movs	r1, #1
 80020f6:	f7ff fe1d 	bl	8001d34 <RCC_AHBPeriphClockCmd>
 80020fa:	f8df 90a8 	ldr.w	r9, [pc, #168]	; 80021a4 <gpio_init+0xb8>
 80020fe:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8002102:	2101      	movs	r1, #1
 8002104:	f7ff fe16 	bl	8001d34 <RCC_AHBPeriphClockCmd>
 8002108:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 800210c:	2101      	movs	r1, #1
 800210e:	f7ff fe11 	bl	8001d34 <RCC_AHBPeriphClockCmd>
 8002112:	2400      	movs	r4, #0
 8002114:	2501      	movs	r5, #1
 8002116:	2603      	movs	r6, #3
 8002118:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 800211c:	4648      	mov	r0, r9
 800211e:	4669      	mov	r1, sp
 8002120:	2708      	movs	r7, #8
 8002122:	f8cd 8000 	str.w	r8, [sp]
 8002126:	f88d 5004 	strb.w	r5, [sp, #4]
 800212a:	f88d 4006 	strb.w	r4, [sp, #6]
 800212e:	f88d 6005 	strb.w	r6, [sp, #5]
 8002132:	f88d 4007 	strb.w	r4, [sp, #7]
 8002136:	f7ff ff49 	bl	8001fcc <GPIO_Init>
 800213a:	4669      	mov	r1, sp
 800213c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8002140:	9700      	str	r7, [sp, #0]
 8002142:	f88d 5004 	strb.w	r5, [sp, #4]
 8002146:	f88d 4006 	strb.w	r4, [sp, #6]
 800214a:	f88d 6005 	strb.w	r6, [sp, #5]
 800214e:	f88d 4007 	strb.w	r4, [sp, #7]
 8002152:	f7ff ff3b 	bl	8001fcc <GPIO_Init>
 8002156:	4669      	mov	r1, sp
 8002158:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800215c:	9500      	str	r5, [sp, #0]
 800215e:	f88d 5004 	strb.w	r5, [sp, #4]
 8002162:	f88d 4006 	strb.w	r4, [sp, #6]
 8002166:	f88d 6005 	strb.w	r6, [sp, #5]
 800216a:	f88d 4007 	strb.w	r4, [sp, #7]
 800216e:	f7ff ff2d 	bl	8001fcc <GPIO_Init>
 8002172:	f44f 7300 	mov.w	r3, #512	; 0x200
 8002176:	4669      	mov	r1, sp
 8002178:	4648      	mov	r0, r9
 800217a:	9300      	str	r3, [sp, #0]
 800217c:	f88d 4004 	strb.w	r4, [sp, #4]
 8002180:	f88d 6005 	strb.w	r6, [sp, #5]
 8002184:	f88d 4007 	strb.w	r4, [sp, #7]
 8002188:	f7ff ff20 	bl	8001fcc <GPIO_Init>
 800218c:	4640      	mov	r0, r8
 800218e:	f7ff ff81 	bl	8002094 <led_on>
 8002192:	4638      	mov	r0, r7
 8002194:	f7ff ff94 	bl	80020c0 <led_off>
 8002198:	4628      	mov	r0, r5
 800219a:	f7ff ff91 	bl	80020c0 <led_off>
 800219e:	b003      	add	sp, #12
 80021a0:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80021a4:	48000400 	.word	0x48000400

080021a8 <get_key>:
 80021a8:	4b02      	ldr	r3, [pc, #8]	; (80021b4 <get_key+0xc>)
 80021aa:	8a18      	ldrh	r0, [r3, #16]
 80021ac:	43c0      	mvns	r0, r0
 80021ae:	f400 7000 	and.w	r0, r0, #512	; 0x200
 80021b2:	4770      	bx	lr
 80021b4:	48000400 	.word	0x48000400

080021b8 <_init>:
 80021b8:	e1a0c00d 	mov	ip, sp
 80021bc:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80021c0:	e24cb004 	sub	fp, ip, #4
 80021c4:	e24bd028 	sub	sp, fp, #40	; 0x28
 80021c8:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80021cc:	e12fff1e 	bx	lr

080021d0 <_fini>:
 80021d0:	e1a0c00d 	mov	ip, sp
 80021d4:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80021d8:	e24cb004 	sub	fp, ip, #4
 80021dc:	e24bd028 	sub	sp, fp, #40	; 0x28
 80021e0:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80021e4:	e12fff1e 	bx	lr
 80021e8:	69647473 	.word	0x69647473
 80021ec:	6e69206f 	.word	0x6e69206f
 80021f0:	64207469 	.word	0x64207469
 80021f4:	0a656e6f 	.word	0x0a656e6f
 80021f8:	00          	.byte	0x00
 80021f9:	41          	.byte	0x41
 80021fa:	2b54      	.short	0x2b54
 80021fc:	4d504943 	.word	0x4d504943
 8002200:	313d5855 	.word	0x313d5855
 8002204:	41000a0d 	.word	0x41000a0d
 8002208:	49432b54 	.word	0x49432b54
 800220c:	58554d50 	.word	0x58554d50
 8002210:	0a0d303d 	.word	0x0a0d303d
 8002214:	2b544100 	.word	0x2b544100
 8002218:	4f4d5743 	.word	0x4f4d5743
 800221c:	313d4544 	.word	0x313d4544
 8002220:	41000a0d 	.word	0x41000a0d
 8002224:	57432b54 	.word	0x57432b54
 8002228:	3d50414a 	.word	0x3d50414a
 800222c:	69640022 	.word	0x69640022
 8002230:	6e6f6373 	.word	0x6e6f6373
 8002234:	7463656e 	.word	0x7463656e
 8002238:	76006465 	.word	0x76006465
 800223c:	68797265 	.word	0x68797265
 8002240:	00647261 	.word	0x00647261
 8002244:	000a0d22 	.word	0x000a0d22
 8002248:	432b5441 	.word	0x432b5441
 800224c:	45535049 	.word	0x45535049
 8002250:	52455652 	.word	0x52455652
 8002254:	382c313d 	.word	0x382c313d
 8002258:	000a0d30 	.word	0x000a0d30
 800225c:	432b5441 	.word	0x432b5441
 8002260:	54535049 	.word	0x54535049
 8002264:	3d545241 	.word	0x3d545241
 8002268:	50435422 	.word	0x50435422
 800226c:	00222c22 	.word	0x00222c22
 8002270:	41002c22 	.word	0x41002c22
 8002274:	49432b54 	.word	0x49432b54
 8002278:	4e455350 	.word	0x4e455350
 800227c:	3e003d44 	.word	0x3e003d44
 8002280:	2b544100 	.word	0x2b544100
 8002284:	43504943 	.word	0x43504943
 8002288:	45534f4c 	.word	0x45534f4c
 800228c:	53000a0d 	.word	0x53000a0d
 8002290:	20444e45 	.word	0x20444e45
 8002294:	2b004b4f 	.word	0x2b004b4f
 8002298:	2c445049 	.word	0x2c445049
 800229c:	00          	.byte	0x00
 800229d:	0a          	.byte	0x0a
 800229e:	6577      	.short	0x6577
 80022a0:	6d6f636c 	.word	0x6d6f636c
 80022a4:	6f742065 	.word	0x6f742065
 80022a8:	7a755320 	.word	0x7a755320
 80022ac:	4f616875 	.word	0x4f616875
 80022b0:	5f5e2053 	.word	0x5f5e2053
 80022b4:	2e32205e 	.word	0x2e32205e
 80022b8:	0a362e30 	.word	0x0a362e30
 80022bc:	4c495542 	.word	0x4c495542
 80022c0:	65462044 	.word	0x65462044
 80022c4:	30322062 	.word	0x30322062
 80022c8:	31303220 	.word	0x31303220
 80022cc:	33312036 	.word	0x33312036
 80022d0:	3a37303a 	.word	0x3a37303a
 80022d4:	000a3230 	.word	0x000a3230
 80022d8:	2e323931 	.word	0x2e323931
 80022dc:	2e383631 	.word	0x2e383631
 80022e0:	00322e32 	.word	0x00322e32
 80022e4:	38707365 	.word	0x38707365
 80022e8:	20363632 	.word	0x20363632
 80022ec:	7373656d 	.word	0x7373656d
 80022f0:	00656761 	.word	0x00656761
 80022f4:	6f727265 	.word	0x6f727265
 80022f8:	6f632072 	.word	0x6f632072
 80022fc:	25206564 	.word	0x25206564
 8002300:	75253a75 	.word	0x75253a75
 8002304:	0000000a 	.word	0x0000000a

08002308 <__EH_FRAME_BEGIN__>:
 8002308:	00000000                                ....
