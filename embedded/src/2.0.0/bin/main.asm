
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <main>:
 8000188:	b508      	push	{r3, lr}
 800018a:	f000 fd83 	bl	8000c94 <lib_low_level_init>
 800018e:	f000 f921 	bl	80003d4 <lib_os_init>
 8000192:	4905      	ldr	r1, [pc, #20]	; (80001a8 <main+0x20>)
 8000194:	4805      	ldr	r0, [pc, #20]	; (80001ac <main+0x24>)
 8000196:	f44f 7200 	mov.w	r2, #512	; 0x200
 800019a:	2306      	movs	r3, #6
 800019c:	f000 f88a 	bl	80002b4 <create_thread>
 80001a0:	f000 f882 	bl	80002a8 <kernel_start>
 80001a4:	2000      	movs	r0, #0
 80001a6:	bd08      	pop	{r3, pc}
 80001a8:	20000030 	.word	0x20000030
 80001ac:	080008dd 	.word	0x080008dd

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
 80001c8:	20000278 	.word	0x20000278
 80001cc:	20000230 	.word	0x20000230

080001d0 <null_thread>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f000 ff0d 	bl	8000ff0 <sleep>
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
 8000234:	20000230 	.word	0x20000230
 8000238:	20000278 	.word	0x20000278

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
 800027c:	20000278 	.word	0x20000278
 8000280:	20000230 	.word	0x20000230

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
 80002a4:	20000278 	.word	0x20000278

080002a8 <kernel_start>:
 80002a8:	b508      	push	{r3, lr}
 80002aa:	f000 fe8f 	bl	8000fcc <sys_tick_init>
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
 8000320:	20000230 	.word	0x20000230
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
 800035c:	20000230 	.word	0x20000230
 8000360:	20000278 	.word	0x20000278
 8000364:	080001d1 	.word	0x080001d1
 8000368:	2000027c 	.word	0x2000027c

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
 80003ac:	20000230 	.word	0x20000230

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
 80003d0:	20000230 	.word	0x20000230

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
 80003f6:	f000 fb0b 	bl	8000a10 <uart_write>
 80003fa:	4620      	mov	r0, r4
 80003fc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000400:	f000 b926 	b.w	8000650 <mutex_unlock>
 8000404:	200002fc 	.word	0x200002fc

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
 800042c:	20000308 	.word	0x20000308

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
 800057c:	20000304 	.word	0x20000304

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
 80005bc:	200002fc 	.word	0x200002fc
 80005c0:	20000300 	.word	0x20000300
 80005c4:	20000308 	.word	0x20000308
 80005c8:	20000304 	.word	0x20000304
 80005cc:	08001880 	.word	0x08001880

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
 80005fc:	2000030c 	.word	0x2000030c
 8000600:	20000324 	.word	0x20000324

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
	...

08000664 <lsm9ds0_read>:
 8000664:	b538      	push	{r3, r4, r5, lr}
 8000666:	2128      	movs	r1, #40	; 0x28
 8000668:	20d4      	movs	r0, #212	; 0xd4
 800066a:	f000 fc56 	bl	8000f1a <i2c_read_reg>
 800066e:	2129      	movs	r1, #41	; 0x29
 8000670:	4605      	mov	r5, r0
 8000672:	20d4      	movs	r0, #212	; 0xd4
 8000674:	f000 fc51 	bl	8000f1a <i2c_read_reg>
 8000678:	4c38      	ldr	r4, [pc, #224]	; (800075c <lsm9ds0_read+0xf8>)
 800067a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800067e:	81a0      	strh	r0, [r4, #12]
 8000680:	212a      	movs	r1, #42	; 0x2a
 8000682:	20d4      	movs	r0, #212	; 0xd4
 8000684:	f000 fc49 	bl	8000f1a <i2c_read_reg>
 8000688:	212b      	movs	r1, #43	; 0x2b
 800068a:	4605      	mov	r5, r0
 800068c:	20d4      	movs	r0, #212	; 0xd4
 800068e:	f000 fc44 	bl	8000f1a <i2c_read_reg>
 8000692:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000696:	81e0      	strh	r0, [r4, #14]
 8000698:	212c      	movs	r1, #44	; 0x2c
 800069a:	20d4      	movs	r0, #212	; 0xd4
 800069c:	f000 fc3d 	bl	8000f1a <i2c_read_reg>
 80006a0:	212d      	movs	r1, #45	; 0x2d
 80006a2:	4605      	mov	r5, r0
 80006a4:	20d4      	movs	r0, #212	; 0xd4
 80006a6:	f000 fc38 	bl	8000f1a <i2c_read_reg>
 80006aa:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006ae:	8220      	strh	r0, [r4, #16]
 80006b0:	2108      	movs	r1, #8
 80006b2:	203c      	movs	r0, #60	; 0x3c
 80006b4:	f000 fc31 	bl	8000f1a <i2c_read_reg>
 80006b8:	2109      	movs	r1, #9
 80006ba:	4605      	mov	r5, r0
 80006bc:	203c      	movs	r0, #60	; 0x3c
 80006be:	f000 fc2c 	bl	8000f1a <i2c_read_reg>
 80006c2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006c6:	80e0      	strh	r0, [r4, #6]
 80006c8:	210a      	movs	r1, #10
 80006ca:	203c      	movs	r0, #60	; 0x3c
 80006cc:	f000 fc25 	bl	8000f1a <i2c_read_reg>
 80006d0:	210b      	movs	r1, #11
 80006d2:	4605      	mov	r5, r0
 80006d4:	203c      	movs	r0, #60	; 0x3c
 80006d6:	f000 fc20 	bl	8000f1a <i2c_read_reg>
 80006da:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006de:	8120      	strh	r0, [r4, #8]
 80006e0:	210c      	movs	r1, #12
 80006e2:	203c      	movs	r0, #60	; 0x3c
 80006e4:	f000 fc19 	bl	8000f1a <i2c_read_reg>
 80006e8:	210d      	movs	r1, #13
 80006ea:	4605      	mov	r5, r0
 80006ec:	203c      	movs	r0, #60	; 0x3c
 80006ee:	f000 fc14 	bl	8000f1a <i2c_read_reg>
 80006f2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80006f6:	8160      	strh	r0, [r4, #10]
 80006f8:	2128      	movs	r1, #40	; 0x28
 80006fa:	203c      	movs	r0, #60	; 0x3c
 80006fc:	f000 fc0d 	bl	8000f1a <i2c_read_reg>
 8000700:	2129      	movs	r1, #41	; 0x29
 8000702:	4605      	mov	r5, r0
 8000704:	203c      	movs	r0, #60	; 0x3c
 8000706:	f000 fc08 	bl	8000f1a <i2c_read_reg>
 800070a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800070e:	8020      	strh	r0, [r4, #0]
 8000710:	212a      	movs	r1, #42	; 0x2a
 8000712:	203c      	movs	r0, #60	; 0x3c
 8000714:	f000 fc01 	bl	8000f1a <i2c_read_reg>
 8000718:	212b      	movs	r1, #43	; 0x2b
 800071a:	4605      	mov	r5, r0
 800071c:	203c      	movs	r0, #60	; 0x3c
 800071e:	f000 fbfc 	bl	8000f1a <i2c_read_reg>
 8000722:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000726:	8060      	strh	r0, [r4, #2]
 8000728:	212c      	movs	r1, #44	; 0x2c
 800072a:	203c      	movs	r0, #60	; 0x3c
 800072c:	f000 fbf5 	bl	8000f1a <i2c_read_reg>
 8000730:	212d      	movs	r1, #45	; 0x2d
 8000732:	4605      	mov	r5, r0
 8000734:	203c      	movs	r0, #60	; 0x3c
 8000736:	f000 fbf0 	bl	8000f1a <i2c_read_reg>
 800073a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800073e:	80a0      	strh	r0, [r4, #4]
 8000740:	2105      	movs	r1, #5
 8000742:	203c      	movs	r0, #60	; 0x3c
 8000744:	f000 fbe9 	bl	8000f1a <i2c_read_reg>
 8000748:	2106      	movs	r1, #6
 800074a:	4605      	mov	r5, r0
 800074c:	203c      	movs	r0, #60	; 0x3c
 800074e:	f000 fbe4 	bl	8000f1a <i2c_read_reg>
 8000752:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000756:	8320      	strh	r0, [r4, #24]
 8000758:	bd38      	pop	{r3, r4, r5, pc}
 800075a:	bf00      	nop
 800075c:	20000364 	.word	0x20000364

08000760 <lsm9ds0_init>:
 8000760:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000764:	4d34      	ldr	r5, [pc, #208]	; (8000838 <lsm9ds0_init+0xd8>)
 8000766:	2400      	movs	r4, #0
 8000768:	20d4      	movs	r0, #212	; 0xd4
 800076a:	210f      	movs	r1, #15
 800076c:	802c      	strh	r4, [r5, #0]
 800076e:	806c      	strh	r4, [r5, #2]
 8000770:	80ac      	strh	r4, [r5, #4]
 8000772:	80ec      	strh	r4, [r5, #6]
 8000774:	812c      	strh	r4, [r5, #8]
 8000776:	816c      	strh	r4, [r5, #10]
 8000778:	81ac      	strh	r4, [r5, #12]
 800077a:	81ec      	strh	r4, [r5, #14]
 800077c:	822c      	strh	r4, [r5, #16]
 800077e:	826c      	strh	r4, [r5, #18]
 8000780:	82ac      	strh	r4, [r5, #20]
 8000782:	82ec      	strh	r4, [r5, #22]
 8000784:	832c      	strh	r4, [r5, #24]
 8000786:	f000 fbc8 	bl	8000f1a <i2c_read_reg>
 800078a:	28d4      	cmp	r0, #212	; 0xd4
 800078c:	4606      	mov	r6, r0
 800078e:	d14e      	bne.n	800082e <lsm9ds0_init+0xce>
 8000790:	203c      	movs	r0, #60	; 0x3c
 8000792:	210f      	movs	r1, #15
 8000794:	f000 fbc1 	bl	8000f1a <i2c_read_reg>
 8000798:	2849      	cmp	r0, #73	; 0x49
 800079a:	bf18      	it	ne
 800079c:	2602      	movne	r6, #2
 800079e:	d147      	bne.n	8000830 <lsm9ds0_init+0xd0>
 80007a0:	4630      	mov	r0, r6
 80007a2:	2120      	movs	r1, #32
 80007a4:	22ff      	movs	r2, #255	; 0xff
 80007a6:	f000 fba5 	bl	8000ef4 <i2c_write_reg>
 80007aa:	4630      	mov	r0, r6
 80007ac:	2123      	movs	r1, #35	; 0x23
 80007ae:	2218      	movs	r2, #24
 80007b0:	f000 fba0 	bl	8000ef4 <i2c_write_reg>
 80007b4:	203c      	movs	r0, #60	; 0x3c
 80007b6:	211f      	movs	r1, #31
 80007b8:	4622      	mov	r2, r4
 80007ba:	f000 fb9b 	bl	8000ef4 <i2c_write_reg>
 80007be:	203c      	movs	r0, #60	; 0x3c
 80007c0:	2120      	movs	r1, #32
 80007c2:	2267      	movs	r2, #103	; 0x67
 80007c4:	f000 fb96 	bl	8000ef4 <i2c_write_reg>
 80007c8:	203c      	movs	r0, #60	; 0x3c
 80007ca:	2121      	movs	r1, #33	; 0x21
 80007cc:	4622      	mov	r2, r4
 80007ce:	f000 fb91 	bl	8000ef4 <i2c_write_reg>
 80007d2:	203c      	movs	r0, #60	; 0x3c
 80007d4:	2124      	movs	r1, #36	; 0x24
 80007d6:	22f4      	movs	r2, #244	; 0xf4
 80007d8:	f000 fb8c 	bl	8000ef4 <i2c_write_reg>
 80007dc:	203c      	movs	r0, #60	; 0x3c
 80007de:	2125      	movs	r1, #37	; 0x25
 80007e0:	4622      	mov	r2, r4
 80007e2:	f000 fb87 	bl	8000ef4 <i2c_write_reg>
 80007e6:	203c      	movs	r0, #60	; 0x3c
 80007e8:	2126      	movs	r1, #38	; 0x26
 80007ea:	2280      	movs	r2, #128	; 0x80
 80007ec:	f000 fb82 	bl	8000ef4 <i2c_write_reg>
 80007f0:	f7ff ff38 	bl	8000664 <lsm9ds0_read>
 80007f4:	2664      	movs	r6, #100	; 0x64
 80007f6:	4627      	mov	r7, r4
 80007f8:	46a0      	mov	r8, r4
 80007fa:	f7ff ff33 	bl	8000664 <lsm9ds0_read>
 80007fe:	f9b5 200c 	ldrsh.w	r2, [r5, #12]
 8000802:	4b0d      	ldr	r3, [pc, #52]	; (8000838 <lsm9ds0_init+0xd8>)
 8000804:	4490      	add	r8, r2
 8000806:	f9b5 200e 	ldrsh.w	r2, [r5, #14]
 800080a:	4417      	add	r7, r2
 800080c:	f9b5 2010 	ldrsh.w	r2, [r5, #16]
 8000810:	3e01      	subs	r6, #1
 8000812:	4414      	add	r4, r2
 8000814:	d1f1      	bne.n	80007fa <lsm9ds0_init+0x9a>
 8000816:	2264      	movs	r2, #100	; 0x64
 8000818:	fb98 f8f2 	sdiv	r8, r8, r2
 800081c:	fb97 f7f2 	sdiv	r7, r7, r2
 8000820:	fb94 f4f2 	sdiv	r4, r4, r2
 8000824:	f8a3 8012 	strh.w	r8, [r3, #18]
 8000828:	829f      	strh	r7, [r3, #20]
 800082a:	82dc      	strh	r4, [r3, #22]
 800082c:	e000      	b.n	8000830 <lsm9ds0_init+0xd0>
 800082e:	2601      	movs	r6, #1
 8000830:	4630      	mov	r0, r6
 8000832:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000836:	bf00      	nop
 8000838:	20000364 	.word	0x20000364

0800083c <motor_run>:
 800083c:	283f      	cmp	r0, #63	; 0x3f
 800083e:	b510      	push	{r4, lr}
 8000840:	dc36      	bgt.n	80008b0 <motor_run+0x74>
 8000842:	f110 0f3f 	cmn.w	r0, #63	; 0x3f
 8000846:	bfb8      	it	lt
 8000848:	f06f 003e 	mvnlt.w	r0, #62	; 0x3e
 800084c:	db04      	blt.n	8000858 <motor_run+0x1c>
 800084e:	2800      	cmp	r0, #0
 8000850:	bf08      	it	eq
 8000852:	2203      	moveq	r2, #3
 8000854:	d006      	beq.n	8000864 <motor_run+0x28>
 8000856:	da00      	bge.n	800085a <motor_run+0x1e>
 8000858:	4240      	negs	r0, r0
 800085a:	2804      	cmp	r0, #4
 800085c:	dd01      	ble.n	8000862 <motor_run+0x26>
 800085e:	2202      	movs	r2, #2
 8000860:	e001      	b.n	8000866 <motor_run+0x2a>
 8000862:	2202      	movs	r2, #2
 8000864:	2005      	movs	r0, #5
 8000866:	ea42 0280 	orr.w	r2, r2, r0, lsl #2
 800086a:	293f      	cmp	r1, #63	; 0x3f
 800086c:	b2d2      	uxtb	r2, r2
 800086e:	dc21      	bgt.n	80008b4 <motor_run+0x78>
 8000870:	f111 0f3f 	cmn.w	r1, #63	; 0x3f
 8000874:	bfb8      	it	lt
 8000876:	f06f 013e 	mvnlt.w	r1, #62	; 0x3e
 800087a:	db04      	blt.n	8000886 <motor_run+0x4a>
 800087c:	2900      	cmp	r1, #0
 800087e:	bf08      	it	eq
 8000880:	2303      	moveq	r3, #3
 8000882:	d006      	beq.n	8000892 <motor_run+0x56>
 8000884:	da00      	bge.n	8000888 <motor_run+0x4c>
 8000886:	4249      	negs	r1, r1
 8000888:	2904      	cmp	r1, #4
 800088a:	dd01      	ble.n	8000890 <motor_run+0x54>
 800088c:	2302      	movs	r3, #2
 800088e:	e001      	b.n	8000894 <motor_run+0x58>
 8000890:	2302      	movs	r3, #2
 8000892:	2105      	movs	r1, #5
 8000894:	ea43 0181 	orr.w	r1, r3, r1, lsl #2
 8000898:	b2cc      	uxtb	r4, r1
 800089a:	20c0      	movs	r0, #192	; 0xc0
 800089c:	2100      	movs	r1, #0
 800089e:	f000 fb29 	bl	8000ef4 <i2c_write_reg>
 80008a2:	4622      	mov	r2, r4
 80008a4:	20c2      	movs	r0, #194	; 0xc2
 80008a6:	2100      	movs	r1, #0
 80008a8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80008ac:	f000 bb22 	b.w	8000ef4 <i2c_write_reg>
 80008b0:	203f      	movs	r0, #63	; 0x3f
 80008b2:	e7d4      	b.n	800085e <motor_run+0x22>
 80008b4:	213f      	movs	r1, #63	; 0x3f
 80008b6:	e7e9      	b.n	800088c <motor_run+0x50>

080008b8 <drv8830_init>:
 80008b8:	2000      	movs	r0, #0
 80008ba:	4601      	mov	r1, r0
 80008bc:	f7ff bfbe 	b.w	800083c <motor_run>

080008c0 <rgb_sensor_init>:
 80008c0:	2000      	movs	r0, #0
 80008c2:	4770      	bx	lr

080008c4 <rgb_sensor_read>:
 80008c4:	4770      	bx	lr
	...

080008c8 <adc_sensor_init>:
 80008c8:	4b02      	ldr	r3, [pc, #8]	; (80008d4 <adc_sensor_init+0xc>)
 80008ca:	2000      	movs	r0, #0
 80008cc:	6018      	str	r0, [r3, #0]
 80008ce:	6058      	str	r0, [r3, #4]
 80008d0:	6098      	str	r0, [r3, #8]
 80008d2:	4770      	bx	lr
 80008d4:	20000380 	.word	0x20000380

080008d8 <adc_sensor_read>:
 80008d8:	4770      	bx	lr
	...

080008dc <main_thread>:
 80008dc:	b508      	push	{r3, lr}
 80008de:	4818      	ldr	r0, [pc, #96]	; (8000940 <main_thread+0x64>)
 80008e0:	f7ff fdfc 	bl	80004dc <printf_>
 80008e4:	f44f 7096 	mov.w	r0, #300	; 0x12c
 80008e8:	f000 fea8 	bl	800163c <timer_delay_ms>
 80008ec:	f7ff ffe4 	bl	80008b8 <drv8830_init>
 80008f0:	4914      	ldr	r1, [pc, #80]	; (8000944 <main_thread+0x68>)
 80008f2:	4815      	ldr	r0, [pc, #84]	; (8000948 <main_thread+0x6c>)
 80008f4:	f44f 7200 	mov.w	r2, #512	; 0x200
 80008f8:	2306      	movs	r3, #6
 80008fa:	f7ff fcdb 	bl	80002b4 <create_thread>
 80008fe:	4913      	ldr	r1, [pc, #76]	; (800094c <main_thread+0x70>)
 8000900:	4813      	ldr	r0, [pc, #76]	; (8000950 <main_thread+0x74>)
 8000902:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000906:	2306      	movs	r3, #6
 8000908:	f7ff fcd4 	bl	80002b4 <create_thread>
 800090c:	4811      	ldr	r0, [pc, #68]	; (8000954 <main_thread+0x78>)
 800090e:	4912      	ldr	r1, [pc, #72]	; (8000958 <main_thread+0x7c>)
 8000910:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000914:	2306      	movs	r3, #6
 8000916:	f7ff fccd 	bl	80002b4 <create_thread>
 800091a:	f000 ff91 	bl	8001840 <get_key>
 800091e:	b970      	cbnz	r0, 800093e <main_thread+0x62>
 8000920:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000924:	f000 ff70 	bl	8001808 <led_on>
 8000928:	2064      	movs	r0, #100	; 0x64
 800092a:	f000 fe87 	bl	800163c <timer_delay_ms>
 800092e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000932:	f000 ff77 	bl	8001824 <led_off>
 8000936:	20c8      	movs	r0, #200	; 0xc8
 8000938:	f000 fe80 	bl	800163c <timer_delay_ms>
 800093c:	e7ed      	b.n	800091a <main_thread+0x3e>
 800093e:	e7fe      	b.n	800093e <main_thread+0x62>
 8000940:	08001891 	.word	0x08001891
 8000944:	2000078c 	.word	0x2000078c
 8000948:	080009a5 	.word	0x080009a5
 800094c:	2000058c 	.word	0x2000058c
 8000950:	080009c9 	.word	0x080009c9
 8000954:	080009ed 	.word	0x080009ed
 8000958:	2000038c 	.word	0x2000038c

0800095c <abort_error_>:
 800095c:	b570      	push	{r4, r5, r6, lr}
 800095e:	4605      	mov	r5, r0
 8000960:	460e      	mov	r6, r1
 8000962:	480f      	ldr	r0, [pc, #60]	; (80009a0 <abort_error_+0x44>)
 8000964:	4629      	mov	r1, r5
 8000966:	4632      	mov	r2, r6
 8000968:	f7ff fdb8 	bl	80004dc <printf_>
 800096c:	2400      	movs	r4, #0
 800096e:	1ceb      	adds	r3, r5, #3
 8000970:	429c      	cmp	r4, r3
 8000972:	d20f      	bcs.n	8000994 <abort_error_+0x38>
 8000974:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000978:	f000 ff46 	bl	8001808 <led_on>
 800097c:	2032      	movs	r0, #50	; 0x32
 800097e:	f000 fe5d 	bl	800163c <timer_delay_ms>
 8000982:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000986:	f000 ff4d 	bl	8001824 <led_off>
 800098a:	2064      	movs	r0, #100	; 0x64
 800098c:	f000 fe56 	bl	800163c <timer_delay_ms>
 8000990:	3401      	adds	r4, #1
 8000992:	e7ec      	b.n	800096e <abort_error_+0x12>
 8000994:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000998:	f000 fe50 	bl	800163c <timer_delay_ms>
 800099c:	e7e1      	b.n	8000962 <abort_error_+0x6>
 800099e:	bf00      	nop
 80009a0:	080018cc 	.word	0x080018cc

080009a4 <rgb_sensor_thread>:
 80009a4:	b508      	push	{r3, lr}
 80009a6:	f7ff ff8b 	bl	80008c0 <rgb_sensor_init>
 80009aa:	4601      	mov	r1, r0
 80009ac:	b110      	cbz	r0, 80009b4 <rgb_sensor_thread+0x10>
 80009ae:	2001      	movs	r0, #1
 80009b0:	f7ff ffd4 	bl	800095c <abort_error_>
 80009b4:	2000      	movs	r0, #0
 80009b6:	2104      	movs	r1, #4
 80009b8:	f000 fe50 	bl	800165c <event_timer_set_period>
 80009bc:	2000      	movs	r0, #0
 80009be:	f000 fe63 	bl	8001688 <event_timer_wait>
 80009c2:	f7ff ff7f 	bl	80008c4 <rgb_sensor_read>
 80009c6:	e7f9      	b.n	80009bc <rgb_sensor_thread+0x18>

080009c8 <i2c_sensor_thread>:
 80009c8:	b508      	push	{r3, lr}
 80009ca:	f7ff fec9 	bl	8000760 <lsm9ds0_init>
 80009ce:	4601      	mov	r1, r0
 80009d0:	b110      	cbz	r0, 80009d8 <i2c_sensor_thread+0x10>
 80009d2:	2002      	movs	r0, #2
 80009d4:	f7ff ffc2 	bl	800095c <abort_error_>
 80009d8:	2001      	movs	r0, #1
 80009da:	210a      	movs	r1, #10
 80009dc:	f000 fe3e 	bl	800165c <event_timer_set_period>
 80009e0:	2001      	movs	r0, #1
 80009e2:	f000 fe51 	bl	8001688 <event_timer_wait>
 80009e6:	f7ff fe3d 	bl	8000664 <lsm9ds0_read>
 80009ea:	e7f9      	b.n	80009e0 <i2c_sensor_thread+0x18>

080009ec <adc_sensor_thread>:
 80009ec:	b508      	push	{r3, lr}
 80009ee:	f7ff ff6b 	bl	80008c8 <adc_sensor_init>
 80009f2:	4601      	mov	r1, r0
 80009f4:	b110      	cbz	r0, 80009fc <adc_sensor_thread+0x10>
 80009f6:	2005      	movs	r0, #5
 80009f8:	f7ff ffb0 	bl	800095c <abort_error_>
 80009fc:	2002      	movs	r0, #2
 80009fe:	210a      	movs	r1, #10
 8000a00:	f000 fe2c 	bl	800165c <event_timer_set_period>
 8000a04:	2002      	movs	r0, #2
 8000a06:	f000 fe3f 	bl	8001688 <event_timer_wait>
 8000a0a:	f7ff ff65 	bl	80008d8 <adc_sensor_read>
 8000a0e:	e7f9      	b.n	8000a04 <adc_sensor_thread+0x18>

08000a10 <uart_write>:
 8000a10:	4b03      	ldr	r3, [pc, #12]	; (8000a20 <uart_write+0x10>)
 8000a12:	69da      	ldr	r2, [r3, #28]
 8000a14:	0612      	lsls	r2, r2, #24
 8000a16:	d401      	bmi.n	8000a1c <uart_write+0xc>
 8000a18:	bf00      	nop
 8000a1a:	e7f9      	b.n	8000a10 <uart_write>
 8000a1c:	8518      	strh	r0, [r3, #40]	; 0x28
 8000a1e:	4770      	bx	lr
 8000a20:	40013800 	.word	0x40013800

08000a24 <uart_init>:
 8000a24:	b530      	push	{r4, r5, lr}
 8000a26:	4b2c      	ldr	r3, [pc, #176]	; (8000ad8 <uart_init+0xb4>)
 8000a28:	4d2c      	ldr	r5, [pc, #176]	; (8000adc <uart_init+0xb8>)
 8000a2a:	2400      	movs	r4, #0
 8000a2c:	601c      	str	r4, [r3, #0]
 8000a2e:	4b2c      	ldr	r3, [pc, #176]	; (8000ae0 <uart_init+0xbc>)
 8000a30:	b08b      	sub	sp, #44	; 0x2c
 8000a32:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8000a36:	2101      	movs	r1, #1
 8000a38:	601c      	str	r4, [r3, #0]
 8000a3a:	f000 fceb 	bl	8001414 <RCC_AHBPeriphClockCmd>
 8000a3e:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8000a42:	2101      	movs	r1, #1
 8000a44:	f000 fcf4 	bl	8001430 <RCC_APB2PeriphClockCmd>
 8000a48:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8000a4c:	9302      	str	r3, [sp, #8]
 8000a4e:	2302      	movs	r3, #2
 8000a50:	f88d 300c 	strb.w	r3, [sp, #12]
 8000a54:	a902      	add	r1, sp, #8
 8000a56:	2303      	movs	r3, #3
 8000a58:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000a5c:	f88d 300d 	strb.w	r3, [sp, #13]
 8000a60:	f88d 400e 	strb.w	r4, [sp, #14]
 8000a64:	f88d 400f 	strb.w	r4, [sp, #15]
 8000a68:	f000 fe20 	bl	80016ac <GPIO_Init>
 8000a6c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000a70:	2109      	movs	r1, #9
 8000a72:	2207      	movs	r2, #7
 8000a74:	f000 fe68 	bl	8001748 <GPIO_PinAFConfig>
 8000a78:	2207      	movs	r2, #7
 8000a7a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000a7e:	210a      	movs	r1, #10
 8000a80:	f000 fe62 	bl	8001748 <GPIO_PinAFConfig>
 8000a84:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8000a88:	9304      	str	r3, [sp, #16]
 8000a8a:	4628      	mov	r0, r5
 8000a8c:	230c      	movs	r3, #12
 8000a8e:	a904      	add	r1, sp, #16
 8000a90:	9308      	str	r3, [sp, #32]
 8000a92:	9405      	str	r4, [sp, #20]
 8000a94:	9406      	str	r4, [sp, #24]
 8000a96:	9407      	str	r4, [sp, #28]
 8000a98:	9409      	str	r4, [sp, #36]	; 0x24
 8000a9a:	f000 f849 	bl	8000b30 <USART_Init>
 8000a9e:	4628      	mov	r0, r5
 8000aa0:	2101      	movs	r1, #1
 8000aa2:	f000 f8a7 	bl	8000bf4 <USART_Cmd>
 8000aa6:	2201      	movs	r2, #1
 8000aa8:	4628      	mov	r0, r5
 8000aaa:	490e      	ldr	r1, [pc, #56]	; (8000ae4 <uart_init+0xc0>)
 8000aac:	f000 f8b2 	bl	8000c14 <USART_ITConfig>
 8000ab0:	2325      	movs	r3, #37	; 0x25
 8000ab2:	f88d 4005 	strb.w	r4, [sp, #5]
 8000ab6:	f88d 4006 	strb.w	r4, [sp, #6]
 8000aba:	a801      	add	r0, sp, #4
 8000abc:	2401      	movs	r4, #1
 8000abe:	f88d 3004 	strb.w	r3, [sp, #4]
 8000ac2:	f88d 4007 	strb.w	r4, [sp, #7]
 8000ac6:	f000 f8f3 	bl	8000cb0 <NVIC_Init>
 8000aca:	4628      	mov	r0, r5
 8000acc:	4621      	mov	r1, r4
 8000ace:	f000 f891 	bl	8000bf4 <USART_Cmd>
 8000ad2:	b00b      	add	sp, #44	; 0x2c
 8000ad4:	bd30      	pop	{r4, r5, pc}
 8000ad6:	bf00      	nop
 8000ad8:	2000099c 	.word	0x2000099c
 8000adc:	40013800 	.word	0x40013800
 8000ae0:	200009a0 	.word	0x200009a0
 8000ae4:	00050105 	.word	0x00050105

08000ae8 <USART1_IRQHandler>:
 8000ae8:	b508      	push	{r3, lr}
 8000aea:	480d      	ldr	r0, [pc, #52]	; (8000b20 <USART1_IRQHandler+0x38>)
 8000aec:	490d      	ldr	r1, [pc, #52]	; (8000b24 <USART1_IRQHandler+0x3c>)
 8000aee:	f000 f8aa 	bl	8000c46 <USART_GetITStatus>
 8000af2:	b178      	cbz	r0, 8000b14 <USART1_IRQHandler+0x2c>
 8000af4:	480a      	ldr	r0, [pc, #40]	; (8000b20 <USART1_IRQHandler+0x38>)
 8000af6:	f000 f888 	bl	8000c0a <USART_ReceiveData>
 8000afa:	4b0b      	ldr	r3, [pc, #44]	; (8000b28 <USART1_IRQHandler+0x40>)
 8000afc:	490b      	ldr	r1, [pc, #44]	; (8000b2c <USART1_IRQHandler+0x44>)
 8000afe:	681a      	ldr	r2, [r3, #0]
 8000b00:	b2c0      	uxtb	r0, r0
 8000b02:	5488      	strb	r0, [r1, r2]
 8000b04:	681a      	ldr	r2, [r3, #0]
 8000b06:	3201      	adds	r2, #1
 8000b08:	601a      	str	r2, [r3, #0]
 8000b0a:	681a      	ldr	r2, [r3, #0]
 8000b0c:	2a0f      	cmp	r2, #15
 8000b0e:	bf84      	itt	hi
 8000b10:	2200      	movhi	r2, #0
 8000b12:	601a      	strhi	r2, [r3, #0]
 8000b14:	4802      	ldr	r0, [pc, #8]	; (8000b20 <USART1_IRQHandler+0x38>)
 8000b16:	4903      	ldr	r1, [pc, #12]	; (8000b24 <USART1_IRQHandler+0x3c>)
 8000b18:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000b1c:	f000 b8b2 	b.w	8000c84 <USART_ClearITPendingBit>
 8000b20:	40013800 	.word	0x40013800
 8000b24:	00050105 	.word	0x00050105
 8000b28:	2000099c 	.word	0x2000099c
 8000b2c:	2000098c 	.word	0x2000098c

08000b30 <USART_Init>:
 8000b30:	b530      	push	{r4, r5, lr}
 8000b32:	4604      	mov	r4, r0
 8000b34:	b099      	sub	sp, #100	; 0x64
 8000b36:	460d      	mov	r5, r1
 8000b38:	bf00      	nop
 8000b3a:	bf00      	nop
 8000b3c:	bf00      	nop
 8000b3e:	bf00      	nop
 8000b40:	bf00      	nop
 8000b42:	bf00      	nop
 8000b44:	bf00      	nop
 8000b46:	6803      	ldr	r3, [r0, #0]
 8000b48:	f023 0301 	bic.w	r3, r3, #1
 8000b4c:	6003      	str	r3, [r0, #0]
 8000b4e:	6842      	ldr	r2, [r0, #4]
 8000b50:	688b      	ldr	r3, [r1, #8]
 8000b52:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 8000b56:	4313      	orrs	r3, r2
 8000b58:	6043      	str	r3, [r0, #4]
 8000b5a:	686a      	ldr	r2, [r5, #4]
 8000b5c:	68eb      	ldr	r3, [r5, #12]
 8000b5e:	6801      	ldr	r1, [r0, #0]
 8000b60:	431a      	orrs	r2, r3
 8000b62:	692b      	ldr	r3, [r5, #16]
 8000b64:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 8000b68:	f021 010c 	bic.w	r1, r1, #12
 8000b6c:	4313      	orrs	r3, r2
 8000b6e:	430b      	orrs	r3, r1
 8000b70:	6003      	str	r3, [r0, #0]
 8000b72:	6882      	ldr	r2, [r0, #8]
 8000b74:	696b      	ldr	r3, [r5, #20]
 8000b76:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 8000b7a:	4313      	orrs	r3, r2
 8000b7c:	6083      	str	r3, [r0, #8]
 8000b7e:	a801      	add	r0, sp, #4
 8000b80:	f000 fabc 	bl	80010fc <RCC_GetClocksFreq>
 8000b84:	4b17      	ldr	r3, [pc, #92]	; (8000be4 <USART_Init+0xb4>)
 8000b86:	429c      	cmp	r4, r3
 8000b88:	d101      	bne.n	8000b8e <USART_Init+0x5e>
 8000b8a:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 8000b8c:	e00e      	b.n	8000bac <USART_Init+0x7c>
 8000b8e:	4b16      	ldr	r3, [pc, #88]	; (8000be8 <USART_Init+0xb8>)
 8000b90:	429c      	cmp	r4, r3
 8000b92:	d101      	bne.n	8000b98 <USART_Init+0x68>
 8000b94:	9a10      	ldr	r2, [sp, #64]	; 0x40
 8000b96:	e009      	b.n	8000bac <USART_Init+0x7c>
 8000b98:	4b14      	ldr	r3, [pc, #80]	; (8000bec <USART_Init+0xbc>)
 8000b9a:	429c      	cmp	r4, r3
 8000b9c:	d101      	bne.n	8000ba2 <USART_Init+0x72>
 8000b9e:	9a11      	ldr	r2, [sp, #68]	; 0x44
 8000ba0:	e004      	b.n	8000bac <USART_Init+0x7c>
 8000ba2:	4b13      	ldr	r3, [pc, #76]	; (8000bf0 <USART_Init+0xc0>)
 8000ba4:	429c      	cmp	r4, r3
 8000ba6:	bf0c      	ite	eq
 8000ba8:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 8000baa:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 8000bac:	6823      	ldr	r3, [r4, #0]
 8000bae:	6829      	ldr	r1, [r5, #0]
 8000bb0:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 8000bb4:	bf18      	it	ne
 8000bb6:	0052      	lslne	r2, r2, #1
 8000bb8:	fbb2 f3f1 	udiv	r3, r2, r1
 8000bbc:	fb01 2213 	mls	r2, r1, r3, r2
 8000bc0:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 8000bc4:	6822      	ldr	r2, [r4, #0]
 8000bc6:	bf28      	it	cs
 8000bc8:	3301      	addcs	r3, #1
 8000bca:	0412      	lsls	r2, r2, #16
 8000bcc:	d506      	bpl.n	8000bdc <USART_Init+0xac>
 8000bce:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 8000bd2:	f3c3 0142 	ubfx	r1, r3, #1, #3
 8000bd6:	401a      	ands	r2, r3
 8000bd8:	ea41 0302 	orr.w	r3, r1, r2
 8000bdc:	b29b      	uxth	r3, r3
 8000bde:	81a3      	strh	r3, [r4, #12]
 8000be0:	b019      	add	sp, #100	; 0x64
 8000be2:	bd30      	pop	{r4, r5, pc}
 8000be4:	40013800 	.word	0x40013800
 8000be8:	40004400 	.word	0x40004400
 8000bec:	40004800 	.word	0x40004800
 8000bf0:	40004c00 	.word	0x40004c00

08000bf4 <USART_Cmd>:
 8000bf4:	bf00      	nop
 8000bf6:	bf00      	nop
 8000bf8:	6803      	ldr	r3, [r0, #0]
 8000bfa:	b111      	cbz	r1, 8000c02 <USART_Cmd+0xe>
 8000bfc:	f043 0301 	orr.w	r3, r3, #1
 8000c00:	e001      	b.n	8000c06 <USART_Cmd+0x12>
 8000c02:	f023 0301 	bic.w	r3, r3, #1
 8000c06:	6003      	str	r3, [r0, #0]
 8000c08:	4770      	bx	lr

08000c0a <USART_ReceiveData>:
 8000c0a:	bf00      	nop
 8000c0c:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8000c0e:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8000c12:	4770      	bx	lr

08000c14 <USART_ITConfig>:
 8000c14:	b510      	push	{r4, lr}
 8000c16:	bf00      	nop
 8000c18:	bf00      	nop
 8000c1a:	bf00      	nop
 8000c1c:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8000c20:	2401      	movs	r4, #1
 8000c22:	b2c9      	uxtb	r1, r1
 8000c24:	2b02      	cmp	r3, #2
 8000c26:	fa04 f101 	lsl.w	r1, r4, r1
 8000c2a:	d101      	bne.n	8000c30 <USART_ITConfig+0x1c>
 8000c2c:	3004      	adds	r0, #4
 8000c2e:	e002      	b.n	8000c36 <USART_ITConfig+0x22>
 8000c30:	2b03      	cmp	r3, #3
 8000c32:	bf08      	it	eq
 8000c34:	3008      	addeq	r0, #8
 8000c36:	6803      	ldr	r3, [r0, #0]
 8000c38:	b10a      	cbz	r2, 8000c3e <USART_ITConfig+0x2a>
 8000c3a:	4319      	orrs	r1, r3
 8000c3c:	e001      	b.n	8000c42 <USART_ITConfig+0x2e>
 8000c3e:	ea23 0101 	bic.w	r1, r3, r1
 8000c42:	6001      	str	r1, [r0, #0]
 8000c44:	bd10      	pop	{r4, pc}

08000c46 <USART_GetITStatus>:
 8000c46:	b510      	push	{r4, lr}
 8000c48:	bf00      	nop
 8000c4a:	bf00      	nop
 8000c4c:	2401      	movs	r4, #1
 8000c4e:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8000c52:	b2cb      	uxtb	r3, r1
 8000c54:	42a2      	cmp	r2, r4
 8000c56:	fa04 f303 	lsl.w	r3, r4, r3
 8000c5a:	d101      	bne.n	8000c60 <USART_GetITStatus+0x1a>
 8000c5c:	6802      	ldr	r2, [r0, #0]
 8000c5e:	e003      	b.n	8000c68 <USART_GetITStatus+0x22>
 8000c60:	2a02      	cmp	r2, #2
 8000c62:	bf0c      	ite	eq
 8000c64:	6842      	ldreq	r2, [r0, #4]
 8000c66:	6882      	ldrne	r2, [r0, #8]
 8000c68:	4013      	ands	r3, r2
 8000c6a:	69c2      	ldr	r2, [r0, #28]
 8000c6c:	b143      	cbz	r3, 8000c80 <USART_GetITStatus+0x3a>
 8000c6e:	2301      	movs	r3, #1
 8000c70:	0c09      	lsrs	r1, r1, #16
 8000c72:	fa03 f101 	lsl.w	r1, r3, r1
 8000c76:	4211      	tst	r1, r2
 8000c78:	bf0c      	ite	eq
 8000c7a:	2000      	moveq	r0, #0
 8000c7c:	2001      	movne	r0, #1
 8000c7e:	bd10      	pop	{r4, pc}
 8000c80:	4618      	mov	r0, r3
 8000c82:	bd10      	pop	{r4, pc}

08000c84 <USART_ClearITPendingBit>:
 8000c84:	bf00      	nop
 8000c86:	bf00      	nop
 8000c88:	2301      	movs	r3, #1
 8000c8a:	0c09      	lsrs	r1, r1, #16
 8000c8c:	fa03 f101 	lsl.w	r1, r3, r1
 8000c90:	6201      	str	r1, [r0, #32]
 8000c92:	4770      	bx	lr

08000c94 <lib_low_level_init>:
 8000c94:	b508      	push	{r3, lr}
 8000c96:	f000 f9ad 	bl	8000ff4 <sytem_clock_init>
 8000c9a:	f000 fd6b 	bl	8001774 <gpio_init>
 8000c9e:	f7ff fec1 	bl	8000a24 <uart_init>
 8000ca2:	f000 fc45 	bl	8001530 <timer_init>
 8000ca6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000caa:	f000 b893 	b.w	8000dd4 <i2c_0_init>
	...

08000cb0 <NVIC_Init>:
 8000cb0:	b510      	push	{r4, lr}
 8000cb2:	bf00      	nop
 8000cb4:	bf00      	nop
 8000cb6:	bf00      	nop
 8000cb8:	78c2      	ldrb	r2, [r0, #3]
 8000cba:	7803      	ldrb	r3, [r0, #0]
 8000cbc:	b30a      	cbz	r2, 8000d02 <NVIC_Init+0x52>
 8000cbe:	4a16      	ldr	r2, [pc, #88]	; (8000d18 <NVIC_Init+0x68>)
 8000cc0:	7844      	ldrb	r4, [r0, #1]
 8000cc2:	68d2      	ldr	r2, [r2, #12]
 8000cc4:	43d2      	mvns	r2, r2
 8000cc6:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8000cca:	f1c2 0104 	rsb	r1, r2, #4
 8000cce:	b2c9      	uxtb	r1, r1
 8000cd0:	fa04 f101 	lsl.w	r1, r4, r1
 8000cd4:	240f      	movs	r4, #15
 8000cd6:	fa44 f202 	asr.w	r2, r4, r2
 8000cda:	7884      	ldrb	r4, [r0, #2]
 8000cdc:	b2c9      	uxtb	r1, r1
 8000cde:	4022      	ands	r2, r4
 8000ce0:	430a      	orrs	r2, r1
 8000ce2:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8000ce6:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8000cea:	0112      	lsls	r2, r2, #4
 8000cec:	b2d2      	uxtb	r2, r2
 8000cee:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8000cf2:	7803      	ldrb	r3, [r0, #0]
 8000cf4:	2201      	movs	r2, #1
 8000cf6:	0959      	lsrs	r1, r3, #5
 8000cf8:	f003 031f 	and.w	r3, r3, #31
 8000cfc:	fa02 f303 	lsl.w	r3, r2, r3
 8000d00:	e006      	b.n	8000d10 <NVIC_Init+0x60>
 8000d02:	0959      	lsrs	r1, r3, #5
 8000d04:	2201      	movs	r2, #1
 8000d06:	f003 031f 	and.w	r3, r3, #31
 8000d0a:	fa02 f303 	lsl.w	r3, r2, r3
 8000d0e:	3120      	adds	r1, #32
 8000d10:	4a02      	ldr	r2, [pc, #8]	; (8000d1c <NVIC_Init+0x6c>)
 8000d12:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8000d16:	bd10      	pop	{r4, pc}
 8000d18:	e000ed00 	.word	0xe000ed00
 8000d1c:	e000e100 	.word	0xe000e100

08000d20 <i2c_delay>:
 8000d20:	230b      	movs	r3, #11
 8000d22:	3b01      	subs	r3, #1
 8000d24:	d001      	beq.n	8000d2a <i2c_delay+0xa>
 8000d26:	bf00      	nop
 8000d28:	e7fb      	b.n	8000d22 <i2c_delay+0x2>
 8000d2a:	4770      	bx	lr

08000d2c <SetLowSDA>:
 8000d2c:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000d2e:	4d0d      	ldr	r5, [pc, #52]	; (8000d64 <SetLowSDA+0x38>)
 8000d30:	2301      	movs	r3, #1
 8000d32:	2203      	movs	r2, #3
 8000d34:	2480      	movs	r4, #128	; 0x80
 8000d36:	f88d 3004 	strb.w	r3, [sp, #4]
 8000d3a:	f88d 3006 	strb.w	r3, [sp, #6]
 8000d3e:	4628      	mov	r0, r5
 8000d40:	2300      	movs	r3, #0
 8000d42:	4669      	mov	r1, sp
 8000d44:	f88d 2005 	strb.w	r2, [sp, #5]
 8000d48:	f88d 3007 	strb.w	r3, [sp, #7]
 8000d4c:	9400      	str	r4, [sp, #0]
 8000d4e:	f000 fcad 	bl	80016ac <GPIO_Init>
 8000d52:	4628      	mov	r0, r5
 8000d54:	4621      	mov	r1, r4
 8000d56:	f000 fcf3 	bl	8001740 <GPIO_ResetBits>
 8000d5a:	f7ff ffe1 	bl	8000d20 <i2c_delay>
 8000d5e:	b003      	add	sp, #12
 8000d60:	bd30      	pop	{r4, r5, pc}
 8000d62:	bf00      	nop
 8000d64:	48000400 	.word	0x48000400

08000d68 <SetHighSDA>:
 8000d68:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000d6a:	4d0d      	ldr	r5, [pc, #52]	; (8000da0 <SetHighSDA+0x38>)
 8000d6c:	2203      	movs	r2, #3
 8000d6e:	2300      	movs	r3, #0
 8000d70:	2480      	movs	r4, #128	; 0x80
 8000d72:	f88d 2005 	strb.w	r2, [sp, #5]
 8000d76:	4628      	mov	r0, r5
 8000d78:	2201      	movs	r2, #1
 8000d7a:	4669      	mov	r1, sp
 8000d7c:	f88d 3004 	strb.w	r3, [sp, #4]
 8000d80:	f88d 2006 	strb.w	r2, [sp, #6]
 8000d84:	f88d 3007 	strb.w	r3, [sp, #7]
 8000d88:	9400      	str	r4, [sp, #0]
 8000d8a:	f000 fc8f 	bl	80016ac <GPIO_Init>
 8000d8e:	4628      	mov	r0, r5
 8000d90:	4621      	mov	r1, r4
 8000d92:	f000 fcd1 	bl	8001738 <GPIO_SetBits>
 8000d96:	f7ff ffc3 	bl	8000d20 <i2c_delay>
 8000d9a:	b003      	add	sp, #12
 8000d9c:	bd30      	pop	{r4, r5, pc}
 8000d9e:	bf00      	nop
 8000da0:	48000400 	.word	0x48000400

08000da4 <SetLowSCL>:
 8000da4:	b508      	push	{r3, lr}
 8000da6:	4804      	ldr	r0, [pc, #16]	; (8000db8 <SetLowSCL+0x14>)
 8000da8:	2140      	movs	r1, #64	; 0x40
 8000daa:	f000 fcc9 	bl	8001740 <GPIO_ResetBits>
 8000dae:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000db2:	f7ff bfb5 	b.w	8000d20 <i2c_delay>
 8000db6:	bf00      	nop
 8000db8:	48000400 	.word	0x48000400

08000dbc <SetHighSCL>:
 8000dbc:	b508      	push	{r3, lr}
 8000dbe:	4804      	ldr	r0, [pc, #16]	; (8000dd0 <SetHighSCL+0x14>)
 8000dc0:	2140      	movs	r1, #64	; 0x40
 8000dc2:	f000 fcb9 	bl	8001738 <GPIO_SetBits>
 8000dc6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000dca:	f7ff bfa9 	b.w	8000d20 <i2c_delay>
 8000dce:	bf00      	nop
 8000dd0:	48000400 	.word	0x48000400

08000dd4 <i2c_0_init>:
 8000dd4:	b507      	push	{r0, r1, r2, lr}
 8000dd6:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8000dda:	2101      	movs	r1, #1
 8000ddc:	f000 fb1a 	bl	8001414 <RCC_AHBPeriphClockCmd>
 8000de0:	23c0      	movs	r3, #192	; 0xc0
 8000de2:	9300      	str	r3, [sp, #0]
 8000de4:	2301      	movs	r3, #1
 8000de6:	2203      	movs	r2, #3
 8000de8:	480a      	ldr	r0, [pc, #40]	; (8000e14 <i2c_0_init+0x40>)
 8000dea:	f88d 3004 	strb.w	r3, [sp, #4]
 8000dee:	4669      	mov	r1, sp
 8000df0:	f88d 3006 	strb.w	r3, [sp, #6]
 8000df4:	2300      	movs	r3, #0
 8000df6:	f88d 2005 	strb.w	r2, [sp, #5]
 8000dfa:	f88d 3007 	strb.w	r3, [sp, #7]
 8000dfe:	f000 fc55 	bl	80016ac <GPIO_Init>
 8000e02:	f7ff ffdb 	bl	8000dbc <SetHighSCL>
 8000e06:	f7ff ff91 	bl	8000d2c <SetLowSDA>
 8000e0a:	f7ff ffad 	bl	8000d68 <SetHighSDA>
 8000e0e:	b003      	add	sp, #12
 8000e10:	f85d fb04 	ldr.w	pc, [sp], #4
 8000e14:	48000400 	.word	0x48000400

08000e18 <i2cStart>:
 8000e18:	b508      	push	{r3, lr}
 8000e1a:	f7ff ffcf 	bl	8000dbc <SetHighSCL>
 8000e1e:	f7ff ffa3 	bl	8000d68 <SetHighSDA>
 8000e22:	f7ff ffcb 	bl	8000dbc <SetHighSCL>
 8000e26:	f7ff ff81 	bl	8000d2c <SetLowSDA>
 8000e2a:	f7ff ffbb 	bl	8000da4 <SetLowSCL>
 8000e2e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000e32:	f7ff bf99 	b.w	8000d68 <SetHighSDA>

08000e36 <i2cStop>:
 8000e36:	b508      	push	{r3, lr}
 8000e38:	f7ff ffb4 	bl	8000da4 <SetLowSCL>
 8000e3c:	f7ff ff76 	bl	8000d2c <SetLowSDA>
 8000e40:	f7ff ffbc 	bl	8000dbc <SetHighSCL>
 8000e44:	f7ff ff72 	bl	8000d2c <SetLowSDA>
 8000e48:	f7ff ffb8 	bl	8000dbc <SetHighSCL>
 8000e4c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000e50:	f7ff bf8a 	b.w	8000d68 <SetHighSDA>

08000e54 <i2cWrite>:
 8000e54:	b538      	push	{r3, r4, r5, lr}
 8000e56:	4604      	mov	r4, r0
 8000e58:	2508      	movs	r5, #8
 8000e5a:	f7ff ffa3 	bl	8000da4 <SetLowSCL>
 8000e5e:	0623      	lsls	r3, r4, #24
 8000e60:	d502      	bpl.n	8000e68 <i2cWrite+0x14>
 8000e62:	f7ff ff81 	bl	8000d68 <SetHighSDA>
 8000e66:	e001      	b.n	8000e6c <i2cWrite+0x18>
 8000e68:	f7ff ff60 	bl	8000d2c <SetLowSDA>
 8000e6c:	3d01      	subs	r5, #1
 8000e6e:	f7ff ffa5 	bl	8000dbc <SetHighSCL>
 8000e72:	0064      	lsls	r4, r4, #1
 8000e74:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8000e78:	b2e4      	uxtb	r4, r4
 8000e7a:	d1ee      	bne.n	8000e5a <i2cWrite+0x6>
 8000e7c:	f7ff ff92 	bl	8000da4 <SetLowSCL>
 8000e80:	f7ff ff72 	bl	8000d68 <SetHighSDA>
 8000e84:	f7ff ff9a 	bl	8000dbc <SetHighSCL>
 8000e88:	4b05      	ldr	r3, [pc, #20]	; (8000ea0 <i2cWrite+0x4c>)
 8000e8a:	8a1c      	ldrh	r4, [r3, #16]
 8000e8c:	b2a4      	uxth	r4, r4
 8000e8e:	f7ff ff89 	bl	8000da4 <SetLowSCL>
 8000e92:	f7ff ff45 	bl	8000d20 <i2c_delay>
 8000e96:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 8000e9a:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 8000e9e:	bd38      	pop	{r3, r4, r5, pc}
 8000ea0:	48000400 	.word	0x48000400

08000ea4 <i2cRead>:
 8000ea4:	b570      	push	{r4, r5, r6, lr}
 8000ea6:	4606      	mov	r6, r0
 8000ea8:	f7ff ff7c 	bl	8000da4 <SetLowSCL>
 8000eac:	f7ff ff5c 	bl	8000d68 <SetHighSDA>
 8000eb0:	2508      	movs	r5, #8
 8000eb2:	2400      	movs	r4, #0
 8000eb4:	f7ff ff82 	bl	8000dbc <SetHighSCL>
 8000eb8:	4b0d      	ldr	r3, [pc, #52]	; (8000ef0 <i2cRead+0x4c>)
 8000eba:	8a1b      	ldrh	r3, [r3, #16]
 8000ebc:	0064      	lsls	r4, r4, #1
 8000ebe:	061a      	lsls	r2, r3, #24
 8000ec0:	b2e4      	uxtb	r4, r4
 8000ec2:	bf48      	it	mi
 8000ec4:	3401      	addmi	r4, #1
 8000ec6:	f105 35ff 	add.w	r5, r5, #4294967295
 8000eca:	bf48      	it	mi
 8000ecc:	b2e4      	uxtbmi	r4, r4
 8000ece:	f7ff ff69 	bl	8000da4 <SetLowSCL>
 8000ed2:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8000ed6:	d1ed      	bne.n	8000eb4 <i2cRead+0x10>
 8000ed8:	b10e      	cbz	r6, 8000ede <i2cRead+0x3a>
 8000eda:	f7ff ff27 	bl	8000d2c <SetLowSDA>
 8000ede:	f7ff ff6d 	bl	8000dbc <SetHighSCL>
 8000ee2:	f7ff ff5f 	bl	8000da4 <SetLowSCL>
 8000ee6:	f7ff ff1b 	bl	8000d20 <i2c_delay>
 8000eea:	4620      	mov	r0, r4
 8000eec:	bd70      	pop	{r4, r5, r6, pc}
 8000eee:	bf00      	nop
 8000ef0:	48000400 	.word	0x48000400

08000ef4 <i2c_write_reg>:
 8000ef4:	b570      	push	{r4, r5, r6, lr}
 8000ef6:	4605      	mov	r5, r0
 8000ef8:	460c      	mov	r4, r1
 8000efa:	4616      	mov	r6, r2
 8000efc:	f7ff ff8c 	bl	8000e18 <i2cStart>
 8000f00:	4628      	mov	r0, r5
 8000f02:	f7ff ffa7 	bl	8000e54 <i2cWrite>
 8000f06:	4620      	mov	r0, r4
 8000f08:	f7ff ffa4 	bl	8000e54 <i2cWrite>
 8000f0c:	4630      	mov	r0, r6
 8000f0e:	f7ff ffa1 	bl	8000e54 <i2cWrite>
 8000f12:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000f16:	f7ff bf8e 	b.w	8000e36 <i2cStop>

08000f1a <i2c_read_reg>:
 8000f1a:	b538      	push	{r3, r4, r5, lr}
 8000f1c:	4604      	mov	r4, r0
 8000f1e:	460d      	mov	r5, r1
 8000f20:	f7ff ff7a 	bl	8000e18 <i2cStart>
 8000f24:	4620      	mov	r0, r4
 8000f26:	f7ff ff95 	bl	8000e54 <i2cWrite>
 8000f2a:	4628      	mov	r0, r5
 8000f2c:	f7ff ff92 	bl	8000e54 <i2cWrite>
 8000f30:	f7ff ff72 	bl	8000e18 <i2cStart>
 8000f34:	f044 0001 	orr.w	r0, r4, #1
 8000f38:	f7ff ff8c 	bl	8000e54 <i2cWrite>
 8000f3c:	2000      	movs	r0, #0
 8000f3e:	f7ff ffb1 	bl	8000ea4 <i2cRead>
 8000f42:	4604      	mov	r4, r0
 8000f44:	f7ff ff77 	bl	8000e36 <i2cStop>
 8000f48:	4620      	mov	r0, r4
 8000f4a:	bd38      	pop	{r3, r4, r5, pc}

08000f4c <Default_Handler>:
 8000f4c:	4668      	mov	r0, sp
 8000f4e:	f020 0107 	bic.w	r1, r0, #7
 8000f52:	468d      	mov	sp, r1
 8000f54:	bf00      	nop
 8000f56:	e7fd      	b.n	8000f54 <Default_Handler+0x8>

08000f58 <HardFault_Handler>:
 8000f58:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000f5c:	f000 fc54 	bl	8001808 <led_on>
 8000f60:	4b06      	ldr	r3, [pc, #24]	; (8000f7c <HardFault_Handler+0x24>)
 8000f62:	3b01      	subs	r3, #1
 8000f64:	d001      	beq.n	8000f6a <HardFault_Handler+0x12>
 8000f66:	bf00      	nop
 8000f68:	e7fb      	b.n	8000f62 <HardFault_Handler+0xa>
 8000f6a:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000f6e:	f000 fc59 	bl	8001824 <led_off>
 8000f72:	4b02      	ldr	r3, [pc, #8]	; (8000f7c <HardFault_Handler+0x24>)
 8000f74:	3b01      	subs	r3, #1
 8000f76:	d0ef      	beq.n	8000f58 <HardFault_Handler>
 8000f78:	bf00      	nop
 8000f7a:	e7fb      	b.n	8000f74 <HardFault_Handler+0x1c>
 8000f7c:	00989681 	.word	0x00989681

08000f80 <_reset_init>:
 8000f80:	4a0e      	ldr	r2, [pc, #56]	; (8000fbc <_reset_init+0x3c>)
 8000f82:	480f      	ldr	r0, [pc, #60]	; (8000fc0 <_reset_init+0x40>)
 8000f84:	1a80      	subs	r0, r0, r2
 8000f86:	1080      	asrs	r0, r0, #2
 8000f88:	2300      	movs	r3, #0
 8000f8a:	4283      	cmp	r3, r0
 8000f8c:	d006      	beq.n	8000f9c <_reset_init+0x1c>
 8000f8e:	490d      	ldr	r1, [pc, #52]	; (8000fc4 <_reset_init+0x44>)
 8000f90:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8000f94:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8000f98:	3301      	adds	r3, #1
 8000f9a:	e7f6      	b.n	8000f8a <_reset_init+0xa>
 8000f9c:	4b0a      	ldr	r3, [pc, #40]	; (8000fc8 <_reset_init+0x48>)
 8000f9e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000fa2:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000fa6:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000faa:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8000fae:	685a      	ldr	r2, [r3, #4]
 8000fb0:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8000fb4:	605a      	str	r2, [r3, #4]
 8000fb6:	f7ff b8e7 	b.w	8000188 <main>
 8000fba:	bf00      	nop
 8000fbc:	20000000 	.word	0x20000000
 8000fc0:	20000030 	.word	0x20000030
 8000fc4:	080018e4 	.word	0x080018e4
 8000fc8:	e000ed00 	.word	0xe000ed00

08000fcc <sys_tick_init>:
 8000fcc:	4b05      	ldr	r3, [pc, #20]	; (8000fe4 <sys_tick_init+0x18>)
 8000fce:	4a06      	ldr	r2, [pc, #24]	; (8000fe8 <sys_tick_init+0x1c>)
 8000fd0:	605a      	str	r2, [r3, #4]
 8000fd2:	4a06      	ldr	r2, [pc, #24]	; (8000fec <sys_tick_init+0x20>)
 8000fd4:	21f0      	movs	r1, #240	; 0xf0
 8000fd6:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8000fda:	2200      	movs	r2, #0
 8000fdc:	609a      	str	r2, [r3, #8]
 8000fde:	2207      	movs	r2, #7
 8000fe0:	601a      	str	r2, [r3, #0]
 8000fe2:	4770      	bx	lr
 8000fe4:	e000e010 	.word	0xe000e010
 8000fe8:	00029040 	.word	0x00029040
 8000fec:	e000ed00 	.word	0xe000ed00

08000ff0 <sleep>:
 8000ff0:	bf30      	wfi
 8000ff2:	4770      	bx	lr

08000ff4 <sytem_clock_init>:
 8000ff4:	f000 b800 	b.w	8000ff8 <SystemInit>

08000ff8 <SystemInit>:
 8000ff8:	4b3b      	ldr	r3, [pc, #236]	; (80010e8 <SystemInit+0xf0>)
 8000ffa:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000ffe:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001002:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001006:	4b39      	ldr	r3, [pc, #228]	; (80010ec <SystemInit+0xf4>)
 8001008:	681a      	ldr	r2, [r3, #0]
 800100a:	f042 0201 	orr.w	r2, r2, #1
 800100e:	601a      	str	r2, [r3, #0]
 8001010:	6859      	ldr	r1, [r3, #4]
 8001012:	4a37      	ldr	r2, [pc, #220]	; (80010f0 <SystemInit+0xf8>)
 8001014:	400a      	ands	r2, r1
 8001016:	605a      	str	r2, [r3, #4]
 8001018:	681a      	ldr	r2, [r3, #0]
 800101a:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 800101e:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8001022:	601a      	str	r2, [r3, #0]
 8001024:	681a      	ldr	r2, [r3, #0]
 8001026:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 800102a:	601a      	str	r2, [r3, #0]
 800102c:	685a      	ldr	r2, [r3, #4]
 800102e:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8001032:	605a      	str	r2, [r3, #4]
 8001034:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001036:	f022 020f 	bic.w	r2, r2, #15
 800103a:	62da      	str	r2, [r3, #44]	; 0x2c
 800103c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800103e:	4a2d      	ldr	r2, [pc, #180]	; (80010f4 <SystemInit+0xfc>)
 8001040:	b082      	sub	sp, #8
 8001042:	400a      	ands	r2, r1
 8001044:	631a      	str	r2, [r3, #48]	; 0x30
 8001046:	2200      	movs	r2, #0
 8001048:	609a      	str	r2, [r3, #8]
 800104a:	9200      	str	r2, [sp, #0]
 800104c:	9201      	str	r2, [sp, #4]
 800104e:	681a      	ldr	r2, [r3, #0]
 8001050:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001054:	601a      	str	r2, [r3, #0]
 8001056:	4b25      	ldr	r3, [pc, #148]	; (80010ec <SystemInit+0xf4>)
 8001058:	681a      	ldr	r2, [r3, #0]
 800105a:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 800105e:	9201      	str	r2, [sp, #4]
 8001060:	9a00      	ldr	r2, [sp, #0]
 8001062:	3201      	adds	r2, #1
 8001064:	9200      	str	r2, [sp, #0]
 8001066:	9a01      	ldr	r2, [sp, #4]
 8001068:	b91a      	cbnz	r2, 8001072 <SystemInit+0x7a>
 800106a:	9a00      	ldr	r2, [sp, #0]
 800106c:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8001070:	d1f1      	bne.n	8001056 <SystemInit+0x5e>
 8001072:	681b      	ldr	r3, [r3, #0]
 8001074:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8001078:	bf18      	it	ne
 800107a:	2301      	movne	r3, #1
 800107c:	9301      	str	r3, [sp, #4]
 800107e:	9b01      	ldr	r3, [sp, #4]
 8001080:	2b01      	cmp	r3, #1
 8001082:	d005      	beq.n	8001090 <SystemInit+0x98>
 8001084:	4b18      	ldr	r3, [pc, #96]	; (80010e8 <SystemInit+0xf0>)
 8001086:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 800108a:	609a      	str	r2, [r3, #8]
 800108c:	b002      	add	sp, #8
 800108e:	4770      	bx	lr
 8001090:	4b19      	ldr	r3, [pc, #100]	; (80010f8 <SystemInit+0x100>)
 8001092:	2212      	movs	r2, #18
 8001094:	601a      	str	r2, [r3, #0]
 8001096:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 800109a:	685a      	ldr	r2, [r3, #4]
 800109c:	605a      	str	r2, [r3, #4]
 800109e:	685a      	ldr	r2, [r3, #4]
 80010a0:	605a      	str	r2, [r3, #4]
 80010a2:	685a      	ldr	r2, [r3, #4]
 80010a4:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 80010a8:	605a      	str	r2, [r3, #4]
 80010aa:	685a      	ldr	r2, [r3, #4]
 80010ac:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 80010b0:	605a      	str	r2, [r3, #4]
 80010b2:	685a      	ldr	r2, [r3, #4]
 80010b4:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 80010b8:	605a      	str	r2, [r3, #4]
 80010ba:	681a      	ldr	r2, [r3, #0]
 80010bc:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 80010c0:	601a      	str	r2, [r3, #0]
 80010c2:	6819      	ldr	r1, [r3, #0]
 80010c4:	4a09      	ldr	r2, [pc, #36]	; (80010ec <SystemInit+0xf4>)
 80010c6:	0189      	lsls	r1, r1, #6
 80010c8:	d5fb      	bpl.n	80010c2 <SystemInit+0xca>
 80010ca:	6853      	ldr	r3, [r2, #4]
 80010cc:	f023 0303 	bic.w	r3, r3, #3
 80010d0:	6053      	str	r3, [r2, #4]
 80010d2:	6853      	ldr	r3, [r2, #4]
 80010d4:	f043 0302 	orr.w	r3, r3, #2
 80010d8:	6053      	str	r3, [r2, #4]
 80010da:	4b04      	ldr	r3, [pc, #16]	; (80010ec <SystemInit+0xf4>)
 80010dc:	685b      	ldr	r3, [r3, #4]
 80010de:	f003 030c 	and.w	r3, r3, #12
 80010e2:	2b08      	cmp	r3, #8
 80010e4:	d1f9      	bne.n	80010da <SystemInit+0xe2>
 80010e6:	e7cd      	b.n	8001084 <SystemInit+0x8c>
 80010e8:	e000ed00 	.word	0xe000ed00
 80010ec:	40021000 	.word	0x40021000
 80010f0:	f87fc00c 	.word	0xf87fc00c
 80010f4:	ff00fccc 	.word	0xff00fccc
 80010f8:	40022000 	.word	0x40022000

080010fc <RCC_GetClocksFreq>:
 80010fc:	4ba5      	ldr	r3, [pc, #660]	; (8001394 <RCC_GetClocksFreq+0x298>)
 80010fe:	685a      	ldr	r2, [r3, #4]
 8001100:	f002 020c 	and.w	r2, r2, #12
 8001104:	2a04      	cmp	r2, #4
 8001106:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 800110a:	d005      	beq.n	8001118 <RCC_GetClocksFreq+0x1c>
 800110c:	2a08      	cmp	r2, #8
 800110e:	d006      	beq.n	800111e <RCC_GetClocksFreq+0x22>
 8001110:	4ba1      	ldr	r3, [pc, #644]	; (8001398 <RCC_GetClocksFreq+0x29c>)
 8001112:	6003      	str	r3, [r0, #0]
 8001114:	b9ba      	cbnz	r2, 8001146 <RCC_GetClocksFreq+0x4a>
 8001116:	e017      	b.n	8001148 <RCC_GetClocksFreq+0x4c>
 8001118:	4b9f      	ldr	r3, [pc, #636]	; (8001398 <RCC_GetClocksFreq+0x29c>)
 800111a:	6003      	str	r3, [r0, #0]
 800111c:	e013      	b.n	8001146 <RCC_GetClocksFreq+0x4a>
 800111e:	6859      	ldr	r1, [r3, #4]
 8001120:	685c      	ldr	r4, [r3, #4]
 8001122:	f3c1 4183 	ubfx	r1, r1, #18, #4
 8001126:	03e2      	lsls	r2, r4, #15
 8001128:	f101 0102 	add.w	r1, r1, #2
 800112c:	d401      	bmi.n	8001132 <RCC_GetClocksFreq+0x36>
 800112e:	4a9b      	ldr	r2, [pc, #620]	; (800139c <RCC_GetClocksFreq+0x2a0>)
 8001130:	e006      	b.n	8001140 <RCC_GetClocksFreq+0x44>
 8001132:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001134:	4b98      	ldr	r3, [pc, #608]	; (8001398 <RCC_GetClocksFreq+0x29c>)
 8001136:	f002 020f 	and.w	r2, r2, #15
 800113a:	3201      	adds	r2, #1
 800113c:	fbb3 f2f2 	udiv	r2, r3, r2
 8001140:	434a      	muls	r2, r1
 8001142:	6002      	str	r2, [r0, #0]
 8001144:	e000      	b.n	8001148 <RCC_GetClocksFreq+0x4c>
 8001146:	2200      	movs	r2, #0
 8001148:	4f92      	ldr	r7, [pc, #584]	; (8001394 <RCC_GetClocksFreq+0x298>)
 800114a:	4d95      	ldr	r5, [pc, #596]	; (80013a0 <RCC_GetClocksFreq+0x2a4>)
 800114c:	687b      	ldr	r3, [r7, #4]
 800114e:	f8df 8254 	ldr.w	r8, [pc, #596]	; 80013a4 <RCC_GetClocksFreq+0x2a8>
 8001152:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8001156:	5cec      	ldrb	r4, [r5, r3]
 8001158:	6803      	ldr	r3, [r0, #0]
 800115a:	b2e4      	uxtb	r4, r4
 800115c:	fa23 f104 	lsr.w	r1, r3, r4
 8001160:	6041      	str	r1, [r0, #4]
 8001162:	687e      	ldr	r6, [r7, #4]
 8001164:	f3c6 2602 	ubfx	r6, r6, #8, #3
 8001168:	5dae      	ldrb	r6, [r5, r6]
 800116a:	fa21 f606 	lsr.w	r6, r1, r6
 800116e:	6086      	str	r6, [r0, #8]
 8001170:	f8d7 c004 	ldr.w	ip, [r7, #4]
 8001174:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8001178:	f815 500c 	ldrb.w	r5, [r5, ip]
 800117c:	b2ed      	uxtb	r5, r5
 800117e:	40e9      	lsrs	r1, r5
 8001180:	60c1      	str	r1, [r0, #12]
 8001182:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 8001186:	f3c9 1904 	ubfx	r9, r9, #4, #5
 800118a:	f009 0c0f 	and.w	ip, r9, #15
 800118e:	f019 0f10 	tst.w	r9, #16
 8001192:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 8001196:	fa1f fc8c 	uxth.w	ip, ip
 800119a:	d007      	beq.n	80011ac <RCC_GetClocksFreq+0xb0>
 800119c:	f1bc 0f00 	cmp.w	ip, #0
 80011a0:	d004      	beq.n	80011ac <RCC_GetClocksFreq+0xb0>
 80011a2:	fbb2 fcfc 	udiv	ip, r2, ip
 80011a6:	f8c0 c010 	str.w	ip, [r0, #16]
 80011aa:	e000      	b.n	80011ae <RCC_GetClocksFreq+0xb2>
 80011ac:	6103      	str	r3, [r0, #16]
 80011ae:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 80011b0:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 80011b4:	f00c 070f 	and.w	r7, ip, #15
 80011b8:	f01c 0f10 	tst.w	ip, #16
 80011bc:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 80011c0:	b2bf      	uxth	r7, r7
 80011c2:	d004      	beq.n	80011ce <RCC_GetClocksFreq+0xd2>
 80011c4:	b11f      	cbz	r7, 80011ce <RCC_GetClocksFreq+0xd2>
 80011c6:	fbb2 f7f7 	udiv	r7, r2, r7
 80011ca:	6147      	str	r7, [r0, #20]
 80011cc:	e000      	b.n	80011d0 <RCC_GetClocksFreq+0xd4>
 80011ce:	6143      	str	r3, [r0, #20]
 80011d0:	4f70      	ldr	r7, [pc, #448]	; (8001394 <RCC_GetClocksFreq+0x298>)
 80011d2:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80011d6:	f01c 0f10 	tst.w	ip, #16
 80011da:	bf0a      	itet	eq
 80011dc:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 8001398 <RCC_GetClocksFreq+0x29c>
 80011e0:	6183      	strne	r3, [r0, #24]
 80011e2:	f8c0 c018 	streq.w	ip, [r0, #24]
 80011e6:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80011e8:	06bf      	lsls	r7, r7, #26
 80011ea:	bf56      	itet	pl
 80011ec:	4f6a      	ldrpl	r7, [pc, #424]	; (8001398 <RCC_GetClocksFreq+0x29c>)
 80011ee:	61c3      	strmi	r3, [r0, #28]
 80011f0:	61c7      	strpl	r7, [r0, #28]
 80011f2:	4f68      	ldr	r7, [pc, #416]	; (8001394 <RCC_GetClocksFreq+0x298>)
 80011f4:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80011f8:	f01c 0f40 	tst.w	ip, #64	; 0x40
 80011fc:	bf0a      	itet	eq
 80011fe:	f8df c198 	ldreq.w	ip, [pc, #408]	; 8001398 <RCC_GetClocksFreq+0x29c>
 8001202:	6203      	strne	r3, [r0, #32]
 8001204:	f8c0 c020 	streq.w	ip, [r0, #32]
 8001208:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 800120a:	05ff      	lsls	r7, r7, #23
 800120c:	d506      	bpl.n	800121c <RCC_GetClocksFreq+0x120>
 800120e:	4293      	cmp	r3, r2
 8001210:	d104      	bne.n	800121c <RCC_GetClocksFreq+0x120>
 8001212:	42a5      	cmp	r5, r4
 8001214:	d102      	bne.n	800121c <RCC_GetClocksFreq+0x120>
 8001216:	005f      	lsls	r7, r3, #1
 8001218:	6247      	str	r7, [r0, #36]	; 0x24
 800121a:	e000      	b.n	800121e <RCC_GetClocksFreq+0x122>
 800121c:	6241      	str	r1, [r0, #36]	; 0x24
 800121e:	4f5d      	ldr	r7, [pc, #372]	; (8001394 <RCC_GetClocksFreq+0x298>)
 8001220:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001224:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 8001228:	d008      	beq.n	800123c <RCC_GetClocksFreq+0x140>
 800122a:	4293      	cmp	r3, r2
 800122c:	d106      	bne.n	800123c <RCC_GetClocksFreq+0x140>
 800122e:	42a5      	cmp	r5, r4
 8001230:	d104      	bne.n	800123c <RCC_GetClocksFreq+0x140>
 8001232:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001236:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 800123a:	e000      	b.n	800123e <RCC_GetClocksFreq+0x142>
 800123c:	6281      	str	r1, [r0, #40]	; 0x28
 800123e:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001240:	05bf      	lsls	r7, r7, #22
 8001242:	d506      	bpl.n	8001252 <RCC_GetClocksFreq+0x156>
 8001244:	4293      	cmp	r3, r2
 8001246:	d104      	bne.n	8001252 <RCC_GetClocksFreq+0x156>
 8001248:	42a5      	cmp	r5, r4
 800124a:	d102      	bne.n	8001252 <RCC_GetClocksFreq+0x156>
 800124c:	005f      	lsls	r7, r3, #1
 800124e:	62c7      	str	r7, [r0, #44]	; 0x2c
 8001250:	e000      	b.n	8001254 <RCC_GetClocksFreq+0x158>
 8001252:	62c1      	str	r1, [r0, #44]	; 0x2c
 8001254:	4f4f      	ldr	r7, [pc, #316]	; (8001394 <RCC_GetClocksFreq+0x298>)
 8001256:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800125a:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 800125e:	d008      	beq.n	8001272 <RCC_GetClocksFreq+0x176>
 8001260:	4293      	cmp	r3, r2
 8001262:	d106      	bne.n	8001272 <RCC_GetClocksFreq+0x176>
 8001264:	42a5      	cmp	r5, r4
 8001266:	d104      	bne.n	8001272 <RCC_GetClocksFreq+0x176>
 8001268:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 800126c:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8001270:	e000      	b.n	8001274 <RCC_GetClocksFreq+0x178>
 8001272:	64c1      	str	r1, [r0, #76]	; 0x4c
 8001274:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001276:	053f      	lsls	r7, r7, #20
 8001278:	d506      	bpl.n	8001288 <RCC_GetClocksFreq+0x18c>
 800127a:	4293      	cmp	r3, r2
 800127c:	d104      	bne.n	8001288 <RCC_GetClocksFreq+0x18c>
 800127e:	42a5      	cmp	r5, r4
 8001280:	d102      	bne.n	8001288 <RCC_GetClocksFreq+0x18c>
 8001282:	005f      	lsls	r7, r3, #1
 8001284:	6507      	str	r7, [r0, #80]	; 0x50
 8001286:	e000      	b.n	800128a <RCC_GetClocksFreq+0x18e>
 8001288:	6501      	str	r1, [r0, #80]	; 0x50
 800128a:	4f42      	ldr	r7, [pc, #264]	; (8001394 <RCC_GetClocksFreq+0x298>)
 800128c:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001290:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 8001294:	d008      	beq.n	80012a8 <RCC_GetClocksFreq+0x1ac>
 8001296:	4293      	cmp	r3, r2
 8001298:	d106      	bne.n	80012a8 <RCC_GetClocksFreq+0x1ac>
 800129a:	42a5      	cmp	r5, r4
 800129c:	d104      	bne.n	80012a8 <RCC_GetClocksFreq+0x1ac>
 800129e:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 80012a2:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 80012a6:	e000      	b.n	80012aa <RCC_GetClocksFreq+0x1ae>
 80012a8:	6501      	str	r1, [r0, #80]	; 0x50
 80012aa:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80012ac:	043f      	lsls	r7, r7, #16
 80012ae:	d506      	bpl.n	80012be <RCC_GetClocksFreq+0x1c2>
 80012b0:	4293      	cmp	r3, r2
 80012b2:	d104      	bne.n	80012be <RCC_GetClocksFreq+0x1c2>
 80012b4:	42a5      	cmp	r5, r4
 80012b6:	d102      	bne.n	80012be <RCC_GetClocksFreq+0x1c2>
 80012b8:	005a      	lsls	r2, r3, #1
 80012ba:	6582      	str	r2, [r0, #88]	; 0x58
 80012bc:	e000      	b.n	80012c0 <RCC_GetClocksFreq+0x1c4>
 80012be:	6581      	str	r1, [r0, #88]	; 0x58
 80012c0:	4a34      	ldr	r2, [pc, #208]	; (8001394 <RCC_GetClocksFreq+0x298>)
 80012c2:	6b14      	ldr	r4, [r2, #48]	; 0x30
 80012c4:	07a4      	lsls	r4, r4, #30
 80012c6:	d014      	beq.n	80012f2 <RCC_GetClocksFreq+0x1f6>
 80012c8:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80012ca:	f001 0103 	and.w	r1, r1, #3
 80012ce:	2901      	cmp	r1, #1
 80012d0:	d101      	bne.n	80012d6 <RCC_GetClocksFreq+0x1da>
 80012d2:	6383      	str	r3, [r0, #56]	; 0x38
 80012d4:	e00e      	b.n	80012f4 <RCC_GetClocksFreq+0x1f8>
 80012d6:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80012d8:	f001 0103 	and.w	r1, r1, #3
 80012dc:	2902      	cmp	r1, #2
 80012de:	d102      	bne.n	80012e6 <RCC_GetClocksFreq+0x1ea>
 80012e0:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80012e4:	e005      	b.n	80012f2 <RCC_GetClocksFreq+0x1f6>
 80012e6:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80012e8:	f001 0103 	and.w	r1, r1, #3
 80012ec:	2903      	cmp	r1, #3
 80012ee:	d101      	bne.n	80012f4 <RCC_GetClocksFreq+0x1f8>
 80012f0:	4929      	ldr	r1, [pc, #164]	; (8001398 <RCC_GetClocksFreq+0x29c>)
 80012f2:	6381      	str	r1, [r0, #56]	; 0x38
 80012f4:	6b12      	ldr	r2, [r2, #48]	; 0x30
 80012f6:	4927      	ldr	r1, [pc, #156]	; (8001394 <RCC_GetClocksFreq+0x298>)
 80012f8:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 80012fc:	d101      	bne.n	8001302 <RCC_GetClocksFreq+0x206>
 80012fe:	63c6      	str	r6, [r0, #60]	; 0x3c
 8001300:	e018      	b.n	8001334 <RCC_GetClocksFreq+0x238>
 8001302:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001304:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001308:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 800130c:	d101      	bne.n	8001312 <RCC_GetClocksFreq+0x216>
 800130e:	63c3      	str	r3, [r0, #60]	; 0x3c
 8001310:	e010      	b.n	8001334 <RCC_GetClocksFreq+0x238>
 8001312:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001314:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001318:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 800131c:	d102      	bne.n	8001324 <RCC_GetClocksFreq+0x228>
 800131e:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001322:	e006      	b.n	8001332 <RCC_GetClocksFreq+0x236>
 8001324:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001326:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 800132a:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 800132e:	d101      	bne.n	8001334 <RCC_GetClocksFreq+0x238>
 8001330:	4a19      	ldr	r2, [pc, #100]	; (8001398 <RCC_GetClocksFreq+0x29c>)
 8001332:	63c2      	str	r2, [r0, #60]	; 0x3c
 8001334:	4a17      	ldr	r2, [pc, #92]	; (8001394 <RCC_GetClocksFreq+0x298>)
 8001336:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001338:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 800133c:	d101      	bne.n	8001342 <RCC_GetClocksFreq+0x246>
 800133e:	6406      	str	r6, [r0, #64]	; 0x40
 8001340:	e018      	b.n	8001374 <RCC_GetClocksFreq+0x278>
 8001342:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001344:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001348:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 800134c:	d101      	bne.n	8001352 <RCC_GetClocksFreq+0x256>
 800134e:	6403      	str	r3, [r0, #64]	; 0x40
 8001350:	e010      	b.n	8001374 <RCC_GetClocksFreq+0x278>
 8001352:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001354:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001358:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 800135c:	d102      	bne.n	8001364 <RCC_GetClocksFreq+0x268>
 800135e:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001362:	e006      	b.n	8001372 <RCC_GetClocksFreq+0x276>
 8001364:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001366:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 800136a:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 800136e:	d101      	bne.n	8001374 <RCC_GetClocksFreq+0x278>
 8001370:	4909      	ldr	r1, [pc, #36]	; (8001398 <RCC_GetClocksFreq+0x29c>)
 8001372:	6401      	str	r1, [r0, #64]	; 0x40
 8001374:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001376:	4907      	ldr	r1, [pc, #28]	; (8001394 <RCC_GetClocksFreq+0x298>)
 8001378:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 800137c:	d101      	bne.n	8001382 <RCC_GetClocksFreq+0x286>
 800137e:	6446      	str	r6, [r0, #68]	; 0x44
 8001380:	e023      	b.n	80013ca <RCC_GetClocksFreq+0x2ce>
 8001382:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001384:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001388:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 800138c:	d10c      	bne.n	80013a8 <RCC_GetClocksFreq+0x2ac>
 800138e:	6443      	str	r3, [r0, #68]	; 0x44
 8001390:	e01b      	b.n	80013ca <RCC_GetClocksFreq+0x2ce>
 8001392:	bf00      	nop
 8001394:	40021000 	.word	0x40021000
 8001398:	007a1200 	.word	0x007a1200
 800139c:	003d0900 	.word	0x003d0900
 80013a0:	20000020 	.word	0x20000020
 80013a4:	20000000 	.word	0x20000000
 80013a8:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80013aa:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80013ae:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 80013b2:	d102      	bne.n	80013ba <RCC_GetClocksFreq+0x2be>
 80013b4:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80013b8:	e006      	b.n	80013c8 <RCC_GetClocksFreq+0x2cc>
 80013ba:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80013bc:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80013c0:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 80013c4:	d101      	bne.n	80013ca <RCC_GetClocksFreq+0x2ce>
 80013c6:	4a11      	ldr	r2, [pc, #68]	; (800140c <RCC_GetClocksFreq+0x310>)
 80013c8:	6442      	str	r2, [r0, #68]	; 0x44
 80013ca:	4a11      	ldr	r2, [pc, #68]	; (8001410 <RCC_GetClocksFreq+0x314>)
 80013cc:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80013ce:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 80013d2:	d102      	bne.n	80013da <RCC_GetClocksFreq+0x2de>
 80013d4:	6486      	str	r6, [r0, #72]	; 0x48
 80013d6:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80013da:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80013dc:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 80013e0:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 80013e4:	d00f      	beq.n	8001406 <RCC_GetClocksFreq+0x30a>
 80013e6:	6b13      	ldr	r3, [r2, #48]	; 0x30
 80013e8:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80013ec:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 80013f0:	d102      	bne.n	80013f8 <RCC_GetClocksFreq+0x2fc>
 80013f2:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80013f6:	e006      	b.n	8001406 <RCC_GetClocksFreq+0x30a>
 80013f8:	6b13      	ldr	r3, [r2, #48]	; 0x30
 80013fa:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80013fe:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8001402:	d101      	bne.n	8001408 <RCC_GetClocksFreq+0x30c>
 8001404:	4b01      	ldr	r3, [pc, #4]	; (800140c <RCC_GetClocksFreq+0x310>)
 8001406:	6483      	str	r3, [r0, #72]	; 0x48
 8001408:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800140c:	007a1200 	.word	0x007a1200
 8001410:	40021000 	.word	0x40021000

08001414 <RCC_AHBPeriphClockCmd>:
 8001414:	bf00      	nop
 8001416:	bf00      	nop
 8001418:	4b04      	ldr	r3, [pc, #16]	; (800142c <RCC_AHBPeriphClockCmd+0x18>)
 800141a:	695a      	ldr	r2, [r3, #20]
 800141c:	b109      	cbz	r1, 8001422 <RCC_AHBPeriphClockCmd+0xe>
 800141e:	4310      	orrs	r0, r2
 8001420:	e001      	b.n	8001426 <RCC_AHBPeriphClockCmd+0x12>
 8001422:	ea22 0000 	bic.w	r0, r2, r0
 8001426:	6158      	str	r0, [r3, #20]
 8001428:	4770      	bx	lr
 800142a:	bf00      	nop
 800142c:	40021000 	.word	0x40021000

08001430 <RCC_APB2PeriphClockCmd>:
 8001430:	bf00      	nop
 8001432:	bf00      	nop
 8001434:	4b04      	ldr	r3, [pc, #16]	; (8001448 <RCC_APB2PeriphClockCmd+0x18>)
 8001436:	699a      	ldr	r2, [r3, #24]
 8001438:	b109      	cbz	r1, 800143e <RCC_APB2PeriphClockCmd+0xe>
 800143a:	4310      	orrs	r0, r2
 800143c:	e001      	b.n	8001442 <RCC_APB2PeriphClockCmd+0x12>
 800143e:	ea22 0000 	bic.w	r0, r2, r0
 8001442:	6198      	str	r0, [r3, #24]
 8001444:	4770      	bx	lr
 8001446:	bf00      	nop
 8001448:	40021000 	.word	0x40021000

0800144c <RCC_APB1PeriphClockCmd>:
 800144c:	bf00      	nop
 800144e:	bf00      	nop
 8001450:	4b04      	ldr	r3, [pc, #16]	; (8001464 <RCC_APB1PeriphClockCmd+0x18>)
 8001452:	69da      	ldr	r2, [r3, #28]
 8001454:	b109      	cbz	r1, 800145a <RCC_APB1PeriphClockCmd+0xe>
 8001456:	4310      	orrs	r0, r2
 8001458:	e001      	b.n	800145e <RCC_APB1PeriphClockCmd+0x12>
 800145a:	ea22 0000 	bic.w	r0, r2, r0
 800145e:	61d8      	str	r0, [r3, #28]
 8001460:	4770      	bx	lr
 8001462:	bf00      	nop
 8001464:	40021000 	.word	0x40021000

08001468 <TIM_TimeBaseInit>:
 8001468:	bf00      	nop
 800146a:	bf00      	nop
 800146c:	bf00      	nop
 800146e:	4a24      	ldr	r2, [pc, #144]	; (8001500 <TIM_TimeBaseInit+0x98>)
 8001470:	8803      	ldrh	r3, [r0, #0]
 8001472:	4290      	cmp	r0, r2
 8001474:	b29b      	uxth	r3, r3
 8001476:	d012      	beq.n	800149e <TIM_TimeBaseInit+0x36>
 8001478:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 800147c:	4290      	cmp	r0, r2
 800147e:	d00e      	beq.n	800149e <TIM_TimeBaseInit+0x36>
 8001480:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001484:	d00b      	beq.n	800149e <TIM_TimeBaseInit+0x36>
 8001486:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 800148a:	4290      	cmp	r0, r2
 800148c:	d007      	beq.n	800149e <TIM_TimeBaseInit+0x36>
 800148e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001492:	4290      	cmp	r0, r2
 8001494:	d003      	beq.n	800149e <TIM_TimeBaseInit+0x36>
 8001496:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 800149a:	4290      	cmp	r0, r2
 800149c:	d103      	bne.n	80014a6 <TIM_TimeBaseInit+0x3e>
 800149e:	884a      	ldrh	r2, [r1, #2]
 80014a0:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 80014a4:	4313      	orrs	r3, r2
 80014a6:	4a17      	ldr	r2, [pc, #92]	; (8001504 <TIM_TimeBaseInit+0x9c>)
 80014a8:	4290      	cmp	r0, r2
 80014aa:	d008      	beq.n	80014be <TIM_TimeBaseInit+0x56>
 80014ac:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80014b0:	4290      	cmp	r0, r2
 80014b2:	d004      	beq.n	80014be <TIM_TimeBaseInit+0x56>
 80014b4:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 80014b8:	890a      	ldrh	r2, [r1, #8]
 80014ba:	b29b      	uxth	r3, r3
 80014bc:	4313      	orrs	r3, r2
 80014be:	8003      	strh	r3, [r0, #0]
 80014c0:	684b      	ldr	r3, [r1, #4]
 80014c2:	62c3      	str	r3, [r0, #44]	; 0x2c
 80014c4:	880b      	ldrh	r3, [r1, #0]
 80014c6:	8503      	strh	r3, [r0, #40]	; 0x28
 80014c8:	4b0d      	ldr	r3, [pc, #52]	; (8001500 <TIM_TimeBaseInit+0x98>)
 80014ca:	4298      	cmp	r0, r3
 80014cc:	d013      	beq.n	80014f6 <TIM_TimeBaseInit+0x8e>
 80014ce:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80014d2:	4298      	cmp	r0, r3
 80014d4:	d00f      	beq.n	80014f6 <TIM_TimeBaseInit+0x8e>
 80014d6:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 80014da:	4298      	cmp	r0, r3
 80014dc:	d00b      	beq.n	80014f6 <TIM_TimeBaseInit+0x8e>
 80014de:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80014e2:	4298      	cmp	r0, r3
 80014e4:	d007      	beq.n	80014f6 <TIM_TimeBaseInit+0x8e>
 80014e6:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80014ea:	4298      	cmp	r0, r3
 80014ec:	d003      	beq.n	80014f6 <TIM_TimeBaseInit+0x8e>
 80014ee:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80014f2:	4298      	cmp	r0, r3
 80014f4:	d101      	bne.n	80014fa <TIM_TimeBaseInit+0x92>
 80014f6:	894b      	ldrh	r3, [r1, #10]
 80014f8:	8603      	strh	r3, [r0, #48]	; 0x30
 80014fa:	2301      	movs	r3, #1
 80014fc:	6143      	str	r3, [r0, #20]
 80014fe:	4770      	bx	lr
 8001500:	40012c00 	.word	0x40012c00
 8001504:	40001000 	.word	0x40001000

08001508 <TIM_Cmd>:
 8001508:	bf00      	nop
 800150a:	bf00      	nop
 800150c:	8803      	ldrh	r3, [r0, #0]
 800150e:	b119      	cbz	r1, 8001518 <TIM_Cmd+0x10>
 8001510:	b29b      	uxth	r3, r3
 8001512:	f043 0301 	orr.w	r3, r3, #1
 8001516:	e003      	b.n	8001520 <TIM_Cmd+0x18>
 8001518:	f023 0301 	bic.w	r3, r3, #1
 800151c:	041b      	lsls	r3, r3, #16
 800151e:	0c1b      	lsrs	r3, r3, #16
 8001520:	8003      	strh	r3, [r0, #0]
 8001522:	4770      	bx	lr

08001524 <TIM_ClearITPendingBit>:
 8001524:	bf00      	nop
 8001526:	43c9      	mvns	r1, r1
 8001528:	b289      	uxth	r1, r1
 800152a:	6101      	str	r1, [r0, #16]
 800152c:	4770      	bx	lr
	...

08001530 <timer_init>:
 8001530:	b530      	push	{r4, r5, lr}
 8001532:	2300      	movs	r3, #0
 8001534:	b085      	sub	sp, #20
 8001536:	491f      	ldr	r1, [pc, #124]	; (80015b4 <timer_init+0x84>)
 8001538:	f44f 6280 	mov.w	r2, #1024	; 0x400
 800153c:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001540:	491d      	ldr	r1, [pc, #116]	; (80015b8 <timer_init+0x88>)
 8001542:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001546:	4a1d      	ldr	r2, [pc, #116]	; (80015bc <timer_init+0x8c>)
 8001548:	2400      	movs	r4, #0
 800154a:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 800154e:	3301      	adds	r3, #1
 8001550:	2b04      	cmp	r3, #4
 8001552:	4625      	mov	r5, r4
 8001554:	d1ef      	bne.n	8001536 <timer_init+0x6>
 8001556:	4b1a      	ldr	r3, [pc, #104]	; (80015c0 <timer_init+0x90>)
 8001558:	2002      	movs	r0, #2
 800155a:	2101      	movs	r1, #1
 800155c:	601c      	str	r4, [r3, #0]
 800155e:	f7ff ff75 	bl	800144c <RCC_APB1PeriphClockCmd>
 8001562:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001566:	f8ad 400c 	strh.w	r4, [sp, #12]
 800156a:	f8ad 400e 	strh.w	r4, [sp, #14]
 800156e:	4c15      	ldr	r4, [pc, #84]	; (80015c4 <timer_init+0x94>)
 8001570:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001574:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001578:	4620      	mov	r0, r4
 800157a:	2331      	movs	r3, #49	; 0x31
 800157c:	a901      	add	r1, sp, #4
 800157e:	9302      	str	r3, [sp, #8]
 8001580:	f7ff ff72 	bl	8001468 <TIM_TimeBaseInit>
 8001584:	4620      	mov	r0, r4
 8001586:	2101      	movs	r1, #1
 8001588:	f7ff ffbe 	bl	8001508 <TIM_Cmd>
 800158c:	68e3      	ldr	r3, [r4, #12]
 800158e:	f043 0301 	orr.w	r3, r3, #1
 8001592:	60e3      	str	r3, [r4, #12]
 8001594:	231d      	movs	r3, #29
 8001596:	f88d 3000 	strb.w	r3, [sp]
 800159a:	4668      	mov	r0, sp
 800159c:	2301      	movs	r3, #1
 800159e:	f88d 5001 	strb.w	r5, [sp, #1]
 80015a2:	f88d 3002 	strb.w	r3, [sp, #2]
 80015a6:	f88d 3003 	strb.w	r3, [sp, #3]
 80015aa:	f7ff fb81 	bl	8000cb0 <NVIC_Init>
 80015ae:	b005      	add	sp, #20
 80015b0:	bd30      	pop	{r4, r5, pc}
 80015b2:	bf00      	nop
 80015b4:	200009b8 	.word	0x200009b8
 80015b8:	200009ac 	.word	0x200009ac
 80015bc:	200009a4 	.word	0x200009a4
 80015c0:	200009b4 	.word	0x200009b4
 80015c4:	40000400 	.word	0x40000400

080015c8 <TIM3_IRQHandler>:
 80015c8:	2300      	movs	r3, #0
 80015ca:	4a10      	ldr	r2, [pc, #64]	; (800160c <TIM3_IRQHandler+0x44>)
 80015cc:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 80015d0:	b289      	uxth	r1, r1
 80015d2:	b129      	cbz	r1, 80015e0 <TIM3_IRQHandler+0x18>
 80015d4:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 80015d8:	b289      	uxth	r1, r1
 80015da:	3901      	subs	r1, #1
 80015dc:	b289      	uxth	r1, r1
 80015de:	e007      	b.n	80015f0 <TIM3_IRQHandler+0x28>
 80015e0:	490b      	ldr	r1, [pc, #44]	; (8001610 <TIM3_IRQHandler+0x48>)
 80015e2:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 80015e6:	b289      	uxth	r1, r1
 80015e8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 80015ec:	4a09      	ldr	r2, [pc, #36]	; (8001614 <TIM3_IRQHandler+0x4c>)
 80015ee:	2101      	movs	r1, #1
 80015f0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 80015f4:	3301      	adds	r3, #1
 80015f6:	2b04      	cmp	r3, #4
 80015f8:	d1e7      	bne.n	80015ca <TIM3_IRQHandler+0x2>
 80015fa:	4b07      	ldr	r3, [pc, #28]	; (8001618 <TIM3_IRQHandler+0x50>)
 80015fc:	4807      	ldr	r0, [pc, #28]	; (800161c <TIM3_IRQHandler+0x54>)
 80015fe:	681a      	ldr	r2, [r3, #0]
 8001600:	2101      	movs	r1, #1
 8001602:	3201      	adds	r2, #1
 8001604:	601a      	str	r2, [r3, #0]
 8001606:	f7ff bf8d 	b.w	8001524 <TIM_ClearITPendingBit>
 800160a:	bf00      	nop
 800160c:	200009b8 	.word	0x200009b8
 8001610:	200009ac 	.word	0x200009ac
 8001614:	200009a4 	.word	0x200009a4
 8001618:	200009b4 	.word	0x200009b4
 800161c:	40000400 	.word	0x40000400

08001620 <timer_get_time>:
 8001620:	b082      	sub	sp, #8
 8001622:	b672      	cpsid	i
 8001624:	4b04      	ldr	r3, [pc, #16]	; (8001638 <timer_get_time+0x18>)
 8001626:	681b      	ldr	r3, [r3, #0]
 8001628:	9301      	str	r3, [sp, #4]
 800162a:	b662      	cpsie	i
 800162c:	9801      	ldr	r0, [sp, #4]
 800162e:	230a      	movs	r3, #10
 8001630:	fbb0 f0f3 	udiv	r0, r0, r3
 8001634:	b002      	add	sp, #8
 8001636:	4770      	bx	lr
 8001638:	200009b4 	.word	0x200009b4

0800163c <timer_delay_ms>:
 800163c:	b513      	push	{r0, r1, r4, lr}
 800163e:	4604      	mov	r4, r0
 8001640:	f7ff ffee 	bl	8001620 <timer_get_time>
 8001644:	4420      	add	r0, r4
 8001646:	9001      	str	r0, [sp, #4]
 8001648:	9c01      	ldr	r4, [sp, #4]
 800164a:	f7ff ffe9 	bl	8001620 <timer_get_time>
 800164e:	4284      	cmp	r4, r0
 8001650:	d902      	bls.n	8001658 <timer_delay_ms+0x1c>
 8001652:	f7ff fccd 	bl	8000ff0 <sleep>
 8001656:	e7f7      	b.n	8001648 <timer_delay_ms+0xc>
 8001658:	b002      	add	sp, #8
 800165a:	bd10      	pop	{r4, pc}

0800165c <event_timer_set_period>:
 800165c:	b672      	cpsid	i
 800165e:	230a      	movs	r3, #10
 8001660:	4359      	muls	r1, r3
 8001662:	4b06      	ldr	r3, [pc, #24]	; (800167c <event_timer_set_period+0x20>)
 8001664:	b289      	uxth	r1, r1
 8001666:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 800166a:	4b05      	ldr	r3, [pc, #20]	; (8001680 <event_timer_set_period+0x24>)
 800166c:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001670:	4b04      	ldr	r3, [pc, #16]	; (8001684 <event_timer_set_period+0x28>)
 8001672:	2200      	movs	r2, #0
 8001674:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 8001678:	b662      	cpsie	i
 800167a:	4770      	bx	lr
 800167c:	200009b8 	.word	0x200009b8
 8001680:	200009ac 	.word	0x200009ac
 8001684:	200009a4 	.word	0x200009a4

08001688 <event_timer_wait>:
 8001688:	b510      	push	{r4, lr}
 800168a:	4604      	mov	r4, r0
 800168c:	4b06      	ldr	r3, [pc, #24]	; (80016a8 <event_timer_wait+0x20>)
 800168e:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 8001692:	b292      	uxth	r2, r2
 8001694:	b912      	cbnz	r2, 800169c <event_timer_wait+0x14>
 8001696:	f7ff fcab 	bl	8000ff0 <sleep>
 800169a:	e7f7      	b.n	800168c <event_timer_wait+0x4>
 800169c:	b672      	cpsid	i
 800169e:	2200      	movs	r2, #0
 80016a0:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 80016a4:	b662      	cpsie	i
 80016a6:	bd10      	pop	{r4, pc}
 80016a8:	200009a4 	.word	0x200009a4

080016ac <GPIO_Init>:
 80016ac:	b5f0      	push	{r4, r5, r6, r7, lr}
 80016ae:	bf00      	nop
 80016b0:	bf00      	nop
 80016b2:	bf00      	nop
 80016b4:	bf00      	nop
 80016b6:	2300      	movs	r3, #0
 80016b8:	680e      	ldr	r6, [r1, #0]
 80016ba:	461a      	mov	r2, r3
 80016bc:	2501      	movs	r5, #1
 80016be:	4095      	lsls	r5, r2
 80016c0:	ea05 0406 	and.w	r4, r5, r6
 80016c4:	42ac      	cmp	r4, r5
 80016c6:	d131      	bne.n	800172c <GPIO_Init+0x80>
 80016c8:	790d      	ldrb	r5, [r1, #4]
 80016ca:	1e6f      	subs	r7, r5, #1
 80016cc:	b2ff      	uxtb	r7, r7
 80016ce:	2f01      	cmp	r7, #1
 80016d0:	d81c      	bhi.n	800170c <GPIO_Init+0x60>
 80016d2:	bf00      	nop
 80016d4:	f04f 0c03 	mov.w	ip, #3
 80016d8:	6887      	ldr	r7, [r0, #8]
 80016da:	fa0c fc03 	lsl.w	ip, ip, r3
 80016de:	ea27 070c 	bic.w	r7, r7, ip
 80016e2:	6087      	str	r7, [r0, #8]
 80016e4:	f891 c005 	ldrb.w	ip, [r1, #5]
 80016e8:	6887      	ldr	r7, [r0, #8]
 80016ea:	fa0c fc03 	lsl.w	ip, ip, r3
 80016ee:	ea4c 0707 	orr.w	r7, ip, r7
 80016f2:	6087      	str	r7, [r0, #8]
 80016f4:	bf00      	nop
 80016f6:	8887      	ldrh	r7, [r0, #4]
 80016f8:	b2bf      	uxth	r7, r7
 80016fa:	ea27 0404 	bic.w	r4, r7, r4
 80016fe:	8084      	strh	r4, [r0, #4]
 8001700:	798c      	ldrb	r4, [r1, #6]
 8001702:	8887      	ldrh	r7, [r0, #4]
 8001704:	4094      	lsls	r4, r2
 8001706:	433c      	orrs	r4, r7
 8001708:	b2a4      	uxth	r4, r4
 800170a:	8084      	strh	r4, [r0, #4]
 800170c:	2403      	movs	r4, #3
 800170e:	6807      	ldr	r7, [r0, #0]
 8001710:	409c      	lsls	r4, r3
 8001712:	43e4      	mvns	r4, r4
 8001714:	4027      	ands	r7, r4
 8001716:	6007      	str	r7, [r0, #0]
 8001718:	6807      	ldr	r7, [r0, #0]
 800171a:	409d      	lsls	r5, r3
 800171c:	433d      	orrs	r5, r7
 800171e:	6005      	str	r5, [r0, #0]
 8001720:	68c5      	ldr	r5, [r0, #12]
 8001722:	402c      	ands	r4, r5
 8001724:	79cd      	ldrb	r5, [r1, #7]
 8001726:	409d      	lsls	r5, r3
 8001728:	432c      	orrs	r4, r5
 800172a:	60c4      	str	r4, [r0, #12]
 800172c:	3201      	adds	r2, #1
 800172e:	2a10      	cmp	r2, #16
 8001730:	f103 0302 	add.w	r3, r3, #2
 8001734:	d1c2      	bne.n	80016bc <GPIO_Init+0x10>
 8001736:	bdf0      	pop	{r4, r5, r6, r7, pc}

08001738 <GPIO_SetBits>:
 8001738:	bf00      	nop
 800173a:	bf00      	nop
 800173c:	6181      	str	r1, [r0, #24]
 800173e:	4770      	bx	lr

08001740 <GPIO_ResetBits>:
 8001740:	bf00      	nop
 8001742:	bf00      	nop
 8001744:	8501      	strh	r1, [r0, #40]	; 0x28
 8001746:	4770      	bx	lr

08001748 <GPIO_PinAFConfig>:
 8001748:	b510      	push	{r4, lr}
 800174a:	bf00      	nop
 800174c:	bf00      	nop
 800174e:	bf00      	nop
 8001750:	f001 0307 	and.w	r3, r1, #7
 8001754:	08c9      	lsrs	r1, r1, #3
 8001756:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 800175a:	009b      	lsls	r3, r3, #2
 800175c:	6a04      	ldr	r4, [r0, #32]
 800175e:	210f      	movs	r1, #15
 8001760:	4099      	lsls	r1, r3
 8001762:	ea24 0101 	bic.w	r1, r4, r1
 8001766:	6201      	str	r1, [r0, #32]
 8001768:	6a01      	ldr	r1, [r0, #32]
 800176a:	fa02 f303 	lsl.w	r3, r2, r3
 800176e:	430b      	orrs	r3, r1
 8001770:	6203      	str	r3, [r0, #32]
 8001772:	bd10      	pop	{r4, pc}

08001774 <gpio_init>:
 8001774:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 8001778:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 800177c:	2101      	movs	r1, #1
 800177e:	f7ff fe49 	bl	8001414 <RCC_AHBPeriphClockCmd>
 8001782:	4d20      	ldr	r5, [pc, #128]	; (8001804 <gpio_init+0x90>)
 8001784:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001788:	2101      	movs	r1, #1
 800178a:	f7ff fe43 	bl	8001414 <RCC_AHBPeriphClockCmd>
 800178e:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 8001792:	2101      	movs	r1, #1
 8001794:	f7ff fe3e 	bl	8001414 <RCC_AHBPeriphClockCmd>
 8001798:	2400      	movs	r4, #0
 800179a:	2603      	movs	r6, #3
 800179c:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 80017a0:	f04f 0901 	mov.w	r9, #1
 80017a4:	4628      	mov	r0, r5
 80017a6:	4669      	mov	r1, sp
 80017a8:	2708      	movs	r7, #8
 80017aa:	f8cd 8000 	str.w	r8, [sp]
 80017ae:	f88d 9004 	strb.w	r9, [sp, #4]
 80017b2:	f88d 4006 	strb.w	r4, [sp, #6]
 80017b6:	f88d 6005 	strb.w	r6, [sp, #5]
 80017ba:	f88d 4007 	strb.w	r4, [sp, #7]
 80017be:	f7ff ff75 	bl	80016ac <GPIO_Init>
 80017c2:	4669      	mov	r1, sp
 80017c4:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80017c8:	9700      	str	r7, [sp, #0]
 80017ca:	f88d 9004 	strb.w	r9, [sp, #4]
 80017ce:	f88d 4006 	strb.w	r4, [sp, #6]
 80017d2:	f88d 6005 	strb.w	r6, [sp, #5]
 80017d6:	f88d 4007 	strb.w	r4, [sp, #7]
 80017da:	f7ff ff67 	bl	80016ac <GPIO_Init>
 80017de:	f44f 7300 	mov.w	r3, #512	; 0x200
 80017e2:	4628      	mov	r0, r5
 80017e4:	4669      	mov	r1, sp
 80017e6:	9300      	str	r3, [sp, #0]
 80017e8:	f88d 4004 	strb.w	r4, [sp, #4]
 80017ec:	f88d 6005 	strb.w	r6, [sp, #5]
 80017f0:	f88d 4007 	strb.w	r4, [sp, #7]
 80017f4:	f7ff ff5a 	bl	80016ac <GPIO_Init>
 80017f8:	f8c5 8018 	str.w	r8, [r5, #24]
 80017fc:	61af      	str	r7, [r5, #24]
 80017fe:	b003      	add	sp, #12
 8001800:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001804:	48000400 	.word	0x48000400

08001808 <led_on>:
 8001808:	0402      	lsls	r2, r0, #16
 800180a:	d503      	bpl.n	8001814 <led_on+0xc>
 800180c:	4b04      	ldr	r3, [pc, #16]	; (8001820 <led_on+0x18>)
 800180e:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001812:	619a      	str	r2, [r3, #24]
 8001814:	0703      	lsls	r3, r0, #28
 8001816:	d502      	bpl.n	800181e <led_on+0x16>
 8001818:	4b01      	ldr	r3, [pc, #4]	; (8001820 <led_on+0x18>)
 800181a:	2208      	movs	r2, #8
 800181c:	851a      	strh	r2, [r3, #40]	; 0x28
 800181e:	4770      	bx	lr
 8001820:	48000400 	.word	0x48000400

08001824 <led_off>:
 8001824:	0403      	lsls	r3, r0, #16
 8001826:	d503      	bpl.n	8001830 <led_off+0xc>
 8001828:	4b04      	ldr	r3, [pc, #16]	; (800183c <led_off+0x18>)
 800182a:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800182e:	851a      	strh	r2, [r3, #40]	; 0x28
 8001830:	0701      	lsls	r1, r0, #28
 8001832:	d502      	bpl.n	800183a <led_off+0x16>
 8001834:	4b01      	ldr	r3, [pc, #4]	; (800183c <led_off+0x18>)
 8001836:	2208      	movs	r2, #8
 8001838:	619a      	str	r2, [r3, #24]
 800183a:	4770      	bx	lr
 800183c:	48000400 	.word	0x48000400

08001840 <get_key>:
 8001840:	4b02      	ldr	r3, [pc, #8]	; (800184c <get_key+0xc>)
 8001842:	8a18      	ldrh	r0, [r3, #16]
 8001844:	43c0      	mvns	r0, r0
 8001846:	f400 7000 	and.w	r0, r0, #512	; 0x200
 800184a:	4770      	bx	lr
 800184c:	48000400 	.word	0x48000400

08001850 <_init>:
 8001850:	e1a0c00d 	mov	ip, sp
 8001854:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001858:	e24cb004 	sub	fp, ip, #4
 800185c:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001860:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001864:	e12fff1e 	bx	lr

08001868 <_fini>:
 8001868:	e1a0c00d 	mov	ip, sp
 800186c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001870:	e24cb004 	sub	fp, ip, #4
 8001874:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001878:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 800187c:	e12fff1e 	bx	lr
 8001880:	69647473 	.word	0x69647473
 8001884:	6e69206f 	.word	0x6e69206f
 8001888:	64207469 	.word	0x64207469
 800188c:	0a656e6f 	.word	0x0a656e6f
 8001890:	00          	.byte	0x00
 8001891:	0a          	.byte	0x0a
 8001892:	6577      	.short	0x6577
 8001894:	6d6f636c 	.word	0x6d6f636c
 8001898:	6f742065 	.word	0x6f742065
 800189c:	7a755320 	.word	0x7a755320
 80018a0:	4f616875 	.word	0x4f616875
 80018a4:	5f5e2053 	.word	0x5f5e2053
 80018a8:	2e32205e 	.word	0x2e32205e
 80018ac:	0a362e30 	.word	0x0a362e30
 80018b0:	4c495542 	.word	0x4c495542
 80018b4:	614a2044 	.word	0x614a2044
 80018b8:	3133206e 	.word	0x3133206e
 80018bc:	31303220 	.word	0x31303220
 80018c0:	30312036 	.word	0x30312036
 80018c4:	3a31343a 	.word	0x3a31343a
 80018c8:	000a3832 	.word	0x000a3832
 80018cc:	6f727265 	.word	0x6f727265
 80018d0:	6f632072 	.word	0x6f632072
 80018d4:	25206564 	.word	0x25206564
 80018d8:	75253a75 	.word	0x75253a75
 80018dc:	0000000a 	.word	0x0000000a

080018e0 <__EH_FRAME_BEGIN__>:
 80018e0:	00000000                                ....
