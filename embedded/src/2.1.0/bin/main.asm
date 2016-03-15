
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <thread_ending>:
 8000188:	b672      	cpsid	i
 800018a:	4b05      	ldr	r3, [pc, #20]	; (80001a0 <thread_ending+0x18>)
 800018c:	4a05      	ldr	r2, [pc, #20]	; (80001a4 <thread_ending+0x1c>)
 800018e:	681b      	ldr	r3, [r3, #0]
 8000190:	210c      	movs	r1, #12
 8000192:	fb01 2303 	mla	r3, r1, r3, r2
 8000196:	2200      	movs	r2, #0
 8000198:	605a      	str	r2, [r3, #4]
 800019a:	b662      	cpsie	i
 800019c:	bf00      	nop
 800019e:	e7fd      	b.n	800019c <thread_ending+0x14>
 80001a0:	2000007c 	.word	0x2000007c
 80001a4:	20000034 	.word	0x20000034

080001a8 <null_thread>:
 80001a8:	b508      	push	{r3, lr}
 80001aa:	f001 fd5d 	bl	8001c68 <sleep>
 80001ae:	e7fc      	b.n	80001aa <null_thread+0x2>

080001b0 <scheduler>:
 80001b0:	b570      	push	{r4, r5, r6, lr}
 80001b2:	2200      	movs	r2, #0
 80001b4:	4611      	mov	r1, r2
 80001b6:	4b15      	ldr	r3, [pc, #84]	; (800020c <scheduler+0x5c>)
 80001b8:	200c      	movs	r0, #12
 80001ba:	fb00 f501 	mul.w	r5, r0, r1
 80001be:	195e      	adds	r6, r3, r5
 80001c0:	6874      	ldr	r4, [r6, #4]
 80001c2:	f014 0f02 	tst.w	r4, #2
 80001c6:	461c      	mov	r4, r3
 80001c8:	d10a      	bne.n	80001e0 <scheduler+0x30>
 80001ca:	6876      	ldr	r6, [r6, #4]
 80001cc:	07f6      	lsls	r6, r6, #31
 80001ce:	d507      	bpl.n	80001e0 <scheduler+0x30>
 80001d0:	4350      	muls	r0, r2
 80001d2:	5b5d      	ldrh	r5, [r3, r5]
 80001d4:	5a18      	ldrh	r0, [r3, r0]
 80001d6:	b2ad      	uxth	r5, r5
 80001d8:	b280      	uxth	r0, r0
 80001da:	4285      	cmp	r5, r0
 80001dc:	bf38      	it	cc
 80001de:	460a      	movcc	r2, r1
 80001e0:	200c      	movs	r0, #12
 80001e2:	4348      	muls	r0, r1
 80001e4:	5a1d      	ldrh	r5, [r3, r0]
 80001e6:	b2ad      	uxth	r5, r5
 80001e8:	b125      	cbz	r5, 80001f4 <scheduler+0x44>
 80001ea:	5a1d      	ldrh	r5, [r3, r0]
 80001ec:	b2ad      	uxth	r5, r5
 80001ee:	3d01      	subs	r5, #1
 80001f0:	b2ad      	uxth	r5, r5
 80001f2:	521d      	strh	r5, [r3, r0]
 80001f4:	3101      	adds	r1, #1
 80001f6:	2906      	cmp	r1, #6
 80001f8:	d1dd      	bne.n	80001b6 <scheduler+0x6>
 80001fa:	230c      	movs	r3, #12
 80001fc:	4353      	muls	r3, r2
 80001fe:	18e1      	adds	r1, r4, r3
 8000200:	8849      	ldrh	r1, [r1, #2]
 8000202:	b289      	uxth	r1, r1
 8000204:	52e1      	strh	r1, [r4, r3]
 8000206:	4b02      	ldr	r3, [pc, #8]	; (8000210 <scheduler+0x60>)
 8000208:	601a      	str	r2, [r3, #0]
 800020a:	bd70      	pop	{r4, r5, r6, pc}
 800020c:	20000034 	.word	0x20000034
 8000210:	2000007c 	.word	0x2000007c

08000214 <SysTick_Handler>:
 8000214:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000218:	f3ef 8208 	mrs	r2, MSP
 800021c:	4c0d      	ldr	r4, [pc, #52]	; (8000254 <SysTick_Handler+0x40>)
 800021e:	4d0e      	ldr	r5, [pc, #56]	; (8000258 <SysTick_Handler+0x44>)
 8000220:	6823      	ldr	r3, [r4, #0]
 8000222:	3301      	adds	r3, #1
 8000224:	d005      	beq.n	8000232 <SysTick_Handler+0x1e>
 8000226:	6823      	ldr	r3, [r4, #0]
 8000228:	210c      	movs	r1, #12
 800022a:	fb01 5303 	mla	r3, r1, r3, r5
 800022e:	609a      	str	r2, [r3, #8]
 8000230:	e001      	b.n	8000236 <SysTick_Handler+0x22>
 8000232:	2300      	movs	r3, #0
 8000234:	6023      	str	r3, [r4, #0]
 8000236:	f7ff ffbb 	bl	80001b0 <scheduler>
 800023a:	6823      	ldr	r3, [r4, #0]
 800023c:	220c      	movs	r2, #12
 800023e:	fb02 5503 	mla	r5, r2, r3, r5
 8000242:	f06f 0306 	mvn.w	r3, #6
 8000246:	68aa      	ldr	r2, [r5, #8]
 8000248:	469e      	mov	lr, r3
 800024a:	f382 8808 	msr	MSP, r2
 800024e:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000252:	4770      	bx	lr
 8000254:	2000007c 	.word	0x2000007c
 8000258:	20000034 	.word	0x20000034

0800025c <sched_off>:
 800025c:	b672      	cpsid	i
 800025e:	4770      	bx	lr

08000260 <sched_on>:
 8000260:	b662      	cpsie	i
 8000262:	4770      	bx	lr

08000264 <yield>:
 8000264:	bf00      	nop
 8000266:	4770      	bx	lr

08000268 <get_thread_id>:
 8000268:	b082      	sub	sp, #8
 800026a:	b672      	cpsid	i
 800026c:	4b03      	ldr	r3, [pc, #12]	; (800027c <get_thread_id+0x14>)
 800026e:	681b      	ldr	r3, [r3, #0]
 8000270:	9301      	str	r3, [sp, #4]
 8000272:	b662      	cpsie	i
 8000274:	9801      	ldr	r0, [sp, #4]
 8000276:	b002      	add	sp, #8
 8000278:	4770      	bx	lr
 800027a:	bf00      	nop
 800027c:	2000007c 	.word	0x2000007c

08000280 <kernel_start>:
 8000280:	b508      	push	{r3, lr}
 8000282:	f001 fcdf 	bl	8001c44 <sys_tick_init>
 8000286:	bf00      	nop
 8000288:	e7fd      	b.n	8000286 <kernel_start+0x6>
	...

0800028c <create_thread>:
 800028c:	f022 0203 	bic.w	r2, r2, #3
 8000290:	3a40      	subs	r2, #64	; 0x40
 8000292:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8000296:	eb01 0c02 	add.w	ip, r1, r2
 800029a:	f102 0834 	add.w	r8, r2, #52	; 0x34
 800029e:	f102 0938 	add.w	r9, r2, #56	; 0x38
 80002a2:	323c      	adds	r2, #60	; 0x3c
 80002a4:	4488      	add	r8, r1
 80002a6:	4489      	add	r9, r1
 80002a8:	4607      	mov	r7, r0
 80002aa:	4411      	add	r1, r2
 80002ac:	2200      	movs	r2, #0
 80002ae:	b672      	cpsid	i
 80002b0:	4e11      	ldr	r6, [pc, #68]	; (80002f8 <create_thread+0x6c>)
 80002b2:	250c      	movs	r5, #12
 80002b4:	4355      	muls	r5, r2
 80002b6:	1974      	adds	r4, r6, r5
 80002b8:	6860      	ldr	r0, [r4, #4]
 80002ba:	07c0      	lsls	r0, r0, #31
 80002bc:	d412      	bmi.n	80002e4 <create_thread+0x58>
 80002be:	480f      	ldr	r0, [pc, #60]	; (80002fc <create_thread+0x70>)
 80002c0:	f8c4 c008 	str.w	ip, [r4, #8]
 80002c4:	f8c8 0000 	str.w	r0, [r8]
 80002c8:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 80002cc:	f8c9 7000 	str.w	r7, [r9]
 80002d0:	2b05      	cmp	r3, #5
 80002d2:	bf98      	it	ls
 80002d4:	2306      	movls	r3, #6
 80002d6:	6008      	str	r0, [r1, #0]
 80002d8:	2001      	movs	r0, #1
 80002da:	8063      	strh	r3, [r4, #2]
 80002dc:	5373      	strh	r3, [r6, r5]
 80002de:	6060      	str	r0, [r4, #4]
 80002e0:	4610      	mov	r0, r2
 80002e2:	e000      	b.n	80002e6 <create_thread+0x5a>
 80002e4:	2006      	movs	r0, #6
 80002e6:	b662      	cpsie	i
 80002e8:	3201      	adds	r2, #1
 80002ea:	2a06      	cmp	r2, #6
 80002ec:	d001      	beq.n	80002f2 <create_thread+0x66>
 80002ee:	2806      	cmp	r0, #6
 80002f0:	d0dd      	beq.n	80002ae <create_thread+0x22>
 80002f2:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80002f6:	bf00      	nop
 80002f8:	20000034 	.word	0x20000034
 80002fc:	08000189 	.word	0x08000189

08000300 <kernel_init>:
 8000300:	b510      	push	{r4, lr}
 8000302:	2300      	movs	r3, #0
 8000304:	490b      	ldr	r1, [pc, #44]	; (8000334 <kernel_init+0x34>)
 8000306:	220c      	movs	r2, #12
 8000308:	435a      	muls	r2, r3
 800030a:	188c      	adds	r4, r1, r2
 800030c:	2000      	movs	r0, #0
 800030e:	6060      	str	r0, [r4, #4]
 8000310:	3301      	adds	r3, #1
 8000312:	2006      	movs	r0, #6
 8000314:	4283      	cmp	r3, r0
 8000316:	8060      	strh	r0, [r4, #2]
 8000318:	5288      	strh	r0, [r1, r2]
 800031a:	d1f3      	bne.n	8000304 <kernel_init+0x4>
 800031c:	4b06      	ldr	r3, [pc, #24]	; (8000338 <kernel_init+0x38>)
 800031e:	4807      	ldr	r0, [pc, #28]	; (800033c <kernel_init+0x3c>)
 8000320:	4907      	ldr	r1, [pc, #28]	; (8000340 <kernel_init+0x40>)
 8000322:	f04f 32ff 	mov.w	r2, #4294967295
 8000326:	601a      	str	r2, [r3, #0]
 8000328:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800032c:	2280      	movs	r2, #128	; 0x80
 800032e:	23ff      	movs	r3, #255	; 0xff
 8000330:	f7ff bfac 	b.w	800028c <create_thread>
 8000334:	20000034 	.word	0x20000034
 8000338:	2000007c 	.word	0x2000007c
 800033c:	080001a9 	.word	0x080001a9
 8000340:	20000080 	.word	0x20000080

08000344 <set_wait_state>:
 8000344:	b507      	push	{r0, r1, r2, lr}
 8000346:	f7ff ff8f 	bl	8000268 <get_thread_id>
 800034a:	9000      	str	r0, [sp, #0]
 800034c:	b672      	cpsid	i
 800034e:	4b0d      	ldr	r3, [pc, #52]	; (8000384 <set_wait_state+0x40>)
 8000350:	9a00      	ldr	r2, [sp, #0]
 8000352:	210c      	movs	r1, #12
 8000354:	fb01 3202 	mla	r2, r1, r2, r3
 8000358:	6851      	ldr	r1, [r2, #4]
 800035a:	f041 0102 	orr.w	r1, r1, #2
 800035e:	6051      	str	r1, [r2, #4]
 8000360:	b672      	cpsid	i
 8000362:	9a00      	ldr	r2, [sp, #0]
 8000364:	210c      	movs	r1, #12
 8000366:	fb01 3202 	mla	r2, r1, r2, r3
 800036a:	6852      	ldr	r2, [r2, #4]
 800036c:	9201      	str	r2, [sp, #4]
 800036e:	b662      	cpsie	i
 8000370:	9a01      	ldr	r2, [sp, #4]
 8000372:	0791      	lsls	r1, r2, #30
 8000374:	d500      	bpl.n	8000378 <set_wait_state+0x34>
 8000376:	bf00      	nop
 8000378:	9a01      	ldr	r2, [sp, #4]
 800037a:	0792      	lsls	r2, r2, #30
 800037c:	d4f0      	bmi.n	8000360 <set_wait_state+0x1c>
 800037e:	b003      	add	sp, #12
 8000380:	f85d fb04 	ldr.w	pc, [sp], #4
 8000384:	20000034 	.word	0x20000034

08000388 <wake_up_threads>:
 8000388:	2300      	movs	r3, #0
 800038a:	b672      	cpsid	i
 800038c:	4a06      	ldr	r2, [pc, #24]	; (80003a8 <wake_up_threads+0x20>)
 800038e:	210c      	movs	r1, #12
 8000390:	fb01 2203 	mla	r2, r1, r3, r2
 8000394:	6851      	ldr	r1, [r2, #4]
 8000396:	f021 0102 	bic.w	r1, r1, #2
 800039a:	6051      	str	r1, [r2, #4]
 800039c:	b662      	cpsie	i
 800039e:	3301      	adds	r3, #1
 80003a0:	2b06      	cmp	r3, #6
 80003a2:	d1f2      	bne.n	800038a <wake_up_threads+0x2>
 80003a4:	4770      	bx	lr
 80003a6:	bf00      	nop
 80003a8:	20000034 	.word	0x20000034

080003ac <lib_os_init>:
 80003ac:	b508      	push	{r3, lr}
 80003ae:	f7ff ffa7 	bl	8000300 <kernel_init>
 80003b2:	f000 f805 	bl	80003c0 <messages_init>
 80003b6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80003ba:	f000 b8ef 	b.w	800059c <stdio_init>
	...

080003c0 <messages_init>:
 80003c0:	4a0a      	ldr	r2, [pc, #40]	; (80003ec <messages_init+0x2c>)
 80003c2:	2300      	movs	r3, #0
 80003c4:	b510      	push	{r4, lr}
 80003c6:	6013      	str	r3, [r2, #0]
 80003c8:	6053      	str	r3, [r2, #4]
 80003ca:	6093      	str	r3, [r2, #8]
 80003cc:	60d3      	str	r3, [r2, #12]
 80003ce:	6113      	str	r3, [r2, #16]
 80003d0:	6153      	str	r3, [r2, #20]
 80003d2:	4c07      	ldr	r4, [pc, #28]	; (80003f0 <messages_init+0x30>)
 80003d4:	0118      	lsls	r0, r3, #4
 80003d6:	1821      	adds	r1, r4, r0
 80003d8:	3301      	adds	r3, #1
 80003da:	2200      	movs	r2, #0
 80003dc:	2b04      	cmp	r3, #4
 80003de:	604a      	str	r2, [r1, #4]
 80003e0:	5022      	str	r2, [r4, r0]
 80003e2:	60ca      	str	r2, [r1, #12]
 80003e4:	608a      	str	r2, [r1, #8]
 80003e6:	d1f4      	bne.n	80003d2 <messages_init+0x12>
 80003e8:	bd10      	pop	{r4, pc}
 80003ea:	bf00      	nop
 80003ec:	20000100 	.word	0x20000100
 80003f0:	20000118 	.word	0x20000118

080003f4 <strlen_>:
 80003f4:	2300      	movs	r3, #0
 80003f6:	5cc2      	ldrb	r2, [r0, r3]
 80003f8:	b10a      	cbz	r2, 80003fe <strlen_+0xa>
 80003fa:	3301      	adds	r3, #1
 80003fc:	e7fb      	b.n	80003f6 <strlen_+0x2>
 80003fe:	4618      	mov	r0, r3
 8000400:	4770      	bx	lr
	...

08000404 <putc_>:
 8000404:	b538      	push	{r3, r4, r5, lr}
 8000406:	4c06      	ldr	r4, [pc, #24]	; (8000420 <putc_+0x1c>)
 8000408:	4605      	mov	r5, r0
 800040a:	4620      	mov	r0, r4
 800040c:	f000 f8f8 	bl	8000600 <mutex_lock>
 8000410:	4628      	mov	r0, r5
 8000412:	f001 faa1 	bl	8001958 <uart_write>
 8000416:	4620      	mov	r0, r4
 8000418:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800041c:	f000 b90c 	b.w	8000638 <mutex_unlock>
 8000420:	20000158 	.word	0x20000158

08000424 <puts_>:
 8000424:	b510      	push	{r4, lr}
 8000426:	4604      	mov	r4, r0
 8000428:	4807      	ldr	r0, [pc, #28]	; (8000448 <puts_+0x24>)
 800042a:	f000 f8e9 	bl	8000600 <mutex_lock>
 800042e:	3c01      	subs	r4, #1
 8000430:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000434:	b110      	cbz	r0, 800043c <puts_+0x18>
 8000436:	f7ff ffe5 	bl	8000404 <putc_>
 800043a:	e7f9      	b.n	8000430 <puts_+0xc>
 800043c:	4802      	ldr	r0, [pc, #8]	; (8000448 <puts_+0x24>)
 800043e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000442:	f000 b8f9 	b.w	8000638 <mutex_unlock>
 8000446:	bf00      	nop
 8000448:	20000164 	.word	0x20000164

0800044c <puti_>:
 800044c:	b530      	push	{r4, r5, lr}
 800044e:	b085      	sub	sp, #20
 8000450:	1e03      	subs	r3, r0, #0
 8000452:	f04f 0200 	mov.w	r2, #0
 8000456:	bfa8      	it	ge
 8000458:	4614      	movge	r4, r2
 800045a:	f88d 200f 	strb.w	r2, [sp, #15]
 800045e:	bfbc      	itt	lt
 8000460:	425b      	neglt	r3, r3
 8000462:	2401      	movlt	r4, #1
 8000464:	220a      	movs	r2, #10
 8000466:	210a      	movs	r1, #10
 8000468:	fb93 f5f1 	sdiv	r5, r3, r1
 800046c:	fb01 3315 	mls	r3, r1, r5, r3
 8000470:	a801      	add	r0, sp, #4
 8000472:	3330      	adds	r3, #48	; 0x30
 8000474:	5413      	strb	r3, [r2, r0]
 8000476:	1e51      	subs	r1, r2, #1
 8000478:	462b      	mov	r3, r5
 800047a:	b10d      	cbz	r5, 8000480 <puti_+0x34>
 800047c:	460a      	mov	r2, r1
 800047e:	e7f2      	b.n	8000466 <puti_+0x1a>
 8000480:	b12c      	cbz	r4, 800048e <puti_+0x42>
 8000482:	ab04      	add	r3, sp, #16
 8000484:	440b      	add	r3, r1
 8000486:	222d      	movs	r2, #45	; 0x2d
 8000488:	f803 2c0c 	strb.w	r2, [r3, #-12]
 800048c:	460a      	mov	r2, r1
 800048e:	4410      	add	r0, r2
 8000490:	f7ff ffc8 	bl	8000424 <puts_>
 8000494:	b005      	add	sp, #20
 8000496:	bd30      	pop	{r4, r5, pc}

08000498 <putui_>:
 8000498:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800049a:	2300      	movs	r3, #0
 800049c:	f88d 300f 	strb.w	r3, [sp, #15]
 80004a0:	230a      	movs	r3, #10
 80004a2:	240a      	movs	r4, #10
 80004a4:	fbb0 f1f4 	udiv	r1, r0, r4
 80004a8:	fb04 0011 	mls	r0, r4, r1, r0
 80004ac:	aa01      	add	r2, sp, #4
 80004ae:	3030      	adds	r0, #48	; 0x30
 80004b0:	5498      	strb	r0, [r3, r2]
 80004b2:	1e5c      	subs	r4, r3, #1
 80004b4:	4608      	mov	r0, r1
 80004b6:	b109      	cbz	r1, 80004bc <putui_+0x24>
 80004b8:	4623      	mov	r3, r4
 80004ba:	e7f2      	b.n	80004a2 <putui_+0xa>
 80004bc:	18d0      	adds	r0, r2, r3
 80004be:	f7ff ffb1 	bl	8000424 <puts_>
 80004c2:	b004      	add	sp, #16
 80004c4:	bd10      	pop	{r4, pc}

080004c6 <putx_>:
 80004c6:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80004c8:	2300      	movs	r3, #0
 80004ca:	f88d 300f 	strb.w	r3, [sp, #15]
 80004ce:	230a      	movs	r3, #10
 80004d0:	f000 010f 	and.w	r1, r0, #15
 80004d4:	2909      	cmp	r1, #9
 80004d6:	aa01      	add	r2, sp, #4
 80004d8:	bf94      	ite	ls
 80004da:	3130      	addls	r1, #48	; 0x30
 80004dc:	3157      	addhi	r1, #87	; 0x57
 80004de:	0900      	lsrs	r0, r0, #4
 80004e0:	54d1      	strb	r1, [r2, r3]
 80004e2:	f103 31ff 	add.w	r1, r3, #4294967295
 80004e6:	d001      	beq.n	80004ec <putx_+0x26>
 80004e8:	460b      	mov	r3, r1
 80004ea:	e7f1      	b.n	80004d0 <putx_+0xa>
 80004ec:	18d0      	adds	r0, r2, r3
 80004ee:	f7ff ff99 	bl	8000424 <puts_>
 80004f2:	b005      	add	sp, #20
 80004f4:	f85d fb04 	ldr.w	pc, [sp], #4

080004f8 <printf_>:
 80004f8:	b40f      	push	{r0, r1, r2, r3}
 80004fa:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80004fc:	ac06      	add	r4, sp, #24
 80004fe:	4826      	ldr	r0, [pc, #152]	; (8000598 <printf_+0xa0>)
 8000500:	f854 5b04 	ldr.w	r5, [r4], #4
 8000504:	f000 f87c 	bl	8000600 <mutex_lock>
 8000508:	9401      	str	r4, [sp, #4]
 800050a:	2400      	movs	r4, #0
 800050c:	5d28      	ldrb	r0, [r5, r4]
 800050e:	2800      	cmp	r0, #0
 8000510:	d039      	beq.n	8000586 <printf_+0x8e>
 8000512:	2825      	cmp	r0, #37	; 0x25
 8000514:	d003      	beq.n	800051e <printf_+0x26>
 8000516:	f7ff ff75 	bl	8000404 <putc_>
 800051a:	3401      	adds	r4, #1
 800051c:	e7f6      	b.n	800050c <printf_+0x14>
 800051e:	192b      	adds	r3, r5, r4
 8000520:	7858      	ldrb	r0, [r3, #1]
 8000522:	2869      	cmp	r0, #105	; 0x69
 8000524:	d016      	beq.n	8000554 <printf_+0x5c>
 8000526:	d808      	bhi.n	800053a <printf_+0x42>
 8000528:	2825      	cmp	r0, #37	; 0x25
 800052a:	d028      	beq.n	800057e <printf_+0x86>
 800052c:	2863      	cmp	r0, #99	; 0x63
 800052e:	d128      	bne.n	8000582 <printf_+0x8a>
 8000530:	9b01      	ldr	r3, [sp, #4]
 8000532:	1d1a      	adds	r2, r3, #4
 8000534:	9201      	str	r2, [sp, #4]
 8000536:	7818      	ldrb	r0, [r3, #0]
 8000538:	e021      	b.n	800057e <printf_+0x86>
 800053a:	2875      	cmp	r0, #117	; 0x75
 800053c:	d011      	beq.n	8000562 <printf_+0x6a>
 800053e:	2878      	cmp	r0, #120	; 0x78
 8000540:	d016      	beq.n	8000570 <printf_+0x78>
 8000542:	2873      	cmp	r0, #115	; 0x73
 8000544:	d11d      	bne.n	8000582 <printf_+0x8a>
 8000546:	9b01      	ldr	r3, [sp, #4]
 8000548:	1d1a      	adds	r2, r3, #4
 800054a:	6818      	ldr	r0, [r3, #0]
 800054c:	9201      	str	r2, [sp, #4]
 800054e:	f7ff ff69 	bl	8000424 <puts_>
 8000552:	e016      	b.n	8000582 <printf_+0x8a>
 8000554:	9b01      	ldr	r3, [sp, #4]
 8000556:	1d1a      	adds	r2, r3, #4
 8000558:	6818      	ldr	r0, [r3, #0]
 800055a:	9201      	str	r2, [sp, #4]
 800055c:	f7ff ff76 	bl	800044c <puti_>
 8000560:	e00f      	b.n	8000582 <printf_+0x8a>
 8000562:	9b01      	ldr	r3, [sp, #4]
 8000564:	1d1a      	adds	r2, r3, #4
 8000566:	6818      	ldr	r0, [r3, #0]
 8000568:	9201      	str	r2, [sp, #4]
 800056a:	f7ff ff95 	bl	8000498 <putui_>
 800056e:	e008      	b.n	8000582 <printf_+0x8a>
 8000570:	9b01      	ldr	r3, [sp, #4]
 8000572:	1d1a      	adds	r2, r3, #4
 8000574:	6818      	ldr	r0, [r3, #0]
 8000576:	9201      	str	r2, [sp, #4]
 8000578:	f7ff ffa5 	bl	80004c6 <putx_>
 800057c:	e001      	b.n	8000582 <printf_+0x8a>
 800057e:	f7ff ff41 	bl	8000404 <putc_>
 8000582:	3402      	adds	r4, #2
 8000584:	e7c2      	b.n	800050c <printf_+0x14>
 8000586:	4804      	ldr	r0, [pc, #16]	; (8000598 <printf_+0xa0>)
 8000588:	f000 f856 	bl	8000638 <mutex_unlock>
 800058c:	b003      	add	sp, #12
 800058e:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000592:	b004      	add	sp, #16
 8000594:	4770      	bx	lr
 8000596:	bf00      	nop
 8000598:	20000160 	.word	0x20000160

0800059c <stdio_init>:
 800059c:	b510      	push	{r4, lr}
 800059e:	480e      	ldr	r0, [pc, #56]	; (80005d8 <stdio_init+0x3c>)
 80005a0:	f000 f824 	bl	80005ec <mutex_init>
 80005a4:	480d      	ldr	r0, [pc, #52]	; (80005dc <stdio_init+0x40>)
 80005a6:	f000 f821 	bl	80005ec <mutex_init>
 80005aa:	480d      	ldr	r0, [pc, #52]	; (80005e0 <stdio_init+0x44>)
 80005ac:	f000 f81e 	bl	80005ec <mutex_init>
 80005b0:	480c      	ldr	r0, [pc, #48]	; (80005e4 <stdio_init+0x48>)
 80005b2:	f000 f81b 	bl	80005ec <mutex_init>
 80005b6:	2408      	movs	r4, #8
 80005b8:	2020      	movs	r0, #32
 80005ba:	f7ff ff23 	bl	8000404 <putc_>
 80005be:	3c01      	subs	r4, #1
 80005c0:	d1fa      	bne.n	80005b8 <stdio_init+0x1c>
 80005c2:	2420      	movs	r4, #32
 80005c4:	200a      	movs	r0, #10
 80005c6:	f7ff ff1d 	bl	8000404 <putc_>
 80005ca:	3c01      	subs	r4, #1
 80005cc:	d1fa      	bne.n	80005c4 <stdio_init+0x28>
 80005ce:	4806      	ldr	r0, [pc, #24]	; (80005e8 <stdio_init+0x4c>)
 80005d0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005d4:	f7ff bf90 	b.w	80004f8 <printf_>
 80005d8:	20000158 	.word	0x20000158
 80005dc:	2000015c 	.word	0x2000015c
 80005e0:	20000164 	.word	0x20000164
 80005e4:	20000160 	.word	0x20000160
 80005e8:	08002408 	.word	0x08002408

080005ec <mutex_init>:
 80005ec:	b510      	push	{r4, lr}
 80005ee:	4604      	mov	r4, r0
 80005f0:	f7ff fe34 	bl	800025c <sched_off>
 80005f4:	2300      	movs	r3, #0
 80005f6:	6023      	str	r3, [r4, #0]
 80005f8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005fc:	f7ff be30 	b.w	8000260 <sched_on>

08000600 <mutex_lock>:
 8000600:	b513      	push	{r0, r1, r4, lr}
 8000602:	4604      	mov	r4, r0
 8000604:	f7ff fe2a 	bl	800025c <sched_off>
 8000608:	6823      	ldr	r3, [r4, #0]
 800060a:	9301      	str	r3, [sp, #4]
 800060c:	f7ff fe28 	bl	8000260 <sched_on>
 8000610:	9b01      	ldr	r3, [sp, #4]
 8000612:	b10b      	cbz	r3, 8000618 <mutex_lock+0x18>
 8000614:	f7ff fe96 	bl	8000344 <set_wait_state>
 8000618:	9b01      	ldr	r3, [sp, #4]
 800061a:	2b00      	cmp	r3, #0
 800061c:	d1f2      	bne.n	8000604 <mutex_lock+0x4>
 800061e:	f7ff fe1d 	bl	800025c <sched_off>
 8000622:	6823      	ldr	r3, [r4, #0]
 8000624:	9301      	str	r3, [sp, #4]
 8000626:	9b01      	ldr	r3, [sp, #4]
 8000628:	2b00      	cmp	r3, #0
 800062a:	d1eb      	bne.n	8000604 <mutex_lock+0x4>
 800062c:	2301      	movs	r3, #1
 800062e:	6023      	str	r3, [r4, #0]
 8000630:	f7ff fe16 	bl	8000260 <sched_on>
 8000634:	b002      	add	sp, #8
 8000636:	bd10      	pop	{r4, pc}

08000638 <mutex_unlock>:
 8000638:	b508      	push	{r3, lr}
 800063a:	f7ff ffd7 	bl	80005ec <mutex_init>
 800063e:	f7ff fea3 	bl	8000388 <wake_up_threads>
 8000642:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000646:	f7ff be0d 	b.w	8000264 <yield>
	...

0800064c <main>:
 800064c:	b508      	push	{r3, lr}
 800064e:	f001 fd87 	bl	8002160 <lib_low_level_init>
 8000652:	f7ff feab 	bl	80003ac <lib_os_init>
 8000656:	4905      	ldr	r1, [pc, #20]	; (800066c <main+0x20>)
 8000658:	4805      	ldr	r0, [pc, #20]	; (8000670 <main+0x24>)
 800065a:	f44f 7200 	mov.w	r2, #512	; 0x200
 800065e:	2306      	movs	r3, #6
 8000660:	f7ff fe14 	bl	800028c <create_thread>
 8000664:	f7ff fe0c 	bl	8000280 <kernel_start>
 8000668:	2000      	movs	r0, #0
 800066a:	bd08      	pop	{r3, pc}
 800066c:	200007d0 	.word	0x200007d0
 8000670:	08001441 	.word	0x08001441

08000674 <esp8266_send>:
 8000674:	b510      	push	{r4, lr}
 8000676:	1e44      	subs	r4, r0, #1
 8000678:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 800067c:	b110      	cbz	r0, 8000684 <esp8266_send+0x10>
 800067e:	f001 f96b 	bl	8001958 <uart_write>
 8000682:	e7f9      	b.n	8000678 <esp8266_send+0x4>
 8000684:	bd10      	pop	{r4, pc}

08000686 <esp8266_send_uint>:
 8000686:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000688:	2300      	movs	r3, #0
 800068a:	f88d 300f 	strb.w	r3, [sp, #15]
 800068e:	230a      	movs	r3, #10
 8000690:	240a      	movs	r4, #10
 8000692:	fbb0 f1f4 	udiv	r1, r0, r4
 8000696:	fb04 0011 	mls	r0, r4, r1, r0
 800069a:	aa01      	add	r2, sp, #4
 800069c:	3030      	adds	r0, #48	; 0x30
 800069e:	5498      	strb	r0, [r3, r2]
 80006a0:	1e5c      	subs	r4, r3, #1
 80006a2:	4608      	mov	r0, r1
 80006a4:	b109      	cbz	r1, 80006aa <esp8266_send_uint+0x24>
 80006a6:	4623      	mov	r3, r4
 80006a8:	e7f2      	b.n	8000690 <esp8266_send_uint+0xa>
 80006aa:	18d0      	adds	r0, r2, r3
 80006ac:	f7ff ffe2 	bl	8000674 <esp8266_send>
 80006b0:	b004      	add	sp, #16
 80006b2:	bd10      	pop	{r4, pc}

080006b4 <esp8266_find_stream>:
 80006b4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80006b6:	4615      	mov	r5, r2
 80006b8:	460f      	mov	r7, r1
 80006ba:	4606      	mov	r6, r0
 80006bc:	f000 fff0 	bl	80016a0 <timer_get_time>
 80006c0:	4405      	add	r5, r0
 80006c2:	f001 fa01 	bl	8001ac8 <uart_clear_buffer>
 80006c6:	2400      	movs	r4, #0
 80006c8:	f001 f950 	bl	800196c <uart_is_char>
 80006cc:	f64f 72ff 	movw	r2, #65535	; 0xffff
 80006d0:	4290      	cmp	r0, r2
 80006d2:	d00c      	beq.n	80006ee <esp8266_find_stream+0x3a>
 80006d4:	5d32      	ldrb	r2, [r6, r4]
 80006d6:	4282      	cmp	r2, r0
 80006d8:	d108      	bne.n	80006ec <esp8266_find_stream+0x38>
 80006da:	1e7b      	subs	r3, r7, #1
 80006dc:	429c      	cmp	r4, r3
 80006de:	d201      	bcs.n	80006e4 <esp8266_find_stream+0x30>
 80006e0:	3401      	adds	r4, #1
 80006e2:	e004      	b.n	80006ee <esp8266_find_stream+0x3a>
 80006e4:	f001 f9f0 	bl	8001ac8 <uart_clear_buffer>
 80006e8:	2001      	movs	r0, #1
 80006ea:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80006ec:	2400      	movs	r4, #0
 80006ee:	f000 ffd7 	bl	80016a0 <timer_get_time>
 80006f2:	42a8      	cmp	r0, r5
 80006f4:	d3e8      	bcc.n	80006c8 <esp8266_find_stream+0x14>
 80006f6:	f001 f9e7 	bl	8001ac8 <uart_clear_buffer>
 80006fa:	2000      	movs	r0, #0
 80006fc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

08000700 <esp8266_init>:
 8000700:	b510      	push	{r4, lr}
 8000702:	4604      	mov	r4, r0
 8000704:	f640 30b8 	movw	r0, #3000	; 0xbb8
 8000708:	f000 ffd8 	bl	80016bc <timer_delay_ms>
 800070c:	b10c      	cbz	r4, 8000712 <esp8266_init+0x12>
 800070e:	4818      	ldr	r0, [pc, #96]	; (8000770 <esp8266_init+0x70>)
 8000710:	e000      	b.n	8000714 <esp8266_init+0x14>
 8000712:	4818      	ldr	r0, [pc, #96]	; (8000774 <esp8266_init+0x74>)
 8000714:	f7ff ffae 	bl	8000674 <esp8266_send>
 8000718:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 800071c:	f000 ffce 	bl	80016bc <timer_delay_ms>
 8000720:	4815      	ldr	r0, [pc, #84]	; (8000778 <esp8266_init+0x78>)
 8000722:	f7ff ffa7 	bl	8000674 <esp8266_send>
 8000726:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 800072a:	f000 ffc7 	bl	80016bc <timer_delay_ms>
 800072e:	4813      	ldr	r0, [pc, #76]	; (800077c <esp8266_init+0x7c>)
 8000730:	f7ff ffa0 	bl	8000674 <esp8266_send>
 8000734:	4812      	ldr	r0, [pc, #72]	; (8000780 <esp8266_init+0x80>)
 8000736:	f7ff ff9d 	bl	8000674 <esp8266_send>
 800073a:	4812      	ldr	r0, [pc, #72]	; (8000784 <esp8266_init+0x84>)
 800073c:	f7ff ff9a 	bl	8000674 <esp8266_send>
 8000740:	4811      	ldr	r0, [pc, #68]	; (8000788 <esp8266_init+0x88>)
 8000742:	f7ff ff97 	bl	8000674 <esp8266_send>
 8000746:	4811      	ldr	r0, [pc, #68]	; (800078c <esp8266_init+0x8c>)
 8000748:	f7ff ff94 	bl	8000674 <esp8266_send>
 800074c:	4810      	ldr	r0, [pc, #64]	; (8000790 <esp8266_init+0x90>)
 800074e:	2102      	movs	r1, #2
 8000750:	f644 6220 	movw	r2, #20000	; 0x4e20
 8000754:	f7ff ffae 	bl	80006b4 <esp8266_find_stream>
 8000758:	b140      	cbz	r0, 800076c <esp8266_init+0x6c>
 800075a:	b12c      	cbz	r4, 8000768 <esp8266_init+0x68>
 800075c:	480d      	ldr	r0, [pc, #52]	; (8000794 <esp8266_init+0x94>)
 800075e:	f7ff ff89 	bl	8000674 <esp8266_send>
 8000762:	20c8      	movs	r0, #200	; 0xc8
 8000764:	f000 ffaa 	bl	80016bc <timer_delay_ms>
 8000768:	2000      	movs	r0, #0
 800076a:	bd10      	pop	{r4, pc}
 800076c:	2002      	movs	r0, #2
 800076e:	bd10      	pop	{r4, pc}
 8000770:	08002419 	.word	0x08002419
 8000774:	08002427 	.word	0x08002427
 8000778:	08002435 	.word	0x08002435
 800077c:	08002443 	.word	0x08002443
 8000780:	0800244e 	.word	0x0800244e
 8000784:	0800248c 	.word	0x0800248c
 8000788:	0800245b 	.word	0x0800245b
 800078c:	08002464 	.word	0x08002464
 8000790:	080024b4 	.word	0x080024b4
 8000794:	08002468 	.word	0x08002468

08000798 <esp8266_uninit>:
 8000798:	4770      	bx	lr

0800079a <esp8266_get_nonblocking>:
 800079a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800079c:	4606      	mov	r6, r0
 800079e:	460f      	mov	r7, r1
 80007a0:	4615      	mov	r5, r2
 80007a2:	2300      	movs	r3, #0
 80007a4:	42bb      	cmp	r3, r7
 80007a6:	f04f 0400 	mov.w	r4, #0
 80007aa:	d002      	beq.n	80007b2 <esp8266_get_nonblocking+0x18>
 80007ac:	54f4      	strb	r4, [r6, r3]
 80007ae:	3301      	adds	r3, #1
 80007b0:	e7f8      	b.n	80007a4 <esp8266_get_nonblocking+0xa>
 80007b2:	f000 ff75 	bl	80016a0 <timer_get_time>
 80007b6:	4405      	add	r5, r0
 80007b8:	f001 f8d8 	bl	800196c <uart_is_char>
 80007bc:	f64f 73ff 	movw	r3, #65535	; 0xffff
 80007c0:	4298      	cmp	r0, r3
 80007c2:	bf1c      	itt	ne
 80007c4:	5530      	strbne	r0, [r6, r4]
 80007c6:	3401      	addne	r4, #1
 80007c8:	f000 ff6a 	bl	80016a0 <timer_get_time>
 80007cc:	42bc      	cmp	r4, r7
 80007ce:	d207      	bcs.n	80007e0 <esp8266_get_nonblocking+0x46>
 80007d0:	4285      	cmp	r5, r0
 80007d2:	d8f1      	bhi.n	80007b8 <esp8266_get_nonblocking+0x1e>
 80007d4:	42a8      	cmp	r0, r5
 80007d6:	bf94      	ite	ls
 80007d8:	4620      	movls	r0, r4
 80007da:	f04f 30ff 	movhi.w	r0, #4294967295
 80007de:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80007e0:	42a8      	cmp	r0, r5
 80007e2:	bf8c      	ite	hi
 80007e4:	f04f 30ff 	movhi.w	r0, #4294967295
 80007e8:	f06f 0001 	mvnls.w	r0, #1
 80007ec:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

080007f0 <esp8266_connect>:
 80007f0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80007f2:	4606      	mov	r6, r0
 80007f4:	4839      	ldr	r0, [pc, #228]	; (80008dc <esp8266_connect+0xec>)
 80007f6:	460f      	mov	r7, r1
 80007f8:	4614      	mov	r4, r2
 80007fa:	461d      	mov	r5, r3
 80007fc:	f7ff ff3a 	bl	8000674 <esp8266_send>
 8000800:	4630      	mov	r0, r6
 8000802:	f7ff ff37 	bl	8000674 <esp8266_send>
 8000806:	4836      	ldr	r0, [pc, #216]	; (80008e0 <esp8266_connect+0xf0>)
 8000808:	f7ff ff34 	bl	8000674 <esp8266_send>
 800080c:	4638      	mov	r0, r7
 800080e:	f7ff ff3a 	bl	8000686 <esp8266_send_uint>
 8000812:	4834      	ldr	r0, [pc, #208]	; (80008e4 <esp8266_connect+0xf4>)
 8000814:	f7ff ff2e 	bl	8000674 <esp8266_send>
 8000818:	4833      	ldr	r0, [pc, #204]	; (80008e8 <esp8266_connect+0xf8>)
 800081a:	2107      	movs	r1, #7
 800081c:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 8000820:	f7ff ff48 	bl	80006b4 <esp8266_find_stream>
 8000824:	2800      	cmp	r0, #0
 8000826:	d056      	beq.n	80008d6 <esp8266_connect+0xe6>
 8000828:	4830      	ldr	r0, [pc, #192]	; (80008ec <esp8266_connect+0xfc>)
 800082a:	f7ff ff23 	bl	8000674 <esp8266_send>
 800082e:	4628      	mov	r0, r5
 8000830:	f7ff ff29 	bl	8000686 <esp8266_send_uint>
 8000834:	482b      	ldr	r0, [pc, #172]	; (80008e4 <esp8266_connect+0xf4>)
 8000836:	f7ff ff1d 	bl	8000674 <esp8266_send>
 800083a:	482d      	ldr	r0, [pc, #180]	; (80008f0 <esp8266_connect+0x100>)
 800083c:	2101      	movs	r1, #1
 800083e:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 8000842:	f7ff ff37 	bl	80006b4 <esp8266_find_stream>
 8000846:	b108      	cbz	r0, 800084c <esp8266_connect+0x5c>
 8000848:	4425      	add	r5, r4
 800084a:	e007      	b.n	800085c <esp8266_connect+0x6c>
 800084c:	4829      	ldr	r0, [pc, #164]	; (80008f4 <esp8266_connect+0x104>)
 800084e:	f7ff ff11 	bl	8000674 <esp8266_send>
 8000852:	2064      	movs	r0, #100	; 0x64
 8000854:	f000 ff32 	bl	80016bc <timer_delay_ms>
 8000858:	2004      	movs	r0, #4
 800085a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800085c:	42ac      	cmp	r4, r5
 800085e:	d004      	beq.n	800086a <esp8266_connect+0x7a>
 8000860:	f814 0b01 	ldrb.w	r0, [r4], #1
 8000864:	f001 f878 	bl	8001958 <uart_write>
 8000868:	e7f8      	b.n	800085c <esp8266_connect+0x6c>
 800086a:	4823      	ldr	r0, [pc, #140]	; (80008f8 <esp8266_connect+0x108>)
 800086c:	2107      	movs	r1, #7
 800086e:	2264      	movs	r2, #100	; 0x64
 8000870:	f7ff ff20 	bl	80006b4 <esp8266_find_stream>
 8000874:	b938      	cbnz	r0, 8000886 <esp8266_connect+0x96>
 8000876:	481f      	ldr	r0, [pc, #124]	; (80008f4 <esp8266_connect+0x104>)
 8000878:	f7ff fefc 	bl	8000674 <esp8266_send>
 800087c:	2064      	movs	r0, #100	; 0x64
 800087e:	f000 ff1d 	bl	80016bc <timer_delay_ms>
 8000882:	2005      	movs	r0, #5
 8000884:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000886:	481d      	ldr	r0, [pc, #116]	; (80008fc <esp8266_connect+0x10c>)
 8000888:	2105      	movs	r1, #5
 800088a:	2264      	movs	r2, #100	; 0x64
 800088c:	f7ff ff12 	bl	80006b4 <esp8266_find_stream>
 8000890:	b108      	cbz	r0, 8000896 <esp8266_connect+0xa6>
 8000892:	2400      	movs	r4, #0
 8000894:	e007      	b.n	80008a6 <esp8266_connect+0xb6>
 8000896:	4817      	ldr	r0, [pc, #92]	; (80008f4 <esp8266_connect+0x104>)
 8000898:	f7ff feec 	bl	8000674 <esp8266_send>
 800089c:	2064      	movs	r0, #100	; 0x64
 800089e:	f000 ff0d 	bl	80016bc <timer_delay_ms>
 80008a2:	2006      	movs	r0, #6
 80008a4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008a6:	f001 f87d 	bl	80019a4 <uart_read>
 80008aa:	283a      	cmp	r0, #58	; 0x3a
 80008ac:	d004      	beq.n	80008b8 <esp8266_connect+0xc8>
 80008ae:	230a      	movs	r3, #10
 80008b0:	fb03 0404 	mla	r4, r3, r4, r0
 80008b4:	3c30      	subs	r4, #48	; 0x30
 80008b6:	e7f6      	b.n	80008a6 <esp8266_connect+0xb6>
 80008b8:	9907      	ldr	r1, [sp, #28]
 80008ba:	9806      	ldr	r0, [sp, #24]
 80008bc:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 80008c0:	f7ff ff6b 	bl	800079a <esp8266_get_nonblocking>
 80008c4:	480b      	ldr	r0, [pc, #44]	; (80008f4 <esp8266_connect+0x104>)
 80008c6:	f7ff fed5 	bl	8000674 <esp8266_send>
 80008ca:	2064      	movs	r0, #100	; 0x64
 80008cc:	f000 fef6 	bl	80016bc <timer_delay_ms>
 80008d0:	f504 707a 	add.w	r0, r4, #1000	; 0x3e8
 80008d4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008d6:	2003      	movs	r0, #3
 80008d8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008da:	bf00      	nop
 80008dc:	0800247c 	.word	0x0800247c
 80008e0:	08002490 	.word	0x08002490
 80008e4:	08002465 	.word	0x08002465
 80008e8:	080024b4 	.word	0x080024b4
 80008ec:	08002493 	.word	0x08002493
 80008f0:	0800249f 	.word	0x0800249f
 80008f4:	080024a1 	.word	0x080024a1
 80008f8:	080024af 	.word	0x080024af
 80008fc:	080024b7 	.word	0x080024b7

08000900 <motors_uninit>:
 8000900:	b508      	push	{r3, lr}
 8000902:	20c0      	movs	r0, #192	; 0xc0
 8000904:	2100      	movs	r1, #0
 8000906:	2218      	movs	r2, #24
 8000908:	f000 fffa 	bl	8001900 <i2c_write_reg>
 800090c:	20c2      	movs	r0, #194	; 0xc2
 800090e:	2100      	movs	r1, #0
 8000910:	2218      	movs	r2, #24
 8000912:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000916:	f000 bff3 	b.w	8001900 <i2c_write_reg>
	...

0800091c <motors_update>:
 800091c:	4a2f      	ldr	r2, [pc, #188]	; (80009dc <motors_update+0xc0>)
 800091e:	b538      	push	{r3, r4, r5, lr}
 8000920:	6813      	ldr	r3, [r2, #0]
 8000922:	6854      	ldr	r4, [r2, #4]
 8000924:	b2db      	uxtb	r3, r3
 8000926:	b25a      	sxtb	r2, r3
 8000928:	2a2c      	cmp	r2, #44	; 0x2c
 800092a:	b2e4      	uxtb	r4, r4
 800092c:	dc04      	bgt.n	8000938 <motors_update+0x1c>
 800092e:	f112 0f2c 	cmn.w	r2, #44	; 0x2c
 8000932:	bfb8      	it	lt
 8000934:	23d4      	movlt	r3, #212	; 0xd4
 8000936:	e000      	b.n	800093a <motors_update+0x1e>
 8000938:	232c      	movs	r3, #44	; 0x2c
 800093a:	b262      	sxtb	r2, r4
 800093c:	2a2c      	cmp	r2, #44	; 0x2c
 800093e:	dc04      	bgt.n	800094a <motors_update+0x2e>
 8000940:	f112 0f2c 	cmn.w	r2, #44	; 0x2c
 8000944:	bfb8      	it	lt
 8000946:	24d4      	movlt	r4, #212	; 0xd4
 8000948:	e000      	b.n	800094c <motors_update+0x30>
 800094a:	242c      	movs	r4, #44	; 0x2c
 800094c:	b1b3      	cbz	r3, 800097c <motors_update+0x60>
 800094e:	b25a      	sxtb	r2, r3
 8000950:	2a00      	cmp	r2, #0
 8000952:	dd07      	ble.n	8000964 <motors_update+0x48>
 8000954:	2a05      	cmp	r2, #5
 8000956:	bfd8      	it	le
 8000958:	2306      	movle	r3, #6
 800095a:	b25d      	sxtb	r5, r3
 800095c:	00ad      	lsls	r5, r5, #2
 800095e:	f045 0502 	orr.w	r5, r5, #2
 8000962:	e009      	b.n	8000978 <motors_update+0x5c>
 8000964:	425b      	negs	r3, r3
 8000966:	b2db      	uxtb	r3, r3
 8000968:	b25a      	sxtb	r2, r3
 800096a:	2a05      	cmp	r2, #5
 800096c:	bfd8      	it	le
 800096e:	2306      	movle	r3, #6
 8000970:	b25d      	sxtb	r5, r3
 8000972:	00ad      	lsls	r5, r5, #2
 8000974:	f045 0501 	orr.w	r5, r5, #1
 8000978:	b2ed      	uxtb	r5, r5
 800097a:	e000      	b.n	800097e <motors_update+0x62>
 800097c:	251b      	movs	r5, #27
 800097e:	2100      	movs	r1, #0
 8000980:	460a      	mov	r2, r1
 8000982:	20c0      	movs	r0, #192	; 0xc0
 8000984:	f000 ffbc 	bl	8001900 <i2c_write_reg>
 8000988:	20c0      	movs	r0, #192	; 0xc0
 800098a:	2100      	movs	r1, #0
 800098c:	462a      	mov	r2, r5
 800098e:	f000 ffb7 	bl	8001900 <i2c_write_reg>
 8000992:	b1b4      	cbz	r4, 80009c2 <motors_update+0xa6>
 8000994:	b263      	sxtb	r3, r4
 8000996:	2b00      	cmp	r3, #0
 8000998:	dd07      	ble.n	80009aa <motors_update+0x8e>
 800099a:	2b05      	cmp	r3, #5
 800099c:	bfd8      	it	le
 800099e:	2406      	movle	r4, #6
 80009a0:	b264      	sxtb	r4, r4
 80009a2:	00a4      	lsls	r4, r4, #2
 80009a4:	f044 0401 	orr.w	r4, r4, #1
 80009a8:	e009      	b.n	80009be <motors_update+0xa2>
 80009aa:	4264      	negs	r4, r4
 80009ac:	b2e4      	uxtb	r4, r4
 80009ae:	b263      	sxtb	r3, r4
 80009b0:	2b05      	cmp	r3, #5
 80009b2:	bfd8      	it	le
 80009b4:	2406      	movle	r4, #6
 80009b6:	b264      	sxtb	r4, r4
 80009b8:	00a4      	lsls	r4, r4, #2
 80009ba:	f044 0402 	orr.w	r4, r4, #2
 80009be:	b2e4      	uxtb	r4, r4
 80009c0:	e000      	b.n	80009c4 <motors_update+0xa8>
 80009c2:	241b      	movs	r4, #27
 80009c4:	2100      	movs	r1, #0
 80009c6:	460a      	mov	r2, r1
 80009c8:	20c2      	movs	r0, #194	; 0xc2
 80009ca:	f000 ff99 	bl	8001900 <i2c_write_reg>
 80009ce:	4622      	mov	r2, r4
 80009d0:	20c2      	movs	r0, #194	; 0xc2
 80009d2:	2100      	movs	r1, #0
 80009d4:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80009d8:	f000 bf92 	b.w	8001900 <i2c_write_reg>
 80009dc:	200005c0 	.word	0x200005c0

080009e0 <motors_init>:
 80009e0:	b510      	push	{r4, lr}
 80009e2:	4b04      	ldr	r3, [pc, #16]	; (80009f4 <motors_init+0x14>)
 80009e4:	2400      	movs	r4, #0
 80009e6:	601c      	str	r4, [r3, #0]
 80009e8:	605c      	str	r4, [r3, #4]
 80009ea:	f7ff ff97 	bl	800091c <motors_update>
 80009ee:	4620      	mov	r0, r4
 80009f0:	bd10      	pop	{r4, pc}
 80009f2:	bf00      	nop
 80009f4:	200005c0 	.word	0x200005c0

080009f8 <rgb_i2c_delay>:
 80009f8:	bf00      	nop
 80009fa:	4770      	bx	lr

080009fc <RGBSetLowSDA>:
 80009fc:	b513      	push	{r0, r1, r4, lr}
 80009fe:	2301      	movs	r3, #1
 8000a00:	2203      	movs	r2, #3
 8000a02:	24f0      	movs	r4, #240	; 0xf0
 8000a04:	f88d 3004 	strb.w	r3, [sp, #4]
 8000a08:	f88d 3006 	strb.w	r3, [sp, #6]
 8000a0c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000a10:	2300      	movs	r3, #0
 8000a12:	4669      	mov	r1, sp
 8000a14:	f88d 2005 	strb.w	r2, [sp, #5]
 8000a18:	f88d 3007 	strb.w	r3, [sp, #7]
 8000a1c:	9400      	str	r4, [sp, #0]
 8000a1e:	f001 fbac 	bl	800217a <GPIO_Init>
 8000a22:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000a26:	851c      	strh	r4, [r3, #40]	; 0x28
 8000a28:	f7ff ffe6 	bl	80009f8 <rgb_i2c_delay>
 8000a2c:	b002      	add	sp, #8
 8000a2e:	bd10      	pop	{r4, pc}

08000a30 <RGBSetHighSDA>:
 8000a30:	b513      	push	{r0, r1, r4, lr}
 8000a32:	2300      	movs	r3, #0
 8000a34:	2203      	movs	r2, #3
 8000a36:	24f0      	movs	r4, #240	; 0xf0
 8000a38:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000a3c:	4669      	mov	r1, sp
 8000a3e:	f88d 3004 	strb.w	r3, [sp, #4]
 8000a42:	f88d 2005 	strb.w	r2, [sp, #5]
 8000a46:	f88d 3007 	strb.w	r3, [sp, #7]
 8000a4a:	9400      	str	r4, [sp, #0]
 8000a4c:	f001 fb95 	bl	800217a <GPIO_Init>
 8000a50:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000a54:	619c      	str	r4, [r3, #24]
 8000a56:	f7ff ffcf 	bl	80009f8 <rgb_i2c_delay>
 8000a5a:	b002      	add	sp, #8
 8000a5c:	bd10      	pop	{r4, pc}
	...

08000a60 <RGBSetLowSCL>:
 8000a60:	4b02      	ldr	r3, [pc, #8]	; (8000a6c <RGBSetLowSCL+0xc>)
 8000a62:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8000a66:	851a      	strh	r2, [r3, #40]	; 0x28
 8000a68:	f7ff bfc6 	b.w	80009f8 <rgb_i2c_delay>
 8000a6c:	48000800 	.word	0x48000800

08000a70 <RGBSetHighSCL>:
 8000a70:	4b02      	ldr	r3, [pc, #8]	; (8000a7c <RGBSetHighSCL+0xc>)
 8000a72:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8000a76:	619a      	str	r2, [r3, #24]
 8000a78:	f7ff bfbe 	b.w	80009f8 <rgb_i2c_delay>
 8000a7c:	48000800 	.word	0x48000800

08000a80 <rgb_i2c_init>:
 8000a80:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8000a82:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000a86:	2400      	movs	r4, #0
 8000a88:	9300      	str	r3, [sp, #0]
 8000a8a:	2603      	movs	r6, #3
 8000a8c:	2301      	movs	r3, #1
 8000a8e:	4669      	mov	r1, sp
 8000a90:	4812      	ldr	r0, [pc, #72]	; (8000adc <rgb_i2c_init+0x5c>)
 8000a92:	f88d 3004 	strb.w	r3, [sp, #4]
 8000a96:	25f0      	movs	r5, #240	; 0xf0
 8000a98:	f88d 6005 	strb.w	r6, [sp, #5]
 8000a9c:	f88d 4006 	strb.w	r4, [sp, #6]
 8000aa0:	f88d 4007 	strb.w	r4, [sp, #7]
 8000aa4:	f001 fb69 	bl	800217a <GPIO_Init>
 8000aa8:	4669      	mov	r1, sp
 8000aaa:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000aae:	9500      	str	r5, [sp, #0]
 8000ab0:	f88d 4004 	strb.w	r4, [sp, #4]
 8000ab4:	f88d 6005 	strb.w	r6, [sp, #5]
 8000ab8:	f88d 4007 	strb.w	r4, [sp, #7]
 8000abc:	f001 fb5d 	bl	800217a <GPIO_Init>
 8000ac0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000ac4:	4629      	mov	r1, r5
 8000ac6:	f001 fb9e 	bl	8002206 <GPIO_SetBits>
 8000aca:	f7ff ffd1 	bl	8000a70 <RGBSetHighSCL>
 8000ace:	f7ff ff95 	bl	80009fc <RGBSetLowSDA>
 8000ad2:	f7ff ffad 	bl	8000a30 <RGBSetHighSDA>
 8000ad6:	b002      	add	sp, #8
 8000ad8:	bd70      	pop	{r4, r5, r6, pc}
 8000ada:	bf00      	nop
 8000adc:	48000800 	.word	0x48000800

08000ae0 <rgb_i2cStart>:
 8000ae0:	b508      	push	{r3, lr}
 8000ae2:	f7ff ffc5 	bl	8000a70 <RGBSetHighSCL>
 8000ae6:	f7ff ffa3 	bl	8000a30 <RGBSetHighSDA>
 8000aea:	f7ff ffc1 	bl	8000a70 <RGBSetHighSCL>
 8000aee:	f7ff ff85 	bl	80009fc <RGBSetLowSDA>
 8000af2:	f7ff ffb5 	bl	8000a60 <RGBSetLowSCL>
 8000af6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000afa:	f7ff bf99 	b.w	8000a30 <RGBSetHighSDA>

08000afe <rgb_i2cStop>:
 8000afe:	b508      	push	{r3, lr}
 8000b00:	f7ff ffae 	bl	8000a60 <RGBSetLowSCL>
 8000b04:	f7ff ff7a 	bl	80009fc <RGBSetLowSDA>
 8000b08:	f7ff ffb2 	bl	8000a70 <RGBSetHighSCL>
 8000b0c:	f7ff ff76 	bl	80009fc <RGBSetLowSDA>
 8000b10:	f7ff ffae 	bl	8000a70 <RGBSetHighSCL>
 8000b14:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000b18:	f7ff bf8a 	b.w	8000a30 <RGBSetHighSDA>

08000b1c <rgb_i2cWrite>:
 8000b1c:	b538      	push	{r3, r4, r5, lr}
 8000b1e:	4604      	mov	r4, r0
 8000b20:	2508      	movs	r5, #8
 8000b22:	f7ff ff9d 	bl	8000a60 <RGBSetLowSCL>
 8000b26:	0623      	lsls	r3, r4, #24
 8000b28:	d502      	bpl.n	8000b30 <rgb_i2cWrite+0x14>
 8000b2a:	f7ff ff81 	bl	8000a30 <RGBSetHighSDA>
 8000b2e:	e001      	b.n	8000b34 <rgb_i2cWrite+0x18>
 8000b30:	f7ff ff64 	bl	80009fc <RGBSetLowSDA>
 8000b34:	3d01      	subs	r5, #1
 8000b36:	f7ff ff9b 	bl	8000a70 <RGBSetHighSCL>
 8000b3a:	0064      	lsls	r4, r4, #1
 8000b3c:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8000b40:	b2e4      	uxtb	r4, r4
 8000b42:	d1ee      	bne.n	8000b22 <rgb_i2cWrite+0x6>
 8000b44:	f7ff ff8c 	bl	8000a60 <RGBSetLowSCL>
 8000b48:	f7ff ff72 	bl	8000a30 <RGBSetHighSDA>
 8000b4c:	f7ff ff90 	bl	8000a70 <RGBSetHighSCL>
 8000b50:	f7ff ff86 	bl	8000a60 <RGBSetLowSCL>
 8000b54:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000b58:	f7ff bf4e 	b.w	80009f8 <rgb_i2c_delay>

08000b5c <rgb_i2cRead>:
 8000b5c:	2300      	movs	r3, #0
 8000b5e:	b570      	push	{r4, r5, r6, lr}
 8000b60:	700b      	strb	r3, [r1, #0]
 8000b62:	704b      	strb	r3, [r1, #1]
 8000b64:	708b      	strb	r3, [r1, #2]
 8000b66:	70cb      	strb	r3, [r1, #3]
 8000b68:	4606      	mov	r6, r0
 8000b6a:	460c      	mov	r4, r1
 8000b6c:	f7ff ff78 	bl	8000a60 <RGBSetLowSCL>
 8000b70:	f7ff ff5e 	bl	8000a30 <RGBSetHighSDA>
 8000b74:	2508      	movs	r5, #8
 8000b76:	2300      	movs	r3, #0
 8000b78:	5ce2      	ldrb	r2, [r4, r3]
 8000b7a:	0052      	lsls	r2, r2, #1
 8000b7c:	54e2      	strb	r2, [r4, r3]
 8000b7e:	3301      	adds	r3, #1
 8000b80:	2b04      	cmp	r3, #4
 8000b82:	d1f9      	bne.n	8000b78 <rgb_i2cRead+0x1c>
 8000b84:	f7ff ff74 	bl	8000a70 <RGBSetHighSCL>
 8000b88:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000b8c:	8a1b      	ldrh	r3, [r3, #16]
 8000b8e:	b29b      	uxth	r3, r3
 8000b90:	06da      	lsls	r2, r3, #27
 8000b92:	d503      	bpl.n	8000b9c <rgb_i2cRead+0x40>
 8000b94:	7822      	ldrb	r2, [r4, #0]
 8000b96:	f042 0201 	orr.w	r2, r2, #1
 8000b9a:	7022      	strb	r2, [r4, #0]
 8000b9c:	0698      	lsls	r0, r3, #26
 8000b9e:	d503      	bpl.n	8000ba8 <rgb_i2cRead+0x4c>
 8000ba0:	7862      	ldrb	r2, [r4, #1]
 8000ba2:	f042 0201 	orr.w	r2, r2, #1
 8000ba6:	7062      	strb	r2, [r4, #1]
 8000ba8:	0659      	lsls	r1, r3, #25
 8000baa:	d503      	bpl.n	8000bb4 <rgb_i2cRead+0x58>
 8000bac:	78a2      	ldrb	r2, [r4, #2]
 8000bae:	f042 0201 	orr.w	r2, r2, #1
 8000bb2:	70a2      	strb	r2, [r4, #2]
 8000bb4:	061a      	lsls	r2, r3, #24
 8000bb6:	d503      	bpl.n	8000bc0 <rgb_i2cRead+0x64>
 8000bb8:	78e3      	ldrb	r3, [r4, #3]
 8000bba:	f043 0301 	orr.w	r3, r3, #1
 8000bbe:	70e3      	strb	r3, [r4, #3]
 8000bc0:	f7ff ff4e 	bl	8000a60 <RGBSetLowSCL>
 8000bc4:	3d01      	subs	r5, #1
 8000bc6:	d1d6      	bne.n	8000b76 <rgb_i2cRead+0x1a>
 8000bc8:	b10e      	cbz	r6, 8000bce <rgb_i2cRead+0x72>
 8000bca:	f7ff ff17 	bl	80009fc <RGBSetLowSDA>
 8000bce:	f7ff ff4f 	bl	8000a70 <RGBSetHighSCL>
 8000bd2:	f7ff ff45 	bl	8000a60 <RGBSetLowSCL>
 8000bd6:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000bda:	f7ff bf0d 	b.w	80009f8 <rgb_i2c_delay>

08000bde <rgb_i2c_write_reg>:
 8000bde:	b570      	push	{r4, r5, r6, lr}
 8000be0:	4605      	mov	r5, r0
 8000be2:	460c      	mov	r4, r1
 8000be4:	4616      	mov	r6, r2
 8000be6:	f7ff ff7b 	bl	8000ae0 <rgb_i2cStart>
 8000bea:	4628      	mov	r0, r5
 8000bec:	f7ff ff96 	bl	8000b1c <rgb_i2cWrite>
 8000bf0:	4620      	mov	r0, r4
 8000bf2:	f7ff ff93 	bl	8000b1c <rgb_i2cWrite>
 8000bf6:	4630      	mov	r0, r6
 8000bf8:	f7ff ff90 	bl	8000b1c <rgb_i2cWrite>
 8000bfc:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000c00:	f7ff bf7d 	b.w	8000afe <rgb_i2cStop>

08000c04 <rgb_i2c_read_reg>:
 8000c04:	b570      	push	{r4, r5, r6, lr}
 8000c06:	4604      	mov	r4, r0
 8000c08:	460d      	mov	r5, r1
 8000c0a:	4616      	mov	r6, r2
 8000c0c:	f7ff ff68 	bl	8000ae0 <rgb_i2cStart>
 8000c10:	4620      	mov	r0, r4
 8000c12:	f7ff ff83 	bl	8000b1c <rgb_i2cWrite>
 8000c16:	4628      	mov	r0, r5
 8000c18:	f7ff ff80 	bl	8000b1c <rgb_i2cWrite>
 8000c1c:	f7ff ff60 	bl	8000ae0 <rgb_i2cStart>
 8000c20:	f044 0001 	orr.w	r0, r4, #1
 8000c24:	f7ff ff7a 	bl	8000b1c <rgb_i2cWrite>
 8000c28:	4631      	mov	r1, r6
 8000c2a:	2000      	movs	r0, #0
 8000c2c:	f7ff ff96 	bl	8000b5c <rgb_i2cRead>
 8000c30:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000c34:	f7ff bf63 	b.w	8000afe <rgb_i2cStop>

08000c38 <lsm9ds0_uninit>:
 8000c38:	b508      	push	{r3, lr}
 8000c3a:	20d4      	movs	r0, #212	; 0xd4
 8000c3c:	2120      	movs	r1, #32
 8000c3e:	2200      	movs	r2, #0
 8000c40:	f000 fe5e 	bl	8001900 <i2c_write_reg>
 8000c44:	203c      	movs	r0, #60	; 0x3c
 8000c46:	2120      	movs	r1, #32
 8000c48:	2200      	movs	r2, #0
 8000c4a:	f000 fe59 	bl	8001900 <i2c_write_reg>
 8000c4e:	203c      	movs	r0, #60	; 0x3c
 8000c50:	2124      	movs	r1, #36	; 0x24
 8000c52:	2200      	movs	r2, #0
 8000c54:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000c58:	f000 be52 	b.w	8001900 <i2c_write_reg>

08000c5c <lsm9ds0_read>:
 8000c5c:	b538      	push	{r3, r4, r5, lr}
 8000c5e:	2128      	movs	r1, #40	; 0x28
 8000c60:	20d4      	movs	r0, #212	; 0xd4
 8000c62:	f000 fe60 	bl	8001926 <i2c_read_reg>
 8000c66:	2129      	movs	r1, #41	; 0x29
 8000c68:	4604      	mov	r4, r0
 8000c6a:	20d4      	movs	r0, #212	; 0xd4
 8000c6c:	f000 fe5b 	bl	8001926 <i2c_read_reg>
 8000c70:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
 8000c74:	4c46      	ldr	r4, [pc, #280]	; (8000d90 <lsm9ds0_read+0x134>)
 8000c76:	b280      	uxth	r0, r0
 8000c78:	81a0      	strh	r0, [r4, #12]
 8000c7a:	89a2      	ldrh	r2, [r4, #12]
 8000c7c:	8a63      	ldrh	r3, [r4, #18]
 8000c7e:	b292      	uxth	r2, r2
 8000c80:	b29b      	uxth	r3, r3
 8000c82:	1ad3      	subs	r3, r2, r3
 8000c84:	b29b      	uxth	r3, r3
 8000c86:	212a      	movs	r1, #42	; 0x2a
 8000c88:	20d4      	movs	r0, #212	; 0xd4
 8000c8a:	8323      	strh	r3, [r4, #24]
 8000c8c:	f000 fe4b 	bl	8001926 <i2c_read_reg>
 8000c90:	212b      	movs	r1, #43	; 0x2b
 8000c92:	4605      	mov	r5, r0
 8000c94:	20d4      	movs	r0, #212	; 0xd4
 8000c96:	f000 fe46 	bl	8001926 <i2c_read_reg>
 8000c9a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000c9e:	b285      	uxth	r5, r0
 8000ca0:	81e5      	strh	r5, [r4, #14]
 8000ca2:	89e2      	ldrh	r2, [r4, #14]
 8000ca4:	8aa3      	ldrh	r3, [r4, #20]
 8000ca6:	b292      	uxth	r2, r2
 8000ca8:	b29b      	uxth	r3, r3
 8000caa:	1ad3      	subs	r3, r2, r3
 8000cac:	b29b      	uxth	r3, r3
 8000cae:	212c      	movs	r1, #44	; 0x2c
 8000cb0:	20d4      	movs	r0, #212	; 0xd4
 8000cb2:	8363      	strh	r3, [r4, #26]
 8000cb4:	f000 fe37 	bl	8001926 <i2c_read_reg>
 8000cb8:	212d      	movs	r1, #45	; 0x2d
 8000cba:	4605      	mov	r5, r0
 8000cbc:	20d4      	movs	r0, #212	; 0xd4
 8000cbe:	f000 fe32 	bl	8001926 <i2c_read_reg>
 8000cc2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000cc6:	b285      	uxth	r5, r0
 8000cc8:	8225      	strh	r5, [r4, #16]
 8000cca:	8a22      	ldrh	r2, [r4, #16]
 8000ccc:	8ae3      	ldrh	r3, [r4, #22]
 8000cce:	b292      	uxth	r2, r2
 8000cd0:	b29b      	uxth	r3, r3
 8000cd2:	1ad3      	subs	r3, r2, r3
 8000cd4:	b29b      	uxth	r3, r3
 8000cd6:	2108      	movs	r1, #8
 8000cd8:	203c      	movs	r0, #60	; 0x3c
 8000cda:	83a3      	strh	r3, [r4, #28]
 8000cdc:	f000 fe23 	bl	8001926 <i2c_read_reg>
 8000ce0:	2109      	movs	r1, #9
 8000ce2:	4605      	mov	r5, r0
 8000ce4:	203c      	movs	r0, #60	; 0x3c
 8000ce6:	f000 fe1e 	bl	8001926 <i2c_read_reg>
 8000cea:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000cee:	b285      	uxth	r5, r0
 8000cf0:	210a      	movs	r1, #10
 8000cf2:	203c      	movs	r0, #60	; 0x3c
 8000cf4:	80e5      	strh	r5, [r4, #6]
 8000cf6:	f000 fe16 	bl	8001926 <i2c_read_reg>
 8000cfa:	210b      	movs	r1, #11
 8000cfc:	4605      	mov	r5, r0
 8000cfe:	203c      	movs	r0, #60	; 0x3c
 8000d00:	f000 fe11 	bl	8001926 <i2c_read_reg>
 8000d04:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000d08:	b285      	uxth	r5, r0
 8000d0a:	210c      	movs	r1, #12
 8000d0c:	203c      	movs	r0, #60	; 0x3c
 8000d0e:	8125      	strh	r5, [r4, #8]
 8000d10:	f000 fe09 	bl	8001926 <i2c_read_reg>
 8000d14:	210d      	movs	r1, #13
 8000d16:	4605      	mov	r5, r0
 8000d18:	203c      	movs	r0, #60	; 0x3c
 8000d1a:	f000 fe04 	bl	8001926 <i2c_read_reg>
 8000d1e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000d22:	b285      	uxth	r5, r0
 8000d24:	2128      	movs	r1, #40	; 0x28
 8000d26:	203c      	movs	r0, #60	; 0x3c
 8000d28:	8165      	strh	r5, [r4, #10]
 8000d2a:	f000 fdfc 	bl	8001926 <i2c_read_reg>
 8000d2e:	2129      	movs	r1, #41	; 0x29
 8000d30:	4605      	mov	r5, r0
 8000d32:	203c      	movs	r0, #60	; 0x3c
 8000d34:	f000 fdf7 	bl	8001926 <i2c_read_reg>
 8000d38:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000d3c:	b285      	uxth	r5, r0
 8000d3e:	212a      	movs	r1, #42	; 0x2a
 8000d40:	203c      	movs	r0, #60	; 0x3c
 8000d42:	8025      	strh	r5, [r4, #0]
 8000d44:	f000 fdef 	bl	8001926 <i2c_read_reg>
 8000d48:	212b      	movs	r1, #43	; 0x2b
 8000d4a:	4605      	mov	r5, r0
 8000d4c:	203c      	movs	r0, #60	; 0x3c
 8000d4e:	f000 fdea 	bl	8001926 <i2c_read_reg>
 8000d52:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000d56:	b285      	uxth	r5, r0
 8000d58:	212c      	movs	r1, #44	; 0x2c
 8000d5a:	203c      	movs	r0, #60	; 0x3c
 8000d5c:	8065      	strh	r5, [r4, #2]
 8000d5e:	f000 fde2 	bl	8001926 <i2c_read_reg>
 8000d62:	212d      	movs	r1, #45	; 0x2d
 8000d64:	4605      	mov	r5, r0
 8000d66:	203c      	movs	r0, #60	; 0x3c
 8000d68:	f000 fddd 	bl	8001926 <i2c_read_reg>
 8000d6c:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000d70:	b285      	uxth	r5, r0
 8000d72:	2105      	movs	r1, #5
 8000d74:	203c      	movs	r0, #60	; 0x3c
 8000d76:	80a5      	strh	r5, [r4, #4]
 8000d78:	f000 fdd5 	bl	8001926 <i2c_read_reg>
 8000d7c:	2106      	movs	r1, #6
 8000d7e:	4605      	mov	r5, r0
 8000d80:	203c      	movs	r0, #60	; 0x3c
 8000d82:	f000 fdd0 	bl	8001926 <i2c_read_reg>
 8000d86:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000d8a:	b285      	uxth	r5, r0
 8000d8c:	83e5      	strh	r5, [r4, #30]
 8000d8e:	bd38      	pop	{r3, r4, r5, pc}
 8000d90:	20000368 	.word	0x20000368

08000d94 <lsm9ds0_calibrate>:
 8000d94:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000d98:	2500      	movs	r5, #0
 8000d9a:	4681      	mov	r9, r0
 8000d9c:	462f      	mov	r7, r5
 8000d9e:	46a8      	mov	r8, r5
 8000da0:	462c      	mov	r4, r5
 8000da2:	454c      	cmp	r4, r9
 8000da4:	4e10      	ldr	r6, [pc, #64]	; (8000de8 <lsm9ds0_calibrate+0x54>)
 8000da6:	d00f      	beq.n	8000dc8 <lsm9ds0_calibrate+0x34>
 8000da8:	f7ff ff58 	bl	8000c5c <lsm9ds0_read>
 8000dac:	89b3      	ldrh	r3, [r6, #12]
 8000dae:	fa08 f883 	sxtah	r8, r8, r3
 8000db2:	89f3      	ldrh	r3, [r6, #14]
 8000db4:	fa07 f783 	sxtah	r7, r7, r3
 8000db8:	8a33      	ldrh	r3, [r6, #16]
 8000dba:	200a      	movs	r0, #10
 8000dbc:	fa05 f583 	sxtah	r5, r5, r3
 8000dc0:	3401      	adds	r4, #1
 8000dc2:	f000 fc7b 	bl	80016bc <timer_delay_ms>
 8000dc6:	e7ec      	b.n	8000da2 <lsm9ds0_calibrate+0xe>
 8000dc8:	fb98 f8f4 	sdiv	r8, r8, r4
 8000dcc:	fb97 f7f4 	sdiv	r7, r7, r4
 8000dd0:	fb95 f4f4 	sdiv	r4, r5, r4
 8000dd4:	fa1f f888 	uxth.w	r8, r8
 8000dd8:	b2bf      	uxth	r7, r7
 8000dda:	b2a4      	uxth	r4, r4
 8000ddc:	f8a6 8012 	strh.w	r8, [r6, #18]
 8000de0:	82b7      	strh	r7, [r6, #20]
 8000de2:	82f4      	strh	r4, [r6, #22]
 8000de4:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000de8:	20000368 	.word	0x20000368

08000dec <lsm9ds0_init>:
 8000dec:	4b29      	ldr	r3, [pc, #164]	; (8000e94 <lsm9ds0_init+0xa8>)
 8000dee:	b570      	push	{r4, r5, r6, lr}
 8000df0:	210f      	movs	r1, #15
 8000df2:	2400      	movs	r4, #0
 8000df4:	4606      	mov	r6, r0
 8000df6:	20d4      	movs	r0, #212	; 0xd4
 8000df8:	801c      	strh	r4, [r3, #0]
 8000dfa:	805c      	strh	r4, [r3, #2]
 8000dfc:	809c      	strh	r4, [r3, #4]
 8000dfe:	80dc      	strh	r4, [r3, #6]
 8000e00:	811c      	strh	r4, [r3, #8]
 8000e02:	815c      	strh	r4, [r3, #10]
 8000e04:	819c      	strh	r4, [r3, #12]
 8000e06:	81dc      	strh	r4, [r3, #14]
 8000e08:	821c      	strh	r4, [r3, #16]
 8000e0a:	831c      	strh	r4, [r3, #24]
 8000e0c:	835c      	strh	r4, [r3, #26]
 8000e0e:	839c      	strh	r4, [r3, #28]
 8000e10:	83dc      	strh	r4, [r3, #30]
 8000e12:	f000 fd88 	bl	8001926 <i2c_read_reg>
 8000e16:	28d4      	cmp	r0, #212	; 0xd4
 8000e18:	4605      	mov	r5, r0
 8000e1a:	d137      	bne.n	8000e8c <lsm9ds0_init+0xa0>
 8000e1c:	203c      	movs	r0, #60	; 0x3c
 8000e1e:	210f      	movs	r1, #15
 8000e20:	f000 fd81 	bl	8001926 <i2c_read_reg>
 8000e24:	2849      	cmp	r0, #73	; 0x49
 8000e26:	d133      	bne.n	8000e90 <lsm9ds0_init+0xa4>
 8000e28:	4628      	mov	r0, r5
 8000e2a:	2120      	movs	r1, #32
 8000e2c:	22ff      	movs	r2, #255	; 0xff
 8000e2e:	f000 fd67 	bl	8001900 <i2c_write_reg>
 8000e32:	4628      	mov	r0, r5
 8000e34:	2123      	movs	r1, #35	; 0x23
 8000e36:	2218      	movs	r2, #24
 8000e38:	f000 fd62 	bl	8001900 <i2c_write_reg>
 8000e3c:	203c      	movs	r0, #60	; 0x3c
 8000e3e:	211f      	movs	r1, #31
 8000e40:	4622      	mov	r2, r4
 8000e42:	f000 fd5d 	bl	8001900 <i2c_write_reg>
 8000e46:	203c      	movs	r0, #60	; 0x3c
 8000e48:	2120      	movs	r1, #32
 8000e4a:	2267      	movs	r2, #103	; 0x67
 8000e4c:	f000 fd58 	bl	8001900 <i2c_write_reg>
 8000e50:	203c      	movs	r0, #60	; 0x3c
 8000e52:	2121      	movs	r1, #33	; 0x21
 8000e54:	4622      	mov	r2, r4
 8000e56:	f000 fd53 	bl	8001900 <i2c_write_reg>
 8000e5a:	203c      	movs	r0, #60	; 0x3c
 8000e5c:	2124      	movs	r1, #36	; 0x24
 8000e5e:	22f4      	movs	r2, #244	; 0xf4
 8000e60:	f000 fd4e 	bl	8001900 <i2c_write_reg>
 8000e64:	203c      	movs	r0, #60	; 0x3c
 8000e66:	2125      	movs	r1, #37	; 0x25
 8000e68:	4622      	mov	r2, r4
 8000e6a:	f000 fd49 	bl	8001900 <i2c_write_reg>
 8000e6e:	203c      	movs	r0, #60	; 0x3c
 8000e70:	2126      	movs	r1, #38	; 0x26
 8000e72:	2280      	movs	r2, #128	; 0x80
 8000e74:	f000 fd44 	bl	8001900 <i2c_write_reg>
 8000e78:	f7ff fef0 	bl	8000c5c <lsm9ds0_read>
 8000e7c:	b116      	cbz	r6, 8000e84 <lsm9ds0_init+0x98>
 8000e7e:	2064      	movs	r0, #100	; 0x64
 8000e80:	f7ff ff88 	bl	8000d94 <lsm9ds0_calibrate>
 8000e84:	f7ff feea 	bl	8000c5c <lsm9ds0_read>
 8000e88:	2000      	movs	r0, #0
 8000e8a:	bd70      	pop	{r4, r5, r6, pc}
 8000e8c:	2001      	movs	r0, #1
 8000e8e:	bd70      	pop	{r4, r5, r6, pc}
 8000e90:	2002      	movs	r0, #2
 8000e92:	bd70      	pop	{r4, r5, r6, pc}
 8000e94:	20000368 	.word	0x20000368

08000e98 <rgb_sensor_uninit>:
 8000e98:	b508      	push	{r3, lr}
 8000e9a:	2008      	movs	r0, #8
 8000e9c:	f001 f9e8 	bl	8002270 <led_off>
 8000ea0:	2072      	movs	r0, #114	; 0x72
 8000ea2:	2180      	movs	r1, #128	; 0x80
 8000ea4:	2200      	movs	r2, #0
 8000ea6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000eaa:	f7ff be98 	b.w	8000bde <rgb_i2c_write_reg>
	...

08000eb0 <rgb_sensor_read>:
 8000eb0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000eb2:	f7ff fe15 	bl	8000ae0 <rgb_i2cStart>
 8000eb6:	2072      	movs	r0, #114	; 0x72
 8000eb8:	4d55      	ldr	r5, [pc, #340]	; (8001010 <rgb_sensor_read+0x160>)
 8000eba:	4c56      	ldr	r4, [pc, #344]	; (8001014 <rgb_sensor_read+0x164>)
 8000ebc:	f7ff fe2e 	bl	8000b1c <rgb_i2cWrite>
 8000ec0:	20b4      	movs	r0, #180	; 0xb4
 8000ec2:	f7ff fe2b 	bl	8000b1c <rgb_i2cWrite>
 8000ec6:	f7ff fe0b 	bl	8000ae0 <rgb_i2cStart>
 8000eca:	2073      	movs	r0, #115	; 0x73
 8000ecc:	f7ff fe26 	bl	8000b1c <rgb_i2cWrite>
 8000ed0:	2001      	movs	r0, #1
 8000ed2:	4629      	mov	r1, r5
 8000ed4:	f7ff fe42 	bl	8000b5c <rgb_i2cRead>
 8000ed8:	782b      	ldrb	r3, [r5, #0]
 8000eda:	8323      	strh	r3, [r4, #24]
 8000edc:	786b      	ldrb	r3, [r5, #1]
 8000ede:	8363      	strh	r3, [r4, #26]
 8000ee0:	78ab      	ldrb	r3, [r5, #2]
 8000ee2:	83a3      	strh	r3, [r4, #28]
 8000ee4:	78eb      	ldrb	r3, [r5, #3]
 8000ee6:	2001      	movs	r0, #1
 8000ee8:	4629      	mov	r1, r5
 8000eea:	83e3      	strh	r3, [r4, #30]
 8000eec:	f7ff fe36 	bl	8000b5c <rgb_i2cRead>
 8000ef0:	2300      	movs	r3, #0
 8000ef2:	f103 020c 	add.w	r2, r3, #12
 8000ef6:	5ce8      	ldrb	r0, [r5, r3]
 8000ef8:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000efc:	4f45      	ldr	r7, [pc, #276]	; (8001014 <rgb_sensor_read+0x164>)
 8000efe:	4e44      	ldr	r6, [pc, #272]	; (8001010 <rgb_sensor_read+0x160>)
 8000f00:	b289      	uxth	r1, r1
 8000f02:	3301      	adds	r3, #1
 8000f04:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000f08:	2b04      	cmp	r3, #4
 8000f0a:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000f0e:	d1f0      	bne.n	8000ef2 <rgb_sensor_read+0x42>
 8000f10:	2001      	movs	r0, #1
 8000f12:	4631      	mov	r1, r6
 8000f14:	f7ff fe22 	bl	8000b5c <rgb_i2cRead>
 8000f18:	7833      	ldrb	r3, [r6, #0]
 8000f1a:	803b      	strh	r3, [r7, #0]
 8000f1c:	7873      	ldrb	r3, [r6, #1]
 8000f1e:	807b      	strh	r3, [r7, #2]
 8000f20:	78b3      	ldrb	r3, [r6, #2]
 8000f22:	80bb      	strh	r3, [r7, #4]
 8000f24:	78f3      	ldrb	r3, [r6, #3]
 8000f26:	2001      	movs	r0, #1
 8000f28:	4631      	mov	r1, r6
 8000f2a:	80fb      	strh	r3, [r7, #6]
 8000f2c:	f7ff fe16 	bl	8000b5c <rgb_i2cRead>
 8000f30:	2300      	movs	r3, #0
 8000f32:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
 8000f36:	5ce9      	ldrb	r1, [r5, r3]
 8000f38:	4f36      	ldr	r7, [pc, #216]	; (8001014 <rgb_sensor_read+0x164>)
 8000f3a:	4e35      	ldr	r6, [pc, #212]	; (8001010 <rgb_sensor_read+0x160>)
 8000f3c:	b292      	uxth	r2, r2
 8000f3e:	ea42 2201 	orr.w	r2, r2, r1, lsl #8
 8000f42:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
 8000f46:	3301      	adds	r3, #1
 8000f48:	2b04      	cmp	r3, #4
 8000f4a:	d1f2      	bne.n	8000f32 <rgb_sensor_read+0x82>
 8000f4c:	2001      	movs	r0, #1
 8000f4e:	4631      	mov	r1, r6
 8000f50:	f7ff fe04 	bl	8000b5c <rgb_i2cRead>
 8000f54:	7833      	ldrb	r3, [r6, #0]
 8000f56:	813b      	strh	r3, [r7, #8]
 8000f58:	7873      	ldrb	r3, [r6, #1]
 8000f5a:	817b      	strh	r3, [r7, #10]
 8000f5c:	78b3      	ldrb	r3, [r6, #2]
 8000f5e:	81bb      	strh	r3, [r7, #12]
 8000f60:	78f3      	ldrb	r3, [r6, #3]
 8000f62:	2001      	movs	r0, #1
 8000f64:	4631      	mov	r1, r6
 8000f66:	81fb      	strh	r3, [r7, #14]
 8000f68:	f7ff fdf8 	bl	8000b5c <rgb_i2cRead>
 8000f6c:	2300      	movs	r3, #0
 8000f6e:	1d1a      	adds	r2, r3, #4
 8000f70:	5ce8      	ldrb	r0, [r5, r3]
 8000f72:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000f76:	4f27      	ldr	r7, [pc, #156]	; (8001014 <rgb_sensor_read+0x164>)
 8000f78:	4e25      	ldr	r6, [pc, #148]	; (8001010 <rgb_sensor_read+0x160>)
 8000f7a:	b289      	uxth	r1, r1
 8000f7c:	3301      	adds	r3, #1
 8000f7e:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000f82:	2b04      	cmp	r3, #4
 8000f84:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000f88:	d1f1      	bne.n	8000f6e <rgb_sensor_read+0xbe>
 8000f8a:	2001      	movs	r0, #1
 8000f8c:	4631      	mov	r1, r6
 8000f8e:	f7ff fde5 	bl	8000b5c <rgb_i2cRead>
 8000f92:	7833      	ldrb	r3, [r6, #0]
 8000f94:	823b      	strh	r3, [r7, #16]
 8000f96:	7873      	ldrb	r3, [r6, #1]
 8000f98:	827b      	strh	r3, [r7, #18]
 8000f9a:	78b3      	ldrb	r3, [r6, #2]
 8000f9c:	82bb      	strh	r3, [r7, #20]
 8000f9e:	78f3      	ldrb	r3, [r6, #3]
 8000fa0:	2001      	movs	r0, #1
 8000fa2:	4631      	mov	r1, r6
 8000fa4:	82fb      	strh	r3, [r7, #22]
 8000fa6:	f7ff fdd9 	bl	8000b5c <rgb_i2cRead>
 8000faa:	2300      	movs	r3, #0
 8000fac:	f103 0208 	add.w	r2, r3, #8
 8000fb0:	5ce8      	ldrb	r0, [r5, r3]
 8000fb2:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000fb6:	4f17      	ldr	r7, [pc, #92]	; (8001014 <rgb_sensor_read+0x164>)
 8000fb8:	4e15      	ldr	r6, [pc, #84]	; (8001010 <rgb_sensor_read+0x160>)
 8000fba:	b289      	uxth	r1, r1
 8000fbc:	3301      	adds	r3, #1
 8000fbe:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000fc2:	2b04      	cmp	r3, #4
 8000fc4:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000fc8:	d1f0      	bne.n	8000fac <rgb_sensor_read+0xfc>
 8000fca:	2001      	movs	r0, #1
 8000fcc:	4631      	mov	r1, r6
 8000fce:	f7ff fdc5 	bl	8000b5c <rgb_i2cRead>
 8000fd2:	7833      	ldrb	r3, [r6, #0]
 8000fd4:	843b      	strh	r3, [r7, #32]
 8000fd6:	7873      	ldrb	r3, [r6, #1]
 8000fd8:	847b      	strh	r3, [r7, #34]	; 0x22
 8000fda:	78b3      	ldrb	r3, [r6, #2]
 8000fdc:	84bb      	strh	r3, [r7, #36]	; 0x24
 8000fde:	78f3      	ldrb	r3, [r6, #3]
 8000fe0:	2000      	movs	r0, #0
 8000fe2:	4631      	mov	r1, r6
 8000fe4:	84fb      	strh	r3, [r7, #38]	; 0x26
 8000fe6:	f7ff fdb9 	bl	8000b5c <rgb_i2cRead>
 8000fea:	2300      	movs	r3, #0
 8000fec:	f103 0210 	add.w	r2, r3, #16
 8000ff0:	5ce8      	ldrb	r0, [r5, r3]
 8000ff2:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000ff6:	3301      	adds	r3, #1
 8000ff8:	b289      	uxth	r1, r1
 8000ffa:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000ffe:	2b04      	cmp	r3, #4
 8001000:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8001004:	d1f2      	bne.n	8000fec <rgb_sensor_read+0x13c>
 8001006:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 800100a:	f7ff bd78 	b.w	8000afe <rgb_i2cStop>
 800100e:	bf00      	nop
 8001010:	200009d0 	.word	0x200009d0
 8001014:	20000388 	.word	0x20000388

08001018 <rgb_sensor_init>:
 8001018:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800101a:	2300      	movs	r3, #0
 800101c:	4a24      	ldr	r2, [pc, #144]	; (80010b0 <rgb_sensor_init+0x98>)
 800101e:	1d19      	adds	r1, r3, #4
 8001020:	2400      	movs	r4, #0
 8001022:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8001026:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 800102a:	f103 0108 	add.w	r1, r3, #8
 800102e:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8001032:	f103 0110 	add.w	r1, r3, #16
 8001036:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 800103a:	f103 010c 	add.w	r1, r3, #12
 800103e:	3301      	adds	r3, #1
 8001040:	2b04      	cmp	r3, #4
 8001042:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8001046:	d1e9      	bne.n	800101c <rgb_sensor_init+0x4>
 8001048:	2008      	movs	r0, #8
 800104a:	f001 f8fb 	bl	8002244 <led_on>
 800104e:	f7ff fd17 	bl	8000a80 <rgb_i2c_init>
 8001052:	2072      	movs	r0, #114	; 0x72
 8001054:	2181      	movs	r1, #129	; 0x81
 8001056:	22ff      	movs	r2, #255	; 0xff
 8001058:	f7ff fdc1 	bl	8000bde <rgb_i2c_write_reg>
 800105c:	2072      	movs	r0, #114	; 0x72
 800105e:	2183      	movs	r1, #131	; 0x83
 8001060:	22ff      	movs	r2, #255	; 0xff
 8001062:	f7ff fdbc 	bl	8000bde <rgb_i2c_write_reg>
 8001066:	2072      	movs	r0, #114	; 0x72
 8001068:	218d      	movs	r1, #141	; 0x8d
 800106a:	4622      	mov	r2, r4
 800106c:	f7ff fdb7 	bl	8000bde <rgb_i2c_write_reg>
 8001070:	2072      	movs	r0, #114	; 0x72
 8001072:	2180      	movs	r1, #128	; 0x80
 8001074:	2203      	movs	r2, #3
 8001076:	f7ff fdb2 	bl	8000bde <rgb_i2c_write_reg>
 800107a:	ad01      	add	r5, sp, #4
 800107c:	2072      	movs	r0, #114	; 0x72
 800107e:	218f      	movs	r1, #143	; 0x8f
 8001080:	2223      	movs	r2, #35	; 0x23
 8001082:	f7ff fdac 	bl	8000bde <rgb_i2c_write_reg>
 8001086:	f7ff ff13 	bl	8000eb0 <rgb_sensor_read>
 800108a:	2072      	movs	r0, #114	; 0x72
 800108c:	2192      	movs	r1, #146	; 0x92
 800108e:	462a      	mov	r2, r5
 8001090:	f7ff fdb8 	bl	8000c04 <rgb_i2c_read_reg>
 8001094:	4620      	mov	r0, r4
 8001096:	4623      	mov	r3, r4
 8001098:	5cea      	ldrb	r2, [r5, r3]
 800109a:	2a69      	cmp	r2, #105	; 0x69
 800109c:	d002      	beq.n	80010a4 <rgb_sensor_init+0x8c>
 800109e:	2201      	movs	r2, #1
 80010a0:	409a      	lsls	r2, r3
 80010a2:	4310      	orrs	r0, r2
 80010a4:	3301      	adds	r3, #1
 80010a6:	2b04      	cmp	r3, #4
 80010a8:	d1f6      	bne.n	8001098 <rgb_sensor_init+0x80>
 80010aa:	b003      	add	sp, #12
 80010ac:	bd30      	pop	{r4, r5, pc}
 80010ae:	bf00      	nop
 80010b0:	20000388 	.word	0x20000388

080010b4 <rgb_get_line_position>:
 80010b4:	4b18      	ldr	r3, [pc, #96]	; (8001118 <rgb_get_line_position+0x64>)
 80010b6:	b5f0      	push	{r4, r5, r6, r7, lr}
 80010b8:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
 80010ba:	b085      	sub	sp, #20
 80010bc:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
 80010c0:	2200      	movs	r2, #0
 80010c2:	466c      	mov	r4, sp
 80010c4:	4611      	mov	r1, r2
 80010c6:	4613      	mov	r3, r2
 80010c8:	4814      	ldr	r0, [pc, #80]	; (800111c <rgb_get_line_position+0x68>)
 80010ca:	f103 060c 	add.w	r6, r3, #12
 80010ce:	f103 050a 	add.w	r5, r3, #10
 80010d2:	f830 c016 	ldrh.w	ip, [r0, r6, lsl #1]
 80010d6:	f850 7025 	ldr.w	r7, [r0, r5, lsl #2]
 80010da:	f830 6016 	ldrh.w	r6, [r0, r6, lsl #1]
 80010de:	f850 5025 	ldr.w	r5, [r0, r5, lsl #2]
 80010e2:	fa0f fc8c 	sxth.w	ip, ip
 80010e6:	ebc7 0c0c 	rsb	ip, r7, ip
 80010ea:	b230      	sxth	r0, r6
 80010ec:	f854 7023 	ldr.w	r7, [r4, r3, lsl #2]
 80010f0:	3301      	adds	r3, #1
 80010f2:	1b40      	subs	r0, r0, r5
 80010f4:	2b04      	cmp	r3, #4
 80010f6:	fb07 220c 	mla	r2, r7, ip, r2
 80010fa:	4401      	add	r1, r0
 80010fc:	d1e4      	bne.n	80010c8 <rgb_get_line_position+0x14>
 80010fe:	4b08      	ldr	r3, [pc, #32]	; (8001120 <rgb_get_line_position+0x6c>)
 8001100:	2000      	movs	r0, #0
 8001102:	2914      	cmp	r1, #20
 8001104:	7118      	strb	r0, [r3, #4]
 8001106:	dd05      	ble.n	8001114 <rgb_get_line_position+0x60>
 8001108:	fb92 f2f1 	sdiv	r2, r2, r1
 800110c:	2001      	movs	r0, #1
 800110e:	3a47      	subs	r2, #71	; 0x47
 8001110:	7118      	strb	r0, [r3, #4]
 8001112:	601a      	str	r2, [r3, #0]
 8001114:	b005      	add	sp, #20
 8001116:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001118:	080024c0 	.word	0x080024c0
 800111c:	20000388 	.word	0x20000388
 8001120:	200007c8 	.word	0x200007c8

08001124 <rgb_set_background>:
 8001124:	4b13      	ldr	r3, [pc, #76]	; (8001174 <rgb_set_background+0x50>)
 8001126:	2200      	movs	r2, #0
 8001128:	b530      	push	{r4, r5, lr}
 800112a:	2164      	movs	r1, #100	; 0x64
 800112c:	629a      	str	r2, [r3, #40]	; 0x28
 800112e:	62da      	str	r2, [r3, #44]	; 0x2c
 8001130:	631a      	str	r2, [r3, #48]	; 0x30
 8001132:	635a      	str	r2, [r3, #52]	; 0x34
 8001134:	2200      	movs	r2, #0
 8001136:	f102 000a 	add.w	r0, r2, #10
 800113a:	f102 050c 	add.w	r5, r2, #12
 800113e:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001142:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 8001146:	3201      	adds	r2, #1
 8001148:	fa04 f485 	sxtah	r4, r4, r5
 800114c:	2a04      	cmp	r2, #4
 800114e:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 8001152:	d1f0      	bne.n	8001136 <rgb_set_background+0x12>
 8001154:	3901      	subs	r1, #1
 8001156:	d1ed      	bne.n	8001134 <rgb_set_background+0x10>
 8001158:	460a      	mov	r2, r1
 800115a:	f102 010a 	add.w	r1, r2, #10
 800115e:	2064      	movs	r0, #100	; 0x64
 8001160:	f853 4021 	ldr.w	r4, [r3, r1, lsl #2]
 8001164:	3201      	adds	r2, #1
 8001166:	fb94 f0f0 	sdiv	r0, r4, r0
 800116a:	2a04      	cmp	r2, #4
 800116c:	f843 0021 	str.w	r0, [r3, r1, lsl #2]
 8001170:	d1f3      	bne.n	800115a <rgb_set_background+0x36>
 8001172:	bd30      	pop	{r4, r5, pc}
 8001174:	20000388 	.word	0x20000388

08001178 <m_abs>:
 8001178:	ee07 0a90 	vmov	s15, r0
 800117c:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 8001180:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001184:	bf48      	it	mi
 8001186:	eef1 7a67 	vnegmi.f32	s15, s15
 800118a:	ee17 0a90 	vmov	r0, s15
 800118e:	4770      	bx	lr

08001190 <m_min>:
 8001190:	ee07 0a10 	vmov	s14, r0
 8001194:	ee07 1a90 	vmov	s15, r1
 8001198:	eeb4 7ae7 	vcmpe.f32	s14, s15
 800119c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80011a0:	bf54      	ite	pl
 80011a2:	ee17 0a90 	vmovpl	r0, s15
 80011a6:	ee17 0a10 	vmovmi	r0, s14
 80011aa:	4770      	bx	lr

080011ac <abort_error_>:
 80011ac:	b570      	push	{r4, r5, r6, lr}
 80011ae:	4605      	mov	r5, r0
 80011b0:	460e      	mov	r6, r1
 80011b2:	480d      	ldr	r0, [pc, #52]	; (80011e8 <abort_error_+0x3c>)
 80011b4:	4629      	mov	r1, r5
 80011b6:	4632      	mov	r2, r6
 80011b8:	f7ff f99e 	bl	80004f8 <printf_>
 80011bc:	2408      	movs	r4, #8
 80011be:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80011c2:	f001 f83f 	bl	8002244 <led_on>
 80011c6:	201e      	movs	r0, #30
 80011c8:	f000 fa78 	bl	80016bc <timer_delay_ms>
 80011cc:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80011d0:	f001 f84e 	bl	8002270 <led_off>
 80011d4:	2046      	movs	r0, #70	; 0x46
 80011d6:	f000 fa71 	bl	80016bc <timer_delay_ms>
 80011da:	3c01      	subs	r4, #1
 80011dc:	d1ef      	bne.n	80011be <abort_error_+0x12>
 80011de:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80011e2:	f000 fa6b 	bl	80016bc <timer_delay_ms>
 80011e6:	e7e4      	b.n	80011b2 <abort_error_+0x6>
 80011e8:	080024d0 	.word	0x080024d0

080011ec <device_sleep>:
 80011ec:	4b01      	ldr	r3, [pc, #4]	; (80011f4 <device_sleep+0x8>)
 80011ee:	22ff      	movs	r2, #255	; 0xff
 80011f0:	701a      	strb	r2, [r3, #0]
 80011f2:	4770      	bx	lr
 80011f4:	20000030 	.word	0x20000030

080011f8 <device_wake_up>:
 80011f8:	4b01      	ldr	r3, [pc, #4]	; (8001200 <device_wake_up+0x8>)
 80011fa:	2200      	movs	r2, #0
 80011fc:	701a      	strb	r2, [r3, #0]
 80011fe:	4770      	bx	lr
 8001200:	20000030 	.word	0x20000030

08001204 <device_i2c_thread>:
 8001204:	b538      	push	{r3, r4, r5, lr}
 8001206:	2000      	movs	r0, #0
 8001208:	210a      	movs	r1, #10
 800120a:	f000 fa67 	bl	80016dc <event_timer_set_period>
 800120e:	2501      	movs	r5, #1
 8001210:	2400      	movs	r4, #0
 8001212:	2c01      	cmp	r4, #1
 8001214:	d017      	beq.n	8001246 <device_i2c_thread+0x42>
 8001216:	d30f      	bcc.n	8001238 <device_i2c_thread+0x34>
 8001218:	2c02      	cmp	r4, #2
 800121a:	d1fa      	bne.n	8001212 <device_i2c_thread+0xe>
 800121c:	f7ff fd0c 	bl	8000c38 <lsm9ds0_uninit>
 8001220:	f7ff fb6e 	bl	8000900 <motors_uninit>
 8001224:	2064      	movs	r0, #100	; 0x64
 8001226:	f000 fa49 	bl	80016bc <timer_delay_ms>
 800122a:	4b0d      	ldr	r3, [pc, #52]	; (8001260 <device_i2c_thread+0x5c>)
 800122c:	781c      	ldrb	r4, [r3, #0]
 800122e:	2c00      	cmp	r4, #0
 8001230:	bf14      	ite	ne
 8001232:	2402      	movne	r4, #2
 8001234:	2400      	moveq	r4, #0
 8001236:	e7ec      	b.n	8001212 <device_i2c_thread+0xe>
 8001238:	f7ff fbd2 	bl	80009e0 <motors_init>
 800123c:	4628      	mov	r0, r5
 800123e:	f7ff fdd5 	bl	8000dec <lsm9ds0_init>
 8001242:	2500      	movs	r5, #0
 8001244:	2401      	movs	r4, #1
 8001246:	2000      	movs	r0, #0
 8001248:	f000 fa5e 	bl	8001708 <event_timer_wait>
 800124c:	f7ff fd06 	bl	8000c5c <lsm9ds0_read>
 8001250:	f7ff fb64 	bl	800091c <motors_update>
 8001254:	4b02      	ldr	r3, [pc, #8]	; (8001260 <device_i2c_thread+0x5c>)
 8001256:	781b      	ldrb	r3, [r3, #0]
 8001258:	2b00      	cmp	r3, #0
 800125a:	bf18      	it	ne
 800125c:	2402      	movne	r4, #2
 800125e:	e7d8      	b.n	8001212 <device_i2c_thread+0xe>
 8001260:	20000030 	.word	0x20000030

08001264 <device_rgb_sensors_thread>:
 8001264:	b510      	push	{r4, lr}
 8001266:	2001      	movs	r0, #1
 8001268:	210a      	movs	r1, #10
 800126a:	f000 fa37 	bl	80016dc <event_timer_set_period>
 800126e:	2400      	movs	r4, #0
 8001270:	2001      	movs	r0, #1
 8001272:	f000 fa49 	bl	8001708 <event_timer_wait>
 8001276:	f7ff fe1b 	bl	8000eb0 <rgb_sensor_read>
 800127a:	2c01      	cmp	r4, #1
 800127c:	d01a      	beq.n	80012b4 <device_rgb_sensors_thread+0x50>
 800127e:	d30d      	bcc.n	800129c <device_rgb_sensors_thread+0x38>
 8001280:	2c02      	cmp	r4, #2
 8001282:	d1f5      	bne.n	8001270 <device_rgb_sensors_thread+0xc>
 8001284:	f7ff fe08 	bl	8000e98 <rgb_sensor_uninit>
 8001288:	2064      	movs	r0, #100	; 0x64
 800128a:	f000 fa17 	bl	80016bc <timer_delay_ms>
 800128e:	4b0f      	ldr	r3, [pc, #60]	; (80012cc <device_rgb_sensors_thread+0x68>)
 8001290:	781c      	ldrb	r4, [r3, #0]
 8001292:	2c00      	cmp	r4, #0
 8001294:	bf14      	ite	ne
 8001296:	2402      	movne	r4, #2
 8001298:	2400      	moveq	r4, #0
 800129a:	e7e9      	b.n	8001270 <device_rgb_sensors_thread+0xc>
 800129c:	f7ff febc 	bl	8001018 <rgb_sensor_init>
 80012a0:	4604      	mov	r4, r0
 80012a2:	b128      	cbz	r0, 80012b0 <device_rgb_sensors_thread+0x4c>
 80012a4:	f7ff fdf8 	bl	8000e98 <rgb_sensor_uninit>
 80012a8:	2001      	movs	r0, #1
 80012aa:	4621      	mov	r1, r4
 80012ac:	f7ff ff7e 	bl	80011ac <abort_error_>
 80012b0:	2401      	movs	r4, #1
 80012b2:	e7dd      	b.n	8001270 <device_rgb_sensors_thread+0xc>
 80012b4:	4620      	mov	r0, r4
 80012b6:	f000 fa27 	bl	8001708 <event_timer_wait>
 80012ba:	f7ff fdf9 	bl	8000eb0 <rgb_sensor_read>
 80012be:	4b03      	ldr	r3, [pc, #12]	; (80012cc <device_rgb_sensors_thread+0x68>)
 80012c0:	781b      	ldrb	r3, [r3, #0]
 80012c2:	2b00      	cmp	r3, #0
 80012c4:	d0f4      	beq.n	80012b0 <device_rgb_sensors_thread+0x4c>
 80012c6:	2402      	movs	r4, #2
 80012c8:	e7d2      	b.n	8001270 <device_rgb_sensors_thread+0xc>
 80012ca:	bf00      	nop
 80012cc:	20000030 	.word	0x20000030

080012d0 <device_wifi_thread>:
 80012d0:	b570      	push	{r4, r5, r6, lr}
 80012d2:	4b1f      	ldr	r3, [pc, #124]	; (8001350 <device_wifi_thread+0x80>)
 80012d4:	b0a6      	sub	sp, #152	; 0x98
 80012d6:	ac02      	add	r4, sp, #8
 80012d8:	f103 0210 	add.w	r2, r3, #16
 80012dc:	4626      	mov	r6, r4
 80012de:	6818      	ldr	r0, [r3, #0]
 80012e0:	6859      	ldr	r1, [r3, #4]
 80012e2:	4625      	mov	r5, r4
 80012e4:	c503      	stmia	r5!, {r0, r1}
 80012e6:	3308      	adds	r3, #8
 80012e8:	4293      	cmp	r3, r2
 80012ea:	462c      	mov	r4, r5
 80012ec:	d1f7      	bne.n	80012de <device_wifi_thread+0xe>
 80012ee:	4630      	mov	r0, r6
 80012f0:	f7ff f880 	bl	80003f4 <strlen_>
 80012f4:	2100      	movs	r1, #0
 80012f6:	4605      	mov	r5, r0
 80012f8:	2901      	cmp	r1, #1
 80012fa:	d01c      	beq.n	8001336 <device_wifi_thread+0x66>
 80012fc:	d30d      	bcc.n	800131a <device_wifi_thread+0x4a>
 80012fe:	2900      	cmp	r1, #0
 8001300:	d0fa      	beq.n	80012f8 <device_wifi_thread+0x28>
 8001302:	f7ff fa49 	bl	8000798 <esp8266_uninit>
 8001306:	2064      	movs	r0, #100	; 0x64
 8001308:	f000 f9d8 	bl	80016bc <timer_delay_ms>
 800130c:	4b11      	ldr	r3, [pc, #68]	; (8001354 <device_wifi_thread+0x84>)
 800130e:	7819      	ldrb	r1, [r3, #0]
 8001310:	2900      	cmp	r1, #0
 8001312:	bf14      	ite	ne
 8001314:	2102      	movne	r1, #2
 8001316:	2100      	moveq	r1, #0
 8001318:	e7ee      	b.n	80012f8 <device_wifi_thread+0x28>
 800131a:	2001      	movs	r0, #1
 800131c:	f000 ff92 	bl	8002244 <led_on>
 8001320:	2000      	movs	r0, #0
 8001322:	f7ff f9ed 	bl	8000700 <esp8266_init>
 8001326:	4604      	mov	r4, r0
 8001328:	b128      	cbz	r0, 8001336 <device_wifi_thread+0x66>
 800132a:	f7ff fa35 	bl	8000798 <esp8266_uninit>
 800132e:	2003      	movs	r0, #3
 8001330:	4621      	mov	r1, r4
 8001332:	f7ff ff3b 	bl	80011ac <abort_error_>
 8001336:	ab06      	add	r3, sp, #24
 8001338:	9300      	str	r3, [sp, #0]
 800133a:	2380      	movs	r3, #128	; 0x80
 800133c:	9301      	str	r3, [sp, #4]
 800133e:	f240 71da 	movw	r1, #2010	; 0x7da
 8001342:	4632      	mov	r2, r6
 8001344:	462b      	mov	r3, r5
 8001346:	4804      	ldr	r0, [pc, #16]	; (8001358 <device_wifi_thread+0x88>)
 8001348:	f7ff fa52 	bl	80007f0 <esp8266_connect>
 800134c:	e7f3      	b.n	8001336 <device_wifi_thread+0x66>
 800134e:	bf00      	nop
 8001350:	080024ee 	.word	0x080024ee
 8001354:	20000030 	.word	0x20000030
 8001358:	080024e2 	.word	0x080024e2

0800135c <line_follower_test>:
 800135c:	b508      	push	{r3, lr}
 800135e:	ed2d 8b06 	vpush	{d8-d10}
 8001362:	eddf 8a2d 	vldr	s17, [pc, #180]	; 8001418 <line_follower_test+0xbc>
 8001366:	eeb0 9a68 	vmov.f32	s18, s17
 800136a:	eeb0 aa68 	vmov.f32	s20, s17
 800136e:	f7ff fea1 	bl	80010b4 <rgb_get_line_position>
 8001372:	4b2a      	ldr	r3, [pc, #168]	; (800141c <line_follower_test+0xc0>)
 8001374:	ed93 8a00 	vldr	s16, [r3]
 8001378:	eddf 7a29 	vldr	s15, [pc, #164]	; 8001420 <line_follower_test+0xc4>
 800137c:	eeb8 8ac8 	vcvt.f32.s32	s16, s16
 8001380:	eddf 9a28 	vldr	s19, [pc, #160]	; 8001424 <line_follower_test+0xc8>
 8001384:	ee88 8a27 	vdiv.f32	s16, s16, s15
 8001388:	ee3a 8a48 	vsub.f32	s16, s20, s16
 800138c:	eeb4 8ae9 	vcmpe.f32	s16, s19
 8001390:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001394:	dc09      	bgt.n	80013aa <line_follower_test+0x4e>
 8001396:	eddf 7a24 	vldr	s15, [pc, #144]	; 8001428 <line_follower_test+0xcc>
 800139a:	eeb4 8a67 	vcmp.f32	s16, s15
 800139e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80013a2:	bf48      	it	mi
 80013a4:	eeb0 8a67 	vmovmi.f32	s16, s15
 80013a8:	e001      	b.n	80013ae <line_follower_test+0x52>
 80013aa:	eeb0 8a69 	vmov.f32	s16, s19
 80013ae:	eddf 7a1f 	vldr	s15, [pc, #124]	; 800142c <line_follower_test+0xd0>
 80013b2:	ee78 8a68 	vsub.f32	s17, s16, s17
 80013b6:	ee18 0a10 	vmov	r0, s16
 80013ba:	ee68 8aa7 	vmul.f32	s17, s17, s15
 80013be:	eddf 7a1c 	vldr	s15, [pc, #112]	; 8001430 <line_follower_test+0xd4>
 80013c2:	ee48 8a27 	vmla.f32	s17, s16, s15
 80013c6:	f7ff fed7 	bl	8001178 <m_abs>
 80013ca:	ee07 0a90 	vmov	s15, r0
 80013ce:	ee79 9ae7 	vsub.f32	s19, s19, s15
 80013d2:	eddf 7a18 	vldr	s15, [pc, #96]	; 8001434 <line_follower_test+0xd8>
 80013d6:	ee69 7aa7 	vmul.f32	s15, s19, s15
 80013da:	ee17 0a90 	vmov	r0, s15
 80013de:	eddf 7a16 	vldr	s15, [pc, #88]	; 8001438 <line_follower_test+0xdc>
 80013e2:	ee79 7a27 	vadd.f32	s15, s18, s15
 80013e6:	ee17 1a90 	vmov	r1, s15
 80013ea:	f7ff fed1 	bl	8001190 <m_min>
 80013ee:	ee09 0a10 	vmov	s18, r0
 80013f2:	ee79 7a28 	vadd.f32	s15, s18, s17
 80013f6:	ee79 8a68 	vsub.f32	s17, s18, s17
 80013fa:	4b10      	ldr	r3, [pc, #64]	; (800143c <line_follower_test+0xe0>)
 80013fc:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 8001400:	eefd 8ae8 	vcvt.s32.f32	s17, s17
 8001404:	200a      	movs	r0, #10
 8001406:	edc3 7a00 	vstr	s15, [r3]
 800140a:	edc3 8a01 	vstr	s17, [r3, #4]
 800140e:	f000 f955 	bl	80016bc <timer_delay_ms>
 8001412:	eef0 8a48 	vmov.f32	s17, s16
 8001416:	e7aa      	b.n	800136e <line_follower_test+0x12>
 8001418:	00000000 	.word	0x00000000
 800141c:	200007c8 	.word	0x200007c8
 8001420:	428c0000 	.word	0x428c0000
 8001424:	3f800000 	.word	0x3f800000
 8001428:	bf800000 	.word	0xbf800000
 800142c:	42c80000 	.word	0x42c80000
 8001430:	42200000 	.word	0x42200000
 8001434:	42480000 	.word	0x42480000
 8001438:	3e4ccccd 	.word	0x3e4ccccd
 800143c:	200005c0 	.word	0x200005c0

08001440 <main_thread>:
 8001440:	b508      	push	{r3, lr}
 8001442:	4822      	ldr	r0, [pc, #136]	; (80014cc <main_thread+0x8c>)
 8001444:	f7ff f858 	bl	80004f8 <printf_>
 8001448:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 800144c:	f000 f936 	bl	80016bc <timer_delay_ms>
 8001450:	f7ff fed2 	bl	80011f8 <device_wake_up>
 8001454:	491e      	ldr	r1, [pc, #120]	; (80014d0 <main_thread+0x90>)
 8001456:	481f      	ldr	r0, [pc, #124]	; (80014d4 <main_thread+0x94>)
 8001458:	f44f 7200 	mov.w	r2, #512	; 0x200
 800145c:	2306      	movs	r3, #6
 800145e:	f7fe ff15 	bl	800028c <create_thread>
 8001462:	491d      	ldr	r1, [pc, #116]	; (80014d8 <main_thread+0x98>)
 8001464:	481d      	ldr	r0, [pc, #116]	; (80014dc <main_thread+0x9c>)
 8001466:	f44f 7200 	mov.w	r2, #512	; 0x200
 800146a:	2306      	movs	r3, #6
 800146c:	f7fe ff0e 	bl	800028c <create_thread>
 8001470:	491b      	ldr	r1, [pc, #108]	; (80014e0 <main_thread+0xa0>)
 8001472:	481c      	ldr	r0, [pc, #112]	; (80014e4 <main_thread+0xa4>)
 8001474:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001478:	2306      	movs	r3, #6
 800147a:	f7fe ff07 	bl	800028c <create_thread>
 800147e:	20c8      	movs	r0, #200	; 0xc8
 8001480:	f000 f91c 	bl	80016bc <timer_delay_ms>
 8001484:	f7ff fe4e 	bl	8001124 <rgb_set_background>
 8001488:	f000 ff66 	bl	8002358 <get_key>
 800148c:	b980      	cbnz	r0, 80014b0 <main_thread+0x70>
 800148e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001492:	f000 fed7 	bl	8002244 <led_on>
 8001496:	2064      	movs	r0, #100	; 0x64
 8001498:	f000 f910 	bl	80016bc <timer_delay_ms>
 800149c:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80014a0:	f000 fee6 	bl	8002270 <led_off>
 80014a4:	20c8      	movs	r0, #200	; 0xc8
 80014a6:	f000 f909 	bl	80016bc <timer_delay_ms>
 80014aa:	f7ff fe9f 	bl	80011ec <device_sleep>
 80014ae:	e7eb      	b.n	8001488 <main_thread+0x48>
 80014b0:	f7ff fea2 	bl	80011f8 <device_wake_up>
 80014b4:	20c8      	movs	r0, #200	; 0xc8
 80014b6:	f000 f901 	bl	80016bc <timer_delay_ms>
 80014ba:	f7ff ff4f 	bl	800135c <line_follower_test>
 80014be:	f000 ff4b 	bl	8002358 <get_key>
 80014c2:	2800      	cmp	r0, #0
 80014c4:	d1e0      	bne.n	8001488 <main_thread+0x48>
 80014c6:	f7ff fdf5 	bl	80010b4 <rgb_get_line_position>
 80014ca:	e7f8      	b.n	80014be <main_thread+0x7e>
 80014cc:	080024fe 	.word	0x080024fe
 80014d0:	200003c0 	.word	0x200003c0
 80014d4:	08001265 	.word	0x08001265
 80014d8:	20000168 	.word	0x20000168
 80014dc:	08001205 	.word	0x08001205
 80014e0:	200005c8 	.word	0x200005c8
 80014e4:	080012d1 	.word	0x080012d1

080014e8 <TIM_TimeBaseInit>:
 80014e8:	bf00      	nop
 80014ea:	bf00      	nop
 80014ec:	bf00      	nop
 80014ee:	4a24      	ldr	r2, [pc, #144]	; (8001580 <TIM_TimeBaseInit+0x98>)
 80014f0:	8803      	ldrh	r3, [r0, #0]
 80014f2:	4290      	cmp	r0, r2
 80014f4:	b29b      	uxth	r3, r3
 80014f6:	d012      	beq.n	800151e <TIM_TimeBaseInit+0x36>
 80014f8:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 80014fc:	4290      	cmp	r0, r2
 80014fe:	d00e      	beq.n	800151e <TIM_TimeBaseInit+0x36>
 8001500:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001504:	d00b      	beq.n	800151e <TIM_TimeBaseInit+0x36>
 8001506:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 800150a:	4290      	cmp	r0, r2
 800150c:	d007      	beq.n	800151e <TIM_TimeBaseInit+0x36>
 800150e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001512:	4290      	cmp	r0, r2
 8001514:	d003      	beq.n	800151e <TIM_TimeBaseInit+0x36>
 8001516:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 800151a:	4290      	cmp	r0, r2
 800151c:	d103      	bne.n	8001526 <TIM_TimeBaseInit+0x3e>
 800151e:	884a      	ldrh	r2, [r1, #2]
 8001520:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001524:	4313      	orrs	r3, r2
 8001526:	4a17      	ldr	r2, [pc, #92]	; (8001584 <TIM_TimeBaseInit+0x9c>)
 8001528:	4290      	cmp	r0, r2
 800152a:	d008      	beq.n	800153e <TIM_TimeBaseInit+0x56>
 800152c:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001530:	4290      	cmp	r0, r2
 8001532:	d004      	beq.n	800153e <TIM_TimeBaseInit+0x56>
 8001534:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001538:	890a      	ldrh	r2, [r1, #8]
 800153a:	b29b      	uxth	r3, r3
 800153c:	4313      	orrs	r3, r2
 800153e:	8003      	strh	r3, [r0, #0]
 8001540:	684b      	ldr	r3, [r1, #4]
 8001542:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001544:	880b      	ldrh	r3, [r1, #0]
 8001546:	8503      	strh	r3, [r0, #40]	; 0x28
 8001548:	4b0d      	ldr	r3, [pc, #52]	; (8001580 <TIM_TimeBaseInit+0x98>)
 800154a:	4298      	cmp	r0, r3
 800154c:	d013      	beq.n	8001576 <TIM_TimeBaseInit+0x8e>
 800154e:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001552:	4298      	cmp	r0, r3
 8001554:	d00f      	beq.n	8001576 <TIM_TimeBaseInit+0x8e>
 8001556:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 800155a:	4298      	cmp	r0, r3
 800155c:	d00b      	beq.n	8001576 <TIM_TimeBaseInit+0x8e>
 800155e:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001562:	4298      	cmp	r0, r3
 8001564:	d007      	beq.n	8001576 <TIM_TimeBaseInit+0x8e>
 8001566:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 800156a:	4298      	cmp	r0, r3
 800156c:	d003      	beq.n	8001576 <TIM_TimeBaseInit+0x8e>
 800156e:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001572:	4298      	cmp	r0, r3
 8001574:	d101      	bne.n	800157a <TIM_TimeBaseInit+0x92>
 8001576:	894b      	ldrh	r3, [r1, #10]
 8001578:	8603      	strh	r3, [r0, #48]	; 0x30
 800157a:	2301      	movs	r3, #1
 800157c:	6143      	str	r3, [r0, #20]
 800157e:	4770      	bx	lr
 8001580:	40012c00 	.word	0x40012c00
 8001584:	40001000 	.word	0x40001000

08001588 <TIM_Cmd>:
 8001588:	bf00      	nop
 800158a:	bf00      	nop
 800158c:	8803      	ldrh	r3, [r0, #0]
 800158e:	b119      	cbz	r1, 8001598 <TIM_Cmd+0x10>
 8001590:	b29b      	uxth	r3, r3
 8001592:	f043 0301 	orr.w	r3, r3, #1
 8001596:	e003      	b.n	80015a0 <TIM_Cmd+0x18>
 8001598:	f023 0301 	bic.w	r3, r3, #1
 800159c:	041b      	lsls	r3, r3, #16
 800159e:	0c1b      	lsrs	r3, r3, #16
 80015a0:	8003      	strh	r3, [r0, #0]
 80015a2:	4770      	bx	lr

080015a4 <TIM_ClearITPendingBit>:
 80015a4:	bf00      	nop
 80015a6:	43c9      	mvns	r1, r1
 80015a8:	b289      	uxth	r1, r1
 80015aa:	6101      	str	r1, [r0, #16]
 80015ac:	4770      	bx	lr
	...

080015b0 <timer_init>:
 80015b0:	b530      	push	{r4, r5, lr}
 80015b2:	2300      	movs	r3, #0
 80015b4:	b085      	sub	sp, #20
 80015b6:	491f      	ldr	r1, [pc, #124]	; (8001634 <timer_init+0x84>)
 80015b8:	f44f 6280 	mov.w	r2, #1024	; 0x400
 80015bc:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 80015c0:	491d      	ldr	r1, [pc, #116]	; (8001638 <timer_init+0x88>)
 80015c2:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 80015c6:	4a1d      	ldr	r2, [pc, #116]	; (800163c <timer_init+0x8c>)
 80015c8:	2400      	movs	r4, #0
 80015ca:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 80015ce:	3301      	adds	r3, #1
 80015d0:	2b04      	cmp	r3, #4
 80015d2:	4625      	mov	r5, r4
 80015d4:	d1ef      	bne.n	80015b6 <timer_init+0x6>
 80015d6:	4b1a      	ldr	r3, [pc, #104]	; (8001640 <timer_init+0x90>)
 80015d8:	2002      	movs	r0, #2
 80015da:	2101      	movs	r1, #1
 80015dc:	601c      	str	r4, [r3, #0]
 80015de:	f000 fdb1 	bl	8002144 <RCC_APB1PeriphClockCmd>
 80015e2:	f8ad 4006 	strh.w	r4, [sp, #6]
 80015e6:	f8ad 400c 	strh.w	r4, [sp, #12]
 80015ea:	f8ad 400e 	strh.w	r4, [sp, #14]
 80015ee:	4c15      	ldr	r4, [pc, #84]	; (8001644 <timer_init+0x94>)
 80015f0:	f44f 738c 	mov.w	r3, #280	; 0x118
 80015f4:	f8ad 3004 	strh.w	r3, [sp, #4]
 80015f8:	4620      	mov	r0, r4
 80015fa:	2331      	movs	r3, #49	; 0x31
 80015fc:	a901      	add	r1, sp, #4
 80015fe:	9302      	str	r3, [sp, #8]
 8001600:	f7ff ff72 	bl	80014e8 <TIM_TimeBaseInit>
 8001604:	4620      	mov	r0, r4
 8001606:	2101      	movs	r1, #1
 8001608:	f7ff ffbe 	bl	8001588 <TIM_Cmd>
 800160c:	68e3      	ldr	r3, [r4, #12]
 800160e:	f043 0301 	orr.w	r3, r3, #1
 8001612:	60e3      	str	r3, [r4, #12]
 8001614:	231d      	movs	r3, #29
 8001616:	f88d 3000 	strb.w	r3, [sp]
 800161a:	4668      	mov	r0, sp
 800161c:	2301      	movs	r3, #1
 800161e:	f88d 5001 	strb.w	r5, [sp, #1]
 8001622:	f88d 3002 	strb.w	r3, [sp, #2]
 8001626:	f88d 3003 	strb.w	r3, [sp, #3]
 800162a:	f000 fe9d 	bl	8002368 <NVIC_Init>
 800162e:	b005      	add	sp, #20
 8001630:	bd30      	pop	{r4, r5, pc}
 8001632:	bf00      	nop
 8001634:	200009e8 	.word	0x200009e8
 8001638:	200009dc 	.word	0x200009dc
 800163c:	200009d4 	.word	0x200009d4
 8001640:	200009e4 	.word	0x200009e4
 8001644:	40000400 	.word	0x40000400

08001648 <TIM3_IRQHandler>:
 8001648:	2300      	movs	r3, #0
 800164a:	4a10      	ldr	r2, [pc, #64]	; (800168c <TIM3_IRQHandler+0x44>)
 800164c:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001650:	b289      	uxth	r1, r1
 8001652:	b129      	cbz	r1, 8001660 <TIM3_IRQHandler+0x18>
 8001654:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001658:	b289      	uxth	r1, r1
 800165a:	3901      	subs	r1, #1
 800165c:	b289      	uxth	r1, r1
 800165e:	e007      	b.n	8001670 <TIM3_IRQHandler+0x28>
 8001660:	490b      	ldr	r1, [pc, #44]	; (8001690 <TIM3_IRQHandler+0x48>)
 8001662:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001666:	b289      	uxth	r1, r1
 8001668:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 800166c:	4a09      	ldr	r2, [pc, #36]	; (8001694 <TIM3_IRQHandler+0x4c>)
 800166e:	2101      	movs	r1, #1
 8001670:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001674:	3301      	adds	r3, #1
 8001676:	2b04      	cmp	r3, #4
 8001678:	d1e7      	bne.n	800164a <TIM3_IRQHandler+0x2>
 800167a:	4b07      	ldr	r3, [pc, #28]	; (8001698 <TIM3_IRQHandler+0x50>)
 800167c:	4807      	ldr	r0, [pc, #28]	; (800169c <TIM3_IRQHandler+0x54>)
 800167e:	681a      	ldr	r2, [r3, #0]
 8001680:	2101      	movs	r1, #1
 8001682:	3201      	adds	r2, #1
 8001684:	601a      	str	r2, [r3, #0]
 8001686:	f7ff bf8d 	b.w	80015a4 <TIM_ClearITPendingBit>
 800168a:	bf00      	nop
 800168c:	200009e8 	.word	0x200009e8
 8001690:	200009dc 	.word	0x200009dc
 8001694:	200009d4 	.word	0x200009d4
 8001698:	200009e4 	.word	0x200009e4
 800169c:	40000400 	.word	0x40000400

080016a0 <timer_get_time>:
 80016a0:	b082      	sub	sp, #8
 80016a2:	b672      	cpsid	i
 80016a4:	4b04      	ldr	r3, [pc, #16]	; (80016b8 <timer_get_time+0x18>)
 80016a6:	681b      	ldr	r3, [r3, #0]
 80016a8:	9301      	str	r3, [sp, #4]
 80016aa:	b662      	cpsie	i
 80016ac:	9801      	ldr	r0, [sp, #4]
 80016ae:	230a      	movs	r3, #10
 80016b0:	fbb0 f0f3 	udiv	r0, r0, r3
 80016b4:	b002      	add	sp, #8
 80016b6:	4770      	bx	lr
 80016b8:	200009e4 	.word	0x200009e4

080016bc <timer_delay_ms>:
 80016bc:	b513      	push	{r0, r1, r4, lr}
 80016be:	4604      	mov	r4, r0
 80016c0:	f7ff ffee 	bl	80016a0 <timer_get_time>
 80016c4:	4420      	add	r0, r4
 80016c6:	9001      	str	r0, [sp, #4]
 80016c8:	9c01      	ldr	r4, [sp, #4]
 80016ca:	f7ff ffe9 	bl	80016a0 <timer_get_time>
 80016ce:	4284      	cmp	r4, r0
 80016d0:	d902      	bls.n	80016d8 <timer_delay_ms+0x1c>
 80016d2:	f000 fac9 	bl	8001c68 <sleep>
 80016d6:	e7f7      	b.n	80016c8 <timer_delay_ms+0xc>
 80016d8:	b002      	add	sp, #8
 80016da:	bd10      	pop	{r4, pc}

080016dc <event_timer_set_period>:
 80016dc:	b672      	cpsid	i
 80016de:	230a      	movs	r3, #10
 80016e0:	4359      	muls	r1, r3
 80016e2:	4b06      	ldr	r3, [pc, #24]	; (80016fc <event_timer_set_period+0x20>)
 80016e4:	b289      	uxth	r1, r1
 80016e6:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 80016ea:	4b05      	ldr	r3, [pc, #20]	; (8001700 <event_timer_set_period+0x24>)
 80016ec:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 80016f0:	4b04      	ldr	r3, [pc, #16]	; (8001704 <event_timer_set_period+0x28>)
 80016f2:	2200      	movs	r2, #0
 80016f4:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 80016f8:	b662      	cpsie	i
 80016fa:	4770      	bx	lr
 80016fc:	200009e8 	.word	0x200009e8
 8001700:	200009dc 	.word	0x200009dc
 8001704:	200009d4 	.word	0x200009d4

08001708 <event_timer_wait>:
 8001708:	b510      	push	{r4, lr}
 800170a:	4604      	mov	r4, r0
 800170c:	4b06      	ldr	r3, [pc, #24]	; (8001728 <event_timer_wait+0x20>)
 800170e:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 8001712:	b292      	uxth	r2, r2
 8001714:	b912      	cbnz	r2, 800171c <event_timer_wait+0x14>
 8001716:	f000 faa7 	bl	8001c68 <sleep>
 800171a:	e7f7      	b.n	800170c <event_timer_wait+0x4>
 800171c:	b672      	cpsid	i
 800171e:	2200      	movs	r2, #0
 8001720:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 8001724:	b662      	cpsie	i
 8001726:	bd10      	pop	{r4, pc}
 8001728:	200009d4 	.word	0x200009d4

0800172c <i2c_delay>:
 800172c:	230b      	movs	r3, #11
 800172e:	3b01      	subs	r3, #1
 8001730:	d001      	beq.n	8001736 <i2c_delay+0xa>
 8001732:	bf00      	nop
 8001734:	e7fb      	b.n	800172e <i2c_delay+0x2>
 8001736:	4770      	bx	lr

08001738 <SetLowSDA>:
 8001738:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800173a:	4d0d      	ldr	r5, [pc, #52]	; (8001770 <SetLowSDA+0x38>)
 800173c:	2301      	movs	r3, #1
 800173e:	2203      	movs	r2, #3
 8001740:	2480      	movs	r4, #128	; 0x80
 8001742:	f88d 3004 	strb.w	r3, [sp, #4]
 8001746:	f88d 3006 	strb.w	r3, [sp, #6]
 800174a:	4628      	mov	r0, r5
 800174c:	2300      	movs	r3, #0
 800174e:	4669      	mov	r1, sp
 8001750:	f88d 2005 	strb.w	r2, [sp, #5]
 8001754:	f88d 3007 	strb.w	r3, [sp, #7]
 8001758:	9400      	str	r4, [sp, #0]
 800175a:	f000 fd0e 	bl	800217a <GPIO_Init>
 800175e:	4628      	mov	r0, r5
 8001760:	4621      	mov	r1, r4
 8001762:	f000 fd54 	bl	800220e <GPIO_ResetBits>
 8001766:	f7ff ffe1 	bl	800172c <i2c_delay>
 800176a:	b003      	add	sp, #12
 800176c:	bd30      	pop	{r4, r5, pc}
 800176e:	bf00      	nop
 8001770:	48000400 	.word	0x48000400

08001774 <SetHighSDA>:
 8001774:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001776:	4d0d      	ldr	r5, [pc, #52]	; (80017ac <SetHighSDA+0x38>)
 8001778:	2203      	movs	r2, #3
 800177a:	2300      	movs	r3, #0
 800177c:	2480      	movs	r4, #128	; 0x80
 800177e:	f88d 2005 	strb.w	r2, [sp, #5]
 8001782:	4628      	mov	r0, r5
 8001784:	2201      	movs	r2, #1
 8001786:	4669      	mov	r1, sp
 8001788:	f88d 3004 	strb.w	r3, [sp, #4]
 800178c:	f88d 2006 	strb.w	r2, [sp, #6]
 8001790:	f88d 3007 	strb.w	r3, [sp, #7]
 8001794:	9400      	str	r4, [sp, #0]
 8001796:	f000 fcf0 	bl	800217a <GPIO_Init>
 800179a:	4628      	mov	r0, r5
 800179c:	4621      	mov	r1, r4
 800179e:	f000 fd32 	bl	8002206 <GPIO_SetBits>
 80017a2:	f7ff ffc3 	bl	800172c <i2c_delay>
 80017a6:	b003      	add	sp, #12
 80017a8:	bd30      	pop	{r4, r5, pc}
 80017aa:	bf00      	nop
 80017ac:	48000400 	.word	0x48000400

080017b0 <SetLowSCL>:
 80017b0:	b508      	push	{r3, lr}
 80017b2:	4804      	ldr	r0, [pc, #16]	; (80017c4 <SetLowSCL+0x14>)
 80017b4:	2140      	movs	r1, #64	; 0x40
 80017b6:	f000 fd2a 	bl	800220e <GPIO_ResetBits>
 80017ba:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80017be:	f7ff bfb5 	b.w	800172c <i2c_delay>
 80017c2:	bf00      	nop
 80017c4:	48000400 	.word	0x48000400

080017c8 <SetHighSCL>:
 80017c8:	b508      	push	{r3, lr}
 80017ca:	4804      	ldr	r0, [pc, #16]	; (80017dc <SetHighSCL+0x14>)
 80017cc:	2140      	movs	r1, #64	; 0x40
 80017ce:	f000 fd1a 	bl	8002206 <GPIO_SetBits>
 80017d2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80017d6:	f7ff bfa9 	b.w	800172c <i2c_delay>
 80017da:	bf00      	nop
 80017dc:	48000400 	.word	0x48000400

080017e0 <i2c_0_init>:
 80017e0:	b507      	push	{r0, r1, r2, lr}
 80017e2:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 80017e6:	2101      	movs	r1, #1
 80017e8:	f000 fc90 	bl	800210c <RCC_AHBPeriphClockCmd>
 80017ec:	23c0      	movs	r3, #192	; 0xc0
 80017ee:	9300      	str	r3, [sp, #0]
 80017f0:	2301      	movs	r3, #1
 80017f2:	2203      	movs	r2, #3
 80017f4:	480a      	ldr	r0, [pc, #40]	; (8001820 <i2c_0_init+0x40>)
 80017f6:	f88d 3004 	strb.w	r3, [sp, #4]
 80017fa:	4669      	mov	r1, sp
 80017fc:	f88d 3006 	strb.w	r3, [sp, #6]
 8001800:	2300      	movs	r3, #0
 8001802:	f88d 2005 	strb.w	r2, [sp, #5]
 8001806:	f88d 3007 	strb.w	r3, [sp, #7]
 800180a:	f000 fcb6 	bl	800217a <GPIO_Init>
 800180e:	f7ff ffdb 	bl	80017c8 <SetHighSCL>
 8001812:	f7ff ff91 	bl	8001738 <SetLowSDA>
 8001816:	f7ff ffad 	bl	8001774 <SetHighSDA>
 800181a:	b003      	add	sp, #12
 800181c:	f85d fb04 	ldr.w	pc, [sp], #4
 8001820:	48000400 	.word	0x48000400

08001824 <i2cStart>:
 8001824:	b508      	push	{r3, lr}
 8001826:	f7ff ffcf 	bl	80017c8 <SetHighSCL>
 800182a:	f7ff ffa3 	bl	8001774 <SetHighSDA>
 800182e:	f7ff ffcb 	bl	80017c8 <SetHighSCL>
 8001832:	f7ff ff81 	bl	8001738 <SetLowSDA>
 8001836:	f7ff ffbb 	bl	80017b0 <SetLowSCL>
 800183a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800183e:	f7ff bf99 	b.w	8001774 <SetHighSDA>

08001842 <i2cStop>:
 8001842:	b508      	push	{r3, lr}
 8001844:	f7ff ffb4 	bl	80017b0 <SetLowSCL>
 8001848:	f7ff ff76 	bl	8001738 <SetLowSDA>
 800184c:	f7ff ffbc 	bl	80017c8 <SetHighSCL>
 8001850:	f7ff ff72 	bl	8001738 <SetLowSDA>
 8001854:	f7ff ffb8 	bl	80017c8 <SetHighSCL>
 8001858:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800185c:	f7ff bf8a 	b.w	8001774 <SetHighSDA>

08001860 <i2cWrite>:
 8001860:	b538      	push	{r3, r4, r5, lr}
 8001862:	4604      	mov	r4, r0
 8001864:	2508      	movs	r5, #8
 8001866:	f7ff ffa3 	bl	80017b0 <SetLowSCL>
 800186a:	0623      	lsls	r3, r4, #24
 800186c:	d502      	bpl.n	8001874 <i2cWrite+0x14>
 800186e:	f7ff ff81 	bl	8001774 <SetHighSDA>
 8001872:	e001      	b.n	8001878 <i2cWrite+0x18>
 8001874:	f7ff ff60 	bl	8001738 <SetLowSDA>
 8001878:	3d01      	subs	r5, #1
 800187a:	f7ff ffa5 	bl	80017c8 <SetHighSCL>
 800187e:	0064      	lsls	r4, r4, #1
 8001880:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001884:	b2e4      	uxtb	r4, r4
 8001886:	d1ee      	bne.n	8001866 <i2cWrite+0x6>
 8001888:	f7ff ff92 	bl	80017b0 <SetLowSCL>
 800188c:	f7ff ff72 	bl	8001774 <SetHighSDA>
 8001890:	f7ff ff9a 	bl	80017c8 <SetHighSCL>
 8001894:	4b05      	ldr	r3, [pc, #20]	; (80018ac <i2cWrite+0x4c>)
 8001896:	8a1c      	ldrh	r4, [r3, #16]
 8001898:	b2a4      	uxth	r4, r4
 800189a:	f7ff ff89 	bl	80017b0 <SetLowSCL>
 800189e:	f7ff ff45 	bl	800172c <i2c_delay>
 80018a2:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 80018a6:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 80018aa:	bd38      	pop	{r3, r4, r5, pc}
 80018ac:	48000400 	.word	0x48000400

080018b0 <i2cRead>:
 80018b0:	b570      	push	{r4, r5, r6, lr}
 80018b2:	4606      	mov	r6, r0
 80018b4:	f7ff ff7c 	bl	80017b0 <SetLowSCL>
 80018b8:	f7ff ff5c 	bl	8001774 <SetHighSDA>
 80018bc:	2508      	movs	r5, #8
 80018be:	2400      	movs	r4, #0
 80018c0:	f7ff ff82 	bl	80017c8 <SetHighSCL>
 80018c4:	4b0d      	ldr	r3, [pc, #52]	; (80018fc <i2cRead+0x4c>)
 80018c6:	8a1b      	ldrh	r3, [r3, #16]
 80018c8:	0064      	lsls	r4, r4, #1
 80018ca:	061a      	lsls	r2, r3, #24
 80018cc:	b2e4      	uxtb	r4, r4
 80018ce:	bf48      	it	mi
 80018d0:	3401      	addmi	r4, #1
 80018d2:	f105 35ff 	add.w	r5, r5, #4294967295
 80018d6:	bf48      	it	mi
 80018d8:	b2e4      	uxtbmi	r4, r4
 80018da:	f7ff ff69 	bl	80017b0 <SetLowSCL>
 80018de:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80018e2:	d1ed      	bne.n	80018c0 <i2cRead+0x10>
 80018e4:	b10e      	cbz	r6, 80018ea <i2cRead+0x3a>
 80018e6:	f7ff ff27 	bl	8001738 <SetLowSDA>
 80018ea:	f7ff ff6d 	bl	80017c8 <SetHighSCL>
 80018ee:	f7ff ff5f 	bl	80017b0 <SetLowSCL>
 80018f2:	f7ff ff1b 	bl	800172c <i2c_delay>
 80018f6:	4620      	mov	r0, r4
 80018f8:	bd70      	pop	{r4, r5, r6, pc}
 80018fa:	bf00      	nop
 80018fc:	48000400 	.word	0x48000400

08001900 <i2c_write_reg>:
 8001900:	b570      	push	{r4, r5, r6, lr}
 8001902:	4605      	mov	r5, r0
 8001904:	460c      	mov	r4, r1
 8001906:	4616      	mov	r6, r2
 8001908:	f7ff ff8c 	bl	8001824 <i2cStart>
 800190c:	4628      	mov	r0, r5
 800190e:	f7ff ffa7 	bl	8001860 <i2cWrite>
 8001912:	4620      	mov	r0, r4
 8001914:	f7ff ffa4 	bl	8001860 <i2cWrite>
 8001918:	4630      	mov	r0, r6
 800191a:	f7ff ffa1 	bl	8001860 <i2cWrite>
 800191e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001922:	f7ff bf8e 	b.w	8001842 <i2cStop>

08001926 <i2c_read_reg>:
 8001926:	b538      	push	{r3, r4, r5, lr}
 8001928:	4604      	mov	r4, r0
 800192a:	460d      	mov	r5, r1
 800192c:	f7ff ff7a 	bl	8001824 <i2cStart>
 8001930:	4620      	mov	r0, r4
 8001932:	f7ff ff95 	bl	8001860 <i2cWrite>
 8001936:	4628      	mov	r0, r5
 8001938:	f7ff ff92 	bl	8001860 <i2cWrite>
 800193c:	f7ff ff72 	bl	8001824 <i2cStart>
 8001940:	f044 0001 	orr.w	r0, r4, #1
 8001944:	f7ff ff8c 	bl	8001860 <i2cWrite>
 8001948:	2000      	movs	r0, #0
 800194a:	f7ff ffb1 	bl	80018b0 <i2cRead>
 800194e:	4604      	mov	r4, r0
 8001950:	f7ff ff77 	bl	8001842 <i2cStop>
 8001954:	4620      	mov	r0, r4
 8001956:	bd38      	pop	{r3, r4, r5, pc}

08001958 <uart_write>:
 8001958:	4b03      	ldr	r3, [pc, #12]	; (8001968 <uart_write+0x10>)
 800195a:	69da      	ldr	r2, [r3, #28]
 800195c:	0612      	lsls	r2, r2, #24
 800195e:	d401      	bmi.n	8001964 <uart_write+0xc>
 8001960:	bf00      	nop
 8001962:	e7f9      	b.n	8001958 <uart_write>
 8001964:	8518      	strh	r0, [r3, #40]	; 0x28
 8001966:	4770      	bx	lr
 8001968:	40013800 	.word	0x40013800

0800196c <uart_is_char>:
 800196c:	4b0a      	ldr	r3, [pc, #40]	; (8001998 <uart_is_char+0x2c>)
 800196e:	4a0b      	ldr	r2, [pc, #44]	; (800199c <uart_is_char+0x30>)
 8001970:	6819      	ldr	r1, [r3, #0]
 8001972:	6812      	ldr	r2, [r2, #0]
 8001974:	4291      	cmp	r1, r2
 8001976:	d00c      	beq.n	8001992 <uart_is_char+0x26>
 8001978:	681a      	ldr	r2, [r3, #0]
 800197a:	4909      	ldr	r1, [pc, #36]	; (80019a0 <uart_is_char+0x34>)
 800197c:	5c88      	ldrb	r0, [r1, r2]
 800197e:	681a      	ldr	r2, [r3, #0]
 8001980:	3201      	adds	r2, #1
 8001982:	601a      	str	r2, [r3, #0]
 8001984:	681a      	ldr	r2, [r3, #0]
 8001986:	2a0f      	cmp	r2, #15
 8001988:	b2c0      	uxtb	r0, r0
 800198a:	d904      	bls.n	8001996 <uart_is_char+0x2a>
 800198c:	2200      	movs	r2, #0
 800198e:	601a      	str	r2, [r3, #0]
 8001990:	4770      	bx	lr
 8001992:	f64f 70ff 	movw	r0, #65535	; 0xffff
 8001996:	4770      	bx	lr
 8001998:	20000a04 	.word	0x20000a04
 800199c:	20000a00 	.word	0x20000a00
 80019a0:	200009f0 	.word	0x200009f0

080019a4 <uart_read>:
 80019a4:	b508      	push	{r3, lr}
 80019a6:	f7ff ffe1 	bl	800196c <uart_is_char>
 80019aa:	f64f 73ff 	movw	r3, #65535	; 0xffff
 80019ae:	4298      	cmp	r0, r3
 80019b0:	d101      	bne.n	80019b6 <uart_read+0x12>
 80019b2:	bf00      	nop
 80019b4:	e7f7      	b.n	80019a6 <uart_read+0x2>
 80019b6:	b2c0      	uxtb	r0, r0
 80019b8:	bd08      	pop	{r3, pc}
	...

080019bc <uart_init>:
 80019bc:	b530      	push	{r4, r5, lr}
 80019be:	4b2c      	ldr	r3, [pc, #176]	; (8001a70 <uart_init+0xb4>)
 80019c0:	4d2c      	ldr	r5, [pc, #176]	; (8001a74 <uart_init+0xb8>)
 80019c2:	2400      	movs	r4, #0
 80019c4:	601c      	str	r4, [r3, #0]
 80019c6:	4b2c      	ldr	r3, [pc, #176]	; (8001a78 <uart_init+0xbc>)
 80019c8:	b08b      	sub	sp, #44	; 0x2c
 80019ca:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80019ce:	2101      	movs	r1, #1
 80019d0:	601c      	str	r4, [r3, #0]
 80019d2:	f000 fb9b 	bl	800210c <RCC_AHBPeriphClockCmd>
 80019d6:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 80019da:	2101      	movs	r1, #1
 80019dc:	f000 fba4 	bl	8002128 <RCC_APB2PeriphClockCmd>
 80019e0:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 80019e4:	9302      	str	r3, [sp, #8]
 80019e6:	2302      	movs	r3, #2
 80019e8:	f88d 300c 	strb.w	r3, [sp, #12]
 80019ec:	a902      	add	r1, sp, #8
 80019ee:	2303      	movs	r3, #3
 80019f0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80019f4:	f88d 300d 	strb.w	r3, [sp, #13]
 80019f8:	f88d 400e 	strb.w	r4, [sp, #14]
 80019fc:	f88d 400f 	strb.w	r4, [sp, #15]
 8001a00:	f000 fbbb 	bl	800217a <GPIO_Init>
 8001a04:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001a08:	2109      	movs	r1, #9
 8001a0a:	2207      	movs	r2, #7
 8001a0c:	f000 fc03 	bl	8002216 <GPIO_PinAFConfig>
 8001a10:	2207      	movs	r2, #7
 8001a12:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001a16:	210a      	movs	r1, #10
 8001a18:	f000 fbfd 	bl	8002216 <GPIO_PinAFConfig>
 8001a1c:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001a20:	9304      	str	r3, [sp, #16]
 8001a22:	4628      	mov	r0, r5
 8001a24:	230c      	movs	r3, #12
 8001a26:	a904      	add	r1, sp, #16
 8001a28:	9308      	str	r3, [sp, #32]
 8001a2a:	9405      	str	r4, [sp, #20]
 8001a2c:	9406      	str	r4, [sp, #24]
 8001a2e:	9407      	str	r4, [sp, #28]
 8001a30:	9409      	str	r4, [sp, #36]	; 0x24
 8001a32:	f000 f855 	bl	8001ae0 <USART_Init>
 8001a36:	4628      	mov	r0, r5
 8001a38:	2101      	movs	r1, #1
 8001a3a:	f000 f8b3 	bl	8001ba4 <USART_Cmd>
 8001a3e:	2201      	movs	r2, #1
 8001a40:	4628      	mov	r0, r5
 8001a42:	490e      	ldr	r1, [pc, #56]	; (8001a7c <uart_init+0xc0>)
 8001a44:	f000 f8be 	bl	8001bc4 <USART_ITConfig>
 8001a48:	2325      	movs	r3, #37	; 0x25
 8001a4a:	f88d 4005 	strb.w	r4, [sp, #5]
 8001a4e:	f88d 4006 	strb.w	r4, [sp, #6]
 8001a52:	a801      	add	r0, sp, #4
 8001a54:	2401      	movs	r4, #1
 8001a56:	f88d 3004 	strb.w	r3, [sp, #4]
 8001a5a:	f88d 4007 	strb.w	r4, [sp, #7]
 8001a5e:	f000 fc83 	bl	8002368 <NVIC_Init>
 8001a62:	4628      	mov	r0, r5
 8001a64:	4621      	mov	r1, r4
 8001a66:	f000 f89d 	bl	8001ba4 <USART_Cmd>
 8001a6a:	b00b      	add	sp, #44	; 0x2c
 8001a6c:	bd30      	pop	{r4, r5, pc}
 8001a6e:	bf00      	nop
 8001a70:	20000a00 	.word	0x20000a00
 8001a74:	40013800 	.word	0x40013800
 8001a78:	20000a04 	.word	0x20000a04
 8001a7c:	00050105 	.word	0x00050105

08001a80 <USART1_IRQHandler>:
 8001a80:	b508      	push	{r3, lr}
 8001a82:	480d      	ldr	r0, [pc, #52]	; (8001ab8 <USART1_IRQHandler+0x38>)
 8001a84:	490d      	ldr	r1, [pc, #52]	; (8001abc <USART1_IRQHandler+0x3c>)
 8001a86:	f000 f8b6 	bl	8001bf6 <USART_GetITStatus>
 8001a8a:	b178      	cbz	r0, 8001aac <USART1_IRQHandler+0x2c>
 8001a8c:	480a      	ldr	r0, [pc, #40]	; (8001ab8 <USART1_IRQHandler+0x38>)
 8001a8e:	f000 f894 	bl	8001bba <USART_ReceiveData>
 8001a92:	4b0b      	ldr	r3, [pc, #44]	; (8001ac0 <USART1_IRQHandler+0x40>)
 8001a94:	490b      	ldr	r1, [pc, #44]	; (8001ac4 <USART1_IRQHandler+0x44>)
 8001a96:	681a      	ldr	r2, [r3, #0]
 8001a98:	b2c0      	uxtb	r0, r0
 8001a9a:	5488      	strb	r0, [r1, r2]
 8001a9c:	681a      	ldr	r2, [r3, #0]
 8001a9e:	3201      	adds	r2, #1
 8001aa0:	601a      	str	r2, [r3, #0]
 8001aa2:	681a      	ldr	r2, [r3, #0]
 8001aa4:	2a0f      	cmp	r2, #15
 8001aa6:	bf84      	itt	hi
 8001aa8:	2200      	movhi	r2, #0
 8001aaa:	601a      	strhi	r2, [r3, #0]
 8001aac:	4802      	ldr	r0, [pc, #8]	; (8001ab8 <USART1_IRQHandler+0x38>)
 8001aae:	4903      	ldr	r1, [pc, #12]	; (8001abc <USART1_IRQHandler+0x3c>)
 8001ab0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001ab4:	f000 b8be 	b.w	8001c34 <USART_ClearITPendingBit>
 8001ab8:	40013800 	.word	0x40013800
 8001abc:	00050105 	.word	0x00050105
 8001ac0:	20000a00 	.word	0x20000a00
 8001ac4:	200009f0 	.word	0x200009f0

08001ac8 <uart_clear_buffer>:
 8001ac8:	b672      	cpsid	i
 8001aca:	2300      	movs	r3, #0
 8001acc:	4a03      	ldr	r2, [pc, #12]	; (8001adc <uart_clear_buffer+0x14>)
 8001ace:	2100      	movs	r1, #0
 8001ad0:	54d1      	strb	r1, [r2, r3]
 8001ad2:	3301      	adds	r3, #1
 8001ad4:	2b10      	cmp	r3, #16
 8001ad6:	d1f9      	bne.n	8001acc <uart_clear_buffer+0x4>
 8001ad8:	b662      	cpsie	i
 8001ada:	4770      	bx	lr
 8001adc:	200009f0 	.word	0x200009f0

08001ae0 <USART_Init>:
 8001ae0:	b530      	push	{r4, r5, lr}
 8001ae2:	4604      	mov	r4, r0
 8001ae4:	b099      	sub	sp, #100	; 0x64
 8001ae6:	460d      	mov	r5, r1
 8001ae8:	bf00      	nop
 8001aea:	bf00      	nop
 8001aec:	bf00      	nop
 8001aee:	bf00      	nop
 8001af0:	bf00      	nop
 8001af2:	bf00      	nop
 8001af4:	bf00      	nop
 8001af6:	6803      	ldr	r3, [r0, #0]
 8001af8:	f023 0301 	bic.w	r3, r3, #1
 8001afc:	6003      	str	r3, [r0, #0]
 8001afe:	6842      	ldr	r2, [r0, #4]
 8001b00:	688b      	ldr	r3, [r1, #8]
 8001b02:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 8001b06:	4313      	orrs	r3, r2
 8001b08:	6043      	str	r3, [r0, #4]
 8001b0a:	686a      	ldr	r2, [r5, #4]
 8001b0c:	68eb      	ldr	r3, [r5, #12]
 8001b0e:	6801      	ldr	r1, [r0, #0]
 8001b10:	431a      	orrs	r2, r3
 8001b12:	692b      	ldr	r3, [r5, #16]
 8001b14:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 8001b18:	f021 010c 	bic.w	r1, r1, #12
 8001b1c:	4313      	orrs	r3, r2
 8001b1e:	430b      	orrs	r3, r1
 8001b20:	6003      	str	r3, [r0, #0]
 8001b22:	6882      	ldr	r2, [r0, #8]
 8001b24:	696b      	ldr	r3, [r5, #20]
 8001b26:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 8001b2a:	4313      	orrs	r3, r2
 8001b2c:	6083      	str	r3, [r0, #8]
 8001b2e:	a801      	add	r0, sp, #4
 8001b30:	f000 f960 	bl	8001df4 <RCC_GetClocksFreq>
 8001b34:	4b17      	ldr	r3, [pc, #92]	; (8001b94 <USART_Init+0xb4>)
 8001b36:	429c      	cmp	r4, r3
 8001b38:	d101      	bne.n	8001b3e <USART_Init+0x5e>
 8001b3a:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 8001b3c:	e00e      	b.n	8001b5c <USART_Init+0x7c>
 8001b3e:	4b16      	ldr	r3, [pc, #88]	; (8001b98 <USART_Init+0xb8>)
 8001b40:	429c      	cmp	r4, r3
 8001b42:	d101      	bne.n	8001b48 <USART_Init+0x68>
 8001b44:	9a10      	ldr	r2, [sp, #64]	; 0x40
 8001b46:	e009      	b.n	8001b5c <USART_Init+0x7c>
 8001b48:	4b14      	ldr	r3, [pc, #80]	; (8001b9c <USART_Init+0xbc>)
 8001b4a:	429c      	cmp	r4, r3
 8001b4c:	d101      	bne.n	8001b52 <USART_Init+0x72>
 8001b4e:	9a11      	ldr	r2, [sp, #68]	; 0x44
 8001b50:	e004      	b.n	8001b5c <USART_Init+0x7c>
 8001b52:	4b13      	ldr	r3, [pc, #76]	; (8001ba0 <USART_Init+0xc0>)
 8001b54:	429c      	cmp	r4, r3
 8001b56:	bf0c      	ite	eq
 8001b58:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 8001b5a:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 8001b5c:	6823      	ldr	r3, [r4, #0]
 8001b5e:	6829      	ldr	r1, [r5, #0]
 8001b60:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 8001b64:	bf18      	it	ne
 8001b66:	0052      	lslne	r2, r2, #1
 8001b68:	fbb2 f3f1 	udiv	r3, r2, r1
 8001b6c:	fb01 2213 	mls	r2, r1, r3, r2
 8001b70:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 8001b74:	6822      	ldr	r2, [r4, #0]
 8001b76:	bf28      	it	cs
 8001b78:	3301      	addcs	r3, #1
 8001b7a:	0412      	lsls	r2, r2, #16
 8001b7c:	d506      	bpl.n	8001b8c <USART_Init+0xac>
 8001b7e:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 8001b82:	f3c3 0142 	ubfx	r1, r3, #1, #3
 8001b86:	401a      	ands	r2, r3
 8001b88:	ea41 0302 	orr.w	r3, r1, r2
 8001b8c:	b29b      	uxth	r3, r3
 8001b8e:	81a3      	strh	r3, [r4, #12]
 8001b90:	b019      	add	sp, #100	; 0x64
 8001b92:	bd30      	pop	{r4, r5, pc}
 8001b94:	40013800 	.word	0x40013800
 8001b98:	40004400 	.word	0x40004400
 8001b9c:	40004800 	.word	0x40004800
 8001ba0:	40004c00 	.word	0x40004c00

08001ba4 <USART_Cmd>:
 8001ba4:	bf00      	nop
 8001ba6:	bf00      	nop
 8001ba8:	6803      	ldr	r3, [r0, #0]
 8001baa:	b111      	cbz	r1, 8001bb2 <USART_Cmd+0xe>
 8001bac:	f043 0301 	orr.w	r3, r3, #1
 8001bb0:	e001      	b.n	8001bb6 <USART_Cmd+0x12>
 8001bb2:	f023 0301 	bic.w	r3, r3, #1
 8001bb6:	6003      	str	r3, [r0, #0]
 8001bb8:	4770      	bx	lr

08001bba <USART_ReceiveData>:
 8001bba:	bf00      	nop
 8001bbc:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8001bbe:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8001bc2:	4770      	bx	lr

08001bc4 <USART_ITConfig>:
 8001bc4:	b510      	push	{r4, lr}
 8001bc6:	bf00      	nop
 8001bc8:	bf00      	nop
 8001bca:	bf00      	nop
 8001bcc:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8001bd0:	2401      	movs	r4, #1
 8001bd2:	b2c9      	uxtb	r1, r1
 8001bd4:	2b02      	cmp	r3, #2
 8001bd6:	fa04 f101 	lsl.w	r1, r4, r1
 8001bda:	d101      	bne.n	8001be0 <USART_ITConfig+0x1c>
 8001bdc:	3004      	adds	r0, #4
 8001bde:	e002      	b.n	8001be6 <USART_ITConfig+0x22>
 8001be0:	2b03      	cmp	r3, #3
 8001be2:	bf08      	it	eq
 8001be4:	3008      	addeq	r0, #8
 8001be6:	6803      	ldr	r3, [r0, #0]
 8001be8:	b10a      	cbz	r2, 8001bee <USART_ITConfig+0x2a>
 8001bea:	4319      	orrs	r1, r3
 8001bec:	e001      	b.n	8001bf2 <USART_ITConfig+0x2e>
 8001bee:	ea23 0101 	bic.w	r1, r3, r1
 8001bf2:	6001      	str	r1, [r0, #0]
 8001bf4:	bd10      	pop	{r4, pc}

08001bf6 <USART_GetITStatus>:
 8001bf6:	b510      	push	{r4, lr}
 8001bf8:	bf00      	nop
 8001bfa:	bf00      	nop
 8001bfc:	2401      	movs	r4, #1
 8001bfe:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8001c02:	b2cb      	uxtb	r3, r1
 8001c04:	42a2      	cmp	r2, r4
 8001c06:	fa04 f303 	lsl.w	r3, r4, r3
 8001c0a:	d101      	bne.n	8001c10 <USART_GetITStatus+0x1a>
 8001c0c:	6802      	ldr	r2, [r0, #0]
 8001c0e:	e003      	b.n	8001c18 <USART_GetITStatus+0x22>
 8001c10:	2a02      	cmp	r2, #2
 8001c12:	bf0c      	ite	eq
 8001c14:	6842      	ldreq	r2, [r0, #4]
 8001c16:	6882      	ldrne	r2, [r0, #8]
 8001c18:	4013      	ands	r3, r2
 8001c1a:	69c2      	ldr	r2, [r0, #28]
 8001c1c:	b143      	cbz	r3, 8001c30 <USART_GetITStatus+0x3a>
 8001c1e:	2301      	movs	r3, #1
 8001c20:	0c09      	lsrs	r1, r1, #16
 8001c22:	fa03 f101 	lsl.w	r1, r3, r1
 8001c26:	4211      	tst	r1, r2
 8001c28:	bf0c      	ite	eq
 8001c2a:	2000      	moveq	r0, #0
 8001c2c:	2001      	movne	r0, #1
 8001c2e:	bd10      	pop	{r4, pc}
 8001c30:	4618      	mov	r0, r3
 8001c32:	bd10      	pop	{r4, pc}

08001c34 <USART_ClearITPendingBit>:
 8001c34:	bf00      	nop
 8001c36:	bf00      	nop
 8001c38:	2301      	movs	r3, #1
 8001c3a:	0c09      	lsrs	r1, r1, #16
 8001c3c:	fa03 f101 	lsl.w	r1, r3, r1
 8001c40:	6201      	str	r1, [r0, #32]
 8001c42:	4770      	bx	lr

08001c44 <sys_tick_init>:
 8001c44:	4b05      	ldr	r3, [pc, #20]	; (8001c5c <sys_tick_init+0x18>)
 8001c46:	4a06      	ldr	r2, [pc, #24]	; (8001c60 <sys_tick_init+0x1c>)
 8001c48:	605a      	str	r2, [r3, #4]
 8001c4a:	4a06      	ldr	r2, [pc, #24]	; (8001c64 <sys_tick_init+0x20>)
 8001c4c:	21f0      	movs	r1, #240	; 0xf0
 8001c4e:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8001c52:	2200      	movs	r2, #0
 8001c54:	609a      	str	r2, [r3, #8]
 8001c56:	2207      	movs	r2, #7
 8001c58:	601a      	str	r2, [r3, #0]
 8001c5a:	4770      	bx	lr
 8001c5c:	e000e010 	.word	0xe000e010
 8001c60:	00029040 	.word	0x00029040
 8001c64:	e000ed00 	.word	0xe000ed00

08001c68 <sleep>:
 8001c68:	bf30      	wfi
 8001c6a:	4770      	bx	lr

08001c6c <sytem_clock_init>:
 8001c6c:	f000 b800 	b.w	8001c70 <SystemInit>

08001c70 <SystemInit>:
 8001c70:	4b3b      	ldr	r3, [pc, #236]	; (8001d60 <SystemInit+0xf0>)
 8001c72:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001c76:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001c7a:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001c7e:	4b39      	ldr	r3, [pc, #228]	; (8001d64 <SystemInit+0xf4>)
 8001c80:	681a      	ldr	r2, [r3, #0]
 8001c82:	f042 0201 	orr.w	r2, r2, #1
 8001c86:	601a      	str	r2, [r3, #0]
 8001c88:	6859      	ldr	r1, [r3, #4]
 8001c8a:	4a37      	ldr	r2, [pc, #220]	; (8001d68 <SystemInit+0xf8>)
 8001c8c:	400a      	ands	r2, r1
 8001c8e:	605a      	str	r2, [r3, #4]
 8001c90:	681a      	ldr	r2, [r3, #0]
 8001c92:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 8001c96:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8001c9a:	601a      	str	r2, [r3, #0]
 8001c9c:	681a      	ldr	r2, [r3, #0]
 8001c9e:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 8001ca2:	601a      	str	r2, [r3, #0]
 8001ca4:	685a      	ldr	r2, [r3, #4]
 8001ca6:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8001caa:	605a      	str	r2, [r3, #4]
 8001cac:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001cae:	f022 020f 	bic.w	r2, r2, #15
 8001cb2:	62da      	str	r2, [r3, #44]	; 0x2c
 8001cb4:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8001cb6:	4a2d      	ldr	r2, [pc, #180]	; (8001d6c <SystemInit+0xfc>)
 8001cb8:	b082      	sub	sp, #8
 8001cba:	400a      	ands	r2, r1
 8001cbc:	631a      	str	r2, [r3, #48]	; 0x30
 8001cbe:	2200      	movs	r2, #0
 8001cc0:	609a      	str	r2, [r3, #8]
 8001cc2:	9200      	str	r2, [sp, #0]
 8001cc4:	9201      	str	r2, [sp, #4]
 8001cc6:	681a      	ldr	r2, [r3, #0]
 8001cc8:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001ccc:	601a      	str	r2, [r3, #0]
 8001cce:	4b25      	ldr	r3, [pc, #148]	; (8001d64 <SystemInit+0xf4>)
 8001cd0:	681a      	ldr	r2, [r3, #0]
 8001cd2:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8001cd6:	9201      	str	r2, [sp, #4]
 8001cd8:	9a00      	ldr	r2, [sp, #0]
 8001cda:	3201      	adds	r2, #1
 8001cdc:	9200      	str	r2, [sp, #0]
 8001cde:	9a01      	ldr	r2, [sp, #4]
 8001ce0:	b91a      	cbnz	r2, 8001cea <SystemInit+0x7a>
 8001ce2:	9a00      	ldr	r2, [sp, #0]
 8001ce4:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8001ce8:	d1f1      	bne.n	8001cce <SystemInit+0x5e>
 8001cea:	681b      	ldr	r3, [r3, #0]
 8001cec:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8001cf0:	bf18      	it	ne
 8001cf2:	2301      	movne	r3, #1
 8001cf4:	9301      	str	r3, [sp, #4]
 8001cf6:	9b01      	ldr	r3, [sp, #4]
 8001cf8:	2b01      	cmp	r3, #1
 8001cfa:	d005      	beq.n	8001d08 <SystemInit+0x98>
 8001cfc:	4b18      	ldr	r3, [pc, #96]	; (8001d60 <SystemInit+0xf0>)
 8001cfe:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8001d02:	609a      	str	r2, [r3, #8]
 8001d04:	b002      	add	sp, #8
 8001d06:	4770      	bx	lr
 8001d08:	4b19      	ldr	r3, [pc, #100]	; (8001d70 <SystemInit+0x100>)
 8001d0a:	2212      	movs	r2, #18
 8001d0c:	601a      	str	r2, [r3, #0]
 8001d0e:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 8001d12:	685a      	ldr	r2, [r3, #4]
 8001d14:	605a      	str	r2, [r3, #4]
 8001d16:	685a      	ldr	r2, [r3, #4]
 8001d18:	605a      	str	r2, [r3, #4]
 8001d1a:	685a      	ldr	r2, [r3, #4]
 8001d1c:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8001d20:	605a      	str	r2, [r3, #4]
 8001d22:	685a      	ldr	r2, [r3, #4]
 8001d24:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8001d28:	605a      	str	r2, [r3, #4]
 8001d2a:	685a      	ldr	r2, [r3, #4]
 8001d2c:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8001d30:	605a      	str	r2, [r3, #4]
 8001d32:	681a      	ldr	r2, [r3, #0]
 8001d34:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8001d38:	601a      	str	r2, [r3, #0]
 8001d3a:	6819      	ldr	r1, [r3, #0]
 8001d3c:	4a09      	ldr	r2, [pc, #36]	; (8001d64 <SystemInit+0xf4>)
 8001d3e:	0189      	lsls	r1, r1, #6
 8001d40:	d5fb      	bpl.n	8001d3a <SystemInit+0xca>
 8001d42:	6853      	ldr	r3, [r2, #4]
 8001d44:	f023 0303 	bic.w	r3, r3, #3
 8001d48:	6053      	str	r3, [r2, #4]
 8001d4a:	6853      	ldr	r3, [r2, #4]
 8001d4c:	f043 0302 	orr.w	r3, r3, #2
 8001d50:	6053      	str	r3, [r2, #4]
 8001d52:	4b04      	ldr	r3, [pc, #16]	; (8001d64 <SystemInit+0xf4>)
 8001d54:	685b      	ldr	r3, [r3, #4]
 8001d56:	f003 030c 	and.w	r3, r3, #12
 8001d5a:	2b08      	cmp	r3, #8
 8001d5c:	d1f9      	bne.n	8001d52 <SystemInit+0xe2>
 8001d5e:	e7cd      	b.n	8001cfc <SystemInit+0x8c>
 8001d60:	e000ed00 	.word	0xe000ed00
 8001d64:	40021000 	.word	0x40021000
 8001d68:	f87fc00c 	.word	0xf87fc00c
 8001d6c:	ff00fccc 	.word	0xff00fccc
 8001d70:	40022000 	.word	0x40022000

08001d74 <Default_Handler>:
 8001d74:	4668      	mov	r0, sp
 8001d76:	f020 0107 	bic.w	r1, r0, #7
 8001d7a:	468d      	mov	sp, r1
 8001d7c:	bf00      	nop
 8001d7e:	e7fd      	b.n	8001d7c <Default_Handler+0x8>

08001d80 <HardFault_Handler>:
 8001d80:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001d84:	f000 fa5e 	bl	8002244 <led_on>
 8001d88:	4b06      	ldr	r3, [pc, #24]	; (8001da4 <HardFault_Handler+0x24>)
 8001d8a:	3b01      	subs	r3, #1
 8001d8c:	d001      	beq.n	8001d92 <HardFault_Handler+0x12>
 8001d8e:	bf00      	nop
 8001d90:	e7fb      	b.n	8001d8a <HardFault_Handler+0xa>
 8001d92:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001d96:	f000 fa6b 	bl	8002270 <led_off>
 8001d9a:	4b02      	ldr	r3, [pc, #8]	; (8001da4 <HardFault_Handler+0x24>)
 8001d9c:	3b01      	subs	r3, #1
 8001d9e:	d0ef      	beq.n	8001d80 <HardFault_Handler>
 8001da0:	bf00      	nop
 8001da2:	e7fb      	b.n	8001d9c <HardFault_Handler+0x1c>
 8001da4:	00989681 	.word	0x00989681

08001da8 <_reset_init>:
 8001da8:	4a0e      	ldr	r2, [pc, #56]	; (8001de4 <_reset_init+0x3c>)
 8001daa:	480f      	ldr	r0, [pc, #60]	; (8001de8 <_reset_init+0x40>)
 8001dac:	1a80      	subs	r0, r0, r2
 8001dae:	1080      	asrs	r0, r0, #2
 8001db0:	2300      	movs	r3, #0
 8001db2:	4283      	cmp	r3, r0
 8001db4:	d006      	beq.n	8001dc4 <_reset_init+0x1c>
 8001db6:	490d      	ldr	r1, [pc, #52]	; (8001dec <_reset_init+0x44>)
 8001db8:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8001dbc:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001dc0:	3301      	adds	r3, #1
 8001dc2:	e7f6      	b.n	8001db2 <_reset_init+0xa>
 8001dc4:	4b0a      	ldr	r3, [pc, #40]	; (8001df0 <_reset_init+0x48>)
 8001dc6:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001dca:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001dce:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001dd2:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8001dd6:	685a      	ldr	r2, [r3, #4]
 8001dd8:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8001ddc:	605a      	str	r2, [r3, #4]
 8001dde:	f7fe bc35 	b.w	800064c <main>
 8001de2:	bf00      	nop
 8001de4:	20000000 	.word	0x20000000
 8001de8:	20000030 	.word	0x20000030
 8001dec:	08002540 	.word	0x08002540
 8001df0:	e000ed00 	.word	0xe000ed00

08001df4 <RCC_GetClocksFreq>:
 8001df4:	4ba5      	ldr	r3, [pc, #660]	; (800208c <RCC_GetClocksFreq+0x298>)
 8001df6:	685a      	ldr	r2, [r3, #4]
 8001df8:	f002 020c 	and.w	r2, r2, #12
 8001dfc:	2a04      	cmp	r2, #4
 8001dfe:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8001e02:	d005      	beq.n	8001e10 <RCC_GetClocksFreq+0x1c>
 8001e04:	2a08      	cmp	r2, #8
 8001e06:	d006      	beq.n	8001e16 <RCC_GetClocksFreq+0x22>
 8001e08:	4ba1      	ldr	r3, [pc, #644]	; (8002090 <RCC_GetClocksFreq+0x29c>)
 8001e0a:	6003      	str	r3, [r0, #0]
 8001e0c:	b9ba      	cbnz	r2, 8001e3e <RCC_GetClocksFreq+0x4a>
 8001e0e:	e017      	b.n	8001e40 <RCC_GetClocksFreq+0x4c>
 8001e10:	4b9f      	ldr	r3, [pc, #636]	; (8002090 <RCC_GetClocksFreq+0x29c>)
 8001e12:	6003      	str	r3, [r0, #0]
 8001e14:	e013      	b.n	8001e3e <RCC_GetClocksFreq+0x4a>
 8001e16:	6859      	ldr	r1, [r3, #4]
 8001e18:	685c      	ldr	r4, [r3, #4]
 8001e1a:	f3c1 4183 	ubfx	r1, r1, #18, #4
 8001e1e:	03e2      	lsls	r2, r4, #15
 8001e20:	f101 0102 	add.w	r1, r1, #2
 8001e24:	d401      	bmi.n	8001e2a <RCC_GetClocksFreq+0x36>
 8001e26:	4a9b      	ldr	r2, [pc, #620]	; (8002094 <RCC_GetClocksFreq+0x2a0>)
 8001e28:	e006      	b.n	8001e38 <RCC_GetClocksFreq+0x44>
 8001e2a:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001e2c:	4b98      	ldr	r3, [pc, #608]	; (8002090 <RCC_GetClocksFreq+0x29c>)
 8001e2e:	f002 020f 	and.w	r2, r2, #15
 8001e32:	3201      	adds	r2, #1
 8001e34:	fbb3 f2f2 	udiv	r2, r3, r2
 8001e38:	434a      	muls	r2, r1
 8001e3a:	6002      	str	r2, [r0, #0]
 8001e3c:	e000      	b.n	8001e40 <RCC_GetClocksFreq+0x4c>
 8001e3e:	2200      	movs	r2, #0
 8001e40:	4f92      	ldr	r7, [pc, #584]	; (800208c <RCC_GetClocksFreq+0x298>)
 8001e42:	4d95      	ldr	r5, [pc, #596]	; (8002098 <RCC_GetClocksFreq+0x2a4>)
 8001e44:	687b      	ldr	r3, [r7, #4]
 8001e46:	f8df 8254 	ldr.w	r8, [pc, #596]	; 800209c <RCC_GetClocksFreq+0x2a8>
 8001e4a:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8001e4e:	5cec      	ldrb	r4, [r5, r3]
 8001e50:	6803      	ldr	r3, [r0, #0]
 8001e52:	b2e4      	uxtb	r4, r4
 8001e54:	fa23 f104 	lsr.w	r1, r3, r4
 8001e58:	6041      	str	r1, [r0, #4]
 8001e5a:	687e      	ldr	r6, [r7, #4]
 8001e5c:	f3c6 2602 	ubfx	r6, r6, #8, #3
 8001e60:	5dae      	ldrb	r6, [r5, r6]
 8001e62:	fa21 f606 	lsr.w	r6, r1, r6
 8001e66:	6086      	str	r6, [r0, #8]
 8001e68:	f8d7 c004 	ldr.w	ip, [r7, #4]
 8001e6c:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8001e70:	f815 500c 	ldrb.w	r5, [r5, ip]
 8001e74:	b2ed      	uxtb	r5, r5
 8001e76:	40e9      	lsrs	r1, r5
 8001e78:	60c1      	str	r1, [r0, #12]
 8001e7a:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 8001e7e:	f3c9 1904 	ubfx	r9, r9, #4, #5
 8001e82:	f009 0c0f 	and.w	ip, r9, #15
 8001e86:	f019 0f10 	tst.w	r9, #16
 8001e8a:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 8001e8e:	fa1f fc8c 	uxth.w	ip, ip
 8001e92:	d007      	beq.n	8001ea4 <RCC_GetClocksFreq+0xb0>
 8001e94:	f1bc 0f00 	cmp.w	ip, #0
 8001e98:	d004      	beq.n	8001ea4 <RCC_GetClocksFreq+0xb0>
 8001e9a:	fbb2 fcfc 	udiv	ip, r2, ip
 8001e9e:	f8c0 c010 	str.w	ip, [r0, #16]
 8001ea2:	e000      	b.n	8001ea6 <RCC_GetClocksFreq+0xb2>
 8001ea4:	6103      	str	r3, [r0, #16]
 8001ea6:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 8001ea8:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 8001eac:	f00c 070f 	and.w	r7, ip, #15
 8001eb0:	f01c 0f10 	tst.w	ip, #16
 8001eb4:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 8001eb8:	b2bf      	uxth	r7, r7
 8001eba:	d004      	beq.n	8001ec6 <RCC_GetClocksFreq+0xd2>
 8001ebc:	b11f      	cbz	r7, 8001ec6 <RCC_GetClocksFreq+0xd2>
 8001ebe:	fbb2 f7f7 	udiv	r7, r2, r7
 8001ec2:	6147      	str	r7, [r0, #20]
 8001ec4:	e000      	b.n	8001ec8 <RCC_GetClocksFreq+0xd4>
 8001ec6:	6143      	str	r3, [r0, #20]
 8001ec8:	4f70      	ldr	r7, [pc, #448]	; (800208c <RCC_GetClocksFreq+0x298>)
 8001eca:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001ece:	f01c 0f10 	tst.w	ip, #16
 8001ed2:	bf0a      	itet	eq
 8001ed4:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 8002090 <RCC_GetClocksFreq+0x29c>
 8001ed8:	6183      	strne	r3, [r0, #24]
 8001eda:	f8c0 c018 	streq.w	ip, [r0, #24]
 8001ede:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001ee0:	06bf      	lsls	r7, r7, #26
 8001ee2:	bf56      	itet	pl
 8001ee4:	4f6a      	ldrpl	r7, [pc, #424]	; (8002090 <RCC_GetClocksFreq+0x29c>)
 8001ee6:	61c3      	strmi	r3, [r0, #28]
 8001ee8:	61c7      	strpl	r7, [r0, #28]
 8001eea:	4f68      	ldr	r7, [pc, #416]	; (800208c <RCC_GetClocksFreq+0x298>)
 8001eec:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001ef0:	f01c 0f40 	tst.w	ip, #64	; 0x40
 8001ef4:	bf0a      	itet	eq
 8001ef6:	f8df c198 	ldreq.w	ip, [pc, #408]	; 8002090 <RCC_GetClocksFreq+0x29c>
 8001efa:	6203      	strne	r3, [r0, #32]
 8001efc:	f8c0 c020 	streq.w	ip, [r0, #32]
 8001f00:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001f02:	05ff      	lsls	r7, r7, #23
 8001f04:	d506      	bpl.n	8001f14 <RCC_GetClocksFreq+0x120>
 8001f06:	4293      	cmp	r3, r2
 8001f08:	d104      	bne.n	8001f14 <RCC_GetClocksFreq+0x120>
 8001f0a:	42a5      	cmp	r5, r4
 8001f0c:	d102      	bne.n	8001f14 <RCC_GetClocksFreq+0x120>
 8001f0e:	005f      	lsls	r7, r3, #1
 8001f10:	6247      	str	r7, [r0, #36]	; 0x24
 8001f12:	e000      	b.n	8001f16 <RCC_GetClocksFreq+0x122>
 8001f14:	6241      	str	r1, [r0, #36]	; 0x24
 8001f16:	4f5d      	ldr	r7, [pc, #372]	; (800208c <RCC_GetClocksFreq+0x298>)
 8001f18:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001f1c:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 8001f20:	d008      	beq.n	8001f34 <RCC_GetClocksFreq+0x140>
 8001f22:	4293      	cmp	r3, r2
 8001f24:	d106      	bne.n	8001f34 <RCC_GetClocksFreq+0x140>
 8001f26:	42a5      	cmp	r5, r4
 8001f28:	d104      	bne.n	8001f34 <RCC_GetClocksFreq+0x140>
 8001f2a:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001f2e:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 8001f32:	e000      	b.n	8001f36 <RCC_GetClocksFreq+0x142>
 8001f34:	6281      	str	r1, [r0, #40]	; 0x28
 8001f36:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001f38:	05bf      	lsls	r7, r7, #22
 8001f3a:	d506      	bpl.n	8001f4a <RCC_GetClocksFreq+0x156>
 8001f3c:	4293      	cmp	r3, r2
 8001f3e:	d104      	bne.n	8001f4a <RCC_GetClocksFreq+0x156>
 8001f40:	42a5      	cmp	r5, r4
 8001f42:	d102      	bne.n	8001f4a <RCC_GetClocksFreq+0x156>
 8001f44:	005f      	lsls	r7, r3, #1
 8001f46:	62c7      	str	r7, [r0, #44]	; 0x2c
 8001f48:	e000      	b.n	8001f4c <RCC_GetClocksFreq+0x158>
 8001f4a:	62c1      	str	r1, [r0, #44]	; 0x2c
 8001f4c:	4f4f      	ldr	r7, [pc, #316]	; (800208c <RCC_GetClocksFreq+0x298>)
 8001f4e:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001f52:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 8001f56:	d008      	beq.n	8001f6a <RCC_GetClocksFreq+0x176>
 8001f58:	4293      	cmp	r3, r2
 8001f5a:	d106      	bne.n	8001f6a <RCC_GetClocksFreq+0x176>
 8001f5c:	42a5      	cmp	r5, r4
 8001f5e:	d104      	bne.n	8001f6a <RCC_GetClocksFreq+0x176>
 8001f60:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001f64:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8001f68:	e000      	b.n	8001f6c <RCC_GetClocksFreq+0x178>
 8001f6a:	64c1      	str	r1, [r0, #76]	; 0x4c
 8001f6c:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001f6e:	053f      	lsls	r7, r7, #20
 8001f70:	d506      	bpl.n	8001f80 <RCC_GetClocksFreq+0x18c>
 8001f72:	4293      	cmp	r3, r2
 8001f74:	d104      	bne.n	8001f80 <RCC_GetClocksFreq+0x18c>
 8001f76:	42a5      	cmp	r5, r4
 8001f78:	d102      	bne.n	8001f80 <RCC_GetClocksFreq+0x18c>
 8001f7a:	005f      	lsls	r7, r3, #1
 8001f7c:	6507      	str	r7, [r0, #80]	; 0x50
 8001f7e:	e000      	b.n	8001f82 <RCC_GetClocksFreq+0x18e>
 8001f80:	6501      	str	r1, [r0, #80]	; 0x50
 8001f82:	4f42      	ldr	r7, [pc, #264]	; (800208c <RCC_GetClocksFreq+0x298>)
 8001f84:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001f88:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 8001f8c:	d008      	beq.n	8001fa0 <RCC_GetClocksFreq+0x1ac>
 8001f8e:	4293      	cmp	r3, r2
 8001f90:	d106      	bne.n	8001fa0 <RCC_GetClocksFreq+0x1ac>
 8001f92:	42a5      	cmp	r5, r4
 8001f94:	d104      	bne.n	8001fa0 <RCC_GetClocksFreq+0x1ac>
 8001f96:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001f9a:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 8001f9e:	e000      	b.n	8001fa2 <RCC_GetClocksFreq+0x1ae>
 8001fa0:	6501      	str	r1, [r0, #80]	; 0x50
 8001fa2:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001fa4:	043f      	lsls	r7, r7, #16
 8001fa6:	d506      	bpl.n	8001fb6 <RCC_GetClocksFreq+0x1c2>
 8001fa8:	4293      	cmp	r3, r2
 8001faa:	d104      	bne.n	8001fb6 <RCC_GetClocksFreq+0x1c2>
 8001fac:	42a5      	cmp	r5, r4
 8001fae:	d102      	bne.n	8001fb6 <RCC_GetClocksFreq+0x1c2>
 8001fb0:	005a      	lsls	r2, r3, #1
 8001fb2:	6582      	str	r2, [r0, #88]	; 0x58
 8001fb4:	e000      	b.n	8001fb8 <RCC_GetClocksFreq+0x1c4>
 8001fb6:	6581      	str	r1, [r0, #88]	; 0x58
 8001fb8:	4a34      	ldr	r2, [pc, #208]	; (800208c <RCC_GetClocksFreq+0x298>)
 8001fba:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8001fbc:	07a4      	lsls	r4, r4, #30
 8001fbe:	d014      	beq.n	8001fea <RCC_GetClocksFreq+0x1f6>
 8001fc0:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001fc2:	f001 0103 	and.w	r1, r1, #3
 8001fc6:	2901      	cmp	r1, #1
 8001fc8:	d101      	bne.n	8001fce <RCC_GetClocksFreq+0x1da>
 8001fca:	6383      	str	r3, [r0, #56]	; 0x38
 8001fcc:	e00e      	b.n	8001fec <RCC_GetClocksFreq+0x1f8>
 8001fce:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001fd0:	f001 0103 	and.w	r1, r1, #3
 8001fd4:	2902      	cmp	r1, #2
 8001fd6:	d102      	bne.n	8001fde <RCC_GetClocksFreq+0x1ea>
 8001fd8:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001fdc:	e005      	b.n	8001fea <RCC_GetClocksFreq+0x1f6>
 8001fde:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001fe0:	f001 0103 	and.w	r1, r1, #3
 8001fe4:	2903      	cmp	r1, #3
 8001fe6:	d101      	bne.n	8001fec <RCC_GetClocksFreq+0x1f8>
 8001fe8:	4929      	ldr	r1, [pc, #164]	; (8002090 <RCC_GetClocksFreq+0x29c>)
 8001fea:	6381      	str	r1, [r0, #56]	; 0x38
 8001fec:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001fee:	4927      	ldr	r1, [pc, #156]	; (800208c <RCC_GetClocksFreq+0x298>)
 8001ff0:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 8001ff4:	d101      	bne.n	8001ffa <RCC_GetClocksFreq+0x206>
 8001ff6:	63c6      	str	r6, [r0, #60]	; 0x3c
 8001ff8:	e018      	b.n	800202c <RCC_GetClocksFreq+0x238>
 8001ffa:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001ffc:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8002000:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 8002004:	d101      	bne.n	800200a <RCC_GetClocksFreq+0x216>
 8002006:	63c3      	str	r3, [r0, #60]	; 0x3c
 8002008:	e010      	b.n	800202c <RCC_GetClocksFreq+0x238>
 800200a:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800200c:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8002010:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 8002014:	d102      	bne.n	800201c <RCC_GetClocksFreq+0x228>
 8002016:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800201a:	e006      	b.n	800202a <RCC_GetClocksFreq+0x236>
 800201c:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800201e:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8002022:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 8002026:	d101      	bne.n	800202c <RCC_GetClocksFreq+0x238>
 8002028:	4a19      	ldr	r2, [pc, #100]	; (8002090 <RCC_GetClocksFreq+0x29c>)
 800202a:	63c2      	str	r2, [r0, #60]	; 0x3c
 800202c:	4a17      	ldr	r2, [pc, #92]	; (800208c <RCC_GetClocksFreq+0x298>)
 800202e:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8002030:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8002034:	d101      	bne.n	800203a <RCC_GetClocksFreq+0x246>
 8002036:	6406      	str	r6, [r0, #64]	; 0x40
 8002038:	e018      	b.n	800206c <RCC_GetClocksFreq+0x278>
 800203a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800203c:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8002040:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8002044:	d101      	bne.n	800204a <RCC_GetClocksFreq+0x256>
 8002046:	6403      	str	r3, [r0, #64]	; 0x40
 8002048:	e010      	b.n	800206c <RCC_GetClocksFreq+0x278>
 800204a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800204c:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8002050:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 8002054:	d102      	bne.n	800205c <RCC_GetClocksFreq+0x268>
 8002056:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 800205a:	e006      	b.n	800206a <RCC_GetClocksFreq+0x276>
 800205c:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800205e:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8002062:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 8002066:	d101      	bne.n	800206c <RCC_GetClocksFreq+0x278>
 8002068:	4909      	ldr	r1, [pc, #36]	; (8002090 <RCC_GetClocksFreq+0x29c>)
 800206a:	6401      	str	r1, [r0, #64]	; 0x40
 800206c:	6b12      	ldr	r2, [r2, #48]	; 0x30
 800206e:	4907      	ldr	r1, [pc, #28]	; (800208c <RCC_GetClocksFreq+0x298>)
 8002070:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 8002074:	d101      	bne.n	800207a <RCC_GetClocksFreq+0x286>
 8002076:	6446      	str	r6, [r0, #68]	; 0x44
 8002078:	e023      	b.n	80020c2 <RCC_GetClocksFreq+0x2ce>
 800207a:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800207c:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8002080:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 8002084:	d10c      	bne.n	80020a0 <RCC_GetClocksFreq+0x2ac>
 8002086:	6443      	str	r3, [r0, #68]	; 0x44
 8002088:	e01b      	b.n	80020c2 <RCC_GetClocksFreq+0x2ce>
 800208a:	bf00      	nop
 800208c:	40021000 	.word	0x40021000
 8002090:	007a1200 	.word	0x007a1200
 8002094:	003d0900 	.word	0x003d0900
 8002098:	20000020 	.word	0x20000020
 800209c:	20000000 	.word	0x20000000
 80020a0:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80020a2:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80020a6:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 80020aa:	d102      	bne.n	80020b2 <RCC_GetClocksFreq+0x2be>
 80020ac:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80020b0:	e006      	b.n	80020c0 <RCC_GetClocksFreq+0x2cc>
 80020b2:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80020b4:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80020b8:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 80020bc:	d101      	bne.n	80020c2 <RCC_GetClocksFreq+0x2ce>
 80020be:	4a11      	ldr	r2, [pc, #68]	; (8002104 <RCC_GetClocksFreq+0x310>)
 80020c0:	6442      	str	r2, [r0, #68]	; 0x44
 80020c2:	4a11      	ldr	r2, [pc, #68]	; (8002108 <RCC_GetClocksFreq+0x314>)
 80020c4:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80020c6:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 80020ca:	d102      	bne.n	80020d2 <RCC_GetClocksFreq+0x2de>
 80020cc:	6486      	str	r6, [r0, #72]	; 0x48
 80020ce:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80020d2:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80020d4:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 80020d8:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 80020dc:	d00f      	beq.n	80020fe <RCC_GetClocksFreq+0x30a>
 80020de:	6b13      	ldr	r3, [r2, #48]	; 0x30
 80020e0:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80020e4:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 80020e8:	d102      	bne.n	80020f0 <RCC_GetClocksFreq+0x2fc>
 80020ea:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80020ee:	e006      	b.n	80020fe <RCC_GetClocksFreq+0x30a>
 80020f0:	6b13      	ldr	r3, [r2, #48]	; 0x30
 80020f2:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80020f6:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 80020fa:	d101      	bne.n	8002100 <RCC_GetClocksFreq+0x30c>
 80020fc:	4b01      	ldr	r3, [pc, #4]	; (8002104 <RCC_GetClocksFreq+0x310>)
 80020fe:	6483      	str	r3, [r0, #72]	; 0x48
 8002100:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8002104:	007a1200 	.word	0x007a1200
 8002108:	40021000 	.word	0x40021000

0800210c <RCC_AHBPeriphClockCmd>:
 800210c:	bf00      	nop
 800210e:	bf00      	nop
 8002110:	4b04      	ldr	r3, [pc, #16]	; (8002124 <RCC_AHBPeriphClockCmd+0x18>)
 8002112:	695a      	ldr	r2, [r3, #20]
 8002114:	b109      	cbz	r1, 800211a <RCC_AHBPeriphClockCmd+0xe>
 8002116:	4310      	orrs	r0, r2
 8002118:	e001      	b.n	800211e <RCC_AHBPeriphClockCmd+0x12>
 800211a:	ea22 0000 	bic.w	r0, r2, r0
 800211e:	6158      	str	r0, [r3, #20]
 8002120:	4770      	bx	lr
 8002122:	bf00      	nop
 8002124:	40021000 	.word	0x40021000

08002128 <RCC_APB2PeriphClockCmd>:
 8002128:	bf00      	nop
 800212a:	bf00      	nop
 800212c:	4b04      	ldr	r3, [pc, #16]	; (8002140 <RCC_APB2PeriphClockCmd+0x18>)
 800212e:	699a      	ldr	r2, [r3, #24]
 8002130:	b109      	cbz	r1, 8002136 <RCC_APB2PeriphClockCmd+0xe>
 8002132:	4310      	orrs	r0, r2
 8002134:	e001      	b.n	800213a <RCC_APB2PeriphClockCmd+0x12>
 8002136:	ea22 0000 	bic.w	r0, r2, r0
 800213a:	6198      	str	r0, [r3, #24]
 800213c:	4770      	bx	lr
 800213e:	bf00      	nop
 8002140:	40021000 	.word	0x40021000

08002144 <RCC_APB1PeriphClockCmd>:
 8002144:	bf00      	nop
 8002146:	bf00      	nop
 8002148:	4b04      	ldr	r3, [pc, #16]	; (800215c <RCC_APB1PeriphClockCmd+0x18>)
 800214a:	69da      	ldr	r2, [r3, #28]
 800214c:	b109      	cbz	r1, 8002152 <RCC_APB1PeriphClockCmd+0xe>
 800214e:	4310      	orrs	r0, r2
 8002150:	e001      	b.n	8002156 <RCC_APB1PeriphClockCmd+0x12>
 8002152:	ea22 0000 	bic.w	r0, r2, r0
 8002156:	61d8      	str	r0, [r3, #28]
 8002158:	4770      	bx	lr
 800215a:	bf00      	nop
 800215c:	40021000 	.word	0x40021000

08002160 <lib_low_level_init>:
 8002160:	b508      	push	{r3, lr}
 8002162:	f7ff fd83 	bl	8001c6c <sytem_clock_init>
 8002166:	f000 f899 	bl	800229c <gpio_init>
 800216a:	f7ff fc27 	bl	80019bc <uart_init>
 800216e:	f7ff fa1f 	bl	80015b0 <timer_init>
 8002172:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8002176:	f7ff bb33 	b.w	80017e0 <i2c_0_init>

0800217a <GPIO_Init>:
 800217a:	b5f0      	push	{r4, r5, r6, r7, lr}
 800217c:	bf00      	nop
 800217e:	bf00      	nop
 8002180:	bf00      	nop
 8002182:	bf00      	nop
 8002184:	2300      	movs	r3, #0
 8002186:	680e      	ldr	r6, [r1, #0]
 8002188:	461a      	mov	r2, r3
 800218a:	2501      	movs	r5, #1
 800218c:	4095      	lsls	r5, r2
 800218e:	ea05 0406 	and.w	r4, r5, r6
 8002192:	42ac      	cmp	r4, r5
 8002194:	d131      	bne.n	80021fa <GPIO_Init+0x80>
 8002196:	790d      	ldrb	r5, [r1, #4]
 8002198:	1e6f      	subs	r7, r5, #1
 800219a:	b2ff      	uxtb	r7, r7
 800219c:	2f01      	cmp	r7, #1
 800219e:	d81c      	bhi.n	80021da <GPIO_Init+0x60>
 80021a0:	bf00      	nop
 80021a2:	f04f 0c03 	mov.w	ip, #3
 80021a6:	6887      	ldr	r7, [r0, #8]
 80021a8:	fa0c fc03 	lsl.w	ip, ip, r3
 80021ac:	ea27 070c 	bic.w	r7, r7, ip
 80021b0:	6087      	str	r7, [r0, #8]
 80021b2:	f891 c005 	ldrb.w	ip, [r1, #5]
 80021b6:	6887      	ldr	r7, [r0, #8]
 80021b8:	fa0c fc03 	lsl.w	ip, ip, r3
 80021bc:	ea4c 0707 	orr.w	r7, ip, r7
 80021c0:	6087      	str	r7, [r0, #8]
 80021c2:	bf00      	nop
 80021c4:	8887      	ldrh	r7, [r0, #4]
 80021c6:	b2bf      	uxth	r7, r7
 80021c8:	ea27 0404 	bic.w	r4, r7, r4
 80021cc:	8084      	strh	r4, [r0, #4]
 80021ce:	798c      	ldrb	r4, [r1, #6]
 80021d0:	8887      	ldrh	r7, [r0, #4]
 80021d2:	4094      	lsls	r4, r2
 80021d4:	433c      	orrs	r4, r7
 80021d6:	b2a4      	uxth	r4, r4
 80021d8:	8084      	strh	r4, [r0, #4]
 80021da:	2403      	movs	r4, #3
 80021dc:	6807      	ldr	r7, [r0, #0]
 80021de:	409c      	lsls	r4, r3
 80021e0:	43e4      	mvns	r4, r4
 80021e2:	4027      	ands	r7, r4
 80021e4:	6007      	str	r7, [r0, #0]
 80021e6:	6807      	ldr	r7, [r0, #0]
 80021e8:	409d      	lsls	r5, r3
 80021ea:	433d      	orrs	r5, r7
 80021ec:	6005      	str	r5, [r0, #0]
 80021ee:	68c5      	ldr	r5, [r0, #12]
 80021f0:	402c      	ands	r4, r5
 80021f2:	79cd      	ldrb	r5, [r1, #7]
 80021f4:	409d      	lsls	r5, r3
 80021f6:	432c      	orrs	r4, r5
 80021f8:	60c4      	str	r4, [r0, #12]
 80021fa:	3201      	adds	r2, #1
 80021fc:	2a10      	cmp	r2, #16
 80021fe:	f103 0302 	add.w	r3, r3, #2
 8002202:	d1c2      	bne.n	800218a <GPIO_Init+0x10>
 8002204:	bdf0      	pop	{r4, r5, r6, r7, pc}

08002206 <GPIO_SetBits>:
 8002206:	bf00      	nop
 8002208:	bf00      	nop
 800220a:	6181      	str	r1, [r0, #24]
 800220c:	4770      	bx	lr

0800220e <GPIO_ResetBits>:
 800220e:	bf00      	nop
 8002210:	bf00      	nop
 8002212:	8501      	strh	r1, [r0, #40]	; 0x28
 8002214:	4770      	bx	lr

08002216 <GPIO_PinAFConfig>:
 8002216:	b510      	push	{r4, lr}
 8002218:	bf00      	nop
 800221a:	bf00      	nop
 800221c:	bf00      	nop
 800221e:	f001 0307 	and.w	r3, r1, #7
 8002222:	08c9      	lsrs	r1, r1, #3
 8002224:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8002228:	009b      	lsls	r3, r3, #2
 800222a:	6a04      	ldr	r4, [r0, #32]
 800222c:	210f      	movs	r1, #15
 800222e:	4099      	lsls	r1, r3
 8002230:	ea24 0101 	bic.w	r1, r4, r1
 8002234:	6201      	str	r1, [r0, #32]
 8002236:	6a01      	ldr	r1, [r0, #32]
 8002238:	fa02 f303 	lsl.w	r3, r2, r3
 800223c:	430b      	orrs	r3, r1
 800223e:	6203      	str	r3, [r0, #32]
 8002240:	bd10      	pop	{r4, pc}
	...

08002244 <led_on>:
 8002244:	0401      	lsls	r1, r0, #16
 8002246:	d503      	bpl.n	8002250 <led_on+0xc>
 8002248:	4b08      	ldr	r3, [pc, #32]	; (800226c <led_on+0x28>)
 800224a:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800224e:	619a      	str	r2, [r3, #24]
 8002250:	0702      	lsls	r2, r0, #28
 8002252:	d503      	bpl.n	800225c <led_on+0x18>
 8002254:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002258:	2208      	movs	r2, #8
 800225a:	851a      	strh	r2, [r3, #40]	; 0x28
 800225c:	07c3      	lsls	r3, r0, #31
 800225e:	d503      	bpl.n	8002268 <led_on+0x24>
 8002260:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002264:	2201      	movs	r2, #1
 8002266:	619a      	str	r2, [r3, #24]
 8002268:	4770      	bx	lr
 800226a:	bf00      	nop
 800226c:	48000400 	.word	0x48000400

08002270 <led_off>:
 8002270:	0402      	lsls	r2, r0, #16
 8002272:	d503      	bpl.n	800227c <led_off+0xc>
 8002274:	4b08      	ldr	r3, [pc, #32]	; (8002298 <led_off+0x28>)
 8002276:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800227a:	851a      	strh	r2, [r3, #40]	; 0x28
 800227c:	0703      	lsls	r3, r0, #28
 800227e:	d503      	bpl.n	8002288 <led_off+0x18>
 8002280:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002284:	2208      	movs	r2, #8
 8002286:	619a      	str	r2, [r3, #24]
 8002288:	07c0      	lsls	r0, r0, #31
 800228a:	d503      	bpl.n	8002294 <led_off+0x24>
 800228c:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002290:	2201      	movs	r2, #1
 8002292:	851a      	strh	r2, [r3, #40]	; 0x28
 8002294:	4770      	bx	lr
 8002296:	bf00      	nop
 8002298:	48000400 	.word	0x48000400

0800229c <gpio_init>:
 800229c:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 80022a0:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80022a4:	2101      	movs	r1, #1
 80022a6:	f7ff ff31 	bl	800210c <RCC_AHBPeriphClockCmd>
 80022aa:	f8df 90a8 	ldr.w	r9, [pc, #168]	; 8002354 <gpio_init+0xb8>
 80022ae:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 80022b2:	2101      	movs	r1, #1
 80022b4:	f7ff ff2a 	bl	800210c <RCC_AHBPeriphClockCmd>
 80022b8:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 80022bc:	2101      	movs	r1, #1
 80022be:	f7ff ff25 	bl	800210c <RCC_AHBPeriphClockCmd>
 80022c2:	2400      	movs	r4, #0
 80022c4:	2501      	movs	r5, #1
 80022c6:	2603      	movs	r6, #3
 80022c8:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 80022cc:	4648      	mov	r0, r9
 80022ce:	4669      	mov	r1, sp
 80022d0:	2708      	movs	r7, #8
 80022d2:	f8cd 8000 	str.w	r8, [sp]
 80022d6:	f88d 5004 	strb.w	r5, [sp, #4]
 80022da:	f88d 4006 	strb.w	r4, [sp, #6]
 80022de:	f88d 6005 	strb.w	r6, [sp, #5]
 80022e2:	f88d 4007 	strb.w	r4, [sp, #7]
 80022e6:	f7ff ff48 	bl	800217a <GPIO_Init>
 80022ea:	4669      	mov	r1, sp
 80022ec:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80022f0:	9700      	str	r7, [sp, #0]
 80022f2:	f88d 5004 	strb.w	r5, [sp, #4]
 80022f6:	f88d 4006 	strb.w	r4, [sp, #6]
 80022fa:	f88d 6005 	strb.w	r6, [sp, #5]
 80022fe:	f88d 4007 	strb.w	r4, [sp, #7]
 8002302:	f7ff ff3a 	bl	800217a <GPIO_Init>
 8002306:	4669      	mov	r1, sp
 8002308:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800230c:	9500      	str	r5, [sp, #0]
 800230e:	f88d 5004 	strb.w	r5, [sp, #4]
 8002312:	f88d 4006 	strb.w	r4, [sp, #6]
 8002316:	f88d 6005 	strb.w	r6, [sp, #5]
 800231a:	f88d 4007 	strb.w	r4, [sp, #7]
 800231e:	f7ff ff2c 	bl	800217a <GPIO_Init>
 8002322:	f44f 7300 	mov.w	r3, #512	; 0x200
 8002326:	4669      	mov	r1, sp
 8002328:	4648      	mov	r0, r9
 800232a:	9300      	str	r3, [sp, #0]
 800232c:	f88d 4004 	strb.w	r4, [sp, #4]
 8002330:	f88d 6005 	strb.w	r6, [sp, #5]
 8002334:	f88d 4007 	strb.w	r4, [sp, #7]
 8002338:	f7ff ff1f 	bl	800217a <GPIO_Init>
 800233c:	4640      	mov	r0, r8
 800233e:	f7ff ff81 	bl	8002244 <led_on>
 8002342:	4638      	mov	r0, r7
 8002344:	f7ff ff94 	bl	8002270 <led_off>
 8002348:	4628      	mov	r0, r5
 800234a:	f7ff ff91 	bl	8002270 <led_off>
 800234e:	b003      	add	sp, #12
 8002350:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8002354:	48000400 	.word	0x48000400

08002358 <get_key>:
 8002358:	4b02      	ldr	r3, [pc, #8]	; (8002364 <get_key+0xc>)
 800235a:	8a18      	ldrh	r0, [r3, #16]
 800235c:	43c0      	mvns	r0, r0
 800235e:	f400 7000 	and.w	r0, r0, #512	; 0x200
 8002362:	4770      	bx	lr
 8002364:	48000400 	.word	0x48000400

08002368 <NVIC_Init>:
 8002368:	b510      	push	{r4, lr}
 800236a:	bf00      	nop
 800236c:	bf00      	nop
 800236e:	bf00      	nop
 8002370:	78c2      	ldrb	r2, [r0, #3]
 8002372:	7803      	ldrb	r3, [r0, #0]
 8002374:	b30a      	cbz	r2, 80023ba <NVIC_Init+0x52>
 8002376:	4a16      	ldr	r2, [pc, #88]	; (80023d0 <NVIC_Init+0x68>)
 8002378:	7844      	ldrb	r4, [r0, #1]
 800237a:	68d2      	ldr	r2, [r2, #12]
 800237c:	43d2      	mvns	r2, r2
 800237e:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8002382:	f1c2 0104 	rsb	r1, r2, #4
 8002386:	b2c9      	uxtb	r1, r1
 8002388:	fa04 f101 	lsl.w	r1, r4, r1
 800238c:	240f      	movs	r4, #15
 800238e:	fa44 f202 	asr.w	r2, r4, r2
 8002392:	7884      	ldrb	r4, [r0, #2]
 8002394:	b2c9      	uxtb	r1, r1
 8002396:	4022      	ands	r2, r4
 8002398:	430a      	orrs	r2, r1
 800239a:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 800239e:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 80023a2:	0112      	lsls	r2, r2, #4
 80023a4:	b2d2      	uxtb	r2, r2
 80023a6:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 80023aa:	7803      	ldrb	r3, [r0, #0]
 80023ac:	2201      	movs	r2, #1
 80023ae:	0959      	lsrs	r1, r3, #5
 80023b0:	f003 031f 	and.w	r3, r3, #31
 80023b4:	fa02 f303 	lsl.w	r3, r2, r3
 80023b8:	e006      	b.n	80023c8 <NVIC_Init+0x60>
 80023ba:	0959      	lsrs	r1, r3, #5
 80023bc:	2201      	movs	r2, #1
 80023be:	f003 031f 	and.w	r3, r3, #31
 80023c2:	fa02 f303 	lsl.w	r3, r2, r3
 80023c6:	3120      	adds	r1, #32
 80023c8:	4a02      	ldr	r2, [pc, #8]	; (80023d4 <NVIC_Init+0x6c>)
 80023ca:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 80023ce:	bd10      	pop	{r4, pc}
 80023d0:	e000ed00 	.word	0xe000ed00
 80023d4:	e000e100 	.word	0xe000e100

080023d8 <_init>:
 80023d8:	e1a0c00d 	mov	ip, sp
 80023dc:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80023e0:	e24cb004 	sub	fp, ip, #4
 80023e4:	e24bd028 	sub	sp, fp, #40	; 0x28
 80023e8:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80023ec:	e12fff1e 	bx	lr

080023f0 <_fini>:
 80023f0:	e1a0c00d 	mov	ip, sp
 80023f4:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80023f8:	e24cb004 	sub	fp, ip, #4
 80023fc:	e24bd028 	sub	sp, fp, #40	; 0x28
 8002400:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8002404:	e12fff1e 	bx	lr
 8002408:	69647473 	.word	0x69647473
 800240c:	6e69206f 	.word	0x6e69206f
 8002410:	64207469 	.word	0x64207469
 8002414:	0a656e6f 	.word	0x0a656e6f
 8002418:	00          	.byte	0x00
 8002419:	41          	.byte	0x41
 800241a:	2b54      	.short	0x2b54
 800241c:	4d504943 	.word	0x4d504943
 8002420:	313d5855 	.word	0x313d5855
 8002424:	41000a0d 	.word	0x41000a0d
 8002428:	49432b54 	.word	0x49432b54
 800242c:	58554d50 	.word	0x58554d50
 8002430:	0a0d303d 	.word	0x0a0d303d
 8002434:	2b544100 	.word	0x2b544100
 8002438:	4f4d5743 	.word	0x4f4d5743
 800243c:	313d4544 	.word	0x313d4544
 8002440:	41000a0d 	.word	0x41000a0d
 8002444:	57432b54 	.word	0x57432b54
 8002448:	3d50414a 	.word	0x3d50414a
 800244c:	69640022 	.word	0x69640022
 8002450:	6e6f6373 	.word	0x6e6f6373
 8002454:	7463656e 	.word	0x7463656e
 8002458:	76006465 	.word	0x76006465
 800245c:	68797265 	.word	0x68797265
 8002460:	00647261 	.word	0x00647261
 8002464:	000a0d22 	.word	0x000a0d22
 8002468:	432b5441 	.word	0x432b5441
 800246c:	45535049 	.word	0x45535049
 8002470:	52455652 	.word	0x52455652
 8002474:	382c313d 	.word	0x382c313d
 8002478:	000a0d30 	.word	0x000a0d30
 800247c:	432b5441 	.word	0x432b5441
 8002480:	54535049 	.word	0x54535049
 8002484:	3d545241 	.word	0x3d545241
 8002488:	50435422 	.word	0x50435422
 800248c:	00222c22 	.word	0x00222c22
 8002490:	41002c22 	.word	0x41002c22
 8002494:	49432b54 	.word	0x49432b54
 8002498:	4e455350 	.word	0x4e455350
 800249c:	3e003d44 	.word	0x3e003d44
 80024a0:	2b544100 	.word	0x2b544100
 80024a4:	43504943 	.word	0x43504943
 80024a8:	45534f4c 	.word	0x45534f4c
 80024ac:	53000a0d 	.word	0x53000a0d
 80024b0:	20444e45 	.word	0x20444e45
 80024b4:	2b004b4f 	.word	0x2b004b4f
 80024b8:	2c445049 	.word	0x2c445049
 80024bc:	00000000 	.word	0x00000000
 80024c0:	00000020 	.word	0x00000020
 80024c4:	00000040 	.word	0x00000040
 80024c8:	00000060 	.word	0x00000060
 80024cc:	00000080 	.word	0x00000080
 80024d0:	6f727265 	.word	0x6f727265
 80024d4:	6f632072 	.word	0x6f632072
 80024d8:	25206564 	.word	0x25206564
 80024dc:	75253a75 	.word	0x75253a75
 80024e0:	000a      	.short	0x000a
 80024e2:	3931      	.short	0x3931
 80024e4:	36312e32 	.word	0x36312e32
 80024e8:	2e322e38 	.word	0x2e322e38
 80024ec:	73650032 	.word	0x73650032
 80024f0:	36323870 	.word	0x36323870
 80024f4:	656d2036 	.word	0x656d2036
 80024f8:	67617373 	.word	0x67617373
 80024fc:	0065      	.short	0x0065
 80024fe:	770a      	.short	0x770a
 8002500:	6f636c65 	.word	0x6f636c65
 8002504:	7420656d 	.word	0x7420656d
 8002508:	7553206f 	.word	0x7553206f
 800250c:	6168757a 	.word	0x6168757a
 8002510:	5e20534f 	.word	0x5e20534f
 8002514:	32205e5f 	.word	0x32205e5f
 8002518:	362e302e 	.word	0x362e302e
 800251c:	4955420a 	.word	0x4955420a
 8002520:	4d20444c 	.word	0x4d20444c
 8002524:	31207261 	.word	0x31207261
 8002528:	30322035 	.word	0x30322035
 800252c:	31203631 	.word	0x31203631
 8002530:	33333a33 	.word	0x33333a33
 8002534:	0a39353a 	.word	0x0a39353a
 8002538:	00000000 	.word	0x00000000

0800253c <__EH_FRAME_BEGIN__>:
 800253c:	00000000                                ....
