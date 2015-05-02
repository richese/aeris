
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
 80001a0:	20000084 	.word	0x20000084
 80001a4:	20000024 	.word	0x20000024

080001a8 <null_thread>:
 80001a8:	b508      	push	{r3, lr}
 80001aa:	f000 fea9 	bl	8000f00 <sleep>
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
 80001f6:	2908      	cmp	r1, #8
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
 800020c:	20000024 	.word	0x20000024
 8000210:	20000084 	.word	0x20000084

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
 8000254:	20000084 	.word	0x20000084
 8000258:	20000024 	.word	0x20000024

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
 800027c:	20000084 	.word	0x20000084

08000280 <kernel_start>:
 8000280:	b508      	push	{r3, lr}
 8000282:	f000 fe2b 	bl	8000edc <sys_tick_init>
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
 80002d0:	2b07      	cmp	r3, #7
 80002d2:	bf98      	it	ls
 80002d4:	2308      	movls	r3, #8
 80002d6:	6008      	str	r0, [r1, #0]
 80002d8:	2001      	movs	r0, #1
 80002da:	8063      	strh	r3, [r4, #2]
 80002dc:	5373      	strh	r3, [r6, r5]
 80002de:	6060      	str	r0, [r4, #4]
 80002e0:	4610      	mov	r0, r2
 80002e2:	e000      	b.n	80002e6 <create_thread+0x5a>
 80002e4:	2008      	movs	r0, #8
 80002e6:	b662      	cpsie	i
 80002e8:	3201      	adds	r2, #1
 80002ea:	2a08      	cmp	r2, #8
 80002ec:	d001      	beq.n	80002f2 <create_thread+0x66>
 80002ee:	2808      	cmp	r0, #8
 80002f0:	d0dd      	beq.n	80002ae <create_thread+0x22>
 80002f2:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80002f6:	bf00      	nop
 80002f8:	20000024 	.word	0x20000024
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
 8000312:	2008      	movs	r0, #8
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
 8000334:	20000024 	.word	0x20000024
 8000338:	20000084 	.word	0x20000084
 800033c:	080001a9 	.word	0x080001a9
 8000340:	20000088 	.word	0x20000088

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
 8000384:	20000024 	.word	0x20000024

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
 80003a0:	2b08      	cmp	r3, #8
 80003a2:	d1f2      	bne.n	800038a <wake_up_threads+0x2>
 80003a4:	4770      	bx	lr
 80003a6:	bf00      	nop
 80003a8:	20000024 	.word	0x20000024

080003ac <lib_os_init>:
 80003ac:	b508      	push	{r3, lr}
 80003ae:	f7ff ffa7 	bl	8000300 <kernel_init>
 80003b2:	f000 f805 	bl	80003c0 <messages_init>
 80003b6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80003ba:	f000 b8e7 	b.w	800058c <stdio_init>
	...

080003c0 <messages_init>:
 80003c0:	b510      	push	{r4, lr}
 80003c2:	2200      	movs	r2, #0
 80003c4:	4909      	ldr	r1, [pc, #36]	; (80003ec <messages_init+0x2c>)
 80003c6:	2300      	movs	r3, #0
 80003c8:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 80003cc:	3201      	adds	r2, #1
 80003ce:	2a08      	cmp	r2, #8
 80003d0:	d1f8      	bne.n	80003c4 <messages_init+0x4>
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
 80003ec:	20000108 	.word	0x20000108
 80003f0:	20000128 	.word	0x20000128

080003f4 <putc_>:
 80003f4:	b538      	push	{r3, r4, r5, lr}
 80003f6:	4c06      	ldr	r4, [pc, #24]	; (8000410 <putc_+0x1c>)
 80003f8:	4605      	mov	r5, r0
 80003fa:	4620      	mov	r0, r4
 80003fc:	f000 f8f8 	bl	80005f0 <mutex_lock>
 8000400:	4628      	mov	r0, r5
 8000402:	f000 fc5d 	bl	8000cc0 <uart_write>
 8000406:	4620      	mov	r0, r4
 8000408:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800040c:	f000 b90c 	b.w	8000628 <mutex_unlock>
 8000410:	20000168 	.word	0x20000168

08000414 <puts_>:
 8000414:	b510      	push	{r4, lr}
 8000416:	4604      	mov	r4, r0
 8000418:	4807      	ldr	r0, [pc, #28]	; (8000438 <puts_+0x24>)
 800041a:	f000 f8e9 	bl	80005f0 <mutex_lock>
 800041e:	3c01      	subs	r4, #1
 8000420:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000424:	b110      	cbz	r0, 800042c <puts_+0x18>
 8000426:	f7ff ffe5 	bl	80003f4 <putc_>
 800042a:	e7f9      	b.n	8000420 <puts_+0xc>
 800042c:	4802      	ldr	r0, [pc, #8]	; (8000438 <puts_+0x24>)
 800042e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000432:	f000 b8f9 	b.w	8000628 <mutex_unlock>
 8000436:	bf00      	nop
 8000438:	20000174 	.word	0x20000174

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
 80004f4:	f000 f87c 	bl	80005f0 <mutex_lock>
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
 8000578:	f000 f856 	bl	8000628 <mutex_unlock>
 800057c:	b003      	add	sp, #12
 800057e:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000582:	b004      	add	sp, #16
 8000584:	4770      	bx	lr
 8000586:	bf00      	nop
 8000588:	20000170 	.word	0x20000170

0800058c <stdio_init>:
 800058c:	b510      	push	{r4, lr}
 800058e:	480e      	ldr	r0, [pc, #56]	; (80005c8 <stdio_init+0x3c>)
 8000590:	f000 f824 	bl	80005dc <mutex_init>
 8000594:	480d      	ldr	r0, [pc, #52]	; (80005cc <stdio_init+0x40>)
 8000596:	f000 f821 	bl	80005dc <mutex_init>
 800059a:	480d      	ldr	r0, [pc, #52]	; (80005d0 <stdio_init+0x44>)
 800059c:	f000 f81e 	bl	80005dc <mutex_init>
 80005a0:	480c      	ldr	r0, [pc, #48]	; (80005d4 <stdio_init+0x48>)
 80005a2:	f000 f81b 	bl	80005dc <mutex_init>
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
 80005c8:	20000168 	.word	0x20000168
 80005cc:	2000016c 	.word	0x2000016c
 80005d0:	20000174 	.word	0x20000174
 80005d4:	20000170 	.word	0x20000170
 80005d8:	08001320 	.word	0x08001320

080005dc <mutex_init>:
 80005dc:	b510      	push	{r4, lr}
 80005de:	4604      	mov	r4, r0
 80005e0:	f7ff fe3c 	bl	800025c <sched_off>
 80005e4:	2300      	movs	r3, #0
 80005e6:	6023      	str	r3, [r4, #0]
 80005e8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005ec:	f7ff be38 	b.w	8000260 <sched_on>

080005f0 <mutex_lock>:
 80005f0:	b513      	push	{r0, r1, r4, lr}
 80005f2:	4604      	mov	r4, r0
 80005f4:	f7ff fe32 	bl	800025c <sched_off>
 80005f8:	6823      	ldr	r3, [r4, #0]
 80005fa:	9301      	str	r3, [sp, #4]
 80005fc:	f7ff fe30 	bl	8000260 <sched_on>
 8000600:	9b01      	ldr	r3, [sp, #4]
 8000602:	b10b      	cbz	r3, 8000608 <mutex_lock+0x18>
 8000604:	f7ff fe9e 	bl	8000344 <set_wait_state>
 8000608:	9b01      	ldr	r3, [sp, #4]
 800060a:	2b00      	cmp	r3, #0
 800060c:	d1f2      	bne.n	80005f4 <mutex_lock+0x4>
 800060e:	f7ff fe25 	bl	800025c <sched_off>
 8000612:	6823      	ldr	r3, [r4, #0]
 8000614:	9301      	str	r3, [sp, #4]
 8000616:	9b01      	ldr	r3, [sp, #4]
 8000618:	2b00      	cmp	r3, #0
 800061a:	d1eb      	bne.n	80005f4 <mutex_lock+0x4>
 800061c:	2301      	movs	r3, #1
 800061e:	6023      	str	r3, [r4, #0]
 8000620:	f7ff fe1e 	bl	8000260 <sched_on>
 8000624:	b002      	add	sp, #8
 8000626:	bd10      	pop	{r4, pc}

08000628 <mutex_unlock>:
 8000628:	b508      	push	{r3, lr}
 800062a:	f7ff ffd7 	bl	80005dc <mutex_init>
 800062e:	f7ff feab 	bl	8000388 <wake_up_threads>
 8000632:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000636:	f7ff be15 	b.w	8000264 <yield>
	...

0800063c <main>:
 800063c:	b508      	push	{r3, lr}
 800063e:	f000 fd8d 	bl	800115c <lib_low_level_init>
 8000642:	f7ff feb3 	bl	80003ac <lib_os_init>
 8000646:	4908      	ldr	r1, [pc, #32]	; (8000668 <main+0x2c>)
 8000648:	4808      	ldr	r0, [pc, #32]	; (800066c <main+0x30>)
 800064a:	f7ff ff4d 	bl	80004e8 <printf_>
 800064e:	f000 f969 	bl	8000924 <wifi_init>
 8000652:	4907      	ldr	r1, [pc, #28]	; (8000670 <main+0x34>)
 8000654:	4807      	ldr	r0, [pc, #28]	; (8000674 <main+0x38>)
 8000656:	f44f 7200 	mov.w	r2, #512	; 0x200
 800065a:	2308      	movs	r3, #8
 800065c:	f7ff fe16 	bl	800028c <create_thread>
 8000660:	f7ff fe0e 	bl	8000280 <kernel_start>
 8000664:	2000      	movs	r0, #0
 8000666:	bd08      	pop	{r3, pc}
 8000668:	08000000 	.word	0x08000000
 800066c:	08001331 	.word	0x08001331
 8000670:	20000378 	.word	0x20000378
 8000674:	08000ac5 	.word	0x08000ac5

08000678 <wifi_print_init>:
 8000678:	b508      	push	{r3, lr}
 800067a:	f44f 5016 	mov.w	r0, #9600	; 0x2580
 800067e:	f000 fbe9 	bl	8000e54 <uart2_init>
 8000682:	2064      	movs	r0, #100	; 0x64
 8000684:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000688:	f000 bb0a 	b.w	8000ca0 <timer_delay_ms>

0800068c <wifi_strlen_>:
 800068c:	2300      	movs	r3, #0
 800068e:	5cc2      	ldrb	r2, [r0, r3]
 8000690:	b10a      	cbz	r2, 8000696 <wifi_strlen_+0xa>
 8000692:	3301      	adds	r3, #1
 8000694:	e7fb      	b.n	800068e <wifi_strlen_+0x2>
 8000696:	4618      	mov	r0, r3
 8000698:	4770      	bx	lr

0800069a <wifi_puts_>:
 800069a:	b510      	push	{r4, lr}
 800069c:	1e44      	subs	r4, r0, #1
 800069e:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 80006a2:	b110      	cbz	r0, 80006aa <wifi_puts_+0x10>
 80006a4:	f000 fbc0 	bl	8000e28 <uart2_write>
 80006a8:	e7f9      	b.n	800069e <wifi_puts_+0x4>
 80006aa:	bd10      	pop	{r4, pc}

080006ac <wifi_puti_>:
 80006ac:	b530      	push	{r4, r5, lr}
 80006ae:	b085      	sub	sp, #20
 80006b0:	1e03      	subs	r3, r0, #0
 80006b2:	f04f 0200 	mov.w	r2, #0
 80006b6:	bfa8      	it	ge
 80006b8:	4614      	movge	r4, r2
 80006ba:	f88d 200f 	strb.w	r2, [sp, #15]
 80006be:	bfbc      	itt	lt
 80006c0:	425b      	neglt	r3, r3
 80006c2:	2401      	movlt	r4, #1
 80006c4:	220a      	movs	r2, #10
 80006c6:	210a      	movs	r1, #10
 80006c8:	fb93 f5f1 	sdiv	r5, r3, r1
 80006cc:	fb01 3315 	mls	r3, r1, r5, r3
 80006d0:	a801      	add	r0, sp, #4
 80006d2:	3330      	adds	r3, #48	; 0x30
 80006d4:	5413      	strb	r3, [r2, r0]
 80006d6:	1e51      	subs	r1, r2, #1
 80006d8:	462b      	mov	r3, r5
 80006da:	b10d      	cbz	r5, 80006e0 <wifi_puti_+0x34>
 80006dc:	460a      	mov	r2, r1
 80006de:	e7f2      	b.n	80006c6 <wifi_puti_+0x1a>
 80006e0:	b12c      	cbz	r4, 80006ee <wifi_puti_+0x42>
 80006e2:	ab04      	add	r3, sp, #16
 80006e4:	440b      	add	r3, r1
 80006e6:	222d      	movs	r2, #45	; 0x2d
 80006e8:	f803 2c0c 	strb.w	r2, [r3, #-12]
 80006ec:	460a      	mov	r2, r1
 80006ee:	4410      	add	r0, r2
 80006f0:	f7ff ffd3 	bl	800069a <wifi_puts_>
 80006f4:	b005      	add	sp, #20
 80006f6:	bd30      	pop	{r4, r5, pc}

080006f8 <wifi_putui_>:
 80006f8:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80006fa:	2300      	movs	r3, #0
 80006fc:	f88d 300f 	strb.w	r3, [sp, #15]
 8000700:	230a      	movs	r3, #10
 8000702:	240a      	movs	r4, #10
 8000704:	fbb0 f1f4 	udiv	r1, r0, r4
 8000708:	fb04 0011 	mls	r0, r4, r1, r0
 800070c:	aa01      	add	r2, sp, #4
 800070e:	3030      	adds	r0, #48	; 0x30
 8000710:	5498      	strb	r0, [r3, r2]
 8000712:	1e5c      	subs	r4, r3, #1
 8000714:	4608      	mov	r0, r1
 8000716:	b109      	cbz	r1, 800071c <wifi_putui_+0x24>
 8000718:	4623      	mov	r3, r4
 800071a:	e7f2      	b.n	8000702 <wifi_putui_+0xa>
 800071c:	18d0      	adds	r0, r2, r3
 800071e:	f7ff ffbc 	bl	800069a <wifi_puts_>
 8000722:	b004      	add	sp, #16
 8000724:	bd10      	pop	{r4, pc}

08000726 <wifi_putx_>:
 8000726:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000728:	2300      	movs	r3, #0
 800072a:	f88d 300f 	strb.w	r3, [sp, #15]
 800072e:	230a      	movs	r3, #10
 8000730:	f000 010f 	and.w	r1, r0, #15
 8000734:	2909      	cmp	r1, #9
 8000736:	aa01      	add	r2, sp, #4
 8000738:	bf94      	ite	ls
 800073a:	3130      	addls	r1, #48	; 0x30
 800073c:	3157      	addhi	r1, #87	; 0x57
 800073e:	0900      	lsrs	r0, r0, #4
 8000740:	54d1      	strb	r1, [r2, r3]
 8000742:	f103 31ff 	add.w	r1, r3, #4294967295
 8000746:	d001      	beq.n	800074c <wifi_putx_+0x26>
 8000748:	460b      	mov	r3, r1
 800074a:	e7f1      	b.n	8000730 <wifi_putx_+0xa>
 800074c:	18d0      	adds	r0, r2, r3
 800074e:	f7ff ffa4 	bl	800069a <wifi_puts_>
 8000752:	b005      	add	sp, #20
 8000754:	f85d fb04 	ldr.w	pc, [sp], #4

08000758 <wifi_printf>:
 8000758:	b40f      	push	{r0, r1, r2, r3}
 800075a:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800075c:	ab06      	add	r3, sp, #24
 800075e:	2400      	movs	r4, #0
 8000760:	f853 5b04 	ldr.w	r5, [r3], #4
 8000764:	9301      	str	r3, [sp, #4]
 8000766:	5d28      	ldrb	r0, [r5, r4]
 8000768:	2800      	cmp	r0, #0
 800076a:	d039      	beq.n	80007e0 <wifi_printf+0x88>
 800076c:	2825      	cmp	r0, #37	; 0x25
 800076e:	d003      	beq.n	8000778 <wifi_printf+0x20>
 8000770:	f000 fb5a 	bl	8000e28 <uart2_write>
 8000774:	3401      	adds	r4, #1
 8000776:	e7f6      	b.n	8000766 <wifi_printf+0xe>
 8000778:	192b      	adds	r3, r5, r4
 800077a:	7858      	ldrb	r0, [r3, #1]
 800077c:	2869      	cmp	r0, #105	; 0x69
 800077e:	d016      	beq.n	80007ae <wifi_printf+0x56>
 8000780:	d808      	bhi.n	8000794 <wifi_printf+0x3c>
 8000782:	2825      	cmp	r0, #37	; 0x25
 8000784:	d028      	beq.n	80007d8 <wifi_printf+0x80>
 8000786:	2863      	cmp	r0, #99	; 0x63
 8000788:	d128      	bne.n	80007dc <wifi_printf+0x84>
 800078a:	9b01      	ldr	r3, [sp, #4]
 800078c:	1d1a      	adds	r2, r3, #4
 800078e:	9201      	str	r2, [sp, #4]
 8000790:	7818      	ldrb	r0, [r3, #0]
 8000792:	e021      	b.n	80007d8 <wifi_printf+0x80>
 8000794:	2875      	cmp	r0, #117	; 0x75
 8000796:	d011      	beq.n	80007bc <wifi_printf+0x64>
 8000798:	2878      	cmp	r0, #120	; 0x78
 800079a:	d016      	beq.n	80007ca <wifi_printf+0x72>
 800079c:	2873      	cmp	r0, #115	; 0x73
 800079e:	d11d      	bne.n	80007dc <wifi_printf+0x84>
 80007a0:	9b01      	ldr	r3, [sp, #4]
 80007a2:	1d1a      	adds	r2, r3, #4
 80007a4:	6818      	ldr	r0, [r3, #0]
 80007a6:	9201      	str	r2, [sp, #4]
 80007a8:	f7ff ff77 	bl	800069a <wifi_puts_>
 80007ac:	e016      	b.n	80007dc <wifi_printf+0x84>
 80007ae:	9b01      	ldr	r3, [sp, #4]
 80007b0:	1d1a      	adds	r2, r3, #4
 80007b2:	6818      	ldr	r0, [r3, #0]
 80007b4:	9201      	str	r2, [sp, #4]
 80007b6:	f7ff ff79 	bl	80006ac <wifi_puti_>
 80007ba:	e00f      	b.n	80007dc <wifi_printf+0x84>
 80007bc:	9b01      	ldr	r3, [sp, #4]
 80007be:	1d1a      	adds	r2, r3, #4
 80007c0:	6818      	ldr	r0, [r3, #0]
 80007c2:	9201      	str	r2, [sp, #4]
 80007c4:	f7ff ff98 	bl	80006f8 <wifi_putui_>
 80007c8:	e008      	b.n	80007dc <wifi_printf+0x84>
 80007ca:	9b01      	ldr	r3, [sp, #4]
 80007cc:	1d1a      	adds	r2, r3, #4
 80007ce:	6818      	ldr	r0, [r3, #0]
 80007d0:	9201      	str	r2, [sp, #4]
 80007d2:	f7ff ffa8 	bl	8000726 <wifi_putx_>
 80007d6:	e001      	b.n	80007dc <wifi_printf+0x84>
 80007d8:	f000 fb26 	bl	8000e28 <uart2_write>
 80007dc:	3402      	adds	r4, #2
 80007de:	e7c2      	b.n	8000766 <wifi_printf+0xe>
 80007e0:	b003      	add	sp, #12
 80007e2:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 80007e6:	b004      	add	sp, #16
 80007e8:	4770      	bx	lr

080007ea <wifi_wait_for_response>:
 80007ea:	b570      	push	{r4, r5, r6, lr}
 80007ec:	460e      	mov	r6, r1
 80007ee:	4605      	mov	r5, r0
 80007f0:	f000 fa48 	bl	8000c84 <timer_get_time>
 80007f4:	2400      	movs	r4, #0
 80007f6:	4406      	add	r6, r0
 80007f8:	f000 fb20 	bl	8000e3c <uart2_read_nonblocking>
 80007fc:	1c42      	adds	r2, r0, #1
 80007fe:	d006      	beq.n	800080e <wifi_wait_for_response+0x24>
 8000800:	5d2b      	ldrb	r3, [r5, r4]
 8000802:	4283      	cmp	r3, r0
 8000804:	bf0c      	ite	eq
 8000806:	3401      	addeq	r4, #1
 8000808:	2400      	movne	r4, #0
 800080a:	5d28      	ldrb	r0, [r5, r4]
 800080c:	b120      	cbz	r0, 8000818 <wifi_wait_for_response+0x2e>
 800080e:	f000 fa39 	bl	8000c84 <timer_get_time>
 8000812:	4286      	cmp	r6, r0
 8000814:	d2f0      	bcs.n	80007f8 <wifi_wait_for_response+0xe>
 8000816:	2001      	movs	r0, #1
 8000818:	bd70      	pop	{r4, r5, r6, pc}
	...

0800081c <wifi_open>:
 800081c:	b538      	push	{r3, r4, r5, lr}
 800081e:	460b      	mov	r3, r1
 8000820:	4605      	mov	r5, r0
 8000822:	4614      	mov	r4, r2
 8000824:	4807      	ldr	r0, [pc, #28]	; (8000844 <wifi_open+0x28>)
 8000826:	4629      	mov	r1, r5
 8000828:	461a      	mov	r2, r3
 800082a:	f7ff ff95 	bl	8000758 <wifi_printf>
 800082e:	4806      	ldr	r0, [pc, #24]	; (8000848 <wifi_open+0x2c>)
 8000830:	4621      	mov	r1, r4
 8000832:	f7ff ffda 	bl	80007ea <wifi_wait_for_response>
 8000836:	b118      	cbz	r0, 8000840 <wifi_open+0x24>
 8000838:	4804      	ldr	r0, [pc, #16]	; (800084c <wifi_open+0x30>)
 800083a:	f7ff ff8d 	bl	8000758 <wifi_printf>
 800083e:	2001      	movs	r0, #1
 8000840:	bd38      	pop	{r3, r4, r5, pc}
 8000842:	bf00      	nop
 8000844:	08001344 	.word	0x08001344
 8000848:	08001360 	.word	0x08001360
 800084c:	08001363 	.word	0x08001363

08000850 <wifi_close>:
 8000850:	b510      	push	{r4, lr}
 8000852:	4604      	mov	r4, r0
 8000854:	4805      	ldr	r0, [pc, #20]	; (800086c <wifi_close+0x1c>)
 8000856:	f7ff ff7f 	bl	8000758 <wifi_printf>
 800085a:	4621      	mov	r1, r4
 800085c:	4804      	ldr	r0, [pc, #16]	; (8000870 <wifi_close+0x20>)
 800085e:	f7ff ffc4 	bl	80007ea <wifi_wait_for_response>
 8000862:	3000      	adds	r0, #0
 8000864:	bf18      	it	ne
 8000866:	2001      	movne	r0, #1
 8000868:	bd10      	pop	{r4, pc}
 800086a:	bf00      	nop
 800086c:	08001363 	.word	0x08001363
 8000870:	08001360 	.word	0x08001360

08000874 <wifi_send_packet>:
 8000874:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000878:	9c06      	ldr	r4, [sp, #24]
 800087a:	4605      	mov	r5, r0
 800087c:	4824      	ldr	r0, [pc, #144]	; (8000910 <wifi_send_packet+0x9c>)
 800087e:	4688      	mov	r8, r1
 8000880:	4616      	mov	r6, r2
 8000882:	461f      	mov	r7, r3
 8000884:	f7ff ff68 	bl	8000758 <wifi_printf>
 8000888:	4822      	ldr	r0, [pc, #136]	; (8000914 <wifi_send_packet+0xa0>)
 800088a:	4621      	mov	r1, r4
 800088c:	f7ff ffad 	bl	80007ea <wifi_wait_for_response>
 8000890:	bb88      	cbnz	r0, 80008f6 <wifi_send_packet+0x82>
 8000892:	44a8      	add	r8, r5
 8000894:	4545      	cmp	r5, r8
 8000896:	d004      	beq.n	80008a2 <wifi_send_packet+0x2e>
 8000898:	f815 0b01 	ldrb.w	r0, [r5], #1
 800089c:	f000 fac4 	bl	8000e28 <uart2_write>
 80008a0:	e7f8      	b.n	8000894 <wifi_send_packet+0x20>
 80008a2:	481d      	ldr	r0, [pc, #116]	; (8000918 <wifi_send_packet+0xa4>)
 80008a4:	4621      	mov	r1, r4
 80008a6:	f7ff ffa0 	bl	80007ea <wifi_wait_for_response>
 80008aa:	bb38      	cbnz	r0, 80008fc <wifi_send_packet+0x88>
 80008ac:	481b      	ldr	r0, [pc, #108]	; (800091c <wifi_send_packet+0xa8>)
 80008ae:	4621      	mov	r1, r4
 80008b0:	f7ff ff9b 	bl	80007ea <wifi_wait_for_response>
 80008b4:	bb28      	cbnz	r0, 8000902 <wifi_send_packet+0x8e>
 80008b6:	481a      	ldr	r0, [pc, #104]	; (8000920 <wifi_send_packet+0xac>)
 80008b8:	4621      	mov	r1, r4
 80008ba:	f7ff ff96 	bl	80007ea <wifi_wait_for_response>
 80008be:	4605      	mov	r5, r0
 80008c0:	bb10      	cbnz	r0, 8000908 <wifi_send_packet+0x94>
 80008c2:	f000 f9df 	bl	8000c84 <timer_get_time>
 80008c6:	4404      	add	r4, r0
 80008c8:	f000 fab8 	bl	8000e3c <uart2_read_nonblocking>
 80008cc:	1c41      	adds	r1, r0, #1
 80008ce:	d00d      	beq.n	80008ec <wifi_send_packet+0x78>
 80008d0:	5570      	strb	r0, [r6, r5]
 80008d2:	3501      	adds	r5, #1
 80008d4:	42bd      	cmp	r5, r7
 80008d6:	d307      	bcc.n	80008e8 <wifi_send_packet+0x74>
 80008d8:	f000 f9d4 	bl	8000c84 <timer_get_time>
 80008dc:	4284      	cmp	r4, r0
 80008de:	bf34      	ite	cc
 80008e0:	2006      	movcc	r0, #6
 80008e2:	2000      	movcs	r0, #0
 80008e4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80008e8:	280a      	cmp	r0, #10
 80008ea:	d0f5      	beq.n	80008d8 <wifi_send_packet+0x64>
 80008ec:	f000 f9ca 	bl	8000c84 <timer_get_time>
 80008f0:	4284      	cmp	r4, r0
 80008f2:	d2e9      	bcs.n	80008c8 <wifi_send_packet+0x54>
 80008f4:	e7f0      	b.n	80008d8 <wifi_send_packet+0x64>
 80008f6:	2002      	movs	r0, #2
 80008f8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80008fc:	2003      	movs	r0, #3
 80008fe:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000902:	2004      	movs	r0, #4
 8000904:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000908:	2005      	movs	r0, #5
 800090a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800090e:	bf00      	nop
 8000910:	08001371 	.word	0x08001371
 8000914:	08001461 	.word	0x08001461
 8000918:	08001360 	.word	0x08001360
 800091c:	08001381 	.word	0x08001381
 8000920:	08001386 	.word	0x08001386

08000924 <wifi_init>:
 8000924:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000928:	4b52      	ldr	r3, [pc, #328]	; (8000a74 <wifi_init+0x150>)
 800092a:	4c53      	ldr	r4, [pc, #332]	; (8000a78 <wifi_init+0x154>)
 800092c:	4853      	ldr	r0, [pc, #332]	; (8000a7c <wifi_init+0x158>)
 800092e:	f8c4 3088 	str.w	r3, [r4, #136]	; 0x88
 8000932:	4b53      	ldr	r3, [pc, #332]	; (8000a80 <wifi_init+0x15c>)
 8000934:	b08a      	sub	sp, #40	; 0x28
 8000936:	681b      	ldr	r3, [r3, #0]
 8000938:	2500      	movs	r5, #0
 800093a:	f8c4 3084 	str.w	r3, [r4, #132]	; 0x84
 800093e:	6025      	str	r5, [r4, #0]
 8000940:	f7ff fdd2 	bl	80004e8 <printf_>
 8000944:	f88d 500e 	strb.w	r5, [sp, #14]
 8000948:	f88d 500f 	strb.w	r5, [sp, #15]
 800094c:	4d4d      	ldr	r5, [pc, #308]	; (8000a84 <wifi_init+0x160>)
 800094e:	a902      	add	r1, sp, #8
 8000950:	2610      	movs	r6, #16
 8000952:	4628      	mov	r0, r5
 8000954:	f04f 0801 	mov.w	r8, #1
 8000958:	2703      	movs	r7, #3
 800095a:	9602      	str	r6, [sp, #8]
 800095c:	f88d 800c 	strb.w	r8, [sp, #12]
 8000960:	f88d 700d 	strb.w	r7, [sp, #13]
 8000964:	f000 fc3a 	bl	80011dc <GPIO_Init>
 8000968:	2064      	movs	r0, #100	; 0x64
 800096a:	836e      	strh	r6, [r5, #26]
 800096c:	f000 f998 	bl	8000ca0 <timer_delay_ms>
 8000970:	f7ff fe82 	bl	8000678 <wifi_print_init>
 8000974:	832e      	strh	r6, [r5, #24]
 8000976:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 800097a:	f000 f991 	bl	8000ca0 <timer_delay_ms>
 800097e:	4842      	ldr	r0, [pc, #264]	; (8000a88 <wifi_init+0x164>)
 8000980:	f7ff feea 	bl	8000758 <wifi_printf>
 8000984:	4841      	ldr	r0, [pc, #260]	; (8000a8c <wifi_init+0x168>)
 8000986:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 800098a:	f7ff ff2e 	bl	80007ea <wifi_wait_for_response>
 800098e:	4626      	mov	r6, r4
 8000990:	b120      	cbz	r0, 800099c <wifi_init+0x78>
 8000992:	483f      	ldr	r0, [pc, #252]	; (8000a90 <wifi_init+0x16c>)
 8000994:	f7ff fda8 	bl	80004e8 <printf_>
 8000998:	4640      	mov	r0, r8
 800099a:	e067      	b.n	8000a6c <wifi_init+0x148>
 800099c:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
 80009a0:	f000 f97e 	bl	8000ca0 <timer_delay_ms>
 80009a4:	483b      	ldr	r0, [pc, #236]	; (8000a94 <wifi_init+0x170>)
 80009a6:	f7ff fed7 	bl	8000758 <wifi_printf>
 80009aa:	4838      	ldr	r0, [pc, #224]	; (8000a8c <wifi_init+0x168>)
 80009ac:	21c8      	movs	r1, #200	; 0xc8
 80009ae:	f7ff ff1c 	bl	80007ea <wifi_wait_for_response>
 80009b2:	b120      	cbz	r0, 80009be <wifi_init+0x9a>
 80009b4:	4838      	ldr	r0, [pc, #224]	; (8000a98 <wifi_init+0x174>)
 80009b6:	f7ff fd97 	bl	80004e8 <printf_>
 80009ba:	2002      	movs	r0, #2
 80009bc:	e056      	b.n	8000a6c <wifi_init+0x148>
 80009be:	4837      	ldr	r0, [pc, #220]	; (8000a9c <wifi_init+0x178>)
 80009c0:	4937      	ldr	r1, [pc, #220]	; (8000aa0 <wifi_init+0x17c>)
 80009c2:	4a38      	ldr	r2, [pc, #224]	; (8000aa4 <wifi_init+0x180>)
 80009c4:	f7ff fec8 	bl	8000758 <wifi_printf>
 80009c8:	4830      	ldr	r0, [pc, #192]	; (8000a8c <wifi_init+0x168>)
 80009ca:	f246 11a8 	movw	r1, #25000	; 0x61a8
 80009ce:	f7ff ff0c 	bl	80007ea <wifi_wait_for_response>
 80009d2:	b128      	cbz	r0, 80009e0 <wifi_init+0xbc>
 80009d4:	4834      	ldr	r0, [pc, #208]	; (8000aa8 <wifi_init+0x184>)
 80009d6:	4932      	ldr	r1, [pc, #200]	; (8000aa0 <wifi_init+0x17c>)
 80009d8:	f7ff fd86 	bl	80004e8 <printf_>
 80009dc:	4638      	mov	r0, r7
 80009de:	e045      	b.n	8000a6c <wifi_init+0x148>
 80009e0:	4832      	ldr	r0, [pc, #200]	; (8000aac <wifi_init+0x188>)
 80009e2:	492f      	ldr	r1, [pc, #188]	; (8000aa0 <wifi_init+0x17c>)
 80009e4:	f7ff fd80 	bl	80004e8 <printf_>
 80009e8:	4b31      	ldr	r3, [pc, #196]	; (8000ab0 <wifi_init+0x18c>)
 80009ea:	aa04      	add	r2, sp, #16
 80009ec:	f103 0410 	add.w	r4, r3, #16
 80009f0:	4617      	mov	r7, r2
 80009f2:	6818      	ldr	r0, [r3, #0]
 80009f4:	6859      	ldr	r1, [r3, #4]
 80009f6:	4615      	mov	r5, r2
 80009f8:	c503      	stmia	r5!, {r0, r1}
 80009fa:	3308      	adds	r3, #8
 80009fc:	42a3      	cmp	r3, r4
 80009fe:	462a      	mov	r2, r5
 8000a00:	d1f7      	bne.n	80009f2 <wifi_init+0xce>
 8000a02:	6818      	ldr	r0, [r3, #0]
 8000a04:	791b      	ldrb	r3, [r3, #4]
 8000a06:	6028      	str	r0, [r5, #0]
 8000a08:	712b      	strb	r3, [r5, #4]
 8000a0a:	f8d6 0088 	ldr.w	r0, [r6, #136]	; 0x88
 8000a0e:	f8d6 1084 	ldr.w	r1, [r6, #132]	; 0x84
 8000a12:	f44f 7296 	mov.w	r2, #300	; 0x12c
 8000a16:	f7ff ff01 	bl	800081c <wifi_open>
 8000a1a:	4604      	mov	r4, r0
 8000a1c:	b960      	cbnz	r0, 8000a38 <wifi_init+0x114>
 8000a1e:	4638      	mov	r0, r7
 8000a20:	f7ff fe34 	bl	800068c <wifi_strlen_>
 8000a24:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
 8000a28:	4601      	mov	r1, r0
 8000a2a:	9300      	str	r3, [sp, #0]
 8000a2c:	4638      	mov	r0, r7
 8000a2e:	4a21      	ldr	r2, [pc, #132]	; (8000ab4 <wifi_init+0x190>)
 8000a30:	2320      	movs	r3, #32
 8000a32:	f7ff ff1f 	bl	8000874 <wifi_send_packet>
 8000a36:	4604      	mov	r4, r0
 8000a38:	2032      	movs	r0, #50	; 0x32
 8000a3a:	f7ff ff09 	bl	8000850 <wifi_close>
 8000a3e:	481e      	ldr	r0, [pc, #120]	; (8000ab8 <wifi_init+0x194>)
 8000a40:	4621      	mov	r1, r4
 8000a42:	f7ff fd51 	bl	80004e8 <printf_>
 8000a46:	b964      	cbnz	r4, 8000a62 <wifi_init+0x13e>
 8000a48:	481c      	ldr	r0, [pc, #112]	; (8000abc <wifi_init+0x198>)
 8000a4a:	f7ff fd4d 	bl	80004e8 <printf_>
 8000a4e:	4b19      	ldr	r3, [pc, #100]	; (8000ab4 <wifi_init+0x190>)
 8000a50:	5d18      	ldrb	r0, [r3, r4]
 8000a52:	3401      	adds	r4, #1
 8000a54:	f7ff fcce 	bl	80003f4 <putc_>
 8000a58:	2c20      	cmp	r4, #32
 8000a5a:	d1f8      	bne.n	8000a4e <wifi_init+0x12a>
 8000a5c:	4818      	ldr	r0, [pc, #96]	; (8000ac0 <wifi_init+0x19c>)
 8000a5e:	f7ff fd43 	bl	80004e8 <printf_>
 8000a62:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000a66:	f000 f91b 	bl	8000ca0 <timer_delay_ms>
 8000a6a:	e7bd      	b.n	80009e8 <wifi_init+0xc4>
 8000a6c:	b00a      	add	sp, #40	; 0x28
 8000a6e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000a72:	bf00      	nop
 8000a74:	20000004 	.word	0x20000004
 8000a78:	20000578 	.word	0x20000578
 8000a7c:	08001388 	.word	0x08001388
 8000a80:	20000000 	.word	0x20000000
 8000a84:	40020000 	.word	0x40020000
 8000a88:	0800139b 	.word	0x0800139b
 8000a8c:	08001360 	.word	0x08001360
 8000a90:	080013a3 	.word	0x080013a3
 8000a94:	080013b8 	.word	0x080013b8
 8000a98:	080013c6 	.word	0x080013c6
 8000a9c:	080013da 	.word	0x080013da
 8000aa0:	080013ef 	.word	0x080013ef
 8000aa4:	080013fc 	.word	0x080013fc
 8000aa8:	08001405 	.word	0x08001405
 8000aac:	0800141f 	.word	0x0800141f
 8000ab0:	08001466 	.word	0x08001466
 8000ab4:	20000604 	.word	0x20000604
 8000ab8:	0800143a 	.word	0x0800143a
 8000abc:	08001452 	.word	0x08001452
 8000ac0:	08001463 	.word	0x08001463

08000ac4 <main_thread>:
 8000ac4:	b508      	push	{r3, lr}
 8000ac6:	480b      	ldr	r0, [pc, #44]	; (8000af4 <main_thread+0x30>)
 8000ac8:	f7ff fd0e 	bl	80004e8 <printf_>
 8000acc:	2020      	movs	r0, #32
 8000ace:	f000 fb79 	bl	80011c4 <led_on>
 8000ad2:	f000 f8d7 	bl	8000c84 <timer_get_time>
 8000ad6:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 8000ada:	fbb0 f1f1 	udiv	r1, r0, r1
 8000ade:	4806      	ldr	r0, [pc, #24]	; (8000af8 <main_thread+0x34>)
 8000ae0:	f7ff fd02 	bl	80004e8 <printf_>
 8000ae4:	2020      	movs	r0, #32
 8000ae6:	f000 fb73 	bl	80011d0 <led_off>
 8000aea:	2064      	movs	r0, #100	; 0x64
 8000aec:	f000 f8d8 	bl	8000ca0 <timer_delay_ms>
 8000af0:	e7ec      	b.n	8000acc <main_thread+0x8>
 8000af2:	bf00      	nop
 8000af4:	0800147b 	.word	0x0800147b
 8000af8:	080014b6 	.word	0x080014b6

08000afc <TIM_TimeBaseInit>:
 8000afc:	4a1c      	ldr	r2, [pc, #112]	; (8000b70 <TIM_TimeBaseInit+0x74>)
 8000afe:	8803      	ldrh	r3, [r0, #0]
 8000b00:	4290      	cmp	r0, r2
 8000b02:	b29b      	uxth	r3, r3
 8000b04:	d012      	beq.n	8000b2c <TIM_TimeBaseInit+0x30>
 8000b06:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000b0a:	4290      	cmp	r0, r2
 8000b0c:	d00e      	beq.n	8000b2c <TIM_TimeBaseInit+0x30>
 8000b0e:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8000b12:	d00b      	beq.n	8000b2c <TIM_TimeBaseInit+0x30>
 8000b14:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 8000b18:	4290      	cmp	r0, r2
 8000b1a:	d007      	beq.n	8000b2c <TIM_TimeBaseInit+0x30>
 8000b1c:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000b20:	4290      	cmp	r0, r2
 8000b22:	d003      	beq.n	8000b2c <TIM_TimeBaseInit+0x30>
 8000b24:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000b28:	4290      	cmp	r0, r2
 8000b2a:	d103      	bne.n	8000b34 <TIM_TimeBaseInit+0x38>
 8000b2c:	884a      	ldrh	r2, [r1, #2]
 8000b2e:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8000b32:	4313      	orrs	r3, r2
 8000b34:	4a0f      	ldr	r2, [pc, #60]	; (8000b74 <TIM_TimeBaseInit+0x78>)
 8000b36:	4290      	cmp	r0, r2
 8000b38:	d008      	beq.n	8000b4c <TIM_TimeBaseInit+0x50>
 8000b3a:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000b3e:	4290      	cmp	r0, r2
 8000b40:	d004      	beq.n	8000b4c <TIM_TimeBaseInit+0x50>
 8000b42:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000b46:	890a      	ldrh	r2, [r1, #8]
 8000b48:	b29b      	uxth	r3, r3
 8000b4a:	4313      	orrs	r3, r2
 8000b4c:	8003      	strh	r3, [r0, #0]
 8000b4e:	684b      	ldr	r3, [r1, #4]
 8000b50:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000b52:	880b      	ldrh	r3, [r1, #0]
 8000b54:	8503      	strh	r3, [r0, #40]	; 0x28
 8000b56:	4b06      	ldr	r3, [pc, #24]	; (8000b70 <TIM_TimeBaseInit+0x74>)
 8000b58:	4298      	cmp	r0, r3
 8000b5a:	d003      	beq.n	8000b64 <TIM_TimeBaseInit+0x68>
 8000b5c:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000b60:	4298      	cmp	r0, r3
 8000b62:	d101      	bne.n	8000b68 <TIM_TimeBaseInit+0x6c>
 8000b64:	7a8b      	ldrb	r3, [r1, #10]
 8000b66:	8603      	strh	r3, [r0, #48]	; 0x30
 8000b68:	2301      	movs	r3, #1
 8000b6a:	8283      	strh	r3, [r0, #20]
 8000b6c:	4770      	bx	lr
 8000b6e:	bf00      	nop
 8000b70:	40010000 	.word	0x40010000
 8000b74:	40001000 	.word	0x40001000

08000b78 <TIM_Cmd>:
 8000b78:	8803      	ldrh	r3, [r0, #0]
 8000b7a:	b119      	cbz	r1, 8000b84 <TIM_Cmd+0xc>
 8000b7c:	b29b      	uxth	r3, r3
 8000b7e:	f043 0301 	orr.w	r3, r3, #1
 8000b82:	e003      	b.n	8000b8c <TIM_Cmd+0x14>
 8000b84:	f023 0301 	bic.w	r3, r3, #1
 8000b88:	041b      	lsls	r3, r3, #16
 8000b8a:	0c1b      	lsrs	r3, r3, #16
 8000b8c:	8003      	strh	r3, [r0, #0]
 8000b8e:	4770      	bx	lr

08000b90 <TIM_ClearITPendingBit>:
 8000b90:	43c9      	mvns	r1, r1
 8000b92:	b289      	uxth	r1, r1
 8000b94:	8201      	strh	r1, [r0, #16]
 8000b96:	4770      	bx	lr

08000b98 <timer_init>:
 8000b98:	b530      	push	{r4, r5, lr}
 8000b9a:	2000      	movs	r0, #0
 8000b9c:	b085      	sub	sp, #20
 8000b9e:	4a1e      	ldr	r2, [pc, #120]	; (8000c18 <timer_init+0x80>)
 8000ba0:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8000ba4:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000ba8:	4a1c      	ldr	r2, [pc, #112]	; (8000c1c <timer_init+0x84>)
 8000baa:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000bae:	4b1c      	ldr	r3, [pc, #112]	; (8000c20 <timer_init+0x88>)
 8000bb0:	2400      	movs	r4, #0
 8000bb2:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 8000bb6:	3001      	adds	r0, #1
 8000bb8:	2804      	cmp	r0, #4
 8000bba:	4625      	mov	r5, r4
 8000bbc:	d1ef      	bne.n	8000b9e <timer_init+0x6>
 8000bbe:	4b19      	ldr	r3, [pc, #100]	; (8000c24 <timer_init+0x8c>)
 8000bc0:	2101      	movs	r1, #1
 8000bc2:	601c      	str	r4, [r3, #0]
 8000bc4:	f000 fab2 	bl	800112c <RCC_APB1PeriphClockCmd>
 8000bc8:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000bcc:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000bd0:	f88d 400e 	strb.w	r4, [sp, #14]
 8000bd4:	4c14      	ldr	r4, [pc, #80]	; (8000c28 <timer_init+0x90>)
 8000bd6:	2353      	movs	r3, #83	; 0x53
 8000bd8:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000bdc:	4620      	mov	r0, r4
 8000bde:	2331      	movs	r3, #49	; 0x31
 8000be0:	a901      	add	r1, sp, #4
 8000be2:	9302      	str	r3, [sp, #8]
 8000be4:	f7ff ff8a 	bl	8000afc <TIM_TimeBaseInit>
 8000be8:	4620      	mov	r0, r4
 8000bea:	2101      	movs	r1, #1
 8000bec:	f7ff ffc4 	bl	8000b78 <TIM_Cmd>
 8000bf0:	89a3      	ldrh	r3, [r4, #12]
 8000bf2:	b29b      	uxth	r3, r3
 8000bf4:	f043 0301 	orr.w	r3, r3, #1
 8000bf8:	81a3      	strh	r3, [r4, #12]
 8000bfa:	231e      	movs	r3, #30
 8000bfc:	f88d 3000 	strb.w	r3, [sp]
 8000c00:	4668      	mov	r0, sp
 8000c02:	2301      	movs	r3, #1
 8000c04:	f88d 5001 	strb.w	r5, [sp, #1]
 8000c08:	f88d 3002 	strb.w	r3, [sp, #2]
 8000c0c:	f88d 3003 	strb.w	r3, [sp, #3]
 8000c10:	f000 fb38 	bl	8001284 <NVIC_Init>
 8000c14:	b005      	add	sp, #20
 8000c16:	bd30      	pop	{r4, r5, pc}
 8000c18:	20000638 	.word	0x20000638
 8000c1c:	2000062c 	.word	0x2000062c
 8000c20:	20000624 	.word	0x20000624
 8000c24:	20000634 	.word	0x20000634
 8000c28:	40000800 	.word	0x40000800

08000c2c <TIM4_IRQHandler>:
 8000c2c:	2300      	movs	r3, #0
 8000c2e:	4a10      	ldr	r2, [pc, #64]	; (8000c70 <TIM4_IRQHandler+0x44>)
 8000c30:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000c34:	b289      	uxth	r1, r1
 8000c36:	b129      	cbz	r1, 8000c44 <TIM4_IRQHandler+0x18>
 8000c38:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000c3c:	b289      	uxth	r1, r1
 8000c3e:	3901      	subs	r1, #1
 8000c40:	b289      	uxth	r1, r1
 8000c42:	e007      	b.n	8000c54 <TIM4_IRQHandler+0x28>
 8000c44:	490b      	ldr	r1, [pc, #44]	; (8000c74 <TIM4_IRQHandler+0x48>)
 8000c46:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8000c4a:	b289      	uxth	r1, r1
 8000c4c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000c50:	4a09      	ldr	r2, [pc, #36]	; (8000c78 <TIM4_IRQHandler+0x4c>)
 8000c52:	2101      	movs	r1, #1
 8000c54:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000c58:	3301      	adds	r3, #1
 8000c5a:	2b04      	cmp	r3, #4
 8000c5c:	d1e7      	bne.n	8000c2e <TIM4_IRQHandler+0x2>
 8000c5e:	4b07      	ldr	r3, [pc, #28]	; (8000c7c <TIM4_IRQHandler+0x50>)
 8000c60:	4807      	ldr	r0, [pc, #28]	; (8000c80 <TIM4_IRQHandler+0x54>)
 8000c62:	681a      	ldr	r2, [r3, #0]
 8000c64:	2101      	movs	r1, #1
 8000c66:	3201      	adds	r2, #1
 8000c68:	601a      	str	r2, [r3, #0]
 8000c6a:	f7ff bf91 	b.w	8000b90 <TIM_ClearITPendingBit>
 8000c6e:	bf00      	nop
 8000c70:	20000638 	.word	0x20000638
 8000c74:	2000062c 	.word	0x2000062c
 8000c78:	20000624 	.word	0x20000624
 8000c7c:	20000634 	.word	0x20000634
 8000c80:	40000800 	.word	0x40000800

08000c84 <timer_get_time>:
 8000c84:	b082      	sub	sp, #8
 8000c86:	b672      	cpsid	i
 8000c88:	4b04      	ldr	r3, [pc, #16]	; (8000c9c <timer_get_time+0x18>)
 8000c8a:	681b      	ldr	r3, [r3, #0]
 8000c8c:	9301      	str	r3, [sp, #4]
 8000c8e:	b662      	cpsie	i
 8000c90:	9801      	ldr	r0, [sp, #4]
 8000c92:	230a      	movs	r3, #10
 8000c94:	fbb0 f0f3 	udiv	r0, r0, r3
 8000c98:	b002      	add	sp, #8
 8000c9a:	4770      	bx	lr
 8000c9c:	20000634 	.word	0x20000634

08000ca0 <timer_delay_ms>:
 8000ca0:	b513      	push	{r0, r1, r4, lr}
 8000ca2:	4604      	mov	r4, r0
 8000ca4:	f7ff ffee 	bl	8000c84 <timer_get_time>
 8000ca8:	4420      	add	r0, r4
 8000caa:	9001      	str	r0, [sp, #4]
 8000cac:	9c01      	ldr	r4, [sp, #4]
 8000cae:	f7ff ffe9 	bl	8000c84 <timer_get_time>
 8000cb2:	4284      	cmp	r4, r0
 8000cb4:	d902      	bls.n	8000cbc <timer_delay_ms+0x1c>
 8000cb6:	f000 f923 	bl	8000f00 <sleep>
 8000cba:	e7f7      	b.n	8000cac <timer_delay_ms+0xc>
 8000cbc:	b002      	add	sp, #8
 8000cbe:	bd10      	pop	{r4, pc}

08000cc0 <uart_write>:
 8000cc0:	4b03      	ldr	r3, [pc, #12]	; (8000cd0 <uart_write+0x10>)
 8000cc2:	881a      	ldrh	r2, [r3, #0]
 8000cc4:	0652      	lsls	r2, r2, #25
 8000cc6:	d401      	bmi.n	8000ccc <uart_write+0xc>
 8000cc8:	bf00      	nop
 8000cca:	e7f9      	b.n	8000cc0 <uart_write>
 8000ccc:	8098      	strh	r0, [r3, #4]
 8000cce:	4770      	bx	lr
 8000cd0:	40011000 	.word	0x40011000

08000cd4 <uart_init>:
 8000cd4:	b530      	push	{r4, r5, lr}
 8000cd6:	2010      	movs	r0, #16
 8000cd8:	b087      	sub	sp, #28
 8000cda:	2101      	movs	r1, #1
 8000cdc:	f000 fa32 	bl	8001144 <RCC_APB2PeriphClockCmd>
 8000ce0:	2001      	movs	r0, #1
 8000ce2:	4d1c      	ldr	r5, [pc, #112]	; (8000d54 <uart_init+0x80>)
 8000ce4:	4601      	mov	r1, r0
 8000ce6:	f000 fa15 	bl	8001114 <RCC_AHB1PeriphClockCmd>
 8000cea:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8000cee:	2400      	movs	r4, #0
 8000cf0:	9300      	str	r3, [sp, #0]
 8000cf2:	4628      	mov	r0, r5
 8000cf4:	2302      	movs	r3, #2
 8000cf6:	4669      	mov	r1, sp
 8000cf8:	f88d 3004 	strb.w	r3, [sp, #4]
 8000cfc:	f88d 3005 	strb.w	r3, [sp, #5]
 8000d00:	f88d 4006 	strb.w	r4, [sp, #6]
 8000d04:	f88d 4007 	strb.w	r4, [sp, #7]
 8000d08:	f000 fa68 	bl	80011dc <GPIO_Init>
 8000d0c:	4628      	mov	r0, r5
 8000d0e:	2109      	movs	r1, #9
 8000d10:	2207      	movs	r2, #7
 8000d12:	f000 faa4 	bl	800125e <GPIO_PinAFConfig>
 8000d16:	2207      	movs	r2, #7
 8000d18:	4628      	mov	r0, r5
 8000d1a:	210a      	movs	r1, #10
 8000d1c:	f000 fa9f 	bl	800125e <GPIO_PinAFConfig>
 8000d20:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000d24:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000d28:	f8ad 4010 	strh.w	r4, [sp, #16]
 8000d2c:	f8ad 4014 	strh.w	r4, [sp, #20]
 8000d30:	4c09      	ldr	r4, [pc, #36]	; (8000d58 <uart_init+0x84>)
 8000d32:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8000d36:	9302      	str	r3, [sp, #8]
 8000d38:	4620      	mov	r0, r4
 8000d3a:	230c      	movs	r3, #12
 8000d3c:	a902      	add	r1, sp, #8
 8000d3e:	f8ad 3012 	strh.w	r3, [sp, #18]
 8000d42:	f000 f80b 	bl	8000d5c <USART_Init>
 8000d46:	4620      	mov	r0, r4
 8000d48:	2101      	movs	r1, #1
 8000d4a:	f000 f861 	bl	8000e10 <USART_Cmd>
 8000d4e:	b007      	add	sp, #28
 8000d50:	bd30      	pop	{r4, r5, pc}
 8000d52:	bf00      	nop
 8000d54:	40020000 	.word	0x40020000
 8000d58:	40011000 	.word	0x40011000

08000d5c <USART_Init>:
 8000d5c:	8a03      	ldrh	r3, [r0, #16]
 8000d5e:	88ca      	ldrh	r2, [r1, #6]
 8000d60:	b29b      	uxth	r3, r3
 8000d62:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 8000d66:	b530      	push	{r4, r5, lr}
 8000d68:	4313      	orrs	r3, r2
 8000d6a:	460d      	mov	r5, r1
 8000d6c:	8203      	strh	r3, [r0, #16]
 8000d6e:	8983      	ldrh	r3, [r0, #12]
 8000d70:	8909      	ldrh	r1, [r1, #8]
 8000d72:	88aa      	ldrh	r2, [r5, #4]
 8000d74:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8000d78:	430a      	orrs	r2, r1
 8000d7a:	8969      	ldrh	r1, [r5, #10]
 8000d7c:	f023 030c 	bic.w	r3, r3, #12
 8000d80:	430a      	orrs	r2, r1
 8000d82:	041b      	lsls	r3, r3, #16
 8000d84:	b292      	uxth	r2, r2
 8000d86:	0c1b      	lsrs	r3, r3, #16
 8000d88:	4313      	orrs	r3, r2
 8000d8a:	8183      	strh	r3, [r0, #12]
 8000d8c:	8a83      	ldrh	r3, [r0, #20]
 8000d8e:	89aa      	ldrh	r2, [r5, #12]
 8000d90:	b29b      	uxth	r3, r3
 8000d92:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000d96:	4313      	orrs	r3, r2
 8000d98:	b085      	sub	sp, #20
 8000d9a:	8283      	strh	r3, [r0, #20]
 8000d9c:	4604      	mov	r4, r0
 8000d9e:	4668      	mov	r0, sp
 8000da0:	f000 f974 	bl	800108c <RCC_GetClocksFreq>
 8000da4:	4b19      	ldr	r3, [pc, #100]	; (8000e0c <USART_Init+0xb0>)
 8000da6:	429c      	cmp	r4, r3
 8000da8:	d003      	beq.n	8000db2 <USART_Init+0x56>
 8000daa:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000dae:	429c      	cmp	r4, r3
 8000db0:	d101      	bne.n	8000db6 <USART_Init+0x5a>
 8000db2:	9b03      	ldr	r3, [sp, #12]
 8000db4:	e000      	b.n	8000db8 <USART_Init+0x5c>
 8000db6:	9b02      	ldr	r3, [sp, #8]
 8000db8:	89a2      	ldrh	r2, [r4, #12]
 8000dba:	b212      	sxth	r2, r2
 8000dbc:	2a00      	cmp	r2, #0
 8000dbe:	682a      	ldr	r2, [r5, #0]
 8000dc0:	f04f 0119 	mov.w	r1, #25
 8000dc4:	bfb4      	ite	lt
 8000dc6:	0052      	lsllt	r2, r2, #1
 8000dc8:	0092      	lslge	r2, r2, #2
 8000dca:	4359      	muls	r1, r3
 8000dcc:	fbb1 f1f2 	udiv	r1, r1, r2
 8000dd0:	2364      	movs	r3, #100	; 0x64
 8000dd2:	fbb1 f2f3 	udiv	r2, r1, r3
 8000dd6:	0112      	lsls	r2, r2, #4
 8000dd8:	0910      	lsrs	r0, r2, #4
 8000dda:	fb03 1110 	mls	r1, r3, r0, r1
 8000dde:	89a0      	ldrh	r0, [r4, #12]
 8000de0:	b200      	sxth	r0, r0
 8000de2:	2800      	cmp	r0, #0
 8000de4:	da06      	bge.n	8000df4 <USART_Init+0x98>
 8000de6:	00c9      	lsls	r1, r1, #3
 8000de8:	3132      	adds	r1, #50	; 0x32
 8000dea:	fbb1 f3f3 	udiv	r3, r1, r3
 8000dee:	f003 0307 	and.w	r3, r3, #7
 8000df2:	e005      	b.n	8000e00 <USART_Init+0xa4>
 8000df4:	0109      	lsls	r1, r1, #4
 8000df6:	3132      	adds	r1, #50	; 0x32
 8000df8:	fbb1 f3f3 	udiv	r3, r1, r3
 8000dfc:	f003 030f 	and.w	r3, r3, #15
 8000e00:	431a      	orrs	r2, r3
 8000e02:	b292      	uxth	r2, r2
 8000e04:	8122      	strh	r2, [r4, #8]
 8000e06:	b005      	add	sp, #20
 8000e08:	bd30      	pop	{r4, r5, pc}
 8000e0a:	bf00      	nop
 8000e0c:	40011000 	.word	0x40011000

08000e10 <USART_Cmd>:
 8000e10:	8983      	ldrh	r3, [r0, #12]
 8000e12:	b119      	cbz	r1, 8000e1c <USART_Cmd+0xc>
 8000e14:	b29b      	uxth	r3, r3
 8000e16:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 8000e1a:	e003      	b.n	8000e24 <USART_Cmd+0x14>
 8000e1c:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 8000e20:	041b      	lsls	r3, r3, #16
 8000e22:	0c1b      	lsrs	r3, r3, #16
 8000e24:	8183      	strh	r3, [r0, #12]
 8000e26:	4770      	bx	lr

08000e28 <uart2_write>:
 8000e28:	4b03      	ldr	r3, [pc, #12]	; (8000e38 <uart2_write+0x10>)
 8000e2a:	881a      	ldrh	r2, [r3, #0]
 8000e2c:	0652      	lsls	r2, r2, #25
 8000e2e:	d401      	bmi.n	8000e34 <uart2_write+0xc>
 8000e30:	bf00      	nop
 8000e32:	e7f9      	b.n	8000e28 <uart2_write>
 8000e34:	8098      	strh	r0, [r3, #4]
 8000e36:	4770      	bx	lr
 8000e38:	40004400 	.word	0x40004400

08000e3c <uart2_read_nonblocking>:
 8000e3c:	4b04      	ldr	r3, [pc, #16]	; (8000e50 <uart2_read_nonblocking+0x14>)
 8000e3e:	881a      	ldrh	r2, [r3, #0]
 8000e40:	0690      	lsls	r0, r2, #26
 8000e42:	bf4a      	itet	mi
 8000e44:	8898      	ldrhmi	r0, [r3, #4]
 8000e46:	f64f 70ff 	movwpl	r0, #65535	; 0xffff
 8000e4a:	b280      	uxthmi	r0, r0
 8000e4c:	b200      	sxth	r0, r0
 8000e4e:	4770      	bx	lr
 8000e50:	40004400 	.word	0x40004400

08000e54 <uart2_init>:
 8000e54:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000e58:	2101      	movs	r1, #1
 8000e5a:	b086      	sub	sp, #24
 8000e5c:	4680      	mov	r8, r0
 8000e5e:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8000e62:	f000 f963 	bl	800112c <RCC_APB1PeriphClockCmd>
 8000e66:	4e1b      	ldr	r6, [pc, #108]	; (8000ed4 <uart2_init+0x80>)
 8000e68:	2001      	movs	r0, #1
 8000e6a:	4601      	mov	r1, r0
 8000e6c:	f000 f952 	bl	8001114 <RCC_AHB1PeriphClockCmd>
 8000e70:	2400      	movs	r4, #0
 8000e72:	2502      	movs	r5, #2
 8000e74:	270c      	movs	r7, #12
 8000e76:	4630      	mov	r0, r6
 8000e78:	4669      	mov	r1, sp
 8000e7a:	f88d 4006 	strb.w	r4, [sp, #6]
 8000e7e:	9700      	str	r7, [sp, #0]
 8000e80:	f88d 5004 	strb.w	r5, [sp, #4]
 8000e84:	f88d 5005 	strb.w	r5, [sp, #5]
 8000e88:	f88d 5007 	strb.w	r5, [sp, #7]
 8000e8c:	f000 f9a6 	bl	80011dc <GPIO_Init>
 8000e90:	4630      	mov	r0, r6
 8000e92:	4629      	mov	r1, r5
 8000e94:	2207      	movs	r2, #7
 8000e96:	f000 f9e2 	bl	800125e <GPIO_PinAFConfig>
 8000e9a:	2207      	movs	r2, #7
 8000e9c:	4630      	mov	r0, r6
 8000e9e:	2103      	movs	r1, #3
 8000ea0:	f000 f9dd 	bl	800125e <GPIO_PinAFConfig>
 8000ea4:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000ea8:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000eac:	f8ad 4010 	strh.w	r4, [sp, #16]
 8000eb0:	f8ad 4014 	strh.w	r4, [sp, #20]
 8000eb4:	4c08      	ldr	r4, [pc, #32]	; (8000ed8 <uart2_init+0x84>)
 8000eb6:	f8cd 8008 	str.w	r8, [sp, #8]
 8000eba:	4620      	mov	r0, r4
 8000ebc:	a902      	add	r1, sp, #8
 8000ebe:	f8ad 7012 	strh.w	r7, [sp, #18]
 8000ec2:	f7ff ff4b 	bl	8000d5c <USART_Init>
 8000ec6:	4620      	mov	r0, r4
 8000ec8:	2101      	movs	r1, #1
 8000eca:	f7ff ffa1 	bl	8000e10 <USART_Cmd>
 8000ece:	b006      	add	sp, #24
 8000ed0:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000ed4:	40020000 	.word	0x40020000
 8000ed8:	40004400 	.word	0x40004400

08000edc <sys_tick_init>:
 8000edc:	4b05      	ldr	r3, [pc, #20]	; (8000ef4 <sys_tick_init+0x18>)
 8000ede:	4a06      	ldr	r2, [pc, #24]	; (8000ef8 <sys_tick_init+0x1c>)
 8000ee0:	605a      	str	r2, [r3, #4]
 8000ee2:	4a06      	ldr	r2, [pc, #24]	; (8000efc <sys_tick_init+0x20>)
 8000ee4:	21f0      	movs	r1, #240	; 0xf0
 8000ee6:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8000eea:	2200      	movs	r2, #0
 8000eec:	609a      	str	r2, [r3, #8]
 8000eee:	2207      	movs	r2, #7
 8000ef0:	601a      	str	r2, [r3, #0]
 8000ef2:	4770      	bx	lr
 8000ef4:	e000e010 	.word	0xe000e010
 8000ef8:	00029040 	.word	0x00029040
 8000efc:	e000ed00 	.word	0xe000ed00

08000f00 <sleep>:
 8000f00:	bf30      	wfi
 8000f02:	4770      	bx	lr

08000f04 <sytem_clock_init>:
 8000f04:	f000 b800 	b.w	8000f08 <SystemInit>

08000f08 <SystemInit>:
 8000f08:	4b3b      	ldr	r3, [pc, #236]	; (8000ff8 <SystemInit+0xf0>)
 8000f0a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000f0e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000f12:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000f16:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000f1a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000f1e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000f22:	4b36      	ldr	r3, [pc, #216]	; (8000ffc <SystemInit+0xf4>)
 8000f24:	681a      	ldr	r2, [r3, #0]
 8000f26:	f042 0201 	orr.w	r2, r2, #1
 8000f2a:	601a      	str	r2, [r3, #0]
 8000f2c:	2200      	movs	r2, #0
 8000f2e:	609a      	str	r2, [r3, #8]
 8000f30:	6819      	ldr	r1, [r3, #0]
 8000f32:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 8000f36:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 8000f3a:	6019      	str	r1, [r3, #0]
 8000f3c:	4930      	ldr	r1, [pc, #192]	; (8001000 <SystemInit+0xf8>)
 8000f3e:	6059      	str	r1, [r3, #4]
 8000f40:	6819      	ldr	r1, [r3, #0]
 8000f42:	b082      	sub	sp, #8
 8000f44:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 8000f48:	6019      	str	r1, [r3, #0]
 8000f4a:	60da      	str	r2, [r3, #12]
 8000f4c:	9200      	str	r2, [sp, #0]
 8000f4e:	9201      	str	r2, [sp, #4]
 8000f50:	681a      	ldr	r2, [r3, #0]
 8000f52:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8000f56:	601a      	str	r2, [r3, #0]
 8000f58:	4b28      	ldr	r3, [pc, #160]	; (8000ffc <SystemInit+0xf4>)
 8000f5a:	681a      	ldr	r2, [r3, #0]
 8000f5c:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8000f60:	9201      	str	r2, [sp, #4]
 8000f62:	9a00      	ldr	r2, [sp, #0]
 8000f64:	3201      	adds	r2, #1
 8000f66:	9200      	str	r2, [sp, #0]
 8000f68:	9a01      	ldr	r2, [sp, #4]
 8000f6a:	b91a      	cbnz	r2, 8000f74 <SystemInit+0x6c>
 8000f6c:	9a00      	ldr	r2, [sp, #0]
 8000f6e:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 8000f72:	d1f1      	bne.n	8000f58 <SystemInit+0x50>
 8000f74:	681b      	ldr	r3, [r3, #0]
 8000f76:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8000f7a:	bf18      	it	ne
 8000f7c:	2301      	movne	r3, #1
 8000f7e:	9301      	str	r3, [sp, #4]
 8000f80:	9b01      	ldr	r3, [sp, #4]
 8000f82:	2b01      	cmp	r3, #1
 8000f84:	d005      	beq.n	8000f92 <SystemInit+0x8a>
 8000f86:	4b1c      	ldr	r3, [pc, #112]	; (8000ff8 <SystemInit+0xf0>)
 8000f88:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8000f8c:	609a      	str	r2, [r3, #8]
 8000f8e:	b002      	add	sp, #8
 8000f90:	4770      	bx	lr
 8000f92:	4b1a      	ldr	r3, [pc, #104]	; (8000ffc <SystemInit+0xf4>)
 8000f94:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000f96:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 8000f9a:	641a      	str	r2, [r3, #64]	; 0x40
 8000f9c:	4a19      	ldr	r2, [pc, #100]	; (8001004 <SystemInit+0xfc>)
 8000f9e:	6811      	ldr	r1, [r2, #0]
 8000fa0:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 8000fa4:	6011      	str	r1, [r2, #0]
 8000fa6:	689a      	ldr	r2, [r3, #8]
 8000fa8:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 8000fac:	609a      	str	r2, [r3, #8]
 8000fae:	689a      	ldr	r2, [r3, #8]
 8000fb0:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 8000fb4:	609a      	str	r2, [r3, #8]
 8000fb6:	689a      	ldr	r2, [r3, #8]
 8000fb8:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 8000fbc:	609a      	str	r2, [r3, #8]
 8000fbe:	4a12      	ldr	r2, [pc, #72]	; (8001008 <SystemInit+0x100>)
 8000fc0:	605a      	str	r2, [r3, #4]
 8000fc2:	681a      	ldr	r2, [r3, #0]
 8000fc4:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8000fc8:	601a      	str	r2, [r3, #0]
 8000fca:	6819      	ldr	r1, [r3, #0]
 8000fcc:	4a0b      	ldr	r2, [pc, #44]	; (8000ffc <SystemInit+0xf4>)
 8000fce:	0189      	lsls	r1, r1, #6
 8000fd0:	d5fb      	bpl.n	8000fca <SystemInit+0xc2>
 8000fd2:	4b0e      	ldr	r3, [pc, #56]	; (800100c <SystemInit+0x104>)
 8000fd4:	f240 6105 	movw	r1, #1541	; 0x605
 8000fd8:	6019      	str	r1, [r3, #0]
 8000fda:	6893      	ldr	r3, [r2, #8]
 8000fdc:	f023 0303 	bic.w	r3, r3, #3
 8000fe0:	6093      	str	r3, [r2, #8]
 8000fe2:	6893      	ldr	r3, [r2, #8]
 8000fe4:	f043 0302 	orr.w	r3, r3, #2
 8000fe8:	6093      	str	r3, [r2, #8]
 8000fea:	4b04      	ldr	r3, [pc, #16]	; (8000ffc <SystemInit+0xf4>)
 8000fec:	689b      	ldr	r3, [r3, #8]
 8000fee:	f003 030c 	and.w	r3, r3, #12
 8000ff2:	2b08      	cmp	r3, #8
 8000ff4:	d1f9      	bne.n	8000fea <SystemInit+0xe2>
 8000ff6:	e7c6      	b.n	8000f86 <SystemInit+0x7e>
 8000ff8:	e000ed00 	.word	0xe000ed00
 8000ffc:	40023800 	.word	0x40023800
 8001000:	24003010 	.word	0x24003010
 8001004:	40007000 	.word	0x40007000
 8001008:	07405408 	.word	0x07405408
 800100c:	40023c00 	.word	0x40023c00

08001010 <Default_Handler>:
 8001010:	4668      	mov	r0, sp
 8001012:	f020 0107 	bic.w	r1, r0, #7
 8001016:	468d      	mov	sp, r1
 8001018:	bf00      	nop
 800101a:	e7fd      	b.n	8001018 <Default_Handler+0x8>

0800101c <HardFault_Handler>:
 800101c:	2020      	movs	r0, #32
 800101e:	f000 f8d1 	bl	80011c4 <led_on>
 8001022:	4b06      	ldr	r3, [pc, #24]	; (800103c <HardFault_Handler+0x20>)
 8001024:	3b01      	subs	r3, #1
 8001026:	d001      	beq.n	800102c <HardFault_Handler+0x10>
 8001028:	bf00      	nop
 800102a:	e7fb      	b.n	8001024 <HardFault_Handler+0x8>
 800102c:	2020      	movs	r0, #32
 800102e:	f000 f8cf 	bl	80011d0 <led_off>
 8001032:	4b02      	ldr	r3, [pc, #8]	; (800103c <HardFault_Handler+0x20>)
 8001034:	3b01      	subs	r3, #1
 8001036:	d0f1      	beq.n	800101c <HardFault_Handler>
 8001038:	bf00      	nop
 800103a:	e7fb      	b.n	8001034 <HardFault_Handler+0x18>
 800103c:	00989681 	.word	0x00989681

08001040 <_reset_init>:
 8001040:	4a0e      	ldr	r2, [pc, #56]	; (800107c <_reset_init+0x3c>)
 8001042:	480f      	ldr	r0, [pc, #60]	; (8001080 <_reset_init+0x40>)
 8001044:	1a80      	subs	r0, r0, r2
 8001046:	1080      	asrs	r0, r0, #2
 8001048:	2300      	movs	r3, #0
 800104a:	4283      	cmp	r3, r0
 800104c:	d006      	beq.n	800105c <_reset_init+0x1c>
 800104e:	490d      	ldr	r1, [pc, #52]	; (8001084 <_reset_init+0x44>)
 8001050:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8001054:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001058:	3301      	adds	r3, #1
 800105a:	e7f6      	b.n	800104a <_reset_init+0xa>
 800105c:	4b0a      	ldr	r3, [pc, #40]	; (8001088 <_reset_init+0x48>)
 800105e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001062:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001066:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800106a:	f503 730c 	add.w	r3, r3, #560	; 0x230
 800106e:	685a      	ldr	r2, [r3, #4]
 8001070:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8001074:	605a      	str	r2, [r3, #4]
 8001076:	f7ff bae1 	b.w	800063c <main>
 800107a:	bf00      	nop
 800107c:	20000000 	.word	0x20000000
 8001080:	20000024 	.word	0x20000024
 8001084:	080014d8 	.word	0x080014d8
 8001088:	e000ed00 	.word	0xe000ed00

0800108c <RCC_GetClocksFreq>:
 800108c:	4b1d      	ldr	r3, [pc, #116]	; (8001104 <RCC_GetClocksFreq+0x78>)
 800108e:	689a      	ldr	r2, [r3, #8]
 8001090:	f002 020c 	and.w	r2, r2, #12
 8001094:	2a04      	cmp	r2, #4
 8001096:	b510      	push	{r4, lr}
 8001098:	d003      	beq.n	80010a2 <RCC_GetClocksFreq+0x16>
 800109a:	2a08      	cmp	r2, #8
 800109c:	d003      	beq.n	80010a6 <RCC_GetClocksFreq+0x1a>
 800109e:	4b1a      	ldr	r3, [pc, #104]	; (8001108 <RCC_GetClocksFreq+0x7c>)
 80010a0:	e018      	b.n	80010d4 <RCC_GetClocksFreq+0x48>
 80010a2:	4b1a      	ldr	r3, [pc, #104]	; (800110c <RCC_GetClocksFreq+0x80>)
 80010a4:	e016      	b.n	80010d4 <RCC_GetClocksFreq+0x48>
 80010a6:	6859      	ldr	r1, [r3, #4]
 80010a8:	685a      	ldr	r2, [r3, #4]
 80010aa:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 80010ae:	6859      	ldr	r1, [r3, #4]
 80010b0:	bf14      	ite	ne
 80010b2:	4b16      	ldrne	r3, [pc, #88]	; (800110c <RCC_GetClocksFreq+0x80>)
 80010b4:	4b14      	ldreq	r3, [pc, #80]	; (8001108 <RCC_GetClocksFreq+0x7c>)
 80010b6:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 80010ba:	fbb3 f3f2 	udiv	r3, r3, r2
 80010be:	4a11      	ldr	r2, [pc, #68]	; (8001104 <RCC_GetClocksFreq+0x78>)
 80010c0:	6852      	ldr	r2, [r2, #4]
 80010c2:	f3c2 4201 	ubfx	r2, r2, #16, #2
 80010c6:	f3c1 1188 	ubfx	r1, r1, #6, #9
 80010ca:	3201      	adds	r2, #1
 80010cc:	434b      	muls	r3, r1
 80010ce:	0052      	lsls	r2, r2, #1
 80010d0:	fbb3 f3f2 	udiv	r3, r3, r2
 80010d4:	490b      	ldr	r1, [pc, #44]	; (8001104 <RCC_GetClocksFreq+0x78>)
 80010d6:	6003      	str	r3, [r0, #0]
 80010d8:	688b      	ldr	r3, [r1, #8]
 80010da:	4a0d      	ldr	r2, [pc, #52]	; (8001110 <RCC_GetClocksFreq+0x84>)
 80010dc:	f3c3 1303 	ubfx	r3, r3, #4, #4
 80010e0:	5cd4      	ldrb	r4, [r2, r3]
 80010e2:	6803      	ldr	r3, [r0, #0]
 80010e4:	40e3      	lsrs	r3, r4
 80010e6:	6043      	str	r3, [r0, #4]
 80010e8:	688c      	ldr	r4, [r1, #8]
 80010ea:	f3c4 2482 	ubfx	r4, r4, #10, #3
 80010ee:	5d14      	ldrb	r4, [r2, r4]
 80010f0:	fa23 f404 	lsr.w	r4, r3, r4
 80010f4:	6084      	str	r4, [r0, #8]
 80010f6:	6889      	ldr	r1, [r1, #8]
 80010f8:	f3c1 3142 	ubfx	r1, r1, #13, #3
 80010fc:	5c52      	ldrb	r2, [r2, r1]
 80010fe:	40d3      	lsrs	r3, r2
 8001100:	60c3      	str	r3, [r0, #12]
 8001102:	bd10      	pop	{r4, pc}
 8001104:	40023800 	.word	0x40023800
 8001108:	00f42400 	.word	0x00f42400
 800110c:	007a1200 	.word	0x007a1200
 8001110:	20000011 	.word	0x20000011

08001114 <RCC_AHB1PeriphClockCmd>:
 8001114:	4b04      	ldr	r3, [pc, #16]	; (8001128 <RCC_AHB1PeriphClockCmd+0x14>)
 8001116:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8001118:	b109      	cbz	r1, 800111e <RCC_AHB1PeriphClockCmd+0xa>
 800111a:	4310      	orrs	r0, r2
 800111c:	e001      	b.n	8001122 <RCC_AHB1PeriphClockCmd+0xe>
 800111e:	ea22 0000 	bic.w	r0, r2, r0
 8001122:	6318      	str	r0, [r3, #48]	; 0x30
 8001124:	4770      	bx	lr
 8001126:	bf00      	nop
 8001128:	40023800 	.word	0x40023800

0800112c <RCC_APB1PeriphClockCmd>:
 800112c:	4b04      	ldr	r3, [pc, #16]	; (8001140 <RCC_APB1PeriphClockCmd+0x14>)
 800112e:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8001130:	b109      	cbz	r1, 8001136 <RCC_APB1PeriphClockCmd+0xa>
 8001132:	4310      	orrs	r0, r2
 8001134:	e001      	b.n	800113a <RCC_APB1PeriphClockCmd+0xe>
 8001136:	ea22 0000 	bic.w	r0, r2, r0
 800113a:	6418      	str	r0, [r3, #64]	; 0x40
 800113c:	4770      	bx	lr
 800113e:	bf00      	nop
 8001140:	40023800 	.word	0x40023800

08001144 <RCC_APB2PeriphClockCmd>:
 8001144:	4b04      	ldr	r3, [pc, #16]	; (8001158 <RCC_APB2PeriphClockCmd+0x14>)
 8001146:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8001148:	b109      	cbz	r1, 800114e <RCC_APB2PeriphClockCmd+0xa>
 800114a:	4310      	orrs	r0, r2
 800114c:	e001      	b.n	8001152 <RCC_APB2PeriphClockCmd+0xe>
 800114e:	ea22 0000 	bic.w	r0, r2, r0
 8001152:	6458      	str	r0, [r3, #68]	; 0x44
 8001154:	4770      	bx	lr
 8001156:	bf00      	nop
 8001158:	40023800 	.word	0x40023800

0800115c <lib_low_level_init>:
 800115c:	b508      	push	{r3, lr}
 800115e:	f7ff fed1 	bl	8000f04 <sytem_clock_init>
 8001162:	f000 f80b 	bl	800117c <gpio_init>
 8001166:	f7ff fdb5 	bl	8000cd4 <uart_init>
 800116a:	f44f 5016 	mov.w	r0, #9600	; 0x2580
 800116e:	f7ff fe71 	bl	8000e54 <uart2_init>
 8001172:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001176:	f7ff bd0f 	b.w	8000b98 <timer_init>
	...

0800117c <gpio_init>:
 800117c:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800117e:	2001      	movs	r0, #1
 8001180:	4601      	mov	r1, r0
 8001182:	f7ff ffc7 	bl	8001114 <RCC_AHB1PeriphClockCmd>
 8001186:	2002      	movs	r0, #2
 8001188:	2101      	movs	r1, #1
 800118a:	f7ff ffc3 	bl	8001114 <RCC_AHB1PeriphClockCmd>
 800118e:	4c0c      	ldr	r4, [pc, #48]	; (80011c0 <gpio_init+0x44>)
 8001190:	2004      	movs	r0, #4
 8001192:	2101      	movs	r1, #1
 8001194:	f7ff ffbe 	bl	8001114 <RCC_AHB1PeriphClockCmd>
 8001198:	2301      	movs	r3, #1
 800119a:	2520      	movs	r5, #32
 800119c:	f88d 3004 	strb.w	r3, [sp, #4]
 80011a0:	2203      	movs	r2, #3
 80011a2:	2300      	movs	r3, #0
 80011a4:	4620      	mov	r0, r4
 80011a6:	4669      	mov	r1, sp
 80011a8:	9500      	str	r5, [sp, #0]
 80011aa:	f88d 3006 	strb.w	r3, [sp, #6]
 80011ae:	f88d 2005 	strb.w	r2, [sp, #5]
 80011b2:	f88d 3007 	strb.w	r3, [sp, #7]
 80011b6:	f000 f811 	bl	80011dc <GPIO_Init>
 80011ba:	8365      	strh	r5, [r4, #26]
 80011bc:	b003      	add	sp, #12
 80011be:	bd30      	pop	{r4, r5, pc}
 80011c0:	40020000 	.word	0x40020000

080011c4 <led_on>:
 80011c4:	4b01      	ldr	r3, [pc, #4]	; (80011cc <led_on+0x8>)
 80011c6:	b280      	uxth	r0, r0
 80011c8:	8318      	strh	r0, [r3, #24]
 80011ca:	4770      	bx	lr
 80011cc:	40020000 	.word	0x40020000

080011d0 <led_off>:
 80011d0:	4b01      	ldr	r3, [pc, #4]	; (80011d8 <led_off+0x8>)
 80011d2:	b280      	uxth	r0, r0
 80011d4:	8358      	strh	r0, [r3, #26]
 80011d6:	4770      	bx	lr
 80011d8:	40020000 	.word	0x40020000

080011dc <GPIO_Init>:
 80011dc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80011e0:	680f      	ldr	r7, [r1, #0]
 80011e2:	2300      	movs	r3, #0
 80011e4:	2201      	movs	r2, #1
 80011e6:	409a      	lsls	r2, r3
 80011e8:	ea02 0507 	and.w	r5, r2, r7
 80011ec:	4295      	cmp	r5, r2
 80011ee:	d131      	bne.n	8001254 <GPIO_Init+0x78>
 80011f0:	005a      	lsls	r2, r3, #1
 80011f2:	2403      	movs	r4, #3
 80011f4:	6806      	ldr	r6, [r0, #0]
 80011f6:	4094      	lsls	r4, r2
 80011f8:	43e4      	mvns	r4, r4
 80011fa:	4026      	ands	r6, r4
 80011fc:	6006      	str	r6, [r0, #0]
 80011fe:	790e      	ldrb	r6, [r1, #4]
 8001200:	f8d0 c000 	ldr.w	ip, [r0]
 8001204:	fa06 f802 	lsl.w	r8, r6, r2
 8001208:	3e01      	subs	r6, #1
 800120a:	b2f6      	uxtb	r6, r6
 800120c:	ea48 0c0c 	orr.w	ip, r8, ip
 8001210:	2e01      	cmp	r6, #1
 8001212:	f8c0 c000 	str.w	ip, [r0]
 8001216:	d814      	bhi.n	8001242 <GPIO_Init+0x66>
 8001218:	6886      	ldr	r6, [r0, #8]
 800121a:	f891 c005 	ldrb.w	ip, [r1, #5]
 800121e:	4026      	ands	r6, r4
 8001220:	6086      	str	r6, [r0, #8]
 8001222:	6886      	ldr	r6, [r0, #8]
 8001224:	fa0c fc02 	lsl.w	ip, ip, r2
 8001228:	ea4c 0606 	orr.w	r6, ip, r6
 800122c:	6086      	str	r6, [r0, #8]
 800122e:	6846      	ldr	r6, [r0, #4]
 8001230:	ea26 0505 	bic.w	r5, r6, r5
 8001234:	6045      	str	r5, [r0, #4]
 8001236:	798d      	ldrb	r5, [r1, #6]
 8001238:	6846      	ldr	r6, [r0, #4]
 800123a:	409d      	lsls	r5, r3
 800123c:	b2ad      	uxth	r5, r5
 800123e:	4335      	orrs	r5, r6
 8001240:	6045      	str	r5, [r0, #4]
 8001242:	68c5      	ldr	r5, [r0, #12]
 8001244:	402c      	ands	r4, r5
 8001246:	60c4      	str	r4, [r0, #12]
 8001248:	79cd      	ldrb	r5, [r1, #7]
 800124a:	68c4      	ldr	r4, [r0, #12]
 800124c:	fa05 f202 	lsl.w	r2, r5, r2
 8001250:	4322      	orrs	r2, r4
 8001252:	60c2      	str	r2, [r0, #12]
 8001254:	3301      	adds	r3, #1
 8001256:	2b10      	cmp	r3, #16
 8001258:	d1c4      	bne.n	80011e4 <GPIO_Init+0x8>
 800125a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

0800125e <GPIO_PinAFConfig>:
 800125e:	f001 0307 	and.w	r3, r1, #7
 8001262:	08c9      	lsrs	r1, r1, #3
 8001264:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8001268:	b510      	push	{r4, lr}
 800126a:	009b      	lsls	r3, r3, #2
 800126c:	6a04      	ldr	r4, [r0, #32]
 800126e:	210f      	movs	r1, #15
 8001270:	4099      	lsls	r1, r3
 8001272:	ea24 0101 	bic.w	r1, r4, r1
 8001276:	6201      	str	r1, [r0, #32]
 8001278:	6a01      	ldr	r1, [r0, #32]
 800127a:	409a      	lsls	r2, r3
 800127c:	4311      	orrs	r1, r2
 800127e:	6201      	str	r1, [r0, #32]
 8001280:	bd10      	pop	{r4, pc}
	...

08001284 <NVIC_Init>:
 8001284:	78c2      	ldrb	r2, [r0, #3]
 8001286:	7803      	ldrb	r3, [r0, #0]
 8001288:	b510      	push	{r4, lr}
 800128a:	b30a      	cbz	r2, 80012d0 <NVIC_Init+0x4c>
 800128c:	4a16      	ldr	r2, [pc, #88]	; (80012e8 <NVIC_Init+0x64>)
 800128e:	7844      	ldrb	r4, [r0, #1]
 8001290:	68d2      	ldr	r2, [r2, #12]
 8001292:	43d2      	mvns	r2, r2
 8001294:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001298:	f1c2 0104 	rsb	r1, r2, #4
 800129c:	b2c9      	uxtb	r1, r1
 800129e:	fa04 f101 	lsl.w	r1, r4, r1
 80012a2:	240f      	movs	r4, #15
 80012a4:	fa44 f202 	asr.w	r2, r4, r2
 80012a8:	7884      	ldrb	r4, [r0, #2]
 80012aa:	b2c9      	uxtb	r1, r1
 80012ac:	4022      	ands	r2, r4
 80012ae:	430a      	orrs	r2, r1
 80012b0:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 80012b4:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 80012b8:	0112      	lsls	r2, r2, #4
 80012ba:	b2d2      	uxtb	r2, r2
 80012bc:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 80012c0:	7803      	ldrb	r3, [r0, #0]
 80012c2:	2201      	movs	r2, #1
 80012c4:	0959      	lsrs	r1, r3, #5
 80012c6:	f003 031f 	and.w	r3, r3, #31
 80012ca:	fa02 f303 	lsl.w	r3, r2, r3
 80012ce:	e006      	b.n	80012de <NVIC_Init+0x5a>
 80012d0:	0959      	lsrs	r1, r3, #5
 80012d2:	2201      	movs	r2, #1
 80012d4:	f003 031f 	and.w	r3, r3, #31
 80012d8:	fa02 f303 	lsl.w	r3, r2, r3
 80012dc:	3120      	adds	r1, #32
 80012de:	4a03      	ldr	r2, [pc, #12]	; (80012ec <NVIC_Init+0x68>)
 80012e0:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 80012e4:	bd10      	pop	{r4, pc}
 80012e6:	bf00      	nop
 80012e8:	e000ed00 	.word	0xe000ed00
 80012ec:	e000e100 	.word	0xe000e100

080012f0 <_init>:
 80012f0:	e1a0c00d 	mov	ip, sp
 80012f4:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80012f8:	e24cb004 	sub	fp, ip, #4
 80012fc:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001300:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001304:	e12fff1e 	bx	lr

08001308 <_fini>:
 8001308:	e1a0c00d 	mov	ip, sp
 800130c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001310:	e24cb004 	sub	fp, ip, #4
 8001314:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001318:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 800131c:	e12fff1e 	bx	lr
 8001320:	69647473 	.word	0x69647473
 8001324:	6e69206f 	.word	0x6e69206f
 8001328:	64207469 	.word	0x64207469
 800132c:	0a656e6f 	.word	0x0a656e6f
 8001330:	00          	.byte	0x00
 8001331:	62          	.byte	0x62
 8001332:	6f6f      	.short	0x6f6f
 8001334:	676e6974 	.word	0x676e6974
 8001338:	6f726620 	.word	0x6f726620
 800133c:	7830206d 	.word	0x7830206d
 8001340:	000a7825 	.word	0x000a7825
 8001344:	432b5441 	.word	0x432b5441
 8001348:	54535049 	.word	0x54535049
 800134c:	3d545241 	.word	0x3d545241
 8001350:	50435422 	.word	0x50435422
 8001354:	25222c22 	.word	0x25222c22
 8001358:	252c2273 	.word	0x252c2273
 800135c:	000d0a75 	.word	0x000d0a75
 8001360:	41004b4f 	.word	0x41004b4f
 8001364:	49432b54 	.word	0x49432b54
 8001368:	4f4c4350 	.word	0x4f4c4350
 800136c:	0d0a4553 	.word	0x0d0a4553
 8001370:	2b544100 	.word	0x2b544100
 8001374:	53504943 	.word	0x53504943
 8001378:	3d444e45 	.word	0x3d444e45
 800137c:	0d0a7525 	.word	0x0d0a7525
 8001380:	50492b00 	.word	0x50492b00
 8001384:	003a0044 	.word	0x003a0044
 8001388:	74696e69 	.word	0x74696e69
 800138c:	696c6169 	.word	0x696c6169
 8001390:	676e697a 	.word	0x676e697a
 8001394:	66697720 	.word	0x66697720
 8001398:	41000a69 	.word	0x41000a69
 800139c:	53522b54 	.word	0x53522b54
 80013a0:	72000a54 	.word	0x72000a54
 80013a4:	74657365 	.word	0x74657365
 80013a8:	20676e69 	.word	0x20676e69
 80013ac:	69666977 	.word	0x69666977
 80013b0:	72726520 	.word	0x72726520
 80013b4:	000a726f 	.word	0x000a726f
 80013b8:	432b5441 	.word	0x432b5441
 80013bc:	444f4d57 	.word	0x444f4d57
 80013c0:	0a313d45 	.word	0x0a313d45
 80013c4:	6573000d 	.word	0x6573000d
 80013c8:	6e697474 	.word	0x6e697474
 80013cc:	69772067 	.word	0x69772067
 80013d0:	65206966 	.word	0x65206966
 80013d4:	726f7272 	.word	0x726f7272
 80013d8:	5441000a 	.word	0x5441000a
 80013dc:	4a57432b 	.word	0x4a57432b
 80013e0:	223d5041 	.word	0x223d5041
 80013e4:	2c227325 	.word	0x2c227325
 80013e8:	22732522 	.word	0x22732522
 80013ec:	64000d0a 	.word	0x64000d0a
 80013f0:	6f637369 	.word	0x6f637369
 80013f4:	63656e6e 	.word	0x63656e6e
 80013f8:	00646574 	.word	0x00646574
 80013fc:	79726576 	.word	0x79726576
 8001400:	64726168 	.word	0x64726168
 8001404:	6e6f6300 	.word	0x6e6f6300
 8001408:	7463656e 	.word	0x7463656e
 800140c:	20676e69 	.word	0x20676e69
 8001410:	22206f74 	.word	0x22206f74
 8001414:	20227325 	.word	0x20227325
 8001418:	6f727265 	.word	0x6f727265
 800141c:	73000a72 	.word	0x73000a72
 8001420:	73656375 	.word	0x73656375
 8001424:	6f632073 	.word	0x6f632073
 8001428:	63656e6e 	.word	0x63656e6e
 800142c:	20646574 	.word	0x20646574
 8001430:	22206f74 	.word	0x22206f74
 8001434:	20227325 	.word	0x20227325
 8001438:	6572000a 	.word	0x6572000a
 800143c:	73657571 	.word	0x73657571
 8001440:	65732074 	.word	0x65732074
 8001444:	6465646e 	.word	0x6465646e
 8001448:	74697720 	.word	0x74697720
 800144c:	75252068 	.word	0x75252068
 8001450:	6572000a 	.word	0x6572000a
 8001454:	76696563 	.word	0x76696563
 8001458:	64206465 	.word	0x64206465
 800145c:	20617461 	.word	0x20617461
 8001460:	3c003e3a 	.word	0x3c003e3a
 8001464:	6f73000a 	.word	0x6f73000a
 8001468:	7420656d 	.word	0x7420656d
 800146c:	20747865 	.word	0x20747865
 8001470:	73206f74 	.word	0x73206f74
 8001474:	65767265 	.word	0x65767265
 8001478:	0a72      	.short	0x0a72
 800147a:	00          	.byte	0x00
 800147b:	0a          	.byte	0x0a
 800147c:	636c6577 	.word	0x636c6577
 8001480:	20656d6f 	.word	0x20656d6f
 8001484:	53206f74 	.word	0x53206f74
 8001488:	68757a75 	.word	0x68757a75
 800148c:	20534f61 	.word	0x20534f61
 8001490:	205e5f5e 	.word	0x205e5f5e
 8001494:	2e302e32 	.word	0x2e302e32
 8001498:	55420a38 	.word	0x55420a38
 800149c:	20444c49 	.word	0x20444c49
 80014a0:	2079614d 	.word	0x2079614d
 80014a4:	32203120 	.word	0x32203120
 80014a8:	20353130 	.word	0x20353130
 80014ac:	323a3132 	.word	0x323a3132
 80014b0:	34303a36 	.word	0x34303a36
 80014b4:	616d000a 	.word	0x616d000a
 80014b8:	74206e69 	.word	0x74206e69
 80014bc:	61657268 	.word	0x61657268
 80014c0:	64692064 	.word	0x64692064
 80014c4:	202c656c 	.word	0x202c656c
 80014c8:	69747075 	.word	0x69747075
 80014cc:	2520656d 	.word	0x2520656d
 80014d0:	00000a75 	.word	0x00000a75

080014d4 <__EH_FRAME_BEGIN__>:
 80014d4:	00000000                                ....
