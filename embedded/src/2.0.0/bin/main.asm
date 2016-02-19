
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <main>:
 8000188:	b508      	push	{r3, lr}
 800018a:	f001 f847 	bl	800121c <lib_low_level_init>
 800018e:	f000 f921 	bl	80003d4 <lib_os_init>
 8000192:	4905      	ldr	r1, [pc, #20]	; (80001a8 <main+0x20>)
 8000194:	4805      	ldr	r0, [pc, #20]	; (80001ac <main+0x24>)
 8000196:	f44f 7200 	mov.w	r2, #512	; 0x200
 800019a:	2306      	movs	r3, #6
 800019c:	f000 f88a 	bl	80002b4 <create_thread>
 80001a0:	f000 f882 	bl	80002a8 <kernel_start>
 80001a4:	2000      	movs	r0, #0
 80001a6:	bd08      	pop	{r3, pc}
 80001a8:	20000480 	.word	0x20000480
 80001ac:	08000d5d 	.word	0x08000d5d

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
 80001c8:	200006c8 	.word	0x200006c8
 80001cc:	20000680 	.word	0x20000680

080001d0 <null_thread>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f001 f9d1 	bl	8001578 <sleep>
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
 8000234:	20000680 	.word	0x20000680
 8000238:	200006c8 	.word	0x200006c8

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
 800027c:	200006c8 	.word	0x200006c8
 8000280:	20000680 	.word	0x20000680

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
 80002a4:	200006c8 	.word	0x200006c8

080002a8 <kernel_start>:
 80002a8:	b508      	push	{r3, lr}
 80002aa:	f001 f953 	bl	8001554 <sys_tick_init>
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
 8000320:	20000680 	.word	0x20000680
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
 800035c:	20000680 	.word	0x20000680
 8000360:	200006c8 	.word	0x200006c8
 8000364:	080001d1 	.word	0x080001d1
 8000368:	200006cc 	.word	0x200006cc

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
 80003ac:	20000680 	.word	0x20000680

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
 80003d0:	20000680 	.word	0x20000680

080003d4 <lib_os_init>:
 80003d4:	b508      	push	{r3, lr}
 80003d6:	f7ff ffa7 	bl	8000328 <kernel_init>
 80003da:	f000 f8f9 	bl	80005d0 <messages_init>
 80003de:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80003e2:	f000 b8cd 	b.w	8000580 <stdio_init>
	...

080003e8 <putc_>:
 80003e8:	b538      	push	{r3, r4, r5, lr}
 80003ea:	4c06      	ldr	r4, [pc, #24]	; (8000404 <putc_+0x1c>)
 80003ec:	4605      	mov	r5, r0
 80003ee:	4620      	mov	r0, r4
 80003f0:	f000 f912 	bl	8000618 <mutex_lock>
 80003f4:	4628      	mov	r0, r5
 80003f6:	f000 fdcf 	bl	8000f98 <uart_write>
 80003fa:	4620      	mov	r0, r4
 80003fc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000400:	f000 b926 	b.w	8000650 <mutex_unlock>
 8000404:	2000074c 	.word	0x2000074c

08000408 <puts_>:
 8000408:	b510      	push	{r4, lr}
 800040a:	4604      	mov	r4, r0
 800040c:	4807      	ldr	r0, [pc, #28]	; (800042c <puts_+0x24>)
 800040e:	f000 f903 	bl	8000618 <mutex_lock>
 8000412:	3c01      	subs	r4, #1
 8000414:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000418:	b110      	cbz	r0, 8000420 <puts_+0x18>
 800041a:	f7ff ffe5 	bl	80003e8 <putc_>
 800041e:	e7f9      	b.n	8000414 <puts_+0xc>
 8000420:	4802      	ldr	r0, [pc, #8]	; (800042c <puts_+0x24>)
 8000422:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000426:	f000 b913 	b.w	8000650 <mutex_unlock>
 800042a:	bf00      	nop
 800042c:	20000758 	.word	0x20000758

08000430 <puti_>:
 8000430:	b530      	push	{r4, r5, lr}
 8000432:	b085      	sub	sp, #20
 8000434:	1e03      	subs	r3, r0, #0
 8000436:	f04f 0200 	mov.w	r2, #0
 800043a:	bfa8      	it	ge
 800043c:	4614      	movge	r4, r2
 800043e:	f88d 200f 	strb.w	r2, [sp, #15]
 8000442:	bfbc      	itt	lt
 8000444:	425b      	neglt	r3, r3
 8000446:	2401      	movlt	r4, #1
 8000448:	220a      	movs	r2, #10
 800044a:	210a      	movs	r1, #10
 800044c:	fb93 f5f1 	sdiv	r5, r3, r1
 8000450:	fb01 3315 	mls	r3, r1, r5, r3
 8000454:	a801      	add	r0, sp, #4
 8000456:	3330      	adds	r3, #48	; 0x30
 8000458:	5413      	strb	r3, [r2, r0]
 800045a:	1e51      	subs	r1, r2, #1
 800045c:	462b      	mov	r3, r5
 800045e:	b10d      	cbz	r5, 8000464 <puti_+0x34>
 8000460:	460a      	mov	r2, r1
 8000462:	e7f2      	b.n	800044a <puti_+0x1a>
 8000464:	b12c      	cbz	r4, 8000472 <puti_+0x42>
 8000466:	ab04      	add	r3, sp, #16
 8000468:	440b      	add	r3, r1
 800046a:	222d      	movs	r2, #45	; 0x2d
 800046c:	f803 2c0c 	strb.w	r2, [r3, #-12]
 8000470:	460a      	mov	r2, r1
 8000472:	4410      	add	r0, r2
 8000474:	f7ff ffc8 	bl	8000408 <puts_>
 8000478:	b005      	add	sp, #20
 800047a:	bd30      	pop	{r4, r5, pc}

0800047c <putui_>:
 800047c:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800047e:	2300      	movs	r3, #0
 8000480:	f88d 300f 	strb.w	r3, [sp, #15]
 8000484:	230a      	movs	r3, #10
 8000486:	240a      	movs	r4, #10
 8000488:	fbb0 f1f4 	udiv	r1, r0, r4
 800048c:	fb04 0011 	mls	r0, r4, r1, r0
 8000490:	aa01      	add	r2, sp, #4
 8000492:	3030      	adds	r0, #48	; 0x30
 8000494:	5498      	strb	r0, [r3, r2]
 8000496:	1e5c      	subs	r4, r3, #1
 8000498:	4608      	mov	r0, r1
 800049a:	b109      	cbz	r1, 80004a0 <putui_+0x24>
 800049c:	4623      	mov	r3, r4
 800049e:	e7f2      	b.n	8000486 <putui_+0xa>
 80004a0:	18d0      	adds	r0, r2, r3
 80004a2:	f7ff ffb1 	bl	8000408 <puts_>
 80004a6:	b004      	add	sp, #16
 80004a8:	bd10      	pop	{r4, pc}

080004aa <putx_>:
 80004aa:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80004ac:	2300      	movs	r3, #0
 80004ae:	f88d 300f 	strb.w	r3, [sp, #15]
 80004b2:	230a      	movs	r3, #10
 80004b4:	f000 010f 	and.w	r1, r0, #15
 80004b8:	2909      	cmp	r1, #9
 80004ba:	aa01      	add	r2, sp, #4
 80004bc:	bf94      	ite	ls
 80004be:	3130      	addls	r1, #48	; 0x30
 80004c0:	3157      	addhi	r1, #87	; 0x57
 80004c2:	0900      	lsrs	r0, r0, #4
 80004c4:	54d1      	strb	r1, [r2, r3]
 80004c6:	f103 31ff 	add.w	r1, r3, #4294967295
 80004ca:	d001      	beq.n	80004d0 <putx_+0x26>
 80004cc:	460b      	mov	r3, r1
 80004ce:	e7f1      	b.n	80004b4 <putx_+0xa>
 80004d0:	18d0      	adds	r0, r2, r3
 80004d2:	f7ff ff99 	bl	8000408 <puts_>
 80004d6:	b005      	add	sp, #20
 80004d8:	f85d fb04 	ldr.w	pc, [sp], #4

080004dc <printf_>:
 80004dc:	b40f      	push	{r0, r1, r2, r3}
 80004de:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80004e0:	ac06      	add	r4, sp, #24
 80004e2:	4826      	ldr	r0, [pc, #152]	; (800057c <printf_+0xa0>)
 80004e4:	f854 5b04 	ldr.w	r5, [r4], #4
 80004e8:	f000 f896 	bl	8000618 <mutex_lock>
 80004ec:	9401      	str	r4, [sp, #4]
 80004ee:	2400      	movs	r4, #0
 80004f0:	5d28      	ldrb	r0, [r5, r4]
 80004f2:	2800      	cmp	r0, #0
 80004f4:	d039      	beq.n	800056a <printf_+0x8e>
 80004f6:	2825      	cmp	r0, #37	; 0x25
 80004f8:	d003      	beq.n	8000502 <printf_+0x26>
 80004fa:	f7ff ff75 	bl	80003e8 <putc_>
 80004fe:	3401      	adds	r4, #1
 8000500:	e7f6      	b.n	80004f0 <printf_+0x14>
 8000502:	192b      	adds	r3, r5, r4
 8000504:	7858      	ldrb	r0, [r3, #1]
 8000506:	2869      	cmp	r0, #105	; 0x69
 8000508:	d016      	beq.n	8000538 <printf_+0x5c>
 800050a:	d808      	bhi.n	800051e <printf_+0x42>
 800050c:	2825      	cmp	r0, #37	; 0x25
 800050e:	d028      	beq.n	8000562 <printf_+0x86>
 8000510:	2863      	cmp	r0, #99	; 0x63
 8000512:	d128      	bne.n	8000566 <printf_+0x8a>
 8000514:	9b01      	ldr	r3, [sp, #4]
 8000516:	1d1a      	adds	r2, r3, #4
 8000518:	9201      	str	r2, [sp, #4]
 800051a:	7818      	ldrb	r0, [r3, #0]
 800051c:	e021      	b.n	8000562 <printf_+0x86>
 800051e:	2875      	cmp	r0, #117	; 0x75
 8000520:	d011      	beq.n	8000546 <printf_+0x6a>
 8000522:	2878      	cmp	r0, #120	; 0x78
 8000524:	d016      	beq.n	8000554 <printf_+0x78>
 8000526:	2873      	cmp	r0, #115	; 0x73
 8000528:	d11d      	bne.n	8000566 <printf_+0x8a>
 800052a:	9b01      	ldr	r3, [sp, #4]
 800052c:	1d1a      	adds	r2, r3, #4
 800052e:	6818      	ldr	r0, [r3, #0]
 8000530:	9201      	str	r2, [sp, #4]
 8000532:	f7ff ff69 	bl	8000408 <puts_>
 8000536:	e016      	b.n	8000566 <printf_+0x8a>
 8000538:	9b01      	ldr	r3, [sp, #4]
 800053a:	1d1a      	adds	r2, r3, #4
 800053c:	6818      	ldr	r0, [r3, #0]
 800053e:	9201      	str	r2, [sp, #4]
 8000540:	f7ff ff76 	bl	8000430 <puti_>
 8000544:	e00f      	b.n	8000566 <printf_+0x8a>
 8000546:	9b01      	ldr	r3, [sp, #4]
 8000548:	1d1a      	adds	r2, r3, #4
 800054a:	6818      	ldr	r0, [r3, #0]
 800054c:	9201      	str	r2, [sp, #4]
 800054e:	f7ff ff95 	bl	800047c <putui_>
 8000552:	e008      	b.n	8000566 <printf_+0x8a>
 8000554:	9b01      	ldr	r3, [sp, #4]
 8000556:	1d1a      	adds	r2, r3, #4
 8000558:	6818      	ldr	r0, [r3, #0]
 800055a:	9201      	str	r2, [sp, #4]
 800055c:	f7ff ffa5 	bl	80004aa <putx_>
 8000560:	e001      	b.n	8000566 <printf_+0x8a>
 8000562:	f7ff ff41 	bl	80003e8 <putc_>
 8000566:	3402      	adds	r4, #2
 8000568:	e7c2      	b.n	80004f0 <printf_+0x14>
 800056a:	4804      	ldr	r0, [pc, #16]	; (800057c <printf_+0xa0>)
 800056c:	f000 f870 	bl	8000650 <mutex_unlock>
 8000570:	b003      	add	sp, #12
 8000572:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000576:	b004      	add	sp, #16
 8000578:	4770      	bx	lr
 800057a:	bf00      	nop
 800057c:	20000754 	.word	0x20000754

08000580 <stdio_init>:
 8000580:	b510      	push	{r4, lr}
 8000582:	480e      	ldr	r0, [pc, #56]	; (80005bc <stdio_init+0x3c>)
 8000584:	f000 f83e 	bl	8000604 <mutex_init>
 8000588:	480d      	ldr	r0, [pc, #52]	; (80005c0 <stdio_init+0x40>)
 800058a:	f000 f83b 	bl	8000604 <mutex_init>
 800058e:	480d      	ldr	r0, [pc, #52]	; (80005c4 <stdio_init+0x44>)
 8000590:	f000 f838 	bl	8000604 <mutex_init>
 8000594:	480c      	ldr	r0, [pc, #48]	; (80005c8 <stdio_init+0x48>)
 8000596:	f000 f835 	bl	8000604 <mutex_init>
 800059a:	2408      	movs	r4, #8
 800059c:	2020      	movs	r0, #32
 800059e:	f7ff ff23 	bl	80003e8 <putc_>
 80005a2:	3c01      	subs	r4, #1
 80005a4:	d1fa      	bne.n	800059c <stdio_init+0x1c>
 80005a6:	2420      	movs	r4, #32
 80005a8:	200a      	movs	r0, #10
 80005aa:	f7ff ff1d 	bl	80003e8 <putc_>
 80005ae:	3c01      	subs	r4, #1
 80005b0:	d1fa      	bne.n	80005a8 <stdio_init+0x28>
 80005b2:	4806      	ldr	r0, [pc, #24]	; (80005cc <stdio_init+0x4c>)
 80005b4:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005b8:	f7ff bf90 	b.w	80004dc <printf_>
 80005bc:	2000074c 	.word	0x2000074c
 80005c0:	20000750 	.word	0x20000750
 80005c4:	20000758 	.word	0x20000758
 80005c8:	20000754 	.word	0x20000754
 80005cc:	08001e14 	.word	0x08001e14

080005d0 <messages_init>:
 80005d0:	4a0a      	ldr	r2, [pc, #40]	; (80005fc <messages_init+0x2c>)
 80005d2:	2300      	movs	r3, #0
 80005d4:	b510      	push	{r4, lr}
 80005d6:	6013      	str	r3, [r2, #0]
 80005d8:	6053      	str	r3, [r2, #4]
 80005da:	6093      	str	r3, [r2, #8]
 80005dc:	60d3      	str	r3, [r2, #12]
 80005de:	6113      	str	r3, [r2, #16]
 80005e0:	6153      	str	r3, [r2, #20]
 80005e2:	4c07      	ldr	r4, [pc, #28]	; (8000600 <messages_init+0x30>)
 80005e4:	0118      	lsls	r0, r3, #4
 80005e6:	1821      	adds	r1, r4, r0
 80005e8:	3301      	adds	r3, #1
 80005ea:	2200      	movs	r2, #0
 80005ec:	2b04      	cmp	r3, #4
 80005ee:	604a      	str	r2, [r1, #4]
 80005f0:	5022      	str	r2, [r4, r0]
 80005f2:	60ca      	str	r2, [r1, #12]
 80005f4:	608a      	str	r2, [r1, #8]
 80005f6:	d1f4      	bne.n	80005e2 <messages_init+0x12>
 80005f8:	bd10      	pop	{r4, pc}
 80005fa:	bf00      	nop
 80005fc:	2000075c 	.word	0x2000075c
 8000600:	20000774 	.word	0x20000774

08000604 <mutex_init>:
 8000604:	b510      	push	{r4, lr}
 8000606:	4604      	mov	r4, r0
 8000608:	f7ff fe3c 	bl	8000284 <sched_off>
 800060c:	2300      	movs	r3, #0
 800060e:	6023      	str	r3, [r4, #0]
 8000610:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000614:	f7ff be38 	b.w	8000288 <sched_on>

08000618 <mutex_lock>:
 8000618:	b513      	push	{r0, r1, r4, lr}
 800061a:	4604      	mov	r4, r0
 800061c:	f7ff fe32 	bl	8000284 <sched_off>
 8000620:	6823      	ldr	r3, [r4, #0]
 8000622:	9301      	str	r3, [sp, #4]
 8000624:	f7ff fe30 	bl	8000288 <sched_on>
 8000628:	9b01      	ldr	r3, [sp, #4]
 800062a:	b10b      	cbz	r3, 8000630 <mutex_lock+0x18>
 800062c:	f7ff fe9e 	bl	800036c <set_wait_state>
 8000630:	9b01      	ldr	r3, [sp, #4]
 8000632:	2b00      	cmp	r3, #0
 8000634:	d1f2      	bne.n	800061c <mutex_lock+0x4>
 8000636:	f7ff fe25 	bl	8000284 <sched_off>
 800063a:	6823      	ldr	r3, [r4, #0]
 800063c:	9301      	str	r3, [sp, #4]
 800063e:	9b01      	ldr	r3, [sp, #4]
 8000640:	2b00      	cmp	r3, #0
 8000642:	d1eb      	bne.n	800061c <mutex_lock+0x4>
 8000644:	2301      	movs	r3, #1
 8000646:	6023      	str	r3, [r4, #0]
 8000648:	f7ff fe1e 	bl	8000288 <sched_on>
 800064c:	b002      	add	sp, #8
 800064e:	bd10      	pop	{r4, pc}

08000650 <mutex_unlock>:
 8000650:	b508      	push	{r3, lr}
 8000652:	f7ff ffd7 	bl	8000604 <mutex_init>
 8000656:	f7ff feab 	bl	80003b0 <wake_up_threads>
 800065a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800065e:	f7ff be15 	b.w	800028c <yield>

08000662 <lsm9ds0_uninit>:
 8000662:	b508      	push	{r3, lr}
 8000664:	20d4      	movs	r0, #212	; 0xd4
 8000666:	2120      	movs	r1, #32
 8000668:	2200      	movs	r2, #0
 800066a:	f000 ff07 	bl	800147c <i2c_write_reg>
 800066e:	203c      	movs	r0, #60	; 0x3c
 8000670:	2120      	movs	r1, #32
 8000672:	2200      	movs	r2, #0
 8000674:	f000 ff02 	bl	800147c <i2c_write_reg>
 8000678:	203c      	movs	r0, #60	; 0x3c
 800067a:	2124      	movs	r1, #36	; 0x24
 800067c:	2200      	movs	r2, #0
 800067e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000682:	f000 befb 	b.w	800147c <i2c_write_reg>
	...

08000688 <lsm9ds0_read>:
 8000688:	b538      	push	{r3, r4, r5, lr}
 800068a:	2128      	movs	r1, #40	; 0x28
 800068c:	20d4      	movs	r0, #212	; 0xd4
 800068e:	f000 ff08 	bl	80014a2 <i2c_read_reg>
 8000692:	2129      	movs	r1, #41	; 0x29
 8000694:	4605      	mov	r5, r0
 8000696:	20d4      	movs	r0, #212	; 0xd4
 8000698:	f000 ff03 	bl	80014a2 <i2c_read_reg>
 800069c:	4c38      	ldr	r4, [pc, #224]	; (8000780 <lsm9ds0_read+0xf8>)
 800069e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006a2:	81a0      	strh	r0, [r4, #12]
 80006a4:	212a      	movs	r1, #42	; 0x2a
 80006a6:	20d4      	movs	r0, #212	; 0xd4
 80006a8:	f000 fefb 	bl	80014a2 <i2c_read_reg>
 80006ac:	212b      	movs	r1, #43	; 0x2b
 80006ae:	4605      	mov	r5, r0
 80006b0:	20d4      	movs	r0, #212	; 0xd4
 80006b2:	f000 fef6 	bl	80014a2 <i2c_read_reg>
 80006b6:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006ba:	81e0      	strh	r0, [r4, #14]
 80006bc:	212c      	movs	r1, #44	; 0x2c
 80006be:	20d4      	movs	r0, #212	; 0xd4
 80006c0:	f000 feef 	bl	80014a2 <i2c_read_reg>
 80006c4:	212d      	movs	r1, #45	; 0x2d
 80006c6:	4605      	mov	r5, r0
 80006c8:	20d4      	movs	r0, #212	; 0xd4
 80006ca:	f000 feea 	bl	80014a2 <i2c_read_reg>
 80006ce:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006d2:	8220      	strh	r0, [r4, #16]
 80006d4:	2108      	movs	r1, #8
 80006d6:	203c      	movs	r0, #60	; 0x3c
 80006d8:	f000 fee3 	bl	80014a2 <i2c_read_reg>
 80006dc:	2109      	movs	r1, #9
 80006de:	4605      	mov	r5, r0
 80006e0:	203c      	movs	r0, #60	; 0x3c
 80006e2:	f000 fede 	bl	80014a2 <i2c_read_reg>
 80006e6:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006ea:	80e0      	strh	r0, [r4, #6]
 80006ec:	210a      	movs	r1, #10
 80006ee:	203c      	movs	r0, #60	; 0x3c
 80006f0:	f000 fed7 	bl	80014a2 <i2c_read_reg>
 80006f4:	210b      	movs	r1, #11
 80006f6:	4605      	mov	r5, r0
 80006f8:	203c      	movs	r0, #60	; 0x3c
 80006fa:	f000 fed2 	bl	80014a2 <i2c_read_reg>
 80006fe:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000702:	8120      	strh	r0, [r4, #8]
 8000704:	210c      	movs	r1, #12
 8000706:	203c      	movs	r0, #60	; 0x3c
 8000708:	f000 fecb 	bl	80014a2 <i2c_read_reg>
 800070c:	210d      	movs	r1, #13
 800070e:	4605      	mov	r5, r0
 8000710:	203c      	movs	r0, #60	; 0x3c
 8000712:	f000 fec6 	bl	80014a2 <i2c_read_reg>
 8000716:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800071a:	8160      	strh	r0, [r4, #10]
 800071c:	2128      	movs	r1, #40	; 0x28
 800071e:	203c      	movs	r0, #60	; 0x3c
 8000720:	f000 febf 	bl	80014a2 <i2c_read_reg>
 8000724:	2129      	movs	r1, #41	; 0x29
 8000726:	4605      	mov	r5, r0
 8000728:	203c      	movs	r0, #60	; 0x3c
 800072a:	f000 feba 	bl	80014a2 <i2c_read_reg>
 800072e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000732:	8020      	strh	r0, [r4, #0]
 8000734:	212a      	movs	r1, #42	; 0x2a
 8000736:	203c      	movs	r0, #60	; 0x3c
 8000738:	f000 feb3 	bl	80014a2 <i2c_read_reg>
 800073c:	212b      	movs	r1, #43	; 0x2b
 800073e:	4605      	mov	r5, r0
 8000740:	203c      	movs	r0, #60	; 0x3c
 8000742:	f000 feae 	bl	80014a2 <i2c_read_reg>
 8000746:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800074a:	8060      	strh	r0, [r4, #2]
 800074c:	212c      	movs	r1, #44	; 0x2c
 800074e:	203c      	movs	r0, #60	; 0x3c
 8000750:	f000 fea7 	bl	80014a2 <i2c_read_reg>
 8000754:	212d      	movs	r1, #45	; 0x2d
 8000756:	4605      	mov	r5, r0
 8000758:	203c      	movs	r0, #60	; 0x3c
 800075a:	f000 fea2 	bl	80014a2 <i2c_read_reg>
 800075e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000762:	80a0      	strh	r0, [r4, #4]
 8000764:	2105      	movs	r1, #5
 8000766:	203c      	movs	r0, #60	; 0x3c
 8000768:	f000 fe9b 	bl	80014a2 <i2c_read_reg>
 800076c:	2106      	movs	r1, #6
 800076e:	4605      	mov	r5, r0
 8000770:	203c      	movs	r0, #60	; 0x3c
 8000772:	f000 fe96 	bl	80014a2 <i2c_read_reg>
 8000776:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800077a:	8320      	strh	r0, [r4, #24]
 800077c:	bd38      	pop	{r3, r4, r5, pc}
 800077e:	bf00      	nop
 8000780:	20000234 	.word	0x20000234

08000784 <lsm9ds0_init>:
 8000784:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000788:	4d34      	ldr	r5, [pc, #208]	; (800085c <lsm9ds0_init+0xd8>)
 800078a:	2400      	movs	r4, #0
 800078c:	20d4      	movs	r0, #212	; 0xd4
 800078e:	210f      	movs	r1, #15
 8000790:	802c      	strh	r4, [r5, #0]
 8000792:	806c      	strh	r4, [r5, #2]
 8000794:	80ac      	strh	r4, [r5, #4]
 8000796:	80ec      	strh	r4, [r5, #6]
 8000798:	812c      	strh	r4, [r5, #8]
 800079a:	816c      	strh	r4, [r5, #10]
 800079c:	81ac      	strh	r4, [r5, #12]
 800079e:	81ec      	strh	r4, [r5, #14]
 80007a0:	822c      	strh	r4, [r5, #16]
 80007a2:	826c      	strh	r4, [r5, #18]
 80007a4:	82ac      	strh	r4, [r5, #20]
 80007a6:	82ec      	strh	r4, [r5, #22]
 80007a8:	832c      	strh	r4, [r5, #24]
 80007aa:	f000 fe7a 	bl	80014a2 <i2c_read_reg>
 80007ae:	28d4      	cmp	r0, #212	; 0xd4
 80007b0:	4606      	mov	r6, r0
 80007b2:	d14e      	bne.n	8000852 <lsm9ds0_init+0xce>
 80007b4:	203c      	movs	r0, #60	; 0x3c
 80007b6:	210f      	movs	r1, #15
 80007b8:	f000 fe73 	bl	80014a2 <i2c_read_reg>
 80007bc:	2849      	cmp	r0, #73	; 0x49
 80007be:	bf18      	it	ne
 80007c0:	2602      	movne	r6, #2
 80007c2:	d147      	bne.n	8000854 <lsm9ds0_init+0xd0>
 80007c4:	4630      	mov	r0, r6
 80007c6:	2120      	movs	r1, #32
 80007c8:	22ff      	movs	r2, #255	; 0xff
 80007ca:	f000 fe57 	bl	800147c <i2c_write_reg>
 80007ce:	4630      	mov	r0, r6
 80007d0:	2123      	movs	r1, #35	; 0x23
 80007d2:	2218      	movs	r2, #24
 80007d4:	f000 fe52 	bl	800147c <i2c_write_reg>
 80007d8:	203c      	movs	r0, #60	; 0x3c
 80007da:	211f      	movs	r1, #31
 80007dc:	4622      	mov	r2, r4
 80007de:	f000 fe4d 	bl	800147c <i2c_write_reg>
 80007e2:	203c      	movs	r0, #60	; 0x3c
 80007e4:	2120      	movs	r1, #32
 80007e6:	2267      	movs	r2, #103	; 0x67
 80007e8:	f000 fe48 	bl	800147c <i2c_write_reg>
 80007ec:	203c      	movs	r0, #60	; 0x3c
 80007ee:	2121      	movs	r1, #33	; 0x21
 80007f0:	4622      	mov	r2, r4
 80007f2:	f000 fe43 	bl	800147c <i2c_write_reg>
 80007f6:	203c      	movs	r0, #60	; 0x3c
 80007f8:	2124      	movs	r1, #36	; 0x24
 80007fa:	22f4      	movs	r2, #244	; 0xf4
 80007fc:	f000 fe3e 	bl	800147c <i2c_write_reg>
 8000800:	203c      	movs	r0, #60	; 0x3c
 8000802:	2125      	movs	r1, #37	; 0x25
 8000804:	4622      	mov	r2, r4
 8000806:	f000 fe39 	bl	800147c <i2c_write_reg>
 800080a:	203c      	movs	r0, #60	; 0x3c
 800080c:	2126      	movs	r1, #38	; 0x26
 800080e:	2280      	movs	r2, #128	; 0x80
 8000810:	f000 fe34 	bl	800147c <i2c_write_reg>
 8000814:	f7ff ff38 	bl	8000688 <lsm9ds0_read>
 8000818:	2664      	movs	r6, #100	; 0x64
 800081a:	4627      	mov	r7, r4
 800081c:	46a0      	mov	r8, r4
 800081e:	f7ff ff33 	bl	8000688 <lsm9ds0_read>
 8000822:	f9b5 200c 	ldrsh.w	r2, [r5, #12]
 8000826:	4b0d      	ldr	r3, [pc, #52]	; (800085c <lsm9ds0_init+0xd8>)
 8000828:	4490      	add	r8, r2
 800082a:	f9b5 200e 	ldrsh.w	r2, [r5, #14]
 800082e:	4417      	add	r7, r2
 8000830:	f9b5 2010 	ldrsh.w	r2, [r5, #16]
 8000834:	3e01      	subs	r6, #1
 8000836:	4414      	add	r4, r2
 8000838:	d1f1      	bne.n	800081e <lsm9ds0_init+0x9a>
 800083a:	2264      	movs	r2, #100	; 0x64
 800083c:	fb98 f8f2 	sdiv	r8, r8, r2
 8000840:	fb97 f7f2 	sdiv	r7, r7, r2
 8000844:	fb94 f4f2 	sdiv	r4, r4, r2
 8000848:	f8a3 8012 	strh.w	r8, [r3, #18]
 800084c:	829f      	strh	r7, [r3, #20]
 800084e:	82dc      	strh	r4, [r3, #22]
 8000850:	e000      	b.n	8000854 <lsm9ds0_init+0xd0>
 8000852:	2601      	movs	r6, #1
 8000854:	4630      	mov	r0, r6
 8000856:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800085a:	bf00      	nop
 800085c:	20000234 	.word	0x20000234

08000860 <rgb_i2c_delay>:
 8000860:	bf00      	nop
 8000862:	4770      	bx	lr

08000864 <RGBSetLowSDA>:
 8000864:	b513      	push	{r0, r1, r4, lr}
 8000866:	2301      	movs	r3, #1
 8000868:	2203      	movs	r2, #3
 800086a:	24f0      	movs	r4, #240	; 0xf0
 800086c:	f88d 3004 	strb.w	r3, [sp, #4]
 8000870:	f88d 3006 	strb.w	r3, [sp, #6]
 8000874:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000878:	2300      	movs	r3, #0
 800087a:	4669      	mov	r1, sp
 800087c:	f88d 2005 	strb.w	r2, [sp, #5]
 8000880:	f88d 3007 	strb.w	r3, [sp, #7]
 8000884:	9400      	str	r4, [sp, #0]
 8000886:	f001 f9d5 	bl	8001c34 <GPIO_Init>
 800088a:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800088e:	851c      	strh	r4, [r3, #40]	; 0x28
 8000890:	f7ff ffe6 	bl	8000860 <rgb_i2c_delay>
 8000894:	b002      	add	sp, #8
 8000896:	bd10      	pop	{r4, pc}

08000898 <RGBSetHighSDA>:
 8000898:	b513      	push	{r0, r1, r4, lr}
 800089a:	2300      	movs	r3, #0
 800089c:	2203      	movs	r2, #3
 800089e:	24f0      	movs	r4, #240	; 0xf0
 80008a0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80008a4:	4669      	mov	r1, sp
 80008a6:	f88d 3004 	strb.w	r3, [sp, #4]
 80008aa:	f88d 2005 	strb.w	r2, [sp, #5]
 80008ae:	f88d 3007 	strb.w	r3, [sp, #7]
 80008b2:	9400      	str	r4, [sp, #0]
 80008b4:	f001 f9be 	bl	8001c34 <GPIO_Init>
 80008b8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80008bc:	619c      	str	r4, [r3, #24]
 80008be:	f7ff ffcf 	bl	8000860 <rgb_i2c_delay>
 80008c2:	b002      	add	sp, #8
 80008c4:	bd10      	pop	{r4, pc}
	...

080008c8 <RGBSetLowSCL>:
 80008c8:	4b02      	ldr	r3, [pc, #8]	; (80008d4 <RGBSetLowSCL+0xc>)
 80008ca:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 80008ce:	851a      	strh	r2, [r3, #40]	; 0x28
 80008d0:	f7ff bfc6 	b.w	8000860 <rgb_i2c_delay>
 80008d4:	48000800 	.word	0x48000800

080008d8 <RGBSetHighSCL>:
 80008d8:	4b02      	ldr	r3, [pc, #8]	; (80008e4 <RGBSetHighSCL+0xc>)
 80008da:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 80008de:	619a      	str	r2, [r3, #24]
 80008e0:	f7ff bfbe 	b.w	8000860 <rgb_i2c_delay>
 80008e4:	48000800 	.word	0x48000800

080008e8 <rgb_i2c_init>:
 80008e8:	b573      	push	{r0, r1, r4, r5, r6, lr}
 80008ea:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 80008ee:	2400      	movs	r4, #0
 80008f0:	9300      	str	r3, [sp, #0]
 80008f2:	2603      	movs	r6, #3
 80008f4:	2301      	movs	r3, #1
 80008f6:	4669      	mov	r1, sp
 80008f8:	4812      	ldr	r0, [pc, #72]	; (8000944 <rgb_i2c_init+0x5c>)
 80008fa:	f88d 3004 	strb.w	r3, [sp, #4]
 80008fe:	25f0      	movs	r5, #240	; 0xf0
 8000900:	f88d 6005 	strb.w	r6, [sp, #5]
 8000904:	f88d 4006 	strb.w	r4, [sp, #6]
 8000908:	f88d 4007 	strb.w	r4, [sp, #7]
 800090c:	f001 f992 	bl	8001c34 <GPIO_Init>
 8000910:	4669      	mov	r1, sp
 8000912:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000916:	9500      	str	r5, [sp, #0]
 8000918:	f88d 4004 	strb.w	r4, [sp, #4]
 800091c:	f88d 6005 	strb.w	r6, [sp, #5]
 8000920:	f88d 4007 	strb.w	r4, [sp, #7]
 8000924:	f001 f986 	bl	8001c34 <GPIO_Init>
 8000928:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800092c:	4629      	mov	r1, r5
 800092e:	f001 f9c7 	bl	8001cc0 <GPIO_SetBits>
 8000932:	f7ff ffd1 	bl	80008d8 <RGBSetHighSCL>
 8000936:	f7ff ff95 	bl	8000864 <RGBSetLowSDA>
 800093a:	f7ff ffad 	bl	8000898 <RGBSetHighSDA>
 800093e:	b002      	add	sp, #8
 8000940:	bd70      	pop	{r4, r5, r6, pc}
 8000942:	bf00      	nop
 8000944:	48000800 	.word	0x48000800

08000948 <rgb_i2cStart>:
 8000948:	b508      	push	{r3, lr}
 800094a:	f7ff ffc5 	bl	80008d8 <RGBSetHighSCL>
 800094e:	f7ff ffa3 	bl	8000898 <RGBSetHighSDA>
 8000952:	f7ff ffc1 	bl	80008d8 <RGBSetHighSCL>
 8000956:	f7ff ff85 	bl	8000864 <RGBSetLowSDA>
 800095a:	f7ff ffb5 	bl	80008c8 <RGBSetLowSCL>
 800095e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000962:	f7ff bf99 	b.w	8000898 <RGBSetHighSDA>

08000966 <rgb_i2cStop>:
 8000966:	b508      	push	{r3, lr}
 8000968:	f7ff ffae 	bl	80008c8 <RGBSetLowSCL>
 800096c:	f7ff ff7a 	bl	8000864 <RGBSetLowSDA>
 8000970:	f7ff ffb2 	bl	80008d8 <RGBSetHighSCL>
 8000974:	f7ff ff76 	bl	8000864 <RGBSetLowSDA>
 8000978:	f7ff ffae 	bl	80008d8 <RGBSetHighSCL>
 800097c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000980:	f7ff bf8a 	b.w	8000898 <RGBSetHighSDA>

08000984 <rgb_i2cWrite>:
 8000984:	b538      	push	{r3, r4, r5, lr}
 8000986:	4604      	mov	r4, r0
 8000988:	2508      	movs	r5, #8
 800098a:	f7ff ff9d 	bl	80008c8 <RGBSetLowSCL>
 800098e:	0623      	lsls	r3, r4, #24
 8000990:	d502      	bpl.n	8000998 <rgb_i2cWrite+0x14>
 8000992:	f7ff ff81 	bl	8000898 <RGBSetHighSDA>
 8000996:	e001      	b.n	800099c <rgb_i2cWrite+0x18>
 8000998:	f7ff ff64 	bl	8000864 <RGBSetLowSDA>
 800099c:	3d01      	subs	r5, #1
 800099e:	f7ff ff9b 	bl	80008d8 <RGBSetHighSCL>
 80009a2:	0064      	lsls	r4, r4, #1
 80009a4:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80009a8:	b2e4      	uxtb	r4, r4
 80009aa:	d1ee      	bne.n	800098a <rgb_i2cWrite+0x6>
 80009ac:	f7ff ff8c 	bl	80008c8 <RGBSetLowSCL>
 80009b0:	f7ff ff72 	bl	8000898 <RGBSetHighSDA>
 80009b4:	f7ff ff90 	bl	80008d8 <RGBSetHighSCL>
 80009b8:	f7ff ff86 	bl	80008c8 <RGBSetLowSCL>
 80009bc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80009c0:	f7ff bf4e 	b.w	8000860 <rgb_i2c_delay>

080009c4 <rgb_i2cRead>:
 80009c4:	2300      	movs	r3, #0
 80009c6:	b570      	push	{r4, r5, r6, lr}
 80009c8:	700b      	strb	r3, [r1, #0]
 80009ca:	704b      	strb	r3, [r1, #1]
 80009cc:	708b      	strb	r3, [r1, #2]
 80009ce:	70cb      	strb	r3, [r1, #3]
 80009d0:	4606      	mov	r6, r0
 80009d2:	460c      	mov	r4, r1
 80009d4:	f7ff ff78 	bl	80008c8 <RGBSetLowSCL>
 80009d8:	f7ff ff5e 	bl	8000898 <RGBSetHighSDA>
 80009dc:	2508      	movs	r5, #8
 80009de:	2300      	movs	r3, #0
 80009e0:	5ce2      	ldrb	r2, [r4, r3]
 80009e2:	0052      	lsls	r2, r2, #1
 80009e4:	54e2      	strb	r2, [r4, r3]
 80009e6:	3301      	adds	r3, #1
 80009e8:	2b04      	cmp	r3, #4
 80009ea:	d1f9      	bne.n	80009e0 <rgb_i2cRead+0x1c>
 80009ec:	f7ff ff74 	bl	80008d8 <RGBSetHighSCL>
 80009f0:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80009f4:	8a1b      	ldrh	r3, [r3, #16]
 80009f6:	b29b      	uxth	r3, r3
 80009f8:	06da      	lsls	r2, r3, #27
 80009fa:	d503      	bpl.n	8000a04 <rgb_i2cRead+0x40>
 80009fc:	7822      	ldrb	r2, [r4, #0]
 80009fe:	f042 0201 	orr.w	r2, r2, #1
 8000a02:	7022      	strb	r2, [r4, #0]
 8000a04:	0698      	lsls	r0, r3, #26
 8000a06:	d503      	bpl.n	8000a10 <rgb_i2cRead+0x4c>
 8000a08:	7862      	ldrb	r2, [r4, #1]
 8000a0a:	f042 0201 	orr.w	r2, r2, #1
 8000a0e:	7062      	strb	r2, [r4, #1]
 8000a10:	0659      	lsls	r1, r3, #25
 8000a12:	d503      	bpl.n	8000a1c <rgb_i2cRead+0x58>
 8000a14:	78a2      	ldrb	r2, [r4, #2]
 8000a16:	f042 0201 	orr.w	r2, r2, #1
 8000a1a:	70a2      	strb	r2, [r4, #2]
 8000a1c:	061a      	lsls	r2, r3, #24
 8000a1e:	d503      	bpl.n	8000a28 <rgb_i2cRead+0x64>
 8000a20:	78e3      	ldrb	r3, [r4, #3]
 8000a22:	f043 0301 	orr.w	r3, r3, #1
 8000a26:	70e3      	strb	r3, [r4, #3]
 8000a28:	f7ff ff4e 	bl	80008c8 <RGBSetLowSCL>
 8000a2c:	3d01      	subs	r5, #1
 8000a2e:	d1d6      	bne.n	80009de <rgb_i2cRead+0x1a>
 8000a30:	b10e      	cbz	r6, 8000a36 <rgb_i2cRead+0x72>
 8000a32:	f7ff ff17 	bl	8000864 <RGBSetLowSDA>
 8000a36:	f7ff ff4f 	bl	80008d8 <RGBSetHighSCL>
 8000a3a:	f7ff ff45 	bl	80008c8 <RGBSetLowSCL>
 8000a3e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000a42:	f7ff bf0d 	b.w	8000860 <rgb_i2c_delay>

08000a46 <rgb_i2c_write_reg>:
 8000a46:	b570      	push	{r4, r5, r6, lr}
 8000a48:	4605      	mov	r5, r0
 8000a4a:	460c      	mov	r4, r1
 8000a4c:	4616      	mov	r6, r2
 8000a4e:	f7ff ff7b 	bl	8000948 <rgb_i2cStart>
 8000a52:	4628      	mov	r0, r5
 8000a54:	f7ff ff96 	bl	8000984 <rgb_i2cWrite>
 8000a58:	4620      	mov	r0, r4
 8000a5a:	f7ff ff93 	bl	8000984 <rgb_i2cWrite>
 8000a5e:	4630      	mov	r0, r6
 8000a60:	f7ff ff90 	bl	8000984 <rgb_i2cWrite>
 8000a64:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000a68:	f7ff bf7d 	b.w	8000966 <rgb_i2cStop>

08000a6c <rgb_i2c_read_reg>:
 8000a6c:	b570      	push	{r4, r5, r6, lr}
 8000a6e:	4604      	mov	r4, r0
 8000a70:	460d      	mov	r5, r1
 8000a72:	4616      	mov	r6, r2
 8000a74:	f7ff ff68 	bl	8000948 <rgb_i2cStart>
 8000a78:	4620      	mov	r0, r4
 8000a7a:	f7ff ff83 	bl	8000984 <rgb_i2cWrite>
 8000a7e:	4628      	mov	r0, r5
 8000a80:	f7ff ff80 	bl	8000984 <rgb_i2cWrite>
 8000a84:	f7ff ff60 	bl	8000948 <rgb_i2cStart>
 8000a88:	f044 0001 	orr.w	r0, r4, #1
 8000a8c:	f7ff ff7a 	bl	8000984 <rgb_i2cWrite>
 8000a90:	4631      	mov	r1, r6
 8000a92:	2000      	movs	r0, #0
 8000a94:	f7ff ff96 	bl	80009c4 <rgb_i2cRead>
 8000a98:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000a9c:	f7ff bf63 	b.w	8000966 <rgb_i2cStop>

08000aa0 <rgb_sensor_uninit>:
 8000aa0:	b508      	push	{r3, lr}
 8000aa2:	2008      	movs	r0, #8
 8000aa4:	f001 f986 	bl	8001db4 <led_off>
 8000aa8:	2072      	movs	r0, #114	; 0x72
 8000aaa:	2180      	movs	r1, #128	; 0x80
 8000aac:	2200      	movs	r2, #0
 8000aae:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000ab2:	f7ff bfc8 	b.w	8000a46 <rgb_i2c_write_reg>
	...

08000ab8 <rgb_sensor_read>:
 8000ab8:	b570      	push	{r4, r5, r6, lr}
 8000aba:	f7ff ff45 	bl	8000948 <rgb_i2cStart>
 8000abe:	2072      	movs	r0, #114	; 0x72
 8000ac0:	4d4d      	ldr	r5, [pc, #308]	; (8000bf8 <rgb_sensor_read+0x140>)
 8000ac2:	4c4e      	ldr	r4, [pc, #312]	; (8000bfc <rgb_sensor_read+0x144>)
 8000ac4:	f7ff ff5e 	bl	8000984 <rgb_i2cWrite>
 8000ac8:	20b4      	movs	r0, #180	; 0xb4
 8000aca:	f7ff ff5b 	bl	8000984 <rgb_i2cWrite>
 8000ace:	f7ff ff3b 	bl	8000948 <rgb_i2cStart>
 8000ad2:	2073      	movs	r0, #115	; 0x73
 8000ad4:	f7ff ff56 	bl	8000984 <rgb_i2cWrite>
 8000ad8:	2001      	movs	r0, #1
 8000ada:	4629      	mov	r1, r5
 8000adc:	f7ff ff72 	bl	80009c4 <rgb_i2cRead>
 8000ae0:	782b      	ldrb	r3, [r5, #0]
 8000ae2:	8323      	strh	r3, [r4, #24]
 8000ae4:	786b      	ldrb	r3, [r5, #1]
 8000ae6:	8363      	strh	r3, [r4, #26]
 8000ae8:	78ab      	ldrb	r3, [r5, #2]
 8000aea:	83a3      	strh	r3, [r4, #28]
 8000aec:	78eb      	ldrb	r3, [r5, #3]
 8000aee:	2001      	movs	r0, #1
 8000af0:	4629      	mov	r1, r5
 8000af2:	83e3      	strh	r3, [r4, #30]
 8000af4:	f7ff ff66 	bl	80009c4 <rgb_i2cRead>
 8000af8:	f104 0218 	add.w	r2, r4, #24
 8000afc:	2300      	movs	r3, #0
 8000afe:	8811      	ldrh	r1, [r2, #0]
 8000b00:	5ce8      	ldrb	r0, [r5, r3]
 8000b02:	4e3d      	ldr	r6, [pc, #244]	; (8000bf8 <rgb_sensor_read+0x140>)
 8000b04:	3301      	adds	r3, #1
 8000b06:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000b0a:	2b04      	cmp	r3, #4
 8000b0c:	f822 1b02 	strh.w	r1, [r2], #2
 8000b10:	d1f5      	bne.n	8000afe <rgb_sensor_read+0x46>
 8000b12:	2001      	movs	r0, #1
 8000b14:	4631      	mov	r1, r6
 8000b16:	f7ff ff55 	bl	80009c4 <rgb_i2cRead>
 8000b1a:	7833      	ldrb	r3, [r6, #0]
 8000b1c:	8023      	strh	r3, [r4, #0]
 8000b1e:	7873      	ldrb	r3, [r6, #1]
 8000b20:	8063      	strh	r3, [r4, #2]
 8000b22:	78b3      	ldrb	r3, [r6, #2]
 8000b24:	80a3      	strh	r3, [r4, #4]
 8000b26:	78f3      	ldrb	r3, [r6, #3]
 8000b28:	2001      	movs	r0, #1
 8000b2a:	4631      	mov	r1, r6
 8000b2c:	80e3      	strh	r3, [r4, #6]
 8000b2e:	f7ff ff49 	bl	80009c4 <rgb_i2cRead>
 8000b32:	4a33      	ldr	r2, [pc, #204]	; (8000c00 <rgb_sensor_read+0x148>)
 8000b34:	2300      	movs	r3, #0
 8000b36:	5ce8      	ldrb	r0, [r5, r3]
 8000b38:	8851      	ldrh	r1, [r2, #2]
 8000b3a:	4e2f      	ldr	r6, [pc, #188]	; (8000bf8 <rgb_sensor_read+0x140>)
 8000b3c:	3301      	adds	r3, #1
 8000b3e:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000b42:	2b04      	cmp	r3, #4
 8000b44:	f822 1f02 	strh.w	r1, [r2, #2]!
 8000b48:	d1f5      	bne.n	8000b36 <rgb_sensor_read+0x7e>
 8000b4a:	2001      	movs	r0, #1
 8000b4c:	4631      	mov	r1, r6
 8000b4e:	f7ff ff39 	bl	80009c4 <rgb_i2cRead>
 8000b52:	7833      	ldrb	r3, [r6, #0]
 8000b54:	8123      	strh	r3, [r4, #8]
 8000b56:	7873      	ldrb	r3, [r6, #1]
 8000b58:	8163      	strh	r3, [r4, #10]
 8000b5a:	78b3      	ldrb	r3, [r6, #2]
 8000b5c:	81a3      	strh	r3, [r4, #12]
 8000b5e:	78f3      	ldrb	r3, [r6, #3]
 8000b60:	2001      	movs	r0, #1
 8000b62:	4631      	mov	r1, r6
 8000b64:	81e3      	strh	r3, [r4, #14]
 8000b66:	f7ff ff2d 	bl	80009c4 <rgb_i2cRead>
 8000b6a:	4a26      	ldr	r2, [pc, #152]	; (8000c04 <rgb_sensor_read+0x14c>)
 8000b6c:	2300      	movs	r3, #0
 8000b6e:	8811      	ldrh	r1, [r2, #0]
 8000b70:	5ce8      	ldrb	r0, [r5, r3]
 8000b72:	4e21      	ldr	r6, [pc, #132]	; (8000bf8 <rgb_sensor_read+0x140>)
 8000b74:	3301      	adds	r3, #1
 8000b76:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000b7a:	2b04      	cmp	r3, #4
 8000b7c:	f822 1b02 	strh.w	r1, [r2], #2
 8000b80:	d1f5      	bne.n	8000b6e <rgb_sensor_read+0xb6>
 8000b82:	2001      	movs	r0, #1
 8000b84:	4631      	mov	r1, r6
 8000b86:	f7ff ff1d 	bl	80009c4 <rgb_i2cRead>
 8000b8a:	7833      	ldrb	r3, [r6, #0]
 8000b8c:	8223      	strh	r3, [r4, #16]
 8000b8e:	7873      	ldrb	r3, [r6, #1]
 8000b90:	8263      	strh	r3, [r4, #18]
 8000b92:	78b3      	ldrb	r3, [r6, #2]
 8000b94:	82a3      	strh	r3, [r4, #20]
 8000b96:	78f3      	ldrb	r3, [r6, #3]
 8000b98:	2001      	movs	r0, #1
 8000b9a:	4631      	mov	r1, r6
 8000b9c:	82e3      	strh	r3, [r4, #22]
 8000b9e:	f7ff ff11 	bl	80009c4 <rgb_i2cRead>
 8000ba2:	4a19      	ldr	r2, [pc, #100]	; (8000c08 <rgb_sensor_read+0x150>)
 8000ba4:	2300      	movs	r3, #0
 8000ba6:	8811      	ldrh	r1, [r2, #0]
 8000ba8:	5ce8      	ldrb	r0, [r5, r3]
 8000baa:	4e13      	ldr	r6, [pc, #76]	; (8000bf8 <rgb_sensor_read+0x140>)
 8000bac:	3301      	adds	r3, #1
 8000bae:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000bb2:	2b04      	cmp	r3, #4
 8000bb4:	f822 1b02 	strh.w	r1, [r2], #2
 8000bb8:	d1f5      	bne.n	8000ba6 <rgb_sensor_read+0xee>
 8000bba:	2001      	movs	r0, #1
 8000bbc:	4631      	mov	r1, r6
 8000bbe:	f7ff ff01 	bl	80009c4 <rgb_i2cRead>
 8000bc2:	7833      	ldrb	r3, [r6, #0]
 8000bc4:	8423      	strh	r3, [r4, #32]
 8000bc6:	7873      	ldrb	r3, [r6, #1]
 8000bc8:	8463      	strh	r3, [r4, #34]	; 0x22
 8000bca:	78b3      	ldrb	r3, [r6, #2]
 8000bcc:	84a3      	strh	r3, [r4, #36]	; 0x24
 8000bce:	78f3      	ldrb	r3, [r6, #3]
 8000bd0:	2000      	movs	r0, #0
 8000bd2:	4631      	mov	r1, r6
 8000bd4:	84e3      	strh	r3, [r4, #38]	; 0x26
 8000bd6:	f7ff fef5 	bl	80009c4 <rgb_i2cRead>
 8000bda:	4a0c      	ldr	r2, [pc, #48]	; (8000c0c <rgb_sensor_read+0x154>)
 8000bdc:	2300      	movs	r3, #0
 8000bde:	8811      	ldrh	r1, [r2, #0]
 8000be0:	5ce8      	ldrb	r0, [r5, r3]
 8000be2:	3301      	adds	r3, #1
 8000be4:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000be8:	2b04      	cmp	r3, #4
 8000bea:	f822 1b02 	strh.w	r1, [r2], #2
 8000bee:	d1f6      	bne.n	8000bde <rgb_sensor_read+0x126>
 8000bf0:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000bf4:	f7ff beb7 	b.w	8000966 <rgb_i2cStop>
 8000bf8:	200007b4 	.word	0x200007b4
 8000bfc:	2000024e 	.word	0x2000024e
 8000c00:	2000024c 	.word	0x2000024c
 8000c04:	20000256 	.word	0x20000256
 8000c08:	2000025e 	.word	0x2000025e
 8000c0c:	2000026e 	.word	0x2000026e

08000c10 <rgb_sensor_init>:
 8000c10:	4b1f      	ldr	r3, [pc, #124]	; (8000c90 <rgb_sensor_init+0x80>)
 8000c12:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000c14:	2404      	movs	r4, #4
 8000c16:	2200      	movs	r2, #0
 8000c18:	3c01      	subs	r4, #1
 8000c1a:	801a      	strh	r2, [r3, #0]
 8000c1c:	811a      	strh	r2, [r3, #8]
 8000c1e:	821a      	strh	r2, [r3, #16]
 8000c20:	841a      	strh	r2, [r3, #32]
 8000c22:	831a      	strh	r2, [r3, #24]
 8000c24:	f103 0302 	add.w	r3, r3, #2
 8000c28:	d1f5      	bne.n	8000c16 <rgb_sensor_init+0x6>
 8000c2a:	2008      	movs	r0, #8
 8000c2c:	f001 f8b2 	bl	8001d94 <led_on>
 8000c30:	f7ff fe5a 	bl	80008e8 <rgb_i2c_init>
 8000c34:	2072      	movs	r0, #114	; 0x72
 8000c36:	2181      	movs	r1, #129	; 0x81
 8000c38:	22ff      	movs	r2, #255	; 0xff
 8000c3a:	f7ff ff04 	bl	8000a46 <rgb_i2c_write_reg>
 8000c3e:	2072      	movs	r0, #114	; 0x72
 8000c40:	2183      	movs	r1, #131	; 0x83
 8000c42:	22ff      	movs	r2, #255	; 0xff
 8000c44:	f7ff feff 	bl	8000a46 <rgb_i2c_write_reg>
 8000c48:	2072      	movs	r0, #114	; 0x72
 8000c4a:	218d      	movs	r1, #141	; 0x8d
 8000c4c:	4622      	mov	r2, r4
 8000c4e:	f7ff fefa 	bl	8000a46 <rgb_i2c_write_reg>
 8000c52:	2072      	movs	r0, #114	; 0x72
 8000c54:	2180      	movs	r1, #128	; 0x80
 8000c56:	2203      	movs	r2, #3
 8000c58:	f7ff fef5 	bl	8000a46 <rgb_i2c_write_reg>
 8000c5c:	ad01      	add	r5, sp, #4
 8000c5e:	2072      	movs	r0, #114	; 0x72
 8000c60:	218f      	movs	r1, #143	; 0x8f
 8000c62:	2223      	movs	r2, #35	; 0x23
 8000c64:	f7ff feef 	bl	8000a46 <rgb_i2c_write_reg>
 8000c68:	f7ff ff26 	bl	8000ab8 <rgb_sensor_read>
 8000c6c:	2072      	movs	r0, #114	; 0x72
 8000c6e:	2192      	movs	r1, #146	; 0x92
 8000c70:	462a      	mov	r2, r5
 8000c72:	f7ff fefb 	bl	8000a6c <rgb_i2c_read_reg>
 8000c76:	4620      	mov	r0, r4
 8000c78:	4623      	mov	r3, r4
 8000c7a:	5cea      	ldrb	r2, [r5, r3]
 8000c7c:	2a69      	cmp	r2, #105	; 0x69
 8000c7e:	d002      	beq.n	8000c86 <rgb_sensor_init+0x76>
 8000c80:	2201      	movs	r2, #1
 8000c82:	409a      	lsls	r2, r3
 8000c84:	4310      	orrs	r0, r2
 8000c86:	3301      	adds	r3, #1
 8000c88:	2b04      	cmp	r3, #4
 8000c8a:	d1f6      	bne.n	8000c7a <rgb_sensor_init+0x6a>
 8000c8c:	b003      	add	sp, #12
 8000c8e:	bd30      	pop	{r4, r5, pc}
 8000c90:	2000024e 	.word	0x2000024e

08000c94 <motors_uninit>:
 8000c94:	b508      	push	{r3, lr}
 8000c96:	20c0      	movs	r0, #192	; 0xc0
 8000c98:	2100      	movs	r1, #0
 8000c9a:	2218      	movs	r2, #24
 8000c9c:	f000 fbee 	bl	800147c <i2c_write_reg>
 8000ca0:	20c4      	movs	r0, #196	; 0xc4
 8000ca2:	2100      	movs	r1, #0
 8000ca4:	2218      	movs	r2, #24
 8000ca6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000caa:	f000 bbe7 	b.w	800147c <i2c_write_reg>
	...

08000cb0 <motors_update>:
 8000cb0:	4a23      	ldr	r2, [pc, #140]	; (8000d40 <motors_update+0x90>)
 8000cb2:	b510      	push	{r4, lr}
 8000cb4:	e892 0018 	ldmia.w	r2, {r3, r4}
 8000cb8:	2b3f      	cmp	r3, #63	; 0x3f
 8000cba:	dc05      	bgt.n	8000cc8 <motors_update+0x18>
 8000cbc:	f06f 023e 	mvn.w	r2, #62	; 0x3e
 8000cc0:	4293      	cmp	r3, r2
 8000cc2:	bfb8      	it	lt
 8000cc4:	4613      	movlt	r3, r2
 8000cc6:	e000      	b.n	8000cca <motors_update+0x1a>
 8000cc8:	233f      	movs	r3, #63	; 0x3f
 8000cca:	2c3f      	cmp	r4, #63	; 0x3f
 8000ccc:	dc05      	bgt.n	8000cda <motors_update+0x2a>
 8000cce:	f06f 023e 	mvn.w	r2, #62	; 0x3e
 8000cd2:	4294      	cmp	r4, r2
 8000cd4:	bfb8      	it	lt
 8000cd6:	4614      	movlt	r4, r2
 8000cd8:	e000      	b.n	8000cdc <motors_update+0x2c>
 8000cda:	243f      	movs	r4, #63	; 0x3f
 8000cdc:	2b00      	cmp	r3, #0
 8000cde:	d00f      	beq.n	8000d00 <motors_update+0x50>
 8000ce0:	dd06      	ble.n	8000cf0 <motors_update+0x40>
 8000ce2:	2b06      	cmp	r3, #6
 8000ce4:	bfb8      	it	lt
 8000ce6:	2306      	movlt	r3, #6
 8000ce8:	009b      	lsls	r3, r3, #2
 8000cea:	f043 0202 	orr.w	r2, r3, #2
 8000cee:	e008      	b.n	8000d02 <motors_update+0x52>
 8000cf0:	425b      	negs	r3, r3
 8000cf2:	2b06      	cmp	r3, #6
 8000cf4:	bfb8      	it	lt
 8000cf6:	2306      	movlt	r3, #6
 8000cf8:	009b      	lsls	r3, r3, #2
 8000cfa:	f043 0201 	orr.w	r2, r3, #1
 8000cfe:	e000      	b.n	8000d02 <motors_update+0x52>
 8000d00:	221b      	movs	r2, #27
 8000d02:	20c0      	movs	r0, #192	; 0xc0
 8000d04:	2100      	movs	r1, #0
 8000d06:	b2d2      	uxtb	r2, r2
 8000d08:	f000 fbb8 	bl	800147c <i2c_write_reg>
 8000d0c:	2c00      	cmp	r4, #0
 8000d0e:	d00f      	beq.n	8000d30 <motors_update+0x80>
 8000d10:	dd06      	ble.n	8000d20 <motors_update+0x70>
 8000d12:	2c06      	cmp	r4, #6
 8000d14:	bfb8      	it	lt
 8000d16:	2406      	movlt	r4, #6
 8000d18:	00a4      	lsls	r4, r4, #2
 8000d1a:	f044 0201 	orr.w	r2, r4, #1
 8000d1e:	e008      	b.n	8000d32 <motors_update+0x82>
 8000d20:	4264      	negs	r4, r4
 8000d22:	2c06      	cmp	r4, #6
 8000d24:	bfb8      	it	lt
 8000d26:	2406      	movlt	r4, #6
 8000d28:	00a4      	lsls	r4, r4, #2
 8000d2a:	f044 0202 	orr.w	r2, r4, #2
 8000d2e:	e000      	b.n	8000d32 <motors_update+0x82>
 8000d30:	221b      	movs	r2, #27
 8000d32:	20c4      	movs	r0, #196	; 0xc4
 8000d34:	2100      	movs	r1, #0
 8000d36:	b2d2      	uxtb	r2, r2
 8000d38:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000d3c:	f000 bb9e 	b.w	800147c <i2c_write_reg>
 8000d40:	20000478 	.word	0x20000478

08000d44 <motors_init>:
 8000d44:	b510      	push	{r4, lr}
 8000d46:	4b04      	ldr	r3, [pc, #16]	; (8000d58 <motors_init+0x14>)
 8000d48:	2400      	movs	r4, #0
 8000d4a:	601c      	str	r4, [r3, #0]
 8000d4c:	605c      	str	r4, [r3, #4]
 8000d4e:	f7ff ffaf 	bl	8000cb0 <motors_update>
 8000d52:	4620      	mov	r0, r4
 8000d54:	bd10      	pop	{r4, pc}
 8000d56:	bf00      	nop
 8000d58:	20000478 	.word	0x20000478

08000d5c <main_thread>:
 8000d5c:	b508      	push	{r3, lr}
 8000d5e:	481c      	ldr	r0, [pc, #112]	; (8000dd0 <main_thread+0x74>)
 8000d60:	f7ff fbbc 	bl	80004dc <printf_>
 8000d64:	f44f 7096 	mov.w	r0, #300	; 0x12c
 8000d68:	f000 ff2c 	bl	8001bc4 <timer_delay_ms>
 8000d6c:	f000 f8a0 	bl	8000eb0 <device_wake_up>
 8000d70:	4918      	ldr	r1, [pc, #96]	; (8000dd4 <main_thread+0x78>)
 8000d72:	4819      	ldr	r0, [pc, #100]	; (8000dd8 <main_thread+0x7c>)
 8000d74:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000d78:	2306      	movs	r3, #6
 8000d7a:	f7ff fa9b 	bl	80002b4 <create_thread>
 8000d7e:	4817      	ldr	r0, [pc, #92]	; (8000ddc <main_thread+0x80>)
 8000d80:	4917      	ldr	r1, [pc, #92]	; (8000de0 <main_thread+0x84>)
 8000d82:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000d86:	2306      	movs	r3, #6
 8000d88:	f7ff fa94 	bl	80002b4 <create_thread>
 8000d8c:	f44f 7016 	mov.w	r0, #600	; 0x258
 8000d90:	f000 ff18 	bl	8001bc4 <timer_delay_ms>
 8000d94:	f001 f81e 	bl	8001dd4 <get_key>
 8000d98:	b980      	cbnz	r0, 8000dbc <main_thread+0x60>
 8000d9a:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000d9e:	f000 fff9 	bl	8001d94 <led_on>
 8000da2:	2064      	movs	r0, #100	; 0x64
 8000da4:	f000 ff0e 	bl	8001bc4 <timer_delay_ms>
 8000da8:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000dac:	f001 f802 	bl	8001db4 <led_off>
 8000db0:	20c8      	movs	r0, #200	; 0xc8
 8000db2:	f000 ff07 	bl	8001bc4 <timer_delay_ms>
 8000db6:	f000 f875 	bl	8000ea4 <device_sleep>
 8000dba:	e7eb      	b.n	8000d94 <main_thread+0x38>
 8000dbc:	f000 f878 	bl	8000eb0 <device_wake_up>
 8000dc0:	f44f 7016 	mov.w	r0, #600	; 0x258
 8000dc4:	f000 fefe 	bl	8001bc4 <timer_delay_ms>
 8000dc8:	f000 f830 	bl	8000e2c <motors_test>
 8000dcc:	e7e2      	b.n	8000d94 <main_thread+0x38>
 8000dce:	bf00      	nop
 8000dd0:	08001e25 	.word	0x08001e25
 8000dd4:	20000278 	.word	0x20000278
 8000dd8:	08000f2d 	.word	0x08000f2d
 8000ddc:	08000ebd 	.word	0x08000ebd
 8000de0:	20000034 	.word	0x20000034

08000de4 <abort_error_>:
 8000de4:	b570      	push	{r4, r5, r6, lr}
 8000de6:	4605      	mov	r5, r0
 8000de8:	460e      	mov	r6, r1
 8000dea:	480f      	ldr	r0, [pc, #60]	; (8000e28 <abort_error_+0x44>)
 8000dec:	4629      	mov	r1, r5
 8000dee:	4632      	mov	r2, r6
 8000df0:	f7ff fb74 	bl	80004dc <printf_>
 8000df4:	2400      	movs	r4, #0
 8000df6:	1ceb      	adds	r3, r5, #3
 8000df8:	429c      	cmp	r4, r3
 8000dfa:	d20f      	bcs.n	8000e1c <abort_error_+0x38>
 8000dfc:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000e00:	f000 ffc8 	bl	8001d94 <led_on>
 8000e04:	2032      	movs	r0, #50	; 0x32
 8000e06:	f000 fedd 	bl	8001bc4 <timer_delay_ms>
 8000e0a:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000e0e:	f000 ffd1 	bl	8001db4 <led_off>
 8000e12:	2064      	movs	r0, #100	; 0x64
 8000e14:	f000 fed6 	bl	8001bc4 <timer_delay_ms>
 8000e18:	3401      	adds	r4, #1
 8000e1a:	e7ec      	b.n	8000df6 <abort_error_+0x12>
 8000e1c:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000e20:	f000 fed0 	bl	8001bc4 <timer_delay_ms>
 8000e24:	e7e1      	b.n	8000dea <abort_error_+0x6>
 8000e26:	bf00      	nop
 8000e28:	08001e60 	.word	0x08001e60

08000e2c <motors_test>:
 8000e2c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000e2e:	4c1c      	ldr	r4, [pc, #112]	; (8000ea0 <motors_test+0x74>)
 8000e30:	2500      	movs	r5, #0
 8000e32:	273f      	movs	r7, #63	; 0x3f
 8000e34:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000e38:	f06f 063e 	mvn.w	r6, #62	; 0x3e
 8000e3c:	6027      	str	r7, [r4, #0]
 8000e3e:	6065      	str	r5, [r4, #4]
 8000e40:	f000 fec0 	bl	8001bc4 <timer_delay_ms>
 8000e44:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000e48:	6026      	str	r6, [r4, #0]
 8000e4a:	6065      	str	r5, [r4, #4]
 8000e4c:	f000 feba 	bl	8001bc4 <timer_delay_ms>
 8000e50:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000e54:	e884 00a0 	stmia.w	r4, {r5, r7}
 8000e58:	f000 feb4 	bl	8001bc4 <timer_delay_ms>
 8000e5c:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000e60:	e884 0060 	stmia.w	r4, {r5, r6}
 8000e64:	f000 feae 	bl	8001bc4 <timer_delay_ms>
 8000e68:	231f      	movs	r3, #31
 8000e6a:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000e6e:	6023      	str	r3, [r4, #0]
 8000e70:	6063      	str	r3, [r4, #4]
 8000e72:	f000 fea7 	bl	8001bc4 <timer_delay_ms>
 8000e76:	f06f 031e 	mvn.w	r3, #30
 8000e7a:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000e7e:	6023      	str	r3, [r4, #0]
 8000e80:	6063      	str	r3, [r4, #4]
 8000e82:	f000 fe9f 	bl	8001bc4 <timer_delay_ms>
 8000e86:	2064      	movs	r0, #100	; 0x64
 8000e88:	6027      	str	r7, [r4, #0]
 8000e8a:	6067      	str	r7, [r4, #4]
 8000e8c:	f000 fe9a 	bl	8001bc4 <timer_delay_ms>
 8000e90:	2064      	movs	r0, #100	; 0x64
 8000e92:	6026      	str	r6, [r4, #0]
 8000e94:	6066      	str	r6, [r4, #4]
 8000e96:	f000 fe95 	bl	8001bc4 <timer_delay_ms>
 8000e9a:	6025      	str	r5, [r4, #0]
 8000e9c:	6065      	str	r5, [r4, #4]
 8000e9e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000ea0:	20000478 	.word	0x20000478

08000ea4 <device_sleep>:
 8000ea4:	4b01      	ldr	r3, [pc, #4]	; (8000eac <device_sleep+0x8>)
 8000ea6:	22ff      	movs	r2, #255	; 0xff
 8000ea8:	701a      	strb	r2, [r3, #0]
 8000eaa:	4770      	bx	lr
 8000eac:	20000030 	.word	0x20000030

08000eb0 <device_wake_up>:
 8000eb0:	4b01      	ldr	r3, [pc, #4]	; (8000eb8 <device_wake_up+0x8>)
 8000eb2:	2200      	movs	r2, #0
 8000eb4:	701a      	strb	r2, [r3, #0]
 8000eb6:	4770      	bx	lr
 8000eb8:	20000030 	.word	0x20000030

08000ebc <device_i2c_thread>:
 8000ebc:	b510      	push	{r4, lr}
 8000ebe:	2000      	movs	r0, #0
 8000ec0:	210a      	movs	r1, #10
 8000ec2:	f000 fe8f 	bl	8001be4 <event_timer_set_period>
 8000ec6:	2300      	movs	r3, #0
 8000ec8:	2b01      	cmp	r3, #1
 8000eca:	d01e      	beq.n	8000f0a <device_i2c_thread+0x4e>
 8000ecc:	d30f      	bcc.n	8000eee <device_i2c_thread+0x32>
 8000ece:	2b00      	cmp	r3, #0
 8000ed0:	d0fa      	beq.n	8000ec8 <device_i2c_thread+0xc>
 8000ed2:	f7ff fbc6 	bl	8000662 <lsm9ds0_uninit>
 8000ed6:	f7ff fedd 	bl	8000c94 <motors_uninit>
 8000eda:	2064      	movs	r0, #100	; 0x64
 8000edc:	f000 fe72 	bl	8001bc4 <timer_delay_ms>
 8000ee0:	4b11      	ldr	r3, [pc, #68]	; (8000f28 <device_i2c_thread+0x6c>)
 8000ee2:	781b      	ldrb	r3, [r3, #0]
 8000ee4:	2b00      	cmp	r3, #0
 8000ee6:	bf14      	ite	ne
 8000ee8:	2302      	movne	r3, #2
 8000eea:	2300      	moveq	r3, #0
 8000eec:	e7ec      	b.n	8000ec8 <device_i2c_thread+0xc>
 8000eee:	f7ff fc49 	bl	8000784 <lsm9ds0_init>
 8000ef2:	4604      	mov	r4, r0
 8000ef4:	f7ff ff26 	bl	8000d44 <motors_init>
 8000ef8:	b13c      	cbz	r4, 8000f0a <device_i2c_thread+0x4e>
 8000efa:	f7ff fbb2 	bl	8000662 <lsm9ds0_uninit>
 8000efe:	f7ff fec9 	bl	8000c94 <motors_uninit>
 8000f02:	2002      	movs	r0, #2
 8000f04:	4621      	mov	r1, r4
 8000f06:	f7ff ff6d 	bl	8000de4 <abort_error_>
 8000f0a:	2000      	movs	r0, #0
 8000f0c:	f000 fe80 	bl	8001c10 <event_timer_wait>
 8000f10:	f7ff fbba 	bl	8000688 <lsm9ds0_read>
 8000f14:	f7ff fecc 	bl	8000cb0 <motors_update>
 8000f18:	4b03      	ldr	r3, [pc, #12]	; (8000f28 <device_i2c_thread+0x6c>)
 8000f1a:	781b      	ldrb	r3, [r3, #0]
 8000f1c:	2b00      	cmp	r3, #0
 8000f1e:	d0f4      	beq.n	8000f0a <device_i2c_thread+0x4e>
 8000f20:	2302      	movs	r3, #2
 8000f22:	2b01      	cmp	r3, #1
 8000f24:	e7d2      	b.n	8000ecc <device_i2c_thread+0x10>
 8000f26:	bf00      	nop
 8000f28:	20000030 	.word	0x20000030

08000f2c <device_rgb_sensors_thread>:
 8000f2c:	b510      	push	{r4, lr}
 8000f2e:	2001      	movs	r0, #1
 8000f30:	210a      	movs	r1, #10
 8000f32:	f000 fe57 	bl	8001be4 <event_timer_set_period>
 8000f36:	2400      	movs	r4, #0
 8000f38:	2001      	movs	r0, #1
 8000f3a:	f000 fe69 	bl	8001c10 <event_timer_wait>
 8000f3e:	f7ff fdbb 	bl	8000ab8 <rgb_sensor_read>
 8000f42:	2c01      	cmp	r4, #1
 8000f44:	d01a      	beq.n	8000f7c <device_rgb_sensors_thread+0x50>
 8000f46:	d30d      	bcc.n	8000f64 <device_rgb_sensors_thread+0x38>
 8000f48:	2c02      	cmp	r4, #2
 8000f4a:	d1f5      	bne.n	8000f38 <device_rgb_sensors_thread+0xc>
 8000f4c:	f7ff fda8 	bl	8000aa0 <rgb_sensor_uninit>
 8000f50:	2064      	movs	r0, #100	; 0x64
 8000f52:	f000 fe37 	bl	8001bc4 <timer_delay_ms>
 8000f56:	4b0f      	ldr	r3, [pc, #60]	; (8000f94 <device_rgb_sensors_thread+0x68>)
 8000f58:	781c      	ldrb	r4, [r3, #0]
 8000f5a:	2c00      	cmp	r4, #0
 8000f5c:	bf14      	ite	ne
 8000f5e:	2402      	movne	r4, #2
 8000f60:	2400      	moveq	r4, #0
 8000f62:	e7e9      	b.n	8000f38 <device_rgb_sensors_thread+0xc>
 8000f64:	f7ff fe54 	bl	8000c10 <rgb_sensor_init>
 8000f68:	4604      	mov	r4, r0
 8000f6a:	b128      	cbz	r0, 8000f78 <device_rgb_sensors_thread+0x4c>
 8000f6c:	f7ff fd98 	bl	8000aa0 <rgb_sensor_uninit>
 8000f70:	2001      	movs	r0, #1
 8000f72:	4621      	mov	r1, r4
 8000f74:	f7ff ff36 	bl	8000de4 <abort_error_>
 8000f78:	2401      	movs	r4, #1
 8000f7a:	e7dd      	b.n	8000f38 <device_rgb_sensors_thread+0xc>
 8000f7c:	4620      	mov	r0, r4
 8000f7e:	f000 fe47 	bl	8001c10 <event_timer_wait>
 8000f82:	f7ff fd99 	bl	8000ab8 <rgb_sensor_read>
 8000f86:	4b03      	ldr	r3, [pc, #12]	; (8000f94 <device_rgb_sensors_thread+0x68>)
 8000f88:	781b      	ldrb	r3, [r3, #0]
 8000f8a:	2b00      	cmp	r3, #0
 8000f8c:	d0f4      	beq.n	8000f78 <device_rgb_sensors_thread+0x4c>
 8000f8e:	2402      	movs	r4, #2
 8000f90:	e7d2      	b.n	8000f38 <device_rgb_sensors_thread+0xc>
 8000f92:	bf00      	nop
 8000f94:	20000030 	.word	0x20000030

08000f98 <uart_write>:
 8000f98:	4b03      	ldr	r3, [pc, #12]	; (8000fa8 <uart_write+0x10>)
 8000f9a:	69da      	ldr	r2, [r3, #28]
 8000f9c:	0612      	lsls	r2, r2, #24
 8000f9e:	d401      	bmi.n	8000fa4 <uart_write+0xc>
 8000fa0:	bf00      	nop
 8000fa2:	e7f9      	b.n	8000f98 <uart_write>
 8000fa4:	8518      	strh	r0, [r3, #40]	; 0x28
 8000fa6:	4770      	bx	lr
 8000fa8:	40013800 	.word	0x40013800

08000fac <uart_init>:
 8000fac:	b530      	push	{r4, r5, lr}
 8000fae:	4b2c      	ldr	r3, [pc, #176]	; (8001060 <uart_init+0xb4>)
 8000fb0:	4d2c      	ldr	r5, [pc, #176]	; (8001064 <uart_init+0xb8>)
 8000fb2:	2400      	movs	r4, #0
 8000fb4:	601c      	str	r4, [r3, #0]
 8000fb6:	4b2c      	ldr	r3, [pc, #176]	; (8001068 <uart_init+0xbc>)
 8000fb8:	b08b      	sub	sp, #44	; 0x2c
 8000fba:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8000fbe:	2101      	movs	r1, #1
 8000fc0:	601c      	str	r4, [r3, #0]
 8000fc2:	f000 fceb 	bl	800199c <RCC_AHBPeriphClockCmd>
 8000fc6:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8000fca:	2101      	movs	r1, #1
 8000fcc:	f000 fcf4 	bl	80019b8 <RCC_APB2PeriphClockCmd>
 8000fd0:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8000fd4:	9302      	str	r3, [sp, #8]
 8000fd6:	2302      	movs	r3, #2
 8000fd8:	f88d 300c 	strb.w	r3, [sp, #12]
 8000fdc:	a902      	add	r1, sp, #8
 8000fde:	2303      	movs	r3, #3
 8000fe0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000fe4:	f88d 300d 	strb.w	r3, [sp, #13]
 8000fe8:	f88d 400e 	strb.w	r4, [sp, #14]
 8000fec:	f88d 400f 	strb.w	r4, [sp, #15]
 8000ff0:	f000 fe20 	bl	8001c34 <GPIO_Init>
 8000ff4:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000ff8:	2109      	movs	r1, #9
 8000ffa:	2207      	movs	r2, #7
 8000ffc:	f000 fe68 	bl	8001cd0 <GPIO_PinAFConfig>
 8001000:	2207      	movs	r2, #7
 8001002:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001006:	210a      	movs	r1, #10
 8001008:	f000 fe62 	bl	8001cd0 <GPIO_PinAFConfig>
 800100c:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001010:	9304      	str	r3, [sp, #16]
 8001012:	4628      	mov	r0, r5
 8001014:	230c      	movs	r3, #12
 8001016:	a904      	add	r1, sp, #16
 8001018:	9308      	str	r3, [sp, #32]
 800101a:	9405      	str	r4, [sp, #20]
 800101c:	9406      	str	r4, [sp, #24]
 800101e:	9407      	str	r4, [sp, #28]
 8001020:	9409      	str	r4, [sp, #36]	; 0x24
 8001022:	f000 f849 	bl	80010b8 <USART_Init>
 8001026:	4628      	mov	r0, r5
 8001028:	2101      	movs	r1, #1
 800102a:	f000 f8a7 	bl	800117c <USART_Cmd>
 800102e:	2201      	movs	r2, #1
 8001030:	4628      	mov	r0, r5
 8001032:	490e      	ldr	r1, [pc, #56]	; (800106c <uart_init+0xc0>)
 8001034:	f000 f8b2 	bl	800119c <USART_ITConfig>
 8001038:	2325      	movs	r3, #37	; 0x25
 800103a:	f88d 4005 	strb.w	r4, [sp, #5]
 800103e:	f88d 4006 	strb.w	r4, [sp, #6]
 8001042:	a801      	add	r0, sp, #4
 8001044:	2401      	movs	r4, #1
 8001046:	f88d 3004 	strb.w	r3, [sp, #4]
 800104a:	f88d 4007 	strb.w	r4, [sp, #7]
 800104e:	f000 f8f3 	bl	8001238 <NVIC_Init>
 8001052:	4628      	mov	r0, r5
 8001054:	4621      	mov	r1, r4
 8001056:	f000 f891 	bl	800117c <USART_Cmd>
 800105a:	b00b      	add	sp, #44	; 0x2c
 800105c:	bd30      	pop	{r4, r5, pc}
 800105e:	bf00      	nop
 8001060:	200007c8 	.word	0x200007c8
 8001064:	40013800 	.word	0x40013800
 8001068:	200007cc 	.word	0x200007cc
 800106c:	00050105 	.word	0x00050105

08001070 <USART1_IRQHandler>:
 8001070:	b508      	push	{r3, lr}
 8001072:	480d      	ldr	r0, [pc, #52]	; (80010a8 <USART1_IRQHandler+0x38>)
 8001074:	490d      	ldr	r1, [pc, #52]	; (80010ac <USART1_IRQHandler+0x3c>)
 8001076:	f000 f8aa 	bl	80011ce <USART_GetITStatus>
 800107a:	b178      	cbz	r0, 800109c <USART1_IRQHandler+0x2c>
 800107c:	480a      	ldr	r0, [pc, #40]	; (80010a8 <USART1_IRQHandler+0x38>)
 800107e:	f000 f888 	bl	8001192 <USART_ReceiveData>
 8001082:	4b0b      	ldr	r3, [pc, #44]	; (80010b0 <USART1_IRQHandler+0x40>)
 8001084:	490b      	ldr	r1, [pc, #44]	; (80010b4 <USART1_IRQHandler+0x44>)
 8001086:	681a      	ldr	r2, [r3, #0]
 8001088:	b2c0      	uxtb	r0, r0
 800108a:	5488      	strb	r0, [r1, r2]
 800108c:	681a      	ldr	r2, [r3, #0]
 800108e:	3201      	adds	r2, #1
 8001090:	601a      	str	r2, [r3, #0]
 8001092:	681a      	ldr	r2, [r3, #0]
 8001094:	2a0f      	cmp	r2, #15
 8001096:	bf84      	itt	hi
 8001098:	2200      	movhi	r2, #0
 800109a:	601a      	strhi	r2, [r3, #0]
 800109c:	4802      	ldr	r0, [pc, #8]	; (80010a8 <USART1_IRQHandler+0x38>)
 800109e:	4903      	ldr	r1, [pc, #12]	; (80010ac <USART1_IRQHandler+0x3c>)
 80010a0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80010a4:	f000 b8b2 	b.w	800120c <USART_ClearITPendingBit>
 80010a8:	40013800 	.word	0x40013800
 80010ac:	00050105 	.word	0x00050105
 80010b0:	200007c8 	.word	0x200007c8
 80010b4:	200007b8 	.word	0x200007b8

080010b8 <USART_Init>:
 80010b8:	b530      	push	{r4, r5, lr}
 80010ba:	4604      	mov	r4, r0
 80010bc:	b099      	sub	sp, #100	; 0x64
 80010be:	460d      	mov	r5, r1
 80010c0:	bf00      	nop
 80010c2:	bf00      	nop
 80010c4:	bf00      	nop
 80010c6:	bf00      	nop
 80010c8:	bf00      	nop
 80010ca:	bf00      	nop
 80010cc:	bf00      	nop
 80010ce:	6803      	ldr	r3, [r0, #0]
 80010d0:	f023 0301 	bic.w	r3, r3, #1
 80010d4:	6003      	str	r3, [r0, #0]
 80010d6:	6842      	ldr	r2, [r0, #4]
 80010d8:	688b      	ldr	r3, [r1, #8]
 80010da:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 80010de:	4313      	orrs	r3, r2
 80010e0:	6043      	str	r3, [r0, #4]
 80010e2:	686a      	ldr	r2, [r5, #4]
 80010e4:	68eb      	ldr	r3, [r5, #12]
 80010e6:	6801      	ldr	r1, [r0, #0]
 80010e8:	431a      	orrs	r2, r3
 80010ea:	692b      	ldr	r3, [r5, #16]
 80010ec:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 80010f0:	f021 010c 	bic.w	r1, r1, #12
 80010f4:	4313      	orrs	r3, r2
 80010f6:	430b      	orrs	r3, r1
 80010f8:	6003      	str	r3, [r0, #0]
 80010fa:	6882      	ldr	r2, [r0, #8]
 80010fc:	696b      	ldr	r3, [r5, #20]
 80010fe:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 8001102:	4313      	orrs	r3, r2
 8001104:	6083      	str	r3, [r0, #8]
 8001106:	a801      	add	r0, sp, #4
 8001108:	f000 fabc 	bl	8001684 <RCC_GetClocksFreq>
 800110c:	4b17      	ldr	r3, [pc, #92]	; (800116c <USART_Init+0xb4>)
 800110e:	429c      	cmp	r4, r3
 8001110:	d101      	bne.n	8001116 <USART_Init+0x5e>
 8001112:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 8001114:	e00e      	b.n	8001134 <USART_Init+0x7c>
 8001116:	4b16      	ldr	r3, [pc, #88]	; (8001170 <USART_Init+0xb8>)
 8001118:	429c      	cmp	r4, r3
 800111a:	d101      	bne.n	8001120 <USART_Init+0x68>
 800111c:	9a10      	ldr	r2, [sp, #64]	; 0x40
 800111e:	e009      	b.n	8001134 <USART_Init+0x7c>
 8001120:	4b14      	ldr	r3, [pc, #80]	; (8001174 <USART_Init+0xbc>)
 8001122:	429c      	cmp	r4, r3
 8001124:	d101      	bne.n	800112a <USART_Init+0x72>
 8001126:	9a11      	ldr	r2, [sp, #68]	; 0x44
 8001128:	e004      	b.n	8001134 <USART_Init+0x7c>
 800112a:	4b13      	ldr	r3, [pc, #76]	; (8001178 <USART_Init+0xc0>)
 800112c:	429c      	cmp	r4, r3
 800112e:	bf0c      	ite	eq
 8001130:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 8001132:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 8001134:	6823      	ldr	r3, [r4, #0]
 8001136:	6829      	ldr	r1, [r5, #0]
 8001138:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 800113c:	bf18      	it	ne
 800113e:	0052      	lslne	r2, r2, #1
 8001140:	fbb2 f3f1 	udiv	r3, r2, r1
 8001144:	fb01 2213 	mls	r2, r1, r3, r2
 8001148:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 800114c:	6822      	ldr	r2, [r4, #0]
 800114e:	bf28      	it	cs
 8001150:	3301      	addcs	r3, #1
 8001152:	0412      	lsls	r2, r2, #16
 8001154:	d506      	bpl.n	8001164 <USART_Init+0xac>
 8001156:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 800115a:	f3c3 0142 	ubfx	r1, r3, #1, #3
 800115e:	401a      	ands	r2, r3
 8001160:	ea41 0302 	orr.w	r3, r1, r2
 8001164:	b29b      	uxth	r3, r3
 8001166:	81a3      	strh	r3, [r4, #12]
 8001168:	b019      	add	sp, #100	; 0x64
 800116a:	bd30      	pop	{r4, r5, pc}
 800116c:	40013800 	.word	0x40013800
 8001170:	40004400 	.word	0x40004400
 8001174:	40004800 	.word	0x40004800
 8001178:	40004c00 	.word	0x40004c00

0800117c <USART_Cmd>:
 800117c:	bf00      	nop
 800117e:	bf00      	nop
 8001180:	6803      	ldr	r3, [r0, #0]
 8001182:	b111      	cbz	r1, 800118a <USART_Cmd+0xe>
 8001184:	f043 0301 	orr.w	r3, r3, #1
 8001188:	e001      	b.n	800118e <USART_Cmd+0x12>
 800118a:	f023 0301 	bic.w	r3, r3, #1
 800118e:	6003      	str	r3, [r0, #0]
 8001190:	4770      	bx	lr

08001192 <USART_ReceiveData>:
 8001192:	bf00      	nop
 8001194:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8001196:	f3c0 0008 	ubfx	r0, r0, #0, #9
 800119a:	4770      	bx	lr

0800119c <USART_ITConfig>:
 800119c:	b510      	push	{r4, lr}
 800119e:	bf00      	nop
 80011a0:	bf00      	nop
 80011a2:	bf00      	nop
 80011a4:	f3c1 2307 	ubfx	r3, r1, #8, #8
 80011a8:	2401      	movs	r4, #1
 80011aa:	b2c9      	uxtb	r1, r1
 80011ac:	2b02      	cmp	r3, #2
 80011ae:	fa04 f101 	lsl.w	r1, r4, r1
 80011b2:	d101      	bne.n	80011b8 <USART_ITConfig+0x1c>
 80011b4:	3004      	adds	r0, #4
 80011b6:	e002      	b.n	80011be <USART_ITConfig+0x22>
 80011b8:	2b03      	cmp	r3, #3
 80011ba:	bf08      	it	eq
 80011bc:	3008      	addeq	r0, #8
 80011be:	6803      	ldr	r3, [r0, #0]
 80011c0:	b10a      	cbz	r2, 80011c6 <USART_ITConfig+0x2a>
 80011c2:	4319      	orrs	r1, r3
 80011c4:	e001      	b.n	80011ca <USART_ITConfig+0x2e>
 80011c6:	ea23 0101 	bic.w	r1, r3, r1
 80011ca:	6001      	str	r1, [r0, #0]
 80011cc:	bd10      	pop	{r4, pc}

080011ce <USART_GetITStatus>:
 80011ce:	b510      	push	{r4, lr}
 80011d0:	bf00      	nop
 80011d2:	bf00      	nop
 80011d4:	2401      	movs	r4, #1
 80011d6:	f3c1 2207 	ubfx	r2, r1, #8, #8
 80011da:	b2cb      	uxtb	r3, r1
 80011dc:	42a2      	cmp	r2, r4
 80011de:	fa04 f303 	lsl.w	r3, r4, r3
 80011e2:	d101      	bne.n	80011e8 <USART_GetITStatus+0x1a>
 80011e4:	6802      	ldr	r2, [r0, #0]
 80011e6:	e003      	b.n	80011f0 <USART_GetITStatus+0x22>
 80011e8:	2a02      	cmp	r2, #2
 80011ea:	bf0c      	ite	eq
 80011ec:	6842      	ldreq	r2, [r0, #4]
 80011ee:	6882      	ldrne	r2, [r0, #8]
 80011f0:	4013      	ands	r3, r2
 80011f2:	69c2      	ldr	r2, [r0, #28]
 80011f4:	b143      	cbz	r3, 8001208 <USART_GetITStatus+0x3a>
 80011f6:	2301      	movs	r3, #1
 80011f8:	0c09      	lsrs	r1, r1, #16
 80011fa:	fa03 f101 	lsl.w	r1, r3, r1
 80011fe:	4211      	tst	r1, r2
 8001200:	bf0c      	ite	eq
 8001202:	2000      	moveq	r0, #0
 8001204:	2001      	movne	r0, #1
 8001206:	bd10      	pop	{r4, pc}
 8001208:	4618      	mov	r0, r3
 800120a:	bd10      	pop	{r4, pc}

0800120c <USART_ClearITPendingBit>:
 800120c:	bf00      	nop
 800120e:	bf00      	nop
 8001210:	2301      	movs	r3, #1
 8001212:	0c09      	lsrs	r1, r1, #16
 8001214:	fa03 f101 	lsl.w	r1, r3, r1
 8001218:	6201      	str	r1, [r0, #32]
 800121a:	4770      	bx	lr

0800121c <lib_low_level_init>:
 800121c:	b508      	push	{r3, lr}
 800121e:	f000 f9ad 	bl	800157c <sytem_clock_init>
 8001222:	f000 fd6b 	bl	8001cfc <gpio_init>
 8001226:	f7ff fec1 	bl	8000fac <uart_init>
 800122a:	f000 fc45 	bl	8001ab8 <timer_init>
 800122e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001232:	f000 b893 	b.w	800135c <i2c_0_init>
	...

08001238 <NVIC_Init>:
 8001238:	b510      	push	{r4, lr}
 800123a:	bf00      	nop
 800123c:	bf00      	nop
 800123e:	bf00      	nop
 8001240:	78c2      	ldrb	r2, [r0, #3]
 8001242:	7803      	ldrb	r3, [r0, #0]
 8001244:	b30a      	cbz	r2, 800128a <NVIC_Init+0x52>
 8001246:	4a16      	ldr	r2, [pc, #88]	; (80012a0 <NVIC_Init+0x68>)
 8001248:	7844      	ldrb	r4, [r0, #1]
 800124a:	68d2      	ldr	r2, [r2, #12]
 800124c:	43d2      	mvns	r2, r2
 800124e:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001252:	f1c2 0104 	rsb	r1, r2, #4
 8001256:	b2c9      	uxtb	r1, r1
 8001258:	fa04 f101 	lsl.w	r1, r4, r1
 800125c:	240f      	movs	r4, #15
 800125e:	fa44 f202 	asr.w	r2, r4, r2
 8001262:	7884      	ldrb	r4, [r0, #2]
 8001264:	b2c9      	uxtb	r1, r1
 8001266:	4022      	ands	r2, r4
 8001268:	430a      	orrs	r2, r1
 800126a:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 800126e:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001272:	0112      	lsls	r2, r2, #4
 8001274:	b2d2      	uxtb	r2, r2
 8001276:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 800127a:	7803      	ldrb	r3, [r0, #0]
 800127c:	2201      	movs	r2, #1
 800127e:	0959      	lsrs	r1, r3, #5
 8001280:	f003 031f 	and.w	r3, r3, #31
 8001284:	fa02 f303 	lsl.w	r3, r2, r3
 8001288:	e006      	b.n	8001298 <NVIC_Init+0x60>
 800128a:	0959      	lsrs	r1, r3, #5
 800128c:	2201      	movs	r2, #1
 800128e:	f003 031f 	and.w	r3, r3, #31
 8001292:	fa02 f303 	lsl.w	r3, r2, r3
 8001296:	3120      	adds	r1, #32
 8001298:	4a02      	ldr	r2, [pc, #8]	; (80012a4 <NVIC_Init+0x6c>)
 800129a:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 800129e:	bd10      	pop	{r4, pc}
 80012a0:	e000ed00 	.word	0xe000ed00
 80012a4:	e000e100 	.word	0xe000e100

080012a8 <i2c_delay>:
 80012a8:	230b      	movs	r3, #11
 80012aa:	3b01      	subs	r3, #1
 80012ac:	d001      	beq.n	80012b2 <i2c_delay+0xa>
 80012ae:	bf00      	nop
 80012b0:	e7fb      	b.n	80012aa <i2c_delay+0x2>
 80012b2:	4770      	bx	lr

080012b4 <SetLowSDA>:
 80012b4:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80012b6:	4d0d      	ldr	r5, [pc, #52]	; (80012ec <SetLowSDA+0x38>)
 80012b8:	2301      	movs	r3, #1
 80012ba:	2203      	movs	r2, #3
 80012bc:	2480      	movs	r4, #128	; 0x80
 80012be:	f88d 3004 	strb.w	r3, [sp, #4]
 80012c2:	f88d 3006 	strb.w	r3, [sp, #6]
 80012c6:	4628      	mov	r0, r5
 80012c8:	2300      	movs	r3, #0
 80012ca:	4669      	mov	r1, sp
 80012cc:	f88d 2005 	strb.w	r2, [sp, #5]
 80012d0:	f88d 3007 	strb.w	r3, [sp, #7]
 80012d4:	9400      	str	r4, [sp, #0]
 80012d6:	f000 fcad 	bl	8001c34 <GPIO_Init>
 80012da:	4628      	mov	r0, r5
 80012dc:	4621      	mov	r1, r4
 80012de:	f000 fcf3 	bl	8001cc8 <GPIO_ResetBits>
 80012e2:	f7ff ffe1 	bl	80012a8 <i2c_delay>
 80012e6:	b003      	add	sp, #12
 80012e8:	bd30      	pop	{r4, r5, pc}
 80012ea:	bf00      	nop
 80012ec:	48000400 	.word	0x48000400

080012f0 <SetHighSDA>:
 80012f0:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80012f2:	4d0d      	ldr	r5, [pc, #52]	; (8001328 <SetHighSDA+0x38>)
 80012f4:	2203      	movs	r2, #3
 80012f6:	2300      	movs	r3, #0
 80012f8:	2480      	movs	r4, #128	; 0x80
 80012fa:	f88d 2005 	strb.w	r2, [sp, #5]
 80012fe:	4628      	mov	r0, r5
 8001300:	2201      	movs	r2, #1
 8001302:	4669      	mov	r1, sp
 8001304:	f88d 3004 	strb.w	r3, [sp, #4]
 8001308:	f88d 2006 	strb.w	r2, [sp, #6]
 800130c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001310:	9400      	str	r4, [sp, #0]
 8001312:	f000 fc8f 	bl	8001c34 <GPIO_Init>
 8001316:	4628      	mov	r0, r5
 8001318:	4621      	mov	r1, r4
 800131a:	f000 fcd1 	bl	8001cc0 <GPIO_SetBits>
 800131e:	f7ff ffc3 	bl	80012a8 <i2c_delay>
 8001322:	b003      	add	sp, #12
 8001324:	bd30      	pop	{r4, r5, pc}
 8001326:	bf00      	nop
 8001328:	48000400 	.word	0x48000400

0800132c <SetLowSCL>:
 800132c:	b508      	push	{r3, lr}
 800132e:	4804      	ldr	r0, [pc, #16]	; (8001340 <SetLowSCL+0x14>)
 8001330:	2140      	movs	r1, #64	; 0x40
 8001332:	f000 fcc9 	bl	8001cc8 <GPIO_ResetBits>
 8001336:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800133a:	f7ff bfb5 	b.w	80012a8 <i2c_delay>
 800133e:	bf00      	nop
 8001340:	48000400 	.word	0x48000400

08001344 <SetHighSCL>:
 8001344:	b508      	push	{r3, lr}
 8001346:	4804      	ldr	r0, [pc, #16]	; (8001358 <SetHighSCL+0x14>)
 8001348:	2140      	movs	r1, #64	; 0x40
 800134a:	f000 fcb9 	bl	8001cc0 <GPIO_SetBits>
 800134e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001352:	f7ff bfa9 	b.w	80012a8 <i2c_delay>
 8001356:	bf00      	nop
 8001358:	48000400 	.word	0x48000400

0800135c <i2c_0_init>:
 800135c:	b507      	push	{r0, r1, r2, lr}
 800135e:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001362:	2101      	movs	r1, #1
 8001364:	f000 fb1a 	bl	800199c <RCC_AHBPeriphClockCmd>
 8001368:	23c0      	movs	r3, #192	; 0xc0
 800136a:	9300      	str	r3, [sp, #0]
 800136c:	2301      	movs	r3, #1
 800136e:	2203      	movs	r2, #3
 8001370:	480a      	ldr	r0, [pc, #40]	; (800139c <i2c_0_init+0x40>)
 8001372:	f88d 3004 	strb.w	r3, [sp, #4]
 8001376:	4669      	mov	r1, sp
 8001378:	f88d 3006 	strb.w	r3, [sp, #6]
 800137c:	2300      	movs	r3, #0
 800137e:	f88d 2005 	strb.w	r2, [sp, #5]
 8001382:	f88d 3007 	strb.w	r3, [sp, #7]
 8001386:	f000 fc55 	bl	8001c34 <GPIO_Init>
 800138a:	f7ff ffdb 	bl	8001344 <SetHighSCL>
 800138e:	f7ff ff91 	bl	80012b4 <SetLowSDA>
 8001392:	f7ff ffad 	bl	80012f0 <SetHighSDA>
 8001396:	b003      	add	sp, #12
 8001398:	f85d fb04 	ldr.w	pc, [sp], #4
 800139c:	48000400 	.word	0x48000400

080013a0 <i2cStart>:
 80013a0:	b508      	push	{r3, lr}
 80013a2:	f7ff ffcf 	bl	8001344 <SetHighSCL>
 80013a6:	f7ff ffa3 	bl	80012f0 <SetHighSDA>
 80013aa:	f7ff ffcb 	bl	8001344 <SetHighSCL>
 80013ae:	f7ff ff81 	bl	80012b4 <SetLowSDA>
 80013b2:	f7ff ffbb 	bl	800132c <SetLowSCL>
 80013b6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80013ba:	f7ff bf99 	b.w	80012f0 <SetHighSDA>

080013be <i2cStop>:
 80013be:	b508      	push	{r3, lr}
 80013c0:	f7ff ffb4 	bl	800132c <SetLowSCL>
 80013c4:	f7ff ff76 	bl	80012b4 <SetLowSDA>
 80013c8:	f7ff ffbc 	bl	8001344 <SetHighSCL>
 80013cc:	f7ff ff72 	bl	80012b4 <SetLowSDA>
 80013d0:	f7ff ffb8 	bl	8001344 <SetHighSCL>
 80013d4:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80013d8:	f7ff bf8a 	b.w	80012f0 <SetHighSDA>

080013dc <i2cWrite>:
 80013dc:	b538      	push	{r3, r4, r5, lr}
 80013de:	4604      	mov	r4, r0
 80013e0:	2508      	movs	r5, #8
 80013e2:	f7ff ffa3 	bl	800132c <SetLowSCL>
 80013e6:	0623      	lsls	r3, r4, #24
 80013e8:	d502      	bpl.n	80013f0 <i2cWrite+0x14>
 80013ea:	f7ff ff81 	bl	80012f0 <SetHighSDA>
 80013ee:	e001      	b.n	80013f4 <i2cWrite+0x18>
 80013f0:	f7ff ff60 	bl	80012b4 <SetLowSDA>
 80013f4:	3d01      	subs	r5, #1
 80013f6:	f7ff ffa5 	bl	8001344 <SetHighSCL>
 80013fa:	0064      	lsls	r4, r4, #1
 80013fc:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001400:	b2e4      	uxtb	r4, r4
 8001402:	d1ee      	bne.n	80013e2 <i2cWrite+0x6>
 8001404:	f7ff ff92 	bl	800132c <SetLowSCL>
 8001408:	f7ff ff72 	bl	80012f0 <SetHighSDA>
 800140c:	f7ff ff9a 	bl	8001344 <SetHighSCL>
 8001410:	4b05      	ldr	r3, [pc, #20]	; (8001428 <i2cWrite+0x4c>)
 8001412:	8a1c      	ldrh	r4, [r3, #16]
 8001414:	b2a4      	uxth	r4, r4
 8001416:	f7ff ff89 	bl	800132c <SetLowSCL>
 800141a:	f7ff ff45 	bl	80012a8 <i2c_delay>
 800141e:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 8001422:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 8001426:	bd38      	pop	{r3, r4, r5, pc}
 8001428:	48000400 	.word	0x48000400

0800142c <i2cRead>:
 800142c:	b570      	push	{r4, r5, r6, lr}
 800142e:	4606      	mov	r6, r0
 8001430:	f7ff ff7c 	bl	800132c <SetLowSCL>
 8001434:	f7ff ff5c 	bl	80012f0 <SetHighSDA>
 8001438:	2508      	movs	r5, #8
 800143a:	2400      	movs	r4, #0
 800143c:	f7ff ff82 	bl	8001344 <SetHighSCL>
 8001440:	4b0d      	ldr	r3, [pc, #52]	; (8001478 <i2cRead+0x4c>)
 8001442:	8a1b      	ldrh	r3, [r3, #16]
 8001444:	0064      	lsls	r4, r4, #1
 8001446:	061a      	lsls	r2, r3, #24
 8001448:	b2e4      	uxtb	r4, r4
 800144a:	bf48      	it	mi
 800144c:	3401      	addmi	r4, #1
 800144e:	f105 35ff 	add.w	r5, r5, #4294967295
 8001452:	bf48      	it	mi
 8001454:	b2e4      	uxtbmi	r4, r4
 8001456:	f7ff ff69 	bl	800132c <SetLowSCL>
 800145a:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 800145e:	d1ed      	bne.n	800143c <i2cRead+0x10>
 8001460:	b10e      	cbz	r6, 8001466 <i2cRead+0x3a>
 8001462:	f7ff ff27 	bl	80012b4 <SetLowSDA>
 8001466:	f7ff ff6d 	bl	8001344 <SetHighSCL>
 800146a:	f7ff ff5f 	bl	800132c <SetLowSCL>
 800146e:	f7ff ff1b 	bl	80012a8 <i2c_delay>
 8001472:	4620      	mov	r0, r4
 8001474:	bd70      	pop	{r4, r5, r6, pc}
 8001476:	bf00      	nop
 8001478:	48000400 	.word	0x48000400

0800147c <i2c_write_reg>:
 800147c:	b570      	push	{r4, r5, r6, lr}
 800147e:	4605      	mov	r5, r0
 8001480:	460c      	mov	r4, r1
 8001482:	4616      	mov	r6, r2
 8001484:	f7ff ff8c 	bl	80013a0 <i2cStart>
 8001488:	4628      	mov	r0, r5
 800148a:	f7ff ffa7 	bl	80013dc <i2cWrite>
 800148e:	4620      	mov	r0, r4
 8001490:	f7ff ffa4 	bl	80013dc <i2cWrite>
 8001494:	4630      	mov	r0, r6
 8001496:	f7ff ffa1 	bl	80013dc <i2cWrite>
 800149a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800149e:	f7ff bf8e 	b.w	80013be <i2cStop>

080014a2 <i2c_read_reg>:
 80014a2:	b538      	push	{r3, r4, r5, lr}
 80014a4:	4604      	mov	r4, r0
 80014a6:	460d      	mov	r5, r1
 80014a8:	f7ff ff7a 	bl	80013a0 <i2cStart>
 80014ac:	4620      	mov	r0, r4
 80014ae:	f7ff ff95 	bl	80013dc <i2cWrite>
 80014b2:	4628      	mov	r0, r5
 80014b4:	f7ff ff92 	bl	80013dc <i2cWrite>
 80014b8:	f7ff ff72 	bl	80013a0 <i2cStart>
 80014bc:	f044 0001 	orr.w	r0, r4, #1
 80014c0:	f7ff ff8c 	bl	80013dc <i2cWrite>
 80014c4:	2000      	movs	r0, #0
 80014c6:	f7ff ffb1 	bl	800142c <i2cRead>
 80014ca:	4604      	mov	r4, r0
 80014cc:	f7ff ff77 	bl	80013be <i2cStop>
 80014d0:	4620      	mov	r0, r4
 80014d2:	bd38      	pop	{r3, r4, r5, pc}

080014d4 <Default_Handler>:
 80014d4:	4668      	mov	r0, sp
 80014d6:	f020 0107 	bic.w	r1, r0, #7
 80014da:	468d      	mov	sp, r1
 80014dc:	bf00      	nop
 80014de:	e7fd      	b.n	80014dc <Default_Handler+0x8>

080014e0 <HardFault_Handler>:
 80014e0:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80014e4:	f000 fc56 	bl	8001d94 <led_on>
 80014e8:	4b06      	ldr	r3, [pc, #24]	; (8001504 <HardFault_Handler+0x24>)
 80014ea:	3b01      	subs	r3, #1
 80014ec:	d001      	beq.n	80014f2 <HardFault_Handler+0x12>
 80014ee:	bf00      	nop
 80014f0:	e7fb      	b.n	80014ea <HardFault_Handler+0xa>
 80014f2:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80014f6:	f000 fc5d 	bl	8001db4 <led_off>
 80014fa:	4b02      	ldr	r3, [pc, #8]	; (8001504 <HardFault_Handler+0x24>)
 80014fc:	3b01      	subs	r3, #1
 80014fe:	d0ef      	beq.n	80014e0 <HardFault_Handler>
 8001500:	bf00      	nop
 8001502:	e7fb      	b.n	80014fc <HardFault_Handler+0x1c>
 8001504:	00989681 	.word	0x00989681

08001508 <_reset_init>:
 8001508:	4a0e      	ldr	r2, [pc, #56]	; (8001544 <_reset_init+0x3c>)
 800150a:	480f      	ldr	r0, [pc, #60]	; (8001548 <_reset_init+0x40>)
 800150c:	1a80      	subs	r0, r0, r2
 800150e:	1080      	asrs	r0, r0, #2
 8001510:	2300      	movs	r3, #0
 8001512:	4283      	cmp	r3, r0
 8001514:	d006      	beq.n	8001524 <_reset_init+0x1c>
 8001516:	490d      	ldr	r1, [pc, #52]	; (800154c <_reset_init+0x44>)
 8001518:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 800151c:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001520:	3301      	adds	r3, #1
 8001522:	e7f6      	b.n	8001512 <_reset_init+0xa>
 8001524:	4b0a      	ldr	r3, [pc, #40]	; (8001550 <_reset_init+0x48>)
 8001526:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800152a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800152e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001532:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8001536:	685a      	ldr	r2, [r3, #4]
 8001538:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 800153c:	605a      	str	r2, [r3, #4]
 800153e:	f7fe be23 	b.w	8000188 <main>
 8001542:	bf00      	nop
 8001544:	20000000 	.word	0x20000000
 8001548:	20000030 	.word	0x20000030
 800154c:	08001e78 	.word	0x08001e78
 8001550:	e000ed00 	.word	0xe000ed00

08001554 <sys_tick_init>:
 8001554:	4b05      	ldr	r3, [pc, #20]	; (800156c <sys_tick_init+0x18>)
 8001556:	4a06      	ldr	r2, [pc, #24]	; (8001570 <sys_tick_init+0x1c>)
 8001558:	605a      	str	r2, [r3, #4]
 800155a:	4a06      	ldr	r2, [pc, #24]	; (8001574 <sys_tick_init+0x20>)
 800155c:	21f0      	movs	r1, #240	; 0xf0
 800155e:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8001562:	2200      	movs	r2, #0
 8001564:	609a      	str	r2, [r3, #8]
 8001566:	2207      	movs	r2, #7
 8001568:	601a      	str	r2, [r3, #0]
 800156a:	4770      	bx	lr
 800156c:	e000e010 	.word	0xe000e010
 8001570:	00029040 	.word	0x00029040
 8001574:	e000ed00 	.word	0xe000ed00

08001578 <sleep>:
 8001578:	bf30      	wfi
 800157a:	4770      	bx	lr

0800157c <sytem_clock_init>:
 800157c:	f000 b800 	b.w	8001580 <SystemInit>

08001580 <SystemInit>:
 8001580:	4b3b      	ldr	r3, [pc, #236]	; (8001670 <SystemInit+0xf0>)
 8001582:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001586:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800158a:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800158e:	4b39      	ldr	r3, [pc, #228]	; (8001674 <SystemInit+0xf4>)
 8001590:	681a      	ldr	r2, [r3, #0]
 8001592:	f042 0201 	orr.w	r2, r2, #1
 8001596:	601a      	str	r2, [r3, #0]
 8001598:	6859      	ldr	r1, [r3, #4]
 800159a:	4a37      	ldr	r2, [pc, #220]	; (8001678 <SystemInit+0xf8>)
 800159c:	400a      	ands	r2, r1
 800159e:	605a      	str	r2, [r3, #4]
 80015a0:	681a      	ldr	r2, [r3, #0]
 80015a2:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 80015a6:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 80015aa:	601a      	str	r2, [r3, #0]
 80015ac:	681a      	ldr	r2, [r3, #0]
 80015ae:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 80015b2:	601a      	str	r2, [r3, #0]
 80015b4:	685a      	ldr	r2, [r3, #4]
 80015b6:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 80015ba:	605a      	str	r2, [r3, #4]
 80015bc:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80015be:	f022 020f 	bic.w	r2, r2, #15
 80015c2:	62da      	str	r2, [r3, #44]	; 0x2c
 80015c4:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80015c6:	4a2d      	ldr	r2, [pc, #180]	; (800167c <SystemInit+0xfc>)
 80015c8:	b082      	sub	sp, #8
 80015ca:	400a      	ands	r2, r1
 80015cc:	631a      	str	r2, [r3, #48]	; 0x30
 80015ce:	2200      	movs	r2, #0
 80015d0:	609a      	str	r2, [r3, #8]
 80015d2:	9200      	str	r2, [sp, #0]
 80015d4:	9201      	str	r2, [sp, #4]
 80015d6:	681a      	ldr	r2, [r3, #0]
 80015d8:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 80015dc:	601a      	str	r2, [r3, #0]
 80015de:	4b25      	ldr	r3, [pc, #148]	; (8001674 <SystemInit+0xf4>)
 80015e0:	681a      	ldr	r2, [r3, #0]
 80015e2:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 80015e6:	9201      	str	r2, [sp, #4]
 80015e8:	9a00      	ldr	r2, [sp, #0]
 80015ea:	3201      	adds	r2, #1
 80015ec:	9200      	str	r2, [sp, #0]
 80015ee:	9a01      	ldr	r2, [sp, #4]
 80015f0:	b91a      	cbnz	r2, 80015fa <SystemInit+0x7a>
 80015f2:	9a00      	ldr	r2, [sp, #0]
 80015f4:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 80015f8:	d1f1      	bne.n	80015de <SystemInit+0x5e>
 80015fa:	681b      	ldr	r3, [r3, #0]
 80015fc:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8001600:	bf18      	it	ne
 8001602:	2301      	movne	r3, #1
 8001604:	9301      	str	r3, [sp, #4]
 8001606:	9b01      	ldr	r3, [sp, #4]
 8001608:	2b01      	cmp	r3, #1
 800160a:	d005      	beq.n	8001618 <SystemInit+0x98>
 800160c:	4b18      	ldr	r3, [pc, #96]	; (8001670 <SystemInit+0xf0>)
 800160e:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8001612:	609a      	str	r2, [r3, #8]
 8001614:	b002      	add	sp, #8
 8001616:	4770      	bx	lr
 8001618:	4b19      	ldr	r3, [pc, #100]	; (8001680 <SystemInit+0x100>)
 800161a:	2212      	movs	r2, #18
 800161c:	601a      	str	r2, [r3, #0]
 800161e:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 8001622:	685a      	ldr	r2, [r3, #4]
 8001624:	605a      	str	r2, [r3, #4]
 8001626:	685a      	ldr	r2, [r3, #4]
 8001628:	605a      	str	r2, [r3, #4]
 800162a:	685a      	ldr	r2, [r3, #4]
 800162c:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8001630:	605a      	str	r2, [r3, #4]
 8001632:	685a      	ldr	r2, [r3, #4]
 8001634:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8001638:	605a      	str	r2, [r3, #4]
 800163a:	685a      	ldr	r2, [r3, #4]
 800163c:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8001640:	605a      	str	r2, [r3, #4]
 8001642:	681a      	ldr	r2, [r3, #0]
 8001644:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8001648:	601a      	str	r2, [r3, #0]
 800164a:	6819      	ldr	r1, [r3, #0]
 800164c:	4a09      	ldr	r2, [pc, #36]	; (8001674 <SystemInit+0xf4>)
 800164e:	0189      	lsls	r1, r1, #6
 8001650:	d5fb      	bpl.n	800164a <SystemInit+0xca>
 8001652:	6853      	ldr	r3, [r2, #4]
 8001654:	f023 0303 	bic.w	r3, r3, #3
 8001658:	6053      	str	r3, [r2, #4]
 800165a:	6853      	ldr	r3, [r2, #4]
 800165c:	f043 0302 	orr.w	r3, r3, #2
 8001660:	6053      	str	r3, [r2, #4]
 8001662:	4b04      	ldr	r3, [pc, #16]	; (8001674 <SystemInit+0xf4>)
 8001664:	685b      	ldr	r3, [r3, #4]
 8001666:	f003 030c 	and.w	r3, r3, #12
 800166a:	2b08      	cmp	r3, #8
 800166c:	d1f9      	bne.n	8001662 <SystemInit+0xe2>
 800166e:	e7cd      	b.n	800160c <SystemInit+0x8c>
 8001670:	e000ed00 	.word	0xe000ed00
 8001674:	40021000 	.word	0x40021000
 8001678:	f87fc00c 	.word	0xf87fc00c
 800167c:	ff00fccc 	.word	0xff00fccc
 8001680:	40022000 	.word	0x40022000

08001684 <RCC_GetClocksFreq>:
 8001684:	4ba5      	ldr	r3, [pc, #660]	; (800191c <RCC_GetClocksFreq+0x298>)
 8001686:	685a      	ldr	r2, [r3, #4]
 8001688:	f002 020c 	and.w	r2, r2, #12
 800168c:	2a04      	cmp	r2, #4
 800168e:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8001692:	d005      	beq.n	80016a0 <RCC_GetClocksFreq+0x1c>
 8001694:	2a08      	cmp	r2, #8
 8001696:	d006      	beq.n	80016a6 <RCC_GetClocksFreq+0x22>
 8001698:	4ba1      	ldr	r3, [pc, #644]	; (8001920 <RCC_GetClocksFreq+0x29c>)
 800169a:	6003      	str	r3, [r0, #0]
 800169c:	b9ba      	cbnz	r2, 80016ce <RCC_GetClocksFreq+0x4a>
 800169e:	e017      	b.n	80016d0 <RCC_GetClocksFreq+0x4c>
 80016a0:	4b9f      	ldr	r3, [pc, #636]	; (8001920 <RCC_GetClocksFreq+0x29c>)
 80016a2:	6003      	str	r3, [r0, #0]
 80016a4:	e013      	b.n	80016ce <RCC_GetClocksFreq+0x4a>
 80016a6:	6859      	ldr	r1, [r3, #4]
 80016a8:	685c      	ldr	r4, [r3, #4]
 80016aa:	f3c1 4183 	ubfx	r1, r1, #18, #4
 80016ae:	03e2      	lsls	r2, r4, #15
 80016b0:	f101 0102 	add.w	r1, r1, #2
 80016b4:	d401      	bmi.n	80016ba <RCC_GetClocksFreq+0x36>
 80016b6:	4a9b      	ldr	r2, [pc, #620]	; (8001924 <RCC_GetClocksFreq+0x2a0>)
 80016b8:	e006      	b.n	80016c8 <RCC_GetClocksFreq+0x44>
 80016ba:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80016bc:	4b98      	ldr	r3, [pc, #608]	; (8001920 <RCC_GetClocksFreq+0x29c>)
 80016be:	f002 020f 	and.w	r2, r2, #15
 80016c2:	3201      	adds	r2, #1
 80016c4:	fbb3 f2f2 	udiv	r2, r3, r2
 80016c8:	434a      	muls	r2, r1
 80016ca:	6002      	str	r2, [r0, #0]
 80016cc:	e000      	b.n	80016d0 <RCC_GetClocksFreq+0x4c>
 80016ce:	2200      	movs	r2, #0
 80016d0:	4f92      	ldr	r7, [pc, #584]	; (800191c <RCC_GetClocksFreq+0x298>)
 80016d2:	4d95      	ldr	r5, [pc, #596]	; (8001928 <RCC_GetClocksFreq+0x2a4>)
 80016d4:	687b      	ldr	r3, [r7, #4]
 80016d6:	f8df 8254 	ldr.w	r8, [pc, #596]	; 800192c <RCC_GetClocksFreq+0x2a8>
 80016da:	f3c3 1303 	ubfx	r3, r3, #4, #4
 80016de:	5cec      	ldrb	r4, [r5, r3]
 80016e0:	6803      	ldr	r3, [r0, #0]
 80016e2:	b2e4      	uxtb	r4, r4
 80016e4:	fa23 f104 	lsr.w	r1, r3, r4
 80016e8:	6041      	str	r1, [r0, #4]
 80016ea:	687e      	ldr	r6, [r7, #4]
 80016ec:	f3c6 2602 	ubfx	r6, r6, #8, #3
 80016f0:	5dae      	ldrb	r6, [r5, r6]
 80016f2:	fa21 f606 	lsr.w	r6, r1, r6
 80016f6:	6086      	str	r6, [r0, #8]
 80016f8:	f8d7 c004 	ldr.w	ip, [r7, #4]
 80016fc:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8001700:	f815 500c 	ldrb.w	r5, [r5, ip]
 8001704:	b2ed      	uxtb	r5, r5
 8001706:	40e9      	lsrs	r1, r5
 8001708:	60c1      	str	r1, [r0, #12]
 800170a:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 800170e:	f3c9 1904 	ubfx	r9, r9, #4, #5
 8001712:	f009 0c0f 	and.w	ip, r9, #15
 8001716:	f019 0f10 	tst.w	r9, #16
 800171a:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 800171e:	fa1f fc8c 	uxth.w	ip, ip
 8001722:	d007      	beq.n	8001734 <RCC_GetClocksFreq+0xb0>
 8001724:	f1bc 0f00 	cmp.w	ip, #0
 8001728:	d004      	beq.n	8001734 <RCC_GetClocksFreq+0xb0>
 800172a:	fbb2 fcfc 	udiv	ip, r2, ip
 800172e:	f8c0 c010 	str.w	ip, [r0, #16]
 8001732:	e000      	b.n	8001736 <RCC_GetClocksFreq+0xb2>
 8001734:	6103      	str	r3, [r0, #16]
 8001736:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 8001738:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 800173c:	f00c 070f 	and.w	r7, ip, #15
 8001740:	f01c 0f10 	tst.w	ip, #16
 8001744:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 8001748:	b2bf      	uxth	r7, r7
 800174a:	d004      	beq.n	8001756 <RCC_GetClocksFreq+0xd2>
 800174c:	b11f      	cbz	r7, 8001756 <RCC_GetClocksFreq+0xd2>
 800174e:	fbb2 f7f7 	udiv	r7, r2, r7
 8001752:	6147      	str	r7, [r0, #20]
 8001754:	e000      	b.n	8001758 <RCC_GetClocksFreq+0xd4>
 8001756:	6143      	str	r3, [r0, #20]
 8001758:	4f70      	ldr	r7, [pc, #448]	; (800191c <RCC_GetClocksFreq+0x298>)
 800175a:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800175e:	f01c 0f10 	tst.w	ip, #16
 8001762:	bf0a      	itet	eq
 8001764:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 8001920 <RCC_GetClocksFreq+0x29c>
 8001768:	6183      	strne	r3, [r0, #24]
 800176a:	f8c0 c018 	streq.w	ip, [r0, #24]
 800176e:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001770:	06bf      	lsls	r7, r7, #26
 8001772:	bf56      	itet	pl
 8001774:	4f6a      	ldrpl	r7, [pc, #424]	; (8001920 <RCC_GetClocksFreq+0x29c>)
 8001776:	61c3      	strmi	r3, [r0, #28]
 8001778:	61c7      	strpl	r7, [r0, #28]
 800177a:	4f68      	ldr	r7, [pc, #416]	; (800191c <RCC_GetClocksFreq+0x298>)
 800177c:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001780:	f01c 0f40 	tst.w	ip, #64	; 0x40
 8001784:	bf0a      	itet	eq
 8001786:	f8df c198 	ldreq.w	ip, [pc, #408]	; 8001920 <RCC_GetClocksFreq+0x29c>
 800178a:	6203      	strne	r3, [r0, #32]
 800178c:	f8c0 c020 	streq.w	ip, [r0, #32]
 8001790:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001792:	05ff      	lsls	r7, r7, #23
 8001794:	d506      	bpl.n	80017a4 <RCC_GetClocksFreq+0x120>
 8001796:	4293      	cmp	r3, r2
 8001798:	d104      	bne.n	80017a4 <RCC_GetClocksFreq+0x120>
 800179a:	42a5      	cmp	r5, r4
 800179c:	d102      	bne.n	80017a4 <RCC_GetClocksFreq+0x120>
 800179e:	005f      	lsls	r7, r3, #1
 80017a0:	6247      	str	r7, [r0, #36]	; 0x24
 80017a2:	e000      	b.n	80017a6 <RCC_GetClocksFreq+0x122>
 80017a4:	6241      	str	r1, [r0, #36]	; 0x24
 80017a6:	4f5d      	ldr	r7, [pc, #372]	; (800191c <RCC_GetClocksFreq+0x298>)
 80017a8:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80017ac:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 80017b0:	d008      	beq.n	80017c4 <RCC_GetClocksFreq+0x140>
 80017b2:	4293      	cmp	r3, r2
 80017b4:	d106      	bne.n	80017c4 <RCC_GetClocksFreq+0x140>
 80017b6:	42a5      	cmp	r5, r4
 80017b8:	d104      	bne.n	80017c4 <RCC_GetClocksFreq+0x140>
 80017ba:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 80017be:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 80017c2:	e000      	b.n	80017c6 <RCC_GetClocksFreq+0x142>
 80017c4:	6281      	str	r1, [r0, #40]	; 0x28
 80017c6:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80017c8:	05bf      	lsls	r7, r7, #22
 80017ca:	d506      	bpl.n	80017da <RCC_GetClocksFreq+0x156>
 80017cc:	4293      	cmp	r3, r2
 80017ce:	d104      	bne.n	80017da <RCC_GetClocksFreq+0x156>
 80017d0:	42a5      	cmp	r5, r4
 80017d2:	d102      	bne.n	80017da <RCC_GetClocksFreq+0x156>
 80017d4:	005f      	lsls	r7, r3, #1
 80017d6:	62c7      	str	r7, [r0, #44]	; 0x2c
 80017d8:	e000      	b.n	80017dc <RCC_GetClocksFreq+0x158>
 80017da:	62c1      	str	r1, [r0, #44]	; 0x2c
 80017dc:	4f4f      	ldr	r7, [pc, #316]	; (800191c <RCC_GetClocksFreq+0x298>)
 80017de:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80017e2:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 80017e6:	d008      	beq.n	80017fa <RCC_GetClocksFreq+0x176>
 80017e8:	4293      	cmp	r3, r2
 80017ea:	d106      	bne.n	80017fa <RCC_GetClocksFreq+0x176>
 80017ec:	42a5      	cmp	r5, r4
 80017ee:	d104      	bne.n	80017fa <RCC_GetClocksFreq+0x176>
 80017f0:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 80017f4:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 80017f8:	e000      	b.n	80017fc <RCC_GetClocksFreq+0x178>
 80017fa:	64c1      	str	r1, [r0, #76]	; 0x4c
 80017fc:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80017fe:	053f      	lsls	r7, r7, #20
 8001800:	d506      	bpl.n	8001810 <RCC_GetClocksFreq+0x18c>
 8001802:	4293      	cmp	r3, r2
 8001804:	d104      	bne.n	8001810 <RCC_GetClocksFreq+0x18c>
 8001806:	42a5      	cmp	r5, r4
 8001808:	d102      	bne.n	8001810 <RCC_GetClocksFreq+0x18c>
 800180a:	005f      	lsls	r7, r3, #1
 800180c:	6507      	str	r7, [r0, #80]	; 0x50
 800180e:	e000      	b.n	8001812 <RCC_GetClocksFreq+0x18e>
 8001810:	6501      	str	r1, [r0, #80]	; 0x50
 8001812:	4f42      	ldr	r7, [pc, #264]	; (800191c <RCC_GetClocksFreq+0x298>)
 8001814:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001818:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 800181c:	d008      	beq.n	8001830 <RCC_GetClocksFreq+0x1ac>
 800181e:	4293      	cmp	r3, r2
 8001820:	d106      	bne.n	8001830 <RCC_GetClocksFreq+0x1ac>
 8001822:	42a5      	cmp	r5, r4
 8001824:	d104      	bne.n	8001830 <RCC_GetClocksFreq+0x1ac>
 8001826:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 800182a:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 800182e:	e000      	b.n	8001832 <RCC_GetClocksFreq+0x1ae>
 8001830:	6501      	str	r1, [r0, #80]	; 0x50
 8001832:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001834:	043f      	lsls	r7, r7, #16
 8001836:	d506      	bpl.n	8001846 <RCC_GetClocksFreq+0x1c2>
 8001838:	4293      	cmp	r3, r2
 800183a:	d104      	bne.n	8001846 <RCC_GetClocksFreq+0x1c2>
 800183c:	42a5      	cmp	r5, r4
 800183e:	d102      	bne.n	8001846 <RCC_GetClocksFreq+0x1c2>
 8001840:	005a      	lsls	r2, r3, #1
 8001842:	6582      	str	r2, [r0, #88]	; 0x58
 8001844:	e000      	b.n	8001848 <RCC_GetClocksFreq+0x1c4>
 8001846:	6581      	str	r1, [r0, #88]	; 0x58
 8001848:	4a34      	ldr	r2, [pc, #208]	; (800191c <RCC_GetClocksFreq+0x298>)
 800184a:	6b14      	ldr	r4, [r2, #48]	; 0x30
 800184c:	07a4      	lsls	r4, r4, #30
 800184e:	d014      	beq.n	800187a <RCC_GetClocksFreq+0x1f6>
 8001850:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001852:	f001 0103 	and.w	r1, r1, #3
 8001856:	2901      	cmp	r1, #1
 8001858:	d101      	bne.n	800185e <RCC_GetClocksFreq+0x1da>
 800185a:	6383      	str	r3, [r0, #56]	; 0x38
 800185c:	e00e      	b.n	800187c <RCC_GetClocksFreq+0x1f8>
 800185e:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001860:	f001 0103 	and.w	r1, r1, #3
 8001864:	2902      	cmp	r1, #2
 8001866:	d102      	bne.n	800186e <RCC_GetClocksFreq+0x1ea>
 8001868:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 800186c:	e005      	b.n	800187a <RCC_GetClocksFreq+0x1f6>
 800186e:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001870:	f001 0103 	and.w	r1, r1, #3
 8001874:	2903      	cmp	r1, #3
 8001876:	d101      	bne.n	800187c <RCC_GetClocksFreq+0x1f8>
 8001878:	4929      	ldr	r1, [pc, #164]	; (8001920 <RCC_GetClocksFreq+0x29c>)
 800187a:	6381      	str	r1, [r0, #56]	; 0x38
 800187c:	6b12      	ldr	r2, [r2, #48]	; 0x30
 800187e:	4927      	ldr	r1, [pc, #156]	; (800191c <RCC_GetClocksFreq+0x298>)
 8001880:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 8001884:	d101      	bne.n	800188a <RCC_GetClocksFreq+0x206>
 8001886:	63c6      	str	r6, [r0, #60]	; 0x3c
 8001888:	e018      	b.n	80018bc <RCC_GetClocksFreq+0x238>
 800188a:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800188c:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001890:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 8001894:	d101      	bne.n	800189a <RCC_GetClocksFreq+0x216>
 8001896:	63c3      	str	r3, [r0, #60]	; 0x3c
 8001898:	e010      	b.n	80018bc <RCC_GetClocksFreq+0x238>
 800189a:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800189c:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 80018a0:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 80018a4:	d102      	bne.n	80018ac <RCC_GetClocksFreq+0x228>
 80018a6:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80018aa:	e006      	b.n	80018ba <RCC_GetClocksFreq+0x236>
 80018ac:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80018ae:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 80018b2:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 80018b6:	d101      	bne.n	80018bc <RCC_GetClocksFreq+0x238>
 80018b8:	4a19      	ldr	r2, [pc, #100]	; (8001920 <RCC_GetClocksFreq+0x29c>)
 80018ba:	63c2      	str	r2, [r0, #60]	; 0x3c
 80018bc:	4a17      	ldr	r2, [pc, #92]	; (800191c <RCC_GetClocksFreq+0x298>)
 80018be:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80018c0:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 80018c4:	d101      	bne.n	80018ca <RCC_GetClocksFreq+0x246>
 80018c6:	6406      	str	r6, [r0, #64]	; 0x40
 80018c8:	e018      	b.n	80018fc <RCC_GetClocksFreq+0x278>
 80018ca:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80018cc:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 80018d0:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 80018d4:	d101      	bne.n	80018da <RCC_GetClocksFreq+0x256>
 80018d6:	6403      	str	r3, [r0, #64]	; 0x40
 80018d8:	e010      	b.n	80018fc <RCC_GetClocksFreq+0x278>
 80018da:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80018dc:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 80018e0:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 80018e4:	d102      	bne.n	80018ec <RCC_GetClocksFreq+0x268>
 80018e6:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80018ea:	e006      	b.n	80018fa <RCC_GetClocksFreq+0x276>
 80018ec:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80018ee:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 80018f2:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 80018f6:	d101      	bne.n	80018fc <RCC_GetClocksFreq+0x278>
 80018f8:	4909      	ldr	r1, [pc, #36]	; (8001920 <RCC_GetClocksFreq+0x29c>)
 80018fa:	6401      	str	r1, [r0, #64]	; 0x40
 80018fc:	6b12      	ldr	r2, [r2, #48]	; 0x30
 80018fe:	4907      	ldr	r1, [pc, #28]	; (800191c <RCC_GetClocksFreq+0x298>)
 8001900:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 8001904:	d101      	bne.n	800190a <RCC_GetClocksFreq+0x286>
 8001906:	6446      	str	r6, [r0, #68]	; 0x44
 8001908:	e023      	b.n	8001952 <RCC_GetClocksFreq+0x2ce>
 800190a:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800190c:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001910:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 8001914:	d10c      	bne.n	8001930 <RCC_GetClocksFreq+0x2ac>
 8001916:	6443      	str	r3, [r0, #68]	; 0x44
 8001918:	e01b      	b.n	8001952 <RCC_GetClocksFreq+0x2ce>
 800191a:	bf00      	nop
 800191c:	40021000 	.word	0x40021000
 8001920:	007a1200 	.word	0x007a1200
 8001924:	003d0900 	.word	0x003d0900
 8001928:	20000020 	.word	0x20000020
 800192c:	20000000 	.word	0x20000000
 8001930:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001932:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001936:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 800193a:	d102      	bne.n	8001942 <RCC_GetClocksFreq+0x2be>
 800193c:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001940:	e006      	b.n	8001950 <RCC_GetClocksFreq+0x2cc>
 8001942:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001944:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001948:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 800194c:	d101      	bne.n	8001952 <RCC_GetClocksFreq+0x2ce>
 800194e:	4a11      	ldr	r2, [pc, #68]	; (8001994 <RCC_GetClocksFreq+0x310>)
 8001950:	6442      	str	r2, [r0, #68]	; 0x44
 8001952:	4a11      	ldr	r2, [pc, #68]	; (8001998 <RCC_GetClocksFreq+0x314>)
 8001954:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001956:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 800195a:	d102      	bne.n	8001962 <RCC_GetClocksFreq+0x2de>
 800195c:	6486      	str	r6, [r0, #72]	; 0x48
 800195e:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001962:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001964:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 8001968:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 800196c:	d00f      	beq.n	800198e <RCC_GetClocksFreq+0x30a>
 800196e:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001970:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001974:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 8001978:	d102      	bne.n	8001980 <RCC_GetClocksFreq+0x2fc>
 800197a:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 800197e:	e006      	b.n	800198e <RCC_GetClocksFreq+0x30a>
 8001980:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001982:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001986:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 800198a:	d101      	bne.n	8001990 <RCC_GetClocksFreq+0x30c>
 800198c:	4b01      	ldr	r3, [pc, #4]	; (8001994 <RCC_GetClocksFreq+0x310>)
 800198e:	6483      	str	r3, [r0, #72]	; 0x48
 8001990:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001994:	007a1200 	.word	0x007a1200
 8001998:	40021000 	.word	0x40021000

0800199c <RCC_AHBPeriphClockCmd>:
 800199c:	bf00      	nop
 800199e:	bf00      	nop
 80019a0:	4b04      	ldr	r3, [pc, #16]	; (80019b4 <RCC_AHBPeriphClockCmd+0x18>)
 80019a2:	695a      	ldr	r2, [r3, #20]
 80019a4:	b109      	cbz	r1, 80019aa <RCC_AHBPeriphClockCmd+0xe>
 80019a6:	4310      	orrs	r0, r2
 80019a8:	e001      	b.n	80019ae <RCC_AHBPeriphClockCmd+0x12>
 80019aa:	ea22 0000 	bic.w	r0, r2, r0
 80019ae:	6158      	str	r0, [r3, #20]
 80019b0:	4770      	bx	lr
 80019b2:	bf00      	nop
 80019b4:	40021000 	.word	0x40021000

080019b8 <RCC_APB2PeriphClockCmd>:
 80019b8:	bf00      	nop
 80019ba:	bf00      	nop
 80019bc:	4b04      	ldr	r3, [pc, #16]	; (80019d0 <RCC_APB2PeriphClockCmd+0x18>)
 80019be:	699a      	ldr	r2, [r3, #24]
 80019c0:	b109      	cbz	r1, 80019c6 <RCC_APB2PeriphClockCmd+0xe>
 80019c2:	4310      	orrs	r0, r2
 80019c4:	e001      	b.n	80019ca <RCC_APB2PeriphClockCmd+0x12>
 80019c6:	ea22 0000 	bic.w	r0, r2, r0
 80019ca:	6198      	str	r0, [r3, #24]
 80019cc:	4770      	bx	lr
 80019ce:	bf00      	nop
 80019d0:	40021000 	.word	0x40021000

080019d4 <RCC_APB1PeriphClockCmd>:
 80019d4:	bf00      	nop
 80019d6:	bf00      	nop
 80019d8:	4b04      	ldr	r3, [pc, #16]	; (80019ec <RCC_APB1PeriphClockCmd+0x18>)
 80019da:	69da      	ldr	r2, [r3, #28]
 80019dc:	b109      	cbz	r1, 80019e2 <RCC_APB1PeriphClockCmd+0xe>
 80019de:	4310      	orrs	r0, r2
 80019e0:	e001      	b.n	80019e6 <RCC_APB1PeriphClockCmd+0x12>
 80019e2:	ea22 0000 	bic.w	r0, r2, r0
 80019e6:	61d8      	str	r0, [r3, #28]
 80019e8:	4770      	bx	lr
 80019ea:	bf00      	nop
 80019ec:	40021000 	.word	0x40021000

080019f0 <TIM_TimeBaseInit>:
 80019f0:	bf00      	nop
 80019f2:	bf00      	nop
 80019f4:	bf00      	nop
 80019f6:	4a24      	ldr	r2, [pc, #144]	; (8001a88 <TIM_TimeBaseInit+0x98>)
 80019f8:	8803      	ldrh	r3, [r0, #0]
 80019fa:	4290      	cmp	r0, r2
 80019fc:	b29b      	uxth	r3, r3
 80019fe:	d012      	beq.n	8001a26 <TIM_TimeBaseInit+0x36>
 8001a00:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8001a04:	4290      	cmp	r0, r2
 8001a06:	d00e      	beq.n	8001a26 <TIM_TimeBaseInit+0x36>
 8001a08:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001a0c:	d00b      	beq.n	8001a26 <TIM_TimeBaseInit+0x36>
 8001a0e:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 8001a12:	4290      	cmp	r0, r2
 8001a14:	d007      	beq.n	8001a26 <TIM_TimeBaseInit+0x36>
 8001a16:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a1a:	4290      	cmp	r0, r2
 8001a1c:	d003      	beq.n	8001a26 <TIM_TimeBaseInit+0x36>
 8001a1e:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 8001a22:	4290      	cmp	r0, r2
 8001a24:	d103      	bne.n	8001a2e <TIM_TimeBaseInit+0x3e>
 8001a26:	884a      	ldrh	r2, [r1, #2]
 8001a28:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001a2c:	4313      	orrs	r3, r2
 8001a2e:	4a17      	ldr	r2, [pc, #92]	; (8001a8c <TIM_TimeBaseInit+0x9c>)
 8001a30:	4290      	cmp	r0, r2
 8001a32:	d008      	beq.n	8001a46 <TIM_TimeBaseInit+0x56>
 8001a34:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a38:	4290      	cmp	r0, r2
 8001a3a:	d004      	beq.n	8001a46 <TIM_TimeBaseInit+0x56>
 8001a3c:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001a40:	890a      	ldrh	r2, [r1, #8]
 8001a42:	b29b      	uxth	r3, r3
 8001a44:	4313      	orrs	r3, r2
 8001a46:	8003      	strh	r3, [r0, #0]
 8001a48:	684b      	ldr	r3, [r1, #4]
 8001a4a:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001a4c:	880b      	ldrh	r3, [r1, #0]
 8001a4e:	8503      	strh	r3, [r0, #40]	; 0x28
 8001a50:	4b0d      	ldr	r3, [pc, #52]	; (8001a88 <TIM_TimeBaseInit+0x98>)
 8001a52:	4298      	cmp	r0, r3
 8001a54:	d013      	beq.n	8001a7e <TIM_TimeBaseInit+0x8e>
 8001a56:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001a5a:	4298      	cmp	r0, r3
 8001a5c:	d00f      	beq.n	8001a7e <TIM_TimeBaseInit+0x8e>
 8001a5e:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 8001a62:	4298      	cmp	r0, r3
 8001a64:	d00b      	beq.n	8001a7e <TIM_TimeBaseInit+0x8e>
 8001a66:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001a6a:	4298      	cmp	r0, r3
 8001a6c:	d007      	beq.n	8001a7e <TIM_TimeBaseInit+0x8e>
 8001a6e:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001a72:	4298      	cmp	r0, r3
 8001a74:	d003      	beq.n	8001a7e <TIM_TimeBaseInit+0x8e>
 8001a76:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001a7a:	4298      	cmp	r0, r3
 8001a7c:	d101      	bne.n	8001a82 <TIM_TimeBaseInit+0x92>
 8001a7e:	894b      	ldrh	r3, [r1, #10]
 8001a80:	8603      	strh	r3, [r0, #48]	; 0x30
 8001a82:	2301      	movs	r3, #1
 8001a84:	6143      	str	r3, [r0, #20]
 8001a86:	4770      	bx	lr
 8001a88:	40012c00 	.word	0x40012c00
 8001a8c:	40001000 	.word	0x40001000

08001a90 <TIM_Cmd>:
 8001a90:	bf00      	nop
 8001a92:	bf00      	nop
 8001a94:	8803      	ldrh	r3, [r0, #0]
 8001a96:	b119      	cbz	r1, 8001aa0 <TIM_Cmd+0x10>
 8001a98:	b29b      	uxth	r3, r3
 8001a9a:	f043 0301 	orr.w	r3, r3, #1
 8001a9e:	e003      	b.n	8001aa8 <TIM_Cmd+0x18>
 8001aa0:	f023 0301 	bic.w	r3, r3, #1
 8001aa4:	041b      	lsls	r3, r3, #16
 8001aa6:	0c1b      	lsrs	r3, r3, #16
 8001aa8:	8003      	strh	r3, [r0, #0]
 8001aaa:	4770      	bx	lr

08001aac <TIM_ClearITPendingBit>:
 8001aac:	bf00      	nop
 8001aae:	43c9      	mvns	r1, r1
 8001ab0:	b289      	uxth	r1, r1
 8001ab2:	6101      	str	r1, [r0, #16]
 8001ab4:	4770      	bx	lr
	...

08001ab8 <timer_init>:
 8001ab8:	b530      	push	{r4, r5, lr}
 8001aba:	2300      	movs	r3, #0
 8001abc:	b085      	sub	sp, #20
 8001abe:	491f      	ldr	r1, [pc, #124]	; (8001b3c <timer_init+0x84>)
 8001ac0:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001ac4:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001ac8:	491d      	ldr	r1, [pc, #116]	; (8001b40 <timer_init+0x88>)
 8001aca:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001ace:	4a1d      	ldr	r2, [pc, #116]	; (8001b44 <timer_init+0x8c>)
 8001ad0:	2400      	movs	r4, #0
 8001ad2:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8001ad6:	3301      	adds	r3, #1
 8001ad8:	2b04      	cmp	r3, #4
 8001ada:	4625      	mov	r5, r4
 8001adc:	d1ef      	bne.n	8001abe <timer_init+0x6>
 8001ade:	4b1a      	ldr	r3, [pc, #104]	; (8001b48 <timer_init+0x90>)
 8001ae0:	2002      	movs	r0, #2
 8001ae2:	2101      	movs	r1, #1
 8001ae4:	601c      	str	r4, [r3, #0]
 8001ae6:	f7ff ff75 	bl	80019d4 <RCC_APB1PeriphClockCmd>
 8001aea:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001aee:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001af2:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001af6:	4c15      	ldr	r4, [pc, #84]	; (8001b4c <timer_init+0x94>)
 8001af8:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001afc:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001b00:	4620      	mov	r0, r4
 8001b02:	2331      	movs	r3, #49	; 0x31
 8001b04:	a901      	add	r1, sp, #4
 8001b06:	9302      	str	r3, [sp, #8]
 8001b08:	f7ff ff72 	bl	80019f0 <TIM_TimeBaseInit>
 8001b0c:	4620      	mov	r0, r4
 8001b0e:	2101      	movs	r1, #1
 8001b10:	f7ff ffbe 	bl	8001a90 <TIM_Cmd>
 8001b14:	68e3      	ldr	r3, [r4, #12]
 8001b16:	f043 0301 	orr.w	r3, r3, #1
 8001b1a:	60e3      	str	r3, [r4, #12]
 8001b1c:	231d      	movs	r3, #29
 8001b1e:	f88d 3000 	strb.w	r3, [sp]
 8001b22:	4668      	mov	r0, sp
 8001b24:	2301      	movs	r3, #1
 8001b26:	f88d 5001 	strb.w	r5, [sp, #1]
 8001b2a:	f88d 3002 	strb.w	r3, [sp, #2]
 8001b2e:	f88d 3003 	strb.w	r3, [sp, #3]
 8001b32:	f7ff fb81 	bl	8001238 <NVIC_Init>
 8001b36:	b005      	add	sp, #20
 8001b38:	bd30      	pop	{r4, r5, pc}
 8001b3a:	bf00      	nop
 8001b3c:	200007e4 	.word	0x200007e4
 8001b40:	200007d8 	.word	0x200007d8
 8001b44:	200007d0 	.word	0x200007d0
 8001b48:	200007e0 	.word	0x200007e0
 8001b4c:	40000400 	.word	0x40000400

08001b50 <TIM3_IRQHandler>:
 8001b50:	2300      	movs	r3, #0
 8001b52:	4a10      	ldr	r2, [pc, #64]	; (8001b94 <TIM3_IRQHandler+0x44>)
 8001b54:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001b58:	b289      	uxth	r1, r1
 8001b5a:	b129      	cbz	r1, 8001b68 <TIM3_IRQHandler+0x18>
 8001b5c:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001b60:	b289      	uxth	r1, r1
 8001b62:	3901      	subs	r1, #1
 8001b64:	b289      	uxth	r1, r1
 8001b66:	e007      	b.n	8001b78 <TIM3_IRQHandler+0x28>
 8001b68:	490b      	ldr	r1, [pc, #44]	; (8001b98 <TIM3_IRQHandler+0x48>)
 8001b6a:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001b6e:	b289      	uxth	r1, r1
 8001b70:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001b74:	4a09      	ldr	r2, [pc, #36]	; (8001b9c <TIM3_IRQHandler+0x4c>)
 8001b76:	2101      	movs	r1, #1
 8001b78:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001b7c:	3301      	adds	r3, #1
 8001b7e:	2b04      	cmp	r3, #4
 8001b80:	d1e7      	bne.n	8001b52 <TIM3_IRQHandler+0x2>
 8001b82:	4b07      	ldr	r3, [pc, #28]	; (8001ba0 <TIM3_IRQHandler+0x50>)
 8001b84:	4807      	ldr	r0, [pc, #28]	; (8001ba4 <TIM3_IRQHandler+0x54>)
 8001b86:	681a      	ldr	r2, [r3, #0]
 8001b88:	2101      	movs	r1, #1
 8001b8a:	3201      	adds	r2, #1
 8001b8c:	601a      	str	r2, [r3, #0]
 8001b8e:	f7ff bf8d 	b.w	8001aac <TIM_ClearITPendingBit>
 8001b92:	bf00      	nop
 8001b94:	200007e4 	.word	0x200007e4
 8001b98:	200007d8 	.word	0x200007d8
 8001b9c:	200007d0 	.word	0x200007d0
 8001ba0:	200007e0 	.word	0x200007e0
 8001ba4:	40000400 	.word	0x40000400

08001ba8 <timer_get_time>:
 8001ba8:	b082      	sub	sp, #8
 8001baa:	b672      	cpsid	i
 8001bac:	4b04      	ldr	r3, [pc, #16]	; (8001bc0 <timer_get_time+0x18>)
 8001bae:	681b      	ldr	r3, [r3, #0]
 8001bb0:	9301      	str	r3, [sp, #4]
 8001bb2:	b662      	cpsie	i
 8001bb4:	9801      	ldr	r0, [sp, #4]
 8001bb6:	230a      	movs	r3, #10
 8001bb8:	fbb0 f0f3 	udiv	r0, r0, r3
 8001bbc:	b002      	add	sp, #8
 8001bbe:	4770      	bx	lr
 8001bc0:	200007e0 	.word	0x200007e0

08001bc4 <timer_delay_ms>:
 8001bc4:	b513      	push	{r0, r1, r4, lr}
 8001bc6:	4604      	mov	r4, r0
 8001bc8:	f7ff ffee 	bl	8001ba8 <timer_get_time>
 8001bcc:	4420      	add	r0, r4
 8001bce:	9001      	str	r0, [sp, #4]
 8001bd0:	9c01      	ldr	r4, [sp, #4]
 8001bd2:	f7ff ffe9 	bl	8001ba8 <timer_get_time>
 8001bd6:	4284      	cmp	r4, r0
 8001bd8:	d902      	bls.n	8001be0 <timer_delay_ms+0x1c>
 8001bda:	f7ff fccd 	bl	8001578 <sleep>
 8001bde:	e7f7      	b.n	8001bd0 <timer_delay_ms+0xc>
 8001be0:	b002      	add	sp, #8
 8001be2:	bd10      	pop	{r4, pc}

08001be4 <event_timer_set_period>:
 8001be4:	b672      	cpsid	i
 8001be6:	230a      	movs	r3, #10
 8001be8:	4359      	muls	r1, r3
 8001bea:	4b06      	ldr	r3, [pc, #24]	; (8001c04 <event_timer_set_period+0x20>)
 8001bec:	b289      	uxth	r1, r1
 8001bee:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001bf2:	4b05      	ldr	r3, [pc, #20]	; (8001c08 <event_timer_set_period+0x24>)
 8001bf4:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001bf8:	4b04      	ldr	r3, [pc, #16]	; (8001c0c <event_timer_set_period+0x28>)
 8001bfa:	2200      	movs	r2, #0
 8001bfc:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 8001c00:	b662      	cpsie	i
 8001c02:	4770      	bx	lr
 8001c04:	200007e4 	.word	0x200007e4
 8001c08:	200007d8 	.word	0x200007d8
 8001c0c:	200007d0 	.word	0x200007d0

08001c10 <event_timer_wait>:
 8001c10:	b510      	push	{r4, lr}
 8001c12:	4604      	mov	r4, r0
 8001c14:	4b06      	ldr	r3, [pc, #24]	; (8001c30 <event_timer_wait+0x20>)
 8001c16:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 8001c1a:	b292      	uxth	r2, r2
 8001c1c:	b912      	cbnz	r2, 8001c24 <event_timer_wait+0x14>
 8001c1e:	f7ff fcab 	bl	8001578 <sleep>
 8001c22:	e7f7      	b.n	8001c14 <event_timer_wait+0x4>
 8001c24:	b672      	cpsid	i
 8001c26:	2200      	movs	r2, #0
 8001c28:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 8001c2c:	b662      	cpsie	i
 8001c2e:	bd10      	pop	{r4, pc}
 8001c30:	200007d0 	.word	0x200007d0

08001c34 <GPIO_Init>:
 8001c34:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001c36:	bf00      	nop
 8001c38:	bf00      	nop
 8001c3a:	bf00      	nop
 8001c3c:	bf00      	nop
 8001c3e:	2300      	movs	r3, #0
 8001c40:	680e      	ldr	r6, [r1, #0]
 8001c42:	461a      	mov	r2, r3
 8001c44:	2501      	movs	r5, #1
 8001c46:	4095      	lsls	r5, r2
 8001c48:	ea05 0406 	and.w	r4, r5, r6
 8001c4c:	42ac      	cmp	r4, r5
 8001c4e:	d131      	bne.n	8001cb4 <GPIO_Init+0x80>
 8001c50:	790d      	ldrb	r5, [r1, #4]
 8001c52:	1e6f      	subs	r7, r5, #1
 8001c54:	b2ff      	uxtb	r7, r7
 8001c56:	2f01      	cmp	r7, #1
 8001c58:	d81c      	bhi.n	8001c94 <GPIO_Init+0x60>
 8001c5a:	bf00      	nop
 8001c5c:	f04f 0c03 	mov.w	ip, #3
 8001c60:	6887      	ldr	r7, [r0, #8]
 8001c62:	fa0c fc03 	lsl.w	ip, ip, r3
 8001c66:	ea27 070c 	bic.w	r7, r7, ip
 8001c6a:	6087      	str	r7, [r0, #8]
 8001c6c:	f891 c005 	ldrb.w	ip, [r1, #5]
 8001c70:	6887      	ldr	r7, [r0, #8]
 8001c72:	fa0c fc03 	lsl.w	ip, ip, r3
 8001c76:	ea4c 0707 	orr.w	r7, ip, r7
 8001c7a:	6087      	str	r7, [r0, #8]
 8001c7c:	bf00      	nop
 8001c7e:	8887      	ldrh	r7, [r0, #4]
 8001c80:	b2bf      	uxth	r7, r7
 8001c82:	ea27 0404 	bic.w	r4, r7, r4
 8001c86:	8084      	strh	r4, [r0, #4]
 8001c88:	798c      	ldrb	r4, [r1, #6]
 8001c8a:	8887      	ldrh	r7, [r0, #4]
 8001c8c:	4094      	lsls	r4, r2
 8001c8e:	433c      	orrs	r4, r7
 8001c90:	b2a4      	uxth	r4, r4
 8001c92:	8084      	strh	r4, [r0, #4]
 8001c94:	2403      	movs	r4, #3
 8001c96:	6807      	ldr	r7, [r0, #0]
 8001c98:	409c      	lsls	r4, r3
 8001c9a:	43e4      	mvns	r4, r4
 8001c9c:	4027      	ands	r7, r4
 8001c9e:	6007      	str	r7, [r0, #0]
 8001ca0:	6807      	ldr	r7, [r0, #0]
 8001ca2:	409d      	lsls	r5, r3
 8001ca4:	433d      	orrs	r5, r7
 8001ca6:	6005      	str	r5, [r0, #0]
 8001ca8:	68c5      	ldr	r5, [r0, #12]
 8001caa:	402c      	ands	r4, r5
 8001cac:	79cd      	ldrb	r5, [r1, #7]
 8001cae:	409d      	lsls	r5, r3
 8001cb0:	432c      	orrs	r4, r5
 8001cb2:	60c4      	str	r4, [r0, #12]
 8001cb4:	3201      	adds	r2, #1
 8001cb6:	2a10      	cmp	r2, #16
 8001cb8:	f103 0302 	add.w	r3, r3, #2
 8001cbc:	d1c2      	bne.n	8001c44 <GPIO_Init+0x10>
 8001cbe:	bdf0      	pop	{r4, r5, r6, r7, pc}

08001cc0 <GPIO_SetBits>:
 8001cc0:	bf00      	nop
 8001cc2:	bf00      	nop
 8001cc4:	6181      	str	r1, [r0, #24]
 8001cc6:	4770      	bx	lr

08001cc8 <GPIO_ResetBits>:
 8001cc8:	bf00      	nop
 8001cca:	bf00      	nop
 8001ccc:	8501      	strh	r1, [r0, #40]	; 0x28
 8001cce:	4770      	bx	lr

08001cd0 <GPIO_PinAFConfig>:
 8001cd0:	b510      	push	{r4, lr}
 8001cd2:	bf00      	nop
 8001cd4:	bf00      	nop
 8001cd6:	bf00      	nop
 8001cd8:	f001 0307 	and.w	r3, r1, #7
 8001cdc:	08c9      	lsrs	r1, r1, #3
 8001cde:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8001ce2:	009b      	lsls	r3, r3, #2
 8001ce4:	6a04      	ldr	r4, [r0, #32]
 8001ce6:	210f      	movs	r1, #15
 8001ce8:	4099      	lsls	r1, r3
 8001cea:	ea24 0101 	bic.w	r1, r4, r1
 8001cee:	6201      	str	r1, [r0, #32]
 8001cf0:	6a01      	ldr	r1, [r0, #32]
 8001cf2:	fa02 f303 	lsl.w	r3, r2, r3
 8001cf6:	430b      	orrs	r3, r1
 8001cf8:	6203      	str	r3, [r0, #32]
 8001cfa:	bd10      	pop	{r4, pc}

08001cfc <gpio_init>:
 8001cfc:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 8001d00:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001d04:	2101      	movs	r1, #1
 8001d06:	f7ff fe49 	bl	800199c <RCC_AHBPeriphClockCmd>
 8001d0a:	4d21      	ldr	r5, [pc, #132]	; (8001d90 <gpio_init+0x94>)
 8001d0c:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001d10:	2101      	movs	r1, #1
 8001d12:	f7ff fe43 	bl	800199c <RCC_AHBPeriphClockCmd>
 8001d16:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 8001d1a:	2101      	movs	r1, #1
 8001d1c:	f7ff fe3e 	bl	800199c <RCC_AHBPeriphClockCmd>
 8001d20:	2400      	movs	r4, #0
 8001d22:	2603      	movs	r6, #3
 8001d24:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 8001d28:	f04f 0901 	mov.w	r9, #1
 8001d2c:	4628      	mov	r0, r5
 8001d2e:	4669      	mov	r1, sp
 8001d30:	2708      	movs	r7, #8
 8001d32:	f8cd 8000 	str.w	r8, [sp]
 8001d36:	f88d 9004 	strb.w	r9, [sp, #4]
 8001d3a:	f88d 4006 	strb.w	r4, [sp, #6]
 8001d3e:	f88d 6005 	strb.w	r6, [sp, #5]
 8001d42:	f88d 4007 	strb.w	r4, [sp, #7]
 8001d46:	f7ff ff75 	bl	8001c34 <GPIO_Init>
 8001d4a:	4669      	mov	r1, sp
 8001d4c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001d50:	9700      	str	r7, [sp, #0]
 8001d52:	f88d 9004 	strb.w	r9, [sp, #4]
 8001d56:	f88d 4006 	strb.w	r4, [sp, #6]
 8001d5a:	f88d 6005 	strb.w	r6, [sp, #5]
 8001d5e:	f88d 4007 	strb.w	r4, [sp, #7]
 8001d62:	f7ff ff67 	bl	8001c34 <GPIO_Init>
 8001d66:	f44f 7300 	mov.w	r3, #512	; 0x200
 8001d6a:	4628      	mov	r0, r5
 8001d6c:	4669      	mov	r1, sp
 8001d6e:	9300      	str	r3, [sp, #0]
 8001d70:	f88d 4004 	strb.w	r4, [sp, #4]
 8001d74:	f88d 6005 	strb.w	r6, [sp, #5]
 8001d78:	f88d 4007 	strb.w	r4, [sp, #7]
 8001d7c:	f7ff ff5a 	bl	8001c34 <GPIO_Init>
 8001d80:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001d84:	f8c5 8018 	str.w	r8, [r5, #24]
 8001d88:	619f      	str	r7, [r3, #24]
 8001d8a:	b003      	add	sp, #12
 8001d8c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001d90:	48000400 	.word	0x48000400

08001d94 <led_on>:
 8001d94:	0402      	lsls	r2, r0, #16
 8001d96:	d503      	bpl.n	8001da0 <led_on+0xc>
 8001d98:	4b05      	ldr	r3, [pc, #20]	; (8001db0 <led_on+0x1c>)
 8001d9a:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001d9e:	619a      	str	r2, [r3, #24]
 8001da0:	0703      	lsls	r3, r0, #28
 8001da2:	d503      	bpl.n	8001dac <led_on+0x18>
 8001da4:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001da8:	2208      	movs	r2, #8
 8001daa:	851a      	strh	r2, [r3, #40]	; 0x28
 8001dac:	4770      	bx	lr
 8001dae:	bf00      	nop
 8001db0:	48000400 	.word	0x48000400

08001db4 <led_off>:
 8001db4:	0403      	lsls	r3, r0, #16
 8001db6:	d503      	bpl.n	8001dc0 <led_off+0xc>
 8001db8:	4b05      	ldr	r3, [pc, #20]	; (8001dd0 <led_off+0x1c>)
 8001dba:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001dbe:	851a      	strh	r2, [r3, #40]	; 0x28
 8001dc0:	0701      	lsls	r1, r0, #28
 8001dc2:	d503      	bpl.n	8001dcc <led_off+0x18>
 8001dc4:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001dc8:	2208      	movs	r2, #8
 8001dca:	619a      	str	r2, [r3, #24]
 8001dcc:	4770      	bx	lr
 8001dce:	bf00      	nop
 8001dd0:	48000400 	.word	0x48000400

08001dd4 <get_key>:
 8001dd4:	4b02      	ldr	r3, [pc, #8]	; (8001de0 <get_key+0xc>)
 8001dd6:	8a18      	ldrh	r0, [r3, #16]
 8001dd8:	43c0      	mvns	r0, r0
 8001dda:	f400 7000 	and.w	r0, r0, #512	; 0x200
 8001dde:	4770      	bx	lr
 8001de0:	48000400 	.word	0x48000400

08001de4 <_init>:
 8001de4:	e1a0c00d 	mov	ip, sp
 8001de8:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001dec:	e24cb004 	sub	fp, ip, #4
 8001df0:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001df4:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001df8:	e12fff1e 	bx	lr

08001dfc <_fini>:
 8001dfc:	e1a0c00d 	mov	ip, sp
 8001e00:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001e04:	e24cb004 	sub	fp, ip, #4
 8001e08:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001e0c:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001e10:	e12fff1e 	bx	lr
 8001e14:	69647473 	.word	0x69647473
 8001e18:	6e69206f 	.word	0x6e69206f
 8001e1c:	64207469 	.word	0x64207469
 8001e20:	0a656e6f 	.word	0x0a656e6f
 8001e24:	00          	.byte	0x00
 8001e25:	0a          	.byte	0x0a
 8001e26:	6577      	.short	0x6577
 8001e28:	6d6f636c 	.word	0x6d6f636c
 8001e2c:	6f742065 	.word	0x6f742065
 8001e30:	7a755320 	.word	0x7a755320
 8001e34:	4f616875 	.word	0x4f616875
 8001e38:	5f5e2053 	.word	0x5f5e2053
 8001e3c:	2e32205e 	.word	0x2e32205e
 8001e40:	0a362e30 	.word	0x0a362e30
 8001e44:	4c495542 	.word	0x4c495542
 8001e48:	65462044 	.word	0x65462044
 8001e4c:	39312062 	.word	0x39312062
 8001e50:	31303220 	.word	0x31303220
 8001e54:	31322036 	.word	0x31322036
 8001e58:	3a36323a 	.word	0x3a36323a
 8001e5c:	000a3732 	.word	0x000a3732
 8001e60:	6f727265 	.word	0x6f727265
 8001e64:	6f632072 	.word	0x6f632072
 8001e68:	25206564 	.word	0x25206564
 8001e6c:	75253a75 	.word	0x75253a75
 8001e70:	0000000a 	.word	0x0000000a

08001e74 <__EH_FRAME_BEGIN__>:
 8001e74:	00000000                                ....
