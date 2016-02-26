
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <main>:
 8000188:	b508      	push	{r3, lr}
 800018a:	f001 fad7 	bl	800173c <lib_low_level_init>
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
 80001ac:	080010b1 	.word	0x080010b1

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
 80001d2:	f001 fc5d 	bl	8001a90 <sleep>
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
 80002aa:	f001 fbdf 	bl	8001a6c <sys_tick_init>
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
 8000402:	f001 f825 	bl	8001450 <uart_write>
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
 80005d8:	08002368 	.word	0x08002368

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
 8000676:	f001 f98d 	bl	8001994 <i2c_write_reg>
 800067a:	203c      	movs	r0, #60	; 0x3c
 800067c:	2120      	movs	r1, #32
 800067e:	2200      	movs	r2, #0
 8000680:	f001 f988 	bl	8001994 <i2c_write_reg>
 8000684:	203c      	movs	r0, #60	; 0x3c
 8000686:	2124      	movs	r1, #36	; 0x24
 8000688:	2200      	movs	r2, #0
 800068a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800068e:	f001 b981 	b.w	8001994 <i2c_write_reg>
	...

08000694 <lsm9ds0_read>:
 8000694:	b538      	push	{r3, r4, r5, lr}
 8000696:	2128      	movs	r1, #40	; 0x28
 8000698:	20d4      	movs	r0, #212	; 0xd4
 800069a:	f001 f98e 	bl	80019ba <i2c_read_reg>
 800069e:	2129      	movs	r1, #41	; 0x29
 80006a0:	4604      	mov	r4, r0
 80006a2:	20d4      	movs	r0, #212	; 0xd4
 80006a4:	f001 f989 	bl	80019ba <i2c_read_reg>
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
 80006c4:	f001 f979 	bl	80019ba <i2c_read_reg>
 80006c8:	212b      	movs	r1, #43	; 0x2b
 80006ca:	4605      	mov	r5, r0
 80006cc:	20d4      	movs	r0, #212	; 0xd4
 80006ce:	f001 f974 	bl	80019ba <i2c_read_reg>
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
 80006ec:	f001 f965 	bl	80019ba <i2c_read_reg>
 80006f0:	212d      	movs	r1, #45	; 0x2d
 80006f2:	4605      	mov	r5, r0
 80006f4:	20d4      	movs	r0, #212	; 0xd4
 80006f6:	f001 f960 	bl	80019ba <i2c_read_reg>
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
 8000714:	f001 f951 	bl	80019ba <i2c_read_reg>
 8000718:	2109      	movs	r1, #9
 800071a:	4605      	mov	r5, r0
 800071c:	203c      	movs	r0, #60	; 0x3c
 800071e:	f001 f94c 	bl	80019ba <i2c_read_reg>
 8000722:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000726:	b285      	uxth	r5, r0
 8000728:	210a      	movs	r1, #10
 800072a:	203c      	movs	r0, #60	; 0x3c
 800072c:	80e5      	strh	r5, [r4, #6]
 800072e:	f001 f944 	bl	80019ba <i2c_read_reg>
 8000732:	210b      	movs	r1, #11
 8000734:	4605      	mov	r5, r0
 8000736:	203c      	movs	r0, #60	; 0x3c
 8000738:	f001 f93f 	bl	80019ba <i2c_read_reg>
 800073c:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000740:	b285      	uxth	r5, r0
 8000742:	210c      	movs	r1, #12
 8000744:	203c      	movs	r0, #60	; 0x3c
 8000746:	8125      	strh	r5, [r4, #8]
 8000748:	f001 f937 	bl	80019ba <i2c_read_reg>
 800074c:	210d      	movs	r1, #13
 800074e:	4605      	mov	r5, r0
 8000750:	203c      	movs	r0, #60	; 0x3c
 8000752:	f001 f932 	bl	80019ba <i2c_read_reg>
 8000756:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800075a:	b285      	uxth	r5, r0
 800075c:	2128      	movs	r1, #40	; 0x28
 800075e:	203c      	movs	r0, #60	; 0x3c
 8000760:	8165      	strh	r5, [r4, #10]
 8000762:	f001 f92a 	bl	80019ba <i2c_read_reg>
 8000766:	2129      	movs	r1, #41	; 0x29
 8000768:	4605      	mov	r5, r0
 800076a:	203c      	movs	r0, #60	; 0x3c
 800076c:	f001 f925 	bl	80019ba <i2c_read_reg>
 8000770:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000774:	b285      	uxth	r5, r0
 8000776:	212a      	movs	r1, #42	; 0x2a
 8000778:	203c      	movs	r0, #60	; 0x3c
 800077a:	8025      	strh	r5, [r4, #0]
 800077c:	f001 f91d 	bl	80019ba <i2c_read_reg>
 8000780:	212b      	movs	r1, #43	; 0x2b
 8000782:	4605      	mov	r5, r0
 8000784:	203c      	movs	r0, #60	; 0x3c
 8000786:	f001 f918 	bl	80019ba <i2c_read_reg>
 800078a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800078e:	b285      	uxth	r5, r0
 8000790:	212c      	movs	r1, #44	; 0x2c
 8000792:	203c      	movs	r0, #60	; 0x3c
 8000794:	8065      	strh	r5, [r4, #2]
 8000796:	f001 f910 	bl	80019ba <i2c_read_reg>
 800079a:	212d      	movs	r1, #45	; 0x2d
 800079c:	4605      	mov	r5, r0
 800079e:	203c      	movs	r0, #60	; 0x3c
 80007a0:	f001 f90b 	bl	80019ba <i2c_read_reg>
 80007a4:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007a8:	b285      	uxth	r5, r0
 80007aa:	2105      	movs	r1, #5
 80007ac:	203c      	movs	r0, #60	; 0x3c
 80007ae:	80a5      	strh	r5, [r4, #4]
 80007b0:	f001 f903 	bl	80019ba <i2c_read_reg>
 80007b4:	2106      	movs	r1, #6
 80007b6:	4605      	mov	r5, r0
 80007b8:	203c      	movs	r0, #60	; 0x3c
 80007ba:	f001 f8fe 	bl	80019ba <i2c_read_reg>
 80007be:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007c2:	b285      	uxth	r5, r0
 80007c4:	83e5      	strh	r5, [r4, #30]
 80007c6:	bd38      	pop	{r3, r4, r5, pc}
 80007c8:	20000234 	.word	0x20000234

080007cc <lsm9ds0_calibrate>:
 80007cc:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 80007d0:	2500      	movs	r5, #0
 80007d2:	4681      	mov	r9, r0
 80007d4:	462f      	mov	r7, r5
 80007d6:	46a8      	mov	r8, r5
 80007d8:	462c      	mov	r4, r5
 80007da:	454c      	cmp	r4, r9
 80007dc:	4e10      	ldr	r6, [pc, #64]	; (8000820 <lsm9ds0_calibrate+0x54>)
 80007de:	d00f      	beq.n	8000800 <lsm9ds0_calibrate+0x34>
 80007e0:	f7ff ff58 	bl	8000694 <lsm9ds0_read>
 80007e4:	89b3      	ldrh	r3, [r6, #12]
 80007e6:	fa08 f883 	sxtah	r8, r8, r3
 80007ea:	89f3      	ldrh	r3, [r6, #14]
 80007ec:	fa07 f783 	sxtah	r7, r7, r3
 80007f0:	8a33      	ldrh	r3, [r6, #16]
 80007f2:	200a      	movs	r0, #10
 80007f4:	fa05 f583 	sxtah	r5, r5, r3
 80007f8:	3401      	adds	r4, #1
 80007fa:	f001 fc6f 	bl	80020dc <timer_delay_ms>
 80007fe:	e7ec      	b.n	80007da <lsm9ds0_calibrate+0xe>
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
 8000824:	4b29      	ldr	r3, [pc, #164]	; (80008cc <lsm9ds0_init+0xa8>)
 8000826:	b570      	push	{r4, r5, r6, lr}
 8000828:	210f      	movs	r1, #15
 800082a:	2400      	movs	r4, #0
 800082c:	4606      	mov	r6, r0
 800082e:	20d4      	movs	r0, #212	; 0xd4
 8000830:	801c      	strh	r4, [r3, #0]
 8000832:	805c      	strh	r4, [r3, #2]
 8000834:	809c      	strh	r4, [r3, #4]
 8000836:	80dc      	strh	r4, [r3, #6]
 8000838:	811c      	strh	r4, [r3, #8]
 800083a:	815c      	strh	r4, [r3, #10]
 800083c:	819c      	strh	r4, [r3, #12]
 800083e:	81dc      	strh	r4, [r3, #14]
 8000840:	821c      	strh	r4, [r3, #16]
 8000842:	831c      	strh	r4, [r3, #24]
 8000844:	835c      	strh	r4, [r3, #26]
 8000846:	839c      	strh	r4, [r3, #28]
 8000848:	83dc      	strh	r4, [r3, #30]
 800084a:	f001 f8b6 	bl	80019ba <i2c_read_reg>
 800084e:	28d4      	cmp	r0, #212	; 0xd4
 8000850:	4605      	mov	r5, r0
 8000852:	d137      	bne.n	80008c4 <lsm9ds0_init+0xa0>
 8000854:	203c      	movs	r0, #60	; 0x3c
 8000856:	210f      	movs	r1, #15
 8000858:	f001 f8af 	bl	80019ba <i2c_read_reg>
 800085c:	2849      	cmp	r0, #73	; 0x49
 800085e:	d133      	bne.n	80008c8 <lsm9ds0_init+0xa4>
 8000860:	4628      	mov	r0, r5
 8000862:	2120      	movs	r1, #32
 8000864:	22ff      	movs	r2, #255	; 0xff
 8000866:	f001 f895 	bl	8001994 <i2c_write_reg>
 800086a:	4628      	mov	r0, r5
 800086c:	2123      	movs	r1, #35	; 0x23
 800086e:	2218      	movs	r2, #24
 8000870:	f001 f890 	bl	8001994 <i2c_write_reg>
 8000874:	203c      	movs	r0, #60	; 0x3c
 8000876:	211f      	movs	r1, #31
 8000878:	4622      	mov	r2, r4
 800087a:	f001 f88b 	bl	8001994 <i2c_write_reg>
 800087e:	203c      	movs	r0, #60	; 0x3c
 8000880:	2120      	movs	r1, #32
 8000882:	2267      	movs	r2, #103	; 0x67
 8000884:	f001 f886 	bl	8001994 <i2c_write_reg>
 8000888:	203c      	movs	r0, #60	; 0x3c
 800088a:	2121      	movs	r1, #33	; 0x21
 800088c:	4622      	mov	r2, r4
 800088e:	f001 f881 	bl	8001994 <i2c_write_reg>
 8000892:	203c      	movs	r0, #60	; 0x3c
 8000894:	2124      	movs	r1, #36	; 0x24
 8000896:	22f4      	movs	r2, #244	; 0xf4
 8000898:	f001 f87c 	bl	8001994 <i2c_write_reg>
 800089c:	203c      	movs	r0, #60	; 0x3c
 800089e:	2125      	movs	r1, #37	; 0x25
 80008a0:	4622      	mov	r2, r4
 80008a2:	f001 f877 	bl	8001994 <i2c_write_reg>
 80008a6:	203c      	movs	r0, #60	; 0x3c
 80008a8:	2126      	movs	r1, #38	; 0x26
 80008aa:	2280      	movs	r2, #128	; 0x80
 80008ac:	f001 f872 	bl	8001994 <i2c_write_reg>
 80008b0:	f7ff fef0 	bl	8000694 <lsm9ds0_read>
 80008b4:	b116      	cbz	r6, 80008bc <lsm9ds0_init+0x98>
 80008b6:	2064      	movs	r0, #100	; 0x64
 80008b8:	f7ff ff88 	bl	80007cc <lsm9ds0_calibrate>
 80008bc:	f7ff feea 	bl	8000694 <lsm9ds0_read>
 80008c0:	2000      	movs	r0, #0
 80008c2:	bd70      	pop	{r4, r5, r6, pc}
 80008c4:	2001      	movs	r0, #1
 80008c6:	bd70      	pop	{r4, r5, r6, pc}
 80008c8:	2002      	movs	r0, #2
 80008ca:	bd70      	pop	{r4, r5, r6, pc}
 80008cc:	20000234 	.word	0x20000234

080008d0 <rgb_i2c_delay>:
 80008d0:	bf00      	nop
 80008d2:	4770      	bx	lr

080008d4 <RGBSetLowSDA>:
 80008d4:	b513      	push	{r0, r1, r4, lr}
 80008d6:	2301      	movs	r3, #1
 80008d8:	2203      	movs	r2, #3
 80008da:	24f0      	movs	r4, #240	; 0xf0
 80008dc:	f88d 3004 	strb.w	r3, [sp, #4]
 80008e0:	f88d 3006 	strb.w	r3, [sp, #6]
 80008e4:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80008e8:	2300      	movs	r3, #0
 80008ea:	4669      	mov	r1, sp
 80008ec:	f88d 2005 	strb.w	r2, [sp, #5]
 80008f0:	f88d 3007 	strb.w	r3, [sp, #7]
 80008f4:	9400      	str	r4, [sp, #0]
 80008f6:	f001 fc29 	bl	800214c <GPIO_Init>
 80008fa:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80008fe:	851c      	strh	r4, [r3, #40]	; 0x28
 8000900:	f7ff ffe6 	bl	80008d0 <rgb_i2c_delay>
 8000904:	b002      	add	sp, #8
 8000906:	bd10      	pop	{r4, pc}

08000908 <RGBSetHighSDA>:
 8000908:	b513      	push	{r0, r1, r4, lr}
 800090a:	2300      	movs	r3, #0
 800090c:	2203      	movs	r2, #3
 800090e:	24f0      	movs	r4, #240	; 0xf0
 8000910:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000914:	4669      	mov	r1, sp
 8000916:	f88d 3004 	strb.w	r3, [sp, #4]
 800091a:	f88d 2005 	strb.w	r2, [sp, #5]
 800091e:	f88d 3007 	strb.w	r3, [sp, #7]
 8000922:	9400      	str	r4, [sp, #0]
 8000924:	f001 fc12 	bl	800214c <GPIO_Init>
 8000928:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800092c:	619c      	str	r4, [r3, #24]
 800092e:	f7ff ffcf 	bl	80008d0 <rgb_i2c_delay>
 8000932:	b002      	add	sp, #8
 8000934:	bd10      	pop	{r4, pc}
	...

08000938 <RGBSetLowSCL>:
 8000938:	4b02      	ldr	r3, [pc, #8]	; (8000944 <RGBSetLowSCL+0xc>)
 800093a:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 800093e:	851a      	strh	r2, [r3, #40]	; 0x28
 8000940:	f7ff bfc6 	b.w	80008d0 <rgb_i2c_delay>
 8000944:	48000800 	.word	0x48000800

08000948 <RGBSetHighSCL>:
 8000948:	4b02      	ldr	r3, [pc, #8]	; (8000954 <RGBSetHighSCL+0xc>)
 800094a:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 800094e:	619a      	str	r2, [r3, #24]
 8000950:	f7ff bfbe 	b.w	80008d0 <rgb_i2c_delay>
 8000954:	48000800 	.word	0x48000800

08000958 <rgb_i2c_init>:
 8000958:	b573      	push	{r0, r1, r4, r5, r6, lr}
 800095a:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 800095e:	2400      	movs	r4, #0
 8000960:	9300      	str	r3, [sp, #0]
 8000962:	2603      	movs	r6, #3
 8000964:	2301      	movs	r3, #1
 8000966:	4669      	mov	r1, sp
 8000968:	4812      	ldr	r0, [pc, #72]	; (80009b4 <rgb_i2c_init+0x5c>)
 800096a:	f88d 3004 	strb.w	r3, [sp, #4]
 800096e:	25f0      	movs	r5, #240	; 0xf0
 8000970:	f88d 6005 	strb.w	r6, [sp, #5]
 8000974:	f88d 4006 	strb.w	r4, [sp, #6]
 8000978:	f88d 4007 	strb.w	r4, [sp, #7]
 800097c:	f001 fbe6 	bl	800214c <GPIO_Init>
 8000980:	4669      	mov	r1, sp
 8000982:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000986:	9500      	str	r5, [sp, #0]
 8000988:	f88d 4004 	strb.w	r4, [sp, #4]
 800098c:	f88d 6005 	strb.w	r6, [sp, #5]
 8000990:	f88d 4007 	strb.w	r4, [sp, #7]
 8000994:	f001 fbda 	bl	800214c <GPIO_Init>
 8000998:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800099c:	4629      	mov	r1, r5
 800099e:	f001 fc1b 	bl	80021d8 <GPIO_SetBits>
 80009a2:	f7ff ffd1 	bl	8000948 <RGBSetHighSCL>
 80009a6:	f7ff ff95 	bl	80008d4 <RGBSetLowSDA>
 80009aa:	f7ff ffad 	bl	8000908 <RGBSetHighSDA>
 80009ae:	b002      	add	sp, #8
 80009b0:	bd70      	pop	{r4, r5, r6, pc}
 80009b2:	bf00      	nop
 80009b4:	48000800 	.word	0x48000800

080009b8 <rgb_i2cStart>:
 80009b8:	b508      	push	{r3, lr}
 80009ba:	f7ff ffc5 	bl	8000948 <RGBSetHighSCL>
 80009be:	f7ff ffa3 	bl	8000908 <RGBSetHighSDA>
 80009c2:	f7ff ffc1 	bl	8000948 <RGBSetHighSCL>
 80009c6:	f7ff ff85 	bl	80008d4 <RGBSetLowSDA>
 80009ca:	f7ff ffb5 	bl	8000938 <RGBSetLowSCL>
 80009ce:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80009d2:	f7ff bf99 	b.w	8000908 <RGBSetHighSDA>

080009d6 <rgb_i2cStop>:
 80009d6:	b508      	push	{r3, lr}
 80009d8:	f7ff ffae 	bl	8000938 <RGBSetLowSCL>
 80009dc:	f7ff ff7a 	bl	80008d4 <RGBSetLowSDA>
 80009e0:	f7ff ffb2 	bl	8000948 <RGBSetHighSCL>
 80009e4:	f7ff ff76 	bl	80008d4 <RGBSetLowSDA>
 80009e8:	f7ff ffae 	bl	8000948 <RGBSetHighSCL>
 80009ec:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80009f0:	f7ff bf8a 	b.w	8000908 <RGBSetHighSDA>

080009f4 <rgb_i2cWrite>:
 80009f4:	b538      	push	{r3, r4, r5, lr}
 80009f6:	4604      	mov	r4, r0
 80009f8:	2508      	movs	r5, #8
 80009fa:	f7ff ff9d 	bl	8000938 <RGBSetLowSCL>
 80009fe:	0623      	lsls	r3, r4, #24
 8000a00:	d502      	bpl.n	8000a08 <rgb_i2cWrite+0x14>
 8000a02:	f7ff ff81 	bl	8000908 <RGBSetHighSDA>
 8000a06:	e001      	b.n	8000a0c <rgb_i2cWrite+0x18>
 8000a08:	f7ff ff64 	bl	80008d4 <RGBSetLowSDA>
 8000a0c:	3d01      	subs	r5, #1
 8000a0e:	f7ff ff9b 	bl	8000948 <RGBSetHighSCL>
 8000a12:	0064      	lsls	r4, r4, #1
 8000a14:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8000a18:	b2e4      	uxtb	r4, r4
 8000a1a:	d1ee      	bne.n	80009fa <rgb_i2cWrite+0x6>
 8000a1c:	f7ff ff8c 	bl	8000938 <RGBSetLowSCL>
 8000a20:	f7ff ff72 	bl	8000908 <RGBSetHighSDA>
 8000a24:	f7ff ff90 	bl	8000948 <RGBSetHighSCL>
 8000a28:	f7ff ff86 	bl	8000938 <RGBSetLowSCL>
 8000a2c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000a30:	f7ff bf4e 	b.w	80008d0 <rgb_i2c_delay>

08000a34 <rgb_i2cRead>:
 8000a34:	2300      	movs	r3, #0
 8000a36:	b570      	push	{r4, r5, r6, lr}
 8000a38:	700b      	strb	r3, [r1, #0]
 8000a3a:	704b      	strb	r3, [r1, #1]
 8000a3c:	708b      	strb	r3, [r1, #2]
 8000a3e:	70cb      	strb	r3, [r1, #3]
 8000a40:	4606      	mov	r6, r0
 8000a42:	460c      	mov	r4, r1
 8000a44:	f7ff ff78 	bl	8000938 <RGBSetLowSCL>
 8000a48:	f7ff ff5e 	bl	8000908 <RGBSetHighSDA>
 8000a4c:	2508      	movs	r5, #8
 8000a4e:	2300      	movs	r3, #0
 8000a50:	5ce2      	ldrb	r2, [r4, r3]
 8000a52:	0052      	lsls	r2, r2, #1
 8000a54:	54e2      	strb	r2, [r4, r3]
 8000a56:	3301      	adds	r3, #1
 8000a58:	2b04      	cmp	r3, #4
 8000a5a:	d1f9      	bne.n	8000a50 <rgb_i2cRead+0x1c>
 8000a5c:	f7ff ff74 	bl	8000948 <RGBSetHighSCL>
 8000a60:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000a64:	8a1b      	ldrh	r3, [r3, #16]
 8000a66:	b29b      	uxth	r3, r3
 8000a68:	06da      	lsls	r2, r3, #27
 8000a6a:	d503      	bpl.n	8000a74 <rgb_i2cRead+0x40>
 8000a6c:	7822      	ldrb	r2, [r4, #0]
 8000a6e:	f042 0201 	orr.w	r2, r2, #1
 8000a72:	7022      	strb	r2, [r4, #0]
 8000a74:	0698      	lsls	r0, r3, #26
 8000a76:	d503      	bpl.n	8000a80 <rgb_i2cRead+0x4c>
 8000a78:	7862      	ldrb	r2, [r4, #1]
 8000a7a:	f042 0201 	orr.w	r2, r2, #1
 8000a7e:	7062      	strb	r2, [r4, #1]
 8000a80:	0659      	lsls	r1, r3, #25
 8000a82:	d503      	bpl.n	8000a8c <rgb_i2cRead+0x58>
 8000a84:	78a2      	ldrb	r2, [r4, #2]
 8000a86:	f042 0201 	orr.w	r2, r2, #1
 8000a8a:	70a2      	strb	r2, [r4, #2]
 8000a8c:	061a      	lsls	r2, r3, #24
 8000a8e:	d503      	bpl.n	8000a98 <rgb_i2cRead+0x64>
 8000a90:	78e3      	ldrb	r3, [r4, #3]
 8000a92:	f043 0301 	orr.w	r3, r3, #1
 8000a96:	70e3      	strb	r3, [r4, #3]
 8000a98:	f7ff ff4e 	bl	8000938 <RGBSetLowSCL>
 8000a9c:	3d01      	subs	r5, #1
 8000a9e:	d1d6      	bne.n	8000a4e <rgb_i2cRead+0x1a>
 8000aa0:	b10e      	cbz	r6, 8000aa6 <rgb_i2cRead+0x72>
 8000aa2:	f7ff ff17 	bl	80008d4 <RGBSetLowSDA>
 8000aa6:	f7ff ff4f 	bl	8000948 <RGBSetHighSCL>
 8000aaa:	f7ff ff45 	bl	8000938 <RGBSetLowSCL>
 8000aae:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000ab2:	f7ff bf0d 	b.w	80008d0 <rgb_i2c_delay>

08000ab6 <rgb_i2c_write_reg>:
 8000ab6:	b570      	push	{r4, r5, r6, lr}
 8000ab8:	4605      	mov	r5, r0
 8000aba:	460c      	mov	r4, r1
 8000abc:	4616      	mov	r6, r2
 8000abe:	f7ff ff7b 	bl	80009b8 <rgb_i2cStart>
 8000ac2:	4628      	mov	r0, r5
 8000ac4:	f7ff ff96 	bl	80009f4 <rgb_i2cWrite>
 8000ac8:	4620      	mov	r0, r4
 8000aca:	f7ff ff93 	bl	80009f4 <rgb_i2cWrite>
 8000ace:	4630      	mov	r0, r6
 8000ad0:	f7ff ff90 	bl	80009f4 <rgb_i2cWrite>
 8000ad4:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000ad8:	f7ff bf7d 	b.w	80009d6 <rgb_i2cStop>

08000adc <rgb_i2c_read_reg>:
 8000adc:	b570      	push	{r4, r5, r6, lr}
 8000ade:	4604      	mov	r4, r0
 8000ae0:	460d      	mov	r5, r1
 8000ae2:	4616      	mov	r6, r2
 8000ae4:	f7ff ff68 	bl	80009b8 <rgb_i2cStart>
 8000ae8:	4620      	mov	r0, r4
 8000aea:	f7ff ff83 	bl	80009f4 <rgb_i2cWrite>
 8000aee:	4628      	mov	r0, r5
 8000af0:	f7ff ff80 	bl	80009f4 <rgb_i2cWrite>
 8000af4:	f7ff ff60 	bl	80009b8 <rgb_i2cStart>
 8000af8:	f044 0001 	orr.w	r0, r4, #1
 8000afc:	f7ff ff7a 	bl	80009f4 <rgb_i2cWrite>
 8000b00:	4631      	mov	r1, r6
 8000b02:	2000      	movs	r0, #0
 8000b04:	f7ff ff96 	bl	8000a34 <rgb_i2cRead>
 8000b08:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000b0c:	f7ff bf63 	b.w	80009d6 <rgb_i2cStop>

08000b10 <rgb_sensor_uninit>:
 8000b10:	b508      	push	{r3, lr}
 8000b12:	2008      	movs	r0, #8
 8000b14:	f001 fb94 	bl	8002240 <led_off>
 8000b18:	2072      	movs	r0, #114	; 0x72
 8000b1a:	2180      	movs	r1, #128	; 0x80
 8000b1c:	2200      	movs	r2, #0
 8000b1e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000b22:	f7ff bfc8 	b.w	8000ab6 <rgb_i2c_write_reg>
	...

08000b28 <rgb_sensor_read>:
 8000b28:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000b2a:	f7ff ff45 	bl	80009b8 <rgb_i2cStart>
 8000b2e:	2072      	movs	r0, #114	; 0x72
 8000b30:	4d55      	ldr	r5, [pc, #340]	; (8000c88 <rgb_sensor_read+0x160>)
 8000b32:	4c56      	ldr	r4, [pc, #344]	; (8000c8c <rgb_sensor_read+0x164>)
 8000b34:	f7ff ff5e 	bl	80009f4 <rgb_i2cWrite>
 8000b38:	20b4      	movs	r0, #180	; 0xb4
 8000b3a:	f7ff ff5b 	bl	80009f4 <rgb_i2cWrite>
 8000b3e:	f7ff ff3b 	bl	80009b8 <rgb_i2cStart>
 8000b42:	2073      	movs	r0, #115	; 0x73
 8000b44:	f7ff ff56 	bl	80009f4 <rgb_i2cWrite>
 8000b48:	2001      	movs	r0, #1
 8000b4a:	4629      	mov	r1, r5
 8000b4c:	f7ff ff72 	bl	8000a34 <rgb_i2cRead>
 8000b50:	782b      	ldrb	r3, [r5, #0]
 8000b52:	8323      	strh	r3, [r4, #24]
 8000b54:	786b      	ldrb	r3, [r5, #1]
 8000b56:	8363      	strh	r3, [r4, #26]
 8000b58:	78ab      	ldrb	r3, [r5, #2]
 8000b5a:	83a3      	strh	r3, [r4, #28]
 8000b5c:	78eb      	ldrb	r3, [r5, #3]
 8000b5e:	2001      	movs	r0, #1
 8000b60:	4629      	mov	r1, r5
 8000b62:	83e3      	strh	r3, [r4, #30]
 8000b64:	f7ff ff66 	bl	8000a34 <rgb_i2cRead>
 8000b68:	2300      	movs	r3, #0
 8000b6a:	f103 020c 	add.w	r2, r3, #12
 8000b6e:	5ce8      	ldrb	r0, [r5, r3]
 8000b70:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000b74:	4f45      	ldr	r7, [pc, #276]	; (8000c8c <rgb_sensor_read+0x164>)
 8000b76:	4e44      	ldr	r6, [pc, #272]	; (8000c88 <rgb_sensor_read+0x160>)
 8000b78:	b289      	uxth	r1, r1
 8000b7a:	3301      	adds	r3, #1
 8000b7c:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000b80:	2b04      	cmp	r3, #4
 8000b82:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000b86:	d1f0      	bne.n	8000b6a <rgb_sensor_read+0x42>
 8000b88:	2001      	movs	r0, #1
 8000b8a:	4631      	mov	r1, r6
 8000b8c:	f7ff ff52 	bl	8000a34 <rgb_i2cRead>
 8000b90:	7833      	ldrb	r3, [r6, #0]
 8000b92:	803b      	strh	r3, [r7, #0]
 8000b94:	7873      	ldrb	r3, [r6, #1]
 8000b96:	807b      	strh	r3, [r7, #2]
 8000b98:	78b3      	ldrb	r3, [r6, #2]
 8000b9a:	80bb      	strh	r3, [r7, #4]
 8000b9c:	78f3      	ldrb	r3, [r6, #3]
 8000b9e:	2001      	movs	r0, #1
 8000ba0:	4631      	mov	r1, r6
 8000ba2:	80fb      	strh	r3, [r7, #6]
 8000ba4:	f7ff ff46 	bl	8000a34 <rgb_i2cRead>
 8000ba8:	2300      	movs	r3, #0
 8000baa:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
 8000bae:	5ce9      	ldrb	r1, [r5, r3]
 8000bb0:	4f36      	ldr	r7, [pc, #216]	; (8000c8c <rgb_sensor_read+0x164>)
 8000bb2:	4e35      	ldr	r6, [pc, #212]	; (8000c88 <rgb_sensor_read+0x160>)
 8000bb4:	b292      	uxth	r2, r2
 8000bb6:	ea42 2201 	orr.w	r2, r2, r1, lsl #8
 8000bba:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
 8000bbe:	3301      	adds	r3, #1
 8000bc0:	2b04      	cmp	r3, #4
 8000bc2:	d1f2      	bne.n	8000baa <rgb_sensor_read+0x82>
 8000bc4:	2001      	movs	r0, #1
 8000bc6:	4631      	mov	r1, r6
 8000bc8:	f7ff ff34 	bl	8000a34 <rgb_i2cRead>
 8000bcc:	7833      	ldrb	r3, [r6, #0]
 8000bce:	813b      	strh	r3, [r7, #8]
 8000bd0:	7873      	ldrb	r3, [r6, #1]
 8000bd2:	817b      	strh	r3, [r7, #10]
 8000bd4:	78b3      	ldrb	r3, [r6, #2]
 8000bd6:	81bb      	strh	r3, [r7, #12]
 8000bd8:	78f3      	ldrb	r3, [r6, #3]
 8000bda:	2001      	movs	r0, #1
 8000bdc:	4631      	mov	r1, r6
 8000bde:	81fb      	strh	r3, [r7, #14]
 8000be0:	f7ff ff28 	bl	8000a34 <rgb_i2cRead>
 8000be4:	2300      	movs	r3, #0
 8000be6:	1d1a      	adds	r2, r3, #4
 8000be8:	5ce8      	ldrb	r0, [r5, r3]
 8000bea:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000bee:	4f27      	ldr	r7, [pc, #156]	; (8000c8c <rgb_sensor_read+0x164>)
 8000bf0:	4e25      	ldr	r6, [pc, #148]	; (8000c88 <rgb_sensor_read+0x160>)
 8000bf2:	b289      	uxth	r1, r1
 8000bf4:	3301      	adds	r3, #1
 8000bf6:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000bfa:	2b04      	cmp	r3, #4
 8000bfc:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000c00:	d1f1      	bne.n	8000be6 <rgb_sensor_read+0xbe>
 8000c02:	2001      	movs	r0, #1
 8000c04:	4631      	mov	r1, r6
 8000c06:	f7ff ff15 	bl	8000a34 <rgb_i2cRead>
 8000c0a:	7833      	ldrb	r3, [r6, #0]
 8000c0c:	823b      	strh	r3, [r7, #16]
 8000c0e:	7873      	ldrb	r3, [r6, #1]
 8000c10:	827b      	strh	r3, [r7, #18]
 8000c12:	78b3      	ldrb	r3, [r6, #2]
 8000c14:	82bb      	strh	r3, [r7, #20]
 8000c16:	78f3      	ldrb	r3, [r6, #3]
 8000c18:	2001      	movs	r0, #1
 8000c1a:	4631      	mov	r1, r6
 8000c1c:	82fb      	strh	r3, [r7, #22]
 8000c1e:	f7ff ff09 	bl	8000a34 <rgb_i2cRead>
 8000c22:	2300      	movs	r3, #0
 8000c24:	f103 0208 	add.w	r2, r3, #8
 8000c28:	5ce8      	ldrb	r0, [r5, r3]
 8000c2a:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000c2e:	4f17      	ldr	r7, [pc, #92]	; (8000c8c <rgb_sensor_read+0x164>)
 8000c30:	4e15      	ldr	r6, [pc, #84]	; (8000c88 <rgb_sensor_read+0x160>)
 8000c32:	b289      	uxth	r1, r1
 8000c34:	3301      	adds	r3, #1
 8000c36:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000c3a:	2b04      	cmp	r3, #4
 8000c3c:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000c40:	d1f0      	bne.n	8000c24 <rgb_sensor_read+0xfc>
 8000c42:	2001      	movs	r0, #1
 8000c44:	4631      	mov	r1, r6
 8000c46:	f7ff fef5 	bl	8000a34 <rgb_i2cRead>
 8000c4a:	7833      	ldrb	r3, [r6, #0]
 8000c4c:	843b      	strh	r3, [r7, #32]
 8000c4e:	7873      	ldrb	r3, [r6, #1]
 8000c50:	847b      	strh	r3, [r7, #34]	; 0x22
 8000c52:	78b3      	ldrb	r3, [r6, #2]
 8000c54:	84bb      	strh	r3, [r7, #36]	; 0x24
 8000c56:	78f3      	ldrb	r3, [r6, #3]
 8000c58:	2000      	movs	r0, #0
 8000c5a:	4631      	mov	r1, r6
 8000c5c:	84fb      	strh	r3, [r7, #38]	; 0x26
 8000c5e:	f7ff fee9 	bl	8000a34 <rgb_i2cRead>
 8000c62:	2300      	movs	r3, #0
 8000c64:	f103 0210 	add.w	r2, r3, #16
 8000c68:	5ce8      	ldrb	r0, [r5, r3]
 8000c6a:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000c6e:	3301      	adds	r3, #1
 8000c70:	b289      	uxth	r1, r1
 8000c72:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000c76:	2b04      	cmp	r3, #4
 8000c78:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000c7c:	d1f2      	bne.n	8000c64 <rgb_sensor_read+0x13c>
 8000c7e:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8000c82:	f7ff bea8 	b.w	80009d6 <rgb_i2cStop>
 8000c86:	bf00      	nop
 8000c88:	200009b8 	.word	0x200009b8
 8000c8c:	20000254 	.word	0x20000254

08000c90 <rgb_sensor_init>:
 8000c90:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000c92:	2300      	movs	r3, #0
 8000c94:	4a24      	ldr	r2, [pc, #144]	; (8000d28 <rgb_sensor_init+0x98>)
 8000c96:	1d19      	adds	r1, r3, #4
 8000c98:	2400      	movs	r4, #0
 8000c9a:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8000c9e:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000ca2:	f103 0108 	add.w	r1, r3, #8
 8000ca6:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000caa:	f103 0110 	add.w	r1, r3, #16
 8000cae:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000cb2:	f103 010c 	add.w	r1, r3, #12
 8000cb6:	3301      	adds	r3, #1
 8000cb8:	2b04      	cmp	r3, #4
 8000cba:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000cbe:	d1e9      	bne.n	8000c94 <rgb_sensor_init+0x4>
 8000cc0:	2008      	movs	r0, #8
 8000cc2:	f001 faa7 	bl	8002214 <led_on>
 8000cc6:	f7ff fe47 	bl	8000958 <rgb_i2c_init>
 8000cca:	2072      	movs	r0, #114	; 0x72
 8000ccc:	2181      	movs	r1, #129	; 0x81
 8000cce:	22ff      	movs	r2, #255	; 0xff
 8000cd0:	f7ff fef1 	bl	8000ab6 <rgb_i2c_write_reg>
 8000cd4:	2072      	movs	r0, #114	; 0x72
 8000cd6:	2183      	movs	r1, #131	; 0x83
 8000cd8:	22ff      	movs	r2, #255	; 0xff
 8000cda:	f7ff feec 	bl	8000ab6 <rgb_i2c_write_reg>
 8000cde:	2072      	movs	r0, #114	; 0x72
 8000ce0:	218d      	movs	r1, #141	; 0x8d
 8000ce2:	4622      	mov	r2, r4
 8000ce4:	f7ff fee7 	bl	8000ab6 <rgb_i2c_write_reg>
 8000ce8:	2072      	movs	r0, #114	; 0x72
 8000cea:	2180      	movs	r1, #128	; 0x80
 8000cec:	2203      	movs	r2, #3
 8000cee:	f7ff fee2 	bl	8000ab6 <rgb_i2c_write_reg>
 8000cf2:	ad01      	add	r5, sp, #4
 8000cf4:	2072      	movs	r0, #114	; 0x72
 8000cf6:	218f      	movs	r1, #143	; 0x8f
 8000cf8:	2223      	movs	r2, #35	; 0x23
 8000cfa:	f7ff fedc 	bl	8000ab6 <rgb_i2c_write_reg>
 8000cfe:	f7ff ff13 	bl	8000b28 <rgb_sensor_read>
 8000d02:	2072      	movs	r0, #114	; 0x72
 8000d04:	2192      	movs	r1, #146	; 0x92
 8000d06:	462a      	mov	r2, r5
 8000d08:	f7ff fee8 	bl	8000adc <rgb_i2c_read_reg>
 8000d0c:	4620      	mov	r0, r4
 8000d0e:	4623      	mov	r3, r4
 8000d10:	5cea      	ldrb	r2, [r5, r3]
 8000d12:	2a69      	cmp	r2, #105	; 0x69
 8000d14:	d002      	beq.n	8000d1c <rgb_sensor_init+0x8c>
 8000d16:	2201      	movs	r2, #1
 8000d18:	409a      	lsls	r2, r3
 8000d1a:	4310      	orrs	r0, r2
 8000d1c:	3301      	adds	r3, #1
 8000d1e:	2b04      	cmp	r3, #4
 8000d20:	d1f6      	bne.n	8000d10 <rgb_sensor_init+0x80>
 8000d22:	b003      	add	sp, #12
 8000d24:	bd30      	pop	{r4, r5, pc}
 8000d26:	bf00      	nop
 8000d28:	20000254 	.word	0x20000254

08000d2c <motors_uninit>:
 8000d2c:	b508      	push	{r3, lr}
 8000d2e:	20c0      	movs	r0, #192	; 0xc0
 8000d30:	2100      	movs	r1, #0
 8000d32:	2218      	movs	r2, #24
 8000d34:	f000 fe2e 	bl	8001994 <i2c_write_reg>
 8000d38:	20c2      	movs	r0, #194	; 0xc2
 8000d3a:	2100      	movs	r1, #0
 8000d3c:	2218      	movs	r2, #24
 8000d3e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000d42:	f000 be27 	b.w	8001994 <i2c_write_reg>
	...

08000d48 <motors_update>:
 8000d48:	4a2f      	ldr	r2, [pc, #188]	; (8000e08 <motors_update+0xc0>)
 8000d4a:	b538      	push	{r3, r4, r5, lr}
 8000d4c:	6813      	ldr	r3, [r2, #0]
 8000d4e:	6854      	ldr	r4, [r2, #4]
 8000d50:	b2db      	uxtb	r3, r3
 8000d52:	b25a      	sxtb	r2, r3
 8000d54:	2a2c      	cmp	r2, #44	; 0x2c
 8000d56:	b2e4      	uxtb	r4, r4
 8000d58:	dc04      	bgt.n	8000d64 <motors_update+0x1c>
 8000d5a:	f112 0f2c 	cmn.w	r2, #44	; 0x2c
 8000d5e:	bfb8      	it	lt
 8000d60:	23d4      	movlt	r3, #212	; 0xd4
 8000d62:	e000      	b.n	8000d66 <motors_update+0x1e>
 8000d64:	232c      	movs	r3, #44	; 0x2c
 8000d66:	b262      	sxtb	r2, r4
 8000d68:	2a2c      	cmp	r2, #44	; 0x2c
 8000d6a:	dc04      	bgt.n	8000d76 <motors_update+0x2e>
 8000d6c:	f112 0f2c 	cmn.w	r2, #44	; 0x2c
 8000d70:	bfb8      	it	lt
 8000d72:	24d4      	movlt	r4, #212	; 0xd4
 8000d74:	e000      	b.n	8000d78 <motors_update+0x30>
 8000d76:	242c      	movs	r4, #44	; 0x2c
 8000d78:	b1b3      	cbz	r3, 8000da8 <motors_update+0x60>
 8000d7a:	b25a      	sxtb	r2, r3
 8000d7c:	2a00      	cmp	r2, #0
 8000d7e:	dd07      	ble.n	8000d90 <motors_update+0x48>
 8000d80:	2a05      	cmp	r2, #5
 8000d82:	bfd8      	it	le
 8000d84:	2306      	movle	r3, #6
 8000d86:	b25d      	sxtb	r5, r3
 8000d88:	00ad      	lsls	r5, r5, #2
 8000d8a:	f045 0502 	orr.w	r5, r5, #2
 8000d8e:	e009      	b.n	8000da4 <motors_update+0x5c>
 8000d90:	425b      	negs	r3, r3
 8000d92:	b2db      	uxtb	r3, r3
 8000d94:	b25a      	sxtb	r2, r3
 8000d96:	2a05      	cmp	r2, #5
 8000d98:	bfd8      	it	le
 8000d9a:	2306      	movle	r3, #6
 8000d9c:	b25d      	sxtb	r5, r3
 8000d9e:	00ad      	lsls	r5, r5, #2
 8000da0:	f045 0501 	orr.w	r5, r5, #1
 8000da4:	b2ed      	uxtb	r5, r5
 8000da6:	e000      	b.n	8000daa <motors_update+0x62>
 8000da8:	251b      	movs	r5, #27
 8000daa:	2100      	movs	r1, #0
 8000dac:	460a      	mov	r2, r1
 8000dae:	20c0      	movs	r0, #192	; 0xc0
 8000db0:	f000 fdf0 	bl	8001994 <i2c_write_reg>
 8000db4:	20c0      	movs	r0, #192	; 0xc0
 8000db6:	2100      	movs	r1, #0
 8000db8:	462a      	mov	r2, r5
 8000dba:	f000 fdeb 	bl	8001994 <i2c_write_reg>
 8000dbe:	b1b4      	cbz	r4, 8000dee <motors_update+0xa6>
 8000dc0:	b263      	sxtb	r3, r4
 8000dc2:	2b00      	cmp	r3, #0
 8000dc4:	dd07      	ble.n	8000dd6 <motors_update+0x8e>
 8000dc6:	2b05      	cmp	r3, #5
 8000dc8:	bfd8      	it	le
 8000dca:	2406      	movle	r4, #6
 8000dcc:	b264      	sxtb	r4, r4
 8000dce:	00a4      	lsls	r4, r4, #2
 8000dd0:	f044 0401 	orr.w	r4, r4, #1
 8000dd4:	e009      	b.n	8000dea <motors_update+0xa2>
 8000dd6:	4264      	negs	r4, r4
 8000dd8:	b2e4      	uxtb	r4, r4
 8000dda:	b263      	sxtb	r3, r4
 8000ddc:	2b05      	cmp	r3, #5
 8000dde:	bfd8      	it	le
 8000de0:	2406      	movle	r4, #6
 8000de2:	b264      	sxtb	r4, r4
 8000de4:	00a4      	lsls	r4, r4, #2
 8000de6:	f044 0402 	orr.w	r4, r4, #2
 8000dea:	b2e4      	uxtb	r4, r4
 8000dec:	e000      	b.n	8000df0 <motors_update+0xa8>
 8000dee:	241b      	movs	r4, #27
 8000df0:	2100      	movs	r1, #0
 8000df2:	460a      	mov	r2, r1
 8000df4:	20c2      	movs	r0, #194	; 0xc2
 8000df6:	f000 fdcd 	bl	8001994 <i2c_write_reg>
 8000dfa:	4622      	mov	r2, r4
 8000dfc:	20c2      	movs	r0, #194	; 0xc2
 8000dfe:	2100      	movs	r1, #0
 8000e00:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000e04:	f000 bdc6 	b.w	8001994 <i2c_write_reg>
 8000e08:	2000047c 	.word	0x2000047c

08000e0c <motors_init>:
 8000e0c:	b510      	push	{r4, lr}
 8000e0e:	4b04      	ldr	r3, [pc, #16]	; (8000e20 <motors_init+0x14>)
 8000e10:	2400      	movs	r4, #0
 8000e12:	601c      	str	r4, [r3, #0]
 8000e14:	605c      	str	r4, [r3, #4]
 8000e16:	f7ff ff97 	bl	8000d48 <motors_update>
 8000e1a:	4620      	mov	r0, r4
 8000e1c:	bd10      	pop	{r4, pc}
 8000e1e:	bf00      	nop
 8000e20:	2000047c 	.word	0x2000047c

08000e24 <esp8266_send>:
 8000e24:	b510      	push	{r4, lr}
 8000e26:	1e44      	subs	r4, r0, #1
 8000e28:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000e2c:	b110      	cbz	r0, 8000e34 <esp8266_send+0x10>
 8000e2e:	f000 fb0f 	bl	8001450 <uart_write>
 8000e32:	e7f9      	b.n	8000e28 <esp8266_send+0x4>
 8000e34:	bd10      	pop	{r4, pc}

08000e36 <esp8266_send_uint>:
 8000e36:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000e38:	2300      	movs	r3, #0
 8000e3a:	f88d 300f 	strb.w	r3, [sp, #15]
 8000e3e:	230a      	movs	r3, #10
 8000e40:	240a      	movs	r4, #10
 8000e42:	fbb0 f1f4 	udiv	r1, r0, r4
 8000e46:	fb04 0011 	mls	r0, r4, r1, r0
 8000e4a:	aa01      	add	r2, sp, #4
 8000e4c:	3030      	adds	r0, #48	; 0x30
 8000e4e:	5498      	strb	r0, [r3, r2]
 8000e50:	1e5c      	subs	r4, r3, #1
 8000e52:	4608      	mov	r0, r1
 8000e54:	b109      	cbz	r1, 8000e5a <esp8266_send_uint+0x24>
 8000e56:	4623      	mov	r3, r4
 8000e58:	e7f2      	b.n	8000e40 <esp8266_send_uint+0xa>
 8000e5a:	18d0      	adds	r0, r2, r3
 8000e5c:	f7ff ffe2 	bl	8000e24 <esp8266_send>
 8000e60:	b004      	add	sp, #16
 8000e62:	bd10      	pop	{r4, pc}

08000e64 <esp8266_find_stream>:
 8000e64:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000e66:	4615      	mov	r5, r2
 8000e68:	460f      	mov	r7, r1
 8000e6a:	4606      	mov	r6, r0
 8000e6c:	f001 f928 	bl	80020c0 <timer_get_time>
 8000e70:	4405      	add	r5, r0
 8000e72:	f000 fba5 	bl	80015c0 <uart_clear_buffer>
 8000e76:	2400      	movs	r4, #0
 8000e78:	f000 faf4 	bl	8001464 <uart_is_char>
 8000e7c:	f64f 72ff 	movw	r2, #65535	; 0xffff
 8000e80:	4290      	cmp	r0, r2
 8000e82:	d00c      	beq.n	8000e9e <esp8266_find_stream+0x3a>
 8000e84:	5d32      	ldrb	r2, [r6, r4]
 8000e86:	4282      	cmp	r2, r0
 8000e88:	d108      	bne.n	8000e9c <esp8266_find_stream+0x38>
 8000e8a:	1e7b      	subs	r3, r7, #1
 8000e8c:	429c      	cmp	r4, r3
 8000e8e:	d201      	bcs.n	8000e94 <esp8266_find_stream+0x30>
 8000e90:	3401      	adds	r4, #1
 8000e92:	e004      	b.n	8000e9e <esp8266_find_stream+0x3a>
 8000e94:	f000 fb94 	bl	80015c0 <uart_clear_buffer>
 8000e98:	2001      	movs	r0, #1
 8000e9a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000e9c:	2400      	movs	r4, #0
 8000e9e:	f001 f90f 	bl	80020c0 <timer_get_time>
 8000ea2:	42a8      	cmp	r0, r5
 8000ea4:	d3e8      	bcc.n	8000e78 <esp8266_find_stream+0x14>
 8000ea6:	f000 fb8b 	bl	80015c0 <uart_clear_buffer>
 8000eaa:	2000      	movs	r0, #0
 8000eac:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

08000eb0 <esp8266_init>:
 8000eb0:	b510      	push	{r4, lr}
 8000eb2:	4604      	mov	r4, r0
 8000eb4:	f640 30b8 	movw	r0, #3000	; 0xbb8
 8000eb8:	f001 f910 	bl	80020dc <timer_delay_ms>
 8000ebc:	b10c      	cbz	r4, 8000ec2 <esp8266_init+0x12>
 8000ebe:	4818      	ldr	r0, [pc, #96]	; (8000f20 <esp8266_init+0x70>)
 8000ec0:	e000      	b.n	8000ec4 <esp8266_init+0x14>
 8000ec2:	4818      	ldr	r0, [pc, #96]	; (8000f24 <esp8266_init+0x74>)
 8000ec4:	f7ff ffae 	bl	8000e24 <esp8266_send>
 8000ec8:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000ecc:	f001 f906 	bl	80020dc <timer_delay_ms>
 8000ed0:	4815      	ldr	r0, [pc, #84]	; (8000f28 <esp8266_init+0x78>)
 8000ed2:	f7ff ffa7 	bl	8000e24 <esp8266_send>
 8000ed6:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000eda:	f001 f8ff 	bl	80020dc <timer_delay_ms>
 8000ede:	4813      	ldr	r0, [pc, #76]	; (8000f2c <esp8266_init+0x7c>)
 8000ee0:	f7ff ffa0 	bl	8000e24 <esp8266_send>
 8000ee4:	4812      	ldr	r0, [pc, #72]	; (8000f30 <esp8266_init+0x80>)
 8000ee6:	f7ff ff9d 	bl	8000e24 <esp8266_send>
 8000eea:	4812      	ldr	r0, [pc, #72]	; (8000f34 <esp8266_init+0x84>)
 8000eec:	f7ff ff9a 	bl	8000e24 <esp8266_send>
 8000ef0:	4811      	ldr	r0, [pc, #68]	; (8000f38 <esp8266_init+0x88>)
 8000ef2:	f7ff ff97 	bl	8000e24 <esp8266_send>
 8000ef6:	4811      	ldr	r0, [pc, #68]	; (8000f3c <esp8266_init+0x8c>)
 8000ef8:	f7ff ff94 	bl	8000e24 <esp8266_send>
 8000efc:	4810      	ldr	r0, [pc, #64]	; (8000f40 <esp8266_init+0x90>)
 8000efe:	2102      	movs	r1, #2
 8000f00:	f644 6220 	movw	r2, #20000	; 0x4e20
 8000f04:	f7ff ffae 	bl	8000e64 <esp8266_find_stream>
 8000f08:	b140      	cbz	r0, 8000f1c <esp8266_init+0x6c>
 8000f0a:	b12c      	cbz	r4, 8000f18 <esp8266_init+0x68>
 8000f0c:	480d      	ldr	r0, [pc, #52]	; (8000f44 <esp8266_init+0x94>)
 8000f0e:	f7ff ff89 	bl	8000e24 <esp8266_send>
 8000f12:	20c8      	movs	r0, #200	; 0xc8
 8000f14:	f001 f8e2 	bl	80020dc <timer_delay_ms>
 8000f18:	2000      	movs	r0, #0
 8000f1a:	bd10      	pop	{r4, pc}
 8000f1c:	2002      	movs	r0, #2
 8000f1e:	bd10      	pop	{r4, pc}
 8000f20:	08002379 	.word	0x08002379
 8000f24:	08002387 	.word	0x08002387
 8000f28:	08002395 	.word	0x08002395
 8000f2c:	080023a3 	.word	0x080023a3
 8000f30:	080023ae 	.word	0x080023ae
 8000f34:	080023ec 	.word	0x080023ec
 8000f38:	080023bb 	.word	0x080023bb
 8000f3c:	080023c4 	.word	0x080023c4
 8000f40:	08002414 	.word	0x08002414
 8000f44:	080023c8 	.word	0x080023c8

08000f48 <esp8266_uninit>:
 8000f48:	4770      	bx	lr

08000f4a <esp8266_get_nonblocking>:
 8000f4a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000f4c:	4606      	mov	r6, r0
 8000f4e:	460f      	mov	r7, r1
 8000f50:	4615      	mov	r5, r2
 8000f52:	2300      	movs	r3, #0
 8000f54:	42bb      	cmp	r3, r7
 8000f56:	f04f 0400 	mov.w	r4, #0
 8000f5a:	d002      	beq.n	8000f62 <esp8266_get_nonblocking+0x18>
 8000f5c:	54f4      	strb	r4, [r6, r3]
 8000f5e:	3301      	adds	r3, #1
 8000f60:	e7f8      	b.n	8000f54 <esp8266_get_nonblocking+0xa>
 8000f62:	f001 f8ad 	bl	80020c0 <timer_get_time>
 8000f66:	4405      	add	r5, r0
 8000f68:	f000 fa7c 	bl	8001464 <uart_is_char>
 8000f6c:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000f70:	4298      	cmp	r0, r3
 8000f72:	bf1c      	itt	ne
 8000f74:	5530      	strbne	r0, [r6, r4]
 8000f76:	3401      	addne	r4, #1
 8000f78:	f001 f8a2 	bl	80020c0 <timer_get_time>
 8000f7c:	42bc      	cmp	r4, r7
 8000f7e:	d207      	bcs.n	8000f90 <esp8266_get_nonblocking+0x46>
 8000f80:	4285      	cmp	r5, r0
 8000f82:	d8f1      	bhi.n	8000f68 <esp8266_get_nonblocking+0x1e>
 8000f84:	42a8      	cmp	r0, r5
 8000f86:	bf94      	ite	ls
 8000f88:	4620      	movls	r0, r4
 8000f8a:	f04f 30ff 	movhi.w	r0, #4294967295
 8000f8e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000f90:	42a8      	cmp	r0, r5
 8000f92:	bf8c      	ite	hi
 8000f94:	f04f 30ff 	movhi.w	r0, #4294967295
 8000f98:	f06f 0001 	mvnls.w	r0, #1
 8000f9c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

08000fa0 <esp8266_connect>:
 8000fa0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000fa2:	4606      	mov	r6, r0
 8000fa4:	4839      	ldr	r0, [pc, #228]	; (800108c <esp8266_connect+0xec>)
 8000fa6:	460f      	mov	r7, r1
 8000fa8:	4614      	mov	r4, r2
 8000faa:	461d      	mov	r5, r3
 8000fac:	f7ff ff3a 	bl	8000e24 <esp8266_send>
 8000fb0:	4630      	mov	r0, r6
 8000fb2:	f7ff ff37 	bl	8000e24 <esp8266_send>
 8000fb6:	4836      	ldr	r0, [pc, #216]	; (8001090 <esp8266_connect+0xf0>)
 8000fb8:	f7ff ff34 	bl	8000e24 <esp8266_send>
 8000fbc:	4638      	mov	r0, r7
 8000fbe:	f7ff ff3a 	bl	8000e36 <esp8266_send_uint>
 8000fc2:	4834      	ldr	r0, [pc, #208]	; (8001094 <esp8266_connect+0xf4>)
 8000fc4:	f7ff ff2e 	bl	8000e24 <esp8266_send>
 8000fc8:	4833      	ldr	r0, [pc, #204]	; (8001098 <esp8266_connect+0xf8>)
 8000fca:	2107      	movs	r1, #7
 8000fcc:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 8000fd0:	f7ff ff48 	bl	8000e64 <esp8266_find_stream>
 8000fd4:	2800      	cmp	r0, #0
 8000fd6:	d056      	beq.n	8001086 <esp8266_connect+0xe6>
 8000fd8:	4830      	ldr	r0, [pc, #192]	; (800109c <esp8266_connect+0xfc>)
 8000fda:	f7ff ff23 	bl	8000e24 <esp8266_send>
 8000fde:	4628      	mov	r0, r5
 8000fe0:	f7ff ff29 	bl	8000e36 <esp8266_send_uint>
 8000fe4:	482b      	ldr	r0, [pc, #172]	; (8001094 <esp8266_connect+0xf4>)
 8000fe6:	f7ff ff1d 	bl	8000e24 <esp8266_send>
 8000fea:	482d      	ldr	r0, [pc, #180]	; (80010a0 <esp8266_connect+0x100>)
 8000fec:	2101      	movs	r1, #1
 8000fee:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 8000ff2:	f7ff ff37 	bl	8000e64 <esp8266_find_stream>
 8000ff6:	b108      	cbz	r0, 8000ffc <esp8266_connect+0x5c>
 8000ff8:	4425      	add	r5, r4
 8000ffa:	e007      	b.n	800100c <esp8266_connect+0x6c>
 8000ffc:	4829      	ldr	r0, [pc, #164]	; (80010a4 <esp8266_connect+0x104>)
 8000ffe:	f7ff ff11 	bl	8000e24 <esp8266_send>
 8001002:	2064      	movs	r0, #100	; 0x64
 8001004:	f001 f86a 	bl	80020dc <timer_delay_ms>
 8001008:	2004      	movs	r0, #4
 800100a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800100c:	42ac      	cmp	r4, r5
 800100e:	d004      	beq.n	800101a <esp8266_connect+0x7a>
 8001010:	f814 0b01 	ldrb.w	r0, [r4], #1
 8001014:	f000 fa1c 	bl	8001450 <uart_write>
 8001018:	e7f8      	b.n	800100c <esp8266_connect+0x6c>
 800101a:	4823      	ldr	r0, [pc, #140]	; (80010a8 <esp8266_connect+0x108>)
 800101c:	2107      	movs	r1, #7
 800101e:	2264      	movs	r2, #100	; 0x64
 8001020:	f7ff ff20 	bl	8000e64 <esp8266_find_stream>
 8001024:	b938      	cbnz	r0, 8001036 <esp8266_connect+0x96>
 8001026:	481f      	ldr	r0, [pc, #124]	; (80010a4 <esp8266_connect+0x104>)
 8001028:	f7ff fefc 	bl	8000e24 <esp8266_send>
 800102c:	2064      	movs	r0, #100	; 0x64
 800102e:	f001 f855 	bl	80020dc <timer_delay_ms>
 8001032:	2005      	movs	r0, #5
 8001034:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001036:	481d      	ldr	r0, [pc, #116]	; (80010ac <esp8266_connect+0x10c>)
 8001038:	2105      	movs	r1, #5
 800103a:	2264      	movs	r2, #100	; 0x64
 800103c:	f7ff ff12 	bl	8000e64 <esp8266_find_stream>
 8001040:	b108      	cbz	r0, 8001046 <esp8266_connect+0xa6>
 8001042:	2400      	movs	r4, #0
 8001044:	e007      	b.n	8001056 <esp8266_connect+0xb6>
 8001046:	4817      	ldr	r0, [pc, #92]	; (80010a4 <esp8266_connect+0x104>)
 8001048:	f7ff feec 	bl	8000e24 <esp8266_send>
 800104c:	2064      	movs	r0, #100	; 0x64
 800104e:	f001 f845 	bl	80020dc <timer_delay_ms>
 8001052:	2006      	movs	r0, #6
 8001054:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001056:	f000 fa21 	bl	800149c <uart_read>
 800105a:	283a      	cmp	r0, #58	; 0x3a
 800105c:	d004      	beq.n	8001068 <esp8266_connect+0xc8>
 800105e:	230a      	movs	r3, #10
 8001060:	fb03 0404 	mla	r4, r3, r4, r0
 8001064:	3c30      	subs	r4, #48	; 0x30
 8001066:	e7f6      	b.n	8001056 <esp8266_connect+0xb6>
 8001068:	9907      	ldr	r1, [sp, #28]
 800106a:	9806      	ldr	r0, [sp, #24]
 800106c:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 8001070:	f7ff ff6b 	bl	8000f4a <esp8266_get_nonblocking>
 8001074:	480b      	ldr	r0, [pc, #44]	; (80010a4 <esp8266_connect+0x104>)
 8001076:	f7ff fed5 	bl	8000e24 <esp8266_send>
 800107a:	2064      	movs	r0, #100	; 0x64
 800107c:	f001 f82e 	bl	80020dc <timer_delay_ms>
 8001080:	f504 707a 	add.w	r0, r4, #1000	; 0x3e8
 8001084:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001086:	2003      	movs	r0, #3
 8001088:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800108a:	bf00      	nop
 800108c:	080023dc 	.word	0x080023dc
 8001090:	080023f0 	.word	0x080023f0
 8001094:	080023c5 	.word	0x080023c5
 8001098:	08002414 	.word	0x08002414
 800109c:	080023f3 	.word	0x080023f3
 80010a0:	080023ff 	.word	0x080023ff
 80010a4:	08002401 	.word	0x08002401
 80010a8:	0800240f 	.word	0x0800240f
 80010ac:	08002417 	.word	0x08002417

080010b0 <main_thread>:
 80010b0:	b508      	push	{r3, lr}
 80010b2:	481e      	ldr	r0, [pc, #120]	; (800112c <main_thread+0x7c>)
 80010b4:	f7ff fa18 	bl	80004e8 <printf_>
 80010b8:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 80010bc:	f001 f80e 	bl	80020dc <timer_delay_ms>
 80010c0:	f000 f848 	bl	8001154 <device_wake_up>
 80010c4:	491a      	ldr	r1, [pc, #104]	; (8001130 <main_thread+0x80>)
 80010c6:	481b      	ldr	r0, [pc, #108]	; (8001134 <main_thread+0x84>)
 80010c8:	f44f 7200 	mov.w	r2, #512	; 0x200
 80010cc:	2306      	movs	r3, #6
 80010ce:	f7ff f8f1 	bl	80002b4 <create_thread>
 80010d2:	4919      	ldr	r1, [pc, #100]	; (8001138 <main_thread+0x88>)
 80010d4:	4819      	ldr	r0, [pc, #100]	; (800113c <main_thread+0x8c>)
 80010d6:	f44f 7200 	mov.w	r2, #512	; 0x200
 80010da:	2306      	movs	r3, #6
 80010dc:	f7ff f8ea 	bl	80002b4 <create_thread>
 80010e0:	4817      	ldr	r0, [pc, #92]	; (8001140 <main_thread+0x90>)
 80010e2:	4918      	ldr	r1, [pc, #96]	; (8001144 <main_thread+0x94>)
 80010e4:	f44f 7200 	mov.w	r2, #512	; 0x200
 80010e8:	2306      	movs	r3, #6
 80010ea:	f7ff f8e3 	bl	80002b4 <create_thread>
 80010ee:	20c8      	movs	r0, #200	; 0xc8
 80010f0:	f000 fff4 	bl	80020dc <timer_delay_ms>
 80010f4:	f001 f918 	bl	8002328 <get_key>
 80010f8:	b980      	cbnz	r0, 800111c <main_thread+0x6c>
 80010fa:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80010fe:	f001 f889 	bl	8002214 <led_on>
 8001102:	2064      	movs	r0, #100	; 0x64
 8001104:	f000 ffea 	bl	80020dc <timer_delay_ms>
 8001108:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 800110c:	f001 f898 	bl	8002240 <led_off>
 8001110:	20c8      	movs	r0, #200	; 0xc8
 8001112:	f000 ffe3 	bl	80020dc <timer_delay_ms>
 8001116:	f000 f817 	bl	8001148 <device_sleep>
 800111a:	e7eb      	b.n	80010f4 <main_thread+0x44>
 800111c:	f000 f81a 	bl	8001154 <device_wake_up>
 8001120:	20c8      	movs	r0, #200	; 0xc8
 8001122:	f000 ffdb 	bl	80020dc <timer_delay_ms>
 8001126:	f000 f981 	bl	800142c <go_forward_test>
 800112a:	e7e3      	b.n	80010f4 <main_thread+0x44>
 800112c:	0800241d 	.word	0x0800241d
 8001130:	2000027c 	.word	0x2000027c
 8001134:	080011d5 	.word	0x080011d5
 8001138:	20000034 	.word	0x20000034
 800113c:	08001161 	.word	0x08001161
 8001140:	08001241 	.word	0x08001241
 8001144:	20000484 	.word	0x20000484

08001148 <device_sleep>:
 8001148:	4b01      	ldr	r3, [pc, #4]	; (8001150 <device_sleep+0x8>)
 800114a:	22ff      	movs	r2, #255	; 0xff
 800114c:	701a      	strb	r2, [r3, #0]
 800114e:	4770      	bx	lr
 8001150:	20000030 	.word	0x20000030

08001154 <device_wake_up>:
 8001154:	4b01      	ldr	r3, [pc, #4]	; (800115c <device_wake_up+0x8>)
 8001156:	2200      	movs	r2, #0
 8001158:	701a      	strb	r2, [r3, #0]
 800115a:	4770      	bx	lr
 800115c:	20000030 	.word	0x20000030

08001160 <device_i2c_thread>:
 8001160:	b538      	push	{r3, r4, r5, lr}
 8001162:	2000      	movs	r0, #0
 8001164:	210a      	movs	r1, #10
 8001166:	f000 ffc9 	bl	80020fc <event_timer_set_period>
 800116a:	2501      	movs	r5, #1
 800116c:	2400      	movs	r4, #0
 800116e:	2c01      	cmp	r4, #1
 8001170:	d021      	beq.n	80011b6 <device_i2c_thread+0x56>
 8001172:	d30f      	bcc.n	8001194 <device_i2c_thread+0x34>
 8001174:	2c02      	cmp	r4, #2
 8001176:	d1fa      	bne.n	800116e <device_i2c_thread+0xe>
 8001178:	f7ff fa79 	bl	800066e <lsm9ds0_uninit>
 800117c:	f7ff fdd6 	bl	8000d2c <motors_uninit>
 8001180:	2064      	movs	r0, #100	; 0x64
 8001182:	f000 ffab 	bl	80020dc <timer_delay_ms>
 8001186:	4b12      	ldr	r3, [pc, #72]	; (80011d0 <device_i2c_thread+0x70>)
 8001188:	781c      	ldrb	r4, [r3, #0]
 800118a:	2c00      	cmp	r4, #0
 800118c:	bf14      	ite	ne
 800118e:	2402      	movne	r4, #2
 8001190:	2400      	moveq	r4, #0
 8001192:	e7ec      	b.n	800116e <device_i2c_thread+0xe>
 8001194:	f7ff fe3a 	bl	8000e0c <motors_init>
 8001198:	4628      	mov	r0, r5
 800119a:	f7ff fb43 	bl	8000824 <lsm9ds0_init>
 800119e:	4605      	mov	r5, r0
 80011a0:	b140      	cbz	r0, 80011b4 <device_i2c_thread+0x54>
 80011a2:	f7ff fa64 	bl	800066e <lsm9ds0_uninit>
 80011a6:	f7ff fdc1 	bl	8000d2c <motors_uninit>
 80011aa:	4629      	mov	r1, r5
 80011ac:	2002      	movs	r0, #2
 80011ae:	f000 f88d 	bl	80012cc <abort_error_>
 80011b2:	2500      	movs	r5, #0
 80011b4:	2401      	movs	r4, #1
 80011b6:	2000      	movs	r0, #0
 80011b8:	f000 ffb6 	bl	8002128 <event_timer_wait>
 80011bc:	f7ff fa6a 	bl	8000694 <lsm9ds0_read>
 80011c0:	f7ff fdc2 	bl	8000d48 <motors_update>
 80011c4:	4b02      	ldr	r3, [pc, #8]	; (80011d0 <device_i2c_thread+0x70>)
 80011c6:	781b      	ldrb	r3, [r3, #0]
 80011c8:	2b00      	cmp	r3, #0
 80011ca:	bf18      	it	ne
 80011cc:	2402      	movne	r4, #2
 80011ce:	e7ce      	b.n	800116e <device_i2c_thread+0xe>
 80011d0:	20000030 	.word	0x20000030

080011d4 <device_rgb_sensors_thread>:
 80011d4:	b510      	push	{r4, lr}
 80011d6:	2001      	movs	r0, #1
 80011d8:	210a      	movs	r1, #10
 80011da:	f000 ff8f 	bl	80020fc <event_timer_set_period>
 80011de:	2400      	movs	r4, #0
 80011e0:	2001      	movs	r0, #1
 80011e2:	f000 ffa1 	bl	8002128 <event_timer_wait>
 80011e6:	f7ff fc9f 	bl	8000b28 <rgb_sensor_read>
 80011ea:	2c01      	cmp	r4, #1
 80011ec:	d01a      	beq.n	8001224 <device_rgb_sensors_thread+0x50>
 80011ee:	d30d      	bcc.n	800120c <device_rgb_sensors_thread+0x38>
 80011f0:	2c02      	cmp	r4, #2
 80011f2:	d1f5      	bne.n	80011e0 <device_rgb_sensors_thread+0xc>
 80011f4:	f7ff fc8c 	bl	8000b10 <rgb_sensor_uninit>
 80011f8:	2064      	movs	r0, #100	; 0x64
 80011fa:	f000 ff6f 	bl	80020dc <timer_delay_ms>
 80011fe:	4b0f      	ldr	r3, [pc, #60]	; (800123c <device_rgb_sensors_thread+0x68>)
 8001200:	781c      	ldrb	r4, [r3, #0]
 8001202:	2c00      	cmp	r4, #0
 8001204:	bf14      	ite	ne
 8001206:	2402      	movne	r4, #2
 8001208:	2400      	moveq	r4, #0
 800120a:	e7e9      	b.n	80011e0 <device_rgb_sensors_thread+0xc>
 800120c:	f7ff fd40 	bl	8000c90 <rgb_sensor_init>
 8001210:	4604      	mov	r4, r0
 8001212:	b128      	cbz	r0, 8001220 <device_rgb_sensors_thread+0x4c>
 8001214:	f7ff fc7c 	bl	8000b10 <rgb_sensor_uninit>
 8001218:	2001      	movs	r0, #1
 800121a:	4621      	mov	r1, r4
 800121c:	f000 f856 	bl	80012cc <abort_error_>
 8001220:	2401      	movs	r4, #1
 8001222:	e7dd      	b.n	80011e0 <device_rgb_sensors_thread+0xc>
 8001224:	4620      	mov	r0, r4
 8001226:	f000 ff7f 	bl	8002128 <event_timer_wait>
 800122a:	f7ff fc7d 	bl	8000b28 <rgb_sensor_read>
 800122e:	4b03      	ldr	r3, [pc, #12]	; (800123c <device_rgb_sensors_thread+0x68>)
 8001230:	781b      	ldrb	r3, [r3, #0]
 8001232:	2b00      	cmp	r3, #0
 8001234:	d0f4      	beq.n	8001220 <device_rgb_sensors_thread+0x4c>
 8001236:	2402      	movs	r4, #2
 8001238:	e7d2      	b.n	80011e0 <device_rgb_sensors_thread+0xc>
 800123a:	bf00      	nop
 800123c:	20000030 	.word	0x20000030

08001240 <device_wifi_thread>:
 8001240:	b570      	push	{r4, r5, r6, lr}
 8001242:	4b1f      	ldr	r3, [pc, #124]	; (80012c0 <device_wifi_thread+0x80>)
 8001244:	b0a6      	sub	sp, #152	; 0x98
 8001246:	ac02      	add	r4, sp, #8
 8001248:	f103 0210 	add.w	r2, r3, #16
 800124c:	4626      	mov	r6, r4
 800124e:	6818      	ldr	r0, [r3, #0]
 8001250:	6859      	ldr	r1, [r3, #4]
 8001252:	4625      	mov	r5, r4
 8001254:	c503      	stmia	r5!, {r0, r1}
 8001256:	3308      	adds	r3, #8
 8001258:	4293      	cmp	r3, r2
 800125a:	462c      	mov	r4, r5
 800125c:	d1f7      	bne.n	800124e <device_wifi_thread+0xe>
 800125e:	4630      	mov	r0, r6
 8001260:	f7ff f8c1 	bl	80003e6 <strlen_>
 8001264:	2100      	movs	r1, #0
 8001266:	4605      	mov	r5, r0
 8001268:	2901      	cmp	r1, #1
 800126a:	d01c      	beq.n	80012a6 <device_wifi_thread+0x66>
 800126c:	d30d      	bcc.n	800128a <device_wifi_thread+0x4a>
 800126e:	2900      	cmp	r1, #0
 8001270:	d0fa      	beq.n	8001268 <device_wifi_thread+0x28>
 8001272:	f7ff fe69 	bl	8000f48 <esp8266_uninit>
 8001276:	2064      	movs	r0, #100	; 0x64
 8001278:	f000 ff30 	bl	80020dc <timer_delay_ms>
 800127c:	4b11      	ldr	r3, [pc, #68]	; (80012c4 <device_wifi_thread+0x84>)
 800127e:	7819      	ldrb	r1, [r3, #0]
 8001280:	2900      	cmp	r1, #0
 8001282:	bf14      	ite	ne
 8001284:	2102      	movne	r1, #2
 8001286:	2100      	moveq	r1, #0
 8001288:	e7ee      	b.n	8001268 <device_wifi_thread+0x28>
 800128a:	2001      	movs	r0, #1
 800128c:	f000 ffc2 	bl	8002214 <led_on>
 8001290:	2000      	movs	r0, #0
 8001292:	f7ff fe0d 	bl	8000eb0 <esp8266_init>
 8001296:	4604      	mov	r4, r0
 8001298:	b128      	cbz	r0, 80012a6 <device_wifi_thread+0x66>
 800129a:	f7ff fe55 	bl	8000f48 <esp8266_uninit>
 800129e:	2003      	movs	r0, #3
 80012a0:	4621      	mov	r1, r4
 80012a2:	f000 f813 	bl	80012cc <abort_error_>
 80012a6:	ab06      	add	r3, sp, #24
 80012a8:	9300      	str	r3, [sp, #0]
 80012aa:	2380      	movs	r3, #128	; 0x80
 80012ac:	9301      	str	r3, [sp, #4]
 80012ae:	f240 71da 	movw	r1, #2010	; 0x7da
 80012b2:	4632      	mov	r2, r6
 80012b4:	462b      	mov	r3, r5
 80012b6:	4804      	ldr	r0, [pc, #16]	; (80012c8 <device_wifi_thread+0x88>)
 80012b8:	f7ff fe72 	bl	8000fa0 <esp8266_connect>
 80012bc:	e7f3      	b.n	80012a6 <device_wifi_thread+0x66>
 80012be:	bf00      	nop
 80012c0:	08002464 	.word	0x08002464
 80012c4:	20000030 	.word	0x20000030
 80012c8:	08002458 	.word	0x08002458

080012cc <abort_error_>:
 80012cc:	b570      	push	{r4, r5, r6, lr}
 80012ce:	4605      	mov	r5, r0
 80012d0:	460e      	mov	r6, r1
 80012d2:	480d      	ldr	r0, [pc, #52]	; (8001308 <abort_error_+0x3c>)
 80012d4:	4629      	mov	r1, r5
 80012d6:	4632      	mov	r2, r6
 80012d8:	f7ff f906 	bl	80004e8 <printf_>
 80012dc:	2408      	movs	r4, #8
 80012de:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80012e2:	f000 ff97 	bl	8002214 <led_on>
 80012e6:	201e      	movs	r0, #30
 80012e8:	f000 fef8 	bl	80020dc <timer_delay_ms>
 80012ec:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80012f0:	f000 ffa6 	bl	8002240 <led_off>
 80012f4:	2046      	movs	r0, #70	; 0x46
 80012f6:	f000 fef1 	bl	80020dc <timer_delay_ms>
 80012fa:	3c01      	subs	r4, #1
 80012fc:	d1ef      	bne.n	80012de <abort_error_+0x12>
 80012fe:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8001302:	f000 feeb 	bl	80020dc <timer_delay_ms>
 8001306:	e7e4      	b.n	80012d2 <abort_error_+0x6>
 8001308:	08002474 	.word	0x08002474

0800130c <go_forward>:
 800130c:	b570      	push	{r4, r5, r6, lr}
 800130e:	ed2d 8b06 	vpush	{d8-d10}
 8001312:	4606      	mov	r6, r0
 8001314:	460d      	mov	r5, r1
 8001316:	4614      	mov	r4, r2
 8001318:	f000 fed2 	bl	80020c0 <timer_get_time>
 800131c:	ed9f 8a3a 	vldr	s16, [pc, #232]	; 8001408 <go_forward+0xfc>
 8001320:	eddf 7a3a 	vldr	s15, [pc, #232]	; 800140c <go_forward+0x100>
 8001324:	ed9f aa3a 	vldr	s20, [pc, #232]	; 8001410 <go_forward+0x104>
 8001328:	2d00      	cmp	r5, #0
 800132a:	4406      	add	r6, r0
 800132c:	bfc8      	it	gt
 800132e:	eeb0 aa67 	vmovgt.f32	s20, s15
 8001332:	eef0 8a48 	vmov.f32	s17, s16
 8001336:	eef0 9a48 	vmov.f32	s19, s16
 800133a:	eef0 aa48 	vmov.f32	s21, s16
 800133e:	f000 febf 	bl	80020c0 <timer_get_time>
 8001342:	42b0      	cmp	r0, r6
 8001344:	d251      	bcs.n	80013ea <go_forward+0xde>
 8001346:	2000      	movs	r0, #0
 8001348:	f000 feee 	bl	8002128 <event_timer_wait>
 800134c:	4b31      	ldr	r3, [pc, #196]	; (8001414 <go_forward+0x108>)
 800134e:	8b9b      	ldrh	r3, [r3, #28]
 8001350:	b21b      	sxth	r3, r3
 8001352:	ee06 3a90 	vmov	s13, r3
 8001356:	eeb8 7ae6 	vcvt.f32.s32	s14, s13
 800135a:	eddf 6a2f 	vldr	s13, [pc, #188]	; 8001418 <go_forward+0x10c>
 800135e:	eddf 7a2f 	vldr	s15, [pc, #188]	; 800141c <go_forward+0x110>
 8001362:	ee27 7a26 	vmul.f32	s14, s14, s13
 8001366:	eeb0 6a66 	vmov.f32	s12, s13
 800136a:	ee47 8a27 	vmla.f32	s17, s14, s15
 800136e:	ed9f 7a2c 	vldr	s14, [pc, #176]	; 8001420 <go_forward+0x114>
 8001372:	ee3a 9ae8 	vsub.f32	s18, s21, s17
 8001376:	ee79 7a69 	vsub.f32	s15, s18, s19
 800137a:	ee49 7a07 	vmla.f32	s15, s18, s14
 800137e:	ed9f 7a23 	vldr	s14, [pc, #140]	; 800140c <go_forward+0x100>
 8001382:	eef4 7ac7 	vcmpe.f32	s15, s14
 8001386:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800138a:	dc09      	bgt.n	80013a0 <go_forward+0x94>
 800138c:	eddf 6a20 	vldr	s13, [pc, #128]	; 8001410 <go_forward+0x104>
 8001390:	eef4 7a66 	vcmp.f32	s15, s13
 8001394:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001398:	bf48      	it	mi
 800139a:	eef0 7a66 	vmovmi.f32	s15, s13
 800139e:	e001      	b.n	80013a4 <go_forward+0x98>
 80013a0:	eef0 7a47 	vmov.f32	s15, s14
 80013a4:	ee06 5a90 	vmov	s13, r5
 80013a8:	eeb4 8ac7 	vcmpe.f32	s16, s14
 80013ac:	eeb8 7ae6 	vcvt.f32.s32	s14, s13
 80013b0:	eddf 6a1c 	vldr	s13, [pc, #112]	; 8001424 <go_forward+0x118>
 80013b4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80013b8:	ee67 7aa6 	vmul.f32	s15, s15, s13
 80013bc:	bf48      	it	mi
 80013be:	ee38 8a06 	vaddmi.f32	s16, s16, s12
 80013c2:	ee67 7a8a 	vmul.f32	s15, s15, s20
 80013c6:	ee27 7a08 	vmul.f32	s14, s14, s16
 80013ca:	4b17      	ldr	r3, [pc, #92]	; (8001428 <go_forward+0x11c>)
 80013cc:	ee77 6a27 	vadd.f32	s13, s14, s15
 80013d0:	ee77 7a67 	vsub.f32	s15, s14, s15
 80013d4:	eefd 6ae6 	vcvt.s32.f32	s13, s13
 80013d8:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 80013dc:	edc3 6a00 	vstr	s13, [r3]
 80013e0:	edc3 7a01 	vstr	s15, [r3, #4]
 80013e4:	b164      	cbz	r4, 8001400 <go_forward+0xf4>
 80013e6:	47a0      	blx	r4
 80013e8:	b950      	cbnz	r0, 8001400 <go_forward+0xf4>
 80013ea:	ecbd 8b06 	vpop	{d8-d10}
 80013ee:	4b0e      	ldr	r3, [pc, #56]	; (8001428 <go_forward+0x11c>)
 80013f0:	2200      	movs	r2, #0
 80013f2:	2064      	movs	r0, #100	; 0x64
 80013f4:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80013f8:	601a      	str	r2, [r3, #0]
 80013fa:	605a      	str	r2, [r3, #4]
 80013fc:	f000 be6e 	b.w	80020dc <timer_delay_ms>
 8001400:	eef0 9a49 	vmov.f32	s19, s18
 8001404:	e79b      	b.n	800133e <go_forward+0x32>
 8001406:	bf00      	nop
 8001408:	00000000 	.word	0x00000000
 800140c:	3f800000 	.word	0x3f800000
 8001410:	bf800000 	.word	0xbf800000
 8001414:	20000234 	.word	0x20000234
 8001418:	3c23d70a 	.word	0x3c23d70a
 800141c:	399d4952 	.word	0x399d4952
 8001420:	3f000000 	.word	0x3f000000
 8001424:	42300000 	.word	0x42300000
 8001428:	2000047c 	.word	0x2000047c

0800142c <go_forward_test>:
 800142c:	b508      	push	{r3, lr}
 800142e:	4807      	ldr	r0, [pc, #28]	; (800144c <go_forward_test+0x20>)
 8001430:	212c      	movs	r1, #44	; 0x2c
 8001432:	2200      	movs	r2, #0
 8001434:	f7ff ff6a 	bl	800130c <go_forward>
 8001438:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 800143c:	f06f 012b 	mvn.w	r1, #43	; 0x2b
 8001440:	2200      	movs	r2, #0
 8001442:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001446:	f7ff bf61 	b.w	800130c <go_forward>
 800144a:	bf00      	nop
 800144c:	000f4240 	.word	0x000f4240

08001450 <uart_write>:
 8001450:	4b03      	ldr	r3, [pc, #12]	; (8001460 <uart_write+0x10>)
 8001452:	69da      	ldr	r2, [r3, #28]
 8001454:	0612      	lsls	r2, r2, #24
 8001456:	d401      	bmi.n	800145c <uart_write+0xc>
 8001458:	bf00      	nop
 800145a:	e7f9      	b.n	8001450 <uart_write>
 800145c:	8518      	strh	r0, [r3, #40]	; 0x28
 800145e:	4770      	bx	lr
 8001460:	40013800 	.word	0x40013800

08001464 <uart_is_char>:
 8001464:	4b0a      	ldr	r3, [pc, #40]	; (8001490 <uart_is_char+0x2c>)
 8001466:	4a0b      	ldr	r2, [pc, #44]	; (8001494 <uart_is_char+0x30>)
 8001468:	6819      	ldr	r1, [r3, #0]
 800146a:	6812      	ldr	r2, [r2, #0]
 800146c:	4291      	cmp	r1, r2
 800146e:	d00c      	beq.n	800148a <uart_is_char+0x26>
 8001470:	681a      	ldr	r2, [r3, #0]
 8001472:	4909      	ldr	r1, [pc, #36]	; (8001498 <uart_is_char+0x34>)
 8001474:	5c88      	ldrb	r0, [r1, r2]
 8001476:	681a      	ldr	r2, [r3, #0]
 8001478:	3201      	adds	r2, #1
 800147a:	601a      	str	r2, [r3, #0]
 800147c:	681a      	ldr	r2, [r3, #0]
 800147e:	2a0f      	cmp	r2, #15
 8001480:	b2c0      	uxtb	r0, r0
 8001482:	d904      	bls.n	800148e <uart_is_char+0x2a>
 8001484:	2200      	movs	r2, #0
 8001486:	601a      	str	r2, [r3, #0]
 8001488:	4770      	bx	lr
 800148a:	f64f 70ff 	movw	r0, #65535	; 0xffff
 800148e:	4770      	bx	lr
 8001490:	200009d0 	.word	0x200009d0
 8001494:	200009cc 	.word	0x200009cc
 8001498:	200009bc 	.word	0x200009bc

0800149c <uart_read>:
 800149c:	b508      	push	{r3, lr}
 800149e:	f7ff ffe1 	bl	8001464 <uart_is_char>
 80014a2:	f64f 73ff 	movw	r3, #65535	; 0xffff
 80014a6:	4298      	cmp	r0, r3
 80014a8:	d101      	bne.n	80014ae <uart_read+0x12>
 80014aa:	bf00      	nop
 80014ac:	e7f7      	b.n	800149e <uart_read+0x2>
 80014ae:	b2c0      	uxtb	r0, r0
 80014b0:	bd08      	pop	{r3, pc}
	...

080014b4 <uart_init>:
 80014b4:	b530      	push	{r4, r5, lr}
 80014b6:	4b2c      	ldr	r3, [pc, #176]	; (8001568 <uart_init+0xb4>)
 80014b8:	4d2c      	ldr	r5, [pc, #176]	; (800156c <uart_init+0xb8>)
 80014ba:	2400      	movs	r4, #0
 80014bc:	601c      	str	r4, [r3, #0]
 80014be:	4b2c      	ldr	r3, [pc, #176]	; (8001570 <uart_init+0xbc>)
 80014c0:	b08b      	sub	sp, #44	; 0x2c
 80014c2:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80014c6:	2101      	movs	r1, #1
 80014c8:	601c      	str	r4, [r3, #0]
 80014ca:	f000 fcf3 	bl	8001eb4 <RCC_AHBPeriphClockCmd>
 80014ce:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 80014d2:	2101      	movs	r1, #1
 80014d4:	f000 fcfc 	bl	8001ed0 <RCC_APB2PeriphClockCmd>
 80014d8:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 80014dc:	9302      	str	r3, [sp, #8]
 80014de:	2302      	movs	r3, #2
 80014e0:	f88d 300c 	strb.w	r3, [sp, #12]
 80014e4:	a902      	add	r1, sp, #8
 80014e6:	2303      	movs	r3, #3
 80014e8:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80014ec:	f88d 300d 	strb.w	r3, [sp, #13]
 80014f0:	f88d 400e 	strb.w	r4, [sp, #14]
 80014f4:	f88d 400f 	strb.w	r4, [sp, #15]
 80014f8:	f000 fe28 	bl	800214c <GPIO_Init>
 80014fc:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001500:	2109      	movs	r1, #9
 8001502:	2207      	movs	r2, #7
 8001504:	f000 fe70 	bl	80021e8 <GPIO_PinAFConfig>
 8001508:	2207      	movs	r2, #7
 800150a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800150e:	210a      	movs	r1, #10
 8001510:	f000 fe6a 	bl	80021e8 <GPIO_PinAFConfig>
 8001514:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001518:	9304      	str	r3, [sp, #16]
 800151a:	4628      	mov	r0, r5
 800151c:	230c      	movs	r3, #12
 800151e:	a904      	add	r1, sp, #16
 8001520:	9308      	str	r3, [sp, #32]
 8001522:	9405      	str	r4, [sp, #20]
 8001524:	9406      	str	r4, [sp, #24]
 8001526:	9407      	str	r4, [sp, #28]
 8001528:	9409      	str	r4, [sp, #36]	; 0x24
 800152a:	f000 f855 	bl	80015d8 <USART_Init>
 800152e:	4628      	mov	r0, r5
 8001530:	2101      	movs	r1, #1
 8001532:	f000 f8b3 	bl	800169c <USART_Cmd>
 8001536:	2201      	movs	r2, #1
 8001538:	4628      	mov	r0, r5
 800153a:	490e      	ldr	r1, [pc, #56]	; (8001574 <uart_init+0xc0>)
 800153c:	f000 f8be 	bl	80016bc <USART_ITConfig>
 8001540:	2325      	movs	r3, #37	; 0x25
 8001542:	f88d 4005 	strb.w	r4, [sp, #5]
 8001546:	f88d 4006 	strb.w	r4, [sp, #6]
 800154a:	a801      	add	r0, sp, #4
 800154c:	2401      	movs	r4, #1
 800154e:	f88d 3004 	strb.w	r3, [sp, #4]
 8001552:	f88d 4007 	strb.w	r4, [sp, #7]
 8001556:	f000 f8ff 	bl	8001758 <NVIC_Init>
 800155a:	4628      	mov	r0, r5
 800155c:	4621      	mov	r1, r4
 800155e:	f000 f89d 	bl	800169c <USART_Cmd>
 8001562:	b00b      	add	sp, #44	; 0x2c
 8001564:	bd30      	pop	{r4, r5, pc}
 8001566:	bf00      	nop
 8001568:	200009cc 	.word	0x200009cc
 800156c:	40013800 	.word	0x40013800
 8001570:	200009d0 	.word	0x200009d0
 8001574:	00050105 	.word	0x00050105

08001578 <USART1_IRQHandler>:
 8001578:	b508      	push	{r3, lr}
 800157a:	480d      	ldr	r0, [pc, #52]	; (80015b0 <USART1_IRQHandler+0x38>)
 800157c:	490d      	ldr	r1, [pc, #52]	; (80015b4 <USART1_IRQHandler+0x3c>)
 800157e:	f000 f8b6 	bl	80016ee <USART_GetITStatus>
 8001582:	b178      	cbz	r0, 80015a4 <USART1_IRQHandler+0x2c>
 8001584:	480a      	ldr	r0, [pc, #40]	; (80015b0 <USART1_IRQHandler+0x38>)
 8001586:	f000 f894 	bl	80016b2 <USART_ReceiveData>
 800158a:	4b0b      	ldr	r3, [pc, #44]	; (80015b8 <USART1_IRQHandler+0x40>)
 800158c:	490b      	ldr	r1, [pc, #44]	; (80015bc <USART1_IRQHandler+0x44>)
 800158e:	681a      	ldr	r2, [r3, #0]
 8001590:	b2c0      	uxtb	r0, r0
 8001592:	5488      	strb	r0, [r1, r2]
 8001594:	681a      	ldr	r2, [r3, #0]
 8001596:	3201      	adds	r2, #1
 8001598:	601a      	str	r2, [r3, #0]
 800159a:	681a      	ldr	r2, [r3, #0]
 800159c:	2a0f      	cmp	r2, #15
 800159e:	bf84      	itt	hi
 80015a0:	2200      	movhi	r2, #0
 80015a2:	601a      	strhi	r2, [r3, #0]
 80015a4:	4802      	ldr	r0, [pc, #8]	; (80015b0 <USART1_IRQHandler+0x38>)
 80015a6:	4903      	ldr	r1, [pc, #12]	; (80015b4 <USART1_IRQHandler+0x3c>)
 80015a8:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80015ac:	f000 b8be 	b.w	800172c <USART_ClearITPendingBit>
 80015b0:	40013800 	.word	0x40013800
 80015b4:	00050105 	.word	0x00050105
 80015b8:	200009cc 	.word	0x200009cc
 80015bc:	200009bc 	.word	0x200009bc

080015c0 <uart_clear_buffer>:
 80015c0:	b672      	cpsid	i
 80015c2:	2300      	movs	r3, #0
 80015c4:	4a03      	ldr	r2, [pc, #12]	; (80015d4 <uart_clear_buffer+0x14>)
 80015c6:	2100      	movs	r1, #0
 80015c8:	54d1      	strb	r1, [r2, r3]
 80015ca:	3301      	adds	r3, #1
 80015cc:	2b10      	cmp	r3, #16
 80015ce:	d1f9      	bne.n	80015c4 <uart_clear_buffer+0x4>
 80015d0:	b662      	cpsie	i
 80015d2:	4770      	bx	lr
 80015d4:	200009bc 	.word	0x200009bc

080015d8 <USART_Init>:
 80015d8:	b530      	push	{r4, r5, lr}
 80015da:	4604      	mov	r4, r0
 80015dc:	b099      	sub	sp, #100	; 0x64
 80015de:	460d      	mov	r5, r1
 80015e0:	bf00      	nop
 80015e2:	bf00      	nop
 80015e4:	bf00      	nop
 80015e6:	bf00      	nop
 80015e8:	bf00      	nop
 80015ea:	bf00      	nop
 80015ec:	bf00      	nop
 80015ee:	6803      	ldr	r3, [r0, #0]
 80015f0:	f023 0301 	bic.w	r3, r3, #1
 80015f4:	6003      	str	r3, [r0, #0]
 80015f6:	6842      	ldr	r2, [r0, #4]
 80015f8:	688b      	ldr	r3, [r1, #8]
 80015fa:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 80015fe:	4313      	orrs	r3, r2
 8001600:	6043      	str	r3, [r0, #4]
 8001602:	686a      	ldr	r2, [r5, #4]
 8001604:	68eb      	ldr	r3, [r5, #12]
 8001606:	6801      	ldr	r1, [r0, #0]
 8001608:	431a      	orrs	r2, r3
 800160a:	692b      	ldr	r3, [r5, #16]
 800160c:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 8001610:	f021 010c 	bic.w	r1, r1, #12
 8001614:	4313      	orrs	r3, r2
 8001616:	430b      	orrs	r3, r1
 8001618:	6003      	str	r3, [r0, #0]
 800161a:	6882      	ldr	r2, [r0, #8]
 800161c:	696b      	ldr	r3, [r5, #20]
 800161e:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 8001622:	4313      	orrs	r3, r2
 8001624:	6083      	str	r3, [r0, #8]
 8001626:	a801      	add	r0, sp, #4
 8001628:	f000 fab8 	bl	8001b9c <RCC_GetClocksFreq>
 800162c:	4b17      	ldr	r3, [pc, #92]	; (800168c <USART_Init+0xb4>)
 800162e:	429c      	cmp	r4, r3
 8001630:	d101      	bne.n	8001636 <USART_Init+0x5e>
 8001632:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 8001634:	e00e      	b.n	8001654 <USART_Init+0x7c>
 8001636:	4b16      	ldr	r3, [pc, #88]	; (8001690 <USART_Init+0xb8>)
 8001638:	429c      	cmp	r4, r3
 800163a:	d101      	bne.n	8001640 <USART_Init+0x68>
 800163c:	9a10      	ldr	r2, [sp, #64]	; 0x40
 800163e:	e009      	b.n	8001654 <USART_Init+0x7c>
 8001640:	4b14      	ldr	r3, [pc, #80]	; (8001694 <USART_Init+0xbc>)
 8001642:	429c      	cmp	r4, r3
 8001644:	d101      	bne.n	800164a <USART_Init+0x72>
 8001646:	9a11      	ldr	r2, [sp, #68]	; 0x44
 8001648:	e004      	b.n	8001654 <USART_Init+0x7c>
 800164a:	4b13      	ldr	r3, [pc, #76]	; (8001698 <USART_Init+0xc0>)
 800164c:	429c      	cmp	r4, r3
 800164e:	bf0c      	ite	eq
 8001650:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 8001652:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 8001654:	6823      	ldr	r3, [r4, #0]
 8001656:	6829      	ldr	r1, [r5, #0]
 8001658:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 800165c:	bf18      	it	ne
 800165e:	0052      	lslne	r2, r2, #1
 8001660:	fbb2 f3f1 	udiv	r3, r2, r1
 8001664:	fb01 2213 	mls	r2, r1, r3, r2
 8001668:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 800166c:	6822      	ldr	r2, [r4, #0]
 800166e:	bf28      	it	cs
 8001670:	3301      	addcs	r3, #1
 8001672:	0412      	lsls	r2, r2, #16
 8001674:	d506      	bpl.n	8001684 <USART_Init+0xac>
 8001676:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 800167a:	f3c3 0142 	ubfx	r1, r3, #1, #3
 800167e:	401a      	ands	r2, r3
 8001680:	ea41 0302 	orr.w	r3, r1, r2
 8001684:	b29b      	uxth	r3, r3
 8001686:	81a3      	strh	r3, [r4, #12]
 8001688:	b019      	add	sp, #100	; 0x64
 800168a:	bd30      	pop	{r4, r5, pc}
 800168c:	40013800 	.word	0x40013800
 8001690:	40004400 	.word	0x40004400
 8001694:	40004800 	.word	0x40004800
 8001698:	40004c00 	.word	0x40004c00

0800169c <USART_Cmd>:
 800169c:	bf00      	nop
 800169e:	bf00      	nop
 80016a0:	6803      	ldr	r3, [r0, #0]
 80016a2:	b111      	cbz	r1, 80016aa <USART_Cmd+0xe>
 80016a4:	f043 0301 	orr.w	r3, r3, #1
 80016a8:	e001      	b.n	80016ae <USART_Cmd+0x12>
 80016aa:	f023 0301 	bic.w	r3, r3, #1
 80016ae:	6003      	str	r3, [r0, #0]
 80016b0:	4770      	bx	lr

080016b2 <USART_ReceiveData>:
 80016b2:	bf00      	nop
 80016b4:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 80016b6:	f3c0 0008 	ubfx	r0, r0, #0, #9
 80016ba:	4770      	bx	lr

080016bc <USART_ITConfig>:
 80016bc:	b510      	push	{r4, lr}
 80016be:	bf00      	nop
 80016c0:	bf00      	nop
 80016c2:	bf00      	nop
 80016c4:	f3c1 2307 	ubfx	r3, r1, #8, #8
 80016c8:	2401      	movs	r4, #1
 80016ca:	b2c9      	uxtb	r1, r1
 80016cc:	2b02      	cmp	r3, #2
 80016ce:	fa04 f101 	lsl.w	r1, r4, r1
 80016d2:	d101      	bne.n	80016d8 <USART_ITConfig+0x1c>
 80016d4:	3004      	adds	r0, #4
 80016d6:	e002      	b.n	80016de <USART_ITConfig+0x22>
 80016d8:	2b03      	cmp	r3, #3
 80016da:	bf08      	it	eq
 80016dc:	3008      	addeq	r0, #8
 80016de:	6803      	ldr	r3, [r0, #0]
 80016e0:	b10a      	cbz	r2, 80016e6 <USART_ITConfig+0x2a>
 80016e2:	4319      	orrs	r1, r3
 80016e4:	e001      	b.n	80016ea <USART_ITConfig+0x2e>
 80016e6:	ea23 0101 	bic.w	r1, r3, r1
 80016ea:	6001      	str	r1, [r0, #0]
 80016ec:	bd10      	pop	{r4, pc}

080016ee <USART_GetITStatus>:
 80016ee:	b510      	push	{r4, lr}
 80016f0:	bf00      	nop
 80016f2:	bf00      	nop
 80016f4:	2401      	movs	r4, #1
 80016f6:	f3c1 2207 	ubfx	r2, r1, #8, #8
 80016fa:	b2cb      	uxtb	r3, r1
 80016fc:	42a2      	cmp	r2, r4
 80016fe:	fa04 f303 	lsl.w	r3, r4, r3
 8001702:	d101      	bne.n	8001708 <USART_GetITStatus+0x1a>
 8001704:	6802      	ldr	r2, [r0, #0]
 8001706:	e003      	b.n	8001710 <USART_GetITStatus+0x22>
 8001708:	2a02      	cmp	r2, #2
 800170a:	bf0c      	ite	eq
 800170c:	6842      	ldreq	r2, [r0, #4]
 800170e:	6882      	ldrne	r2, [r0, #8]
 8001710:	4013      	ands	r3, r2
 8001712:	69c2      	ldr	r2, [r0, #28]
 8001714:	b143      	cbz	r3, 8001728 <USART_GetITStatus+0x3a>
 8001716:	2301      	movs	r3, #1
 8001718:	0c09      	lsrs	r1, r1, #16
 800171a:	fa03 f101 	lsl.w	r1, r3, r1
 800171e:	4211      	tst	r1, r2
 8001720:	bf0c      	ite	eq
 8001722:	2000      	moveq	r0, #0
 8001724:	2001      	movne	r0, #1
 8001726:	bd10      	pop	{r4, pc}
 8001728:	4618      	mov	r0, r3
 800172a:	bd10      	pop	{r4, pc}

0800172c <USART_ClearITPendingBit>:
 800172c:	bf00      	nop
 800172e:	bf00      	nop
 8001730:	2301      	movs	r3, #1
 8001732:	0c09      	lsrs	r1, r1, #16
 8001734:	fa03 f101 	lsl.w	r1, r3, r1
 8001738:	6201      	str	r1, [r0, #32]
 800173a:	4770      	bx	lr

0800173c <lib_low_level_init>:
 800173c:	b508      	push	{r3, lr}
 800173e:	f000 f9a9 	bl	8001a94 <sytem_clock_init>
 8001742:	f000 fd93 	bl	800226c <gpio_init>
 8001746:	f7ff feb5 	bl	80014b4 <uart_init>
 800174a:	f000 fc41 	bl	8001fd0 <timer_init>
 800174e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001752:	f000 b88f 	b.w	8001874 <i2c_0_init>
	...

08001758 <NVIC_Init>:
 8001758:	b510      	push	{r4, lr}
 800175a:	bf00      	nop
 800175c:	bf00      	nop
 800175e:	bf00      	nop
 8001760:	78c2      	ldrb	r2, [r0, #3]
 8001762:	7803      	ldrb	r3, [r0, #0]
 8001764:	b30a      	cbz	r2, 80017aa <NVIC_Init+0x52>
 8001766:	4a16      	ldr	r2, [pc, #88]	; (80017c0 <NVIC_Init+0x68>)
 8001768:	7844      	ldrb	r4, [r0, #1]
 800176a:	68d2      	ldr	r2, [r2, #12]
 800176c:	43d2      	mvns	r2, r2
 800176e:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001772:	f1c2 0104 	rsb	r1, r2, #4
 8001776:	b2c9      	uxtb	r1, r1
 8001778:	fa04 f101 	lsl.w	r1, r4, r1
 800177c:	240f      	movs	r4, #15
 800177e:	fa44 f202 	asr.w	r2, r4, r2
 8001782:	7884      	ldrb	r4, [r0, #2]
 8001784:	b2c9      	uxtb	r1, r1
 8001786:	4022      	ands	r2, r4
 8001788:	430a      	orrs	r2, r1
 800178a:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 800178e:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001792:	0112      	lsls	r2, r2, #4
 8001794:	b2d2      	uxtb	r2, r2
 8001796:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 800179a:	7803      	ldrb	r3, [r0, #0]
 800179c:	2201      	movs	r2, #1
 800179e:	0959      	lsrs	r1, r3, #5
 80017a0:	f003 031f 	and.w	r3, r3, #31
 80017a4:	fa02 f303 	lsl.w	r3, r2, r3
 80017a8:	e006      	b.n	80017b8 <NVIC_Init+0x60>
 80017aa:	0959      	lsrs	r1, r3, #5
 80017ac:	2201      	movs	r2, #1
 80017ae:	f003 031f 	and.w	r3, r3, #31
 80017b2:	fa02 f303 	lsl.w	r3, r2, r3
 80017b6:	3120      	adds	r1, #32
 80017b8:	4a02      	ldr	r2, [pc, #8]	; (80017c4 <NVIC_Init+0x6c>)
 80017ba:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 80017be:	bd10      	pop	{r4, pc}
 80017c0:	e000ed00 	.word	0xe000ed00
 80017c4:	e000e100 	.word	0xe000e100

080017c8 <i2c_delay>:
 80017c8:	bf00      	nop
 80017ca:	4770      	bx	lr

080017cc <SetLowSDA>:
 80017cc:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80017ce:	4d0d      	ldr	r5, [pc, #52]	; (8001804 <SetLowSDA+0x38>)
 80017d0:	2301      	movs	r3, #1
 80017d2:	2203      	movs	r2, #3
 80017d4:	2480      	movs	r4, #128	; 0x80
 80017d6:	f88d 3004 	strb.w	r3, [sp, #4]
 80017da:	f88d 3006 	strb.w	r3, [sp, #6]
 80017de:	4628      	mov	r0, r5
 80017e0:	2300      	movs	r3, #0
 80017e2:	4669      	mov	r1, sp
 80017e4:	f88d 2005 	strb.w	r2, [sp, #5]
 80017e8:	f88d 3007 	strb.w	r3, [sp, #7]
 80017ec:	9400      	str	r4, [sp, #0]
 80017ee:	f000 fcad 	bl	800214c <GPIO_Init>
 80017f2:	4628      	mov	r0, r5
 80017f4:	4621      	mov	r1, r4
 80017f6:	f000 fcf3 	bl	80021e0 <GPIO_ResetBits>
 80017fa:	f7ff ffe5 	bl	80017c8 <i2c_delay>
 80017fe:	b003      	add	sp, #12
 8001800:	bd30      	pop	{r4, r5, pc}
 8001802:	bf00      	nop
 8001804:	48000400 	.word	0x48000400

08001808 <SetHighSDA>:
 8001808:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800180a:	4d0d      	ldr	r5, [pc, #52]	; (8001840 <SetHighSDA+0x38>)
 800180c:	2203      	movs	r2, #3
 800180e:	2300      	movs	r3, #0
 8001810:	2480      	movs	r4, #128	; 0x80
 8001812:	f88d 2005 	strb.w	r2, [sp, #5]
 8001816:	4628      	mov	r0, r5
 8001818:	2201      	movs	r2, #1
 800181a:	4669      	mov	r1, sp
 800181c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001820:	f88d 2006 	strb.w	r2, [sp, #6]
 8001824:	f88d 3007 	strb.w	r3, [sp, #7]
 8001828:	9400      	str	r4, [sp, #0]
 800182a:	f000 fc8f 	bl	800214c <GPIO_Init>
 800182e:	4628      	mov	r0, r5
 8001830:	4621      	mov	r1, r4
 8001832:	f000 fcd1 	bl	80021d8 <GPIO_SetBits>
 8001836:	f7ff ffc7 	bl	80017c8 <i2c_delay>
 800183a:	b003      	add	sp, #12
 800183c:	bd30      	pop	{r4, r5, pc}
 800183e:	bf00      	nop
 8001840:	48000400 	.word	0x48000400

08001844 <SetLowSCL>:
 8001844:	b508      	push	{r3, lr}
 8001846:	4804      	ldr	r0, [pc, #16]	; (8001858 <SetLowSCL+0x14>)
 8001848:	2140      	movs	r1, #64	; 0x40
 800184a:	f000 fcc9 	bl	80021e0 <GPIO_ResetBits>
 800184e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001852:	f7ff bfb9 	b.w	80017c8 <i2c_delay>
 8001856:	bf00      	nop
 8001858:	48000400 	.word	0x48000400

0800185c <SetHighSCL>:
 800185c:	b508      	push	{r3, lr}
 800185e:	4804      	ldr	r0, [pc, #16]	; (8001870 <SetHighSCL+0x14>)
 8001860:	2140      	movs	r1, #64	; 0x40
 8001862:	f000 fcb9 	bl	80021d8 <GPIO_SetBits>
 8001866:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800186a:	f7ff bfad 	b.w	80017c8 <i2c_delay>
 800186e:	bf00      	nop
 8001870:	48000400 	.word	0x48000400

08001874 <i2c_0_init>:
 8001874:	b507      	push	{r0, r1, r2, lr}
 8001876:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 800187a:	2101      	movs	r1, #1
 800187c:	f000 fb1a 	bl	8001eb4 <RCC_AHBPeriphClockCmd>
 8001880:	23c0      	movs	r3, #192	; 0xc0
 8001882:	9300      	str	r3, [sp, #0]
 8001884:	2301      	movs	r3, #1
 8001886:	2203      	movs	r2, #3
 8001888:	480a      	ldr	r0, [pc, #40]	; (80018b4 <i2c_0_init+0x40>)
 800188a:	f88d 3004 	strb.w	r3, [sp, #4]
 800188e:	4669      	mov	r1, sp
 8001890:	f88d 3006 	strb.w	r3, [sp, #6]
 8001894:	2300      	movs	r3, #0
 8001896:	f88d 2005 	strb.w	r2, [sp, #5]
 800189a:	f88d 3007 	strb.w	r3, [sp, #7]
 800189e:	f000 fc55 	bl	800214c <GPIO_Init>
 80018a2:	f7ff ffdb 	bl	800185c <SetHighSCL>
 80018a6:	f7ff ff91 	bl	80017cc <SetLowSDA>
 80018aa:	f7ff ffad 	bl	8001808 <SetHighSDA>
 80018ae:	b003      	add	sp, #12
 80018b0:	f85d fb04 	ldr.w	pc, [sp], #4
 80018b4:	48000400 	.word	0x48000400

080018b8 <i2cStart>:
 80018b8:	b508      	push	{r3, lr}
 80018ba:	f7ff ffcf 	bl	800185c <SetHighSCL>
 80018be:	f7ff ffa3 	bl	8001808 <SetHighSDA>
 80018c2:	f7ff ffcb 	bl	800185c <SetHighSCL>
 80018c6:	f7ff ff81 	bl	80017cc <SetLowSDA>
 80018ca:	f7ff ffbb 	bl	8001844 <SetLowSCL>
 80018ce:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80018d2:	f7ff bf99 	b.w	8001808 <SetHighSDA>

080018d6 <i2cStop>:
 80018d6:	b508      	push	{r3, lr}
 80018d8:	f7ff ffb4 	bl	8001844 <SetLowSCL>
 80018dc:	f7ff ff76 	bl	80017cc <SetLowSDA>
 80018e0:	f7ff ffbc 	bl	800185c <SetHighSCL>
 80018e4:	f7ff ff72 	bl	80017cc <SetLowSDA>
 80018e8:	f7ff ffb8 	bl	800185c <SetHighSCL>
 80018ec:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80018f0:	f7ff bf8a 	b.w	8001808 <SetHighSDA>

080018f4 <i2cWrite>:
 80018f4:	b538      	push	{r3, r4, r5, lr}
 80018f6:	4604      	mov	r4, r0
 80018f8:	2508      	movs	r5, #8
 80018fa:	f7ff ffa3 	bl	8001844 <SetLowSCL>
 80018fe:	0623      	lsls	r3, r4, #24
 8001900:	d502      	bpl.n	8001908 <i2cWrite+0x14>
 8001902:	f7ff ff81 	bl	8001808 <SetHighSDA>
 8001906:	e001      	b.n	800190c <i2cWrite+0x18>
 8001908:	f7ff ff60 	bl	80017cc <SetLowSDA>
 800190c:	3d01      	subs	r5, #1
 800190e:	f7ff ffa5 	bl	800185c <SetHighSCL>
 8001912:	0064      	lsls	r4, r4, #1
 8001914:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001918:	b2e4      	uxtb	r4, r4
 800191a:	d1ee      	bne.n	80018fa <i2cWrite+0x6>
 800191c:	f7ff ff92 	bl	8001844 <SetLowSCL>
 8001920:	f7ff ff72 	bl	8001808 <SetHighSDA>
 8001924:	f7ff ff9a 	bl	800185c <SetHighSCL>
 8001928:	4b05      	ldr	r3, [pc, #20]	; (8001940 <i2cWrite+0x4c>)
 800192a:	8a1c      	ldrh	r4, [r3, #16]
 800192c:	b2a4      	uxth	r4, r4
 800192e:	f7ff ff89 	bl	8001844 <SetLowSCL>
 8001932:	f7ff ff49 	bl	80017c8 <i2c_delay>
 8001936:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 800193a:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 800193e:	bd38      	pop	{r3, r4, r5, pc}
 8001940:	48000400 	.word	0x48000400

08001944 <i2cRead>:
 8001944:	b570      	push	{r4, r5, r6, lr}
 8001946:	4606      	mov	r6, r0
 8001948:	f7ff ff7c 	bl	8001844 <SetLowSCL>
 800194c:	f7ff ff5c 	bl	8001808 <SetHighSDA>
 8001950:	2508      	movs	r5, #8
 8001952:	2400      	movs	r4, #0
 8001954:	f7ff ff82 	bl	800185c <SetHighSCL>
 8001958:	4b0d      	ldr	r3, [pc, #52]	; (8001990 <i2cRead+0x4c>)
 800195a:	8a1b      	ldrh	r3, [r3, #16]
 800195c:	0064      	lsls	r4, r4, #1
 800195e:	061a      	lsls	r2, r3, #24
 8001960:	b2e4      	uxtb	r4, r4
 8001962:	bf48      	it	mi
 8001964:	3401      	addmi	r4, #1
 8001966:	f105 35ff 	add.w	r5, r5, #4294967295
 800196a:	bf48      	it	mi
 800196c:	b2e4      	uxtbmi	r4, r4
 800196e:	f7ff ff69 	bl	8001844 <SetLowSCL>
 8001972:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001976:	d1ed      	bne.n	8001954 <i2cRead+0x10>
 8001978:	b10e      	cbz	r6, 800197e <i2cRead+0x3a>
 800197a:	f7ff ff27 	bl	80017cc <SetLowSDA>
 800197e:	f7ff ff6d 	bl	800185c <SetHighSCL>
 8001982:	f7ff ff5f 	bl	8001844 <SetLowSCL>
 8001986:	f7ff ff1f 	bl	80017c8 <i2c_delay>
 800198a:	4620      	mov	r0, r4
 800198c:	bd70      	pop	{r4, r5, r6, pc}
 800198e:	bf00      	nop
 8001990:	48000400 	.word	0x48000400

08001994 <i2c_write_reg>:
 8001994:	b570      	push	{r4, r5, r6, lr}
 8001996:	4605      	mov	r5, r0
 8001998:	460c      	mov	r4, r1
 800199a:	4616      	mov	r6, r2
 800199c:	f7ff ff8c 	bl	80018b8 <i2cStart>
 80019a0:	4628      	mov	r0, r5
 80019a2:	f7ff ffa7 	bl	80018f4 <i2cWrite>
 80019a6:	4620      	mov	r0, r4
 80019a8:	f7ff ffa4 	bl	80018f4 <i2cWrite>
 80019ac:	4630      	mov	r0, r6
 80019ae:	f7ff ffa1 	bl	80018f4 <i2cWrite>
 80019b2:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80019b6:	f7ff bf8e 	b.w	80018d6 <i2cStop>

080019ba <i2c_read_reg>:
 80019ba:	b538      	push	{r3, r4, r5, lr}
 80019bc:	4604      	mov	r4, r0
 80019be:	460d      	mov	r5, r1
 80019c0:	f7ff ff7a 	bl	80018b8 <i2cStart>
 80019c4:	4620      	mov	r0, r4
 80019c6:	f7ff ff95 	bl	80018f4 <i2cWrite>
 80019ca:	4628      	mov	r0, r5
 80019cc:	f7ff ff92 	bl	80018f4 <i2cWrite>
 80019d0:	f7ff ff72 	bl	80018b8 <i2cStart>
 80019d4:	f044 0001 	orr.w	r0, r4, #1
 80019d8:	f7ff ff8c 	bl	80018f4 <i2cWrite>
 80019dc:	2000      	movs	r0, #0
 80019de:	f7ff ffb1 	bl	8001944 <i2cRead>
 80019e2:	4604      	mov	r4, r0
 80019e4:	f7ff ff77 	bl	80018d6 <i2cStop>
 80019e8:	4620      	mov	r0, r4
 80019ea:	bd38      	pop	{r3, r4, r5, pc}

080019ec <Default_Handler>:
 80019ec:	4668      	mov	r0, sp
 80019ee:	f020 0107 	bic.w	r1, r0, #7
 80019f2:	468d      	mov	sp, r1
 80019f4:	bf00      	nop
 80019f6:	e7fd      	b.n	80019f4 <Default_Handler+0x8>

080019f8 <HardFault_Handler>:
 80019f8:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80019fc:	f000 fc0a 	bl	8002214 <led_on>
 8001a00:	4b06      	ldr	r3, [pc, #24]	; (8001a1c <HardFault_Handler+0x24>)
 8001a02:	3b01      	subs	r3, #1
 8001a04:	d001      	beq.n	8001a0a <HardFault_Handler+0x12>
 8001a06:	bf00      	nop
 8001a08:	e7fb      	b.n	8001a02 <HardFault_Handler+0xa>
 8001a0a:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001a0e:	f000 fc17 	bl	8002240 <led_off>
 8001a12:	4b02      	ldr	r3, [pc, #8]	; (8001a1c <HardFault_Handler+0x24>)
 8001a14:	3b01      	subs	r3, #1
 8001a16:	d0ef      	beq.n	80019f8 <HardFault_Handler>
 8001a18:	bf00      	nop
 8001a1a:	e7fb      	b.n	8001a14 <HardFault_Handler+0x1c>
 8001a1c:	00989681 	.word	0x00989681

08001a20 <_reset_init>:
 8001a20:	4a0e      	ldr	r2, [pc, #56]	; (8001a5c <_reset_init+0x3c>)
 8001a22:	480f      	ldr	r0, [pc, #60]	; (8001a60 <_reset_init+0x40>)
 8001a24:	1a80      	subs	r0, r0, r2
 8001a26:	1080      	asrs	r0, r0, #2
 8001a28:	2300      	movs	r3, #0
 8001a2a:	4283      	cmp	r3, r0
 8001a2c:	d006      	beq.n	8001a3c <_reset_init+0x1c>
 8001a2e:	490d      	ldr	r1, [pc, #52]	; (8001a64 <_reset_init+0x44>)
 8001a30:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8001a34:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001a38:	3301      	adds	r3, #1
 8001a3a:	e7f6      	b.n	8001a2a <_reset_init+0xa>
 8001a3c:	4b0a      	ldr	r3, [pc, #40]	; (8001a68 <_reset_init+0x48>)
 8001a3e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001a42:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001a46:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001a4a:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8001a4e:	685a      	ldr	r2, [r3, #4]
 8001a50:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8001a54:	605a      	str	r2, [r3, #4]
 8001a56:	f7fe bb97 	b.w	8000188 <main>
 8001a5a:	bf00      	nop
 8001a5c:	20000000 	.word	0x20000000
 8001a60:	20000030 	.word	0x20000030
 8001a64:	0800248c 	.word	0x0800248c
 8001a68:	e000ed00 	.word	0xe000ed00

08001a6c <sys_tick_init>:
 8001a6c:	4b05      	ldr	r3, [pc, #20]	; (8001a84 <sys_tick_init+0x18>)
 8001a6e:	4a06      	ldr	r2, [pc, #24]	; (8001a88 <sys_tick_init+0x1c>)
 8001a70:	605a      	str	r2, [r3, #4]
 8001a72:	4a06      	ldr	r2, [pc, #24]	; (8001a8c <sys_tick_init+0x20>)
 8001a74:	21f0      	movs	r1, #240	; 0xf0
 8001a76:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8001a7a:	2200      	movs	r2, #0
 8001a7c:	609a      	str	r2, [r3, #8]
 8001a7e:	2207      	movs	r2, #7
 8001a80:	601a      	str	r2, [r3, #0]
 8001a82:	4770      	bx	lr
 8001a84:	e000e010 	.word	0xe000e010
 8001a88:	00029040 	.word	0x00029040
 8001a8c:	e000ed00 	.word	0xe000ed00

08001a90 <sleep>:
 8001a90:	bf30      	wfi
 8001a92:	4770      	bx	lr

08001a94 <sytem_clock_init>:
 8001a94:	f000 b800 	b.w	8001a98 <SystemInit>

08001a98 <SystemInit>:
 8001a98:	4b3b      	ldr	r3, [pc, #236]	; (8001b88 <SystemInit+0xf0>)
 8001a9a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001a9e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001aa2:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001aa6:	4b39      	ldr	r3, [pc, #228]	; (8001b8c <SystemInit+0xf4>)
 8001aa8:	681a      	ldr	r2, [r3, #0]
 8001aaa:	f042 0201 	orr.w	r2, r2, #1
 8001aae:	601a      	str	r2, [r3, #0]
 8001ab0:	6859      	ldr	r1, [r3, #4]
 8001ab2:	4a37      	ldr	r2, [pc, #220]	; (8001b90 <SystemInit+0xf8>)
 8001ab4:	400a      	ands	r2, r1
 8001ab6:	605a      	str	r2, [r3, #4]
 8001ab8:	681a      	ldr	r2, [r3, #0]
 8001aba:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 8001abe:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8001ac2:	601a      	str	r2, [r3, #0]
 8001ac4:	681a      	ldr	r2, [r3, #0]
 8001ac6:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 8001aca:	601a      	str	r2, [r3, #0]
 8001acc:	685a      	ldr	r2, [r3, #4]
 8001ace:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8001ad2:	605a      	str	r2, [r3, #4]
 8001ad4:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001ad6:	f022 020f 	bic.w	r2, r2, #15
 8001ada:	62da      	str	r2, [r3, #44]	; 0x2c
 8001adc:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8001ade:	4a2d      	ldr	r2, [pc, #180]	; (8001b94 <SystemInit+0xfc>)
 8001ae0:	b082      	sub	sp, #8
 8001ae2:	400a      	ands	r2, r1
 8001ae4:	631a      	str	r2, [r3, #48]	; 0x30
 8001ae6:	2200      	movs	r2, #0
 8001ae8:	609a      	str	r2, [r3, #8]
 8001aea:	9200      	str	r2, [sp, #0]
 8001aec:	9201      	str	r2, [sp, #4]
 8001aee:	681a      	ldr	r2, [r3, #0]
 8001af0:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001af4:	601a      	str	r2, [r3, #0]
 8001af6:	4b25      	ldr	r3, [pc, #148]	; (8001b8c <SystemInit+0xf4>)
 8001af8:	681a      	ldr	r2, [r3, #0]
 8001afa:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8001afe:	9201      	str	r2, [sp, #4]
 8001b00:	9a00      	ldr	r2, [sp, #0]
 8001b02:	3201      	adds	r2, #1
 8001b04:	9200      	str	r2, [sp, #0]
 8001b06:	9a01      	ldr	r2, [sp, #4]
 8001b08:	b91a      	cbnz	r2, 8001b12 <SystemInit+0x7a>
 8001b0a:	9a00      	ldr	r2, [sp, #0]
 8001b0c:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8001b10:	d1f1      	bne.n	8001af6 <SystemInit+0x5e>
 8001b12:	681b      	ldr	r3, [r3, #0]
 8001b14:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8001b18:	bf18      	it	ne
 8001b1a:	2301      	movne	r3, #1
 8001b1c:	9301      	str	r3, [sp, #4]
 8001b1e:	9b01      	ldr	r3, [sp, #4]
 8001b20:	2b01      	cmp	r3, #1
 8001b22:	d005      	beq.n	8001b30 <SystemInit+0x98>
 8001b24:	4b18      	ldr	r3, [pc, #96]	; (8001b88 <SystemInit+0xf0>)
 8001b26:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8001b2a:	609a      	str	r2, [r3, #8]
 8001b2c:	b002      	add	sp, #8
 8001b2e:	4770      	bx	lr
 8001b30:	4b19      	ldr	r3, [pc, #100]	; (8001b98 <SystemInit+0x100>)
 8001b32:	2212      	movs	r2, #18
 8001b34:	601a      	str	r2, [r3, #0]
 8001b36:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 8001b3a:	685a      	ldr	r2, [r3, #4]
 8001b3c:	605a      	str	r2, [r3, #4]
 8001b3e:	685a      	ldr	r2, [r3, #4]
 8001b40:	605a      	str	r2, [r3, #4]
 8001b42:	685a      	ldr	r2, [r3, #4]
 8001b44:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8001b48:	605a      	str	r2, [r3, #4]
 8001b4a:	685a      	ldr	r2, [r3, #4]
 8001b4c:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8001b50:	605a      	str	r2, [r3, #4]
 8001b52:	685a      	ldr	r2, [r3, #4]
 8001b54:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8001b58:	605a      	str	r2, [r3, #4]
 8001b5a:	681a      	ldr	r2, [r3, #0]
 8001b5c:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8001b60:	601a      	str	r2, [r3, #0]
 8001b62:	6819      	ldr	r1, [r3, #0]
 8001b64:	4a09      	ldr	r2, [pc, #36]	; (8001b8c <SystemInit+0xf4>)
 8001b66:	0189      	lsls	r1, r1, #6
 8001b68:	d5fb      	bpl.n	8001b62 <SystemInit+0xca>
 8001b6a:	6853      	ldr	r3, [r2, #4]
 8001b6c:	f023 0303 	bic.w	r3, r3, #3
 8001b70:	6053      	str	r3, [r2, #4]
 8001b72:	6853      	ldr	r3, [r2, #4]
 8001b74:	f043 0302 	orr.w	r3, r3, #2
 8001b78:	6053      	str	r3, [r2, #4]
 8001b7a:	4b04      	ldr	r3, [pc, #16]	; (8001b8c <SystemInit+0xf4>)
 8001b7c:	685b      	ldr	r3, [r3, #4]
 8001b7e:	f003 030c 	and.w	r3, r3, #12
 8001b82:	2b08      	cmp	r3, #8
 8001b84:	d1f9      	bne.n	8001b7a <SystemInit+0xe2>
 8001b86:	e7cd      	b.n	8001b24 <SystemInit+0x8c>
 8001b88:	e000ed00 	.word	0xe000ed00
 8001b8c:	40021000 	.word	0x40021000
 8001b90:	f87fc00c 	.word	0xf87fc00c
 8001b94:	ff00fccc 	.word	0xff00fccc
 8001b98:	40022000 	.word	0x40022000

08001b9c <RCC_GetClocksFreq>:
 8001b9c:	4ba5      	ldr	r3, [pc, #660]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001b9e:	685a      	ldr	r2, [r3, #4]
 8001ba0:	f002 020c 	and.w	r2, r2, #12
 8001ba4:	2a04      	cmp	r2, #4
 8001ba6:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8001baa:	d005      	beq.n	8001bb8 <RCC_GetClocksFreq+0x1c>
 8001bac:	2a08      	cmp	r2, #8
 8001bae:	d006      	beq.n	8001bbe <RCC_GetClocksFreq+0x22>
 8001bb0:	4ba1      	ldr	r3, [pc, #644]	; (8001e38 <RCC_GetClocksFreq+0x29c>)
 8001bb2:	6003      	str	r3, [r0, #0]
 8001bb4:	b9ba      	cbnz	r2, 8001be6 <RCC_GetClocksFreq+0x4a>
 8001bb6:	e017      	b.n	8001be8 <RCC_GetClocksFreq+0x4c>
 8001bb8:	4b9f      	ldr	r3, [pc, #636]	; (8001e38 <RCC_GetClocksFreq+0x29c>)
 8001bba:	6003      	str	r3, [r0, #0]
 8001bbc:	e013      	b.n	8001be6 <RCC_GetClocksFreq+0x4a>
 8001bbe:	6859      	ldr	r1, [r3, #4]
 8001bc0:	685c      	ldr	r4, [r3, #4]
 8001bc2:	f3c1 4183 	ubfx	r1, r1, #18, #4
 8001bc6:	03e2      	lsls	r2, r4, #15
 8001bc8:	f101 0102 	add.w	r1, r1, #2
 8001bcc:	d401      	bmi.n	8001bd2 <RCC_GetClocksFreq+0x36>
 8001bce:	4a9b      	ldr	r2, [pc, #620]	; (8001e3c <RCC_GetClocksFreq+0x2a0>)
 8001bd0:	e006      	b.n	8001be0 <RCC_GetClocksFreq+0x44>
 8001bd2:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001bd4:	4b98      	ldr	r3, [pc, #608]	; (8001e38 <RCC_GetClocksFreq+0x29c>)
 8001bd6:	f002 020f 	and.w	r2, r2, #15
 8001bda:	3201      	adds	r2, #1
 8001bdc:	fbb3 f2f2 	udiv	r2, r3, r2
 8001be0:	434a      	muls	r2, r1
 8001be2:	6002      	str	r2, [r0, #0]
 8001be4:	e000      	b.n	8001be8 <RCC_GetClocksFreq+0x4c>
 8001be6:	2200      	movs	r2, #0
 8001be8:	4f92      	ldr	r7, [pc, #584]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001bea:	4d95      	ldr	r5, [pc, #596]	; (8001e40 <RCC_GetClocksFreq+0x2a4>)
 8001bec:	687b      	ldr	r3, [r7, #4]
 8001bee:	f8df 8254 	ldr.w	r8, [pc, #596]	; 8001e44 <RCC_GetClocksFreq+0x2a8>
 8001bf2:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8001bf6:	5cec      	ldrb	r4, [r5, r3]
 8001bf8:	6803      	ldr	r3, [r0, #0]
 8001bfa:	b2e4      	uxtb	r4, r4
 8001bfc:	fa23 f104 	lsr.w	r1, r3, r4
 8001c00:	6041      	str	r1, [r0, #4]
 8001c02:	687e      	ldr	r6, [r7, #4]
 8001c04:	f3c6 2602 	ubfx	r6, r6, #8, #3
 8001c08:	5dae      	ldrb	r6, [r5, r6]
 8001c0a:	fa21 f606 	lsr.w	r6, r1, r6
 8001c0e:	6086      	str	r6, [r0, #8]
 8001c10:	f8d7 c004 	ldr.w	ip, [r7, #4]
 8001c14:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8001c18:	f815 500c 	ldrb.w	r5, [r5, ip]
 8001c1c:	b2ed      	uxtb	r5, r5
 8001c1e:	40e9      	lsrs	r1, r5
 8001c20:	60c1      	str	r1, [r0, #12]
 8001c22:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 8001c26:	f3c9 1904 	ubfx	r9, r9, #4, #5
 8001c2a:	f009 0c0f 	and.w	ip, r9, #15
 8001c2e:	f019 0f10 	tst.w	r9, #16
 8001c32:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 8001c36:	fa1f fc8c 	uxth.w	ip, ip
 8001c3a:	d007      	beq.n	8001c4c <RCC_GetClocksFreq+0xb0>
 8001c3c:	f1bc 0f00 	cmp.w	ip, #0
 8001c40:	d004      	beq.n	8001c4c <RCC_GetClocksFreq+0xb0>
 8001c42:	fbb2 fcfc 	udiv	ip, r2, ip
 8001c46:	f8c0 c010 	str.w	ip, [r0, #16]
 8001c4a:	e000      	b.n	8001c4e <RCC_GetClocksFreq+0xb2>
 8001c4c:	6103      	str	r3, [r0, #16]
 8001c4e:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 8001c50:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 8001c54:	f00c 070f 	and.w	r7, ip, #15
 8001c58:	f01c 0f10 	tst.w	ip, #16
 8001c5c:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 8001c60:	b2bf      	uxth	r7, r7
 8001c62:	d004      	beq.n	8001c6e <RCC_GetClocksFreq+0xd2>
 8001c64:	b11f      	cbz	r7, 8001c6e <RCC_GetClocksFreq+0xd2>
 8001c66:	fbb2 f7f7 	udiv	r7, r2, r7
 8001c6a:	6147      	str	r7, [r0, #20]
 8001c6c:	e000      	b.n	8001c70 <RCC_GetClocksFreq+0xd4>
 8001c6e:	6143      	str	r3, [r0, #20]
 8001c70:	4f70      	ldr	r7, [pc, #448]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001c72:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001c76:	f01c 0f10 	tst.w	ip, #16
 8001c7a:	bf0a      	itet	eq
 8001c7c:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 8001e38 <RCC_GetClocksFreq+0x29c>
 8001c80:	6183      	strne	r3, [r0, #24]
 8001c82:	f8c0 c018 	streq.w	ip, [r0, #24]
 8001c86:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001c88:	06bf      	lsls	r7, r7, #26
 8001c8a:	bf56      	itet	pl
 8001c8c:	4f6a      	ldrpl	r7, [pc, #424]	; (8001e38 <RCC_GetClocksFreq+0x29c>)
 8001c8e:	61c3      	strmi	r3, [r0, #28]
 8001c90:	61c7      	strpl	r7, [r0, #28]
 8001c92:	4f68      	ldr	r7, [pc, #416]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001c94:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001c98:	f01c 0f40 	tst.w	ip, #64	; 0x40
 8001c9c:	bf0a      	itet	eq
 8001c9e:	f8df c198 	ldreq.w	ip, [pc, #408]	; 8001e38 <RCC_GetClocksFreq+0x29c>
 8001ca2:	6203      	strne	r3, [r0, #32]
 8001ca4:	f8c0 c020 	streq.w	ip, [r0, #32]
 8001ca8:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001caa:	05ff      	lsls	r7, r7, #23
 8001cac:	d506      	bpl.n	8001cbc <RCC_GetClocksFreq+0x120>
 8001cae:	4293      	cmp	r3, r2
 8001cb0:	d104      	bne.n	8001cbc <RCC_GetClocksFreq+0x120>
 8001cb2:	42a5      	cmp	r5, r4
 8001cb4:	d102      	bne.n	8001cbc <RCC_GetClocksFreq+0x120>
 8001cb6:	005f      	lsls	r7, r3, #1
 8001cb8:	6247      	str	r7, [r0, #36]	; 0x24
 8001cba:	e000      	b.n	8001cbe <RCC_GetClocksFreq+0x122>
 8001cbc:	6241      	str	r1, [r0, #36]	; 0x24
 8001cbe:	4f5d      	ldr	r7, [pc, #372]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001cc0:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001cc4:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 8001cc8:	d008      	beq.n	8001cdc <RCC_GetClocksFreq+0x140>
 8001cca:	4293      	cmp	r3, r2
 8001ccc:	d106      	bne.n	8001cdc <RCC_GetClocksFreq+0x140>
 8001cce:	42a5      	cmp	r5, r4
 8001cd0:	d104      	bne.n	8001cdc <RCC_GetClocksFreq+0x140>
 8001cd2:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001cd6:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 8001cda:	e000      	b.n	8001cde <RCC_GetClocksFreq+0x142>
 8001cdc:	6281      	str	r1, [r0, #40]	; 0x28
 8001cde:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001ce0:	05bf      	lsls	r7, r7, #22
 8001ce2:	d506      	bpl.n	8001cf2 <RCC_GetClocksFreq+0x156>
 8001ce4:	4293      	cmp	r3, r2
 8001ce6:	d104      	bne.n	8001cf2 <RCC_GetClocksFreq+0x156>
 8001ce8:	42a5      	cmp	r5, r4
 8001cea:	d102      	bne.n	8001cf2 <RCC_GetClocksFreq+0x156>
 8001cec:	005f      	lsls	r7, r3, #1
 8001cee:	62c7      	str	r7, [r0, #44]	; 0x2c
 8001cf0:	e000      	b.n	8001cf4 <RCC_GetClocksFreq+0x158>
 8001cf2:	62c1      	str	r1, [r0, #44]	; 0x2c
 8001cf4:	4f4f      	ldr	r7, [pc, #316]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001cf6:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001cfa:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 8001cfe:	d008      	beq.n	8001d12 <RCC_GetClocksFreq+0x176>
 8001d00:	4293      	cmp	r3, r2
 8001d02:	d106      	bne.n	8001d12 <RCC_GetClocksFreq+0x176>
 8001d04:	42a5      	cmp	r5, r4
 8001d06:	d104      	bne.n	8001d12 <RCC_GetClocksFreq+0x176>
 8001d08:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001d0c:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8001d10:	e000      	b.n	8001d14 <RCC_GetClocksFreq+0x178>
 8001d12:	64c1      	str	r1, [r0, #76]	; 0x4c
 8001d14:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001d16:	053f      	lsls	r7, r7, #20
 8001d18:	d506      	bpl.n	8001d28 <RCC_GetClocksFreq+0x18c>
 8001d1a:	4293      	cmp	r3, r2
 8001d1c:	d104      	bne.n	8001d28 <RCC_GetClocksFreq+0x18c>
 8001d1e:	42a5      	cmp	r5, r4
 8001d20:	d102      	bne.n	8001d28 <RCC_GetClocksFreq+0x18c>
 8001d22:	005f      	lsls	r7, r3, #1
 8001d24:	6507      	str	r7, [r0, #80]	; 0x50
 8001d26:	e000      	b.n	8001d2a <RCC_GetClocksFreq+0x18e>
 8001d28:	6501      	str	r1, [r0, #80]	; 0x50
 8001d2a:	4f42      	ldr	r7, [pc, #264]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001d2c:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001d30:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 8001d34:	d008      	beq.n	8001d48 <RCC_GetClocksFreq+0x1ac>
 8001d36:	4293      	cmp	r3, r2
 8001d38:	d106      	bne.n	8001d48 <RCC_GetClocksFreq+0x1ac>
 8001d3a:	42a5      	cmp	r5, r4
 8001d3c:	d104      	bne.n	8001d48 <RCC_GetClocksFreq+0x1ac>
 8001d3e:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001d42:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 8001d46:	e000      	b.n	8001d4a <RCC_GetClocksFreq+0x1ae>
 8001d48:	6501      	str	r1, [r0, #80]	; 0x50
 8001d4a:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001d4c:	043f      	lsls	r7, r7, #16
 8001d4e:	d506      	bpl.n	8001d5e <RCC_GetClocksFreq+0x1c2>
 8001d50:	4293      	cmp	r3, r2
 8001d52:	d104      	bne.n	8001d5e <RCC_GetClocksFreq+0x1c2>
 8001d54:	42a5      	cmp	r5, r4
 8001d56:	d102      	bne.n	8001d5e <RCC_GetClocksFreq+0x1c2>
 8001d58:	005a      	lsls	r2, r3, #1
 8001d5a:	6582      	str	r2, [r0, #88]	; 0x58
 8001d5c:	e000      	b.n	8001d60 <RCC_GetClocksFreq+0x1c4>
 8001d5e:	6581      	str	r1, [r0, #88]	; 0x58
 8001d60:	4a34      	ldr	r2, [pc, #208]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001d62:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8001d64:	07a4      	lsls	r4, r4, #30
 8001d66:	d014      	beq.n	8001d92 <RCC_GetClocksFreq+0x1f6>
 8001d68:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001d6a:	f001 0103 	and.w	r1, r1, #3
 8001d6e:	2901      	cmp	r1, #1
 8001d70:	d101      	bne.n	8001d76 <RCC_GetClocksFreq+0x1da>
 8001d72:	6383      	str	r3, [r0, #56]	; 0x38
 8001d74:	e00e      	b.n	8001d94 <RCC_GetClocksFreq+0x1f8>
 8001d76:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001d78:	f001 0103 	and.w	r1, r1, #3
 8001d7c:	2902      	cmp	r1, #2
 8001d7e:	d102      	bne.n	8001d86 <RCC_GetClocksFreq+0x1ea>
 8001d80:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001d84:	e005      	b.n	8001d92 <RCC_GetClocksFreq+0x1f6>
 8001d86:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001d88:	f001 0103 	and.w	r1, r1, #3
 8001d8c:	2903      	cmp	r1, #3
 8001d8e:	d101      	bne.n	8001d94 <RCC_GetClocksFreq+0x1f8>
 8001d90:	4929      	ldr	r1, [pc, #164]	; (8001e38 <RCC_GetClocksFreq+0x29c>)
 8001d92:	6381      	str	r1, [r0, #56]	; 0x38
 8001d94:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001d96:	4927      	ldr	r1, [pc, #156]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001d98:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 8001d9c:	d101      	bne.n	8001da2 <RCC_GetClocksFreq+0x206>
 8001d9e:	63c6      	str	r6, [r0, #60]	; 0x3c
 8001da0:	e018      	b.n	8001dd4 <RCC_GetClocksFreq+0x238>
 8001da2:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001da4:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001da8:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 8001dac:	d101      	bne.n	8001db2 <RCC_GetClocksFreq+0x216>
 8001dae:	63c3      	str	r3, [r0, #60]	; 0x3c
 8001db0:	e010      	b.n	8001dd4 <RCC_GetClocksFreq+0x238>
 8001db2:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001db4:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001db8:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 8001dbc:	d102      	bne.n	8001dc4 <RCC_GetClocksFreq+0x228>
 8001dbe:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001dc2:	e006      	b.n	8001dd2 <RCC_GetClocksFreq+0x236>
 8001dc4:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001dc6:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001dca:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 8001dce:	d101      	bne.n	8001dd4 <RCC_GetClocksFreq+0x238>
 8001dd0:	4a19      	ldr	r2, [pc, #100]	; (8001e38 <RCC_GetClocksFreq+0x29c>)
 8001dd2:	63c2      	str	r2, [r0, #60]	; 0x3c
 8001dd4:	4a17      	ldr	r2, [pc, #92]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001dd6:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001dd8:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8001ddc:	d101      	bne.n	8001de2 <RCC_GetClocksFreq+0x246>
 8001dde:	6406      	str	r6, [r0, #64]	; 0x40
 8001de0:	e018      	b.n	8001e14 <RCC_GetClocksFreq+0x278>
 8001de2:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001de4:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001de8:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8001dec:	d101      	bne.n	8001df2 <RCC_GetClocksFreq+0x256>
 8001dee:	6403      	str	r3, [r0, #64]	; 0x40
 8001df0:	e010      	b.n	8001e14 <RCC_GetClocksFreq+0x278>
 8001df2:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001df4:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001df8:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 8001dfc:	d102      	bne.n	8001e04 <RCC_GetClocksFreq+0x268>
 8001dfe:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001e02:	e006      	b.n	8001e12 <RCC_GetClocksFreq+0x276>
 8001e04:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001e06:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001e0a:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 8001e0e:	d101      	bne.n	8001e14 <RCC_GetClocksFreq+0x278>
 8001e10:	4909      	ldr	r1, [pc, #36]	; (8001e38 <RCC_GetClocksFreq+0x29c>)
 8001e12:	6401      	str	r1, [r0, #64]	; 0x40
 8001e14:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001e16:	4907      	ldr	r1, [pc, #28]	; (8001e34 <RCC_GetClocksFreq+0x298>)
 8001e18:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 8001e1c:	d101      	bne.n	8001e22 <RCC_GetClocksFreq+0x286>
 8001e1e:	6446      	str	r6, [r0, #68]	; 0x44
 8001e20:	e023      	b.n	8001e6a <RCC_GetClocksFreq+0x2ce>
 8001e22:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001e24:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001e28:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 8001e2c:	d10c      	bne.n	8001e48 <RCC_GetClocksFreq+0x2ac>
 8001e2e:	6443      	str	r3, [r0, #68]	; 0x44
 8001e30:	e01b      	b.n	8001e6a <RCC_GetClocksFreq+0x2ce>
 8001e32:	bf00      	nop
 8001e34:	40021000 	.word	0x40021000
 8001e38:	007a1200 	.word	0x007a1200
 8001e3c:	003d0900 	.word	0x003d0900
 8001e40:	20000020 	.word	0x20000020
 8001e44:	20000000 	.word	0x20000000
 8001e48:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001e4a:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001e4e:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 8001e52:	d102      	bne.n	8001e5a <RCC_GetClocksFreq+0x2be>
 8001e54:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001e58:	e006      	b.n	8001e68 <RCC_GetClocksFreq+0x2cc>
 8001e5a:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001e5c:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001e60:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 8001e64:	d101      	bne.n	8001e6a <RCC_GetClocksFreq+0x2ce>
 8001e66:	4a11      	ldr	r2, [pc, #68]	; (8001eac <RCC_GetClocksFreq+0x310>)
 8001e68:	6442      	str	r2, [r0, #68]	; 0x44
 8001e6a:	4a11      	ldr	r2, [pc, #68]	; (8001eb0 <RCC_GetClocksFreq+0x314>)
 8001e6c:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001e6e:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 8001e72:	d102      	bne.n	8001e7a <RCC_GetClocksFreq+0x2de>
 8001e74:	6486      	str	r6, [r0, #72]	; 0x48
 8001e76:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001e7a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001e7c:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 8001e80:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 8001e84:	d00f      	beq.n	8001ea6 <RCC_GetClocksFreq+0x30a>
 8001e86:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001e88:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001e8c:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 8001e90:	d102      	bne.n	8001e98 <RCC_GetClocksFreq+0x2fc>
 8001e92:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001e96:	e006      	b.n	8001ea6 <RCC_GetClocksFreq+0x30a>
 8001e98:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001e9a:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001e9e:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8001ea2:	d101      	bne.n	8001ea8 <RCC_GetClocksFreq+0x30c>
 8001ea4:	4b01      	ldr	r3, [pc, #4]	; (8001eac <RCC_GetClocksFreq+0x310>)
 8001ea6:	6483      	str	r3, [r0, #72]	; 0x48
 8001ea8:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001eac:	007a1200 	.word	0x007a1200
 8001eb0:	40021000 	.word	0x40021000

08001eb4 <RCC_AHBPeriphClockCmd>:
 8001eb4:	bf00      	nop
 8001eb6:	bf00      	nop
 8001eb8:	4b04      	ldr	r3, [pc, #16]	; (8001ecc <RCC_AHBPeriphClockCmd+0x18>)
 8001eba:	695a      	ldr	r2, [r3, #20]
 8001ebc:	b109      	cbz	r1, 8001ec2 <RCC_AHBPeriphClockCmd+0xe>
 8001ebe:	4310      	orrs	r0, r2
 8001ec0:	e001      	b.n	8001ec6 <RCC_AHBPeriphClockCmd+0x12>
 8001ec2:	ea22 0000 	bic.w	r0, r2, r0
 8001ec6:	6158      	str	r0, [r3, #20]
 8001ec8:	4770      	bx	lr
 8001eca:	bf00      	nop
 8001ecc:	40021000 	.word	0x40021000

08001ed0 <RCC_APB2PeriphClockCmd>:
 8001ed0:	bf00      	nop
 8001ed2:	bf00      	nop
 8001ed4:	4b04      	ldr	r3, [pc, #16]	; (8001ee8 <RCC_APB2PeriphClockCmd+0x18>)
 8001ed6:	699a      	ldr	r2, [r3, #24]
 8001ed8:	b109      	cbz	r1, 8001ede <RCC_APB2PeriphClockCmd+0xe>
 8001eda:	4310      	orrs	r0, r2
 8001edc:	e001      	b.n	8001ee2 <RCC_APB2PeriphClockCmd+0x12>
 8001ede:	ea22 0000 	bic.w	r0, r2, r0
 8001ee2:	6198      	str	r0, [r3, #24]
 8001ee4:	4770      	bx	lr
 8001ee6:	bf00      	nop
 8001ee8:	40021000 	.word	0x40021000

08001eec <RCC_APB1PeriphClockCmd>:
 8001eec:	bf00      	nop
 8001eee:	bf00      	nop
 8001ef0:	4b04      	ldr	r3, [pc, #16]	; (8001f04 <RCC_APB1PeriphClockCmd+0x18>)
 8001ef2:	69da      	ldr	r2, [r3, #28]
 8001ef4:	b109      	cbz	r1, 8001efa <RCC_APB1PeriphClockCmd+0xe>
 8001ef6:	4310      	orrs	r0, r2
 8001ef8:	e001      	b.n	8001efe <RCC_APB1PeriphClockCmd+0x12>
 8001efa:	ea22 0000 	bic.w	r0, r2, r0
 8001efe:	61d8      	str	r0, [r3, #28]
 8001f00:	4770      	bx	lr
 8001f02:	bf00      	nop
 8001f04:	40021000 	.word	0x40021000

08001f08 <TIM_TimeBaseInit>:
 8001f08:	bf00      	nop
 8001f0a:	bf00      	nop
 8001f0c:	bf00      	nop
 8001f0e:	4a24      	ldr	r2, [pc, #144]	; (8001fa0 <TIM_TimeBaseInit+0x98>)
 8001f10:	8803      	ldrh	r3, [r0, #0]
 8001f12:	4290      	cmp	r0, r2
 8001f14:	b29b      	uxth	r3, r3
 8001f16:	d012      	beq.n	8001f3e <TIM_TimeBaseInit+0x36>
 8001f18:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8001f1c:	4290      	cmp	r0, r2
 8001f1e:	d00e      	beq.n	8001f3e <TIM_TimeBaseInit+0x36>
 8001f20:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001f24:	d00b      	beq.n	8001f3e <TIM_TimeBaseInit+0x36>
 8001f26:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 8001f2a:	4290      	cmp	r0, r2
 8001f2c:	d007      	beq.n	8001f3e <TIM_TimeBaseInit+0x36>
 8001f2e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001f32:	4290      	cmp	r0, r2
 8001f34:	d003      	beq.n	8001f3e <TIM_TimeBaseInit+0x36>
 8001f36:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 8001f3a:	4290      	cmp	r0, r2
 8001f3c:	d103      	bne.n	8001f46 <TIM_TimeBaseInit+0x3e>
 8001f3e:	884a      	ldrh	r2, [r1, #2]
 8001f40:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001f44:	4313      	orrs	r3, r2
 8001f46:	4a17      	ldr	r2, [pc, #92]	; (8001fa4 <TIM_TimeBaseInit+0x9c>)
 8001f48:	4290      	cmp	r0, r2
 8001f4a:	d008      	beq.n	8001f5e <TIM_TimeBaseInit+0x56>
 8001f4c:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001f50:	4290      	cmp	r0, r2
 8001f52:	d004      	beq.n	8001f5e <TIM_TimeBaseInit+0x56>
 8001f54:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001f58:	890a      	ldrh	r2, [r1, #8]
 8001f5a:	b29b      	uxth	r3, r3
 8001f5c:	4313      	orrs	r3, r2
 8001f5e:	8003      	strh	r3, [r0, #0]
 8001f60:	684b      	ldr	r3, [r1, #4]
 8001f62:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001f64:	880b      	ldrh	r3, [r1, #0]
 8001f66:	8503      	strh	r3, [r0, #40]	; 0x28
 8001f68:	4b0d      	ldr	r3, [pc, #52]	; (8001fa0 <TIM_TimeBaseInit+0x98>)
 8001f6a:	4298      	cmp	r0, r3
 8001f6c:	d013      	beq.n	8001f96 <TIM_TimeBaseInit+0x8e>
 8001f6e:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001f72:	4298      	cmp	r0, r3
 8001f74:	d00f      	beq.n	8001f96 <TIM_TimeBaseInit+0x8e>
 8001f76:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 8001f7a:	4298      	cmp	r0, r3
 8001f7c:	d00b      	beq.n	8001f96 <TIM_TimeBaseInit+0x8e>
 8001f7e:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001f82:	4298      	cmp	r0, r3
 8001f84:	d007      	beq.n	8001f96 <TIM_TimeBaseInit+0x8e>
 8001f86:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001f8a:	4298      	cmp	r0, r3
 8001f8c:	d003      	beq.n	8001f96 <TIM_TimeBaseInit+0x8e>
 8001f8e:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001f92:	4298      	cmp	r0, r3
 8001f94:	d101      	bne.n	8001f9a <TIM_TimeBaseInit+0x92>
 8001f96:	894b      	ldrh	r3, [r1, #10]
 8001f98:	8603      	strh	r3, [r0, #48]	; 0x30
 8001f9a:	2301      	movs	r3, #1
 8001f9c:	6143      	str	r3, [r0, #20]
 8001f9e:	4770      	bx	lr
 8001fa0:	40012c00 	.word	0x40012c00
 8001fa4:	40001000 	.word	0x40001000

08001fa8 <TIM_Cmd>:
 8001fa8:	bf00      	nop
 8001faa:	bf00      	nop
 8001fac:	8803      	ldrh	r3, [r0, #0]
 8001fae:	b119      	cbz	r1, 8001fb8 <TIM_Cmd+0x10>
 8001fb0:	b29b      	uxth	r3, r3
 8001fb2:	f043 0301 	orr.w	r3, r3, #1
 8001fb6:	e003      	b.n	8001fc0 <TIM_Cmd+0x18>
 8001fb8:	f023 0301 	bic.w	r3, r3, #1
 8001fbc:	041b      	lsls	r3, r3, #16
 8001fbe:	0c1b      	lsrs	r3, r3, #16
 8001fc0:	8003      	strh	r3, [r0, #0]
 8001fc2:	4770      	bx	lr

08001fc4 <TIM_ClearITPendingBit>:
 8001fc4:	bf00      	nop
 8001fc6:	43c9      	mvns	r1, r1
 8001fc8:	b289      	uxth	r1, r1
 8001fca:	6101      	str	r1, [r0, #16]
 8001fcc:	4770      	bx	lr
	...

08001fd0 <timer_init>:
 8001fd0:	b530      	push	{r4, r5, lr}
 8001fd2:	2300      	movs	r3, #0
 8001fd4:	b085      	sub	sp, #20
 8001fd6:	491f      	ldr	r1, [pc, #124]	; (8002054 <timer_init+0x84>)
 8001fd8:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001fdc:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001fe0:	491d      	ldr	r1, [pc, #116]	; (8002058 <timer_init+0x88>)
 8001fe2:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001fe6:	4a1d      	ldr	r2, [pc, #116]	; (800205c <timer_init+0x8c>)
 8001fe8:	2400      	movs	r4, #0
 8001fea:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8001fee:	3301      	adds	r3, #1
 8001ff0:	2b04      	cmp	r3, #4
 8001ff2:	4625      	mov	r5, r4
 8001ff4:	d1ef      	bne.n	8001fd6 <timer_init+0x6>
 8001ff6:	4b1a      	ldr	r3, [pc, #104]	; (8002060 <timer_init+0x90>)
 8001ff8:	2002      	movs	r0, #2
 8001ffa:	2101      	movs	r1, #1
 8001ffc:	601c      	str	r4, [r3, #0]
 8001ffe:	f7ff ff75 	bl	8001eec <RCC_APB1PeriphClockCmd>
 8002002:	f8ad 4006 	strh.w	r4, [sp, #6]
 8002006:	f8ad 400c 	strh.w	r4, [sp, #12]
 800200a:	f8ad 400e 	strh.w	r4, [sp, #14]
 800200e:	4c15      	ldr	r4, [pc, #84]	; (8002064 <timer_init+0x94>)
 8002010:	f44f 738c 	mov.w	r3, #280	; 0x118
 8002014:	f8ad 3004 	strh.w	r3, [sp, #4]
 8002018:	4620      	mov	r0, r4
 800201a:	2331      	movs	r3, #49	; 0x31
 800201c:	a901      	add	r1, sp, #4
 800201e:	9302      	str	r3, [sp, #8]
 8002020:	f7ff ff72 	bl	8001f08 <TIM_TimeBaseInit>
 8002024:	4620      	mov	r0, r4
 8002026:	2101      	movs	r1, #1
 8002028:	f7ff ffbe 	bl	8001fa8 <TIM_Cmd>
 800202c:	68e3      	ldr	r3, [r4, #12]
 800202e:	f043 0301 	orr.w	r3, r3, #1
 8002032:	60e3      	str	r3, [r4, #12]
 8002034:	231d      	movs	r3, #29
 8002036:	f88d 3000 	strb.w	r3, [sp]
 800203a:	4668      	mov	r0, sp
 800203c:	2301      	movs	r3, #1
 800203e:	f88d 5001 	strb.w	r5, [sp, #1]
 8002042:	f88d 3002 	strb.w	r3, [sp, #2]
 8002046:	f88d 3003 	strb.w	r3, [sp, #3]
 800204a:	f7ff fb85 	bl	8001758 <NVIC_Init>
 800204e:	b005      	add	sp, #20
 8002050:	bd30      	pop	{r4, r5, pc}
 8002052:	bf00      	nop
 8002054:	200009e8 	.word	0x200009e8
 8002058:	200009dc 	.word	0x200009dc
 800205c:	200009d4 	.word	0x200009d4
 8002060:	200009e4 	.word	0x200009e4
 8002064:	40000400 	.word	0x40000400

08002068 <TIM3_IRQHandler>:
 8002068:	2300      	movs	r3, #0
 800206a:	4a10      	ldr	r2, [pc, #64]	; (80020ac <TIM3_IRQHandler+0x44>)
 800206c:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8002070:	b289      	uxth	r1, r1
 8002072:	b129      	cbz	r1, 8002080 <TIM3_IRQHandler+0x18>
 8002074:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8002078:	b289      	uxth	r1, r1
 800207a:	3901      	subs	r1, #1
 800207c:	b289      	uxth	r1, r1
 800207e:	e007      	b.n	8002090 <TIM3_IRQHandler+0x28>
 8002080:	490b      	ldr	r1, [pc, #44]	; (80020b0 <TIM3_IRQHandler+0x48>)
 8002082:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8002086:	b289      	uxth	r1, r1
 8002088:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 800208c:	4a09      	ldr	r2, [pc, #36]	; (80020b4 <TIM3_IRQHandler+0x4c>)
 800208e:	2101      	movs	r1, #1
 8002090:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8002094:	3301      	adds	r3, #1
 8002096:	2b04      	cmp	r3, #4
 8002098:	d1e7      	bne.n	800206a <TIM3_IRQHandler+0x2>
 800209a:	4b07      	ldr	r3, [pc, #28]	; (80020b8 <TIM3_IRQHandler+0x50>)
 800209c:	4807      	ldr	r0, [pc, #28]	; (80020bc <TIM3_IRQHandler+0x54>)
 800209e:	681a      	ldr	r2, [r3, #0]
 80020a0:	2101      	movs	r1, #1
 80020a2:	3201      	adds	r2, #1
 80020a4:	601a      	str	r2, [r3, #0]
 80020a6:	f7ff bf8d 	b.w	8001fc4 <TIM_ClearITPendingBit>
 80020aa:	bf00      	nop
 80020ac:	200009e8 	.word	0x200009e8
 80020b0:	200009dc 	.word	0x200009dc
 80020b4:	200009d4 	.word	0x200009d4
 80020b8:	200009e4 	.word	0x200009e4
 80020bc:	40000400 	.word	0x40000400

080020c0 <timer_get_time>:
 80020c0:	b082      	sub	sp, #8
 80020c2:	b672      	cpsid	i
 80020c4:	4b04      	ldr	r3, [pc, #16]	; (80020d8 <timer_get_time+0x18>)
 80020c6:	681b      	ldr	r3, [r3, #0]
 80020c8:	9301      	str	r3, [sp, #4]
 80020ca:	b662      	cpsie	i
 80020cc:	9801      	ldr	r0, [sp, #4]
 80020ce:	230a      	movs	r3, #10
 80020d0:	fbb0 f0f3 	udiv	r0, r0, r3
 80020d4:	b002      	add	sp, #8
 80020d6:	4770      	bx	lr
 80020d8:	200009e4 	.word	0x200009e4

080020dc <timer_delay_ms>:
 80020dc:	b513      	push	{r0, r1, r4, lr}
 80020de:	4604      	mov	r4, r0
 80020e0:	f7ff ffee 	bl	80020c0 <timer_get_time>
 80020e4:	4420      	add	r0, r4
 80020e6:	9001      	str	r0, [sp, #4]
 80020e8:	9c01      	ldr	r4, [sp, #4]
 80020ea:	f7ff ffe9 	bl	80020c0 <timer_get_time>
 80020ee:	4284      	cmp	r4, r0
 80020f0:	d902      	bls.n	80020f8 <timer_delay_ms+0x1c>
 80020f2:	f7ff fccd 	bl	8001a90 <sleep>
 80020f6:	e7f7      	b.n	80020e8 <timer_delay_ms+0xc>
 80020f8:	b002      	add	sp, #8
 80020fa:	bd10      	pop	{r4, pc}

080020fc <event_timer_set_period>:
 80020fc:	b672      	cpsid	i
 80020fe:	230a      	movs	r3, #10
 8002100:	4359      	muls	r1, r3
 8002102:	4b06      	ldr	r3, [pc, #24]	; (800211c <event_timer_set_period+0x20>)
 8002104:	b289      	uxth	r1, r1
 8002106:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 800210a:	4b05      	ldr	r3, [pc, #20]	; (8002120 <event_timer_set_period+0x24>)
 800210c:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8002110:	4b04      	ldr	r3, [pc, #16]	; (8002124 <event_timer_set_period+0x28>)
 8002112:	2200      	movs	r2, #0
 8002114:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 8002118:	b662      	cpsie	i
 800211a:	4770      	bx	lr
 800211c:	200009e8 	.word	0x200009e8
 8002120:	200009dc 	.word	0x200009dc
 8002124:	200009d4 	.word	0x200009d4

08002128 <event_timer_wait>:
 8002128:	b510      	push	{r4, lr}
 800212a:	4604      	mov	r4, r0
 800212c:	4b06      	ldr	r3, [pc, #24]	; (8002148 <event_timer_wait+0x20>)
 800212e:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 8002132:	b292      	uxth	r2, r2
 8002134:	b912      	cbnz	r2, 800213c <event_timer_wait+0x14>
 8002136:	f7ff fcab 	bl	8001a90 <sleep>
 800213a:	e7f7      	b.n	800212c <event_timer_wait+0x4>
 800213c:	b672      	cpsid	i
 800213e:	2200      	movs	r2, #0
 8002140:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 8002144:	b662      	cpsie	i
 8002146:	bd10      	pop	{r4, pc}
 8002148:	200009d4 	.word	0x200009d4

0800214c <GPIO_Init>:
 800214c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800214e:	bf00      	nop
 8002150:	bf00      	nop
 8002152:	bf00      	nop
 8002154:	bf00      	nop
 8002156:	2300      	movs	r3, #0
 8002158:	680e      	ldr	r6, [r1, #0]
 800215a:	461a      	mov	r2, r3
 800215c:	2501      	movs	r5, #1
 800215e:	4095      	lsls	r5, r2
 8002160:	ea05 0406 	and.w	r4, r5, r6
 8002164:	42ac      	cmp	r4, r5
 8002166:	d131      	bne.n	80021cc <GPIO_Init+0x80>
 8002168:	790d      	ldrb	r5, [r1, #4]
 800216a:	1e6f      	subs	r7, r5, #1
 800216c:	b2ff      	uxtb	r7, r7
 800216e:	2f01      	cmp	r7, #1
 8002170:	d81c      	bhi.n	80021ac <GPIO_Init+0x60>
 8002172:	bf00      	nop
 8002174:	f04f 0c03 	mov.w	ip, #3
 8002178:	6887      	ldr	r7, [r0, #8]
 800217a:	fa0c fc03 	lsl.w	ip, ip, r3
 800217e:	ea27 070c 	bic.w	r7, r7, ip
 8002182:	6087      	str	r7, [r0, #8]
 8002184:	f891 c005 	ldrb.w	ip, [r1, #5]
 8002188:	6887      	ldr	r7, [r0, #8]
 800218a:	fa0c fc03 	lsl.w	ip, ip, r3
 800218e:	ea4c 0707 	orr.w	r7, ip, r7
 8002192:	6087      	str	r7, [r0, #8]
 8002194:	bf00      	nop
 8002196:	8887      	ldrh	r7, [r0, #4]
 8002198:	b2bf      	uxth	r7, r7
 800219a:	ea27 0404 	bic.w	r4, r7, r4
 800219e:	8084      	strh	r4, [r0, #4]
 80021a0:	798c      	ldrb	r4, [r1, #6]
 80021a2:	8887      	ldrh	r7, [r0, #4]
 80021a4:	4094      	lsls	r4, r2
 80021a6:	433c      	orrs	r4, r7
 80021a8:	b2a4      	uxth	r4, r4
 80021aa:	8084      	strh	r4, [r0, #4]
 80021ac:	2403      	movs	r4, #3
 80021ae:	6807      	ldr	r7, [r0, #0]
 80021b0:	409c      	lsls	r4, r3
 80021b2:	43e4      	mvns	r4, r4
 80021b4:	4027      	ands	r7, r4
 80021b6:	6007      	str	r7, [r0, #0]
 80021b8:	6807      	ldr	r7, [r0, #0]
 80021ba:	409d      	lsls	r5, r3
 80021bc:	433d      	orrs	r5, r7
 80021be:	6005      	str	r5, [r0, #0]
 80021c0:	68c5      	ldr	r5, [r0, #12]
 80021c2:	402c      	ands	r4, r5
 80021c4:	79cd      	ldrb	r5, [r1, #7]
 80021c6:	409d      	lsls	r5, r3
 80021c8:	432c      	orrs	r4, r5
 80021ca:	60c4      	str	r4, [r0, #12]
 80021cc:	3201      	adds	r2, #1
 80021ce:	2a10      	cmp	r2, #16
 80021d0:	f103 0302 	add.w	r3, r3, #2
 80021d4:	d1c2      	bne.n	800215c <GPIO_Init+0x10>
 80021d6:	bdf0      	pop	{r4, r5, r6, r7, pc}

080021d8 <GPIO_SetBits>:
 80021d8:	bf00      	nop
 80021da:	bf00      	nop
 80021dc:	6181      	str	r1, [r0, #24]
 80021de:	4770      	bx	lr

080021e0 <GPIO_ResetBits>:
 80021e0:	bf00      	nop
 80021e2:	bf00      	nop
 80021e4:	8501      	strh	r1, [r0, #40]	; 0x28
 80021e6:	4770      	bx	lr

080021e8 <GPIO_PinAFConfig>:
 80021e8:	b510      	push	{r4, lr}
 80021ea:	bf00      	nop
 80021ec:	bf00      	nop
 80021ee:	bf00      	nop
 80021f0:	f001 0307 	and.w	r3, r1, #7
 80021f4:	08c9      	lsrs	r1, r1, #3
 80021f6:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 80021fa:	009b      	lsls	r3, r3, #2
 80021fc:	6a04      	ldr	r4, [r0, #32]
 80021fe:	210f      	movs	r1, #15
 8002200:	4099      	lsls	r1, r3
 8002202:	ea24 0101 	bic.w	r1, r4, r1
 8002206:	6201      	str	r1, [r0, #32]
 8002208:	6a01      	ldr	r1, [r0, #32]
 800220a:	fa02 f303 	lsl.w	r3, r2, r3
 800220e:	430b      	orrs	r3, r1
 8002210:	6203      	str	r3, [r0, #32]
 8002212:	bd10      	pop	{r4, pc}

08002214 <led_on>:
 8002214:	0401      	lsls	r1, r0, #16
 8002216:	d503      	bpl.n	8002220 <led_on+0xc>
 8002218:	4b08      	ldr	r3, [pc, #32]	; (800223c <led_on+0x28>)
 800221a:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800221e:	619a      	str	r2, [r3, #24]
 8002220:	0702      	lsls	r2, r0, #28
 8002222:	d503      	bpl.n	800222c <led_on+0x18>
 8002224:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002228:	2208      	movs	r2, #8
 800222a:	851a      	strh	r2, [r3, #40]	; 0x28
 800222c:	07c3      	lsls	r3, r0, #31
 800222e:	d503      	bpl.n	8002238 <led_on+0x24>
 8002230:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002234:	2201      	movs	r2, #1
 8002236:	619a      	str	r2, [r3, #24]
 8002238:	4770      	bx	lr
 800223a:	bf00      	nop
 800223c:	48000400 	.word	0x48000400

08002240 <led_off>:
 8002240:	0402      	lsls	r2, r0, #16
 8002242:	d503      	bpl.n	800224c <led_off+0xc>
 8002244:	4b08      	ldr	r3, [pc, #32]	; (8002268 <led_off+0x28>)
 8002246:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800224a:	851a      	strh	r2, [r3, #40]	; 0x28
 800224c:	0703      	lsls	r3, r0, #28
 800224e:	d503      	bpl.n	8002258 <led_off+0x18>
 8002250:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002254:	2208      	movs	r2, #8
 8002256:	619a      	str	r2, [r3, #24]
 8002258:	07c0      	lsls	r0, r0, #31
 800225a:	d503      	bpl.n	8002264 <led_off+0x24>
 800225c:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002260:	2201      	movs	r2, #1
 8002262:	851a      	strh	r2, [r3, #40]	; 0x28
 8002264:	4770      	bx	lr
 8002266:	bf00      	nop
 8002268:	48000400 	.word	0x48000400

0800226c <gpio_init>:
 800226c:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 8002270:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8002274:	2101      	movs	r1, #1
 8002276:	f7ff fe1d 	bl	8001eb4 <RCC_AHBPeriphClockCmd>
 800227a:	f8df 90a8 	ldr.w	r9, [pc, #168]	; 8002324 <gpio_init+0xb8>
 800227e:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8002282:	2101      	movs	r1, #1
 8002284:	f7ff fe16 	bl	8001eb4 <RCC_AHBPeriphClockCmd>
 8002288:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 800228c:	2101      	movs	r1, #1
 800228e:	f7ff fe11 	bl	8001eb4 <RCC_AHBPeriphClockCmd>
 8002292:	2400      	movs	r4, #0
 8002294:	2501      	movs	r5, #1
 8002296:	2603      	movs	r6, #3
 8002298:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 800229c:	4648      	mov	r0, r9
 800229e:	4669      	mov	r1, sp
 80022a0:	2708      	movs	r7, #8
 80022a2:	f8cd 8000 	str.w	r8, [sp]
 80022a6:	f88d 5004 	strb.w	r5, [sp, #4]
 80022aa:	f88d 4006 	strb.w	r4, [sp, #6]
 80022ae:	f88d 6005 	strb.w	r6, [sp, #5]
 80022b2:	f88d 4007 	strb.w	r4, [sp, #7]
 80022b6:	f7ff ff49 	bl	800214c <GPIO_Init>
 80022ba:	4669      	mov	r1, sp
 80022bc:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80022c0:	9700      	str	r7, [sp, #0]
 80022c2:	f88d 5004 	strb.w	r5, [sp, #4]
 80022c6:	f88d 4006 	strb.w	r4, [sp, #6]
 80022ca:	f88d 6005 	strb.w	r6, [sp, #5]
 80022ce:	f88d 4007 	strb.w	r4, [sp, #7]
 80022d2:	f7ff ff3b 	bl	800214c <GPIO_Init>
 80022d6:	4669      	mov	r1, sp
 80022d8:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80022dc:	9500      	str	r5, [sp, #0]
 80022de:	f88d 5004 	strb.w	r5, [sp, #4]
 80022e2:	f88d 4006 	strb.w	r4, [sp, #6]
 80022e6:	f88d 6005 	strb.w	r6, [sp, #5]
 80022ea:	f88d 4007 	strb.w	r4, [sp, #7]
 80022ee:	f7ff ff2d 	bl	800214c <GPIO_Init>
 80022f2:	f44f 7300 	mov.w	r3, #512	; 0x200
 80022f6:	4669      	mov	r1, sp
 80022f8:	4648      	mov	r0, r9
 80022fa:	9300      	str	r3, [sp, #0]
 80022fc:	f88d 4004 	strb.w	r4, [sp, #4]
 8002300:	f88d 6005 	strb.w	r6, [sp, #5]
 8002304:	f88d 4007 	strb.w	r4, [sp, #7]
 8002308:	f7ff ff20 	bl	800214c <GPIO_Init>
 800230c:	4640      	mov	r0, r8
 800230e:	f7ff ff81 	bl	8002214 <led_on>
 8002312:	4638      	mov	r0, r7
 8002314:	f7ff ff94 	bl	8002240 <led_off>
 8002318:	4628      	mov	r0, r5
 800231a:	f7ff ff91 	bl	8002240 <led_off>
 800231e:	b003      	add	sp, #12
 8002320:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8002324:	48000400 	.word	0x48000400

08002328 <get_key>:
 8002328:	4b02      	ldr	r3, [pc, #8]	; (8002334 <get_key+0xc>)
 800232a:	8a18      	ldrh	r0, [r3, #16]
 800232c:	43c0      	mvns	r0, r0
 800232e:	f400 7000 	and.w	r0, r0, #512	; 0x200
 8002332:	4770      	bx	lr
 8002334:	48000400 	.word	0x48000400

08002338 <_init>:
 8002338:	e1a0c00d 	mov	ip, sp
 800233c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8002340:	e24cb004 	sub	fp, ip, #4
 8002344:	e24bd028 	sub	sp, fp, #40	; 0x28
 8002348:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 800234c:	e12fff1e 	bx	lr

08002350 <_fini>:
 8002350:	e1a0c00d 	mov	ip, sp
 8002354:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8002358:	e24cb004 	sub	fp, ip, #4
 800235c:	e24bd028 	sub	sp, fp, #40	; 0x28
 8002360:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8002364:	e12fff1e 	bx	lr
 8002368:	69647473 	.word	0x69647473
 800236c:	6e69206f 	.word	0x6e69206f
 8002370:	64207469 	.word	0x64207469
 8002374:	0a656e6f 	.word	0x0a656e6f
 8002378:	00          	.byte	0x00
 8002379:	41          	.byte	0x41
 800237a:	2b54      	.short	0x2b54
 800237c:	4d504943 	.word	0x4d504943
 8002380:	313d5855 	.word	0x313d5855
 8002384:	41000a0d 	.word	0x41000a0d
 8002388:	49432b54 	.word	0x49432b54
 800238c:	58554d50 	.word	0x58554d50
 8002390:	0a0d303d 	.word	0x0a0d303d
 8002394:	2b544100 	.word	0x2b544100
 8002398:	4f4d5743 	.word	0x4f4d5743
 800239c:	313d4544 	.word	0x313d4544
 80023a0:	41000a0d 	.word	0x41000a0d
 80023a4:	57432b54 	.word	0x57432b54
 80023a8:	3d50414a 	.word	0x3d50414a
 80023ac:	69640022 	.word	0x69640022
 80023b0:	6e6f6373 	.word	0x6e6f6373
 80023b4:	7463656e 	.word	0x7463656e
 80023b8:	76006465 	.word	0x76006465
 80023bc:	68797265 	.word	0x68797265
 80023c0:	00647261 	.word	0x00647261
 80023c4:	000a0d22 	.word	0x000a0d22
 80023c8:	432b5441 	.word	0x432b5441
 80023cc:	45535049 	.word	0x45535049
 80023d0:	52455652 	.word	0x52455652
 80023d4:	382c313d 	.word	0x382c313d
 80023d8:	000a0d30 	.word	0x000a0d30
 80023dc:	432b5441 	.word	0x432b5441
 80023e0:	54535049 	.word	0x54535049
 80023e4:	3d545241 	.word	0x3d545241
 80023e8:	50435422 	.word	0x50435422
 80023ec:	00222c22 	.word	0x00222c22
 80023f0:	41002c22 	.word	0x41002c22
 80023f4:	49432b54 	.word	0x49432b54
 80023f8:	4e455350 	.word	0x4e455350
 80023fc:	3e003d44 	.word	0x3e003d44
 8002400:	2b544100 	.word	0x2b544100
 8002404:	43504943 	.word	0x43504943
 8002408:	45534f4c 	.word	0x45534f4c
 800240c:	53000a0d 	.word	0x53000a0d
 8002410:	20444e45 	.word	0x20444e45
 8002414:	2b004b4f 	.word	0x2b004b4f
 8002418:	2c445049 	.word	0x2c445049
 800241c:	00          	.byte	0x00
 800241d:	0a          	.byte	0x0a
 800241e:	6577      	.short	0x6577
 8002420:	6d6f636c 	.word	0x6d6f636c
 8002424:	6f742065 	.word	0x6f742065
 8002428:	7a755320 	.word	0x7a755320
 800242c:	4f616875 	.word	0x4f616875
 8002430:	5f5e2053 	.word	0x5f5e2053
 8002434:	2e32205e 	.word	0x2e32205e
 8002438:	0a362e30 	.word	0x0a362e30
 800243c:	4c495542 	.word	0x4c495542
 8002440:	65462044 	.word	0x65462044
 8002444:	36322062 	.word	0x36322062
 8002448:	31303220 	.word	0x31303220
 800244c:	39312036 	.word	0x39312036
 8002450:	3a31343a 	.word	0x3a31343a
 8002454:	000a3033 	.word	0x000a3033
 8002458:	2e323931 	.word	0x2e323931
 800245c:	2e383631 	.word	0x2e383631
 8002460:	00322e32 	.word	0x00322e32
 8002464:	38707365 	.word	0x38707365
 8002468:	20363632 	.word	0x20363632
 800246c:	7373656d 	.word	0x7373656d
 8002470:	00656761 	.word	0x00656761
 8002474:	6f727265 	.word	0x6f727265
 8002478:	6f632072 	.word	0x6f632072
 800247c:	25206564 	.word	0x25206564
 8002480:	75253a75 	.word	0x75253a75
 8002484:	0000000a 	.word	0x0000000a

08002488 <__EH_FRAME_BEGIN__>:
 8002488:	00000000                                ....
