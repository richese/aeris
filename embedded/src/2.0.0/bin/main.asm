
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <main>:
 8000188:	b508      	push	{r3, lr}
 800018a:	f001 fa9d 	bl	80016c8 <lib_low_level_init>
 800018e:	f000 f921 	bl	80003d4 <lib_os_init>
 8000192:	4905      	ldr	r1, [pc, #20]	; (80001a8 <main+0x20>)
 8000194:	4805      	ldr	r0, [pc, #20]	; (80001ac <main+0x24>)
 8000196:	f44f 7200 	mov.w	r2, #512	; 0x200
 800019a:	2306      	movs	r3, #6
 800019c:	f000 f88a 	bl	80002b4 <create_thread>
 80001a0:	f000 f882 	bl	80002a8 <kernel_start>
 80001a4:	2000      	movs	r0, #0
 80001a6:	bd08      	pop	{r3, pc}
 80001a8:	20000684 	.word	0x20000684
 80001ac:	080010b5 	.word	0x080010b5

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
 80001c8:	200008cc 	.word	0x200008cc
 80001cc:	20000884 	.word	0x20000884

080001d0 <null_thread>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f001 fc23 	bl	8001a1c <sleep>
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
 8000234:	20000884 	.word	0x20000884
 8000238:	200008cc 	.word	0x200008cc

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
 800027c:	200008cc 	.word	0x200008cc
 8000280:	20000884 	.word	0x20000884

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
 80002a4:	200008cc 	.word	0x200008cc

080002a8 <kernel_start>:
 80002a8:	b508      	push	{r3, lr}
 80002aa:	f001 fba5 	bl	80019f8 <sys_tick_init>
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
 8000320:	20000884 	.word	0x20000884
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
 800035c:	20000884 	.word	0x20000884
 8000360:	200008cc 	.word	0x200008cc
 8000364:	080001d1 	.word	0x080001d1
 8000368:	200008d0 	.word	0x200008d0

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
 80003ac:	20000884 	.word	0x20000884

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
 80003d0:	20000884 	.word	0x20000884

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
 8000402:	f000 ffeb 	bl	80013dc <uart_write>
 8000406:	4620      	mov	r0, r4
 8000408:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800040c:	f000 b926 	b.w	800065c <mutex_unlock>
 8000410:	20000950 	.word	0x20000950

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
 8000438:	2000095c 	.word	0x2000095c

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
 8000588:	20000958 	.word	0x20000958

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
 80005c8:	20000950 	.word	0x20000950
 80005cc:	20000954 	.word	0x20000954
 80005d0:	2000095c 	.word	0x2000095c
 80005d4:	20000958 	.word	0x20000958
 80005d8:	080022f4 	.word	0x080022f4

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
 8000608:	20000960 	.word	0x20000960
 800060c:	20000978 	.word	0x20000978

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
 8000676:	f001 f953 	bl	8001920 <i2c_write_reg>
 800067a:	203c      	movs	r0, #60	; 0x3c
 800067c:	2120      	movs	r1, #32
 800067e:	2200      	movs	r2, #0
 8000680:	f001 f94e 	bl	8001920 <i2c_write_reg>
 8000684:	203c      	movs	r0, #60	; 0x3c
 8000686:	2124      	movs	r1, #36	; 0x24
 8000688:	2200      	movs	r2, #0
 800068a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800068e:	f001 b947 	b.w	8001920 <i2c_write_reg>
	...

08000694 <lsm9ds0_read>:
 8000694:	b538      	push	{r3, r4, r5, lr}
 8000696:	2128      	movs	r1, #40	; 0x28
 8000698:	20d4      	movs	r0, #212	; 0xd4
 800069a:	f001 f954 	bl	8001946 <i2c_read_reg>
 800069e:	2129      	movs	r1, #41	; 0x29
 80006a0:	4604      	mov	r4, r0
 80006a2:	20d4      	movs	r0, #212	; 0xd4
 80006a4:	f001 f94f 	bl	8001946 <i2c_read_reg>
 80006a8:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
 80006ac:	4c46      	ldr	r4, [pc, #280]	; (80007c8 <lsm9ds0_read+0x134>)
 80006ae:	b280      	uxth	r0, r0
 80006b0:	81a0      	strh	r0, [r4, #12]
 80006b2:	89a2      	ldrh	r2, [r4, #12]
 80006b4:	8a63      	ldrh	r3, [r4, #18]
 80006b6:	b292      	uxth	r2, r2
 80006b8:	b29b      	uxth	r3, r3
 80006ba:	1ad3      	subs	r3, r2, r3
 80006bc:	b29b      	uxth	r3, r3
 80006be:	212a      	movs	r1, #42	; 0x2a
 80006c0:	20d4      	movs	r0, #212	; 0xd4
 80006c2:	8323      	strh	r3, [r4, #24]
 80006c4:	f001 f93f 	bl	8001946 <i2c_read_reg>
 80006c8:	212b      	movs	r1, #43	; 0x2b
 80006ca:	4605      	mov	r5, r0
 80006cc:	20d4      	movs	r0, #212	; 0xd4
 80006ce:	f001 f93a 	bl	8001946 <i2c_read_reg>
 80006d2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006d6:	b285      	uxth	r5, r0
 80006d8:	81e5      	strh	r5, [r4, #14]
 80006da:	89e2      	ldrh	r2, [r4, #14]
 80006dc:	8aa3      	ldrh	r3, [r4, #20]
 80006de:	b292      	uxth	r2, r2
 80006e0:	b29b      	uxth	r3, r3
 80006e2:	1ad3      	subs	r3, r2, r3
 80006e4:	b29b      	uxth	r3, r3
 80006e6:	212c      	movs	r1, #44	; 0x2c
 80006e8:	20d4      	movs	r0, #212	; 0xd4
 80006ea:	8363      	strh	r3, [r4, #26]
 80006ec:	f001 f92b 	bl	8001946 <i2c_read_reg>
 80006f0:	212d      	movs	r1, #45	; 0x2d
 80006f2:	4605      	mov	r5, r0
 80006f4:	20d4      	movs	r0, #212	; 0xd4
 80006f6:	f001 f926 	bl	8001946 <i2c_read_reg>
 80006fa:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006fe:	b285      	uxth	r5, r0
 8000700:	8225      	strh	r5, [r4, #16]
 8000702:	8a22      	ldrh	r2, [r4, #16]
 8000704:	8ae3      	ldrh	r3, [r4, #22]
 8000706:	b292      	uxth	r2, r2
 8000708:	b29b      	uxth	r3, r3
 800070a:	1ad3      	subs	r3, r2, r3
 800070c:	b29b      	uxth	r3, r3
 800070e:	2108      	movs	r1, #8
 8000710:	203c      	movs	r0, #60	; 0x3c
 8000712:	83a3      	strh	r3, [r4, #28]
 8000714:	f001 f917 	bl	8001946 <i2c_read_reg>
 8000718:	2109      	movs	r1, #9
 800071a:	4605      	mov	r5, r0
 800071c:	203c      	movs	r0, #60	; 0x3c
 800071e:	f001 f912 	bl	8001946 <i2c_read_reg>
 8000722:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000726:	b285      	uxth	r5, r0
 8000728:	210a      	movs	r1, #10
 800072a:	203c      	movs	r0, #60	; 0x3c
 800072c:	80e5      	strh	r5, [r4, #6]
 800072e:	f001 f90a 	bl	8001946 <i2c_read_reg>
 8000732:	210b      	movs	r1, #11
 8000734:	4605      	mov	r5, r0
 8000736:	203c      	movs	r0, #60	; 0x3c
 8000738:	f001 f905 	bl	8001946 <i2c_read_reg>
 800073c:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000740:	b285      	uxth	r5, r0
 8000742:	210c      	movs	r1, #12
 8000744:	203c      	movs	r0, #60	; 0x3c
 8000746:	8125      	strh	r5, [r4, #8]
 8000748:	f001 f8fd 	bl	8001946 <i2c_read_reg>
 800074c:	210d      	movs	r1, #13
 800074e:	4605      	mov	r5, r0
 8000750:	203c      	movs	r0, #60	; 0x3c
 8000752:	f001 f8f8 	bl	8001946 <i2c_read_reg>
 8000756:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800075a:	b285      	uxth	r5, r0
 800075c:	2128      	movs	r1, #40	; 0x28
 800075e:	203c      	movs	r0, #60	; 0x3c
 8000760:	8165      	strh	r5, [r4, #10]
 8000762:	f001 f8f0 	bl	8001946 <i2c_read_reg>
 8000766:	2129      	movs	r1, #41	; 0x29
 8000768:	4605      	mov	r5, r0
 800076a:	203c      	movs	r0, #60	; 0x3c
 800076c:	f001 f8eb 	bl	8001946 <i2c_read_reg>
 8000770:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000774:	b285      	uxth	r5, r0
 8000776:	212a      	movs	r1, #42	; 0x2a
 8000778:	203c      	movs	r0, #60	; 0x3c
 800077a:	8025      	strh	r5, [r4, #0]
 800077c:	f001 f8e3 	bl	8001946 <i2c_read_reg>
 8000780:	212b      	movs	r1, #43	; 0x2b
 8000782:	4605      	mov	r5, r0
 8000784:	203c      	movs	r0, #60	; 0x3c
 8000786:	f001 f8de 	bl	8001946 <i2c_read_reg>
 800078a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800078e:	b285      	uxth	r5, r0
 8000790:	212c      	movs	r1, #44	; 0x2c
 8000792:	203c      	movs	r0, #60	; 0x3c
 8000794:	8065      	strh	r5, [r4, #2]
 8000796:	f001 f8d6 	bl	8001946 <i2c_read_reg>
 800079a:	212d      	movs	r1, #45	; 0x2d
 800079c:	4605      	mov	r5, r0
 800079e:	203c      	movs	r0, #60	; 0x3c
 80007a0:	f001 f8d1 	bl	8001946 <i2c_read_reg>
 80007a4:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007a8:	b285      	uxth	r5, r0
 80007aa:	2105      	movs	r1, #5
 80007ac:	203c      	movs	r0, #60	; 0x3c
 80007ae:	80a5      	strh	r5, [r4, #4]
 80007b0:	f001 f8c9 	bl	8001946 <i2c_read_reg>
 80007b4:	2106      	movs	r1, #6
 80007b6:	4605      	mov	r5, r0
 80007b8:	203c      	movs	r0, #60	; 0x3c
 80007ba:	f001 f8c4 	bl	8001946 <i2c_read_reg>
 80007be:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007c2:	b285      	uxth	r5, r0
 80007c4:	83e5      	strh	r5, [r4, #30]
 80007c6:	bd38      	pop	{r3, r4, r5, pc}
 80007c8:	20000234 	.word	0x20000234

080007cc <lsm9ds0_gyro_calibrate>:
 80007cc:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 80007d0:	2500      	movs	r5, #0
 80007d2:	4681      	mov	r9, r0
 80007d4:	462f      	mov	r7, r5
 80007d6:	46a8      	mov	r8, r5
 80007d8:	462c      	mov	r4, r5
 80007da:	454c      	cmp	r4, r9
 80007dc:	4e10      	ldr	r6, [pc, #64]	; (8000820 <lsm9ds0_gyro_calibrate+0x54>)
 80007de:	d00f      	beq.n	8000800 <lsm9ds0_gyro_calibrate+0x34>
 80007e0:	f7ff ff58 	bl	8000694 <lsm9ds0_read>
 80007e4:	89b3      	ldrh	r3, [r6, #12]
 80007e6:	fa08 f883 	sxtah	r8, r8, r3
 80007ea:	89f3      	ldrh	r3, [r6, #14]
 80007ec:	fa07 f783 	sxtah	r7, r7, r3
 80007f0:	8a33      	ldrh	r3, [r6, #16]
 80007f2:	200a      	movs	r0, #10
 80007f4:	fa05 f583 	sxtah	r5, r5, r3
 80007f8:	3401      	adds	r4, #1
 80007fa:	f001 fc35 	bl	8002068 <timer_delay_ms>
 80007fe:	e7ec      	b.n	80007da <lsm9ds0_gyro_calibrate+0xe>
 8000800:	fb98 f8f4 	sdiv	r8, r8, r4
 8000804:	fb97 f7f4 	sdiv	r7, r7, r4
 8000808:	fb95 f4f4 	sdiv	r4, r5, r4
 800080c:	fa1f f888 	uxth.w	r8, r8
 8000810:	b2bf      	uxth	r7, r7
 8000812:	b2a4      	uxth	r4, r4
 8000814:	f8a6 8012 	strh.w	r8, [r6, #18]
 8000818:	82b7      	strh	r7, [r6, #20]
 800081a:	82f4      	strh	r4, [r6, #22]
 800081c:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000820:	20000234 	.word	0x20000234

08000824 <lsm9ds0_init>:
 8000824:	b538      	push	{r3, r4, r5, lr}
 8000826:	4b2a      	ldr	r3, [pc, #168]	; (80008d0 <lsm9ds0_init+0xac>)
 8000828:	2400      	movs	r4, #0
 800082a:	20d4      	movs	r0, #212	; 0xd4
 800082c:	210f      	movs	r1, #15
 800082e:	801c      	strh	r4, [r3, #0]
 8000830:	805c      	strh	r4, [r3, #2]
 8000832:	809c      	strh	r4, [r3, #4]
 8000834:	80dc      	strh	r4, [r3, #6]
 8000836:	811c      	strh	r4, [r3, #8]
 8000838:	815c      	strh	r4, [r3, #10]
 800083a:	819c      	strh	r4, [r3, #12]
 800083c:	81dc      	strh	r4, [r3, #14]
 800083e:	821c      	strh	r4, [r3, #16]
 8000840:	831c      	strh	r4, [r3, #24]
 8000842:	835c      	strh	r4, [r3, #26]
 8000844:	839c      	strh	r4, [r3, #28]
 8000846:	825c      	strh	r4, [r3, #18]
 8000848:	829c      	strh	r4, [r3, #20]
 800084a:	82dc      	strh	r4, [r3, #22]
 800084c:	83dc      	strh	r4, [r3, #30]
 800084e:	f001 f87a 	bl	8001946 <i2c_read_reg>
 8000852:	28d4      	cmp	r0, #212	; 0xd4
 8000854:	4605      	mov	r5, r0
 8000856:	d136      	bne.n	80008c6 <lsm9ds0_init+0xa2>
 8000858:	203c      	movs	r0, #60	; 0x3c
 800085a:	210f      	movs	r1, #15
 800085c:	f001 f873 	bl	8001946 <i2c_read_reg>
 8000860:	2849      	cmp	r0, #73	; 0x49
 8000862:	d132      	bne.n	80008ca <lsm9ds0_init+0xa6>
 8000864:	4628      	mov	r0, r5
 8000866:	2120      	movs	r1, #32
 8000868:	22ff      	movs	r2, #255	; 0xff
 800086a:	f001 f859 	bl	8001920 <i2c_write_reg>
 800086e:	4628      	mov	r0, r5
 8000870:	2123      	movs	r1, #35	; 0x23
 8000872:	2218      	movs	r2, #24
 8000874:	f001 f854 	bl	8001920 <i2c_write_reg>
 8000878:	4622      	mov	r2, r4
 800087a:	203c      	movs	r0, #60	; 0x3c
 800087c:	211f      	movs	r1, #31
 800087e:	f001 f84f 	bl	8001920 <i2c_write_reg>
 8000882:	203c      	movs	r0, #60	; 0x3c
 8000884:	2120      	movs	r1, #32
 8000886:	2267      	movs	r2, #103	; 0x67
 8000888:	f001 f84a 	bl	8001920 <i2c_write_reg>
 800088c:	4622      	mov	r2, r4
 800088e:	203c      	movs	r0, #60	; 0x3c
 8000890:	2121      	movs	r1, #33	; 0x21
 8000892:	f001 f845 	bl	8001920 <i2c_write_reg>
 8000896:	203c      	movs	r0, #60	; 0x3c
 8000898:	2124      	movs	r1, #36	; 0x24
 800089a:	22f4      	movs	r2, #244	; 0xf4
 800089c:	f001 f840 	bl	8001920 <i2c_write_reg>
 80008a0:	4622      	mov	r2, r4
 80008a2:	203c      	movs	r0, #60	; 0x3c
 80008a4:	2125      	movs	r1, #37	; 0x25
 80008a6:	f001 f83b 	bl	8001920 <i2c_write_reg>
 80008aa:	2126      	movs	r1, #38	; 0x26
 80008ac:	2280      	movs	r2, #128	; 0x80
 80008ae:	203c      	movs	r0, #60	; 0x3c
 80008b0:	f001 f836 	bl	8001920 <i2c_write_reg>
 80008b4:	f7ff feee 	bl	8000694 <lsm9ds0_read>
 80008b8:	2064      	movs	r0, #100	; 0x64
 80008ba:	f7ff ff87 	bl	80007cc <lsm9ds0_gyro_calibrate>
 80008be:	f7ff fee9 	bl	8000694 <lsm9ds0_read>
 80008c2:	4620      	mov	r0, r4
 80008c4:	bd38      	pop	{r3, r4, r5, pc}
 80008c6:	2001      	movs	r0, #1
 80008c8:	bd38      	pop	{r3, r4, r5, pc}
 80008ca:	2002      	movs	r0, #2
 80008cc:	bd38      	pop	{r3, r4, r5, pc}
 80008ce:	bf00      	nop
 80008d0:	20000234 	.word	0x20000234

080008d4 <rgb_i2c_delay>:
 80008d4:	bf00      	nop
 80008d6:	4770      	bx	lr

080008d8 <RGBSetLowSDA>:
 80008d8:	b513      	push	{r0, r1, r4, lr}
 80008da:	2301      	movs	r3, #1
 80008dc:	2203      	movs	r2, #3
 80008de:	24f0      	movs	r4, #240	; 0xf0
 80008e0:	f88d 3004 	strb.w	r3, [sp, #4]
 80008e4:	f88d 3006 	strb.w	r3, [sp, #6]
 80008e8:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80008ec:	2300      	movs	r3, #0
 80008ee:	4669      	mov	r1, sp
 80008f0:	f88d 2005 	strb.w	r2, [sp, #5]
 80008f4:	f88d 3007 	strb.w	r3, [sp, #7]
 80008f8:	9400      	str	r4, [sp, #0]
 80008fa:	f001 fbed 	bl	80020d8 <GPIO_Init>
 80008fe:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000902:	851c      	strh	r4, [r3, #40]	; 0x28
 8000904:	f7ff ffe6 	bl	80008d4 <rgb_i2c_delay>
 8000908:	b002      	add	sp, #8
 800090a:	bd10      	pop	{r4, pc}

0800090c <RGBSetHighSDA>:
 800090c:	b513      	push	{r0, r1, r4, lr}
 800090e:	2300      	movs	r3, #0
 8000910:	2203      	movs	r2, #3
 8000912:	24f0      	movs	r4, #240	; 0xf0
 8000914:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000918:	4669      	mov	r1, sp
 800091a:	f88d 3004 	strb.w	r3, [sp, #4]
 800091e:	f88d 2005 	strb.w	r2, [sp, #5]
 8000922:	f88d 3007 	strb.w	r3, [sp, #7]
 8000926:	9400      	str	r4, [sp, #0]
 8000928:	f001 fbd6 	bl	80020d8 <GPIO_Init>
 800092c:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000930:	619c      	str	r4, [r3, #24]
 8000932:	f7ff ffcf 	bl	80008d4 <rgb_i2c_delay>
 8000936:	b002      	add	sp, #8
 8000938:	bd10      	pop	{r4, pc}
	...

0800093c <RGBSetLowSCL>:
 800093c:	4b02      	ldr	r3, [pc, #8]	; (8000948 <RGBSetLowSCL+0xc>)
 800093e:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8000942:	851a      	strh	r2, [r3, #40]	; 0x28
 8000944:	f7ff bfc6 	b.w	80008d4 <rgb_i2c_delay>
 8000948:	48000800 	.word	0x48000800

0800094c <RGBSetHighSCL>:
 800094c:	4b02      	ldr	r3, [pc, #8]	; (8000958 <RGBSetHighSCL+0xc>)
 800094e:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8000952:	619a      	str	r2, [r3, #24]
 8000954:	f7ff bfbe 	b.w	80008d4 <rgb_i2c_delay>
 8000958:	48000800 	.word	0x48000800

0800095c <rgb_i2c_init>:
 800095c:	b573      	push	{r0, r1, r4, r5, r6, lr}
 800095e:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000962:	2400      	movs	r4, #0
 8000964:	9300      	str	r3, [sp, #0]
 8000966:	2603      	movs	r6, #3
 8000968:	2301      	movs	r3, #1
 800096a:	4669      	mov	r1, sp
 800096c:	4812      	ldr	r0, [pc, #72]	; (80009b8 <rgb_i2c_init+0x5c>)
 800096e:	f88d 3004 	strb.w	r3, [sp, #4]
 8000972:	25f0      	movs	r5, #240	; 0xf0
 8000974:	f88d 6005 	strb.w	r6, [sp, #5]
 8000978:	f88d 4006 	strb.w	r4, [sp, #6]
 800097c:	f88d 4007 	strb.w	r4, [sp, #7]
 8000980:	f001 fbaa 	bl	80020d8 <GPIO_Init>
 8000984:	4669      	mov	r1, sp
 8000986:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800098a:	9500      	str	r5, [sp, #0]
 800098c:	f88d 4004 	strb.w	r4, [sp, #4]
 8000990:	f88d 6005 	strb.w	r6, [sp, #5]
 8000994:	f88d 4007 	strb.w	r4, [sp, #7]
 8000998:	f001 fb9e 	bl	80020d8 <GPIO_Init>
 800099c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80009a0:	4629      	mov	r1, r5
 80009a2:	f001 fbdf 	bl	8002164 <GPIO_SetBits>
 80009a6:	f7ff ffd1 	bl	800094c <RGBSetHighSCL>
 80009aa:	f7ff ff95 	bl	80008d8 <RGBSetLowSDA>
 80009ae:	f7ff ffad 	bl	800090c <RGBSetHighSDA>
 80009b2:	b002      	add	sp, #8
 80009b4:	bd70      	pop	{r4, r5, r6, pc}
 80009b6:	bf00      	nop
 80009b8:	48000800 	.word	0x48000800

080009bc <rgb_i2cStart>:
 80009bc:	b508      	push	{r3, lr}
 80009be:	f7ff ffc5 	bl	800094c <RGBSetHighSCL>
 80009c2:	f7ff ffa3 	bl	800090c <RGBSetHighSDA>
 80009c6:	f7ff ffc1 	bl	800094c <RGBSetHighSCL>
 80009ca:	f7ff ff85 	bl	80008d8 <RGBSetLowSDA>
 80009ce:	f7ff ffb5 	bl	800093c <RGBSetLowSCL>
 80009d2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80009d6:	f7ff bf99 	b.w	800090c <RGBSetHighSDA>

080009da <rgb_i2cStop>:
 80009da:	b508      	push	{r3, lr}
 80009dc:	f7ff ffae 	bl	800093c <RGBSetLowSCL>
 80009e0:	f7ff ff7a 	bl	80008d8 <RGBSetLowSDA>
 80009e4:	f7ff ffb2 	bl	800094c <RGBSetHighSCL>
 80009e8:	f7ff ff76 	bl	80008d8 <RGBSetLowSDA>
 80009ec:	f7ff ffae 	bl	800094c <RGBSetHighSCL>
 80009f0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80009f4:	f7ff bf8a 	b.w	800090c <RGBSetHighSDA>

080009f8 <rgb_i2cWrite>:
 80009f8:	b538      	push	{r3, r4, r5, lr}
 80009fa:	4604      	mov	r4, r0
 80009fc:	2508      	movs	r5, #8
 80009fe:	f7ff ff9d 	bl	800093c <RGBSetLowSCL>
 8000a02:	0623      	lsls	r3, r4, #24
 8000a04:	d502      	bpl.n	8000a0c <rgb_i2cWrite+0x14>
 8000a06:	f7ff ff81 	bl	800090c <RGBSetHighSDA>
 8000a0a:	e001      	b.n	8000a10 <rgb_i2cWrite+0x18>
 8000a0c:	f7ff ff64 	bl	80008d8 <RGBSetLowSDA>
 8000a10:	3d01      	subs	r5, #1
 8000a12:	f7ff ff9b 	bl	800094c <RGBSetHighSCL>
 8000a16:	0064      	lsls	r4, r4, #1
 8000a18:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8000a1c:	b2e4      	uxtb	r4, r4
 8000a1e:	d1ee      	bne.n	80009fe <rgb_i2cWrite+0x6>
 8000a20:	f7ff ff8c 	bl	800093c <RGBSetLowSCL>
 8000a24:	f7ff ff72 	bl	800090c <RGBSetHighSDA>
 8000a28:	f7ff ff90 	bl	800094c <RGBSetHighSCL>
 8000a2c:	f7ff ff86 	bl	800093c <RGBSetLowSCL>
 8000a30:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000a34:	f7ff bf4e 	b.w	80008d4 <rgb_i2c_delay>

08000a38 <rgb_i2cRead>:
 8000a38:	2300      	movs	r3, #0
 8000a3a:	b570      	push	{r4, r5, r6, lr}
 8000a3c:	700b      	strb	r3, [r1, #0]
 8000a3e:	704b      	strb	r3, [r1, #1]
 8000a40:	708b      	strb	r3, [r1, #2]
 8000a42:	70cb      	strb	r3, [r1, #3]
 8000a44:	4606      	mov	r6, r0
 8000a46:	460c      	mov	r4, r1
 8000a48:	f7ff ff78 	bl	800093c <RGBSetLowSCL>
 8000a4c:	f7ff ff5e 	bl	800090c <RGBSetHighSDA>
 8000a50:	2508      	movs	r5, #8
 8000a52:	2300      	movs	r3, #0
 8000a54:	5ce2      	ldrb	r2, [r4, r3]
 8000a56:	0052      	lsls	r2, r2, #1
 8000a58:	54e2      	strb	r2, [r4, r3]
 8000a5a:	3301      	adds	r3, #1
 8000a5c:	2b04      	cmp	r3, #4
 8000a5e:	d1f9      	bne.n	8000a54 <rgb_i2cRead+0x1c>
 8000a60:	f7ff ff74 	bl	800094c <RGBSetHighSCL>
 8000a64:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000a68:	8a1b      	ldrh	r3, [r3, #16]
 8000a6a:	b29b      	uxth	r3, r3
 8000a6c:	06da      	lsls	r2, r3, #27
 8000a6e:	d503      	bpl.n	8000a78 <rgb_i2cRead+0x40>
 8000a70:	7822      	ldrb	r2, [r4, #0]
 8000a72:	f042 0201 	orr.w	r2, r2, #1
 8000a76:	7022      	strb	r2, [r4, #0]
 8000a78:	0698      	lsls	r0, r3, #26
 8000a7a:	d503      	bpl.n	8000a84 <rgb_i2cRead+0x4c>
 8000a7c:	7862      	ldrb	r2, [r4, #1]
 8000a7e:	f042 0201 	orr.w	r2, r2, #1
 8000a82:	7062      	strb	r2, [r4, #1]
 8000a84:	0659      	lsls	r1, r3, #25
 8000a86:	d503      	bpl.n	8000a90 <rgb_i2cRead+0x58>
 8000a88:	78a2      	ldrb	r2, [r4, #2]
 8000a8a:	f042 0201 	orr.w	r2, r2, #1
 8000a8e:	70a2      	strb	r2, [r4, #2]
 8000a90:	061a      	lsls	r2, r3, #24
 8000a92:	d503      	bpl.n	8000a9c <rgb_i2cRead+0x64>
 8000a94:	78e3      	ldrb	r3, [r4, #3]
 8000a96:	f043 0301 	orr.w	r3, r3, #1
 8000a9a:	70e3      	strb	r3, [r4, #3]
 8000a9c:	f7ff ff4e 	bl	800093c <RGBSetLowSCL>
 8000aa0:	3d01      	subs	r5, #1
 8000aa2:	d1d6      	bne.n	8000a52 <rgb_i2cRead+0x1a>
 8000aa4:	b10e      	cbz	r6, 8000aaa <rgb_i2cRead+0x72>
 8000aa6:	f7ff ff17 	bl	80008d8 <RGBSetLowSDA>
 8000aaa:	f7ff ff4f 	bl	800094c <RGBSetHighSCL>
 8000aae:	f7ff ff45 	bl	800093c <RGBSetLowSCL>
 8000ab2:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000ab6:	f7ff bf0d 	b.w	80008d4 <rgb_i2c_delay>

08000aba <rgb_i2c_write_reg>:
 8000aba:	b570      	push	{r4, r5, r6, lr}
 8000abc:	4605      	mov	r5, r0
 8000abe:	460c      	mov	r4, r1
 8000ac0:	4616      	mov	r6, r2
 8000ac2:	f7ff ff7b 	bl	80009bc <rgb_i2cStart>
 8000ac6:	4628      	mov	r0, r5
 8000ac8:	f7ff ff96 	bl	80009f8 <rgb_i2cWrite>
 8000acc:	4620      	mov	r0, r4
 8000ace:	f7ff ff93 	bl	80009f8 <rgb_i2cWrite>
 8000ad2:	4630      	mov	r0, r6
 8000ad4:	f7ff ff90 	bl	80009f8 <rgb_i2cWrite>
 8000ad8:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000adc:	f7ff bf7d 	b.w	80009da <rgb_i2cStop>

08000ae0 <rgb_i2c_read_reg>:
 8000ae0:	b570      	push	{r4, r5, r6, lr}
 8000ae2:	4604      	mov	r4, r0
 8000ae4:	460d      	mov	r5, r1
 8000ae6:	4616      	mov	r6, r2
 8000ae8:	f7ff ff68 	bl	80009bc <rgb_i2cStart>
 8000aec:	4620      	mov	r0, r4
 8000aee:	f7ff ff83 	bl	80009f8 <rgb_i2cWrite>
 8000af2:	4628      	mov	r0, r5
 8000af4:	f7ff ff80 	bl	80009f8 <rgb_i2cWrite>
 8000af8:	f7ff ff60 	bl	80009bc <rgb_i2cStart>
 8000afc:	f044 0001 	orr.w	r0, r4, #1
 8000b00:	f7ff ff7a 	bl	80009f8 <rgb_i2cWrite>
 8000b04:	4631      	mov	r1, r6
 8000b06:	2000      	movs	r0, #0
 8000b08:	f7ff ff96 	bl	8000a38 <rgb_i2cRead>
 8000b0c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000b10:	f7ff bf63 	b.w	80009da <rgb_i2cStop>

08000b14 <rgb_sensor_uninit>:
 8000b14:	b508      	push	{r3, lr}
 8000b16:	2008      	movs	r0, #8
 8000b18:	f001 fb58 	bl	80021cc <led_off>
 8000b1c:	2072      	movs	r0, #114	; 0x72
 8000b1e:	2180      	movs	r1, #128	; 0x80
 8000b20:	2200      	movs	r2, #0
 8000b22:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000b26:	f7ff bfc8 	b.w	8000aba <rgb_i2c_write_reg>
	...

08000b2c <rgb_sensor_read>:
 8000b2c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000b2e:	f7ff ff45 	bl	80009bc <rgb_i2cStart>
 8000b32:	2072      	movs	r0, #114	; 0x72
 8000b34:	4d55      	ldr	r5, [pc, #340]	; (8000c8c <rgb_sensor_read+0x160>)
 8000b36:	4c56      	ldr	r4, [pc, #344]	; (8000c90 <rgb_sensor_read+0x164>)
 8000b38:	f7ff ff5e 	bl	80009f8 <rgb_i2cWrite>
 8000b3c:	20b4      	movs	r0, #180	; 0xb4
 8000b3e:	f7ff ff5b 	bl	80009f8 <rgb_i2cWrite>
 8000b42:	f7ff ff3b 	bl	80009bc <rgb_i2cStart>
 8000b46:	2073      	movs	r0, #115	; 0x73
 8000b48:	f7ff ff56 	bl	80009f8 <rgb_i2cWrite>
 8000b4c:	2001      	movs	r0, #1
 8000b4e:	4629      	mov	r1, r5
 8000b50:	f7ff ff72 	bl	8000a38 <rgb_i2cRead>
 8000b54:	782b      	ldrb	r3, [r5, #0]
 8000b56:	8323      	strh	r3, [r4, #24]
 8000b58:	786b      	ldrb	r3, [r5, #1]
 8000b5a:	8363      	strh	r3, [r4, #26]
 8000b5c:	78ab      	ldrb	r3, [r5, #2]
 8000b5e:	83a3      	strh	r3, [r4, #28]
 8000b60:	78eb      	ldrb	r3, [r5, #3]
 8000b62:	2001      	movs	r0, #1
 8000b64:	4629      	mov	r1, r5
 8000b66:	83e3      	strh	r3, [r4, #30]
 8000b68:	f7ff ff66 	bl	8000a38 <rgb_i2cRead>
 8000b6c:	2300      	movs	r3, #0
 8000b6e:	f103 020c 	add.w	r2, r3, #12
 8000b72:	5ce8      	ldrb	r0, [r5, r3]
 8000b74:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000b78:	4f45      	ldr	r7, [pc, #276]	; (8000c90 <rgb_sensor_read+0x164>)
 8000b7a:	4e44      	ldr	r6, [pc, #272]	; (8000c8c <rgb_sensor_read+0x160>)
 8000b7c:	b289      	uxth	r1, r1
 8000b7e:	3301      	adds	r3, #1
 8000b80:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000b84:	2b04      	cmp	r3, #4
 8000b86:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000b8a:	d1f0      	bne.n	8000b6e <rgb_sensor_read+0x42>
 8000b8c:	2001      	movs	r0, #1
 8000b8e:	4631      	mov	r1, r6
 8000b90:	f7ff ff52 	bl	8000a38 <rgb_i2cRead>
 8000b94:	7833      	ldrb	r3, [r6, #0]
 8000b96:	803b      	strh	r3, [r7, #0]
 8000b98:	7873      	ldrb	r3, [r6, #1]
 8000b9a:	807b      	strh	r3, [r7, #2]
 8000b9c:	78b3      	ldrb	r3, [r6, #2]
 8000b9e:	80bb      	strh	r3, [r7, #4]
 8000ba0:	78f3      	ldrb	r3, [r6, #3]
 8000ba2:	2001      	movs	r0, #1
 8000ba4:	4631      	mov	r1, r6
 8000ba6:	80fb      	strh	r3, [r7, #6]
 8000ba8:	f7ff ff46 	bl	8000a38 <rgb_i2cRead>
 8000bac:	2300      	movs	r3, #0
 8000bae:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
 8000bb2:	5ce9      	ldrb	r1, [r5, r3]
 8000bb4:	4f36      	ldr	r7, [pc, #216]	; (8000c90 <rgb_sensor_read+0x164>)
 8000bb6:	4e35      	ldr	r6, [pc, #212]	; (8000c8c <rgb_sensor_read+0x160>)
 8000bb8:	b292      	uxth	r2, r2
 8000bba:	ea42 2201 	orr.w	r2, r2, r1, lsl #8
 8000bbe:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
 8000bc2:	3301      	adds	r3, #1
 8000bc4:	2b04      	cmp	r3, #4
 8000bc6:	d1f2      	bne.n	8000bae <rgb_sensor_read+0x82>
 8000bc8:	2001      	movs	r0, #1
 8000bca:	4631      	mov	r1, r6
 8000bcc:	f7ff ff34 	bl	8000a38 <rgb_i2cRead>
 8000bd0:	7833      	ldrb	r3, [r6, #0]
 8000bd2:	813b      	strh	r3, [r7, #8]
 8000bd4:	7873      	ldrb	r3, [r6, #1]
 8000bd6:	817b      	strh	r3, [r7, #10]
 8000bd8:	78b3      	ldrb	r3, [r6, #2]
 8000bda:	81bb      	strh	r3, [r7, #12]
 8000bdc:	78f3      	ldrb	r3, [r6, #3]
 8000bde:	2001      	movs	r0, #1
 8000be0:	4631      	mov	r1, r6
 8000be2:	81fb      	strh	r3, [r7, #14]
 8000be4:	f7ff ff28 	bl	8000a38 <rgb_i2cRead>
 8000be8:	2300      	movs	r3, #0
 8000bea:	1d1a      	adds	r2, r3, #4
 8000bec:	5ce8      	ldrb	r0, [r5, r3]
 8000bee:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000bf2:	4f27      	ldr	r7, [pc, #156]	; (8000c90 <rgb_sensor_read+0x164>)
 8000bf4:	4e25      	ldr	r6, [pc, #148]	; (8000c8c <rgb_sensor_read+0x160>)
 8000bf6:	b289      	uxth	r1, r1
 8000bf8:	3301      	adds	r3, #1
 8000bfa:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000bfe:	2b04      	cmp	r3, #4
 8000c00:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000c04:	d1f1      	bne.n	8000bea <rgb_sensor_read+0xbe>
 8000c06:	2001      	movs	r0, #1
 8000c08:	4631      	mov	r1, r6
 8000c0a:	f7ff ff15 	bl	8000a38 <rgb_i2cRead>
 8000c0e:	7833      	ldrb	r3, [r6, #0]
 8000c10:	823b      	strh	r3, [r7, #16]
 8000c12:	7873      	ldrb	r3, [r6, #1]
 8000c14:	827b      	strh	r3, [r7, #18]
 8000c16:	78b3      	ldrb	r3, [r6, #2]
 8000c18:	82bb      	strh	r3, [r7, #20]
 8000c1a:	78f3      	ldrb	r3, [r6, #3]
 8000c1c:	2001      	movs	r0, #1
 8000c1e:	4631      	mov	r1, r6
 8000c20:	82fb      	strh	r3, [r7, #22]
 8000c22:	f7ff ff09 	bl	8000a38 <rgb_i2cRead>
 8000c26:	2300      	movs	r3, #0
 8000c28:	f103 0208 	add.w	r2, r3, #8
 8000c2c:	5ce8      	ldrb	r0, [r5, r3]
 8000c2e:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000c32:	4f17      	ldr	r7, [pc, #92]	; (8000c90 <rgb_sensor_read+0x164>)
 8000c34:	4e15      	ldr	r6, [pc, #84]	; (8000c8c <rgb_sensor_read+0x160>)
 8000c36:	b289      	uxth	r1, r1
 8000c38:	3301      	adds	r3, #1
 8000c3a:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000c3e:	2b04      	cmp	r3, #4
 8000c40:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000c44:	d1f0      	bne.n	8000c28 <rgb_sensor_read+0xfc>
 8000c46:	2001      	movs	r0, #1
 8000c48:	4631      	mov	r1, r6
 8000c4a:	f7ff fef5 	bl	8000a38 <rgb_i2cRead>
 8000c4e:	7833      	ldrb	r3, [r6, #0]
 8000c50:	843b      	strh	r3, [r7, #32]
 8000c52:	7873      	ldrb	r3, [r6, #1]
 8000c54:	847b      	strh	r3, [r7, #34]	; 0x22
 8000c56:	78b3      	ldrb	r3, [r6, #2]
 8000c58:	84bb      	strh	r3, [r7, #36]	; 0x24
 8000c5a:	78f3      	ldrb	r3, [r6, #3]
 8000c5c:	2000      	movs	r0, #0
 8000c5e:	4631      	mov	r1, r6
 8000c60:	84fb      	strh	r3, [r7, #38]	; 0x26
 8000c62:	f7ff fee9 	bl	8000a38 <rgb_i2cRead>
 8000c66:	2300      	movs	r3, #0
 8000c68:	f103 0210 	add.w	r2, r3, #16
 8000c6c:	5ce8      	ldrb	r0, [r5, r3]
 8000c6e:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000c72:	3301      	adds	r3, #1
 8000c74:	b289      	uxth	r1, r1
 8000c76:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000c7a:	2b04      	cmp	r3, #4
 8000c7c:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000c80:	d1f2      	bne.n	8000c68 <rgb_sensor_read+0x13c>
 8000c82:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8000c86:	f7ff bea8 	b.w	80009da <rgb_i2cStop>
 8000c8a:	bf00      	nop
 8000c8c:	200009b8 	.word	0x200009b8
 8000c90:	20000254 	.word	0x20000254

08000c94 <rgb_sensor_init>:
 8000c94:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000c96:	2300      	movs	r3, #0
 8000c98:	4a24      	ldr	r2, [pc, #144]	; (8000d2c <rgb_sensor_init+0x98>)
 8000c9a:	1d19      	adds	r1, r3, #4
 8000c9c:	2400      	movs	r4, #0
 8000c9e:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8000ca2:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000ca6:	f103 0108 	add.w	r1, r3, #8
 8000caa:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000cae:	f103 0110 	add.w	r1, r3, #16
 8000cb2:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000cb6:	f103 010c 	add.w	r1, r3, #12
 8000cba:	3301      	adds	r3, #1
 8000cbc:	2b04      	cmp	r3, #4
 8000cbe:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000cc2:	d1e9      	bne.n	8000c98 <rgb_sensor_init+0x4>
 8000cc4:	2008      	movs	r0, #8
 8000cc6:	f001 fa6b 	bl	80021a0 <led_on>
 8000cca:	f7ff fe47 	bl	800095c <rgb_i2c_init>
 8000cce:	2072      	movs	r0, #114	; 0x72
 8000cd0:	2181      	movs	r1, #129	; 0x81
 8000cd2:	22ff      	movs	r2, #255	; 0xff
 8000cd4:	f7ff fef1 	bl	8000aba <rgb_i2c_write_reg>
 8000cd8:	2072      	movs	r0, #114	; 0x72
 8000cda:	2183      	movs	r1, #131	; 0x83
 8000cdc:	22ff      	movs	r2, #255	; 0xff
 8000cde:	f7ff feec 	bl	8000aba <rgb_i2c_write_reg>
 8000ce2:	2072      	movs	r0, #114	; 0x72
 8000ce4:	218d      	movs	r1, #141	; 0x8d
 8000ce6:	4622      	mov	r2, r4
 8000ce8:	f7ff fee7 	bl	8000aba <rgb_i2c_write_reg>
 8000cec:	2072      	movs	r0, #114	; 0x72
 8000cee:	2180      	movs	r1, #128	; 0x80
 8000cf0:	2203      	movs	r2, #3
 8000cf2:	f7ff fee2 	bl	8000aba <rgb_i2c_write_reg>
 8000cf6:	ad01      	add	r5, sp, #4
 8000cf8:	2072      	movs	r0, #114	; 0x72
 8000cfa:	218f      	movs	r1, #143	; 0x8f
 8000cfc:	2223      	movs	r2, #35	; 0x23
 8000cfe:	f7ff fedc 	bl	8000aba <rgb_i2c_write_reg>
 8000d02:	f7ff ff13 	bl	8000b2c <rgb_sensor_read>
 8000d06:	2072      	movs	r0, #114	; 0x72
 8000d08:	2192      	movs	r1, #146	; 0x92
 8000d0a:	462a      	mov	r2, r5
 8000d0c:	f7ff fee8 	bl	8000ae0 <rgb_i2c_read_reg>
 8000d10:	4620      	mov	r0, r4
 8000d12:	4623      	mov	r3, r4
 8000d14:	5cea      	ldrb	r2, [r5, r3]
 8000d16:	2a69      	cmp	r2, #105	; 0x69
 8000d18:	d002      	beq.n	8000d20 <rgb_sensor_init+0x8c>
 8000d1a:	2201      	movs	r2, #1
 8000d1c:	409a      	lsls	r2, r3
 8000d1e:	4310      	orrs	r0, r2
 8000d20:	3301      	adds	r3, #1
 8000d22:	2b04      	cmp	r3, #4
 8000d24:	d1f6      	bne.n	8000d14 <rgb_sensor_init+0x80>
 8000d26:	b003      	add	sp, #12
 8000d28:	bd30      	pop	{r4, r5, pc}
 8000d2a:	bf00      	nop
 8000d2c:	20000254 	.word	0x20000254

08000d30 <motors_uninit>:
 8000d30:	b508      	push	{r3, lr}
 8000d32:	20c0      	movs	r0, #192	; 0xc0
 8000d34:	2100      	movs	r1, #0
 8000d36:	2218      	movs	r2, #24
 8000d38:	f000 fdf2 	bl	8001920 <i2c_write_reg>
 8000d3c:	20c2      	movs	r0, #194	; 0xc2
 8000d3e:	2100      	movs	r1, #0
 8000d40:	2218      	movs	r2, #24
 8000d42:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000d46:	f000 bdeb 	b.w	8001920 <i2c_write_reg>
	...

08000d4c <motors_update>:
 8000d4c:	4a2f      	ldr	r2, [pc, #188]	; (8000e0c <motors_update+0xc0>)
 8000d4e:	b538      	push	{r3, r4, r5, lr}
 8000d50:	6813      	ldr	r3, [r2, #0]
 8000d52:	6854      	ldr	r4, [r2, #4]
 8000d54:	b2db      	uxtb	r3, r3
 8000d56:	b25a      	sxtb	r2, r3
 8000d58:	2a2c      	cmp	r2, #44	; 0x2c
 8000d5a:	b2e4      	uxtb	r4, r4
 8000d5c:	dc04      	bgt.n	8000d68 <motors_update+0x1c>
 8000d5e:	f112 0f2c 	cmn.w	r2, #44	; 0x2c
 8000d62:	bfb8      	it	lt
 8000d64:	23d4      	movlt	r3, #212	; 0xd4
 8000d66:	e000      	b.n	8000d6a <motors_update+0x1e>
 8000d68:	232c      	movs	r3, #44	; 0x2c
 8000d6a:	b262      	sxtb	r2, r4
 8000d6c:	2a2c      	cmp	r2, #44	; 0x2c
 8000d6e:	dc04      	bgt.n	8000d7a <motors_update+0x2e>
 8000d70:	f112 0f2c 	cmn.w	r2, #44	; 0x2c
 8000d74:	bfb8      	it	lt
 8000d76:	24d4      	movlt	r4, #212	; 0xd4
 8000d78:	e000      	b.n	8000d7c <motors_update+0x30>
 8000d7a:	242c      	movs	r4, #44	; 0x2c
 8000d7c:	b1b3      	cbz	r3, 8000dac <motors_update+0x60>
 8000d7e:	b25a      	sxtb	r2, r3
 8000d80:	2a00      	cmp	r2, #0
 8000d82:	dd07      	ble.n	8000d94 <motors_update+0x48>
 8000d84:	2a05      	cmp	r2, #5
 8000d86:	bfd8      	it	le
 8000d88:	2306      	movle	r3, #6
 8000d8a:	b25d      	sxtb	r5, r3
 8000d8c:	00ad      	lsls	r5, r5, #2
 8000d8e:	f045 0502 	orr.w	r5, r5, #2
 8000d92:	e009      	b.n	8000da8 <motors_update+0x5c>
 8000d94:	425b      	negs	r3, r3
 8000d96:	b2db      	uxtb	r3, r3
 8000d98:	b25a      	sxtb	r2, r3
 8000d9a:	2a05      	cmp	r2, #5
 8000d9c:	bfd8      	it	le
 8000d9e:	2306      	movle	r3, #6
 8000da0:	b25d      	sxtb	r5, r3
 8000da2:	00ad      	lsls	r5, r5, #2
 8000da4:	f045 0501 	orr.w	r5, r5, #1
 8000da8:	b2ed      	uxtb	r5, r5
 8000daa:	e000      	b.n	8000dae <motors_update+0x62>
 8000dac:	251b      	movs	r5, #27
 8000dae:	2100      	movs	r1, #0
 8000db0:	460a      	mov	r2, r1
 8000db2:	20c0      	movs	r0, #192	; 0xc0
 8000db4:	f000 fdb4 	bl	8001920 <i2c_write_reg>
 8000db8:	20c0      	movs	r0, #192	; 0xc0
 8000dba:	2100      	movs	r1, #0
 8000dbc:	462a      	mov	r2, r5
 8000dbe:	f000 fdaf 	bl	8001920 <i2c_write_reg>
 8000dc2:	b1b4      	cbz	r4, 8000df2 <motors_update+0xa6>
 8000dc4:	b263      	sxtb	r3, r4
 8000dc6:	2b00      	cmp	r3, #0
 8000dc8:	dd07      	ble.n	8000dda <motors_update+0x8e>
 8000dca:	2b05      	cmp	r3, #5
 8000dcc:	bfd8      	it	le
 8000dce:	2406      	movle	r4, #6
 8000dd0:	b264      	sxtb	r4, r4
 8000dd2:	00a4      	lsls	r4, r4, #2
 8000dd4:	f044 0401 	orr.w	r4, r4, #1
 8000dd8:	e009      	b.n	8000dee <motors_update+0xa2>
 8000dda:	4264      	negs	r4, r4
 8000ddc:	b2e4      	uxtb	r4, r4
 8000dde:	b263      	sxtb	r3, r4
 8000de0:	2b05      	cmp	r3, #5
 8000de2:	bfd8      	it	le
 8000de4:	2406      	movle	r4, #6
 8000de6:	b264      	sxtb	r4, r4
 8000de8:	00a4      	lsls	r4, r4, #2
 8000dea:	f044 0402 	orr.w	r4, r4, #2
 8000dee:	b2e4      	uxtb	r4, r4
 8000df0:	e000      	b.n	8000df4 <motors_update+0xa8>
 8000df2:	241b      	movs	r4, #27
 8000df4:	2100      	movs	r1, #0
 8000df6:	460a      	mov	r2, r1
 8000df8:	20c2      	movs	r0, #194	; 0xc2
 8000dfa:	f000 fd91 	bl	8001920 <i2c_write_reg>
 8000dfe:	4622      	mov	r2, r4
 8000e00:	20c2      	movs	r0, #194	; 0xc2
 8000e02:	2100      	movs	r1, #0
 8000e04:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000e08:	f000 bd8a 	b.w	8001920 <i2c_write_reg>
 8000e0c:	2000047c 	.word	0x2000047c

08000e10 <motors_init>:
 8000e10:	b510      	push	{r4, lr}
 8000e12:	4b04      	ldr	r3, [pc, #16]	; (8000e24 <motors_init+0x14>)
 8000e14:	2400      	movs	r4, #0
 8000e16:	601c      	str	r4, [r3, #0]
 8000e18:	605c      	str	r4, [r3, #4]
 8000e1a:	f7ff ff97 	bl	8000d4c <motors_update>
 8000e1e:	4620      	mov	r0, r4
 8000e20:	bd10      	pop	{r4, pc}
 8000e22:	bf00      	nop
 8000e24:	2000047c 	.word	0x2000047c

08000e28 <esp8266_send>:
 8000e28:	b510      	push	{r4, lr}
 8000e2a:	1e44      	subs	r4, r0, #1
 8000e2c:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000e30:	b110      	cbz	r0, 8000e38 <esp8266_send+0x10>
 8000e32:	f000 fad3 	bl	80013dc <uart_write>
 8000e36:	e7f9      	b.n	8000e2c <esp8266_send+0x4>
 8000e38:	bd10      	pop	{r4, pc}

08000e3a <esp8266_send_uint>:
 8000e3a:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000e3c:	2300      	movs	r3, #0
 8000e3e:	f88d 300f 	strb.w	r3, [sp, #15]
 8000e42:	230a      	movs	r3, #10
 8000e44:	240a      	movs	r4, #10
 8000e46:	fbb0 f1f4 	udiv	r1, r0, r4
 8000e4a:	fb04 0011 	mls	r0, r4, r1, r0
 8000e4e:	aa01      	add	r2, sp, #4
 8000e50:	3030      	adds	r0, #48	; 0x30
 8000e52:	5498      	strb	r0, [r3, r2]
 8000e54:	1e5c      	subs	r4, r3, #1
 8000e56:	4608      	mov	r0, r1
 8000e58:	b109      	cbz	r1, 8000e5e <esp8266_send_uint+0x24>
 8000e5a:	4623      	mov	r3, r4
 8000e5c:	e7f2      	b.n	8000e44 <esp8266_send_uint+0xa>
 8000e5e:	18d0      	adds	r0, r2, r3
 8000e60:	f7ff ffe2 	bl	8000e28 <esp8266_send>
 8000e64:	b004      	add	sp, #16
 8000e66:	bd10      	pop	{r4, pc}

08000e68 <esp8266_find_stream>:
 8000e68:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000e6a:	4615      	mov	r5, r2
 8000e6c:	460f      	mov	r7, r1
 8000e6e:	4606      	mov	r6, r0
 8000e70:	f001 f8ec 	bl	800204c <timer_get_time>
 8000e74:	4405      	add	r5, r0
 8000e76:	f000 fb69 	bl	800154c <uart_clear_buffer>
 8000e7a:	2400      	movs	r4, #0
 8000e7c:	f000 fab8 	bl	80013f0 <uart_is_char>
 8000e80:	f64f 72ff 	movw	r2, #65535	; 0xffff
 8000e84:	4290      	cmp	r0, r2
 8000e86:	d00c      	beq.n	8000ea2 <esp8266_find_stream+0x3a>
 8000e88:	5d32      	ldrb	r2, [r6, r4]
 8000e8a:	4282      	cmp	r2, r0
 8000e8c:	d108      	bne.n	8000ea0 <esp8266_find_stream+0x38>
 8000e8e:	1e7b      	subs	r3, r7, #1
 8000e90:	429c      	cmp	r4, r3
 8000e92:	d201      	bcs.n	8000e98 <esp8266_find_stream+0x30>
 8000e94:	3401      	adds	r4, #1
 8000e96:	e004      	b.n	8000ea2 <esp8266_find_stream+0x3a>
 8000e98:	f000 fb58 	bl	800154c <uart_clear_buffer>
 8000e9c:	2001      	movs	r0, #1
 8000e9e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000ea0:	2400      	movs	r4, #0
 8000ea2:	f001 f8d3 	bl	800204c <timer_get_time>
 8000ea6:	42a8      	cmp	r0, r5
 8000ea8:	d3e8      	bcc.n	8000e7c <esp8266_find_stream+0x14>
 8000eaa:	f000 fb4f 	bl	800154c <uart_clear_buffer>
 8000eae:	2000      	movs	r0, #0
 8000eb0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

08000eb4 <esp8266_init>:
 8000eb4:	b510      	push	{r4, lr}
 8000eb6:	4604      	mov	r4, r0
 8000eb8:	f640 30b8 	movw	r0, #3000	; 0xbb8
 8000ebc:	f001 f8d4 	bl	8002068 <timer_delay_ms>
 8000ec0:	b10c      	cbz	r4, 8000ec6 <esp8266_init+0x12>
 8000ec2:	4818      	ldr	r0, [pc, #96]	; (8000f24 <esp8266_init+0x70>)
 8000ec4:	e000      	b.n	8000ec8 <esp8266_init+0x14>
 8000ec6:	4818      	ldr	r0, [pc, #96]	; (8000f28 <esp8266_init+0x74>)
 8000ec8:	f7ff ffae 	bl	8000e28 <esp8266_send>
 8000ecc:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000ed0:	f001 f8ca 	bl	8002068 <timer_delay_ms>
 8000ed4:	4815      	ldr	r0, [pc, #84]	; (8000f2c <esp8266_init+0x78>)
 8000ed6:	f7ff ffa7 	bl	8000e28 <esp8266_send>
 8000eda:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000ede:	f001 f8c3 	bl	8002068 <timer_delay_ms>
 8000ee2:	4813      	ldr	r0, [pc, #76]	; (8000f30 <esp8266_init+0x7c>)
 8000ee4:	f7ff ffa0 	bl	8000e28 <esp8266_send>
 8000ee8:	4812      	ldr	r0, [pc, #72]	; (8000f34 <esp8266_init+0x80>)
 8000eea:	f7ff ff9d 	bl	8000e28 <esp8266_send>
 8000eee:	4812      	ldr	r0, [pc, #72]	; (8000f38 <esp8266_init+0x84>)
 8000ef0:	f7ff ff9a 	bl	8000e28 <esp8266_send>
 8000ef4:	4811      	ldr	r0, [pc, #68]	; (8000f3c <esp8266_init+0x88>)
 8000ef6:	f7ff ff97 	bl	8000e28 <esp8266_send>
 8000efa:	4811      	ldr	r0, [pc, #68]	; (8000f40 <esp8266_init+0x8c>)
 8000efc:	f7ff ff94 	bl	8000e28 <esp8266_send>
 8000f00:	4810      	ldr	r0, [pc, #64]	; (8000f44 <esp8266_init+0x90>)
 8000f02:	2102      	movs	r1, #2
 8000f04:	f644 6220 	movw	r2, #20000	; 0x4e20
 8000f08:	f7ff ffae 	bl	8000e68 <esp8266_find_stream>
 8000f0c:	b140      	cbz	r0, 8000f20 <esp8266_init+0x6c>
 8000f0e:	b12c      	cbz	r4, 8000f1c <esp8266_init+0x68>
 8000f10:	480d      	ldr	r0, [pc, #52]	; (8000f48 <esp8266_init+0x94>)
 8000f12:	f7ff ff89 	bl	8000e28 <esp8266_send>
 8000f16:	20c8      	movs	r0, #200	; 0xc8
 8000f18:	f001 f8a6 	bl	8002068 <timer_delay_ms>
 8000f1c:	2000      	movs	r0, #0
 8000f1e:	bd10      	pop	{r4, pc}
 8000f20:	2002      	movs	r0, #2
 8000f22:	bd10      	pop	{r4, pc}
 8000f24:	08002305 	.word	0x08002305
 8000f28:	08002313 	.word	0x08002313
 8000f2c:	08002321 	.word	0x08002321
 8000f30:	0800232f 	.word	0x0800232f
 8000f34:	0800233a 	.word	0x0800233a
 8000f38:	08002378 	.word	0x08002378
 8000f3c:	08002347 	.word	0x08002347
 8000f40:	08002350 	.word	0x08002350
 8000f44:	080023a0 	.word	0x080023a0
 8000f48:	08002354 	.word	0x08002354

08000f4c <esp8266_uninit>:
 8000f4c:	4770      	bx	lr

08000f4e <esp8266_get_nonblocking>:
 8000f4e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000f50:	4606      	mov	r6, r0
 8000f52:	460f      	mov	r7, r1
 8000f54:	4615      	mov	r5, r2
 8000f56:	2300      	movs	r3, #0
 8000f58:	42bb      	cmp	r3, r7
 8000f5a:	f04f 0400 	mov.w	r4, #0
 8000f5e:	d002      	beq.n	8000f66 <esp8266_get_nonblocking+0x18>
 8000f60:	54f4      	strb	r4, [r6, r3]
 8000f62:	3301      	adds	r3, #1
 8000f64:	e7f8      	b.n	8000f58 <esp8266_get_nonblocking+0xa>
 8000f66:	f001 f871 	bl	800204c <timer_get_time>
 8000f6a:	4405      	add	r5, r0
 8000f6c:	f000 fa40 	bl	80013f0 <uart_is_char>
 8000f70:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000f74:	4298      	cmp	r0, r3
 8000f76:	bf1c      	itt	ne
 8000f78:	5530      	strbne	r0, [r6, r4]
 8000f7a:	3401      	addne	r4, #1
 8000f7c:	f001 f866 	bl	800204c <timer_get_time>
 8000f80:	42bc      	cmp	r4, r7
 8000f82:	d207      	bcs.n	8000f94 <esp8266_get_nonblocking+0x46>
 8000f84:	4285      	cmp	r5, r0
 8000f86:	d8f1      	bhi.n	8000f6c <esp8266_get_nonblocking+0x1e>
 8000f88:	42a8      	cmp	r0, r5
 8000f8a:	bf94      	ite	ls
 8000f8c:	4620      	movls	r0, r4
 8000f8e:	f04f 30ff 	movhi.w	r0, #4294967295
 8000f92:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000f94:	42a8      	cmp	r0, r5
 8000f96:	bf8c      	ite	hi
 8000f98:	f04f 30ff 	movhi.w	r0, #4294967295
 8000f9c:	f06f 0001 	mvnls.w	r0, #1
 8000fa0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

08000fa4 <esp8266_connect>:
 8000fa4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000fa6:	4606      	mov	r6, r0
 8000fa8:	4839      	ldr	r0, [pc, #228]	; (8001090 <esp8266_connect+0xec>)
 8000faa:	460f      	mov	r7, r1
 8000fac:	4614      	mov	r4, r2
 8000fae:	461d      	mov	r5, r3
 8000fb0:	f7ff ff3a 	bl	8000e28 <esp8266_send>
 8000fb4:	4630      	mov	r0, r6
 8000fb6:	f7ff ff37 	bl	8000e28 <esp8266_send>
 8000fba:	4836      	ldr	r0, [pc, #216]	; (8001094 <esp8266_connect+0xf0>)
 8000fbc:	f7ff ff34 	bl	8000e28 <esp8266_send>
 8000fc0:	4638      	mov	r0, r7
 8000fc2:	f7ff ff3a 	bl	8000e3a <esp8266_send_uint>
 8000fc6:	4834      	ldr	r0, [pc, #208]	; (8001098 <esp8266_connect+0xf4>)
 8000fc8:	f7ff ff2e 	bl	8000e28 <esp8266_send>
 8000fcc:	4833      	ldr	r0, [pc, #204]	; (800109c <esp8266_connect+0xf8>)
 8000fce:	2107      	movs	r1, #7
 8000fd0:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 8000fd4:	f7ff ff48 	bl	8000e68 <esp8266_find_stream>
 8000fd8:	2800      	cmp	r0, #0
 8000fda:	d056      	beq.n	800108a <esp8266_connect+0xe6>
 8000fdc:	4830      	ldr	r0, [pc, #192]	; (80010a0 <esp8266_connect+0xfc>)
 8000fde:	f7ff ff23 	bl	8000e28 <esp8266_send>
 8000fe2:	4628      	mov	r0, r5
 8000fe4:	f7ff ff29 	bl	8000e3a <esp8266_send_uint>
 8000fe8:	482b      	ldr	r0, [pc, #172]	; (8001098 <esp8266_connect+0xf4>)
 8000fea:	f7ff ff1d 	bl	8000e28 <esp8266_send>
 8000fee:	482d      	ldr	r0, [pc, #180]	; (80010a4 <esp8266_connect+0x100>)
 8000ff0:	2101      	movs	r1, #1
 8000ff2:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 8000ff6:	f7ff ff37 	bl	8000e68 <esp8266_find_stream>
 8000ffa:	b108      	cbz	r0, 8001000 <esp8266_connect+0x5c>
 8000ffc:	4425      	add	r5, r4
 8000ffe:	e007      	b.n	8001010 <esp8266_connect+0x6c>
 8001000:	4829      	ldr	r0, [pc, #164]	; (80010a8 <esp8266_connect+0x104>)
 8001002:	f7ff ff11 	bl	8000e28 <esp8266_send>
 8001006:	2064      	movs	r0, #100	; 0x64
 8001008:	f001 f82e 	bl	8002068 <timer_delay_ms>
 800100c:	2004      	movs	r0, #4
 800100e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001010:	42ac      	cmp	r4, r5
 8001012:	d004      	beq.n	800101e <esp8266_connect+0x7a>
 8001014:	f814 0b01 	ldrb.w	r0, [r4], #1
 8001018:	f000 f9e0 	bl	80013dc <uart_write>
 800101c:	e7f8      	b.n	8001010 <esp8266_connect+0x6c>
 800101e:	4823      	ldr	r0, [pc, #140]	; (80010ac <esp8266_connect+0x108>)
 8001020:	2107      	movs	r1, #7
 8001022:	2264      	movs	r2, #100	; 0x64
 8001024:	f7ff ff20 	bl	8000e68 <esp8266_find_stream>
 8001028:	b938      	cbnz	r0, 800103a <esp8266_connect+0x96>
 800102a:	481f      	ldr	r0, [pc, #124]	; (80010a8 <esp8266_connect+0x104>)
 800102c:	f7ff fefc 	bl	8000e28 <esp8266_send>
 8001030:	2064      	movs	r0, #100	; 0x64
 8001032:	f001 f819 	bl	8002068 <timer_delay_ms>
 8001036:	2005      	movs	r0, #5
 8001038:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800103a:	481d      	ldr	r0, [pc, #116]	; (80010b0 <esp8266_connect+0x10c>)
 800103c:	2105      	movs	r1, #5
 800103e:	2264      	movs	r2, #100	; 0x64
 8001040:	f7ff ff12 	bl	8000e68 <esp8266_find_stream>
 8001044:	b108      	cbz	r0, 800104a <esp8266_connect+0xa6>
 8001046:	2400      	movs	r4, #0
 8001048:	e007      	b.n	800105a <esp8266_connect+0xb6>
 800104a:	4817      	ldr	r0, [pc, #92]	; (80010a8 <esp8266_connect+0x104>)
 800104c:	f7ff feec 	bl	8000e28 <esp8266_send>
 8001050:	2064      	movs	r0, #100	; 0x64
 8001052:	f001 f809 	bl	8002068 <timer_delay_ms>
 8001056:	2006      	movs	r0, #6
 8001058:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800105a:	f000 f9e5 	bl	8001428 <uart_read>
 800105e:	283a      	cmp	r0, #58	; 0x3a
 8001060:	d004      	beq.n	800106c <esp8266_connect+0xc8>
 8001062:	230a      	movs	r3, #10
 8001064:	fb03 0404 	mla	r4, r3, r4, r0
 8001068:	3c30      	subs	r4, #48	; 0x30
 800106a:	e7f6      	b.n	800105a <esp8266_connect+0xb6>
 800106c:	9907      	ldr	r1, [sp, #28]
 800106e:	9806      	ldr	r0, [sp, #24]
 8001070:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 8001074:	f7ff ff6b 	bl	8000f4e <esp8266_get_nonblocking>
 8001078:	480b      	ldr	r0, [pc, #44]	; (80010a8 <esp8266_connect+0x104>)
 800107a:	f7ff fed5 	bl	8000e28 <esp8266_send>
 800107e:	2064      	movs	r0, #100	; 0x64
 8001080:	f000 fff2 	bl	8002068 <timer_delay_ms>
 8001084:	f504 707a 	add.w	r0, r4, #1000	; 0x3e8
 8001088:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800108a:	2003      	movs	r0, #3
 800108c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800108e:	bf00      	nop
 8001090:	08002368 	.word	0x08002368
 8001094:	0800237c 	.word	0x0800237c
 8001098:	08002351 	.word	0x08002351
 800109c:	080023a0 	.word	0x080023a0
 80010a0:	0800237f 	.word	0x0800237f
 80010a4:	0800238b 	.word	0x0800238b
 80010a8:	0800238d 	.word	0x0800238d
 80010ac:	0800239b 	.word	0x0800239b
 80010b0:	080023a3 	.word	0x080023a3

080010b4 <main_thread>:
 80010b4:	b508      	push	{r3, lr}
 80010b6:	481b      	ldr	r0, [pc, #108]	; (8001124 <main_thread+0x70>)
 80010b8:	f7ff fa16 	bl	80004e8 <printf_>
 80010bc:	20c8      	movs	r0, #200	; 0xc8
 80010be:	f000 ffd3 	bl	8002068 <timer_delay_ms>
 80010c2:	f000 f83d 	bl	8001140 <device_wake_up>
 80010c6:	4918      	ldr	r1, [pc, #96]	; (8001128 <main_thread+0x74>)
 80010c8:	4818      	ldr	r0, [pc, #96]	; (800112c <main_thread+0x78>)
 80010ca:	f44f 7200 	mov.w	r2, #512	; 0x200
 80010ce:	2306      	movs	r3, #6
 80010d0:	f7ff f8f0 	bl	80002b4 <create_thread>
 80010d4:	4916      	ldr	r1, [pc, #88]	; (8001130 <main_thread+0x7c>)
 80010d6:	4817      	ldr	r0, [pc, #92]	; (8001134 <main_thread+0x80>)
 80010d8:	f44f 7200 	mov.w	r2, #512	; 0x200
 80010dc:	2306      	movs	r3, #6
 80010de:	f7ff f8e9 	bl	80002b4 <create_thread>
 80010e2:	4815      	ldr	r0, [pc, #84]	; (8001138 <main_thread+0x84>)
 80010e4:	4915      	ldr	r1, [pc, #84]	; (800113c <main_thread+0x88>)
 80010e6:	f44f 7200 	mov.w	r2, #512	; 0x200
 80010ea:	2306      	movs	r3, #6
 80010ec:	f7ff f8e2 	bl	80002b4 <create_thread>
 80010f0:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 80010f4:	f000 ffb8 	bl	8002068 <timer_delay_ms>
 80010f8:	f001 f8dc 	bl	80022b4 <get_key>
 80010fc:	b960      	cbnz	r0, 8001118 <main_thread+0x64>
 80010fe:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001102:	f001 f84d 	bl	80021a0 <led_on>
 8001106:	2064      	movs	r0, #100	; 0x64
 8001108:	f000 ffae 	bl	8002068 <timer_delay_ms>
 800110c:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001110:	f001 f85c 	bl	80021cc <led_off>
 8001114:	20c8      	movs	r0, #200	; 0xc8
 8001116:	e7ed      	b.n	80010f4 <main_thread+0x40>
 8001118:	20c8      	movs	r0, #200	; 0xc8
 800111a:	f000 ffa5 	bl	8002068 <timer_delay_ms>
 800111e:	f000 f957 	bl	80013d0 <motors_test>
 8001122:	e7fc      	b.n	800111e <main_thread+0x6a>
 8001124:	080023a9 	.word	0x080023a9
 8001128:	2000027c 	.word	0x2000027c
 800112c:	080011bd 	.word	0x080011bd
 8001130:	20000034 	.word	0x20000034
 8001134:	0800114d 	.word	0x0800114d
 8001138:	08001229 	.word	0x08001229
 800113c:	20000484 	.word	0x20000484

08001140 <device_wake_up>:
 8001140:	4b01      	ldr	r3, [pc, #4]	; (8001148 <device_wake_up+0x8>)
 8001142:	2200      	movs	r2, #0
 8001144:	701a      	strb	r2, [r3, #0]
 8001146:	4770      	bx	lr
 8001148:	20000030 	.word	0x20000030

0800114c <device_i2c_thread>:
 800114c:	b510      	push	{r4, lr}
 800114e:	2000      	movs	r0, #0
 8001150:	210a      	movs	r1, #10
 8001152:	f000 ff99 	bl	8002088 <event_timer_set_period>
 8001156:	2300      	movs	r3, #0
 8001158:	2b01      	cmp	r3, #1
 800115a:	d01e      	beq.n	800119a <device_i2c_thread+0x4e>
 800115c:	d30f      	bcc.n	800117e <device_i2c_thread+0x32>
 800115e:	2b00      	cmp	r3, #0
 8001160:	d0fa      	beq.n	8001158 <device_i2c_thread+0xc>
 8001162:	f7ff fa84 	bl	800066e <lsm9ds0_uninit>
 8001166:	f7ff fde3 	bl	8000d30 <motors_uninit>
 800116a:	2064      	movs	r0, #100	; 0x64
 800116c:	f000 ff7c 	bl	8002068 <timer_delay_ms>
 8001170:	4b11      	ldr	r3, [pc, #68]	; (80011b8 <device_i2c_thread+0x6c>)
 8001172:	781b      	ldrb	r3, [r3, #0]
 8001174:	2b00      	cmp	r3, #0
 8001176:	bf14      	ite	ne
 8001178:	2302      	movne	r3, #2
 800117a:	2300      	moveq	r3, #0
 800117c:	e7ec      	b.n	8001158 <device_i2c_thread+0xc>
 800117e:	f7ff fe47 	bl	8000e10 <motors_init>
 8001182:	f7ff fb4f 	bl	8000824 <lsm9ds0_init>
 8001186:	4604      	mov	r4, r0
 8001188:	b138      	cbz	r0, 800119a <device_i2c_thread+0x4e>
 800118a:	f7ff fa70 	bl	800066e <lsm9ds0_uninit>
 800118e:	f7ff fdcf 	bl	8000d30 <motors_uninit>
 8001192:	2002      	movs	r0, #2
 8001194:	4621      	mov	r1, r4
 8001196:	f000 f88d 	bl	80012b4 <abort_error_>
 800119a:	2000      	movs	r0, #0
 800119c:	f000 ff8a 	bl	80020b4 <event_timer_wait>
 80011a0:	f7ff fa78 	bl	8000694 <lsm9ds0_read>
 80011a4:	f7ff fdd2 	bl	8000d4c <motors_update>
 80011a8:	4b03      	ldr	r3, [pc, #12]	; (80011b8 <device_i2c_thread+0x6c>)
 80011aa:	781b      	ldrb	r3, [r3, #0]
 80011ac:	2b00      	cmp	r3, #0
 80011ae:	d0f4      	beq.n	800119a <device_i2c_thread+0x4e>
 80011b0:	2302      	movs	r3, #2
 80011b2:	2b01      	cmp	r3, #1
 80011b4:	e7d2      	b.n	800115c <device_i2c_thread+0x10>
 80011b6:	bf00      	nop
 80011b8:	20000030 	.word	0x20000030

080011bc <device_rgb_sensors_thread>:
 80011bc:	b510      	push	{r4, lr}
 80011be:	2001      	movs	r0, #1
 80011c0:	210a      	movs	r1, #10
 80011c2:	f000 ff61 	bl	8002088 <event_timer_set_period>
 80011c6:	2400      	movs	r4, #0
 80011c8:	2001      	movs	r0, #1
 80011ca:	f000 ff73 	bl	80020b4 <event_timer_wait>
 80011ce:	f7ff fcad 	bl	8000b2c <rgb_sensor_read>
 80011d2:	2c01      	cmp	r4, #1
 80011d4:	d01a      	beq.n	800120c <device_rgb_sensors_thread+0x50>
 80011d6:	d30d      	bcc.n	80011f4 <device_rgb_sensors_thread+0x38>
 80011d8:	2c02      	cmp	r4, #2
 80011da:	d1f5      	bne.n	80011c8 <device_rgb_sensors_thread+0xc>
 80011dc:	f7ff fc9a 	bl	8000b14 <rgb_sensor_uninit>
 80011e0:	2064      	movs	r0, #100	; 0x64
 80011e2:	f000 ff41 	bl	8002068 <timer_delay_ms>
 80011e6:	4b0f      	ldr	r3, [pc, #60]	; (8001224 <device_rgb_sensors_thread+0x68>)
 80011e8:	781c      	ldrb	r4, [r3, #0]
 80011ea:	2c00      	cmp	r4, #0
 80011ec:	bf14      	ite	ne
 80011ee:	2402      	movne	r4, #2
 80011f0:	2400      	moveq	r4, #0
 80011f2:	e7e9      	b.n	80011c8 <device_rgb_sensors_thread+0xc>
 80011f4:	f7ff fd4e 	bl	8000c94 <rgb_sensor_init>
 80011f8:	4604      	mov	r4, r0
 80011fa:	b128      	cbz	r0, 8001208 <device_rgb_sensors_thread+0x4c>
 80011fc:	f7ff fc8a 	bl	8000b14 <rgb_sensor_uninit>
 8001200:	2001      	movs	r0, #1
 8001202:	4621      	mov	r1, r4
 8001204:	f000 f856 	bl	80012b4 <abort_error_>
 8001208:	2401      	movs	r4, #1
 800120a:	e7dd      	b.n	80011c8 <device_rgb_sensors_thread+0xc>
 800120c:	4620      	mov	r0, r4
 800120e:	f000 ff51 	bl	80020b4 <event_timer_wait>
 8001212:	f7ff fc8b 	bl	8000b2c <rgb_sensor_read>
 8001216:	4b03      	ldr	r3, [pc, #12]	; (8001224 <device_rgb_sensors_thread+0x68>)
 8001218:	781b      	ldrb	r3, [r3, #0]
 800121a:	2b00      	cmp	r3, #0
 800121c:	d0f4      	beq.n	8001208 <device_rgb_sensors_thread+0x4c>
 800121e:	2402      	movs	r4, #2
 8001220:	e7d2      	b.n	80011c8 <device_rgb_sensors_thread+0xc>
 8001222:	bf00      	nop
 8001224:	20000030 	.word	0x20000030

08001228 <device_wifi_thread>:
 8001228:	b570      	push	{r4, r5, r6, lr}
 800122a:	4b1f      	ldr	r3, [pc, #124]	; (80012a8 <device_wifi_thread+0x80>)
 800122c:	b0a6      	sub	sp, #152	; 0x98
 800122e:	ac02      	add	r4, sp, #8
 8001230:	f103 0210 	add.w	r2, r3, #16
 8001234:	4626      	mov	r6, r4
 8001236:	6818      	ldr	r0, [r3, #0]
 8001238:	6859      	ldr	r1, [r3, #4]
 800123a:	4625      	mov	r5, r4
 800123c:	c503      	stmia	r5!, {r0, r1}
 800123e:	3308      	adds	r3, #8
 8001240:	4293      	cmp	r3, r2
 8001242:	462c      	mov	r4, r5
 8001244:	d1f7      	bne.n	8001236 <device_wifi_thread+0xe>
 8001246:	4630      	mov	r0, r6
 8001248:	f7ff f8cd 	bl	80003e6 <strlen_>
 800124c:	2100      	movs	r1, #0
 800124e:	4605      	mov	r5, r0
 8001250:	2901      	cmp	r1, #1
 8001252:	d01c      	beq.n	800128e <device_wifi_thread+0x66>
 8001254:	d30d      	bcc.n	8001272 <device_wifi_thread+0x4a>
 8001256:	2900      	cmp	r1, #0
 8001258:	d0fa      	beq.n	8001250 <device_wifi_thread+0x28>
 800125a:	f7ff fe77 	bl	8000f4c <esp8266_uninit>
 800125e:	2064      	movs	r0, #100	; 0x64
 8001260:	f000 ff02 	bl	8002068 <timer_delay_ms>
 8001264:	4b11      	ldr	r3, [pc, #68]	; (80012ac <device_wifi_thread+0x84>)
 8001266:	7819      	ldrb	r1, [r3, #0]
 8001268:	2900      	cmp	r1, #0
 800126a:	bf14      	ite	ne
 800126c:	2102      	movne	r1, #2
 800126e:	2100      	moveq	r1, #0
 8001270:	e7ee      	b.n	8001250 <device_wifi_thread+0x28>
 8001272:	2001      	movs	r0, #1
 8001274:	f000 ff94 	bl	80021a0 <led_on>
 8001278:	2000      	movs	r0, #0
 800127a:	f7ff fe1b 	bl	8000eb4 <esp8266_init>
 800127e:	4604      	mov	r4, r0
 8001280:	b128      	cbz	r0, 800128e <device_wifi_thread+0x66>
 8001282:	f7ff fe63 	bl	8000f4c <esp8266_uninit>
 8001286:	2003      	movs	r0, #3
 8001288:	4621      	mov	r1, r4
 800128a:	f000 f813 	bl	80012b4 <abort_error_>
 800128e:	ab06      	add	r3, sp, #24
 8001290:	9300      	str	r3, [sp, #0]
 8001292:	2380      	movs	r3, #128	; 0x80
 8001294:	9301      	str	r3, [sp, #4]
 8001296:	f240 71da 	movw	r1, #2010	; 0x7da
 800129a:	4632      	mov	r2, r6
 800129c:	462b      	mov	r3, r5
 800129e:	4804      	ldr	r0, [pc, #16]	; (80012b0 <device_wifi_thread+0x88>)
 80012a0:	f7ff fe80 	bl	8000fa4 <esp8266_connect>
 80012a4:	e7f3      	b.n	800128e <device_wifi_thread+0x66>
 80012a6:	bf00      	nop
 80012a8:	080023f0 	.word	0x080023f0
 80012ac:	20000030 	.word	0x20000030
 80012b0:	080023e4 	.word	0x080023e4

080012b4 <abort_error_>:
 80012b4:	b570      	push	{r4, r5, r6, lr}
 80012b6:	4605      	mov	r5, r0
 80012b8:	460e      	mov	r6, r1
 80012ba:	480d      	ldr	r0, [pc, #52]	; (80012f0 <abort_error_+0x3c>)
 80012bc:	4629      	mov	r1, r5
 80012be:	4632      	mov	r2, r6
 80012c0:	f7ff f912 	bl	80004e8 <printf_>
 80012c4:	2408      	movs	r4, #8
 80012c6:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80012ca:	f000 ff69 	bl	80021a0 <led_on>
 80012ce:	201e      	movs	r0, #30
 80012d0:	f000 feca 	bl	8002068 <timer_delay_ms>
 80012d4:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80012d8:	f000 ff78 	bl	80021cc <led_off>
 80012dc:	2046      	movs	r0, #70	; 0x46
 80012de:	f000 fec3 	bl	8002068 <timer_delay_ms>
 80012e2:	3c01      	subs	r4, #1
 80012e4:	d1ef      	bne.n	80012c6 <abort_error_+0x12>
 80012e6:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80012ea:	f000 febd 	bl	8002068 <timer_delay_ms>
 80012ee:	e7e4      	b.n	80012ba <abort_error_+0x6>
 80012f0:	08002400 	.word	0x08002400

080012f4 <go_forward>:
 80012f4:	b538      	push	{r3, r4, r5, lr}
 80012f6:	ed2d 8b06 	vpush	{d8-d10}
 80012fa:	4605      	mov	r5, r0
 80012fc:	4614      	mov	r4, r2
 80012fe:	f000 fea5 	bl	800204c <timer_get_time>
 8001302:	ed9f 8a2b 	vldr	s16, [pc, #172]	; 80013b0 <go_forward+0xbc>
 8001306:	4405      	add	r5, r0
 8001308:	eef0 8a48 	vmov.f32	s17, s16
 800130c:	eef0 9a48 	vmov.f32	s19, s16
 8001310:	eeb0 aa48 	vmov.f32	s20, s16
 8001314:	f000 fe9a 	bl	800204c <timer_get_time>
 8001318:	42a8      	cmp	r0, r5
 800131a:	d23a      	bcs.n	8001392 <go_forward+0x9e>
 800131c:	2000      	movs	r0, #0
 800131e:	f000 fec9 	bl	80020b4 <event_timer_wait>
 8001322:	4b24      	ldr	r3, [pc, #144]	; (80013b4 <go_forward+0xc0>)
 8001324:	8b9b      	ldrh	r3, [r3, #28]
 8001326:	b21b      	sxth	r3, r3
 8001328:	ee07 3a90 	vmov	s15, r3
 800132c:	ed9f 7a22 	vldr	s14, [pc, #136]	; 80013b8 <go_forward+0xc4>
 8001330:	eef8 6ae7 	vcvt.f32.s32	s13, s15
 8001334:	eddf 7a21 	vldr	s15, [pc, #132]	; 80013bc <go_forward+0xc8>
 8001338:	ee66 6a87 	vmul.f32	s13, s13, s14
 800133c:	4b20      	ldr	r3, [pc, #128]	; (80013c0 <go_forward+0xcc>)
 800133e:	ee46 8aa7 	vmla.f32	s17, s13, s15
 8001342:	eddf 6a20 	vldr	s13, [pc, #128]	; 80013c4 <go_forward+0xd0>
 8001346:	ee3a 9a68 	vsub.f32	s18, s20, s17
 800134a:	ee79 7a69 	vsub.f32	s15, s18, s19
 800134e:	ee77 7aa7 	vadd.f32	s15, s15, s15
 8001352:	ee49 7a26 	vmla.f32	s15, s18, s13
 8001356:	eddf 6a1c 	vldr	s13, [pc, #112]	; 80013c8 <go_forward+0xd4>
 800135a:	eeb4 8ae6 	vcmpe.f32	s16, s13
 800135e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001362:	eddf 6a1a 	vldr	s13, [pc, #104]	; 80013cc <go_forward+0xd8>
 8001366:	bf48      	it	mi
 8001368:	ee38 8a07 	vaddmi.f32	s16, s16, s14
 800136c:	ee67 7aa6 	vmul.f32	s15, s15, s13
 8001370:	ee28 7a0a 	vmul.f32	s14, s16, s20
 8001374:	ee77 6a27 	vadd.f32	s13, s14, s15
 8001378:	ee77 7a67 	vsub.f32	s15, s14, s15
 800137c:	eefd 6ae6 	vcvt.s32.f32	s13, s13
 8001380:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 8001384:	edc3 6a00 	vstr	s13, [r3]
 8001388:	edc3 7a01 	vstr	s15, [r3, #4]
 800138c:	b164      	cbz	r4, 80013a8 <go_forward+0xb4>
 800138e:	47a0      	blx	r4
 8001390:	b950      	cbnz	r0, 80013a8 <go_forward+0xb4>
 8001392:	ecbd 8b06 	vpop	{d8-d10}
 8001396:	4b0a      	ldr	r3, [pc, #40]	; (80013c0 <go_forward+0xcc>)
 8001398:	2200      	movs	r2, #0
 800139a:	601a      	str	r2, [r3, #0]
 800139c:	2064      	movs	r0, #100	; 0x64
 800139e:	605a      	str	r2, [r3, #4]
 80013a0:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80013a4:	f000 be60 	b.w	8002068 <timer_delay_ms>
 80013a8:	eef0 9a49 	vmov.f32	s19, s18
 80013ac:	e7b2      	b.n	8001314 <go_forward+0x20>
 80013ae:	bf00      	nop
 80013b0:	00000000 	.word	0x00000000
 80013b4:	20000234 	.word	0x20000234
 80013b8:	3c23d70a 	.word	0x3c23d70a
 80013bc:	399d4952 	.word	0x399d4952
 80013c0:	2000047c 	.word	0x2000047c
 80013c4:	3f333333 	.word	0x3f333333
 80013c8:	3f800000 	.word	0x3f800000
 80013cc:	42300000 	.word	0x42300000

080013d0 <motors_test>:
 80013d0:	f242 7010 	movw	r0, #10000	; 0x2710
 80013d4:	2116      	movs	r1, #22
 80013d6:	2200      	movs	r2, #0
 80013d8:	f7ff bf8c 	b.w	80012f4 <go_forward>

080013dc <uart_write>:
 80013dc:	4b03      	ldr	r3, [pc, #12]	; (80013ec <uart_write+0x10>)
 80013de:	69da      	ldr	r2, [r3, #28]
 80013e0:	0612      	lsls	r2, r2, #24
 80013e2:	d401      	bmi.n	80013e8 <uart_write+0xc>
 80013e4:	bf00      	nop
 80013e6:	e7f9      	b.n	80013dc <uart_write>
 80013e8:	8518      	strh	r0, [r3, #40]	; 0x28
 80013ea:	4770      	bx	lr
 80013ec:	40013800 	.word	0x40013800

080013f0 <uart_is_char>:
 80013f0:	4b0a      	ldr	r3, [pc, #40]	; (800141c <uart_is_char+0x2c>)
 80013f2:	4a0b      	ldr	r2, [pc, #44]	; (8001420 <uart_is_char+0x30>)
 80013f4:	6819      	ldr	r1, [r3, #0]
 80013f6:	6812      	ldr	r2, [r2, #0]
 80013f8:	4291      	cmp	r1, r2
 80013fa:	d00c      	beq.n	8001416 <uart_is_char+0x26>
 80013fc:	681a      	ldr	r2, [r3, #0]
 80013fe:	4909      	ldr	r1, [pc, #36]	; (8001424 <uart_is_char+0x34>)
 8001400:	5c88      	ldrb	r0, [r1, r2]
 8001402:	681a      	ldr	r2, [r3, #0]
 8001404:	3201      	adds	r2, #1
 8001406:	601a      	str	r2, [r3, #0]
 8001408:	681a      	ldr	r2, [r3, #0]
 800140a:	2a0f      	cmp	r2, #15
 800140c:	b2c0      	uxtb	r0, r0
 800140e:	d904      	bls.n	800141a <uart_is_char+0x2a>
 8001410:	2200      	movs	r2, #0
 8001412:	601a      	str	r2, [r3, #0]
 8001414:	4770      	bx	lr
 8001416:	f64f 70ff 	movw	r0, #65535	; 0xffff
 800141a:	4770      	bx	lr
 800141c:	200009d0 	.word	0x200009d0
 8001420:	200009cc 	.word	0x200009cc
 8001424:	200009bc 	.word	0x200009bc

08001428 <uart_read>:
 8001428:	b508      	push	{r3, lr}
 800142a:	f7ff ffe1 	bl	80013f0 <uart_is_char>
 800142e:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8001432:	4298      	cmp	r0, r3
 8001434:	d101      	bne.n	800143a <uart_read+0x12>
 8001436:	bf00      	nop
 8001438:	e7f7      	b.n	800142a <uart_read+0x2>
 800143a:	b2c0      	uxtb	r0, r0
 800143c:	bd08      	pop	{r3, pc}
	...

08001440 <uart_init>:
 8001440:	b530      	push	{r4, r5, lr}
 8001442:	4b2c      	ldr	r3, [pc, #176]	; (80014f4 <uart_init+0xb4>)
 8001444:	4d2c      	ldr	r5, [pc, #176]	; (80014f8 <uart_init+0xb8>)
 8001446:	2400      	movs	r4, #0
 8001448:	601c      	str	r4, [r3, #0]
 800144a:	4b2c      	ldr	r3, [pc, #176]	; (80014fc <uart_init+0xbc>)
 800144c:	b08b      	sub	sp, #44	; 0x2c
 800144e:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001452:	2101      	movs	r1, #1
 8001454:	601c      	str	r4, [r3, #0]
 8001456:	f000 fcf3 	bl	8001e40 <RCC_AHBPeriphClockCmd>
 800145a:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 800145e:	2101      	movs	r1, #1
 8001460:	f000 fcfc 	bl	8001e5c <RCC_APB2PeriphClockCmd>
 8001464:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001468:	9302      	str	r3, [sp, #8]
 800146a:	2302      	movs	r3, #2
 800146c:	f88d 300c 	strb.w	r3, [sp, #12]
 8001470:	a902      	add	r1, sp, #8
 8001472:	2303      	movs	r3, #3
 8001474:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001478:	f88d 300d 	strb.w	r3, [sp, #13]
 800147c:	f88d 400e 	strb.w	r4, [sp, #14]
 8001480:	f88d 400f 	strb.w	r4, [sp, #15]
 8001484:	f000 fe28 	bl	80020d8 <GPIO_Init>
 8001488:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800148c:	2109      	movs	r1, #9
 800148e:	2207      	movs	r2, #7
 8001490:	f000 fe70 	bl	8002174 <GPIO_PinAFConfig>
 8001494:	2207      	movs	r2, #7
 8001496:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800149a:	210a      	movs	r1, #10
 800149c:	f000 fe6a 	bl	8002174 <GPIO_PinAFConfig>
 80014a0:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 80014a4:	9304      	str	r3, [sp, #16]
 80014a6:	4628      	mov	r0, r5
 80014a8:	230c      	movs	r3, #12
 80014aa:	a904      	add	r1, sp, #16
 80014ac:	9308      	str	r3, [sp, #32]
 80014ae:	9405      	str	r4, [sp, #20]
 80014b0:	9406      	str	r4, [sp, #24]
 80014b2:	9407      	str	r4, [sp, #28]
 80014b4:	9409      	str	r4, [sp, #36]	; 0x24
 80014b6:	f000 f855 	bl	8001564 <USART_Init>
 80014ba:	4628      	mov	r0, r5
 80014bc:	2101      	movs	r1, #1
 80014be:	f000 f8b3 	bl	8001628 <USART_Cmd>
 80014c2:	2201      	movs	r2, #1
 80014c4:	4628      	mov	r0, r5
 80014c6:	490e      	ldr	r1, [pc, #56]	; (8001500 <uart_init+0xc0>)
 80014c8:	f000 f8be 	bl	8001648 <USART_ITConfig>
 80014cc:	2325      	movs	r3, #37	; 0x25
 80014ce:	f88d 4005 	strb.w	r4, [sp, #5]
 80014d2:	f88d 4006 	strb.w	r4, [sp, #6]
 80014d6:	a801      	add	r0, sp, #4
 80014d8:	2401      	movs	r4, #1
 80014da:	f88d 3004 	strb.w	r3, [sp, #4]
 80014de:	f88d 4007 	strb.w	r4, [sp, #7]
 80014e2:	f000 f8ff 	bl	80016e4 <NVIC_Init>
 80014e6:	4628      	mov	r0, r5
 80014e8:	4621      	mov	r1, r4
 80014ea:	f000 f89d 	bl	8001628 <USART_Cmd>
 80014ee:	b00b      	add	sp, #44	; 0x2c
 80014f0:	bd30      	pop	{r4, r5, pc}
 80014f2:	bf00      	nop
 80014f4:	200009cc 	.word	0x200009cc
 80014f8:	40013800 	.word	0x40013800
 80014fc:	200009d0 	.word	0x200009d0
 8001500:	00050105 	.word	0x00050105

08001504 <USART1_IRQHandler>:
 8001504:	b508      	push	{r3, lr}
 8001506:	480d      	ldr	r0, [pc, #52]	; (800153c <USART1_IRQHandler+0x38>)
 8001508:	490d      	ldr	r1, [pc, #52]	; (8001540 <USART1_IRQHandler+0x3c>)
 800150a:	f000 f8b6 	bl	800167a <USART_GetITStatus>
 800150e:	b178      	cbz	r0, 8001530 <USART1_IRQHandler+0x2c>
 8001510:	480a      	ldr	r0, [pc, #40]	; (800153c <USART1_IRQHandler+0x38>)
 8001512:	f000 f894 	bl	800163e <USART_ReceiveData>
 8001516:	4b0b      	ldr	r3, [pc, #44]	; (8001544 <USART1_IRQHandler+0x40>)
 8001518:	490b      	ldr	r1, [pc, #44]	; (8001548 <USART1_IRQHandler+0x44>)
 800151a:	681a      	ldr	r2, [r3, #0]
 800151c:	b2c0      	uxtb	r0, r0
 800151e:	5488      	strb	r0, [r1, r2]
 8001520:	681a      	ldr	r2, [r3, #0]
 8001522:	3201      	adds	r2, #1
 8001524:	601a      	str	r2, [r3, #0]
 8001526:	681a      	ldr	r2, [r3, #0]
 8001528:	2a0f      	cmp	r2, #15
 800152a:	bf84      	itt	hi
 800152c:	2200      	movhi	r2, #0
 800152e:	601a      	strhi	r2, [r3, #0]
 8001530:	4802      	ldr	r0, [pc, #8]	; (800153c <USART1_IRQHandler+0x38>)
 8001532:	4903      	ldr	r1, [pc, #12]	; (8001540 <USART1_IRQHandler+0x3c>)
 8001534:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001538:	f000 b8be 	b.w	80016b8 <USART_ClearITPendingBit>
 800153c:	40013800 	.word	0x40013800
 8001540:	00050105 	.word	0x00050105
 8001544:	200009cc 	.word	0x200009cc
 8001548:	200009bc 	.word	0x200009bc

0800154c <uart_clear_buffer>:
 800154c:	b672      	cpsid	i
 800154e:	2300      	movs	r3, #0
 8001550:	4a03      	ldr	r2, [pc, #12]	; (8001560 <uart_clear_buffer+0x14>)
 8001552:	2100      	movs	r1, #0
 8001554:	54d1      	strb	r1, [r2, r3]
 8001556:	3301      	adds	r3, #1
 8001558:	2b10      	cmp	r3, #16
 800155a:	d1f9      	bne.n	8001550 <uart_clear_buffer+0x4>
 800155c:	b662      	cpsie	i
 800155e:	4770      	bx	lr
 8001560:	200009bc 	.word	0x200009bc

08001564 <USART_Init>:
 8001564:	b530      	push	{r4, r5, lr}
 8001566:	4604      	mov	r4, r0
 8001568:	b099      	sub	sp, #100	; 0x64
 800156a:	460d      	mov	r5, r1
 800156c:	bf00      	nop
 800156e:	bf00      	nop
 8001570:	bf00      	nop
 8001572:	bf00      	nop
 8001574:	bf00      	nop
 8001576:	bf00      	nop
 8001578:	bf00      	nop
 800157a:	6803      	ldr	r3, [r0, #0]
 800157c:	f023 0301 	bic.w	r3, r3, #1
 8001580:	6003      	str	r3, [r0, #0]
 8001582:	6842      	ldr	r2, [r0, #4]
 8001584:	688b      	ldr	r3, [r1, #8]
 8001586:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 800158a:	4313      	orrs	r3, r2
 800158c:	6043      	str	r3, [r0, #4]
 800158e:	686a      	ldr	r2, [r5, #4]
 8001590:	68eb      	ldr	r3, [r5, #12]
 8001592:	6801      	ldr	r1, [r0, #0]
 8001594:	431a      	orrs	r2, r3
 8001596:	692b      	ldr	r3, [r5, #16]
 8001598:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 800159c:	f021 010c 	bic.w	r1, r1, #12
 80015a0:	4313      	orrs	r3, r2
 80015a2:	430b      	orrs	r3, r1
 80015a4:	6003      	str	r3, [r0, #0]
 80015a6:	6882      	ldr	r2, [r0, #8]
 80015a8:	696b      	ldr	r3, [r5, #20]
 80015aa:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 80015ae:	4313      	orrs	r3, r2
 80015b0:	6083      	str	r3, [r0, #8]
 80015b2:	a801      	add	r0, sp, #4
 80015b4:	f000 fab8 	bl	8001b28 <RCC_GetClocksFreq>
 80015b8:	4b17      	ldr	r3, [pc, #92]	; (8001618 <USART_Init+0xb4>)
 80015ba:	429c      	cmp	r4, r3
 80015bc:	d101      	bne.n	80015c2 <USART_Init+0x5e>
 80015be:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 80015c0:	e00e      	b.n	80015e0 <USART_Init+0x7c>
 80015c2:	4b16      	ldr	r3, [pc, #88]	; (800161c <USART_Init+0xb8>)
 80015c4:	429c      	cmp	r4, r3
 80015c6:	d101      	bne.n	80015cc <USART_Init+0x68>
 80015c8:	9a10      	ldr	r2, [sp, #64]	; 0x40
 80015ca:	e009      	b.n	80015e0 <USART_Init+0x7c>
 80015cc:	4b14      	ldr	r3, [pc, #80]	; (8001620 <USART_Init+0xbc>)
 80015ce:	429c      	cmp	r4, r3
 80015d0:	d101      	bne.n	80015d6 <USART_Init+0x72>
 80015d2:	9a11      	ldr	r2, [sp, #68]	; 0x44
 80015d4:	e004      	b.n	80015e0 <USART_Init+0x7c>
 80015d6:	4b13      	ldr	r3, [pc, #76]	; (8001624 <USART_Init+0xc0>)
 80015d8:	429c      	cmp	r4, r3
 80015da:	bf0c      	ite	eq
 80015dc:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 80015de:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 80015e0:	6823      	ldr	r3, [r4, #0]
 80015e2:	6829      	ldr	r1, [r5, #0]
 80015e4:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 80015e8:	bf18      	it	ne
 80015ea:	0052      	lslne	r2, r2, #1
 80015ec:	fbb2 f3f1 	udiv	r3, r2, r1
 80015f0:	fb01 2213 	mls	r2, r1, r3, r2
 80015f4:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 80015f8:	6822      	ldr	r2, [r4, #0]
 80015fa:	bf28      	it	cs
 80015fc:	3301      	addcs	r3, #1
 80015fe:	0412      	lsls	r2, r2, #16
 8001600:	d506      	bpl.n	8001610 <USART_Init+0xac>
 8001602:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 8001606:	f3c3 0142 	ubfx	r1, r3, #1, #3
 800160a:	401a      	ands	r2, r3
 800160c:	ea41 0302 	orr.w	r3, r1, r2
 8001610:	b29b      	uxth	r3, r3
 8001612:	81a3      	strh	r3, [r4, #12]
 8001614:	b019      	add	sp, #100	; 0x64
 8001616:	bd30      	pop	{r4, r5, pc}
 8001618:	40013800 	.word	0x40013800
 800161c:	40004400 	.word	0x40004400
 8001620:	40004800 	.word	0x40004800
 8001624:	40004c00 	.word	0x40004c00

08001628 <USART_Cmd>:
 8001628:	bf00      	nop
 800162a:	bf00      	nop
 800162c:	6803      	ldr	r3, [r0, #0]
 800162e:	b111      	cbz	r1, 8001636 <USART_Cmd+0xe>
 8001630:	f043 0301 	orr.w	r3, r3, #1
 8001634:	e001      	b.n	800163a <USART_Cmd+0x12>
 8001636:	f023 0301 	bic.w	r3, r3, #1
 800163a:	6003      	str	r3, [r0, #0]
 800163c:	4770      	bx	lr

0800163e <USART_ReceiveData>:
 800163e:	bf00      	nop
 8001640:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8001642:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8001646:	4770      	bx	lr

08001648 <USART_ITConfig>:
 8001648:	b510      	push	{r4, lr}
 800164a:	bf00      	nop
 800164c:	bf00      	nop
 800164e:	bf00      	nop
 8001650:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8001654:	2401      	movs	r4, #1
 8001656:	b2c9      	uxtb	r1, r1
 8001658:	2b02      	cmp	r3, #2
 800165a:	fa04 f101 	lsl.w	r1, r4, r1
 800165e:	d101      	bne.n	8001664 <USART_ITConfig+0x1c>
 8001660:	3004      	adds	r0, #4
 8001662:	e002      	b.n	800166a <USART_ITConfig+0x22>
 8001664:	2b03      	cmp	r3, #3
 8001666:	bf08      	it	eq
 8001668:	3008      	addeq	r0, #8
 800166a:	6803      	ldr	r3, [r0, #0]
 800166c:	b10a      	cbz	r2, 8001672 <USART_ITConfig+0x2a>
 800166e:	4319      	orrs	r1, r3
 8001670:	e001      	b.n	8001676 <USART_ITConfig+0x2e>
 8001672:	ea23 0101 	bic.w	r1, r3, r1
 8001676:	6001      	str	r1, [r0, #0]
 8001678:	bd10      	pop	{r4, pc}

0800167a <USART_GetITStatus>:
 800167a:	b510      	push	{r4, lr}
 800167c:	bf00      	nop
 800167e:	bf00      	nop
 8001680:	2401      	movs	r4, #1
 8001682:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8001686:	b2cb      	uxtb	r3, r1
 8001688:	42a2      	cmp	r2, r4
 800168a:	fa04 f303 	lsl.w	r3, r4, r3
 800168e:	d101      	bne.n	8001694 <USART_GetITStatus+0x1a>
 8001690:	6802      	ldr	r2, [r0, #0]
 8001692:	e003      	b.n	800169c <USART_GetITStatus+0x22>
 8001694:	2a02      	cmp	r2, #2
 8001696:	bf0c      	ite	eq
 8001698:	6842      	ldreq	r2, [r0, #4]
 800169a:	6882      	ldrne	r2, [r0, #8]
 800169c:	4013      	ands	r3, r2
 800169e:	69c2      	ldr	r2, [r0, #28]
 80016a0:	b143      	cbz	r3, 80016b4 <USART_GetITStatus+0x3a>
 80016a2:	2301      	movs	r3, #1
 80016a4:	0c09      	lsrs	r1, r1, #16
 80016a6:	fa03 f101 	lsl.w	r1, r3, r1
 80016aa:	4211      	tst	r1, r2
 80016ac:	bf0c      	ite	eq
 80016ae:	2000      	moveq	r0, #0
 80016b0:	2001      	movne	r0, #1
 80016b2:	bd10      	pop	{r4, pc}
 80016b4:	4618      	mov	r0, r3
 80016b6:	bd10      	pop	{r4, pc}

080016b8 <USART_ClearITPendingBit>:
 80016b8:	bf00      	nop
 80016ba:	bf00      	nop
 80016bc:	2301      	movs	r3, #1
 80016be:	0c09      	lsrs	r1, r1, #16
 80016c0:	fa03 f101 	lsl.w	r1, r3, r1
 80016c4:	6201      	str	r1, [r0, #32]
 80016c6:	4770      	bx	lr

080016c8 <lib_low_level_init>:
 80016c8:	b508      	push	{r3, lr}
 80016ca:	f000 f9a9 	bl	8001a20 <sytem_clock_init>
 80016ce:	f000 fd93 	bl	80021f8 <gpio_init>
 80016d2:	f7ff feb5 	bl	8001440 <uart_init>
 80016d6:	f000 fc41 	bl	8001f5c <timer_init>
 80016da:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80016de:	f000 b88f 	b.w	8001800 <i2c_0_init>
	...

080016e4 <NVIC_Init>:
 80016e4:	b510      	push	{r4, lr}
 80016e6:	bf00      	nop
 80016e8:	bf00      	nop
 80016ea:	bf00      	nop
 80016ec:	78c2      	ldrb	r2, [r0, #3]
 80016ee:	7803      	ldrb	r3, [r0, #0]
 80016f0:	b30a      	cbz	r2, 8001736 <NVIC_Init+0x52>
 80016f2:	4a16      	ldr	r2, [pc, #88]	; (800174c <NVIC_Init+0x68>)
 80016f4:	7844      	ldrb	r4, [r0, #1]
 80016f6:	68d2      	ldr	r2, [r2, #12]
 80016f8:	43d2      	mvns	r2, r2
 80016fa:	f3c2 2202 	ubfx	r2, r2, #8, #3
 80016fe:	f1c2 0104 	rsb	r1, r2, #4
 8001702:	b2c9      	uxtb	r1, r1
 8001704:	fa04 f101 	lsl.w	r1, r4, r1
 8001708:	240f      	movs	r4, #15
 800170a:	fa44 f202 	asr.w	r2, r4, r2
 800170e:	7884      	ldrb	r4, [r0, #2]
 8001710:	b2c9      	uxtb	r1, r1
 8001712:	4022      	ands	r2, r4
 8001714:	430a      	orrs	r2, r1
 8001716:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 800171a:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 800171e:	0112      	lsls	r2, r2, #4
 8001720:	b2d2      	uxtb	r2, r2
 8001722:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8001726:	7803      	ldrb	r3, [r0, #0]
 8001728:	2201      	movs	r2, #1
 800172a:	0959      	lsrs	r1, r3, #5
 800172c:	f003 031f 	and.w	r3, r3, #31
 8001730:	fa02 f303 	lsl.w	r3, r2, r3
 8001734:	e006      	b.n	8001744 <NVIC_Init+0x60>
 8001736:	0959      	lsrs	r1, r3, #5
 8001738:	2201      	movs	r2, #1
 800173a:	f003 031f 	and.w	r3, r3, #31
 800173e:	fa02 f303 	lsl.w	r3, r2, r3
 8001742:	3120      	adds	r1, #32
 8001744:	4a02      	ldr	r2, [pc, #8]	; (8001750 <NVIC_Init+0x6c>)
 8001746:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 800174a:	bd10      	pop	{r4, pc}
 800174c:	e000ed00 	.word	0xe000ed00
 8001750:	e000e100 	.word	0xe000e100

08001754 <i2c_delay>:
 8001754:	bf00      	nop
 8001756:	4770      	bx	lr

08001758 <SetLowSDA>:
 8001758:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800175a:	4d0d      	ldr	r5, [pc, #52]	; (8001790 <SetLowSDA+0x38>)
 800175c:	2301      	movs	r3, #1
 800175e:	2203      	movs	r2, #3
 8001760:	2480      	movs	r4, #128	; 0x80
 8001762:	f88d 3004 	strb.w	r3, [sp, #4]
 8001766:	f88d 3006 	strb.w	r3, [sp, #6]
 800176a:	4628      	mov	r0, r5
 800176c:	2300      	movs	r3, #0
 800176e:	4669      	mov	r1, sp
 8001770:	f88d 2005 	strb.w	r2, [sp, #5]
 8001774:	f88d 3007 	strb.w	r3, [sp, #7]
 8001778:	9400      	str	r4, [sp, #0]
 800177a:	f000 fcad 	bl	80020d8 <GPIO_Init>
 800177e:	4628      	mov	r0, r5
 8001780:	4621      	mov	r1, r4
 8001782:	f000 fcf3 	bl	800216c <GPIO_ResetBits>
 8001786:	f7ff ffe5 	bl	8001754 <i2c_delay>
 800178a:	b003      	add	sp, #12
 800178c:	bd30      	pop	{r4, r5, pc}
 800178e:	bf00      	nop
 8001790:	48000400 	.word	0x48000400

08001794 <SetHighSDA>:
 8001794:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001796:	4d0d      	ldr	r5, [pc, #52]	; (80017cc <SetHighSDA+0x38>)
 8001798:	2203      	movs	r2, #3
 800179a:	2300      	movs	r3, #0
 800179c:	2480      	movs	r4, #128	; 0x80
 800179e:	f88d 2005 	strb.w	r2, [sp, #5]
 80017a2:	4628      	mov	r0, r5
 80017a4:	2201      	movs	r2, #1
 80017a6:	4669      	mov	r1, sp
 80017a8:	f88d 3004 	strb.w	r3, [sp, #4]
 80017ac:	f88d 2006 	strb.w	r2, [sp, #6]
 80017b0:	f88d 3007 	strb.w	r3, [sp, #7]
 80017b4:	9400      	str	r4, [sp, #0]
 80017b6:	f000 fc8f 	bl	80020d8 <GPIO_Init>
 80017ba:	4628      	mov	r0, r5
 80017bc:	4621      	mov	r1, r4
 80017be:	f000 fcd1 	bl	8002164 <GPIO_SetBits>
 80017c2:	f7ff ffc7 	bl	8001754 <i2c_delay>
 80017c6:	b003      	add	sp, #12
 80017c8:	bd30      	pop	{r4, r5, pc}
 80017ca:	bf00      	nop
 80017cc:	48000400 	.word	0x48000400

080017d0 <SetLowSCL>:
 80017d0:	b508      	push	{r3, lr}
 80017d2:	4804      	ldr	r0, [pc, #16]	; (80017e4 <SetLowSCL+0x14>)
 80017d4:	2140      	movs	r1, #64	; 0x40
 80017d6:	f000 fcc9 	bl	800216c <GPIO_ResetBits>
 80017da:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80017de:	f7ff bfb9 	b.w	8001754 <i2c_delay>
 80017e2:	bf00      	nop
 80017e4:	48000400 	.word	0x48000400

080017e8 <SetHighSCL>:
 80017e8:	b508      	push	{r3, lr}
 80017ea:	4804      	ldr	r0, [pc, #16]	; (80017fc <SetHighSCL+0x14>)
 80017ec:	2140      	movs	r1, #64	; 0x40
 80017ee:	f000 fcb9 	bl	8002164 <GPIO_SetBits>
 80017f2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80017f6:	f7ff bfad 	b.w	8001754 <i2c_delay>
 80017fa:	bf00      	nop
 80017fc:	48000400 	.word	0x48000400

08001800 <i2c_0_init>:
 8001800:	b507      	push	{r0, r1, r2, lr}
 8001802:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001806:	2101      	movs	r1, #1
 8001808:	f000 fb1a 	bl	8001e40 <RCC_AHBPeriphClockCmd>
 800180c:	23c0      	movs	r3, #192	; 0xc0
 800180e:	9300      	str	r3, [sp, #0]
 8001810:	2301      	movs	r3, #1
 8001812:	2203      	movs	r2, #3
 8001814:	480a      	ldr	r0, [pc, #40]	; (8001840 <i2c_0_init+0x40>)
 8001816:	f88d 3004 	strb.w	r3, [sp, #4]
 800181a:	4669      	mov	r1, sp
 800181c:	f88d 3006 	strb.w	r3, [sp, #6]
 8001820:	2300      	movs	r3, #0
 8001822:	f88d 2005 	strb.w	r2, [sp, #5]
 8001826:	f88d 3007 	strb.w	r3, [sp, #7]
 800182a:	f000 fc55 	bl	80020d8 <GPIO_Init>
 800182e:	f7ff ffdb 	bl	80017e8 <SetHighSCL>
 8001832:	f7ff ff91 	bl	8001758 <SetLowSDA>
 8001836:	f7ff ffad 	bl	8001794 <SetHighSDA>
 800183a:	b003      	add	sp, #12
 800183c:	f85d fb04 	ldr.w	pc, [sp], #4
 8001840:	48000400 	.word	0x48000400

08001844 <i2cStart>:
 8001844:	b508      	push	{r3, lr}
 8001846:	f7ff ffcf 	bl	80017e8 <SetHighSCL>
 800184a:	f7ff ffa3 	bl	8001794 <SetHighSDA>
 800184e:	f7ff ffcb 	bl	80017e8 <SetHighSCL>
 8001852:	f7ff ff81 	bl	8001758 <SetLowSDA>
 8001856:	f7ff ffbb 	bl	80017d0 <SetLowSCL>
 800185a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800185e:	f7ff bf99 	b.w	8001794 <SetHighSDA>

08001862 <i2cStop>:
 8001862:	b508      	push	{r3, lr}
 8001864:	f7ff ffb4 	bl	80017d0 <SetLowSCL>
 8001868:	f7ff ff76 	bl	8001758 <SetLowSDA>
 800186c:	f7ff ffbc 	bl	80017e8 <SetHighSCL>
 8001870:	f7ff ff72 	bl	8001758 <SetLowSDA>
 8001874:	f7ff ffb8 	bl	80017e8 <SetHighSCL>
 8001878:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800187c:	f7ff bf8a 	b.w	8001794 <SetHighSDA>

08001880 <i2cWrite>:
 8001880:	b538      	push	{r3, r4, r5, lr}
 8001882:	4604      	mov	r4, r0
 8001884:	2508      	movs	r5, #8
 8001886:	f7ff ffa3 	bl	80017d0 <SetLowSCL>
 800188a:	0623      	lsls	r3, r4, #24
 800188c:	d502      	bpl.n	8001894 <i2cWrite+0x14>
 800188e:	f7ff ff81 	bl	8001794 <SetHighSDA>
 8001892:	e001      	b.n	8001898 <i2cWrite+0x18>
 8001894:	f7ff ff60 	bl	8001758 <SetLowSDA>
 8001898:	3d01      	subs	r5, #1
 800189a:	f7ff ffa5 	bl	80017e8 <SetHighSCL>
 800189e:	0064      	lsls	r4, r4, #1
 80018a0:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80018a4:	b2e4      	uxtb	r4, r4
 80018a6:	d1ee      	bne.n	8001886 <i2cWrite+0x6>
 80018a8:	f7ff ff92 	bl	80017d0 <SetLowSCL>
 80018ac:	f7ff ff72 	bl	8001794 <SetHighSDA>
 80018b0:	f7ff ff9a 	bl	80017e8 <SetHighSCL>
 80018b4:	4b05      	ldr	r3, [pc, #20]	; (80018cc <i2cWrite+0x4c>)
 80018b6:	8a1c      	ldrh	r4, [r3, #16]
 80018b8:	b2a4      	uxth	r4, r4
 80018ba:	f7ff ff89 	bl	80017d0 <SetLowSCL>
 80018be:	f7ff ff49 	bl	8001754 <i2c_delay>
 80018c2:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 80018c6:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 80018ca:	bd38      	pop	{r3, r4, r5, pc}
 80018cc:	48000400 	.word	0x48000400

080018d0 <i2cRead>:
 80018d0:	b570      	push	{r4, r5, r6, lr}
 80018d2:	4606      	mov	r6, r0
 80018d4:	f7ff ff7c 	bl	80017d0 <SetLowSCL>
 80018d8:	f7ff ff5c 	bl	8001794 <SetHighSDA>
 80018dc:	2508      	movs	r5, #8
 80018de:	2400      	movs	r4, #0
 80018e0:	f7ff ff82 	bl	80017e8 <SetHighSCL>
 80018e4:	4b0d      	ldr	r3, [pc, #52]	; (800191c <i2cRead+0x4c>)
 80018e6:	8a1b      	ldrh	r3, [r3, #16]
 80018e8:	0064      	lsls	r4, r4, #1
 80018ea:	061a      	lsls	r2, r3, #24
 80018ec:	b2e4      	uxtb	r4, r4
 80018ee:	bf48      	it	mi
 80018f0:	3401      	addmi	r4, #1
 80018f2:	f105 35ff 	add.w	r5, r5, #4294967295
 80018f6:	bf48      	it	mi
 80018f8:	b2e4      	uxtbmi	r4, r4
 80018fa:	f7ff ff69 	bl	80017d0 <SetLowSCL>
 80018fe:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001902:	d1ed      	bne.n	80018e0 <i2cRead+0x10>
 8001904:	b10e      	cbz	r6, 800190a <i2cRead+0x3a>
 8001906:	f7ff ff27 	bl	8001758 <SetLowSDA>
 800190a:	f7ff ff6d 	bl	80017e8 <SetHighSCL>
 800190e:	f7ff ff5f 	bl	80017d0 <SetLowSCL>
 8001912:	f7ff ff1f 	bl	8001754 <i2c_delay>
 8001916:	4620      	mov	r0, r4
 8001918:	bd70      	pop	{r4, r5, r6, pc}
 800191a:	bf00      	nop
 800191c:	48000400 	.word	0x48000400

08001920 <i2c_write_reg>:
 8001920:	b570      	push	{r4, r5, r6, lr}
 8001922:	4605      	mov	r5, r0
 8001924:	460c      	mov	r4, r1
 8001926:	4616      	mov	r6, r2
 8001928:	f7ff ff8c 	bl	8001844 <i2cStart>
 800192c:	4628      	mov	r0, r5
 800192e:	f7ff ffa7 	bl	8001880 <i2cWrite>
 8001932:	4620      	mov	r0, r4
 8001934:	f7ff ffa4 	bl	8001880 <i2cWrite>
 8001938:	4630      	mov	r0, r6
 800193a:	f7ff ffa1 	bl	8001880 <i2cWrite>
 800193e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001942:	f7ff bf8e 	b.w	8001862 <i2cStop>

08001946 <i2c_read_reg>:
 8001946:	b538      	push	{r3, r4, r5, lr}
 8001948:	4604      	mov	r4, r0
 800194a:	460d      	mov	r5, r1
 800194c:	f7ff ff7a 	bl	8001844 <i2cStart>
 8001950:	4620      	mov	r0, r4
 8001952:	f7ff ff95 	bl	8001880 <i2cWrite>
 8001956:	4628      	mov	r0, r5
 8001958:	f7ff ff92 	bl	8001880 <i2cWrite>
 800195c:	f7ff ff72 	bl	8001844 <i2cStart>
 8001960:	f044 0001 	orr.w	r0, r4, #1
 8001964:	f7ff ff8c 	bl	8001880 <i2cWrite>
 8001968:	2000      	movs	r0, #0
 800196a:	f7ff ffb1 	bl	80018d0 <i2cRead>
 800196e:	4604      	mov	r4, r0
 8001970:	f7ff ff77 	bl	8001862 <i2cStop>
 8001974:	4620      	mov	r0, r4
 8001976:	bd38      	pop	{r3, r4, r5, pc}

08001978 <Default_Handler>:
 8001978:	4668      	mov	r0, sp
 800197a:	f020 0107 	bic.w	r1, r0, #7
 800197e:	468d      	mov	sp, r1
 8001980:	bf00      	nop
 8001982:	e7fd      	b.n	8001980 <Default_Handler+0x8>

08001984 <HardFault_Handler>:
 8001984:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001988:	f000 fc0a 	bl	80021a0 <led_on>
 800198c:	4b06      	ldr	r3, [pc, #24]	; (80019a8 <HardFault_Handler+0x24>)
 800198e:	3b01      	subs	r3, #1
 8001990:	d001      	beq.n	8001996 <HardFault_Handler+0x12>
 8001992:	bf00      	nop
 8001994:	e7fb      	b.n	800198e <HardFault_Handler+0xa>
 8001996:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 800199a:	f000 fc17 	bl	80021cc <led_off>
 800199e:	4b02      	ldr	r3, [pc, #8]	; (80019a8 <HardFault_Handler+0x24>)
 80019a0:	3b01      	subs	r3, #1
 80019a2:	d0ef      	beq.n	8001984 <HardFault_Handler>
 80019a4:	bf00      	nop
 80019a6:	e7fb      	b.n	80019a0 <HardFault_Handler+0x1c>
 80019a8:	00989681 	.word	0x00989681

080019ac <_reset_init>:
 80019ac:	4a0e      	ldr	r2, [pc, #56]	; (80019e8 <_reset_init+0x3c>)
 80019ae:	480f      	ldr	r0, [pc, #60]	; (80019ec <_reset_init+0x40>)
 80019b0:	1a80      	subs	r0, r0, r2
 80019b2:	1080      	asrs	r0, r0, #2
 80019b4:	2300      	movs	r3, #0
 80019b6:	4283      	cmp	r3, r0
 80019b8:	d006      	beq.n	80019c8 <_reset_init+0x1c>
 80019ba:	490d      	ldr	r1, [pc, #52]	; (80019f0 <_reset_init+0x44>)
 80019bc:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 80019c0:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 80019c4:	3301      	adds	r3, #1
 80019c6:	e7f6      	b.n	80019b6 <_reset_init+0xa>
 80019c8:	4b0a      	ldr	r3, [pc, #40]	; (80019f4 <_reset_init+0x48>)
 80019ca:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 80019ce:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80019d2:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80019d6:	f503 730c 	add.w	r3, r3, #560	; 0x230
 80019da:	685a      	ldr	r2, [r3, #4]
 80019dc:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 80019e0:	605a      	str	r2, [r3, #4]
 80019e2:	f7fe bbd1 	b.w	8000188 <main>
 80019e6:	bf00      	nop
 80019e8:	20000000 	.word	0x20000000
 80019ec:	20000030 	.word	0x20000030
 80019f0:	08002418 	.word	0x08002418
 80019f4:	e000ed00 	.word	0xe000ed00

080019f8 <sys_tick_init>:
 80019f8:	4b05      	ldr	r3, [pc, #20]	; (8001a10 <sys_tick_init+0x18>)
 80019fa:	4a06      	ldr	r2, [pc, #24]	; (8001a14 <sys_tick_init+0x1c>)
 80019fc:	605a      	str	r2, [r3, #4]
 80019fe:	4a06      	ldr	r2, [pc, #24]	; (8001a18 <sys_tick_init+0x20>)
 8001a00:	21f0      	movs	r1, #240	; 0xf0
 8001a02:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8001a06:	2200      	movs	r2, #0
 8001a08:	609a      	str	r2, [r3, #8]
 8001a0a:	2207      	movs	r2, #7
 8001a0c:	601a      	str	r2, [r3, #0]
 8001a0e:	4770      	bx	lr
 8001a10:	e000e010 	.word	0xe000e010
 8001a14:	00029040 	.word	0x00029040
 8001a18:	e000ed00 	.word	0xe000ed00

08001a1c <sleep>:
 8001a1c:	bf30      	wfi
 8001a1e:	4770      	bx	lr

08001a20 <sytem_clock_init>:
 8001a20:	f000 b800 	b.w	8001a24 <SystemInit>

08001a24 <SystemInit>:
 8001a24:	4b3b      	ldr	r3, [pc, #236]	; (8001b14 <SystemInit+0xf0>)
 8001a26:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001a2a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001a2e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001a32:	4b39      	ldr	r3, [pc, #228]	; (8001b18 <SystemInit+0xf4>)
 8001a34:	681a      	ldr	r2, [r3, #0]
 8001a36:	f042 0201 	orr.w	r2, r2, #1
 8001a3a:	601a      	str	r2, [r3, #0]
 8001a3c:	6859      	ldr	r1, [r3, #4]
 8001a3e:	4a37      	ldr	r2, [pc, #220]	; (8001b1c <SystemInit+0xf8>)
 8001a40:	400a      	ands	r2, r1
 8001a42:	605a      	str	r2, [r3, #4]
 8001a44:	681a      	ldr	r2, [r3, #0]
 8001a46:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 8001a4a:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8001a4e:	601a      	str	r2, [r3, #0]
 8001a50:	681a      	ldr	r2, [r3, #0]
 8001a52:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 8001a56:	601a      	str	r2, [r3, #0]
 8001a58:	685a      	ldr	r2, [r3, #4]
 8001a5a:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8001a5e:	605a      	str	r2, [r3, #4]
 8001a60:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001a62:	f022 020f 	bic.w	r2, r2, #15
 8001a66:	62da      	str	r2, [r3, #44]	; 0x2c
 8001a68:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8001a6a:	4a2d      	ldr	r2, [pc, #180]	; (8001b20 <SystemInit+0xfc>)
 8001a6c:	b082      	sub	sp, #8
 8001a6e:	400a      	ands	r2, r1
 8001a70:	631a      	str	r2, [r3, #48]	; 0x30
 8001a72:	2200      	movs	r2, #0
 8001a74:	609a      	str	r2, [r3, #8]
 8001a76:	9200      	str	r2, [sp, #0]
 8001a78:	9201      	str	r2, [sp, #4]
 8001a7a:	681a      	ldr	r2, [r3, #0]
 8001a7c:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001a80:	601a      	str	r2, [r3, #0]
 8001a82:	4b25      	ldr	r3, [pc, #148]	; (8001b18 <SystemInit+0xf4>)
 8001a84:	681a      	ldr	r2, [r3, #0]
 8001a86:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8001a8a:	9201      	str	r2, [sp, #4]
 8001a8c:	9a00      	ldr	r2, [sp, #0]
 8001a8e:	3201      	adds	r2, #1
 8001a90:	9200      	str	r2, [sp, #0]
 8001a92:	9a01      	ldr	r2, [sp, #4]
 8001a94:	b91a      	cbnz	r2, 8001a9e <SystemInit+0x7a>
 8001a96:	9a00      	ldr	r2, [sp, #0]
 8001a98:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8001a9c:	d1f1      	bne.n	8001a82 <SystemInit+0x5e>
 8001a9e:	681b      	ldr	r3, [r3, #0]
 8001aa0:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8001aa4:	bf18      	it	ne
 8001aa6:	2301      	movne	r3, #1
 8001aa8:	9301      	str	r3, [sp, #4]
 8001aaa:	9b01      	ldr	r3, [sp, #4]
 8001aac:	2b01      	cmp	r3, #1
 8001aae:	d005      	beq.n	8001abc <SystemInit+0x98>
 8001ab0:	4b18      	ldr	r3, [pc, #96]	; (8001b14 <SystemInit+0xf0>)
 8001ab2:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8001ab6:	609a      	str	r2, [r3, #8]
 8001ab8:	b002      	add	sp, #8
 8001aba:	4770      	bx	lr
 8001abc:	4b19      	ldr	r3, [pc, #100]	; (8001b24 <SystemInit+0x100>)
 8001abe:	2212      	movs	r2, #18
 8001ac0:	601a      	str	r2, [r3, #0]
 8001ac2:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 8001ac6:	685a      	ldr	r2, [r3, #4]
 8001ac8:	605a      	str	r2, [r3, #4]
 8001aca:	685a      	ldr	r2, [r3, #4]
 8001acc:	605a      	str	r2, [r3, #4]
 8001ace:	685a      	ldr	r2, [r3, #4]
 8001ad0:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8001ad4:	605a      	str	r2, [r3, #4]
 8001ad6:	685a      	ldr	r2, [r3, #4]
 8001ad8:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8001adc:	605a      	str	r2, [r3, #4]
 8001ade:	685a      	ldr	r2, [r3, #4]
 8001ae0:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8001ae4:	605a      	str	r2, [r3, #4]
 8001ae6:	681a      	ldr	r2, [r3, #0]
 8001ae8:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8001aec:	601a      	str	r2, [r3, #0]
 8001aee:	6819      	ldr	r1, [r3, #0]
 8001af0:	4a09      	ldr	r2, [pc, #36]	; (8001b18 <SystemInit+0xf4>)
 8001af2:	0189      	lsls	r1, r1, #6
 8001af4:	d5fb      	bpl.n	8001aee <SystemInit+0xca>
 8001af6:	6853      	ldr	r3, [r2, #4]
 8001af8:	f023 0303 	bic.w	r3, r3, #3
 8001afc:	6053      	str	r3, [r2, #4]
 8001afe:	6853      	ldr	r3, [r2, #4]
 8001b00:	f043 0302 	orr.w	r3, r3, #2
 8001b04:	6053      	str	r3, [r2, #4]
 8001b06:	4b04      	ldr	r3, [pc, #16]	; (8001b18 <SystemInit+0xf4>)
 8001b08:	685b      	ldr	r3, [r3, #4]
 8001b0a:	f003 030c 	and.w	r3, r3, #12
 8001b0e:	2b08      	cmp	r3, #8
 8001b10:	d1f9      	bne.n	8001b06 <SystemInit+0xe2>
 8001b12:	e7cd      	b.n	8001ab0 <SystemInit+0x8c>
 8001b14:	e000ed00 	.word	0xe000ed00
 8001b18:	40021000 	.word	0x40021000
 8001b1c:	f87fc00c 	.word	0xf87fc00c
 8001b20:	ff00fccc 	.word	0xff00fccc
 8001b24:	40022000 	.word	0x40022000

08001b28 <RCC_GetClocksFreq>:
 8001b28:	4ba5      	ldr	r3, [pc, #660]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001b2a:	685a      	ldr	r2, [r3, #4]
 8001b2c:	f002 020c 	and.w	r2, r2, #12
 8001b30:	2a04      	cmp	r2, #4
 8001b32:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8001b36:	d005      	beq.n	8001b44 <RCC_GetClocksFreq+0x1c>
 8001b38:	2a08      	cmp	r2, #8
 8001b3a:	d006      	beq.n	8001b4a <RCC_GetClocksFreq+0x22>
 8001b3c:	4ba1      	ldr	r3, [pc, #644]	; (8001dc4 <RCC_GetClocksFreq+0x29c>)
 8001b3e:	6003      	str	r3, [r0, #0]
 8001b40:	b9ba      	cbnz	r2, 8001b72 <RCC_GetClocksFreq+0x4a>
 8001b42:	e017      	b.n	8001b74 <RCC_GetClocksFreq+0x4c>
 8001b44:	4b9f      	ldr	r3, [pc, #636]	; (8001dc4 <RCC_GetClocksFreq+0x29c>)
 8001b46:	6003      	str	r3, [r0, #0]
 8001b48:	e013      	b.n	8001b72 <RCC_GetClocksFreq+0x4a>
 8001b4a:	6859      	ldr	r1, [r3, #4]
 8001b4c:	685c      	ldr	r4, [r3, #4]
 8001b4e:	f3c1 4183 	ubfx	r1, r1, #18, #4
 8001b52:	03e2      	lsls	r2, r4, #15
 8001b54:	f101 0102 	add.w	r1, r1, #2
 8001b58:	d401      	bmi.n	8001b5e <RCC_GetClocksFreq+0x36>
 8001b5a:	4a9b      	ldr	r2, [pc, #620]	; (8001dc8 <RCC_GetClocksFreq+0x2a0>)
 8001b5c:	e006      	b.n	8001b6c <RCC_GetClocksFreq+0x44>
 8001b5e:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001b60:	4b98      	ldr	r3, [pc, #608]	; (8001dc4 <RCC_GetClocksFreq+0x29c>)
 8001b62:	f002 020f 	and.w	r2, r2, #15
 8001b66:	3201      	adds	r2, #1
 8001b68:	fbb3 f2f2 	udiv	r2, r3, r2
 8001b6c:	434a      	muls	r2, r1
 8001b6e:	6002      	str	r2, [r0, #0]
 8001b70:	e000      	b.n	8001b74 <RCC_GetClocksFreq+0x4c>
 8001b72:	2200      	movs	r2, #0
 8001b74:	4f92      	ldr	r7, [pc, #584]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001b76:	4d95      	ldr	r5, [pc, #596]	; (8001dcc <RCC_GetClocksFreq+0x2a4>)
 8001b78:	687b      	ldr	r3, [r7, #4]
 8001b7a:	f8df 8254 	ldr.w	r8, [pc, #596]	; 8001dd0 <RCC_GetClocksFreq+0x2a8>
 8001b7e:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8001b82:	5cec      	ldrb	r4, [r5, r3]
 8001b84:	6803      	ldr	r3, [r0, #0]
 8001b86:	b2e4      	uxtb	r4, r4
 8001b88:	fa23 f104 	lsr.w	r1, r3, r4
 8001b8c:	6041      	str	r1, [r0, #4]
 8001b8e:	687e      	ldr	r6, [r7, #4]
 8001b90:	f3c6 2602 	ubfx	r6, r6, #8, #3
 8001b94:	5dae      	ldrb	r6, [r5, r6]
 8001b96:	fa21 f606 	lsr.w	r6, r1, r6
 8001b9a:	6086      	str	r6, [r0, #8]
 8001b9c:	f8d7 c004 	ldr.w	ip, [r7, #4]
 8001ba0:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8001ba4:	f815 500c 	ldrb.w	r5, [r5, ip]
 8001ba8:	b2ed      	uxtb	r5, r5
 8001baa:	40e9      	lsrs	r1, r5
 8001bac:	60c1      	str	r1, [r0, #12]
 8001bae:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 8001bb2:	f3c9 1904 	ubfx	r9, r9, #4, #5
 8001bb6:	f009 0c0f 	and.w	ip, r9, #15
 8001bba:	f019 0f10 	tst.w	r9, #16
 8001bbe:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 8001bc2:	fa1f fc8c 	uxth.w	ip, ip
 8001bc6:	d007      	beq.n	8001bd8 <RCC_GetClocksFreq+0xb0>
 8001bc8:	f1bc 0f00 	cmp.w	ip, #0
 8001bcc:	d004      	beq.n	8001bd8 <RCC_GetClocksFreq+0xb0>
 8001bce:	fbb2 fcfc 	udiv	ip, r2, ip
 8001bd2:	f8c0 c010 	str.w	ip, [r0, #16]
 8001bd6:	e000      	b.n	8001bda <RCC_GetClocksFreq+0xb2>
 8001bd8:	6103      	str	r3, [r0, #16]
 8001bda:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 8001bdc:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 8001be0:	f00c 070f 	and.w	r7, ip, #15
 8001be4:	f01c 0f10 	tst.w	ip, #16
 8001be8:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 8001bec:	b2bf      	uxth	r7, r7
 8001bee:	d004      	beq.n	8001bfa <RCC_GetClocksFreq+0xd2>
 8001bf0:	b11f      	cbz	r7, 8001bfa <RCC_GetClocksFreq+0xd2>
 8001bf2:	fbb2 f7f7 	udiv	r7, r2, r7
 8001bf6:	6147      	str	r7, [r0, #20]
 8001bf8:	e000      	b.n	8001bfc <RCC_GetClocksFreq+0xd4>
 8001bfa:	6143      	str	r3, [r0, #20]
 8001bfc:	4f70      	ldr	r7, [pc, #448]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001bfe:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001c02:	f01c 0f10 	tst.w	ip, #16
 8001c06:	bf0a      	itet	eq
 8001c08:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 8001dc4 <RCC_GetClocksFreq+0x29c>
 8001c0c:	6183      	strne	r3, [r0, #24]
 8001c0e:	f8c0 c018 	streq.w	ip, [r0, #24]
 8001c12:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001c14:	06bf      	lsls	r7, r7, #26
 8001c16:	bf56      	itet	pl
 8001c18:	4f6a      	ldrpl	r7, [pc, #424]	; (8001dc4 <RCC_GetClocksFreq+0x29c>)
 8001c1a:	61c3      	strmi	r3, [r0, #28]
 8001c1c:	61c7      	strpl	r7, [r0, #28]
 8001c1e:	4f68      	ldr	r7, [pc, #416]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001c20:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001c24:	f01c 0f40 	tst.w	ip, #64	; 0x40
 8001c28:	bf0a      	itet	eq
 8001c2a:	f8df c198 	ldreq.w	ip, [pc, #408]	; 8001dc4 <RCC_GetClocksFreq+0x29c>
 8001c2e:	6203      	strne	r3, [r0, #32]
 8001c30:	f8c0 c020 	streq.w	ip, [r0, #32]
 8001c34:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001c36:	05ff      	lsls	r7, r7, #23
 8001c38:	d506      	bpl.n	8001c48 <RCC_GetClocksFreq+0x120>
 8001c3a:	4293      	cmp	r3, r2
 8001c3c:	d104      	bne.n	8001c48 <RCC_GetClocksFreq+0x120>
 8001c3e:	42a5      	cmp	r5, r4
 8001c40:	d102      	bne.n	8001c48 <RCC_GetClocksFreq+0x120>
 8001c42:	005f      	lsls	r7, r3, #1
 8001c44:	6247      	str	r7, [r0, #36]	; 0x24
 8001c46:	e000      	b.n	8001c4a <RCC_GetClocksFreq+0x122>
 8001c48:	6241      	str	r1, [r0, #36]	; 0x24
 8001c4a:	4f5d      	ldr	r7, [pc, #372]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001c4c:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001c50:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 8001c54:	d008      	beq.n	8001c68 <RCC_GetClocksFreq+0x140>
 8001c56:	4293      	cmp	r3, r2
 8001c58:	d106      	bne.n	8001c68 <RCC_GetClocksFreq+0x140>
 8001c5a:	42a5      	cmp	r5, r4
 8001c5c:	d104      	bne.n	8001c68 <RCC_GetClocksFreq+0x140>
 8001c5e:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001c62:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 8001c66:	e000      	b.n	8001c6a <RCC_GetClocksFreq+0x142>
 8001c68:	6281      	str	r1, [r0, #40]	; 0x28
 8001c6a:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001c6c:	05bf      	lsls	r7, r7, #22
 8001c6e:	d506      	bpl.n	8001c7e <RCC_GetClocksFreq+0x156>
 8001c70:	4293      	cmp	r3, r2
 8001c72:	d104      	bne.n	8001c7e <RCC_GetClocksFreq+0x156>
 8001c74:	42a5      	cmp	r5, r4
 8001c76:	d102      	bne.n	8001c7e <RCC_GetClocksFreq+0x156>
 8001c78:	005f      	lsls	r7, r3, #1
 8001c7a:	62c7      	str	r7, [r0, #44]	; 0x2c
 8001c7c:	e000      	b.n	8001c80 <RCC_GetClocksFreq+0x158>
 8001c7e:	62c1      	str	r1, [r0, #44]	; 0x2c
 8001c80:	4f4f      	ldr	r7, [pc, #316]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001c82:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001c86:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 8001c8a:	d008      	beq.n	8001c9e <RCC_GetClocksFreq+0x176>
 8001c8c:	4293      	cmp	r3, r2
 8001c8e:	d106      	bne.n	8001c9e <RCC_GetClocksFreq+0x176>
 8001c90:	42a5      	cmp	r5, r4
 8001c92:	d104      	bne.n	8001c9e <RCC_GetClocksFreq+0x176>
 8001c94:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001c98:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8001c9c:	e000      	b.n	8001ca0 <RCC_GetClocksFreq+0x178>
 8001c9e:	64c1      	str	r1, [r0, #76]	; 0x4c
 8001ca0:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001ca2:	053f      	lsls	r7, r7, #20
 8001ca4:	d506      	bpl.n	8001cb4 <RCC_GetClocksFreq+0x18c>
 8001ca6:	4293      	cmp	r3, r2
 8001ca8:	d104      	bne.n	8001cb4 <RCC_GetClocksFreq+0x18c>
 8001caa:	42a5      	cmp	r5, r4
 8001cac:	d102      	bne.n	8001cb4 <RCC_GetClocksFreq+0x18c>
 8001cae:	005f      	lsls	r7, r3, #1
 8001cb0:	6507      	str	r7, [r0, #80]	; 0x50
 8001cb2:	e000      	b.n	8001cb6 <RCC_GetClocksFreq+0x18e>
 8001cb4:	6501      	str	r1, [r0, #80]	; 0x50
 8001cb6:	4f42      	ldr	r7, [pc, #264]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001cb8:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001cbc:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 8001cc0:	d008      	beq.n	8001cd4 <RCC_GetClocksFreq+0x1ac>
 8001cc2:	4293      	cmp	r3, r2
 8001cc4:	d106      	bne.n	8001cd4 <RCC_GetClocksFreq+0x1ac>
 8001cc6:	42a5      	cmp	r5, r4
 8001cc8:	d104      	bne.n	8001cd4 <RCC_GetClocksFreq+0x1ac>
 8001cca:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001cce:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 8001cd2:	e000      	b.n	8001cd6 <RCC_GetClocksFreq+0x1ae>
 8001cd4:	6501      	str	r1, [r0, #80]	; 0x50
 8001cd6:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001cd8:	043f      	lsls	r7, r7, #16
 8001cda:	d506      	bpl.n	8001cea <RCC_GetClocksFreq+0x1c2>
 8001cdc:	4293      	cmp	r3, r2
 8001cde:	d104      	bne.n	8001cea <RCC_GetClocksFreq+0x1c2>
 8001ce0:	42a5      	cmp	r5, r4
 8001ce2:	d102      	bne.n	8001cea <RCC_GetClocksFreq+0x1c2>
 8001ce4:	005a      	lsls	r2, r3, #1
 8001ce6:	6582      	str	r2, [r0, #88]	; 0x58
 8001ce8:	e000      	b.n	8001cec <RCC_GetClocksFreq+0x1c4>
 8001cea:	6581      	str	r1, [r0, #88]	; 0x58
 8001cec:	4a34      	ldr	r2, [pc, #208]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001cee:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8001cf0:	07a4      	lsls	r4, r4, #30
 8001cf2:	d014      	beq.n	8001d1e <RCC_GetClocksFreq+0x1f6>
 8001cf4:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001cf6:	f001 0103 	and.w	r1, r1, #3
 8001cfa:	2901      	cmp	r1, #1
 8001cfc:	d101      	bne.n	8001d02 <RCC_GetClocksFreq+0x1da>
 8001cfe:	6383      	str	r3, [r0, #56]	; 0x38
 8001d00:	e00e      	b.n	8001d20 <RCC_GetClocksFreq+0x1f8>
 8001d02:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001d04:	f001 0103 	and.w	r1, r1, #3
 8001d08:	2902      	cmp	r1, #2
 8001d0a:	d102      	bne.n	8001d12 <RCC_GetClocksFreq+0x1ea>
 8001d0c:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001d10:	e005      	b.n	8001d1e <RCC_GetClocksFreq+0x1f6>
 8001d12:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001d14:	f001 0103 	and.w	r1, r1, #3
 8001d18:	2903      	cmp	r1, #3
 8001d1a:	d101      	bne.n	8001d20 <RCC_GetClocksFreq+0x1f8>
 8001d1c:	4929      	ldr	r1, [pc, #164]	; (8001dc4 <RCC_GetClocksFreq+0x29c>)
 8001d1e:	6381      	str	r1, [r0, #56]	; 0x38
 8001d20:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001d22:	4927      	ldr	r1, [pc, #156]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001d24:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 8001d28:	d101      	bne.n	8001d2e <RCC_GetClocksFreq+0x206>
 8001d2a:	63c6      	str	r6, [r0, #60]	; 0x3c
 8001d2c:	e018      	b.n	8001d60 <RCC_GetClocksFreq+0x238>
 8001d2e:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001d30:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001d34:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 8001d38:	d101      	bne.n	8001d3e <RCC_GetClocksFreq+0x216>
 8001d3a:	63c3      	str	r3, [r0, #60]	; 0x3c
 8001d3c:	e010      	b.n	8001d60 <RCC_GetClocksFreq+0x238>
 8001d3e:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001d40:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001d44:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 8001d48:	d102      	bne.n	8001d50 <RCC_GetClocksFreq+0x228>
 8001d4a:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001d4e:	e006      	b.n	8001d5e <RCC_GetClocksFreq+0x236>
 8001d50:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001d52:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001d56:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 8001d5a:	d101      	bne.n	8001d60 <RCC_GetClocksFreq+0x238>
 8001d5c:	4a19      	ldr	r2, [pc, #100]	; (8001dc4 <RCC_GetClocksFreq+0x29c>)
 8001d5e:	63c2      	str	r2, [r0, #60]	; 0x3c
 8001d60:	4a17      	ldr	r2, [pc, #92]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001d62:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001d64:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8001d68:	d101      	bne.n	8001d6e <RCC_GetClocksFreq+0x246>
 8001d6a:	6406      	str	r6, [r0, #64]	; 0x40
 8001d6c:	e018      	b.n	8001da0 <RCC_GetClocksFreq+0x278>
 8001d6e:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001d70:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001d74:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8001d78:	d101      	bne.n	8001d7e <RCC_GetClocksFreq+0x256>
 8001d7a:	6403      	str	r3, [r0, #64]	; 0x40
 8001d7c:	e010      	b.n	8001da0 <RCC_GetClocksFreq+0x278>
 8001d7e:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001d80:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001d84:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 8001d88:	d102      	bne.n	8001d90 <RCC_GetClocksFreq+0x268>
 8001d8a:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001d8e:	e006      	b.n	8001d9e <RCC_GetClocksFreq+0x276>
 8001d90:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001d92:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001d96:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 8001d9a:	d101      	bne.n	8001da0 <RCC_GetClocksFreq+0x278>
 8001d9c:	4909      	ldr	r1, [pc, #36]	; (8001dc4 <RCC_GetClocksFreq+0x29c>)
 8001d9e:	6401      	str	r1, [r0, #64]	; 0x40
 8001da0:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001da2:	4907      	ldr	r1, [pc, #28]	; (8001dc0 <RCC_GetClocksFreq+0x298>)
 8001da4:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 8001da8:	d101      	bne.n	8001dae <RCC_GetClocksFreq+0x286>
 8001daa:	6446      	str	r6, [r0, #68]	; 0x44
 8001dac:	e023      	b.n	8001df6 <RCC_GetClocksFreq+0x2ce>
 8001dae:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001db0:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001db4:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 8001db8:	d10c      	bne.n	8001dd4 <RCC_GetClocksFreq+0x2ac>
 8001dba:	6443      	str	r3, [r0, #68]	; 0x44
 8001dbc:	e01b      	b.n	8001df6 <RCC_GetClocksFreq+0x2ce>
 8001dbe:	bf00      	nop
 8001dc0:	40021000 	.word	0x40021000
 8001dc4:	007a1200 	.word	0x007a1200
 8001dc8:	003d0900 	.word	0x003d0900
 8001dcc:	20000020 	.word	0x20000020
 8001dd0:	20000000 	.word	0x20000000
 8001dd4:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001dd6:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001dda:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 8001dde:	d102      	bne.n	8001de6 <RCC_GetClocksFreq+0x2be>
 8001de0:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001de4:	e006      	b.n	8001df4 <RCC_GetClocksFreq+0x2cc>
 8001de6:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001de8:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001dec:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 8001df0:	d101      	bne.n	8001df6 <RCC_GetClocksFreq+0x2ce>
 8001df2:	4a11      	ldr	r2, [pc, #68]	; (8001e38 <RCC_GetClocksFreq+0x310>)
 8001df4:	6442      	str	r2, [r0, #68]	; 0x44
 8001df6:	4a11      	ldr	r2, [pc, #68]	; (8001e3c <RCC_GetClocksFreq+0x314>)
 8001df8:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001dfa:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 8001dfe:	d102      	bne.n	8001e06 <RCC_GetClocksFreq+0x2de>
 8001e00:	6486      	str	r6, [r0, #72]	; 0x48
 8001e02:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001e06:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001e08:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 8001e0c:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 8001e10:	d00f      	beq.n	8001e32 <RCC_GetClocksFreq+0x30a>
 8001e12:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001e14:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001e18:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 8001e1c:	d102      	bne.n	8001e24 <RCC_GetClocksFreq+0x2fc>
 8001e1e:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001e22:	e006      	b.n	8001e32 <RCC_GetClocksFreq+0x30a>
 8001e24:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001e26:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001e2a:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8001e2e:	d101      	bne.n	8001e34 <RCC_GetClocksFreq+0x30c>
 8001e30:	4b01      	ldr	r3, [pc, #4]	; (8001e38 <RCC_GetClocksFreq+0x310>)
 8001e32:	6483      	str	r3, [r0, #72]	; 0x48
 8001e34:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001e38:	007a1200 	.word	0x007a1200
 8001e3c:	40021000 	.word	0x40021000

08001e40 <RCC_AHBPeriphClockCmd>:
 8001e40:	bf00      	nop
 8001e42:	bf00      	nop
 8001e44:	4b04      	ldr	r3, [pc, #16]	; (8001e58 <RCC_AHBPeriphClockCmd+0x18>)
 8001e46:	695a      	ldr	r2, [r3, #20]
 8001e48:	b109      	cbz	r1, 8001e4e <RCC_AHBPeriphClockCmd+0xe>
 8001e4a:	4310      	orrs	r0, r2
 8001e4c:	e001      	b.n	8001e52 <RCC_AHBPeriphClockCmd+0x12>
 8001e4e:	ea22 0000 	bic.w	r0, r2, r0
 8001e52:	6158      	str	r0, [r3, #20]
 8001e54:	4770      	bx	lr
 8001e56:	bf00      	nop
 8001e58:	40021000 	.word	0x40021000

08001e5c <RCC_APB2PeriphClockCmd>:
 8001e5c:	bf00      	nop
 8001e5e:	bf00      	nop
 8001e60:	4b04      	ldr	r3, [pc, #16]	; (8001e74 <RCC_APB2PeriphClockCmd+0x18>)
 8001e62:	699a      	ldr	r2, [r3, #24]
 8001e64:	b109      	cbz	r1, 8001e6a <RCC_APB2PeriphClockCmd+0xe>
 8001e66:	4310      	orrs	r0, r2
 8001e68:	e001      	b.n	8001e6e <RCC_APB2PeriphClockCmd+0x12>
 8001e6a:	ea22 0000 	bic.w	r0, r2, r0
 8001e6e:	6198      	str	r0, [r3, #24]
 8001e70:	4770      	bx	lr
 8001e72:	bf00      	nop
 8001e74:	40021000 	.word	0x40021000

08001e78 <RCC_APB1PeriphClockCmd>:
 8001e78:	bf00      	nop
 8001e7a:	bf00      	nop
 8001e7c:	4b04      	ldr	r3, [pc, #16]	; (8001e90 <RCC_APB1PeriphClockCmd+0x18>)
 8001e7e:	69da      	ldr	r2, [r3, #28]
 8001e80:	b109      	cbz	r1, 8001e86 <RCC_APB1PeriphClockCmd+0xe>
 8001e82:	4310      	orrs	r0, r2
 8001e84:	e001      	b.n	8001e8a <RCC_APB1PeriphClockCmd+0x12>
 8001e86:	ea22 0000 	bic.w	r0, r2, r0
 8001e8a:	61d8      	str	r0, [r3, #28]
 8001e8c:	4770      	bx	lr
 8001e8e:	bf00      	nop
 8001e90:	40021000 	.word	0x40021000

08001e94 <TIM_TimeBaseInit>:
 8001e94:	bf00      	nop
 8001e96:	bf00      	nop
 8001e98:	bf00      	nop
 8001e9a:	4a24      	ldr	r2, [pc, #144]	; (8001f2c <TIM_TimeBaseInit+0x98>)
 8001e9c:	8803      	ldrh	r3, [r0, #0]
 8001e9e:	4290      	cmp	r0, r2
 8001ea0:	b29b      	uxth	r3, r3
 8001ea2:	d012      	beq.n	8001eca <TIM_TimeBaseInit+0x36>
 8001ea4:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8001ea8:	4290      	cmp	r0, r2
 8001eaa:	d00e      	beq.n	8001eca <TIM_TimeBaseInit+0x36>
 8001eac:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001eb0:	d00b      	beq.n	8001eca <TIM_TimeBaseInit+0x36>
 8001eb2:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 8001eb6:	4290      	cmp	r0, r2
 8001eb8:	d007      	beq.n	8001eca <TIM_TimeBaseInit+0x36>
 8001eba:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001ebe:	4290      	cmp	r0, r2
 8001ec0:	d003      	beq.n	8001eca <TIM_TimeBaseInit+0x36>
 8001ec2:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 8001ec6:	4290      	cmp	r0, r2
 8001ec8:	d103      	bne.n	8001ed2 <TIM_TimeBaseInit+0x3e>
 8001eca:	884a      	ldrh	r2, [r1, #2]
 8001ecc:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001ed0:	4313      	orrs	r3, r2
 8001ed2:	4a17      	ldr	r2, [pc, #92]	; (8001f30 <TIM_TimeBaseInit+0x9c>)
 8001ed4:	4290      	cmp	r0, r2
 8001ed6:	d008      	beq.n	8001eea <TIM_TimeBaseInit+0x56>
 8001ed8:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001edc:	4290      	cmp	r0, r2
 8001ede:	d004      	beq.n	8001eea <TIM_TimeBaseInit+0x56>
 8001ee0:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001ee4:	890a      	ldrh	r2, [r1, #8]
 8001ee6:	b29b      	uxth	r3, r3
 8001ee8:	4313      	orrs	r3, r2
 8001eea:	8003      	strh	r3, [r0, #0]
 8001eec:	684b      	ldr	r3, [r1, #4]
 8001eee:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001ef0:	880b      	ldrh	r3, [r1, #0]
 8001ef2:	8503      	strh	r3, [r0, #40]	; 0x28
 8001ef4:	4b0d      	ldr	r3, [pc, #52]	; (8001f2c <TIM_TimeBaseInit+0x98>)
 8001ef6:	4298      	cmp	r0, r3
 8001ef8:	d013      	beq.n	8001f22 <TIM_TimeBaseInit+0x8e>
 8001efa:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001efe:	4298      	cmp	r0, r3
 8001f00:	d00f      	beq.n	8001f22 <TIM_TimeBaseInit+0x8e>
 8001f02:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 8001f06:	4298      	cmp	r0, r3
 8001f08:	d00b      	beq.n	8001f22 <TIM_TimeBaseInit+0x8e>
 8001f0a:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001f0e:	4298      	cmp	r0, r3
 8001f10:	d007      	beq.n	8001f22 <TIM_TimeBaseInit+0x8e>
 8001f12:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001f16:	4298      	cmp	r0, r3
 8001f18:	d003      	beq.n	8001f22 <TIM_TimeBaseInit+0x8e>
 8001f1a:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001f1e:	4298      	cmp	r0, r3
 8001f20:	d101      	bne.n	8001f26 <TIM_TimeBaseInit+0x92>
 8001f22:	894b      	ldrh	r3, [r1, #10]
 8001f24:	8603      	strh	r3, [r0, #48]	; 0x30
 8001f26:	2301      	movs	r3, #1
 8001f28:	6143      	str	r3, [r0, #20]
 8001f2a:	4770      	bx	lr
 8001f2c:	40012c00 	.word	0x40012c00
 8001f30:	40001000 	.word	0x40001000

08001f34 <TIM_Cmd>:
 8001f34:	bf00      	nop
 8001f36:	bf00      	nop
 8001f38:	8803      	ldrh	r3, [r0, #0]
 8001f3a:	b119      	cbz	r1, 8001f44 <TIM_Cmd+0x10>
 8001f3c:	b29b      	uxth	r3, r3
 8001f3e:	f043 0301 	orr.w	r3, r3, #1
 8001f42:	e003      	b.n	8001f4c <TIM_Cmd+0x18>
 8001f44:	f023 0301 	bic.w	r3, r3, #1
 8001f48:	041b      	lsls	r3, r3, #16
 8001f4a:	0c1b      	lsrs	r3, r3, #16
 8001f4c:	8003      	strh	r3, [r0, #0]
 8001f4e:	4770      	bx	lr

08001f50 <TIM_ClearITPendingBit>:
 8001f50:	bf00      	nop
 8001f52:	43c9      	mvns	r1, r1
 8001f54:	b289      	uxth	r1, r1
 8001f56:	6101      	str	r1, [r0, #16]
 8001f58:	4770      	bx	lr
	...

08001f5c <timer_init>:
 8001f5c:	b530      	push	{r4, r5, lr}
 8001f5e:	2300      	movs	r3, #0
 8001f60:	b085      	sub	sp, #20
 8001f62:	491f      	ldr	r1, [pc, #124]	; (8001fe0 <timer_init+0x84>)
 8001f64:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001f68:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001f6c:	491d      	ldr	r1, [pc, #116]	; (8001fe4 <timer_init+0x88>)
 8001f6e:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001f72:	4a1d      	ldr	r2, [pc, #116]	; (8001fe8 <timer_init+0x8c>)
 8001f74:	2400      	movs	r4, #0
 8001f76:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8001f7a:	3301      	adds	r3, #1
 8001f7c:	2b04      	cmp	r3, #4
 8001f7e:	4625      	mov	r5, r4
 8001f80:	d1ef      	bne.n	8001f62 <timer_init+0x6>
 8001f82:	4b1a      	ldr	r3, [pc, #104]	; (8001fec <timer_init+0x90>)
 8001f84:	2002      	movs	r0, #2
 8001f86:	2101      	movs	r1, #1
 8001f88:	601c      	str	r4, [r3, #0]
 8001f8a:	f7ff ff75 	bl	8001e78 <RCC_APB1PeriphClockCmd>
 8001f8e:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001f92:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001f96:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001f9a:	4c15      	ldr	r4, [pc, #84]	; (8001ff0 <timer_init+0x94>)
 8001f9c:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001fa0:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001fa4:	4620      	mov	r0, r4
 8001fa6:	2331      	movs	r3, #49	; 0x31
 8001fa8:	a901      	add	r1, sp, #4
 8001faa:	9302      	str	r3, [sp, #8]
 8001fac:	f7ff ff72 	bl	8001e94 <TIM_TimeBaseInit>
 8001fb0:	4620      	mov	r0, r4
 8001fb2:	2101      	movs	r1, #1
 8001fb4:	f7ff ffbe 	bl	8001f34 <TIM_Cmd>
 8001fb8:	68e3      	ldr	r3, [r4, #12]
 8001fba:	f043 0301 	orr.w	r3, r3, #1
 8001fbe:	60e3      	str	r3, [r4, #12]
 8001fc0:	231d      	movs	r3, #29
 8001fc2:	f88d 3000 	strb.w	r3, [sp]
 8001fc6:	4668      	mov	r0, sp
 8001fc8:	2301      	movs	r3, #1
 8001fca:	f88d 5001 	strb.w	r5, [sp, #1]
 8001fce:	f88d 3002 	strb.w	r3, [sp, #2]
 8001fd2:	f88d 3003 	strb.w	r3, [sp, #3]
 8001fd6:	f7ff fb85 	bl	80016e4 <NVIC_Init>
 8001fda:	b005      	add	sp, #20
 8001fdc:	bd30      	pop	{r4, r5, pc}
 8001fde:	bf00      	nop
 8001fe0:	200009e8 	.word	0x200009e8
 8001fe4:	200009dc 	.word	0x200009dc
 8001fe8:	200009d4 	.word	0x200009d4
 8001fec:	200009e4 	.word	0x200009e4
 8001ff0:	40000400 	.word	0x40000400

08001ff4 <TIM3_IRQHandler>:
 8001ff4:	2300      	movs	r3, #0
 8001ff6:	4a10      	ldr	r2, [pc, #64]	; (8002038 <TIM3_IRQHandler+0x44>)
 8001ff8:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001ffc:	b289      	uxth	r1, r1
 8001ffe:	b129      	cbz	r1, 800200c <TIM3_IRQHandler+0x18>
 8002000:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8002004:	b289      	uxth	r1, r1
 8002006:	3901      	subs	r1, #1
 8002008:	b289      	uxth	r1, r1
 800200a:	e007      	b.n	800201c <TIM3_IRQHandler+0x28>
 800200c:	490b      	ldr	r1, [pc, #44]	; (800203c <TIM3_IRQHandler+0x48>)
 800200e:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8002012:	b289      	uxth	r1, r1
 8002014:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8002018:	4a09      	ldr	r2, [pc, #36]	; (8002040 <TIM3_IRQHandler+0x4c>)
 800201a:	2101      	movs	r1, #1
 800201c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8002020:	3301      	adds	r3, #1
 8002022:	2b04      	cmp	r3, #4
 8002024:	d1e7      	bne.n	8001ff6 <TIM3_IRQHandler+0x2>
 8002026:	4b07      	ldr	r3, [pc, #28]	; (8002044 <TIM3_IRQHandler+0x50>)
 8002028:	4807      	ldr	r0, [pc, #28]	; (8002048 <TIM3_IRQHandler+0x54>)
 800202a:	681a      	ldr	r2, [r3, #0]
 800202c:	2101      	movs	r1, #1
 800202e:	3201      	adds	r2, #1
 8002030:	601a      	str	r2, [r3, #0]
 8002032:	f7ff bf8d 	b.w	8001f50 <TIM_ClearITPendingBit>
 8002036:	bf00      	nop
 8002038:	200009e8 	.word	0x200009e8
 800203c:	200009dc 	.word	0x200009dc
 8002040:	200009d4 	.word	0x200009d4
 8002044:	200009e4 	.word	0x200009e4
 8002048:	40000400 	.word	0x40000400

0800204c <timer_get_time>:
 800204c:	b082      	sub	sp, #8
 800204e:	b672      	cpsid	i
 8002050:	4b04      	ldr	r3, [pc, #16]	; (8002064 <timer_get_time+0x18>)
 8002052:	681b      	ldr	r3, [r3, #0]
 8002054:	9301      	str	r3, [sp, #4]
 8002056:	b662      	cpsie	i
 8002058:	9801      	ldr	r0, [sp, #4]
 800205a:	230a      	movs	r3, #10
 800205c:	fbb0 f0f3 	udiv	r0, r0, r3
 8002060:	b002      	add	sp, #8
 8002062:	4770      	bx	lr
 8002064:	200009e4 	.word	0x200009e4

08002068 <timer_delay_ms>:
 8002068:	b513      	push	{r0, r1, r4, lr}
 800206a:	4604      	mov	r4, r0
 800206c:	f7ff ffee 	bl	800204c <timer_get_time>
 8002070:	4420      	add	r0, r4
 8002072:	9001      	str	r0, [sp, #4]
 8002074:	9c01      	ldr	r4, [sp, #4]
 8002076:	f7ff ffe9 	bl	800204c <timer_get_time>
 800207a:	4284      	cmp	r4, r0
 800207c:	d902      	bls.n	8002084 <timer_delay_ms+0x1c>
 800207e:	f7ff fccd 	bl	8001a1c <sleep>
 8002082:	e7f7      	b.n	8002074 <timer_delay_ms+0xc>
 8002084:	b002      	add	sp, #8
 8002086:	bd10      	pop	{r4, pc}

08002088 <event_timer_set_period>:
 8002088:	b672      	cpsid	i
 800208a:	230a      	movs	r3, #10
 800208c:	4359      	muls	r1, r3
 800208e:	4b06      	ldr	r3, [pc, #24]	; (80020a8 <event_timer_set_period+0x20>)
 8002090:	b289      	uxth	r1, r1
 8002092:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8002096:	4b05      	ldr	r3, [pc, #20]	; (80020ac <event_timer_set_period+0x24>)
 8002098:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 800209c:	4b04      	ldr	r3, [pc, #16]	; (80020b0 <event_timer_set_period+0x28>)
 800209e:	2200      	movs	r2, #0
 80020a0:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 80020a4:	b662      	cpsie	i
 80020a6:	4770      	bx	lr
 80020a8:	200009e8 	.word	0x200009e8
 80020ac:	200009dc 	.word	0x200009dc
 80020b0:	200009d4 	.word	0x200009d4

080020b4 <event_timer_wait>:
 80020b4:	b510      	push	{r4, lr}
 80020b6:	4604      	mov	r4, r0
 80020b8:	4b06      	ldr	r3, [pc, #24]	; (80020d4 <event_timer_wait+0x20>)
 80020ba:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 80020be:	b292      	uxth	r2, r2
 80020c0:	b912      	cbnz	r2, 80020c8 <event_timer_wait+0x14>
 80020c2:	f7ff fcab 	bl	8001a1c <sleep>
 80020c6:	e7f7      	b.n	80020b8 <event_timer_wait+0x4>
 80020c8:	b672      	cpsid	i
 80020ca:	2200      	movs	r2, #0
 80020cc:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 80020d0:	b662      	cpsie	i
 80020d2:	bd10      	pop	{r4, pc}
 80020d4:	200009d4 	.word	0x200009d4

080020d8 <GPIO_Init>:
 80020d8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80020da:	bf00      	nop
 80020dc:	bf00      	nop
 80020de:	bf00      	nop
 80020e0:	bf00      	nop
 80020e2:	2300      	movs	r3, #0
 80020e4:	680e      	ldr	r6, [r1, #0]
 80020e6:	461a      	mov	r2, r3
 80020e8:	2501      	movs	r5, #1
 80020ea:	4095      	lsls	r5, r2
 80020ec:	ea05 0406 	and.w	r4, r5, r6
 80020f0:	42ac      	cmp	r4, r5
 80020f2:	d131      	bne.n	8002158 <GPIO_Init+0x80>
 80020f4:	790d      	ldrb	r5, [r1, #4]
 80020f6:	1e6f      	subs	r7, r5, #1
 80020f8:	b2ff      	uxtb	r7, r7
 80020fa:	2f01      	cmp	r7, #1
 80020fc:	d81c      	bhi.n	8002138 <GPIO_Init+0x60>
 80020fe:	bf00      	nop
 8002100:	f04f 0c03 	mov.w	ip, #3
 8002104:	6887      	ldr	r7, [r0, #8]
 8002106:	fa0c fc03 	lsl.w	ip, ip, r3
 800210a:	ea27 070c 	bic.w	r7, r7, ip
 800210e:	6087      	str	r7, [r0, #8]
 8002110:	f891 c005 	ldrb.w	ip, [r1, #5]
 8002114:	6887      	ldr	r7, [r0, #8]
 8002116:	fa0c fc03 	lsl.w	ip, ip, r3
 800211a:	ea4c 0707 	orr.w	r7, ip, r7
 800211e:	6087      	str	r7, [r0, #8]
 8002120:	bf00      	nop
 8002122:	8887      	ldrh	r7, [r0, #4]
 8002124:	b2bf      	uxth	r7, r7
 8002126:	ea27 0404 	bic.w	r4, r7, r4
 800212a:	8084      	strh	r4, [r0, #4]
 800212c:	798c      	ldrb	r4, [r1, #6]
 800212e:	8887      	ldrh	r7, [r0, #4]
 8002130:	4094      	lsls	r4, r2
 8002132:	433c      	orrs	r4, r7
 8002134:	b2a4      	uxth	r4, r4
 8002136:	8084      	strh	r4, [r0, #4]
 8002138:	2403      	movs	r4, #3
 800213a:	6807      	ldr	r7, [r0, #0]
 800213c:	409c      	lsls	r4, r3
 800213e:	43e4      	mvns	r4, r4
 8002140:	4027      	ands	r7, r4
 8002142:	6007      	str	r7, [r0, #0]
 8002144:	6807      	ldr	r7, [r0, #0]
 8002146:	409d      	lsls	r5, r3
 8002148:	433d      	orrs	r5, r7
 800214a:	6005      	str	r5, [r0, #0]
 800214c:	68c5      	ldr	r5, [r0, #12]
 800214e:	402c      	ands	r4, r5
 8002150:	79cd      	ldrb	r5, [r1, #7]
 8002152:	409d      	lsls	r5, r3
 8002154:	432c      	orrs	r4, r5
 8002156:	60c4      	str	r4, [r0, #12]
 8002158:	3201      	adds	r2, #1
 800215a:	2a10      	cmp	r2, #16
 800215c:	f103 0302 	add.w	r3, r3, #2
 8002160:	d1c2      	bne.n	80020e8 <GPIO_Init+0x10>
 8002162:	bdf0      	pop	{r4, r5, r6, r7, pc}

08002164 <GPIO_SetBits>:
 8002164:	bf00      	nop
 8002166:	bf00      	nop
 8002168:	6181      	str	r1, [r0, #24]
 800216a:	4770      	bx	lr

0800216c <GPIO_ResetBits>:
 800216c:	bf00      	nop
 800216e:	bf00      	nop
 8002170:	8501      	strh	r1, [r0, #40]	; 0x28
 8002172:	4770      	bx	lr

08002174 <GPIO_PinAFConfig>:
 8002174:	b510      	push	{r4, lr}
 8002176:	bf00      	nop
 8002178:	bf00      	nop
 800217a:	bf00      	nop
 800217c:	f001 0307 	and.w	r3, r1, #7
 8002180:	08c9      	lsrs	r1, r1, #3
 8002182:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8002186:	009b      	lsls	r3, r3, #2
 8002188:	6a04      	ldr	r4, [r0, #32]
 800218a:	210f      	movs	r1, #15
 800218c:	4099      	lsls	r1, r3
 800218e:	ea24 0101 	bic.w	r1, r4, r1
 8002192:	6201      	str	r1, [r0, #32]
 8002194:	6a01      	ldr	r1, [r0, #32]
 8002196:	fa02 f303 	lsl.w	r3, r2, r3
 800219a:	430b      	orrs	r3, r1
 800219c:	6203      	str	r3, [r0, #32]
 800219e:	bd10      	pop	{r4, pc}

080021a0 <led_on>:
 80021a0:	0401      	lsls	r1, r0, #16
 80021a2:	d503      	bpl.n	80021ac <led_on+0xc>
 80021a4:	4b08      	ldr	r3, [pc, #32]	; (80021c8 <led_on+0x28>)
 80021a6:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80021aa:	619a      	str	r2, [r3, #24]
 80021ac:	0702      	lsls	r2, r0, #28
 80021ae:	d503      	bpl.n	80021b8 <led_on+0x18>
 80021b0:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80021b4:	2208      	movs	r2, #8
 80021b6:	851a      	strh	r2, [r3, #40]	; 0x28
 80021b8:	07c3      	lsls	r3, r0, #31
 80021ba:	d503      	bpl.n	80021c4 <led_on+0x24>
 80021bc:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80021c0:	2201      	movs	r2, #1
 80021c2:	619a      	str	r2, [r3, #24]
 80021c4:	4770      	bx	lr
 80021c6:	bf00      	nop
 80021c8:	48000400 	.word	0x48000400

080021cc <led_off>:
 80021cc:	0402      	lsls	r2, r0, #16
 80021ce:	d503      	bpl.n	80021d8 <led_off+0xc>
 80021d0:	4b08      	ldr	r3, [pc, #32]	; (80021f4 <led_off+0x28>)
 80021d2:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80021d6:	851a      	strh	r2, [r3, #40]	; 0x28
 80021d8:	0703      	lsls	r3, r0, #28
 80021da:	d503      	bpl.n	80021e4 <led_off+0x18>
 80021dc:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80021e0:	2208      	movs	r2, #8
 80021e2:	619a      	str	r2, [r3, #24]
 80021e4:	07c0      	lsls	r0, r0, #31
 80021e6:	d503      	bpl.n	80021f0 <led_off+0x24>
 80021e8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80021ec:	2201      	movs	r2, #1
 80021ee:	851a      	strh	r2, [r3, #40]	; 0x28
 80021f0:	4770      	bx	lr
 80021f2:	bf00      	nop
 80021f4:	48000400 	.word	0x48000400

080021f8 <gpio_init>:
 80021f8:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 80021fc:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8002200:	2101      	movs	r1, #1
 8002202:	f7ff fe1d 	bl	8001e40 <RCC_AHBPeriphClockCmd>
 8002206:	f8df 90a8 	ldr.w	r9, [pc, #168]	; 80022b0 <gpio_init+0xb8>
 800220a:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 800220e:	2101      	movs	r1, #1
 8002210:	f7ff fe16 	bl	8001e40 <RCC_AHBPeriphClockCmd>
 8002214:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 8002218:	2101      	movs	r1, #1
 800221a:	f7ff fe11 	bl	8001e40 <RCC_AHBPeriphClockCmd>
 800221e:	2400      	movs	r4, #0
 8002220:	2501      	movs	r5, #1
 8002222:	2603      	movs	r6, #3
 8002224:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 8002228:	4648      	mov	r0, r9
 800222a:	4669      	mov	r1, sp
 800222c:	2708      	movs	r7, #8
 800222e:	f8cd 8000 	str.w	r8, [sp]
 8002232:	f88d 5004 	strb.w	r5, [sp, #4]
 8002236:	f88d 4006 	strb.w	r4, [sp, #6]
 800223a:	f88d 6005 	strb.w	r6, [sp, #5]
 800223e:	f88d 4007 	strb.w	r4, [sp, #7]
 8002242:	f7ff ff49 	bl	80020d8 <GPIO_Init>
 8002246:	4669      	mov	r1, sp
 8002248:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800224c:	9700      	str	r7, [sp, #0]
 800224e:	f88d 5004 	strb.w	r5, [sp, #4]
 8002252:	f88d 4006 	strb.w	r4, [sp, #6]
 8002256:	f88d 6005 	strb.w	r6, [sp, #5]
 800225a:	f88d 4007 	strb.w	r4, [sp, #7]
 800225e:	f7ff ff3b 	bl	80020d8 <GPIO_Init>
 8002262:	4669      	mov	r1, sp
 8002264:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8002268:	9500      	str	r5, [sp, #0]
 800226a:	f88d 5004 	strb.w	r5, [sp, #4]
 800226e:	f88d 4006 	strb.w	r4, [sp, #6]
 8002272:	f88d 6005 	strb.w	r6, [sp, #5]
 8002276:	f88d 4007 	strb.w	r4, [sp, #7]
 800227a:	f7ff ff2d 	bl	80020d8 <GPIO_Init>
 800227e:	f44f 7300 	mov.w	r3, #512	; 0x200
 8002282:	4669      	mov	r1, sp
 8002284:	4648      	mov	r0, r9
 8002286:	9300      	str	r3, [sp, #0]
 8002288:	f88d 4004 	strb.w	r4, [sp, #4]
 800228c:	f88d 6005 	strb.w	r6, [sp, #5]
 8002290:	f88d 4007 	strb.w	r4, [sp, #7]
 8002294:	f7ff ff20 	bl	80020d8 <GPIO_Init>
 8002298:	4640      	mov	r0, r8
 800229a:	f7ff ff81 	bl	80021a0 <led_on>
 800229e:	4638      	mov	r0, r7
 80022a0:	f7ff ff94 	bl	80021cc <led_off>
 80022a4:	4628      	mov	r0, r5
 80022a6:	f7ff ff91 	bl	80021cc <led_off>
 80022aa:	b003      	add	sp, #12
 80022ac:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80022b0:	48000400 	.word	0x48000400

080022b4 <get_key>:
 80022b4:	4b02      	ldr	r3, [pc, #8]	; (80022c0 <get_key+0xc>)
 80022b6:	8a18      	ldrh	r0, [r3, #16]
 80022b8:	43c0      	mvns	r0, r0
 80022ba:	f400 7000 	and.w	r0, r0, #512	; 0x200
 80022be:	4770      	bx	lr
 80022c0:	48000400 	.word	0x48000400

080022c4 <_init>:
 80022c4:	e1a0c00d 	mov	ip, sp
 80022c8:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80022cc:	e24cb004 	sub	fp, ip, #4
 80022d0:	e24bd028 	sub	sp, fp, #40	; 0x28
 80022d4:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80022d8:	e12fff1e 	bx	lr

080022dc <_fini>:
 80022dc:	e1a0c00d 	mov	ip, sp
 80022e0:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80022e4:	e24cb004 	sub	fp, ip, #4
 80022e8:	e24bd028 	sub	sp, fp, #40	; 0x28
 80022ec:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80022f0:	e12fff1e 	bx	lr
 80022f4:	69647473 	.word	0x69647473
 80022f8:	6e69206f 	.word	0x6e69206f
 80022fc:	64207469 	.word	0x64207469
 8002300:	0a656e6f 	.word	0x0a656e6f
 8002304:	00          	.byte	0x00
 8002305:	41          	.byte	0x41
 8002306:	2b54      	.short	0x2b54
 8002308:	4d504943 	.word	0x4d504943
 800230c:	313d5855 	.word	0x313d5855
 8002310:	41000a0d 	.word	0x41000a0d
 8002314:	49432b54 	.word	0x49432b54
 8002318:	58554d50 	.word	0x58554d50
 800231c:	0a0d303d 	.word	0x0a0d303d
 8002320:	2b544100 	.word	0x2b544100
 8002324:	4f4d5743 	.word	0x4f4d5743
 8002328:	313d4544 	.word	0x313d4544
 800232c:	41000a0d 	.word	0x41000a0d
 8002330:	57432b54 	.word	0x57432b54
 8002334:	3d50414a 	.word	0x3d50414a
 8002338:	69640022 	.word	0x69640022
 800233c:	6e6f6373 	.word	0x6e6f6373
 8002340:	7463656e 	.word	0x7463656e
 8002344:	76006465 	.word	0x76006465
 8002348:	68797265 	.word	0x68797265
 800234c:	00647261 	.word	0x00647261
 8002350:	000a0d22 	.word	0x000a0d22
 8002354:	432b5441 	.word	0x432b5441
 8002358:	45535049 	.word	0x45535049
 800235c:	52455652 	.word	0x52455652
 8002360:	382c313d 	.word	0x382c313d
 8002364:	000a0d30 	.word	0x000a0d30
 8002368:	432b5441 	.word	0x432b5441
 800236c:	54535049 	.word	0x54535049
 8002370:	3d545241 	.word	0x3d545241
 8002374:	50435422 	.word	0x50435422
 8002378:	00222c22 	.word	0x00222c22
 800237c:	41002c22 	.word	0x41002c22
 8002380:	49432b54 	.word	0x49432b54
 8002384:	4e455350 	.word	0x4e455350
 8002388:	3e003d44 	.word	0x3e003d44
 800238c:	2b544100 	.word	0x2b544100
 8002390:	43504943 	.word	0x43504943
 8002394:	45534f4c 	.word	0x45534f4c
 8002398:	53000a0d 	.word	0x53000a0d
 800239c:	20444e45 	.word	0x20444e45
 80023a0:	2b004b4f 	.word	0x2b004b4f
 80023a4:	2c445049 	.word	0x2c445049
 80023a8:	00          	.byte	0x00
 80023a9:	0a          	.byte	0x0a
 80023aa:	6577      	.short	0x6577
 80023ac:	6d6f636c 	.word	0x6d6f636c
 80023b0:	6f742065 	.word	0x6f742065
 80023b4:	7a755320 	.word	0x7a755320
 80023b8:	4f616875 	.word	0x4f616875
 80023bc:	5f5e2053 	.word	0x5f5e2053
 80023c0:	2e32205e 	.word	0x2e32205e
 80023c4:	0a362e30 	.word	0x0a362e30
 80023c8:	4c495542 	.word	0x4c495542
 80023cc:	65462044 	.word	0x65462044
 80023d0:	36322062 	.word	0x36322062
 80023d4:	31303220 	.word	0x31303220
 80023d8:	34312036 	.word	0x34312036
 80023dc:	3a32313a 	.word	0x3a32313a
 80023e0:	000a3130 	.word	0x000a3130
 80023e4:	2e323931 	.word	0x2e323931
 80023e8:	2e383631 	.word	0x2e383631
 80023ec:	00322e32 	.word	0x00322e32
 80023f0:	38707365 	.word	0x38707365
 80023f4:	20363632 	.word	0x20363632
 80023f8:	7373656d 	.word	0x7373656d
 80023fc:	00656761 	.word	0x00656761
 8002400:	6f727265 	.word	0x6f727265
 8002404:	6f632072 	.word	0x6f632072
 8002408:	25206564 	.word	0x25206564
 800240c:	75253a75 	.word	0x75253a75
 8002410:	0000000a 	.word	0x0000000a

08002414 <__EH_FRAME_BEGIN__>:
 8002414:	00000000                                ....
