
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
 80001a0:	20000074 	.word	0x20000074
 80001a4:	20000014 	.word	0x20000014

080001a8 <null_thread>:
 80001a8:	b508      	push	{r3, lr}
 80001aa:	f001 fb33 	bl	8001814 <sleep>
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
 800020c:	20000014 	.word	0x20000014
 8000210:	20000074 	.word	0x20000074

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
 8000254:	20000074 	.word	0x20000074
 8000258:	20000014 	.word	0x20000014

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
 800027c:	20000074 	.word	0x20000074

08000280 <kernel_start>:
 8000280:	b508      	push	{r3, lr}
 8000282:	f001 fab5 	bl	80017f0 <sys_tick_init>
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
 80002f8:	20000014 	.word	0x20000014
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
 8000334:	20000014 	.word	0x20000014
 8000338:	20000074 	.word	0x20000074
 800033c:	080001a9 	.word	0x080001a9
 8000340:	20000078 	.word	0x20000078

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
 8000384:	20000014 	.word	0x20000014

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
 80003a8:	20000014 	.word	0x20000014

080003ac <lib_os_init>:
 80003ac:	b508      	push	{r3, lr}
 80003ae:	f7ff ffa7 	bl	8000300 <kernel_init>
 80003b2:	f000 f807 	bl	80003c4 <stdlib_init_>
 80003b6:	f000 f90b 	bl	80005d0 <messages_init>
 80003ba:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80003be:	f000 b8df 	b.w	8000580 <stdio_init>
	...

080003c4 <stdlib_init_>:
 80003c4:	b508      	push	{r3, lr}
 80003c6:	4804      	ldr	r0, [pc, #16]	; (80003d8 <stdlib_init_+0x14>)
 80003c8:	f000 f91c 	bl	8000604 <mutex_init>
 80003cc:	4b03      	ldr	r3, [pc, #12]	; (80003dc <stdlib_init_+0x18>)
 80003ce:	4a04      	ldr	r2, [pc, #16]	; (80003e0 <stdlib_init_+0x1c>)
 80003d0:	6013      	str	r3, [r2, #0]
 80003d2:	4a04      	ldr	r2, [pc, #16]	; (80003e4 <stdlib_init_+0x20>)
 80003d4:	6013      	str	r3, [r2, #0]
 80003d6:	bd08      	pop	{r3, pc}
 80003d8:	20000100 	.word	0x20000100
 80003dc:	20000630 	.word	0x20000630
 80003e0:	200000f8 	.word	0x200000f8
 80003e4:	200000fc 	.word	0x200000fc

080003e8 <putc_>:
 80003e8:	b538      	push	{r3, r4, r5, lr}
 80003ea:	4c06      	ldr	r4, [pc, #24]	; (8000404 <putc_+0x1c>)
 80003ec:	4605      	mov	r5, r0
 80003ee:	4620      	mov	r0, r4
 80003f0:	f000 f912 	bl	8000618 <mutex_lock>
 80003f4:	4628      	mov	r0, r5
 80003f6:	f001 f947 	bl	8001688 <uart_write>
 80003fa:	4620      	mov	r0, r4
 80003fc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000400:	f000 b926 	b.w	8000650 <mutex_unlock>
 8000404:	20000104 	.word	0x20000104

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
 800042c:	20000110 	.word	0x20000110

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
 800057c:	2000010c 	.word	0x2000010c

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
 80005bc:	20000104 	.word	0x20000104
 80005c0:	20000108 	.word	0x20000108
 80005c4:	20000110 	.word	0x20000110
 80005c8:	2000010c 	.word	0x2000010c
 80005cc:	08001cb0 	.word	0x08001cb0

080005d0 <messages_init>:
 80005d0:	b510      	push	{r4, lr}
 80005d2:	2200      	movs	r2, #0
 80005d4:	4909      	ldr	r1, [pc, #36]	; (80005fc <messages_init+0x2c>)
 80005d6:	2300      	movs	r3, #0
 80005d8:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 80005dc:	3201      	adds	r2, #1
 80005de:	2a08      	cmp	r2, #8
 80005e0:	d1f8      	bne.n	80005d4 <messages_init+0x4>
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
 80005fc:	20000114 	.word	0x20000114
 8000600:	20000134 	.word	0x20000134

08000604 <mutex_init>:
 8000604:	b510      	push	{r4, lr}
 8000606:	4604      	mov	r4, r0
 8000608:	f7ff fe28 	bl	800025c <sched_off>
 800060c:	2300      	movs	r3, #0
 800060e:	6023      	str	r3, [r4, #0]
 8000610:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000614:	f7ff be24 	b.w	8000260 <sched_on>

08000618 <mutex_lock>:
 8000618:	b513      	push	{r0, r1, r4, lr}
 800061a:	4604      	mov	r4, r0
 800061c:	f7ff fe1e 	bl	800025c <sched_off>
 8000620:	6823      	ldr	r3, [r4, #0]
 8000622:	9301      	str	r3, [sp, #4]
 8000624:	f7ff fe1c 	bl	8000260 <sched_on>
 8000628:	9b01      	ldr	r3, [sp, #4]
 800062a:	b10b      	cbz	r3, 8000630 <mutex_lock+0x18>
 800062c:	f7ff fe8a 	bl	8000344 <set_wait_state>
 8000630:	9b01      	ldr	r3, [sp, #4]
 8000632:	2b00      	cmp	r3, #0
 8000634:	d1f2      	bne.n	800061c <mutex_lock+0x4>
 8000636:	f7ff fe11 	bl	800025c <sched_off>
 800063a:	6823      	ldr	r3, [r4, #0]
 800063c:	9301      	str	r3, [sp, #4]
 800063e:	9b01      	ldr	r3, [sp, #4]
 8000640:	2b00      	cmp	r3, #0
 8000642:	d1eb      	bne.n	800061c <mutex_lock+0x4>
 8000644:	2301      	movs	r3, #1
 8000646:	6023      	str	r3, [r4, #0]
 8000648:	f7ff fe0a 	bl	8000260 <sched_on>
 800064c:	b002      	add	sp, #8
 800064e:	bd10      	pop	{r4, pc}

08000650 <mutex_unlock>:
 8000650:	b508      	push	{r3, lr}
 8000652:	f7ff ffd7 	bl	8000604 <mutex_init>
 8000656:	f7ff fe97 	bl	8000388 <wake_up_threads>
 800065a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800065e:	f7ff be01 	b.w	8000264 <yield>
	...

08000664 <mem_info_print>:
 8000664:	b538      	push	{r3, r4, r5, lr}
 8000666:	4c0f      	ldr	r4, [pc, #60]	; (80006a4 <mem_info_print+0x40>)
 8000668:	4d0f      	ldr	r5, [pc, #60]	; (80006a8 <mem_info_print+0x44>)
 800066a:	4810      	ldr	r0, [pc, #64]	; (80006ac <mem_info_print+0x48>)
 800066c:	4910      	ldr	r1, [pc, #64]	; (80006b0 <mem_info_print+0x4c>)
 800066e:	f7ff ff35 	bl	80004dc <printf_>
 8000672:	1b2d      	subs	r5, r5, r4
 8000674:	4621      	mov	r1, r4
 8000676:	480f      	ldr	r0, [pc, #60]	; (80006b4 <mem_info_print+0x50>)
 8000678:	f7ff ff30 	bl	80004dc <printf_>
 800067c:	4629      	mov	r1, r5
 800067e:	480e      	ldr	r0, [pc, #56]	; (80006b8 <mem_info_print+0x54>)
 8000680:	f7ff ff2c 	bl	80004dc <printf_>
 8000684:	4b0d      	ldr	r3, [pc, #52]	; (80006bc <mem_info_print+0x58>)
 8000686:	480e      	ldr	r0, [pc, #56]	; (80006c0 <mem_info_print+0x5c>)
 8000688:	1ae1      	subs	r1, r4, r3
 800068a:	4429      	add	r1, r5
 800068c:	f7ff ff26 	bl	80004dc <printf_>
 8000690:	480c      	ldr	r0, [pc, #48]	; (80006c4 <mem_info_print+0x60>)
 8000692:	490d      	ldr	r1, [pc, #52]	; (80006c8 <mem_info_print+0x64>)
 8000694:	f7ff ff22 	bl	80004dc <printf_>
 8000698:	480c      	ldr	r0, [pc, #48]	; (80006cc <mem_info_print+0x68>)
 800069a:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800069e:	f7ff bf1d 	b.w	80004dc <printf_>
 80006a2:	bf00      	nop
 80006a4:	20000000 	.word	0x20000000
 80006a8:	20020000 	.word	0x20020000
 80006ac:	08001cc1 	.word	0x08001cc1
 80006b0:	08001c80 	.word	0x08001c80
 80006b4:	08001cd2 	.word	0x08001cd2
 80006b8:	08001ce1 	.word	0x08001ce1
 80006bc:	20000630 	.word	0x20000630
 80006c0:	08001cef 	.word	0x08001cef
 80006c4:	08001cfd 	.word	0x08001cfd
 80006c8:	20000630 	.word	0x20000630
 80006cc:	08001da3 	.word	0x08001da3

080006d0 <main>:
 80006d0:	b508      	push	{r3, lr}
 80006d2:	f001 f9cd 	bl	8001a70 <lib_low_level_init>
 80006d6:	f7ff fe69 	bl	80003ac <lib_os_init>
 80006da:	f7ff ffc3 	bl	8000664 <mem_info_print>
 80006de:	4905      	ldr	r1, [pc, #20]	; (80006f4 <main+0x24>)
 80006e0:	4805      	ldr	r0, [pc, #20]	; (80006f8 <main+0x28>)
 80006e2:	f44f 7200 	mov.w	r2, #512	; 0x200
 80006e6:	2308      	movs	r3, #8
 80006e8:	f7ff fdd0 	bl	800028c <create_thread>
 80006ec:	f7ff fdc8 	bl	8000280 <kernel_start>
 80006f0:	2000      	movs	r0, #0
 80006f2:	bd08      	pop	{r3, pc}
 80006f4:	20000374 	.word	0x20000374
 80006f8:	080011a1 	.word	0x080011a1

080006fc <aeris_set_motors>:
 80006fc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000700:	4c36      	ldr	r4, [pc, #216]	; (80007dc <aeris_set_motors+0xe0>)
 8000702:	68e3      	ldr	r3, [r4, #12]
 8000704:	3364      	adds	r3, #100	; 0x64
 8000706:	bfbc      	itt	lt
 8000708:	f06f 0363 	mvnlt.w	r3, #99	; 0x63
 800070c:	60e3      	strlt	r3, [r4, #12]
 800070e:	6923      	ldr	r3, [r4, #16]
 8000710:	3364      	adds	r3, #100	; 0x64
 8000712:	b086      	sub	sp, #24
 8000714:	da03      	bge.n	800071e <aeris_set_motors+0x22>
 8000716:	4b31      	ldr	r3, [pc, #196]	; (80007dc <aeris_set_motors+0xe0>)
 8000718:	f06f 0263 	mvn.w	r2, #99	; 0x63
 800071c:	611a      	str	r2, [r3, #16]
 800071e:	68e3      	ldr	r3, [r4, #12]
 8000720:	2b64      	cmp	r3, #100	; 0x64
 8000722:	dd02      	ble.n	800072a <aeris_set_motors+0x2e>
 8000724:	4b2d      	ldr	r3, [pc, #180]	; (80007dc <aeris_set_motors+0xe0>)
 8000726:	2264      	movs	r2, #100	; 0x64
 8000728:	60da      	str	r2, [r3, #12]
 800072a:	6923      	ldr	r3, [r4, #16]
 800072c:	2b64      	cmp	r3, #100	; 0x64
 800072e:	dd02      	ble.n	8000736 <aeris_set_motors+0x3a>
 8000730:	4b2a      	ldr	r3, [pc, #168]	; (80007dc <aeris_set_motors+0xe0>)
 8000732:	2264      	movs	r2, #100	; 0x64
 8000734:	611a      	str	r2, [r3, #16]
 8000736:	6923      	ldr	r3, [r4, #16]
 8000738:	68e5      	ldr	r5, [r4, #12]
 800073a:	ea83 78e3 	eor.w	r8, r3, r3, asr #31
 800073e:	eba8 78e3 	sub.w	r8, r8, r3, asr #31
 8000742:	2d00      	cmp	r5, #0
 8000744:	da44      	bge.n	80007d0 <aeris_set_motors+0xd4>
 8000746:	4826      	ldr	r0, [pc, #152]	; (80007e0 <aeris_set_motors+0xe4>)
 8000748:	2104      	movs	r1, #4
 800074a:	426d      	negs	r5, r5
 800074c:	f001 fa4b 	bl	8001be6 <GPIO_SetBits>
 8000750:	6923      	ldr	r3, [r4, #16]
 8000752:	4823      	ldr	r0, [pc, #140]	; (80007e0 <aeris_set_motors+0xe4>)
 8000754:	2b00      	cmp	r3, #0
 8000756:	f04f 0108 	mov.w	r1, #8
 800075a:	da02      	bge.n	8000762 <aeris_set_motors+0x66>
 800075c:	f001 fa43 	bl	8001be6 <GPIO_SetBits>
 8000760:	e001      	b.n	8000766 <aeris_set_motors+0x6a>
 8000762:	f001 fa42 	bl	8001bea <GPIO_ResetBits>
 8000766:	2370      	movs	r3, #112	; 0x70
 8000768:	f8ad 3004 	strh.w	r3, [sp, #4]
 800076c:	2301      	movs	r3, #1
 800076e:	f8ad 3006 	strh.w	r3, [sp, #6]
 8000772:	2304      	movs	r3, #4
 8000774:	f8ad 3008 	strh.w	r3, [sp, #8]
 8000778:	4f1a      	ldr	r7, [pc, #104]	; (80007e4 <aeris_set_motors+0xe8>)
 800077a:	481b      	ldr	r0, [pc, #108]	; (80007e8 <aeris_set_motors+0xec>)
 800077c:	2302      	movs	r3, #2
 800077e:	f8ad 3010 	strh.w	r3, [sp, #16]
 8000782:	2300      	movs	r3, #0
 8000784:	f8ad 3012 	strh.w	r3, [sp, #18]
 8000788:	f8ad 3016 	strh.w	r3, [sp, #22]
 800078c:	683b      	ldr	r3, [r7, #0]
 800078e:	f242 7610 	movw	r6, #10000	; 0x2710
 8000792:	fbb3 f3f6 	udiv	r3, r3, r6
 8000796:	3b02      	subs	r3, #2
 8000798:	fb08 f303 	mul.w	r3, r8, r3
 800079c:	2464      	movs	r4, #100	; 0x64
 800079e:	f44f 7280 	mov.w	r2, #256	; 0x100
 80007a2:	fbb3 f3f4 	udiv	r3, r3, r4
 80007a6:	a901      	add	r1, sp, #4
 80007a8:	f8ad 2014 	strh.w	r2, [sp, #20]
 80007ac:	9303      	str	r3, [sp, #12]
 80007ae:	f000 fd4d 	bl	800124c <TIM_OC1Init>
 80007b2:	683b      	ldr	r3, [r7, #0]
 80007b4:	480c      	ldr	r0, [pc, #48]	; (80007e8 <aeris_set_motors+0xec>)
 80007b6:	fbb3 f6f6 	udiv	r6, r3, r6
 80007ba:	3e02      	subs	r6, #2
 80007bc:	4375      	muls	r5, r6
 80007be:	fbb5 f4f4 	udiv	r4, r5, r4
 80007c2:	a901      	add	r1, sp, #4
 80007c4:	9403      	str	r4, [sp, #12]
 80007c6:	f000 fd79 	bl	80012bc <TIM_OC2Init>
 80007ca:	b006      	add	sp, #24
 80007cc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80007d0:	4803      	ldr	r0, [pc, #12]	; (80007e0 <aeris_set_motors+0xe4>)
 80007d2:	2104      	movs	r1, #4
 80007d4:	f001 fa09 	bl	8001bea <GPIO_ResetBits>
 80007d8:	e7ba      	b.n	8000750 <aeris_set_motors+0x54>
 80007da:	bf00      	nop
 80007dc:	20000590 	.word	0x20000590
 80007e0:	40020800 	.word	0x40020800
 80007e4:	20000000 	.word	0x20000000
 80007e8:	40000c00 	.word	0x40000c00

080007ec <aeris_set_rgbw>:
 80007ec:	b510      	push	{r4, lr}
 80007ee:	4c14      	ldr	r4, [pc, #80]	; (8000840 <aeris_set_rgbw+0x54>)
 80007f0:	4814      	ldr	r0, [pc, #80]	; (8000844 <aeris_set_rgbw+0x58>)
 80007f2:	7d23      	ldrb	r3, [r4, #20]
 80007f4:	2110      	movs	r1, #16
 80007f6:	b113      	cbz	r3, 80007fe <aeris_set_rgbw+0x12>
 80007f8:	f001 f9f7 	bl	8001bea <GPIO_ResetBits>
 80007fc:	e001      	b.n	8000802 <aeris_set_rgbw+0x16>
 80007fe:	f001 f9f2 	bl	8001be6 <GPIO_SetBits>
 8000802:	7d63      	ldrb	r3, [r4, #21]
 8000804:	480f      	ldr	r0, [pc, #60]	; (8000844 <aeris_set_rgbw+0x58>)
 8000806:	2120      	movs	r1, #32
 8000808:	b113      	cbz	r3, 8000810 <aeris_set_rgbw+0x24>
 800080a:	f001 f9ee 	bl	8001bea <GPIO_ResetBits>
 800080e:	e001      	b.n	8000814 <aeris_set_rgbw+0x28>
 8000810:	f001 f9e9 	bl	8001be6 <GPIO_SetBits>
 8000814:	7da3      	ldrb	r3, [r4, #22]
 8000816:	480b      	ldr	r0, [pc, #44]	; (8000844 <aeris_set_rgbw+0x58>)
 8000818:	2140      	movs	r1, #64	; 0x40
 800081a:	b113      	cbz	r3, 8000822 <aeris_set_rgbw+0x36>
 800081c:	f001 f9e5 	bl	8001bea <GPIO_ResetBits>
 8000820:	e001      	b.n	8000826 <aeris_set_rgbw+0x3a>
 8000822:	f001 f9e0 	bl	8001be6 <GPIO_SetBits>
 8000826:	7de3      	ldrb	r3, [r4, #23]
 8000828:	4807      	ldr	r0, [pc, #28]	; (8000848 <aeris_set_rgbw+0x5c>)
 800082a:	2120      	movs	r1, #32
 800082c:	b11b      	cbz	r3, 8000836 <aeris_set_rgbw+0x4a>
 800082e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000832:	f001 b9d8 	b.w	8001be6 <GPIO_SetBits>
 8000836:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800083a:	f001 b9d6 	b.w	8001bea <GPIO_ResetBits>
 800083e:	bf00      	nop
 8000840:	20000590 	.word	0x20000590
 8000844:	40020400 	.word	0x40020400
 8000848:	40020800 	.word	0x40020800

0800084c <aeris_read_surface_sensor>:
 800084c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000850:	2501      	movs	r5, #1
 8000852:	4606      	mov	r6, r0
 8000854:	f000 fe7e 	bl	8001554 <i2cStart>
 8000858:	20e0      	movs	r0, #224	; 0xe0
 800085a:	f000 fe99 	bl	8001590 <i2cWrite>
 800085e:	fa05 f006 	lsl.w	r0, r5, r6
 8000862:	b2c0      	uxtb	r0, r0
 8000864:	f000 fe94 	bl	8001590 <i2cWrite>
 8000868:	f000 fe83 	bl	8001572 <i2cStop>
 800086c:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000870:	f000 fdf0 	bl	8001454 <timer_delay_loops>
 8000874:	f000 fe6e 	bl	8001554 <i2cStart>
 8000878:	2072      	movs	r0, #114	; 0x72
 800087a:	f000 fe89 	bl	8001590 <i2cWrite>
 800087e:	20b4      	movs	r0, #180	; 0xb4
 8000880:	f000 fe86 	bl	8001590 <i2cWrite>
 8000884:	f000 fe66 	bl	8001554 <i2cStart>
 8000888:	2073      	movs	r0, #115	; 0x73
 800088a:	f000 fe81 	bl	8001590 <i2cWrite>
 800088e:	4628      	mov	r0, r5
 8000890:	f000 fea6 	bl	80015e0 <i2cRead>
 8000894:	4c1e      	ldr	r4, [pc, #120]	; (8000910 <aeris_read_surface_sensor+0xc4>)
 8000896:	f106 0734 	add.w	r7, r6, #52	; 0x34
 800089a:	4680      	mov	r8, r0
 800089c:	f824 0017 	strh.w	r0, [r4, r7, lsl #1]
 80008a0:	4628      	mov	r0, r5
 80008a2:	f000 fe9d 	bl	80015e0 <i2cRead>
 80008a6:	ea48 2000 	orr.w	r0, r8, r0, lsl #8
 80008aa:	f824 0017 	strh.w	r0, [r4, r7, lsl #1]
 80008ae:	4628      	mov	r0, r5
 80008b0:	f000 fe96 	bl	80015e0 <i2cRead>
 80008b4:	f106 071c 	add.w	r7, r6, #28
 80008b8:	4680      	mov	r8, r0
 80008ba:	f824 0017 	strh.w	r0, [r4, r7, lsl #1]
 80008be:	4628      	mov	r0, r5
 80008c0:	f000 fe8e 	bl	80015e0 <i2cRead>
 80008c4:	ea48 2000 	orr.w	r0, r8, r0, lsl #8
 80008c8:	f824 0017 	strh.w	r0, [r4, r7, lsl #1]
 80008cc:	4628      	mov	r0, r5
 80008ce:	f000 fe87 	bl	80015e0 <i2cRead>
 80008d2:	f106 0724 	add.w	r7, r6, #36	; 0x24
 80008d6:	4680      	mov	r8, r0
 80008d8:	f824 0017 	strh.w	r0, [r4, r7, lsl #1]
 80008dc:	4628      	mov	r0, r5
 80008de:	f000 fe7f 	bl	80015e0 <i2cRead>
 80008e2:	ea48 2000 	orr.w	r0, r8, r0, lsl #8
 80008e6:	f824 0017 	strh.w	r0, [r4, r7, lsl #1]
 80008ea:	4628      	mov	r0, r5
 80008ec:	f000 fe78 	bl	80015e0 <i2cRead>
 80008f0:	362c      	adds	r6, #44	; 0x2c
 80008f2:	4605      	mov	r5, r0
 80008f4:	f824 0016 	strh.w	r0, [r4, r6, lsl #1]
 80008f8:	2000      	movs	r0, #0
 80008fa:	f000 fe71 	bl	80015e0 <i2cRead>
 80008fe:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000902:	f824 0016 	strh.w	r0, [r4, r6, lsl #1]
 8000906:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 800090a:	f000 be32 	b.w	8001572 <i2cStop>
 800090e:	bf00      	nop
 8000910:	20000590 	.word	0x20000590

08000914 <aeris_read_surface_sensors>:
 8000914:	b508      	push	{r3, lr}
 8000916:	2000      	movs	r0, #0
 8000918:	f7ff ff98 	bl	800084c <aeris_read_surface_sensor>
 800091c:	2001      	movs	r0, #1
 800091e:	f7ff ff95 	bl	800084c <aeris_read_surface_sensor>
 8000922:	2002      	movs	r0, #2
 8000924:	f7ff ff92 	bl	800084c <aeris_read_surface_sensor>
 8000928:	2003      	movs	r0, #3
 800092a:	f7ff ff8f 	bl	800084c <aeris_read_surface_sensor>
 800092e:	2004      	movs	r0, #4
 8000930:	f7ff ff8c 	bl	800084c <aeris_read_surface_sensor>
 8000934:	2005      	movs	r0, #5
 8000936:	f7ff ff89 	bl	800084c <aeris_read_surface_sensor>
 800093a:	2006      	movs	r0, #6
 800093c:	f7ff ff86 	bl	800084c <aeris_read_surface_sensor>
 8000940:	2007      	movs	r0, #7
 8000942:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000946:	f7ff bf81 	b.w	800084c <aeris_read_surface_sensor>
	...

0800094c <aeris_init_surface_sensor>:
 800094c:	b510      	push	{r4, lr}
 800094e:	4604      	mov	r4, r0
 8000950:	f000 fe00 	bl	8001554 <i2cStart>
 8000954:	20e0      	movs	r0, #224	; 0xe0
 8000956:	f000 fe1b 	bl	8001590 <i2cWrite>
 800095a:	2001      	movs	r0, #1
 800095c:	40a0      	lsls	r0, r4
 800095e:	b2c0      	uxtb	r0, r0
 8000960:	f000 fe16 	bl	8001590 <i2cWrite>
 8000964:	f000 fe05 	bl	8001572 <i2cStop>
 8000968:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 800096c:	f000 fd72 	bl	8001454 <timer_delay_loops>
 8000970:	2072      	movs	r0, #114	; 0x72
 8000972:	2181      	movs	r1, #129	; 0x81
 8000974:	22ff      	movs	r2, #255	; 0xff
 8000976:	f000 fe5b 	bl	8001630 <i2c_write_reg>
 800097a:	2072      	movs	r0, #114	; 0x72
 800097c:	2183      	movs	r1, #131	; 0x83
 800097e:	22ff      	movs	r2, #255	; 0xff
 8000980:	f000 fe56 	bl	8001630 <i2c_write_reg>
 8000984:	2072      	movs	r0, #114	; 0x72
 8000986:	218d      	movs	r1, #141	; 0x8d
 8000988:	2200      	movs	r2, #0
 800098a:	f000 fe51 	bl	8001630 <i2c_write_reg>
 800098e:	2072      	movs	r0, #114	; 0x72
 8000990:	2180      	movs	r1, #128	; 0x80
 8000992:	2203      	movs	r2, #3
 8000994:	f000 fe4c 	bl	8001630 <i2c_write_reg>
 8000998:	218f      	movs	r1, #143	; 0x8f
 800099a:	2203      	movs	r2, #3
 800099c:	2072      	movs	r0, #114	; 0x72
 800099e:	f000 fe47 	bl	8001630 <i2c_write_reg>
 80009a2:	4620      	mov	r0, r4
 80009a4:	f7ff ff52 	bl	800084c <aeris_read_surface_sensor>
 80009a8:	3434      	adds	r4, #52	; 0x34
 80009aa:	4b04      	ldr	r3, [pc, #16]	; (80009bc <aeris_init_surface_sensor+0x70>)
 80009ac:	f833 0014 	ldrh.w	r0, [r3, r4, lsl #1]
 80009b0:	f64f 73ff 	movw	r3, #65535	; 0xffff
 80009b4:	1ac3      	subs	r3, r0, r3
 80009b6:	4258      	negs	r0, r3
 80009b8:	4158      	adcs	r0, r3
 80009ba:	bd10      	pop	{r4, pc}
 80009bc:	20000590 	.word	0x20000590

080009c0 <aeris_init>:
 80009c0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80009c4:	4bab      	ldr	r3, [pc, #684]	; (8000c74 <aeris_init+0x2b4>)
 80009c6:	2200      	movs	r2, #0
 80009c8:	2101      	movs	r1, #1
 80009ca:	7519      	strb	r1, [r3, #20]
 80009cc:	b089      	sub	sp, #36	; 0x24
 80009ce:	601a      	str	r2, [r3, #0]
 80009d0:	60da      	str	r2, [r3, #12]
 80009d2:	611a      	str	r2, [r3, #16]
 80009d4:	755a      	strb	r2, [r3, #21]
 80009d6:	759a      	strb	r2, [r3, #22]
 80009d8:	75da      	strb	r2, [r3, #23]
 80009da:	831a      	strh	r2, [r3, #24]
 80009dc:	835a      	strh	r2, [r3, #26]
 80009de:	839a      	strh	r2, [r3, #28]
 80009e0:	83da      	strh	r2, [r3, #30]
 80009e2:	841a      	strh	r2, [r3, #32]
 80009e4:	845a      	strh	r2, [r3, #34]	; 0x22
 80009e6:	849a      	strh	r2, [r3, #36]	; 0x24
 80009e8:	84da      	strh	r2, [r3, #38]	; 0x26
 80009ea:	851a      	strh	r2, [r3, #40]	; 0x28
 80009ec:	855a      	strh	r2, [r3, #42]	; 0x2a
 80009ee:	859a      	strh	r2, [r3, #44]	; 0x2c
 80009f0:	85da      	strh	r2, [r3, #46]	; 0x2e
 80009f2:	861a      	strh	r2, [r3, #48]	; 0x30
 80009f4:	865a      	strh	r2, [r3, #50]	; 0x32
 80009f6:	869a      	strh	r2, [r3, #52]	; 0x34
 80009f8:	86da      	strh	r2, [r3, #54]	; 0x36
 80009fa:	2508      	movs	r5, #8
 80009fc:	4619      	mov	r1, r3
 80009fe:	2200      	movs	r2, #0
 8000a00:	3d01      	subs	r5, #1
 8000a02:	871a      	strh	r2, [r3, #56]	; 0x38
 8000a04:	f8a3 2048 	strh.w	r2, [r3, #72]	; 0x48
 8000a08:	f8a3 2058 	strh.w	r2, [r3, #88]	; 0x58
 8000a0c:	f8a3 2068 	strh.w	r2, [r3, #104]	; 0x68
 8000a10:	4614      	mov	r4, r2
 8000a12:	f103 0302 	add.w	r3, r3, #2
 8000a16:	d1f2      	bne.n	80009fe <aeris_init+0x3e>
 8000a18:	f881 2078 	strb.w	r2, [r1, #120]	; 0x78
 8000a1c:	2008      	movs	r0, #8
 8000a1e:	2101      	movs	r1, #1
 8000a20:	f001 f80e 	bl	8001a40 <RCC_APB1PeriphClockCmd>
 8000a24:	2601      	movs	r6, #1
 8000a26:	2702      	movs	r7, #2
 8000a28:	f04f 0903 	mov.w	r9, #3
 8000a2c:	4892      	ldr	r0, [pc, #584]	; (8000c78 <aeris_init+0x2b8>)
 8000a2e:	9703      	str	r7, [sp, #12]
 8000a30:	a903      	add	r1, sp, #12
 8000a32:	f88d 6010 	strb.w	r6, [sp, #16]
 8000a36:	f88d 4012 	strb.w	r4, [sp, #18]
 8000a3a:	f88d 9011 	strb.w	r9, [sp, #17]
 8000a3e:	f88d 4013 	strb.w	r4, [sp, #19]
 8000a42:	f001 f88f 	bl	8001b64 <GPIO_Init>
 8000a46:	488c      	ldr	r0, [pc, #560]	; (8000c78 <aeris_init+0x2b8>)
 8000a48:	f8df a228 	ldr.w	sl, [pc, #552]	; 8000c74 <aeris_init+0x2b4>
 8000a4c:	4639      	mov	r1, r7
 8000a4e:	f001 f8ca 	bl	8001be6 <GPIO_SetBits>
 8000a52:	2304      	movs	r3, #4
 8000a54:	4888      	ldr	r0, [pc, #544]	; (8000c78 <aeris_init+0x2b8>)
 8000a56:	9303      	str	r3, [sp, #12]
 8000a58:	a903      	add	r1, sp, #12
 8000a5a:	f88d 6010 	strb.w	r6, [sp, #16]
 8000a5e:	f88d 4012 	strb.w	r4, [sp, #18]
 8000a62:	f88d 9011 	strb.w	r9, [sp, #17]
 8000a66:	f88d 4013 	strb.w	r4, [sp, #19]
 8000a6a:	f001 f87b 	bl	8001b64 <GPIO_Init>
 8000a6e:	4882      	ldr	r0, [pc, #520]	; (8000c78 <aeris_init+0x2b8>)
 8000a70:	2104      	movs	r1, #4
 8000a72:	f001 f8ba 	bl	8001bea <GPIO_ResetBits>
 8000a76:	f04f 0808 	mov.w	r8, #8
 8000a7a:	487f      	ldr	r0, [pc, #508]	; (8000c78 <aeris_init+0x2b8>)
 8000a7c:	f8cd 800c 	str.w	r8, [sp, #12]
 8000a80:	a903      	add	r1, sp, #12
 8000a82:	f88d 6010 	strb.w	r6, [sp, #16]
 8000a86:	f88d 4012 	strb.w	r4, [sp, #18]
 8000a8a:	f88d 9011 	strb.w	r9, [sp, #17]
 8000a8e:	f88d 4013 	strb.w	r4, [sp, #19]
 8000a92:	f001 f867 	bl	8001b64 <GPIO_Init>
 8000a96:	4641      	mov	r1, r8
 8000a98:	4877      	ldr	r0, [pc, #476]	; (8000c78 <aeris_init+0x2b8>)
 8000a9a:	f001 f8a6 	bl	8001bea <GPIO_ResetBits>
 8000a9e:	4877      	ldr	r0, [pc, #476]	; (8000c7c <aeris_init+0x2bc>)
 8000aa0:	f8cd 900c 	str.w	r9, [sp, #12]
 8000aa4:	a903      	add	r1, sp, #12
 8000aa6:	f88d 7010 	strb.w	r7, [sp, #16]
 8000aaa:	f88d 7011 	strb.w	r7, [sp, #17]
 8000aae:	f001 f859 	bl	8001b64 <GPIO_Init>
 8000ab2:	4872      	ldr	r0, [pc, #456]	; (8000c7c <aeris_init+0x2bc>)
 8000ab4:	4629      	mov	r1, r5
 8000ab6:	463a      	mov	r2, r7
 8000ab8:	f001 f899 	bl	8001bee <GPIO_PinAFConfig>
 8000abc:	463a      	mov	r2, r7
 8000abe:	486f      	ldr	r0, [pc, #444]	; (8000c7c <aeris_init+0x2bc>)
 8000ac0:	4631      	mov	r1, r6
 8000ac2:	f001 f894 	bl	8001bee <GPIO_PinAFConfig>
 8000ac6:	4b6e      	ldr	r3, [pc, #440]	; (8000c80 <aeris_init+0x2c0>)
 8000ac8:	486e      	ldr	r0, [pc, #440]	; (8000c84 <aeris_init+0x2c4>)
 8000aca:	681b      	ldr	r3, [r3, #0]
 8000acc:	f8ad 5014 	strh.w	r5, [sp, #20]
 8000ad0:	f242 7b10 	movw	fp, #10000	; 0x2710
 8000ad4:	fbb3 f3fb 	udiv	r3, r3, fp
 8000ad8:	3b01      	subs	r3, #1
 8000ada:	a905      	add	r1, sp, #20
 8000adc:	9306      	str	r3, [sp, #24]
 8000ade:	f8ad 5016 	strh.w	r5, [sp, #22]
 8000ae2:	f8ad 501c 	strh.w	r5, [sp, #28]
 8000ae6:	f88d 401e 	strb.w	r4, [sp, #30]
 8000aea:	f000 fb65 	bl	80011b8 <TIM_TimeBaseInit>
 8000aee:	f7ff fe05 	bl	80006fc <aeris_set_motors>
 8000af2:	4864      	ldr	r0, [pc, #400]	; (8000c84 <aeris_init+0x2c4>)
 8000af4:	4631      	mov	r1, r6
 8000af6:	f000 fb9d 	bl	8001234 <TIM_Cmd>
 8000afa:	4862      	ldr	r0, [pc, #392]	; (8000c84 <aeris_init+0x2c4>)
 8000afc:	4631      	mov	r1, r6
 8000afe:	f000 fc21 	bl	8001344 <TIM_CtrlPWMOutputs>
 8000b02:	f7ff fdfb 	bl	80006fc <aeris_set_motors>
 8000b06:	2370      	movs	r3, #112	; 0x70
 8000b08:	485f      	ldr	r0, [pc, #380]	; (8000c88 <aeris_init+0x2c8>)
 8000b0a:	9303      	str	r3, [sp, #12]
 8000b0c:	a903      	add	r1, sp, #12
 8000b0e:	f88d 6010 	strb.w	r6, [sp, #16]
 8000b12:	f88d 4012 	strb.w	r4, [sp, #18]
 8000b16:	f88d 9011 	strb.w	r9, [sp, #17]
 8000b1a:	f88d 4013 	strb.w	r4, [sp, #19]
 8000b1e:	f04f 0820 	mov.w	r8, #32
 8000b22:	f001 f81f 	bl	8001b64 <GPIO_Init>
 8000b26:	4854      	ldr	r0, [pc, #336]	; (8000c78 <aeris_init+0x2b8>)
 8000b28:	f8cd 800c 	str.w	r8, [sp, #12]
 8000b2c:	a903      	add	r1, sp, #12
 8000b2e:	f88d 6010 	strb.w	r6, [sp, #16]
 8000b32:	f88d 4012 	strb.w	r4, [sp, #18]
 8000b36:	f88d 9011 	strb.w	r9, [sp, #17]
 8000b3a:	f88d 4013 	strb.w	r4, [sp, #19]
 8000b3e:	f001 f811 	bl	8001b64 <GPIO_Init>
 8000b42:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8000b46:	4850      	ldr	r0, [pc, #320]	; (8000c88 <aeris_init+0x2c8>)
 8000b48:	9303      	str	r3, [sp, #12]
 8000b4a:	a903      	add	r1, sp, #12
 8000b4c:	f88d 4010 	strb.w	r4, [sp, #16]
 8000b50:	f88d 7011 	strb.w	r7, [sp, #17]
 8000b54:	f88d 6013 	strb.w	r6, [sp, #19]
 8000b58:	f001 f804 	bl	8001b64 <GPIO_Init>
 8000b5c:	f7ff fe46 	bl	80007ec <aeris_set_rgbw>
 8000b60:	f000 fab0 	bl	80010c4 <lsm9ds0_init>
 8000b64:	9001      	str	r0, [sp, #4]
 8000b66:	b380      	cbz	r0, 8000bca <aeris_init+0x20a>
 8000b68:	229d      	movs	r2, #157	; 0x9d
 8000b6a:	4848      	ldr	r0, [pc, #288]	; (8000c8c <aeris_init+0x2cc>)
 8000b6c:	4948      	ldr	r1, [pc, #288]	; (8000c90 <aeris_init+0x2d0>)
 8000b6e:	f7ff fcb5 	bl	80004dc <printf_>
 8000b72:	f7ff fb73 	bl	800025c <sched_off>
 8000b76:	4844      	ldr	r0, [pc, #272]	; (8000c88 <aeris_init+0x2c8>)
 8000b78:	2110      	movs	r1, #16
 8000b7a:	f001 f834 	bl	8001be6 <GPIO_SetBits>
 8000b7e:	4842      	ldr	r0, [pc, #264]	; (8000c88 <aeris_init+0x2c8>)
 8000b80:	4641      	mov	r1, r8
 8000b82:	f001 f830 	bl	8001be6 <GPIO_SetBits>
 8000b86:	4840      	ldr	r0, [pc, #256]	; (8000c88 <aeris_init+0x2c8>)
 8000b88:	2140      	movs	r1, #64	; 0x40
 8000b8a:	f001 f82c 	bl	8001be6 <GPIO_SetBits>
 8000b8e:	9b01      	ldr	r3, [sp, #4]
 8000b90:	429d      	cmp	r5, r3
 8000b92:	d210      	bcs.n	8000bb6 <aeris_init+0x1f6>
 8000b94:	2110      	movs	r1, #16
 8000b96:	483c      	ldr	r0, [pc, #240]	; (8000c88 <aeris_init+0x2c8>)
 8000b98:	f001 f827 	bl	8001bea <GPIO_ResetBits>
 8000b9c:	f242 7010 	movw	r0, #10000	; 0x2710
 8000ba0:	f000 fc58 	bl	8001454 <timer_delay_loops>
 8000ba4:	4838      	ldr	r0, [pc, #224]	; (8000c88 <aeris_init+0x2c8>)
 8000ba6:	2110      	movs	r1, #16
 8000ba8:	f001 f81d 	bl	8001be6 <GPIO_SetBits>
 8000bac:	4839      	ldr	r0, [pc, #228]	; (8000c94 <aeris_init+0x2d4>)
 8000bae:	f000 fc51 	bl	8001454 <timer_delay_loops>
 8000bb2:	3501      	adds	r5, #1
 8000bb4:	e7eb      	b.n	8000b8e <aeris_init+0x1ce>
 8000bb6:	4838      	ldr	r0, [pc, #224]	; (8000c98 <aeris_init+0x2d8>)
 8000bb8:	f000 fc4c 	bl	8001454 <timer_delay_loops>
 8000bbc:	4833      	ldr	r0, [pc, #204]	; (8000c8c <aeris_init+0x2cc>)
 8000bbe:	4934      	ldr	r1, [pc, #208]	; (8000c90 <aeris_init+0x2d0>)
 8000bc0:	229d      	movs	r2, #157	; 0x9d
 8000bc2:	f7ff fc8b 	bl	80004dc <printf_>
 8000bc6:	2500      	movs	r5, #0
 8000bc8:	e7e1      	b.n	8000b8e <aeris_init+0x1ce>
 8000bca:	f88a 6017 	strb.w	r6, [sl, #23]
 8000bce:	f7ff fe0d 	bl	80007ec <aeris_set_rgbw>
 8000bd2:	482d      	ldr	r0, [pc, #180]	; (8000c88 <aeris_init+0x2c8>)
 8000bd4:	9703      	str	r7, [sp, #12]
 8000bd6:	a903      	add	r1, sp, #12
 8000bd8:	f88d 6010 	strb.w	r6, [sp, #16]
 8000bdc:	f88d 4012 	strb.w	r4, [sp, #18]
 8000be0:	f88d 9011 	strb.w	r9, [sp, #17]
 8000be4:	f88d 4013 	strb.w	r4, [sp, #19]
 8000be8:	f000 ffbc 	bl	8001b64 <GPIO_Init>
 8000bec:	4639      	mov	r1, r7
 8000bee:	4826      	ldr	r0, [pc, #152]	; (8000c88 <aeris_init+0x2c8>)
 8000bf0:	f000 fffb 	bl	8001bea <GPIO_ResetBits>
 8000bf4:	4658      	mov	r0, fp
 8000bf6:	f000 fc2d 	bl	8001454 <timer_delay_loops>
 8000bfa:	4823      	ldr	r0, [pc, #140]	; (8000c88 <aeris_init+0x2c8>)
 8000bfc:	4639      	mov	r1, r7
 8000bfe:	f000 fff2 	bl	8001be6 <GPIO_SetBits>
 8000c02:	4658      	mov	r0, fp
 8000c04:	f000 fc26 	bl	8001454 <timer_delay_loops>
 8000c08:	4628      	mov	r0, r5
 8000c0a:	f7ff fe9f 	bl	800094c <aeris_init_surface_sensor>
 8000c0e:	2800      	cmp	r0, #0
 8000c10:	d044      	beq.n	8000c9c <aeris_init+0x2dc>
 8000c12:	22b4      	movs	r2, #180	; 0xb4
 8000c14:	481d      	ldr	r0, [pc, #116]	; (8000c8c <aeris_init+0x2cc>)
 8000c16:	491e      	ldr	r1, [pc, #120]	; (8000c90 <aeris_init+0x2d0>)
 8000c18:	f7ff fc60 	bl	80004dc <printf_>
 8000c1c:	f7ff fb1e 	bl	800025c <sched_off>
 8000c20:	4819      	ldr	r0, [pc, #100]	; (8000c88 <aeris_init+0x2c8>)
 8000c22:	2110      	movs	r1, #16
 8000c24:	f000 ffdf 	bl	8001be6 <GPIO_SetBits>
 8000c28:	4817      	ldr	r0, [pc, #92]	; (8000c88 <aeris_init+0x2c8>)
 8000c2a:	4641      	mov	r1, r8
 8000c2c:	f000 ffdb 	bl	8001be6 <GPIO_SetBits>
 8000c30:	4815      	ldr	r0, [pc, #84]	; (8000c88 <aeris_init+0x2c8>)
 8000c32:	2140      	movs	r1, #64	; 0x40
 8000c34:	f000 ffd7 	bl	8001be6 <GPIO_SetBits>
 8000c38:	2d09      	cmp	r5, #9
 8000c3a:	d810      	bhi.n	8000c5e <aeris_init+0x29e>
 8000c3c:	2110      	movs	r1, #16
 8000c3e:	4812      	ldr	r0, [pc, #72]	; (8000c88 <aeris_init+0x2c8>)
 8000c40:	f000 ffd3 	bl	8001bea <GPIO_ResetBits>
 8000c44:	f242 7010 	movw	r0, #10000	; 0x2710
 8000c48:	f000 fc04 	bl	8001454 <timer_delay_loops>
 8000c4c:	480e      	ldr	r0, [pc, #56]	; (8000c88 <aeris_init+0x2c8>)
 8000c4e:	2110      	movs	r1, #16
 8000c50:	f000 ffc9 	bl	8001be6 <GPIO_SetBits>
 8000c54:	480f      	ldr	r0, [pc, #60]	; (8000c94 <aeris_init+0x2d4>)
 8000c56:	f000 fbfd 	bl	8001454 <timer_delay_loops>
 8000c5a:	3501      	adds	r5, #1
 8000c5c:	e7ec      	b.n	8000c38 <aeris_init+0x278>
 8000c5e:	480e      	ldr	r0, [pc, #56]	; (8000c98 <aeris_init+0x2d8>)
 8000c60:	f000 fbf8 	bl	8001454 <timer_delay_loops>
 8000c64:	4809      	ldr	r0, [pc, #36]	; (8000c8c <aeris_init+0x2cc>)
 8000c66:	490a      	ldr	r1, [pc, #40]	; (8000c90 <aeris_init+0x2d0>)
 8000c68:	22b4      	movs	r2, #180	; 0xb4
 8000c6a:	f7ff fc37 	bl	80004dc <printf_>
 8000c6e:	2500      	movs	r5, #0
 8000c70:	e7e4      	b.n	8000c3c <aeris_init+0x27c>
 8000c72:	bf00      	nop
 8000c74:	20000590 	.word	0x20000590
 8000c78:	40020800 	.word	0x40020800
 8000c7c:	40020000 	.word	0x40020000
 8000c80:	20000000 	.word	0x20000000
 8000c84:	40000c00 	.word	0x40000c00
 8000c88:	40020400 	.word	0x40020400
 8000c8c:	08001d0d 	.word	0x08001d0d
 8000c90:	08001d20 	.word	0x08001d20
 8000c94:	001e8480 	.word	0x001e8480
 8000c98:	00989680 	.word	0x00989680
 8000c9c:	4630      	mov	r0, r6
 8000c9e:	f7ff fe55 	bl	800094c <aeris_init_surface_sensor>
 8000ca2:	b378      	cbz	r0, 8000d04 <aeris_init+0x344>
 8000ca4:	22b7      	movs	r2, #183	; 0xb7
 8000ca6:	4889      	ldr	r0, [pc, #548]	; (8000ecc <aeris_init+0x50c>)
 8000ca8:	4989      	ldr	r1, [pc, #548]	; (8000ed0 <aeris_init+0x510>)
 8000caa:	f7ff fc17 	bl	80004dc <printf_>
 8000cae:	f7ff fad5 	bl	800025c <sched_off>
 8000cb2:	4888      	ldr	r0, [pc, #544]	; (8000ed4 <aeris_init+0x514>)
 8000cb4:	2110      	movs	r1, #16
 8000cb6:	f000 ff96 	bl	8001be6 <GPIO_SetBits>
 8000cba:	4886      	ldr	r0, [pc, #536]	; (8000ed4 <aeris_init+0x514>)
 8000cbc:	4641      	mov	r1, r8
 8000cbe:	f000 ff92 	bl	8001be6 <GPIO_SetBits>
 8000cc2:	4884      	ldr	r0, [pc, #528]	; (8000ed4 <aeris_init+0x514>)
 8000cc4:	2140      	movs	r1, #64	; 0x40
 8000cc6:	f000 ff8e 	bl	8001be6 <GPIO_SetBits>
 8000cca:	2d09      	cmp	r5, #9
 8000ccc:	d810      	bhi.n	8000cf0 <aeris_init+0x330>
 8000cce:	2110      	movs	r1, #16
 8000cd0:	4880      	ldr	r0, [pc, #512]	; (8000ed4 <aeris_init+0x514>)
 8000cd2:	f000 ff8a 	bl	8001bea <GPIO_ResetBits>
 8000cd6:	f242 7010 	movw	r0, #10000	; 0x2710
 8000cda:	f000 fbbb 	bl	8001454 <timer_delay_loops>
 8000cde:	487d      	ldr	r0, [pc, #500]	; (8000ed4 <aeris_init+0x514>)
 8000ce0:	2110      	movs	r1, #16
 8000ce2:	f000 ff80 	bl	8001be6 <GPIO_SetBits>
 8000ce6:	487c      	ldr	r0, [pc, #496]	; (8000ed8 <aeris_init+0x518>)
 8000ce8:	f000 fbb4 	bl	8001454 <timer_delay_loops>
 8000cec:	3501      	adds	r5, #1
 8000cee:	e7ec      	b.n	8000cca <aeris_init+0x30a>
 8000cf0:	487a      	ldr	r0, [pc, #488]	; (8000edc <aeris_init+0x51c>)
 8000cf2:	f000 fbaf 	bl	8001454 <timer_delay_loops>
 8000cf6:	4875      	ldr	r0, [pc, #468]	; (8000ecc <aeris_init+0x50c>)
 8000cf8:	4975      	ldr	r1, [pc, #468]	; (8000ed0 <aeris_init+0x510>)
 8000cfa:	22b7      	movs	r2, #183	; 0xb7
 8000cfc:	f7ff fbee 	bl	80004dc <printf_>
 8000d00:	2500      	movs	r5, #0
 8000d02:	e7e4      	b.n	8000cce <aeris_init+0x30e>
 8000d04:	4638      	mov	r0, r7
 8000d06:	f7ff fe21 	bl	800094c <aeris_init_surface_sensor>
 8000d0a:	b378      	cbz	r0, 8000d6c <aeris_init+0x3ac>
 8000d0c:	22ba      	movs	r2, #186	; 0xba
 8000d0e:	486f      	ldr	r0, [pc, #444]	; (8000ecc <aeris_init+0x50c>)
 8000d10:	496f      	ldr	r1, [pc, #444]	; (8000ed0 <aeris_init+0x510>)
 8000d12:	f7ff fbe3 	bl	80004dc <printf_>
 8000d16:	f7ff faa1 	bl	800025c <sched_off>
 8000d1a:	486e      	ldr	r0, [pc, #440]	; (8000ed4 <aeris_init+0x514>)
 8000d1c:	2110      	movs	r1, #16
 8000d1e:	f000 ff62 	bl	8001be6 <GPIO_SetBits>
 8000d22:	486c      	ldr	r0, [pc, #432]	; (8000ed4 <aeris_init+0x514>)
 8000d24:	4641      	mov	r1, r8
 8000d26:	f000 ff5e 	bl	8001be6 <GPIO_SetBits>
 8000d2a:	486a      	ldr	r0, [pc, #424]	; (8000ed4 <aeris_init+0x514>)
 8000d2c:	2140      	movs	r1, #64	; 0x40
 8000d2e:	f000 ff5a 	bl	8001be6 <GPIO_SetBits>
 8000d32:	2d09      	cmp	r5, #9
 8000d34:	d810      	bhi.n	8000d58 <aeris_init+0x398>
 8000d36:	2110      	movs	r1, #16
 8000d38:	4866      	ldr	r0, [pc, #408]	; (8000ed4 <aeris_init+0x514>)
 8000d3a:	f000 ff56 	bl	8001bea <GPIO_ResetBits>
 8000d3e:	f242 7010 	movw	r0, #10000	; 0x2710
 8000d42:	f000 fb87 	bl	8001454 <timer_delay_loops>
 8000d46:	4863      	ldr	r0, [pc, #396]	; (8000ed4 <aeris_init+0x514>)
 8000d48:	2110      	movs	r1, #16
 8000d4a:	f000 ff4c 	bl	8001be6 <GPIO_SetBits>
 8000d4e:	4862      	ldr	r0, [pc, #392]	; (8000ed8 <aeris_init+0x518>)
 8000d50:	f000 fb80 	bl	8001454 <timer_delay_loops>
 8000d54:	3501      	adds	r5, #1
 8000d56:	e7ec      	b.n	8000d32 <aeris_init+0x372>
 8000d58:	4860      	ldr	r0, [pc, #384]	; (8000edc <aeris_init+0x51c>)
 8000d5a:	f000 fb7b 	bl	8001454 <timer_delay_loops>
 8000d5e:	485b      	ldr	r0, [pc, #364]	; (8000ecc <aeris_init+0x50c>)
 8000d60:	495b      	ldr	r1, [pc, #364]	; (8000ed0 <aeris_init+0x510>)
 8000d62:	22ba      	movs	r2, #186	; 0xba
 8000d64:	f7ff fbba 	bl	80004dc <printf_>
 8000d68:	2500      	movs	r5, #0
 8000d6a:	e7e4      	b.n	8000d36 <aeris_init+0x376>
 8000d6c:	4648      	mov	r0, r9
 8000d6e:	f7ff fded 	bl	800094c <aeris_init_surface_sensor>
 8000d72:	b378      	cbz	r0, 8000dd4 <aeris_init+0x414>
 8000d74:	22bd      	movs	r2, #189	; 0xbd
 8000d76:	4855      	ldr	r0, [pc, #340]	; (8000ecc <aeris_init+0x50c>)
 8000d78:	4955      	ldr	r1, [pc, #340]	; (8000ed0 <aeris_init+0x510>)
 8000d7a:	f7ff fbaf 	bl	80004dc <printf_>
 8000d7e:	f7ff fa6d 	bl	800025c <sched_off>
 8000d82:	4854      	ldr	r0, [pc, #336]	; (8000ed4 <aeris_init+0x514>)
 8000d84:	2110      	movs	r1, #16
 8000d86:	f000 ff2e 	bl	8001be6 <GPIO_SetBits>
 8000d8a:	4852      	ldr	r0, [pc, #328]	; (8000ed4 <aeris_init+0x514>)
 8000d8c:	4641      	mov	r1, r8
 8000d8e:	f000 ff2a 	bl	8001be6 <GPIO_SetBits>
 8000d92:	4850      	ldr	r0, [pc, #320]	; (8000ed4 <aeris_init+0x514>)
 8000d94:	2140      	movs	r1, #64	; 0x40
 8000d96:	f000 ff26 	bl	8001be6 <GPIO_SetBits>
 8000d9a:	2d09      	cmp	r5, #9
 8000d9c:	d810      	bhi.n	8000dc0 <aeris_init+0x400>
 8000d9e:	2110      	movs	r1, #16
 8000da0:	484c      	ldr	r0, [pc, #304]	; (8000ed4 <aeris_init+0x514>)
 8000da2:	f000 ff22 	bl	8001bea <GPIO_ResetBits>
 8000da6:	f242 7010 	movw	r0, #10000	; 0x2710
 8000daa:	f000 fb53 	bl	8001454 <timer_delay_loops>
 8000dae:	4849      	ldr	r0, [pc, #292]	; (8000ed4 <aeris_init+0x514>)
 8000db0:	2110      	movs	r1, #16
 8000db2:	f000 ff18 	bl	8001be6 <GPIO_SetBits>
 8000db6:	4848      	ldr	r0, [pc, #288]	; (8000ed8 <aeris_init+0x518>)
 8000db8:	f000 fb4c 	bl	8001454 <timer_delay_loops>
 8000dbc:	3501      	adds	r5, #1
 8000dbe:	e7ec      	b.n	8000d9a <aeris_init+0x3da>
 8000dc0:	4846      	ldr	r0, [pc, #280]	; (8000edc <aeris_init+0x51c>)
 8000dc2:	f000 fb47 	bl	8001454 <timer_delay_loops>
 8000dc6:	4841      	ldr	r0, [pc, #260]	; (8000ecc <aeris_init+0x50c>)
 8000dc8:	4941      	ldr	r1, [pc, #260]	; (8000ed0 <aeris_init+0x510>)
 8000dca:	22bd      	movs	r2, #189	; 0xbd
 8000dcc:	f7ff fb86 	bl	80004dc <printf_>
 8000dd0:	2500      	movs	r5, #0
 8000dd2:	e7e4      	b.n	8000d9e <aeris_init+0x3de>
 8000dd4:	2004      	movs	r0, #4
 8000dd6:	f7ff fdb9 	bl	800094c <aeris_init_surface_sensor>
 8000dda:	b378      	cbz	r0, 8000e3c <aeris_init+0x47c>
 8000ddc:	22c0      	movs	r2, #192	; 0xc0
 8000dde:	483b      	ldr	r0, [pc, #236]	; (8000ecc <aeris_init+0x50c>)
 8000de0:	493b      	ldr	r1, [pc, #236]	; (8000ed0 <aeris_init+0x510>)
 8000de2:	f7ff fb7b 	bl	80004dc <printf_>
 8000de6:	f7ff fa39 	bl	800025c <sched_off>
 8000dea:	483a      	ldr	r0, [pc, #232]	; (8000ed4 <aeris_init+0x514>)
 8000dec:	2110      	movs	r1, #16
 8000dee:	f000 fefa 	bl	8001be6 <GPIO_SetBits>
 8000df2:	4838      	ldr	r0, [pc, #224]	; (8000ed4 <aeris_init+0x514>)
 8000df4:	4641      	mov	r1, r8
 8000df6:	f000 fef6 	bl	8001be6 <GPIO_SetBits>
 8000dfa:	4836      	ldr	r0, [pc, #216]	; (8000ed4 <aeris_init+0x514>)
 8000dfc:	2140      	movs	r1, #64	; 0x40
 8000dfe:	f000 fef2 	bl	8001be6 <GPIO_SetBits>
 8000e02:	2d09      	cmp	r5, #9
 8000e04:	d810      	bhi.n	8000e28 <aeris_init+0x468>
 8000e06:	2110      	movs	r1, #16
 8000e08:	4832      	ldr	r0, [pc, #200]	; (8000ed4 <aeris_init+0x514>)
 8000e0a:	f000 feee 	bl	8001bea <GPIO_ResetBits>
 8000e0e:	f242 7010 	movw	r0, #10000	; 0x2710
 8000e12:	f000 fb1f 	bl	8001454 <timer_delay_loops>
 8000e16:	482f      	ldr	r0, [pc, #188]	; (8000ed4 <aeris_init+0x514>)
 8000e18:	2110      	movs	r1, #16
 8000e1a:	f000 fee4 	bl	8001be6 <GPIO_SetBits>
 8000e1e:	482e      	ldr	r0, [pc, #184]	; (8000ed8 <aeris_init+0x518>)
 8000e20:	f000 fb18 	bl	8001454 <timer_delay_loops>
 8000e24:	3501      	adds	r5, #1
 8000e26:	e7ec      	b.n	8000e02 <aeris_init+0x442>
 8000e28:	482c      	ldr	r0, [pc, #176]	; (8000edc <aeris_init+0x51c>)
 8000e2a:	f000 fb13 	bl	8001454 <timer_delay_loops>
 8000e2e:	4827      	ldr	r0, [pc, #156]	; (8000ecc <aeris_init+0x50c>)
 8000e30:	4927      	ldr	r1, [pc, #156]	; (8000ed0 <aeris_init+0x510>)
 8000e32:	22c0      	movs	r2, #192	; 0xc0
 8000e34:	f7ff fb52 	bl	80004dc <printf_>
 8000e38:	2500      	movs	r5, #0
 8000e3a:	e7e4      	b.n	8000e06 <aeris_init+0x446>
 8000e3c:	2005      	movs	r0, #5
 8000e3e:	f7ff fd85 	bl	800094c <aeris_init_surface_sensor>
 8000e42:	2006      	movs	r0, #6
 8000e44:	f7ff fd82 	bl	800094c <aeris_init_surface_sensor>
 8000e48:	2007      	movs	r0, #7
 8000e4a:	f7ff fd7f 	bl	800094c <aeris_init_surface_sensor>
 8000e4e:	b378      	cbz	r0, 8000eb0 <aeris_init+0x4f0>
 8000e50:	22c6      	movs	r2, #198	; 0xc6
 8000e52:	481e      	ldr	r0, [pc, #120]	; (8000ecc <aeris_init+0x50c>)
 8000e54:	491e      	ldr	r1, [pc, #120]	; (8000ed0 <aeris_init+0x510>)
 8000e56:	f7ff fb41 	bl	80004dc <printf_>
 8000e5a:	f7ff f9ff 	bl	800025c <sched_off>
 8000e5e:	481d      	ldr	r0, [pc, #116]	; (8000ed4 <aeris_init+0x514>)
 8000e60:	2110      	movs	r1, #16
 8000e62:	f000 fec0 	bl	8001be6 <GPIO_SetBits>
 8000e66:	481b      	ldr	r0, [pc, #108]	; (8000ed4 <aeris_init+0x514>)
 8000e68:	4641      	mov	r1, r8
 8000e6a:	f000 febc 	bl	8001be6 <GPIO_SetBits>
 8000e6e:	4819      	ldr	r0, [pc, #100]	; (8000ed4 <aeris_init+0x514>)
 8000e70:	2140      	movs	r1, #64	; 0x40
 8000e72:	f000 feb8 	bl	8001be6 <GPIO_SetBits>
 8000e76:	2d09      	cmp	r5, #9
 8000e78:	d810      	bhi.n	8000e9c <aeris_init+0x4dc>
 8000e7a:	2110      	movs	r1, #16
 8000e7c:	4815      	ldr	r0, [pc, #84]	; (8000ed4 <aeris_init+0x514>)
 8000e7e:	f000 feb4 	bl	8001bea <GPIO_ResetBits>
 8000e82:	f242 7010 	movw	r0, #10000	; 0x2710
 8000e86:	f000 fae5 	bl	8001454 <timer_delay_loops>
 8000e8a:	4812      	ldr	r0, [pc, #72]	; (8000ed4 <aeris_init+0x514>)
 8000e8c:	2110      	movs	r1, #16
 8000e8e:	f000 feaa 	bl	8001be6 <GPIO_SetBits>
 8000e92:	4811      	ldr	r0, [pc, #68]	; (8000ed8 <aeris_init+0x518>)
 8000e94:	f000 fade 	bl	8001454 <timer_delay_loops>
 8000e98:	3501      	adds	r5, #1
 8000e9a:	e7ec      	b.n	8000e76 <aeris_init+0x4b6>
 8000e9c:	480f      	ldr	r0, [pc, #60]	; (8000edc <aeris_init+0x51c>)
 8000e9e:	f000 fad9 	bl	8001454 <timer_delay_loops>
 8000ea2:	480a      	ldr	r0, [pc, #40]	; (8000ecc <aeris_init+0x50c>)
 8000ea4:	490a      	ldr	r1, [pc, #40]	; (8000ed0 <aeris_init+0x510>)
 8000ea6:	22c6      	movs	r2, #198	; 0xc6
 8000ea8:	f7ff fb18 	bl	80004dc <printf_>
 8000eac:	2500      	movs	r5, #0
 8000eae:	e7e4      	b.n	8000e7a <aeris_init+0x4ba>
 8000eb0:	f7ff fc9c 	bl	80007ec <aeris_set_rgbw>
 8000eb4:	f88a 4014 	strb.w	r4, [sl, #20]
 8000eb8:	f88a 6015 	strb.w	r6, [sl, #21]
 8000ebc:	f88a 4016 	strb.w	r4, [sl, #22]
 8000ec0:	f7ff fc94 	bl	80007ec <aeris_set_rgbw>
 8000ec4:	4628      	mov	r0, r5
 8000ec6:	b009      	add	sp, #36	; 0x24
 8000ec8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8000ecc:	08001d0d 	.word	0x08001d0d
 8000ed0:	08001d20 	.word	0x08001d20
 8000ed4:	40020400 	.word	0x40020400
 8000ed8:	001e8480 	.word	0x001e8480
 8000edc:	00989680 	.word	0x00989680

08000ee0 <aeris_line_folower_test>:
 8000ee0:	b510      	push	{r4, lr}
 8000ee2:	ed2d 8b02 	vpush	{d8}
 8000ee6:	eddf 8a17 	vldr	s17, [pc, #92]	; 8000f44 <aeris_line_folower_test+0x64>
 8000eea:	4c17      	ldr	r4, [pc, #92]	; (8000f48 <aeris_line_folower_test+0x68>)
 8000eec:	2301      	movs	r3, #1
 8000eee:	7563      	strb	r3, [r4, #21]
 8000ef0:	f7ff fc7c 	bl	80007ec <aeris_set_rgbw>
 8000ef4:	f7ff fd0e 	bl	8000914 <aeris_read_surface_sensors>
 8000ef8:	2300      	movs	r3, #0
 8000efa:	7563      	strb	r3, [r4, #21]
 8000efc:	f7ff fc76 	bl	80007ec <aeris_set_rgbw>
 8000f00:	f000 f82a 	bl	8000f58 <read_line_position>
 8000f04:	4b11      	ldr	r3, [pc, #68]	; (8000f4c <aeris_line_folower_test+0x6c>)
 8000f06:	681b      	ldr	r3, [r3, #0]
 8000f08:	425b      	negs	r3, r3
 8000f0a:	ee07 3a90 	vmov	s15, r3
 8000f0e:	eeb8 8ae7 	vcvt.f32.s32	s16, s15
 8000f12:	ed9f 7a0f 	vldr	s14, [pc, #60]	; 8000f50 <aeris_line_folower_test+0x70>
 8000f16:	ee78 7a68 	vsub.f32	s15, s16, s17
 8000f1a:	eef0 8a48 	vmov.f32	s17, s16
 8000f1e:	ee67 7a87 	vmul.f32	s15, s15, s14
 8000f22:	ed9f 7a0c 	vldr	s14, [pc, #48]	; 8000f54 <aeris_line_folower_test+0x74>
 8000f26:	ee48 7a07 	vmla.f32	s15, s16, s14
 8000f2a:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 8000f2e:	ee17 3a90 	vmov	r3, s15
 8000f32:	f103 0214 	add.w	r2, r3, #20
 8000f36:	f1c3 0314 	rsb	r3, r3, #20
 8000f3a:	60e2      	str	r2, [r4, #12]
 8000f3c:	6123      	str	r3, [r4, #16]
 8000f3e:	f7ff fbdd 	bl	80006fc <aeris_set_motors>
 8000f42:	e7d2      	b.n	8000eea <aeris_line_folower_test+0xa>
 8000f44:	00000000 	.word	0x00000000
 8000f48:	20000590 	.word	0x20000590
 8000f4c:	2000060c 	.word	0x2000060c
 8000f50:	42200000 	.word	0x42200000
 8000f54:	41800000 	.word	0x41800000

08000f58 <read_line_position>:
 8000f58:	4919      	ldr	r1, [pc, #100]	; (8000fc0 <read_line_position+0x68>)
 8000f5a:	f8b1 206a 	ldrh.w	r2, [r1, #106]	; 0x6a
 8000f5e:	f8b1 006c 	ldrh.w	r0, [r1, #108]	; 0x6c
 8000f62:	f5b2 7ffa 	cmp.w	r2, #500	; 0x1f4
 8000f66:	bf96      	itet	ls
 8000f68:	2300      	movls	r3, #0
 8000f6a:	f04f 33ff 	movhi.w	r3, #4294967295
 8000f6e:	461a      	movls	r2, r3
 8000f70:	f5b0 7ffa 	cmp.w	r0, #500	; 0x1f4
 8000f74:	d903      	bls.n	8000f7e <read_line_position+0x26>
 8000f76:	4290      	cmp	r0, r2
 8000f78:	bf84      	itt	hi
 8000f7a:	4602      	movhi	r2, r0
 8000f7c:	2301      	movhi	r3, #1
 8000f7e:	f8b1 0068 	ldrh.w	r0, [r1, #104]	; 0x68
 8000f82:	f5b0 7ffa 	cmp.w	r0, #500	; 0x1f4
 8000f86:	d904      	bls.n	8000f92 <read_line_position+0x3a>
 8000f88:	4290      	cmp	r0, r2
 8000f8a:	bf84      	itt	hi
 8000f8c:	4602      	movhi	r2, r0
 8000f8e:	f06f 0301 	mvnhi.w	r3, #1
 8000f92:	f8b1 006e 	ldrh.w	r0, [r1, #110]	; 0x6e
 8000f96:	490b      	ldr	r1, [pc, #44]	; (8000fc4 <read_line_position+0x6c>)
 8000f98:	f5b0 7ffa 	cmp.w	r0, #500	; 0x1f4
 8000f9c:	d903      	bls.n	8000fa6 <read_line_position+0x4e>
 8000f9e:	4290      	cmp	r0, r2
 8000fa0:	bf88      	it	hi
 8000fa2:	2302      	movhi	r3, #2
 8000fa4:	e004      	b.n	8000fb0 <read_line_position+0x58>
 8000fa6:	f5b2 7ffa 	cmp.w	r2, #500	; 0x1f4
 8000faa:	d801      	bhi.n	8000fb0 <read_line_position+0x58>
 8000fac:	2200      	movs	r2, #0
 8000fae:	e000      	b.n	8000fb2 <read_line_position+0x5a>
 8000fb0:	2201      	movs	r2, #1
 8000fb2:	710a      	strb	r2, [r1, #4]
 8000fb4:	790a      	ldrb	r2, [r1, #4]
 8000fb6:	b10a      	cbz	r2, 8000fbc <read_line_position+0x64>
 8000fb8:	4a02      	ldr	r2, [pc, #8]	; (8000fc4 <read_line_position+0x6c>)
 8000fba:	6013      	str	r3, [r2, #0]
 8000fbc:	4770      	bx	lr
 8000fbe:	bf00      	nop
 8000fc0:	20000590 	.word	0x20000590
 8000fc4:	2000060c 	.word	0x2000060c

08000fc8 <lsm9ds0_read>:
 8000fc8:	b538      	push	{r3, r4, r5, lr}
 8000fca:	2128      	movs	r1, #40	; 0x28
 8000fcc:	20d4      	movs	r0, #212	; 0xd4
 8000fce:	f000 fb42 	bl	8001656 <i2c_read_reg>
 8000fd2:	2129      	movs	r1, #41	; 0x29
 8000fd4:	4605      	mov	r5, r0
 8000fd6:	20d4      	movs	r0, #212	; 0xd4
 8000fd8:	f000 fb3d 	bl	8001656 <i2c_read_reg>
 8000fdc:	4c38      	ldr	r4, [pc, #224]	; (80010c0 <lsm9ds0_read+0xf8>)
 8000fde:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000fe2:	81a0      	strh	r0, [r4, #12]
 8000fe4:	212a      	movs	r1, #42	; 0x2a
 8000fe6:	20d4      	movs	r0, #212	; 0xd4
 8000fe8:	f000 fb35 	bl	8001656 <i2c_read_reg>
 8000fec:	212b      	movs	r1, #43	; 0x2b
 8000fee:	4605      	mov	r5, r0
 8000ff0:	20d4      	movs	r0, #212	; 0xd4
 8000ff2:	f000 fb30 	bl	8001656 <i2c_read_reg>
 8000ff6:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ffa:	81e0      	strh	r0, [r4, #14]
 8000ffc:	212c      	movs	r1, #44	; 0x2c
 8000ffe:	20d4      	movs	r0, #212	; 0xd4
 8001000:	f000 fb29 	bl	8001656 <i2c_read_reg>
 8001004:	212d      	movs	r1, #45	; 0x2d
 8001006:	4605      	mov	r5, r0
 8001008:	20d4      	movs	r0, #212	; 0xd4
 800100a:	f000 fb24 	bl	8001656 <i2c_read_reg>
 800100e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8001012:	8220      	strh	r0, [r4, #16]
 8001014:	2108      	movs	r1, #8
 8001016:	203c      	movs	r0, #60	; 0x3c
 8001018:	f000 fb1d 	bl	8001656 <i2c_read_reg>
 800101c:	2109      	movs	r1, #9
 800101e:	4605      	mov	r5, r0
 8001020:	203c      	movs	r0, #60	; 0x3c
 8001022:	f000 fb18 	bl	8001656 <i2c_read_reg>
 8001026:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800102a:	80e0      	strh	r0, [r4, #6]
 800102c:	210a      	movs	r1, #10
 800102e:	203c      	movs	r0, #60	; 0x3c
 8001030:	f000 fb11 	bl	8001656 <i2c_read_reg>
 8001034:	210b      	movs	r1, #11
 8001036:	4605      	mov	r5, r0
 8001038:	203c      	movs	r0, #60	; 0x3c
 800103a:	f000 fb0c 	bl	8001656 <i2c_read_reg>
 800103e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8001042:	8120      	strh	r0, [r4, #8]
 8001044:	210c      	movs	r1, #12
 8001046:	203c      	movs	r0, #60	; 0x3c
 8001048:	f000 fb05 	bl	8001656 <i2c_read_reg>
 800104c:	210d      	movs	r1, #13
 800104e:	4605      	mov	r5, r0
 8001050:	203c      	movs	r0, #60	; 0x3c
 8001052:	f000 fb00 	bl	8001656 <i2c_read_reg>
 8001056:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800105a:	8160      	strh	r0, [r4, #10]
 800105c:	2128      	movs	r1, #40	; 0x28
 800105e:	203c      	movs	r0, #60	; 0x3c
 8001060:	f000 faf9 	bl	8001656 <i2c_read_reg>
 8001064:	2129      	movs	r1, #41	; 0x29
 8001066:	4605      	mov	r5, r0
 8001068:	203c      	movs	r0, #60	; 0x3c
 800106a:	f000 faf4 	bl	8001656 <i2c_read_reg>
 800106e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8001072:	8020      	strh	r0, [r4, #0]
 8001074:	212a      	movs	r1, #42	; 0x2a
 8001076:	203c      	movs	r0, #60	; 0x3c
 8001078:	f000 faed 	bl	8001656 <i2c_read_reg>
 800107c:	212b      	movs	r1, #43	; 0x2b
 800107e:	4605      	mov	r5, r0
 8001080:	203c      	movs	r0, #60	; 0x3c
 8001082:	f000 fae8 	bl	8001656 <i2c_read_reg>
 8001086:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800108a:	8060      	strh	r0, [r4, #2]
 800108c:	212c      	movs	r1, #44	; 0x2c
 800108e:	203c      	movs	r0, #60	; 0x3c
 8001090:	f000 fae1 	bl	8001656 <i2c_read_reg>
 8001094:	212d      	movs	r1, #45	; 0x2d
 8001096:	4605      	mov	r5, r0
 8001098:	203c      	movs	r0, #60	; 0x3c
 800109a:	f000 fadc 	bl	8001656 <i2c_read_reg>
 800109e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80010a2:	80a0      	strh	r0, [r4, #4]
 80010a4:	2105      	movs	r1, #5
 80010a6:	203c      	movs	r0, #60	; 0x3c
 80010a8:	f000 fad5 	bl	8001656 <i2c_read_reg>
 80010ac:	2106      	movs	r1, #6
 80010ae:	4605      	mov	r5, r0
 80010b0:	203c      	movs	r0, #60	; 0x3c
 80010b2:	f000 fad0 	bl	8001656 <i2c_read_reg>
 80010b6:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80010ba:	8320      	strh	r0, [r4, #24]
 80010bc:	bd38      	pop	{r3, r4, r5, pc}
 80010be:	bf00      	nop
 80010c0:	20000574 	.word	0x20000574

080010c4 <lsm9ds0_init>:
 80010c4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80010c8:	4d34      	ldr	r5, [pc, #208]	; (800119c <lsm9ds0_init+0xd8>)
 80010ca:	2400      	movs	r4, #0
 80010cc:	20d4      	movs	r0, #212	; 0xd4
 80010ce:	210f      	movs	r1, #15
 80010d0:	802c      	strh	r4, [r5, #0]
 80010d2:	806c      	strh	r4, [r5, #2]
 80010d4:	80ac      	strh	r4, [r5, #4]
 80010d6:	80ec      	strh	r4, [r5, #6]
 80010d8:	812c      	strh	r4, [r5, #8]
 80010da:	816c      	strh	r4, [r5, #10]
 80010dc:	81ac      	strh	r4, [r5, #12]
 80010de:	81ec      	strh	r4, [r5, #14]
 80010e0:	822c      	strh	r4, [r5, #16]
 80010e2:	826c      	strh	r4, [r5, #18]
 80010e4:	82ac      	strh	r4, [r5, #20]
 80010e6:	82ec      	strh	r4, [r5, #22]
 80010e8:	832c      	strh	r4, [r5, #24]
 80010ea:	f000 fab4 	bl	8001656 <i2c_read_reg>
 80010ee:	28d4      	cmp	r0, #212	; 0xd4
 80010f0:	4606      	mov	r6, r0
 80010f2:	d14e      	bne.n	8001192 <lsm9ds0_init+0xce>
 80010f4:	203c      	movs	r0, #60	; 0x3c
 80010f6:	210f      	movs	r1, #15
 80010f8:	f000 faad 	bl	8001656 <i2c_read_reg>
 80010fc:	2849      	cmp	r0, #73	; 0x49
 80010fe:	bf18      	it	ne
 8001100:	2602      	movne	r6, #2
 8001102:	d147      	bne.n	8001194 <lsm9ds0_init+0xd0>
 8001104:	4630      	mov	r0, r6
 8001106:	2120      	movs	r1, #32
 8001108:	22ff      	movs	r2, #255	; 0xff
 800110a:	f000 fa91 	bl	8001630 <i2c_write_reg>
 800110e:	4630      	mov	r0, r6
 8001110:	2123      	movs	r1, #35	; 0x23
 8001112:	2218      	movs	r2, #24
 8001114:	f000 fa8c 	bl	8001630 <i2c_write_reg>
 8001118:	203c      	movs	r0, #60	; 0x3c
 800111a:	211f      	movs	r1, #31
 800111c:	4622      	mov	r2, r4
 800111e:	f000 fa87 	bl	8001630 <i2c_write_reg>
 8001122:	203c      	movs	r0, #60	; 0x3c
 8001124:	2120      	movs	r1, #32
 8001126:	2267      	movs	r2, #103	; 0x67
 8001128:	f000 fa82 	bl	8001630 <i2c_write_reg>
 800112c:	203c      	movs	r0, #60	; 0x3c
 800112e:	2121      	movs	r1, #33	; 0x21
 8001130:	4622      	mov	r2, r4
 8001132:	f000 fa7d 	bl	8001630 <i2c_write_reg>
 8001136:	203c      	movs	r0, #60	; 0x3c
 8001138:	2124      	movs	r1, #36	; 0x24
 800113a:	22f4      	movs	r2, #244	; 0xf4
 800113c:	f000 fa78 	bl	8001630 <i2c_write_reg>
 8001140:	203c      	movs	r0, #60	; 0x3c
 8001142:	2125      	movs	r1, #37	; 0x25
 8001144:	4622      	mov	r2, r4
 8001146:	f000 fa73 	bl	8001630 <i2c_write_reg>
 800114a:	203c      	movs	r0, #60	; 0x3c
 800114c:	2126      	movs	r1, #38	; 0x26
 800114e:	2280      	movs	r2, #128	; 0x80
 8001150:	f000 fa6e 	bl	8001630 <i2c_write_reg>
 8001154:	f7ff ff38 	bl	8000fc8 <lsm9ds0_read>
 8001158:	2664      	movs	r6, #100	; 0x64
 800115a:	4627      	mov	r7, r4
 800115c:	46a0      	mov	r8, r4
 800115e:	f7ff ff33 	bl	8000fc8 <lsm9ds0_read>
 8001162:	f9b5 200c 	ldrsh.w	r2, [r5, #12]
 8001166:	4b0d      	ldr	r3, [pc, #52]	; (800119c <lsm9ds0_init+0xd8>)
 8001168:	4490      	add	r8, r2
 800116a:	f9b5 200e 	ldrsh.w	r2, [r5, #14]
 800116e:	4417      	add	r7, r2
 8001170:	f9b5 2010 	ldrsh.w	r2, [r5, #16]
 8001174:	3e01      	subs	r6, #1
 8001176:	4414      	add	r4, r2
 8001178:	d1f1      	bne.n	800115e <lsm9ds0_init+0x9a>
 800117a:	2264      	movs	r2, #100	; 0x64
 800117c:	fb98 f8f2 	sdiv	r8, r8, r2
 8001180:	fb97 f7f2 	sdiv	r7, r7, r2
 8001184:	fb94 f4f2 	sdiv	r4, r4, r2
 8001188:	f8a3 8012 	strh.w	r8, [r3, #18]
 800118c:	829f      	strh	r7, [r3, #20]
 800118e:	82dc      	strh	r4, [r3, #22]
 8001190:	e000      	b.n	8001194 <lsm9ds0_init+0xd0>
 8001192:	2601      	movs	r6, #1
 8001194:	4630      	mov	r0, r6
 8001196:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 800119a:	bf00      	nop
 800119c:	20000574 	.word	0x20000574

080011a0 <main_thread>:
 80011a0:	b508      	push	{r3, lr}
 80011a2:	4804      	ldr	r0, [pc, #16]	; (80011b4 <main_thread+0x14>)
 80011a4:	f7ff f99a 	bl	80004dc <printf_>
 80011a8:	f7ff fc0a 	bl	80009c0 <aeris_init>
 80011ac:	f7ff fe98 	bl	8000ee0 <aeris_line_folower_test>
 80011b0:	e7fe      	b.n	80011b0 <main_thread+0x10>
 80011b2:	bf00      	nop
 80011b4:	08001e29 	.word	0x08001e29

080011b8 <TIM_TimeBaseInit>:
 80011b8:	4a1c      	ldr	r2, [pc, #112]	; (800122c <TIM_TimeBaseInit+0x74>)
 80011ba:	8803      	ldrh	r3, [r0, #0]
 80011bc:	4290      	cmp	r0, r2
 80011be:	b29b      	uxth	r3, r3
 80011c0:	d012      	beq.n	80011e8 <TIM_TimeBaseInit+0x30>
 80011c2:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80011c6:	4290      	cmp	r0, r2
 80011c8:	d00e      	beq.n	80011e8 <TIM_TimeBaseInit+0x30>
 80011ca:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 80011ce:	d00b      	beq.n	80011e8 <TIM_TimeBaseInit+0x30>
 80011d0:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 80011d4:	4290      	cmp	r0, r2
 80011d6:	d007      	beq.n	80011e8 <TIM_TimeBaseInit+0x30>
 80011d8:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80011dc:	4290      	cmp	r0, r2
 80011de:	d003      	beq.n	80011e8 <TIM_TimeBaseInit+0x30>
 80011e0:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80011e4:	4290      	cmp	r0, r2
 80011e6:	d103      	bne.n	80011f0 <TIM_TimeBaseInit+0x38>
 80011e8:	884a      	ldrh	r2, [r1, #2]
 80011ea:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 80011ee:	4313      	orrs	r3, r2
 80011f0:	4a0f      	ldr	r2, [pc, #60]	; (8001230 <TIM_TimeBaseInit+0x78>)
 80011f2:	4290      	cmp	r0, r2
 80011f4:	d008      	beq.n	8001208 <TIM_TimeBaseInit+0x50>
 80011f6:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80011fa:	4290      	cmp	r0, r2
 80011fc:	d004      	beq.n	8001208 <TIM_TimeBaseInit+0x50>
 80011fe:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001202:	890a      	ldrh	r2, [r1, #8]
 8001204:	b29b      	uxth	r3, r3
 8001206:	4313      	orrs	r3, r2
 8001208:	8003      	strh	r3, [r0, #0]
 800120a:	684b      	ldr	r3, [r1, #4]
 800120c:	62c3      	str	r3, [r0, #44]	; 0x2c
 800120e:	880b      	ldrh	r3, [r1, #0]
 8001210:	8503      	strh	r3, [r0, #40]	; 0x28
 8001212:	4b06      	ldr	r3, [pc, #24]	; (800122c <TIM_TimeBaseInit+0x74>)
 8001214:	4298      	cmp	r0, r3
 8001216:	d003      	beq.n	8001220 <TIM_TimeBaseInit+0x68>
 8001218:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 800121c:	4298      	cmp	r0, r3
 800121e:	d101      	bne.n	8001224 <TIM_TimeBaseInit+0x6c>
 8001220:	7a8b      	ldrb	r3, [r1, #10]
 8001222:	8603      	strh	r3, [r0, #48]	; 0x30
 8001224:	2301      	movs	r3, #1
 8001226:	8283      	strh	r3, [r0, #20]
 8001228:	4770      	bx	lr
 800122a:	bf00      	nop
 800122c:	40010000 	.word	0x40010000
 8001230:	40001000 	.word	0x40001000

08001234 <TIM_Cmd>:
 8001234:	8803      	ldrh	r3, [r0, #0]
 8001236:	b119      	cbz	r1, 8001240 <TIM_Cmd+0xc>
 8001238:	b29b      	uxth	r3, r3
 800123a:	f043 0301 	orr.w	r3, r3, #1
 800123e:	e003      	b.n	8001248 <TIM_Cmd+0x14>
 8001240:	f023 0301 	bic.w	r3, r3, #1
 8001244:	041b      	lsls	r3, r3, #16
 8001246:	0c1b      	lsrs	r3, r3, #16
 8001248:	8003      	strh	r3, [r0, #0]
 800124a:	4770      	bx	lr

0800124c <TIM_OC1Init>:
 800124c:	8c03      	ldrh	r3, [r0, #32]
 800124e:	f023 0301 	bic.w	r3, r3, #1
 8001252:	041b      	lsls	r3, r3, #16
 8001254:	0c1b      	lsrs	r3, r3, #16
 8001256:	8403      	strh	r3, [r0, #32]
 8001258:	b570      	push	{r4, r5, r6, lr}
 800125a:	8c03      	ldrh	r3, [r0, #32]
 800125c:	8884      	ldrh	r4, [r0, #4]
 800125e:	8b02      	ldrh	r2, [r0, #24]
 8001260:	880d      	ldrh	r5, [r1, #0]
 8001262:	884e      	ldrh	r6, [r1, #2]
 8001264:	f022 0273 	bic.w	r2, r2, #115	; 0x73
 8001268:	0412      	lsls	r2, r2, #16
 800126a:	0c12      	lsrs	r2, r2, #16
 800126c:	432a      	orrs	r2, r5
 800126e:	898d      	ldrh	r5, [r1, #12]
 8001270:	f023 0302 	bic.w	r3, r3, #2
 8001274:	041b      	lsls	r3, r3, #16
 8001276:	4335      	orrs	r5, r6
 8001278:	b2ad      	uxth	r5, r5
 800127a:	0c1b      	lsrs	r3, r3, #16
 800127c:	432b      	orrs	r3, r5
 800127e:	4d0e      	ldr	r5, [pc, #56]	; (80012b8 <TIM_OC1Init+0x6c>)
 8001280:	42a8      	cmp	r0, r5
 8001282:	b2a4      	uxth	r4, r4
 8001284:	d003      	beq.n	800128e <TIM_OC1Init+0x42>
 8001286:	f505 6580 	add.w	r5, r5, #1024	; 0x400
 800128a:	42a8      	cmp	r0, r5
 800128c:	d10e      	bne.n	80012ac <TIM_OC1Init+0x60>
 800128e:	89cd      	ldrh	r5, [r1, #14]
 8001290:	8a4e      	ldrh	r6, [r1, #18]
 8001292:	f023 0308 	bic.w	r3, r3, #8
 8001296:	432b      	orrs	r3, r5
 8001298:	888d      	ldrh	r5, [r1, #4]
 800129a:	f023 0304 	bic.w	r3, r3, #4
 800129e:	432b      	orrs	r3, r5
 80012a0:	8a0d      	ldrh	r5, [r1, #16]
 80012a2:	4335      	orrs	r5, r6
 80012a4:	f424 7440 	bic.w	r4, r4, #768	; 0x300
 80012a8:	b2ad      	uxth	r5, r5
 80012aa:	432c      	orrs	r4, r5
 80012ac:	8084      	strh	r4, [r0, #4]
 80012ae:	8302      	strh	r2, [r0, #24]
 80012b0:	688a      	ldr	r2, [r1, #8]
 80012b2:	6342      	str	r2, [r0, #52]	; 0x34
 80012b4:	8403      	strh	r3, [r0, #32]
 80012b6:	bd70      	pop	{r4, r5, r6, pc}
 80012b8:	40010000 	.word	0x40010000

080012bc <TIM_OC2Init>:
 80012bc:	8c03      	ldrh	r3, [r0, #32]
 80012be:	f023 0310 	bic.w	r3, r3, #16
 80012c2:	041b      	lsls	r3, r3, #16
 80012c4:	0c1b      	lsrs	r3, r3, #16
 80012c6:	8403      	strh	r3, [r0, #32]
 80012c8:	8c03      	ldrh	r3, [r0, #32]
 80012ca:	8882      	ldrh	r2, [r0, #4]
 80012cc:	b530      	push	{r4, r5, lr}
 80012ce:	8b04      	ldrh	r4, [r0, #24]
 80012d0:	880d      	ldrh	r5, [r1, #0]
 80012d2:	f424 44e6 	bic.w	r4, r4, #29440	; 0x7300
 80012d6:	0424      	lsls	r4, r4, #16
 80012d8:	0c24      	lsrs	r4, r4, #16
 80012da:	f023 0320 	bic.w	r3, r3, #32
 80012de:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
 80012e2:	041b      	lsls	r3, r3, #16
 80012e4:	898d      	ldrh	r5, [r1, #12]
 80012e6:	0c1b      	lsrs	r3, r3, #16
 80012e8:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 80012ec:	884d      	ldrh	r5, [r1, #2]
 80012ee:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 80012f2:	4d13      	ldr	r5, [pc, #76]	; (8001340 <TIM_OC2Init+0x84>)
 80012f4:	42a8      	cmp	r0, r5
 80012f6:	b292      	uxth	r2, r2
 80012f8:	b2a4      	uxth	r4, r4
 80012fa:	b29b      	uxth	r3, r3
 80012fc:	d003      	beq.n	8001306 <TIM_OC2Init+0x4a>
 80012fe:	f505 6580 	add.w	r5, r5, #1024	; 0x400
 8001302:	42a8      	cmp	r0, r5
 8001304:	d115      	bne.n	8001332 <TIM_OC2Init+0x76>
 8001306:	89cd      	ldrh	r5, [r1, #14]
 8001308:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 800130c:	b29b      	uxth	r3, r3
 800130e:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 8001312:	f64f 75bf 	movw	r5, #65471	; 0xffbf
 8001316:	401d      	ands	r5, r3
 8001318:	888b      	ldrh	r3, [r1, #4]
 800131a:	ea45 1303 	orr.w	r3, r5, r3, lsl #4
 800131e:	8a0d      	ldrh	r5, [r1, #16]
 8001320:	f422 6240 	bic.w	r2, r2, #3072	; 0xc00
 8001324:	ea42 0285 	orr.w	r2, r2, r5, lsl #2
 8001328:	8a4d      	ldrh	r5, [r1, #18]
 800132a:	ea42 0285 	orr.w	r2, r2, r5, lsl #2
 800132e:	b29b      	uxth	r3, r3
 8001330:	b292      	uxth	r2, r2
 8001332:	8082      	strh	r2, [r0, #4]
 8001334:	688a      	ldr	r2, [r1, #8]
 8001336:	8304      	strh	r4, [r0, #24]
 8001338:	6382      	str	r2, [r0, #56]	; 0x38
 800133a:	8403      	strh	r3, [r0, #32]
 800133c:	bd30      	pop	{r4, r5, pc}
 800133e:	bf00      	nop
 8001340:	40010000 	.word	0x40010000

08001344 <TIM_CtrlPWMOutputs>:
 8001344:	f8b0 3044 	ldrh.w	r3, [r0, #68]	; 0x44
 8001348:	b129      	cbz	r1, 8001356 <TIM_CtrlPWMOutputs+0x12>
 800134a:	ea6f 4343 	mvn.w	r3, r3, lsl #17
 800134e:	ea6f 4353 	mvn.w	r3, r3, lsr #17
 8001352:	b29b      	uxth	r3, r3
 8001354:	e001      	b.n	800135a <TIM_CtrlPWMOutputs+0x16>
 8001356:	f3c3 030e 	ubfx	r3, r3, #0, #15
 800135a:	f8a0 3044 	strh.w	r3, [r0, #68]	; 0x44
 800135e:	4770      	bx	lr

08001360 <TIM_ClearITPendingBit>:
 8001360:	43c9      	mvns	r1, r1
 8001362:	b289      	uxth	r1, r1
 8001364:	8201      	strh	r1, [r0, #16]
 8001366:	4770      	bx	lr

08001368 <timer_init>:
 8001368:	b530      	push	{r4, r5, lr}
 800136a:	2000      	movs	r0, #0
 800136c:	b085      	sub	sp, #20
 800136e:	4a1e      	ldr	r2, [pc, #120]	; (80013e8 <timer_init+0x80>)
 8001370:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8001374:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8001378:	4a1c      	ldr	r2, [pc, #112]	; (80013ec <timer_init+0x84>)
 800137a:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 800137e:	4b1c      	ldr	r3, [pc, #112]	; (80013f0 <timer_init+0x88>)
 8001380:	2400      	movs	r4, #0
 8001382:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 8001386:	3001      	adds	r0, #1
 8001388:	2804      	cmp	r0, #4
 800138a:	4625      	mov	r5, r4
 800138c:	d1ef      	bne.n	800136e <timer_init+0x6>
 800138e:	4b19      	ldr	r3, [pc, #100]	; (80013f4 <timer_init+0x8c>)
 8001390:	2101      	movs	r1, #1
 8001392:	601c      	str	r4, [r3, #0]
 8001394:	f000 fb54 	bl	8001a40 <RCC_APB1PeriphClockCmd>
 8001398:	f8ad 4006 	strh.w	r4, [sp, #6]
 800139c:	f8ad 400c 	strh.w	r4, [sp, #12]
 80013a0:	f88d 400e 	strb.w	r4, [sp, #14]
 80013a4:	4c14      	ldr	r4, [pc, #80]	; (80013f8 <timer_init+0x90>)
 80013a6:	2353      	movs	r3, #83	; 0x53
 80013a8:	f8ad 3004 	strh.w	r3, [sp, #4]
 80013ac:	4620      	mov	r0, r4
 80013ae:	2331      	movs	r3, #49	; 0x31
 80013b0:	a901      	add	r1, sp, #4
 80013b2:	9302      	str	r3, [sp, #8]
 80013b4:	f7ff ff00 	bl	80011b8 <TIM_TimeBaseInit>
 80013b8:	4620      	mov	r0, r4
 80013ba:	2101      	movs	r1, #1
 80013bc:	f7ff ff3a 	bl	8001234 <TIM_Cmd>
 80013c0:	89a3      	ldrh	r3, [r4, #12]
 80013c2:	b29b      	uxth	r3, r3
 80013c4:	f043 0301 	orr.w	r3, r3, #1
 80013c8:	81a3      	strh	r3, [r4, #12]
 80013ca:	231e      	movs	r3, #30
 80013cc:	f88d 3000 	strb.w	r3, [sp]
 80013d0:	4668      	mov	r0, sp
 80013d2:	2301      	movs	r3, #1
 80013d4:	f88d 5001 	strb.w	r5, [sp, #1]
 80013d8:	f88d 3002 	strb.w	r3, [sp, #2]
 80013dc:	f88d 3003 	strb.w	r3, [sp, #3]
 80013e0:	f000 fc18 	bl	8001c14 <NVIC_Init>
 80013e4:	b005      	add	sp, #20
 80013e6:	bd30      	pop	{r4, r5, pc}
 80013e8:	20000628 	.word	0x20000628
 80013ec:	2000061c 	.word	0x2000061c
 80013f0:	20000614 	.word	0x20000614
 80013f4:	20000624 	.word	0x20000624
 80013f8:	40000800 	.word	0x40000800

080013fc <TIM4_IRQHandler>:
 80013fc:	2300      	movs	r3, #0
 80013fe:	4a10      	ldr	r2, [pc, #64]	; (8001440 <TIM4_IRQHandler+0x44>)
 8001400:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001404:	b289      	uxth	r1, r1
 8001406:	b129      	cbz	r1, 8001414 <TIM4_IRQHandler+0x18>
 8001408:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 800140c:	b289      	uxth	r1, r1
 800140e:	3901      	subs	r1, #1
 8001410:	b289      	uxth	r1, r1
 8001412:	e007      	b.n	8001424 <TIM4_IRQHandler+0x28>
 8001414:	490b      	ldr	r1, [pc, #44]	; (8001444 <TIM4_IRQHandler+0x48>)
 8001416:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 800141a:	b289      	uxth	r1, r1
 800141c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001420:	4a09      	ldr	r2, [pc, #36]	; (8001448 <TIM4_IRQHandler+0x4c>)
 8001422:	2101      	movs	r1, #1
 8001424:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001428:	3301      	adds	r3, #1
 800142a:	2b04      	cmp	r3, #4
 800142c:	d1e7      	bne.n	80013fe <TIM4_IRQHandler+0x2>
 800142e:	4b07      	ldr	r3, [pc, #28]	; (800144c <TIM4_IRQHandler+0x50>)
 8001430:	4807      	ldr	r0, [pc, #28]	; (8001450 <TIM4_IRQHandler+0x54>)
 8001432:	681a      	ldr	r2, [r3, #0]
 8001434:	2101      	movs	r1, #1
 8001436:	3201      	adds	r2, #1
 8001438:	601a      	str	r2, [r3, #0]
 800143a:	f7ff bf91 	b.w	8001360 <TIM_ClearITPendingBit>
 800143e:	bf00      	nop
 8001440:	20000628 	.word	0x20000628
 8001444:	2000061c 	.word	0x2000061c
 8001448:	20000614 	.word	0x20000614
 800144c:	20000624 	.word	0x20000624
 8001450:	40000800 	.word	0x40000800

08001454 <timer_delay_loops>:
 8001454:	f110 30ff 	adds.w	r0, r0, #4294967295
 8001458:	d301      	bcc.n	800145e <timer_delay_loops+0xa>
 800145a:	bf00      	nop
 800145c:	e7fa      	b.n	8001454 <timer_delay_loops>
 800145e:	4770      	bx	lr

08001460 <i2c_delay>:
 8001460:	bf00      	nop
 8001462:	bf00      	nop
 8001464:	4770      	bx	lr
	...

08001468 <SetLowSDA>:
 8001468:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800146a:	4d0d      	ldr	r5, [pc, #52]	; (80014a0 <SetLowSDA+0x38>)
 800146c:	2301      	movs	r3, #1
 800146e:	2202      	movs	r2, #2
 8001470:	f44f 4480 	mov.w	r4, #16384	; 0x4000
 8001474:	f88d 3004 	strb.w	r3, [sp, #4]
 8001478:	f88d 3006 	strb.w	r3, [sp, #6]
 800147c:	4628      	mov	r0, r5
 800147e:	2300      	movs	r3, #0
 8001480:	4669      	mov	r1, sp
 8001482:	f88d 2005 	strb.w	r2, [sp, #5]
 8001486:	f88d 3007 	strb.w	r3, [sp, #7]
 800148a:	9400      	str	r4, [sp, #0]
 800148c:	f000 fb6a 	bl	8001b64 <GPIO_Init>
 8001490:	4628      	mov	r0, r5
 8001492:	4621      	mov	r1, r4
 8001494:	f000 fba9 	bl	8001bea <GPIO_ResetBits>
 8001498:	f7ff ffe2 	bl	8001460 <i2c_delay>
 800149c:	b003      	add	sp, #12
 800149e:	bd30      	pop	{r4, r5, pc}
 80014a0:	40020400 	.word	0x40020400

080014a4 <SetHighSDA>:
 80014a4:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80014a6:	4d0d      	ldr	r5, [pc, #52]	; (80014dc <SetHighSDA+0x38>)
 80014a8:	2202      	movs	r2, #2
 80014aa:	2300      	movs	r3, #0
 80014ac:	f44f 4480 	mov.w	r4, #16384	; 0x4000
 80014b0:	f88d 2005 	strb.w	r2, [sp, #5]
 80014b4:	4628      	mov	r0, r5
 80014b6:	2201      	movs	r2, #1
 80014b8:	4669      	mov	r1, sp
 80014ba:	f88d 3004 	strb.w	r3, [sp, #4]
 80014be:	f88d 2006 	strb.w	r2, [sp, #6]
 80014c2:	f88d 3007 	strb.w	r3, [sp, #7]
 80014c6:	9400      	str	r4, [sp, #0]
 80014c8:	f000 fb4c 	bl	8001b64 <GPIO_Init>
 80014cc:	4628      	mov	r0, r5
 80014ce:	4621      	mov	r1, r4
 80014d0:	f000 fb89 	bl	8001be6 <GPIO_SetBits>
 80014d4:	f7ff ffc4 	bl	8001460 <i2c_delay>
 80014d8:	b003      	add	sp, #12
 80014da:	bd30      	pop	{r4, r5, pc}
 80014dc:	40020400 	.word	0x40020400

080014e0 <SetLowSCL>:
 80014e0:	b508      	push	{r3, lr}
 80014e2:	4804      	ldr	r0, [pc, #16]	; (80014f4 <SetLowSCL+0x14>)
 80014e4:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80014e8:	f000 fb7f 	bl	8001bea <GPIO_ResetBits>
 80014ec:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80014f0:	f7ff bfb6 	b.w	8001460 <i2c_delay>
 80014f4:	40020400 	.word	0x40020400

080014f8 <SetHighSCL>:
 80014f8:	b508      	push	{r3, lr}
 80014fa:	4804      	ldr	r0, [pc, #16]	; (800150c <SetHighSCL+0x14>)
 80014fc:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001500:	f000 fb71 	bl	8001be6 <GPIO_SetBits>
 8001504:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001508:	f7ff bfaa 	b.w	8001460 <i2c_delay>
 800150c:	40020400 	.word	0x40020400

08001510 <i2c_0_init>:
 8001510:	b507      	push	{r0, r1, r2, lr}
 8001512:	2002      	movs	r0, #2
 8001514:	2101      	movs	r1, #1
 8001516:	f000 fa87 	bl	8001a28 <RCC_AHB1PeriphClockCmd>
 800151a:	f44f 4340 	mov.w	r3, #49152	; 0xc000
 800151e:	9300      	str	r3, [sp, #0]
 8001520:	2301      	movs	r3, #1
 8001522:	2202      	movs	r2, #2
 8001524:	480a      	ldr	r0, [pc, #40]	; (8001550 <i2c_0_init+0x40>)
 8001526:	f88d 3004 	strb.w	r3, [sp, #4]
 800152a:	4669      	mov	r1, sp
 800152c:	f88d 3006 	strb.w	r3, [sp, #6]
 8001530:	2300      	movs	r3, #0
 8001532:	f88d 2005 	strb.w	r2, [sp, #5]
 8001536:	f88d 3007 	strb.w	r3, [sp, #7]
 800153a:	f000 fb13 	bl	8001b64 <GPIO_Init>
 800153e:	f7ff ffdb 	bl	80014f8 <SetHighSCL>
 8001542:	f7ff ff91 	bl	8001468 <SetLowSDA>
 8001546:	f7ff ffad 	bl	80014a4 <SetHighSDA>
 800154a:	b003      	add	sp, #12
 800154c:	f85d fb04 	ldr.w	pc, [sp], #4
 8001550:	40020400 	.word	0x40020400

08001554 <i2cStart>:
 8001554:	b508      	push	{r3, lr}
 8001556:	f7ff ffcf 	bl	80014f8 <SetHighSCL>
 800155a:	f7ff ffa3 	bl	80014a4 <SetHighSDA>
 800155e:	f7ff ffcb 	bl	80014f8 <SetHighSCL>
 8001562:	f7ff ff81 	bl	8001468 <SetLowSDA>
 8001566:	f7ff ffbb 	bl	80014e0 <SetLowSCL>
 800156a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800156e:	f7ff bf99 	b.w	80014a4 <SetHighSDA>

08001572 <i2cStop>:
 8001572:	b508      	push	{r3, lr}
 8001574:	f7ff ffb4 	bl	80014e0 <SetLowSCL>
 8001578:	f7ff ff76 	bl	8001468 <SetLowSDA>
 800157c:	f7ff ffbc 	bl	80014f8 <SetHighSCL>
 8001580:	f7ff ff72 	bl	8001468 <SetLowSDA>
 8001584:	f7ff ffb8 	bl	80014f8 <SetHighSCL>
 8001588:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800158c:	f7ff bf8a 	b.w	80014a4 <SetHighSDA>

08001590 <i2cWrite>:
 8001590:	b538      	push	{r3, r4, r5, lr}
 8001592:	4604      	mov	r4, r0
 8001594:	2508      	movs	r5, #8
 8001596:	f7ff ffa3 	bl	80014e0 <SetLowSCL>
 800159a:	0623      	lsls	r3, r4, #24
 800159c:	d502      	bpl.n	80015a4 <i2cWrite+0x14>
 800159e:	f7ff ff81 	bl	80014a4 <SetHighSDA>
 80015a2:	e001      	b.n	80015a8 <i2cWrite+0x18>
 80015a4:	f7ff ff60 	bl	8001468 <SetLowSDA>
 80015a8:	3d01      	subs	r5, #1
 80015aa:	f7ff ffa5 	bl	80014f8 <SetHighSCL>
 80015ae:	0064      	lsls	r4, r4, #1
 80015b0:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80015b4:	b2e4      	uxtb	r4, r4
 80015b6:	d1ee      	bne.n	8001596 <i2cWrite+0x6>
 80015b8:	f7ff ff92 	bl	80014e0 <SetLowSCL>
 80015bc:	f7ff ff72 	bl	80014a4 <SetHighSDA>
 80015c0:	f7ff ff9a 	bl	80014f8 <SetHighSCL>
 80015c4:	4b05      	ldr	r3, [pc, #20]	; (80015dc <i2cWrite+0x4c>)
 80015c6:	691c      	ldr	r4, [r3, #16]
 80015c8:	f7ff ff8a 	bl	80014e0 <SetLowSCL>
 80015cc:	f7ff ff48 	bl	8001460 <i2c_delay>
 80015d0:	f484 4080 	eor.w	r0, r4, #16384	; 0x4000
 80015d4:	f3c0 3080 	ubfx	r0, r0, #14, #1
 80015d8:	bd38      	pop	{r3, r4, r5, pc}
 80015da:	bf00      	nop
 80015dc:	40020400 	.word	0x40020400

080015e0 <i2cRead>:
 80015e0:	b570      	push	{r4, r5, r6, lr}
 80015e2:	4606      	mov	r6, r0
 80015e4:	f7ff ff7c 	bl	80014e0 <SetLowSCL>
 80015e8:	f7ff ff5c 	bl	80014a4 <SetHighSDA>
 80015ec:	2508      	movs	r5, #8
 80015ee:	2400      	movs	r4, #0
 80015f0:	f7ff ff82 	bl	80014f8 <SetHighSCL>
 80015f4:	4b0d      	ldr	r3, [pc, #52]	; (800162c <i2cRead+0x4c>)
 80015f6:	691b      	ldr	r3, [r3, #16]
 80015f8:	0064      	lsls	r4, r4, #1
 80015fa:	045a      	lsls	r2, r3, #17
 80015fc:	b2e4      	uxtb	r4, r4
 80015fe:	bf48      	it	mi
 8001600:	3401      	addmi	r4, #1
 8001602:	f105 35ff 	add.w	r5, r5, #4294967295
 8001606:	bf48      	it	mi
 8001608:	b2e4      	uxtbmi	r4, r4
 800160a:	f7ff ff69 	bl	80014e0 <SetLowSCL>
 800160e:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001612:	d1ed      	bne.n	80015f0 <i2cRead+0x10>
 8001614:	b10e      	cbz	r6, 800161a <i2cRead+0x3a>
 8001616:	f7ff ff27 	bl	8001468 <SetLowSDA>
 800161a:	f7ff ff6d 	bl	80014f8 <SetHighSCL>
 800161e:	f7ff ff5f 	bl	80014e0 <SetLowSCL>
 8001622:	f7ff ff1d 	bl	8001460 <i2c_delay>
 8001626:	4620      	mov	r0, r4
 8001628:	bd70      	pop	{r4, r5, r6, pc}
 800162a:	bf00      	nop
 800162c:	40020400 	.word	0x40020400

08001630 <i2c_write_reg>:
 8001630:	b570      	push	{r4, r5, r6, lr}
 8001632:	4605      	mov	r5, r0
 8001634:	460c      	mov	r4, r1
 8001636:	4616      	mov	r6, r2
 8001638:	f7ff ff8c 	bl	8001554 <i2cStart>
 800163c:	4628      	mov	r0, r5
 800163e:	f7ff ffa7 	bl	8001590 <i2cWrite>
 8001642:	4620      	mov	r0, r4
 8001644:	f7ff ffa4 	bl	8001590 <i2cWrite>
 8001648:	4630      	mov	r0, r6
 800164a:	f7ff ffa1 	bl	8001590 <i2cWrite>
 800164e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001652:	f7ff bf8e 	b.w	8001572 <i2cStop>

08001656 <i2c_read_reg>:
 8001656:	b538      	push	{r3, r4, r5, lr}
 8001658:	4604      	mov	r4, r0
 800165a:	460d      	mov	r5, r1
 800165c:	f7ff ff7a 	bl	8001554 <i2cStart>
 8001660:	4620      	mov	r0, r4
 8001662:	f7ff ff95 	bl	8001590 <i2cWrite>
 8001666:	4628      	mov	r0, r5
 8001668:	f7ff ff92 	bl	8001590 <i2cWrite>
 800166c:	f7ff ff72 	bl	8001554 <i2cStart>
 8001670:	f044 0001 	orr.w	r0, r4, #1
 8001674:	f7ff ff8c 	bl	8001590 <i2cWrite>
 8001678:	2000      	movs	r0, #0
 800167a:	f7ff ffb1 	bl	80015e0 <i2cRead>
 800167e:	4604      	mov	r4, r0
 8001680:	f7ff ff77 	bl	8001572 <i2cStop>
 8001684:	4620      	mov	r0, r4
 8001686:	bd38      	pop	{r3, r4, r5, pc}

08001688 <uart_write>:
 8001688:	4b03      	ldr	r3, [pc, #12]	; (8001698 <uart_write+0x10>)
 800168a:	881a      	ldrh	r2, [r3, #0]
 800168c:	0652      	lsls	r2, r2, #25
 800168e:	d401      	bmi.n	8001694 <uart_write+0xc>
 8001690:	bf00      	nop
 8001692:	e7f9      	b.n	8001688 <uart_write>
 8001694:	8098      	strh	r0, [r3, #4]
 8001696:	4770      	bx	lr
 8001698:	40011000 	.word	0x40011000

0800169c <uart_init>:
 800169c:	b530      	push	{r4, r5, lr}
 800169e:	2010      	movs	r0, #16
 80016a0:	b087      	sub	sp, #28
 80016a2:	2101      	movs	r1, #1
 80016a4:	f000 f9d8 	bl	8001a58 <RCC_APB2PeriphClockCmd>
 80016a8:	2001      	movs	r0, #1
 80016aa:	4d1c      	ldr	r5, [pc, #112]	; (800171c <uart_init+0x80>)
 80016ac:	4601      	mov	r1, r0
 80016ae:	f000 f9bb 	bl	8001a28 <RCC_AHB1PeriphClockCmd>
 80016b2:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 80016b6:	2400      	movs	r4, #0
 80016b8:	9300      	str	r3, [sp, #0]
 80016ba:	4628      	mov	r0, r5
 80016bc:	2302      	movs	r3, #2
 80016be:	4669      	mov	r1, sp
 80016c0:	f88d 3004 	strb.w	r3, [sp, #4]
 80016c4:	f88d 3005 	strb.w	r3, [sp, #5]
 80016c8:	f88d 4006 	strb.w	r4, [sp, #6]
 80016cc:	f88d 4007 	strb.w	r4, [sp, #7]
 80016d0:	f000 fa48 	bl	8001b64 <GPIO_Init>
 80016d4:	4628      	mov	r0, r5
 80016d6:	2109      	movs	r1, #9
 80016d8:	2207      	movs	r2, #7
 80016da:	f000 fa88 	bl	8001bee <GPIO_PinAFConfig>
 80016de:	2207      	movs	r2, #7
 80016e0:	4628      	mov	r0, r5
 80016e2:	210a      	movs	r1, #10
 80016e4:	f000 fa83 	bl	8001bee <GPIO_PinAFConfig>
 80016e8:	f8ad 400c 	strh.w	r4, [sp, #12]
 80016ec:	f8ad 400e 	strh.w	r4, [sp, #14]
 80016f0:	f8ad 4010 	strh.w	r4, [sp, #16]
 80016f4:	f8ad 4014 	strh.w	r4, [sp, #20]
 80016f8:	4c09      	ldr	r4, [pc, #36]	; (8001720 <uart_init+0x84>)
 80016fa:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 80016fe:	9302      	str	r3, [sp, #8]
 8001700:	4620      	mov	r0, r4
 8001702:	230c      	movs	r3, #12
 8001704:	a902      	add	r1, sp, #8
 8001706:	f8ad 3012 	strh.w	r3, [sp, #18]
 800170a:	f000 f80b 	bl	8001724 <USART_Init>
 800170e:	4620      	mov	r0, r4
 8001710:	2101      	movs	r1, #1
 8001712:	f000 f861 	bl	80017d8 <USART_Cmd>
 8001716:	b007      	add	sp, #28
 8001718:	bd30      	pop	{r4, r5, pc}
 800171a:	bf00      	nop
 800171c:	40020000 	.word	0x40020000
 8001720:	40011000 	.word	0x40011000

08001724 <USART_Init>:
 8001724:	8a03      	ldrh	r3, [r0, #16]
 8001726:	88ca      	ldrh	r2, [r1, #6]
 8001728:	b29b      	uxth	r3, r3
 800172a:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 800172e:	b530      	push	{r4, r5, lr}
 8001730:	4313      	orrs	r3, r2
 8001732:	460d      	mov	r5, r1
 8001734:	8203      	strh	r3, [r0, #16]
 8001736:	8983      	ldrh	r3, [r0, #12]
 8001738:	8909      	ldrh	r1, [r1, #8]
 800173a:	88aa      	ldrh	r2, [r5, #4]
 800173c:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8001740:	430a      	orrs	r2, r1
 8001742:	8969      	ldrh	r1, [r5, #10]
 8001744:	f023 030c 	bic.w	r3, r3, #12
 8001748:	430a      	orrs	r2, r1
 800174a:	041b      	lsls	r3, r3, #16
 800174c:	b292      	uxth	r2, r2
 800174e:	0c1b      	lsrs	r3, r3, #16
 8001750:	4313      	orrs	r3, r2
 8001752:	8183      	strh	r3, [r0, #12]
 8001754:	8a83      	ldrh	r3, [r0, #20]
 8001756:	89aa      	ldrh	r2, [r5, #12]
 8001758:	b29b      	uxth	r3, r3
 800175a:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 800175e:	4313      	orrs	r3, r2
 8001760:	b085      	sub	sp, #20
 8001762:	8283      	strh	r3, [r0, #20]
 8001764:	4604      	mov	r4, r0
 8001766:	4668      	mov	r0, sp
 8001768:	f000 f91a 	bl	80019a0 <RCC_GetClocksFreq>
 800176c:	4b19      	ldr	r3, [pc, #100]	; (80017d4 <USART_Init+0xb0>)
 800176e:	429c      	cmp	r4, r3
 8001770:	d003      	beq.n	800177a <USART_Init+0x56>
 8001772:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001776:	429c      	cmp	r4, r3
 8001778:	d101      	bne.n	800177e <USART_Init+0x5a>
 800177a:	9b03      	ldr	r3, [sp, #12]
 800177c:	e000      	b.n	8001780 <USART_Init+0x5c>
 800177e:	9b02      	ldr	r3, [sp, #8]
 8001780:	89a2      	ldrh	r2, [r4, #12]
 8001782:	b212      	sxth	r2, r2
 8001784:	2a00      	cmp	r2, #0
 8001786:	682a      	ldr	r2, [r5, #0]
 8001788:	f04f 0119 	mov.w	r1, #25
 800178c:	bfb4      	ite	lt
 800178e:	0052      	lsllt	r2, r2, #1
 8001790:	0092      	lslge	r2, r2, #2
 8001792:	4359      	muls	r1, r3
 8001794:	fbb1 f1f2 	udiv	r1, r1, r2
 8001798:	2364      	movs	r3, #100	; 0x64
 800179a:	fbb1 f2f3 	udiv	r2, r1, r3
 800179e:	0112      	lsls	r2, r2, #4
 80017a0:	0910      	lsrs	r0, r2, #4
 80017a2:	fb03 1110 	mls	r1, r3, r0, r1
 80017a6:	89a0      	ldrh	r0, [r4, #12]
 80017a8:	b200      	sxth	r0, r0
 80017aa:	2800      	cmp	r0, #0
 80017ac:	da06      	bge.n	80017bc <USART_Init+0x98>
 80017ae:	00c9      	lsls	r1, r1, #3
 80017b0:	3132      	adds	r1, #50	; 0x32
 80017b2:	fbb1 f3f3 	udiv	r3, r1, r3
 80017b6:	f003 0307 	and.w	r3, r3, #7
 80017ba:	e005      	b.n	80017c8 <USART_Init+0xa4>
 80017bc:	0109      	lsls	r1, r1, #4
 80017be:	3132      	adds	r1, #50	; 0x32
 80017c0:	fbb1 f3f3 	udiv	r3, r1, r3
 80017c4:	f003 030f 	and.w	r3, r3, #15
 80017c8:	431a      	orrs	r2, r3
 80017ca:	b292      	uxth	r2, r2
 80017cc:	8122      	strh	r2, [r4, #8]
 80017ce:	b005      	add	sp, #20
 80017d0:	bd30      	pop	{r4, r5, pc}
 80017d2:	bf00      	nop
 80017d4:	40011000 	.word	0x40011000

080017d8 <USART_Cmd>:
 80017d8:	8983      	ldrh	r3, [r0, #12]
 80017da:	b119      	cbz	r1, 80017e4 <USART_Cmd+0xc>
 80017dc:	b29b      	uxth	r3, r3
 80017de:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 80017e2:	e003      	b.n	80017ec <USART_Cmd+0x14>
 80017e4:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 80017e8:	041b      	lsls	r3, r3, #16
 80017ea:	0c1b      	lsrs	r3, r3, #16
 80017ec:	8183      	strh	r3, [r0, #12]
 80017ee:	4770      	bx	lr

080017f0 <sys_tick_init>:
 80017f0:	4b05      	ldr	r3, [pc, #20]	; (8001808 <sys_tick_init+0x18>)
 80017f2:	4a06      	ldr	r2, [pc, #24]	; (800180c <sys_tick_init+0x1c>)
 80017f4:	605a      	str	r2, [r3, #4]
 80017f6:	4a06      	ldr	r2, [pc, #24]	; (8001810 <sys_tick_init+0x20>)
 80017f8:	21f0      	movs	r1, #240	; 0xf0
 80017fa:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 80017fe:	2200      	movs	r2, #0
 8001800:	609a      	str	r2, [r3, #8]
 8001802:	2207      	movs	r2, #7
 8001804:	601a      	str	r2, [r3, #0]
 8001806:	4770      	bx	lr
 8001808:	e000e010 	.word	0xe000e010
 800180c:	00029040 	.word	0x00029040
 8001810:	e000ed00 	.word	0xe000ed00

08001814 <sleep>:
 8001814:	bf30      	wfi
 8001816:	4770      	bx	lr

08001818 <sytem_clock_init>:
 8001818:	f000 b800 	b.w	800181c <SystemInit>

0800181c <SystemInit>:
 800181c:	4b3b      	ldr	r3, [pc, #236]	; (800190c <SystemInit+0xf0>)
 800181e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001822:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001826:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800182a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800182e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001832:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001836:	4b36      	ldr	r3, [pc, #216]	; (8001910 <SystemInit+0xf4>)
 8001838:	681a      	ldr	r2, [r3, #0]
 800183a:	f042 0201 	orr.w	r2, r2, #1
 800183e:	601a      	str	r2, [r3, #0]
 8001840:	2200      	movs	r2, #0
 8001842:	609a      	str	r2, [r3, #8]
 8001844:	6819      	ldr	r1, [r3, #0]
 8001846:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 800184a:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 800184e:	6019      	str	r1, [r3, #0]
 8001850:	4930      	ldr	r1, [pc, #192]	; (8001914 <SystemInit+0xf8>)
 8001852:	6059      	str	r1, [r3, #4]
 8001854:	6819      	ldr	r1, [r3, #0]
 8001856:	b082      	sub	sp, #8
 8001858:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 800185c:	6019      	str	r1, [r3, #0]
 800185e:	60da      	str	r2, [r3, #12]
 8001860:	9200      	str	r2, [sp, #0]
 8001862:	9201      	str	r2, [sp, #4]
 8001864:	681a      	ldr	r2, [r3, #0]
 8001866:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 800186a:	601a      	str	r2, [r3, #0]
 800186c:	4b28      	ldr	r3, [pc, #160]	; (8001910 <SystemInit+0xf4>)
 800186e:	681a      	ldr	r2, [r3, #0]
 8001870:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8001874:	9201      	str	r2, [sp, #4]
 8001876:	9a00      	ldr	r2, [sp, #0]
 8001878:	3201      	adds	r2, #1
 800187a:	9200      	str	r2, [sp, #0]
 800187c:	9a01      	ldr	r2, [sp, #4]
 800187e:	b91a      	cbnz	r2, 8001888 <SystemInit+0x6c>
 8001880:	9a00      	ldr	r2, [sp, #0]
 8001882:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 8001886:	d1f1      	bne.n	800186c <SystemInit+0x50>
 8001888:	681b      	ldr	r3, [r3, #0]
 800188a:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 800188e:	bf18      	it	ne
 8001890:	2301      	movne	r3, #1
 8001892:	9301      	str	r3, [sp, #4]
 8001894:	9b01      	ldr	r3, [sp, #4]
 8001896:	2b01      	cmp	r3, #1
 8001898:	d005      	beq.n	80018a6 <SystemInit+0x8a>
 800189a:	4b1c      	ldr	r3, [pc, #112]	; (800190c <SystemInit+0xf0>)
 800189c:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 80018a0:	609a      	str	r2, [r3, #8]
 80018a2:	b002      	add	sp, #8
 80018a4:	4770      	bx	lr
 80018a6:	4b1a      	ldr	r3, [pc, #104]	; (8001910 <SystemInit+0xf4>)
 80018a8:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80018aa:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 80018ae:	641a      	str	r2, [r3, #64]	; 0x40
 80018b0:	4a19      	ldr	r2, [pc, #100]	; (8001918 <SystemInit+0xfc>)
 80018b2:	6811      	ldr	r1, [r2, #0]
 80018b4:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 80018b8:	6011      	str	r1, [r2, #0]
 80018ba:	689a      	ldr	r2, [r3, #8]
 80018bc:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 80018c0:	609a      	str	r2, [r3, #8]
 80018c2:	689a      	ldr	r2, [r3, #8]
 80018c4:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 80018c8:	609a      	str	r2, [r3, #8]
 80018ca:	689a      	ldr	r2, [r3, #8]
 80018cc:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 80018d0:	609a      	str	r2, [r3, #8]
 80018d2:	4a12      	ldr	r2, [pc, #72]	; (800191c <SystemInit+0x100>)
 80018d4:	605a      	str	r2, [r3, #4]
 80018d6:	681a      	ldr	r2, [r3, #0]
 80018d8:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 80018dc:	601a      	str	r2, [r3, #0]
 80018de:	6819      	ldr	r1, [r3, #0]
 80018e0:	4a0b      	ldr	r2, [pc, #44]	; (8001910 <SystemInit+0xf4>)
 80018e2:	0189      	lsls	r1, r1, #6
 80018e4:	d5fb      	bpl.n	80018de <SystemInit+0xc2>
 80018e6:	4b0e      	ldr	r3, [pc, #56]	; (8001920 <SystemInit+0x104>)
 80018e8:	f240 6105 	movw	r1, #1541	; 0x605
 80018ec:	6019      	str	r1, [r3, #0]
 80018ee:	6893      	ldr	r3, [r2, #8]
 80018f0:	f023 0303 	bic.w	r3, r3, #3
 80018f4:	6093      	str	r3, [r2, #8]
 80018f6:	6893      	ldr	r3, [r2, #8]
 80018f8:	f043 0302 	orr.w	r3, r3, #2
 80018fc:	6093      	str	r3, [r2, #8]
 80018fe:	4b04      	ldr	r3, [pc, #16]	; (8001910 <SystemInit+0xf4>)
 8001900:	689b      	ldr	r3, [r3, #8]
 8001902:	f003 030c 	and.w	r3, r3, #12
 8001906:	2b08      	cmp	r3, #8
 8001908:	d1f9      	bne.n	80018fe <SystemInit+0xe2>
 800190a:	e7c6      	b.n	800189a <SystemInit+0x7e>
 800190c:	e000ed00 	.word	0xe000ed00
 8001910:	40023800 	.word	0x40023800
 8001914:	24003010 	.word	0x24003010
 8001918:	40007000 	.word	0x40007000
 800191c:	07405408 	.word	0x07405408
 8001920:	40023c00 	.word	0x40023c00

08001924 <Default_Handler>:
 8001924:	4668      	mov	r0, sp
 8001926:	f020 0107 	bic.w	r1, r0, #7
 800192a:	468d      	mov	sp, r1
 800192c:	bf00      	nop
 800192e:	e7fd      	b.n	800192c <Default_Handler+0x8>

08001930 <HardFault_Handler>:
 8001930:	2010      	movs	r0, #16
 8001932:	f000 f8ab 	bl	8001a8c <led_on>
 8001936:	4b06      	ldr	r3, [pc, #24]	; (8001950 <HardFault_Handler+0x20>)
 8001938:	3b01      	subs	r3, #1
 800193a:	d001      	beq.n	8001940 <HardFault_Handler+0x10>
 800193c:	bf00      	nop
 800193e:	e7fb      	b.n	8001938 <HardFault_Handler+0x8>
 8001940:	2010      	movs	r0, #16
 8001942:	f000 f8ab 	bl	8001a9c <led_off>
 8001946:	4b02      	ldr	r3, [pc, #8]	; (8001950 <HardFault_Handler+0x20>)
 8001948:	3b01      	subs	r3, #1
 800194a:	d0f1      	beq.n	8001930 <HardFault_Handler>
 800194c:	bf00      	nop
 800194e:	e7fb      	b.n	8001948 <HardFault_Handler+0x18>
 8001950:	00989681 	.word	0x00989681

08001954 <_reset_init>:
 8001954:	4a0e      	ldr	r2, [pc, #56]	; (8001990 <_reset_init+0x3c>)
 8001956:	480f      	ldr	r0, [pc, #60]	; (8001994 <_reset_init+0x40>)
 8001958:	1a80      	subs	r0, r0, r2
 800195a:	1080      	asrs	r0, r0, #2
 800195c:	2300      	movs	r3, #0
 800195e:	4283      	cmp	r3, r0
 8001960:	d006      	beq.n	8001970 <_reset_init+0x1c>
 8001962:	490d      	ldr	r1, [pc, #52]	; (8001998 <_reset_init+0x44>)
 8001964:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8001968:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 800196c:	3301      	adds	r3, #1
 800196e:	e7f6      	b.n	800195e <_reset_init+0xa>
 8001970:	4b0a      	ldr	r3, [pc, #40]	; (800199c <_reset_init+0x48>)
 8001972:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001976:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800197a:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800197e:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8001982:	685a      	ldr	r2, [r3, #4]
 8001984:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8001988:	605a      	str	r2, [r3, #4]
 800198a:	f7fe bea1 	b.w	80006d0 <main>
 800198e:	bf00      	nop
 8001990:	20000000 	.word	0x20000000
 8001994:	20000014 	.word	0x20000014
 8001998:	08001e68 	.word	0x08001e68
 800199c:	e000ed00 	.word	0xe000ed00

080019a0 <RCC_GetClocksFreq>:
 80019a0:	4b1d      	ldr	r3, [pc, #116]	; (8001a18 <RCC_GetClocksFreq+0x78>)
 80019a2:	689a      	ldr	r2, [r3, #8]
 80019a4:	f002 020c 	and.w	r2, r2, #12
 80019a8:	2a04      	cmp	r2, #4
 80019aa:	b510      	push	{r4, lr}
 80019ac:	d003      	beq.n	80019b6 <RCC_GetClocksFreq+0x16>
 80019ae:	2a08      	cmp	r2, #8
 80019b0:	d003      	beq.n	80019ba <RCC_GetClocksFreq+0x1a>
 80019b2:	4b1a      	ldr	r3, [pc, #104]	; (8001a1c <RCC_GetClocksFreq+0x7c>)
 80019b4:	e018      	b.n	80019e8 <RCC_GetClocksFreq+0x48>
 80019b6:	4b1a      	ldr	r3, [pc, #104]	; (8001a20 <RCC_GetClocksFreq+0x80>)
 80019b8:	e016      	b.n	80019e8 <RCC_GetClocksFreq+0x48>
 80019ba:	6859      	ldr	r1, [r3, #4]
 80019bc:	685a      	ldr	r2, [r3, #4]
 80019be:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 80019c2:	6859      	ldr	r1, [r3, #4]
 80019c4:	bf14      	ite	ne
 80019c6:	4b16      	ldrne	r3, [pc, #88]	; (8001a20 <RCC_GetClocksFreq+0x80>)
 80019c8:	4b14      	ldreq	r3, [pc, #80]	; (8001a1c <RCC_GetClocksFreq+0x7c>)
 80019ca:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 80019ce:	fbb3 f3f2 	udiv	r3, r3, r2
 80019d2:	4a11      	ldr	r2, [pc, #68]	; (8001a18 <RCC_GetClocksFreq+0x78>)
 80019d4:	6852      	ldr	r2, [r2, #4]
 80019d6:	f3c2 4201 	ubfx	r2, r2, #16, #2
 80019da:	f3c1 1188 	ubfx	r1, r1, #6, #9
 80019de:	3201      	adds	r2, #1
 80019e0:	434b      	muls	r3, r1
 80019e2:	0052      	lsls	r2, r2, #1
 80019e4:	fbb3 f3f2 	udiv	r3, r3, r2
 80019e8:	490b      	ldr	r1, [pc, #44]	; (8001a18 <RCC_GetClocksFreq+0x78>)
 80019ea:	6003      	str	r3, [r0, #0]
 80019ec:	688b      	ldr	r3, [r1, #8]
 80019ee:	4a0d      	ldr	r2, [pc, #52]	; (8001a24 <RCC_GetClocksFreq+0x84>)
 80019f0:	f3c3 1303 	ubfx	r3, r3, #4, #4
 80019f4:	5cd4      	ldrb	r4, [r2, r3]
 80019f6:	6803      	ldr	r3, [r0, #0]
 80019f8:	40e3      	lsrs	r3, r4
 80019fa:	6043      	str	r3, [r0, #4]
 80019fc:	688c      	ldr	r4, [r1, #8]
 80019fe:	f3c4 2482 	ubfx	r4, r4, #10, #3
 8001a02:	5d14      	ldrb	r4, [r2, r4]
 8001a04:	fa23 f404 	lsr.w	r4, r3, r4
 8001a08:	6084      	str	r4, [r0, #8]
 8001a0a:	6889      	ldr	r1, [r1, #8]
 8001a0c:	f3c1 3142 	ubfx	r1, r1, #13, #3
 8001a10:	5c52      	ldrb	r2, [r2, r1]
 8001a12:	40d3      	lsrs	r3, r2
 8001a14:	60c3      	str	r3, [r0, #12]
 8001a16:	bd10      	pop	{r4, pc}
 8001a18:	40023800 	.word	0x40023800
 8001a1c:	00f42400 	.word	0x00f42400
 8001a20:	007a1200 	.word	0x007a1200
 8001a24:	20000004 	.word	0x20000004

08001a28 <RCC_AHB1PeriphClockCmd>:
 8001a28:	4b04      	ldr	r3, [pc, #16]	; (8001a3c <RCC_AHB1PeriphClockCmd+0x14>)
 8001a2a:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8001a2c:	b109      	cbz	r1, 8001a32 <RCC_AHB1PeriphClockCmd+0xa>
 8001a2e:	4310      	orrs	r0, r2
 8001a30:	e001      	b.n	8001a36 <RCC_AHB1PeriphClockCmd+0xe>
 8001a32:	ea22 0000 	bic.w	r0, r2, r0
 8001a36:	6318      	str	r0, [r3, #48]	; 0x30
 8001a38:	4770      	bx	lr
 8001a3a:	bf00      	nop
 8001a3c:	40023800 	.word	0x40023800

08001a40 <RCC_APB1PeriphClockCmd>:
 8001a40:	4b04      	ldr	r3, [pc, #16]	; (8001a54 <RCC_APB1PeriphClockCmd+0x14>)
 8001a42:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8001a44:	b109      	cbz	r1, 8001a4a <RCC_APB1PeriphClockCmd+0xa>
 8001a46:	4310      	orrs	r0, r2
 8001a48:	e001      	b.n	8001a4e <RCC_APB1PeriphClockCmd+0xe>
 8001a4a:	ea22 0000 	bic.w	r0, r2, r0
 8001a4e:	6418      	str	r0, [r3, #64]	; 0x40
 8001a50:	4770      	bx	lr
 8001a52:	bf00      	nop
 8001a54:	40023800 	.word	0x40023800

08001a58 <RCC_APB2PeriphClockCmd>:
 8001a58:	4b04      	ldr	r3, [pc, #16]	; (8001a6c <RCC_APB2PeriphClockCmd+0x14>)
 8001a5a:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8001a5c:	b109      	cbz	r1, 8001a62 <RCC_APB2PeriphClockCmd+0xa>
 8001a5e:	4310      	orrs	r0, r2
 8001a60:	e001      	b.n	8001a66 <RCC_APB2PeriphClockCmd+0xe>
 8001a62:	ea22 0000 	bic.w	r0, r2, r0
 8001a66:	6458      	str	r0, [r3, #68]	; 0x44
 8001a68:	4770      	bx	lr
 8001a6a:	bf00      	nop
 8001a6c:	40023800 	.word	0x40023800

08001a70 <lib_low_level_init>:
 8001a70:	b508      	push	{r3, lr}
 8001a72:	f7ff fed1 	bl	8001818 <sytem_clock_init>
 8001a76:	f000 f819 	bl	8001aac <gpio_init>
 8001a7a:	f7ff fe0f 	bl	800169c <uart_init>
 8001a7e:	f7ff fc73 	bl	8001368 <timer_init>
 8001a82:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001a86:	f7ff bd43 	b.w	8001510 <i2c_0_init>
	...

08001a8c <led_on>:
 8001a8c:	b672      	cpsid	i
 8001a8e:	4b02      	ldr	r3, [pc, #8]	; (8001a98 <led_on+0xc>)
 8001a90:	b280      	uxth	r0, r0
 8001a92:	8318      	strh	r0, [r3, #24]
 8001a94:	b662      	cpsie	i
 8001a96:	4770      	bx	lr
 8001a98:	40020400 	.word	0x40020400

08001a9c <led_off>:
 8001a9c:	b672      	cpsid	i
 8001a9e:	4b02      	ldr	r3, [pc, #8]	; (8001aa8 <led_off+0xc>)
 8001aa0:	b280      	uxth	r0, r0
 8001aa2:	8358      	strh	r0, [r3, #26]
 8001aa4:	b662      	cpsie	i
 8001aa6:	4770      	bx	lr
 8001aa8:	40020400 	.word	0x40020400

08001aac <gpio_init>:
 8001aac:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001aae:	2001      	movs	r0, #1
 8001ab0:	4601      	mov	r1, r0
 8001ab2:	f7ff ffb9 	bl	8001a28 <RCC_AHB1PeriphClockCmd>
 8001ab6:	2002      	movs	r0, #2
 8001ab8:	2101      	movs	r1, #1
 8001aba:	f7ff ffb5 	bl	8001a28 <RCC_AHB1PeriphClockCmd>
 8001abe:	2004      	movs	r0, #4
 8001ac0:	2101      	movs	r1, #1
 8001ac2:	f7ff ffb1 	bl	8001a28 <RCC_AHB1PeriphClockCmd>
 8001ac6:	2008      	movs	r0, #8
 8001ac8:	2101      	movs	r1, #1
 8001aca:	f7ff ffad 	bl	8001a28 <RCC_AHB1PeriphClockCmd>
 8001ace:	2008      	movs	r0, #8
 8001ad0:	2101      	movs	r1, #1
 8001ad2:	f7ff ffa9 	bl	8001a28 <RCC_AHB1PeriphClockCmd>
 8001ad6:	2010      	movs	r0, #16
 8001ad8:	2101      	movs	r1, #1
 8001ada:	f7ff ffa5 	bl	8001a28 <RCC_AHB1PeriphClockCmd>
 8001ade:	2020      	movs	r0, #32
 8001ae0:	2101      	movs	r1, #1
 8001ae2:	f7ff ffa1 	bl	8001a28 <RCC_AHB1PeriphClockCmd>
 8001ae6:	2400      	movs	r4, #0
 8001ae8:	2601      	movs	r6, #1
 8001aea:	2370      	movs	r3, #112	; 0x70
 8001aec:	2703      	movs	r7, #3
 8001aee:	4669      	mov	r1, sp
 8001af0:	4819      	ldr	r0, [pc, #100]	; (8001b58 <gpio_init+0xac>)
 8001af2:	9300      	str	r3, [sp, #0]
 8001af4:	f88d 4006 	strb.w	r4, [sp, #6]
 8001af8:	f88d 4007 	strb.w	r4, [sp, #7]
 8001afc:	f88d 6004 	strb.w	r6, [sp, #4]
 8001b00:	f88d 7005 	strb.w	r7, [sp, #5]
 8001b04:	f000 f82e 	bl	8001b64 <GPIO_Init>
 8001b08:	2302      	movs	r3, #2
 8001b0a:	4669      	mov	r1, sp
 8001b0c:	4813      	ldr	r0, [pc, #76]	; (8001b5c <gpio_init+0xb0>)
 8001b0e:	f88d 3005 	strb.w	r3, [sp, #5]
 8001b12:	f88d 4004 	strb.w	r4, [sp, #4]
 8001b16:	9600      	str	r6, [sp, #0]
 8001b18:	f000 f824 	bl	8001b64 <GPIO_Init>
 8001b1c:	f88d 4006 	strb.w	r4, [sp, #6]
 8001b20:	f88d 4007 	strb.w	r4, [sp, #7]
 8001b24:	4c0e      	ldr	r4, [pc, #56]	; (8001b60 <gpio_init+0xb4>)
 8001b26:	f88d 6004 	strb.w	r6, [sp, #4]
 8001b2a:	2520      	movs	r5, #32
 8001b2c:	4620      	mov	r0, r4
 8001b2e:	4669      	mov	r1, sp
 8001b30:	9500      	str	r5, [sp, #0]
 8001b32:	f88d 7005 	strb.w	r7, [sp, #5]
 8001b36:	f000 f815 	bl	8001b64 <GPIO_Init>
 8001b3a:	4629      	mov	r1, r5
 8001b3c:	4620      	mov	r0, r4
 8001b3e:	f000 f852 	bl	8001be6 <GPIO_SetBits>
 8001b42:	2010      	movs	r0, #16
 8001b44:	f7ff ffaa 	bl	8001a9c <led_off>
 8001b48:	4628      	mov	r0, r5
 8001b4a:	f7ff ffa7 	bl	8001a9c <led_off>
 8001b4e:	2040      	movs	r0, #64	; 0x40
 8001b50:	f7ff ffa4 	bl	8001a9c <led_off>
 8001b54:	b003      	add	sp, #12
 8001b56:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001b58:	40020400 	.word	0x40020400
 8001b5c:	40020000 	.word	0x40020000
 8001b60:	40020800 	.word	0x40020800

08001b64 <GPIO_Init>:
 8001b64:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8001b68:	680f      	ldr	r7, [r1, #0]
 8001b6a:	2300      	movs	r3, #0
 8001b6c:	2201      	movs	r2, #1
 8001b6e:	409a      	lsls	r2, r3
 8001b70:	ea02 0507 	and.w	r5, r2, r7
 8001b74:	4295      	cmp	r5, r2
 8001b76:	d131      	bne.n	8001bdc <GPIO_Init+0x78>
 8001b78:	005a      	lsls	r2, r3, #1
 8001b7a:	2403      	movs	r4, #3
 8001b7c:	6806      	ldr	r6, [r0, #0]
 8001b7e:	4094      	lsls	r4, r2
 8001b80:	43e4      	mvns	r4, r4
 8001b82:	4026      	ands	r6, r4
 8001b84:	6006      	str	r6, [r0, #0]
 8001b86:	790e      	ldrb	r6, [r1, #4]
 8001b88:	f8d0 c000 	ldr.w	ip, [r0]
 8001b8c:	fa06 f802 	lsl.w	r8, r6, r2
 8001b90:	3e01      	subs	r6, #1
 8001b92:	b2f6      	uxtb	r6, r6
 8001b94:	ea48 0c0c 	orr.w	ip, r8, ip
 8001b98:	2e01      	cmp	r6, #1
 8001b9a:	f8c0 c000 	str.w	ip, [r0]
 8001b9e:	d814      	bhi.n	8001bca <GPIO_Init+0x66>
 8001ba0:	6886      	ldr	r6, [r0, #8]
 8001ba2:	f891 c005 	ldrb.w	ip, [r1, #5]
 8001ba6:	4026      	ands	r6, r4
 8001ba8:	6086      	str	r6, [r0, #8]
 8001baa:	6886      	ldr	r6, [r0, #8]
 8001bac:	fa0c fc02 	lsl.w	ip, ip, r2
 8001bb0:	ea4c 0606 	orr.w	r6, ip, r6
 8001bb4:	6086      	str	r6, [r0, #8]
 8001bb6:	6846      	ldr	r6, [r0, #4]
 8001bb8:	ea26 0505 	bic.w	r5, r6, r5
 8001bbc:	6045      	str	r5, [r0, #4]
 8001bbe:	798d      	ldrb	r5, [r1, #6]
 8001bc0:	6846      	ldr	r6, [r0, #4]
 8001bc2:	409d      	lsls	r5, r3
 8001bc4:	b2ad      	uxth	r5, r5
 8001bc6:	4335      	orrs	r5, r6
 8001bc8:	6045      	str	r5, [r0, #4]
 8001bca:	68c5      	ldr	r5, [r0, #12]
 8001bcc:	402c      	ands	r4, r5
 8001bce:	60c4      	str	r4, [r0, #12]
 8001bd0:	79cd      	ldrb	r5, [r1, #7]
 8001bd2:	68c4      	ldr	r4, [r0, #12]
 8001bd4:	fa05 f202 	lsl.w	r2, r5, r2
 8001bd8:	4322      	orrs	r2, r4
 8001bda:	60c2      	str	r2, [r0, #12]
 8001bdc:	3301      	adds	r3, #1
 8001bde:	2b10      	cmp	r3, #16
 8001be0:	d1c4      	bne.n	8001b6c <GPIO_Init+0x8>
 8001be2:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

08001be6 <GPIO_SetBits>:
 8001be6:	8301      	strh	r1, [r0, #24]
 8001be8:	4770      	bx	lr

08001bea <GPIO_ResetBits>:
 8001bea:	8341      	strh	r1, [r0, #26]
 8001bec:	4770      	bx	lr

08001bee <GPIO_PinAFConfig>:
 8001bee:	f001 0307 	and.w	r3, r1, #7
 8001bf2:	08c9      	lsrs	r1, r1, #3
 8001bf4:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8001bf8:	b510      	push	{r4, lr}
 8001bfa:	009b      	lsls	r3, r3, #2
 8001bfc:	6a04      	ldr	r4, [r0, #32]
 8001bfe:	210f      	movs	r1, #15
 8001c00:	4099      	lsls	r1, r3
 8001c02:	ea24 0101 	bic.w	r1, r4, r1
 8001c06:	6201      	str	r1, [r0, #32]
 8001c08:	6a01      	ldr	r1, [r0, #32]
 8001c0a:	409a      	lsls	r2, r3
 8001c0c:	4311      	orrs	r1, r2
 8001c0e:	6201      	str	r1, [r0, #32]
 8001c10:	bd10      	pop	{r4, pc}
	...

08001c14 <NVIC_Init>:
 8001c14:	78c2      	ldrb	r2, [r0, #3]
 8001c16:	7803      	ldrb	r3, [r0, #0]
 8001c18:	b510      	push	{r4, lr}
 8001c1a:	b30a      	cbz	r2, 8001c60 <NVIC_Init+0x4c>
 8001c1c:	4a16      	ldr	r2, [pc, #88]	; (8001c78 <NVIC_Init+0x64>)
 8001c1e:	7844      	ldrb	r4, [r0, #1]
 8001c20:	68d2      	ldr	r2, [r2, #12]
 8001c22:	43d2      	mvns	r2, r2
 8001c24:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001c28:	f1c2 0104 	rsb	r1, r2, #4
 8001c2c:	b2c9      	uxtb	r1, r1
 8001c2e:	fa04 f101 	lsl.w	r1, r4, r1
 8001c32:	240f      	movs	r4, #15
 8001c34:	fa44 f202 	asr.w	r2, r4, r2
 8001c38:	7884      	ldrb	r4, [r0, #2]
 8001c3a:	b2c9      	uxtb	r1, r1
 8001c3c:	4022      	ands	r2, r4
 8001c3e:	430a      	orrs	r2, r1
 8001c40:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8001c44:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001c48:	0112      	lsls	r2, r2, #4
 8001c4a:	b2d2      	uxtb	r2, r2
 8001c4c:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8001c50:	7803      	ldrb	r3, [r0, #0]
 8001c52:	2201      	movs	r2, #1
 8001c54:	0959      	lsrs	r1, r3, #5
 8001c56:	f003 031f 	and.w	r3, r3, #31
 8001c5a:	fa02 f303 	lsl.w	r3, r2, r3
 8001c5e:	e006      	b.n	8001c6e <NVIC_Init+0x5a>
 8001c60:	0959      	lsrs	r1, r3, #5
 8001c62:	2201      	movs	r2, #1
 8001c64:	f003 031f 	and.w	r3, r3, #31
 8001c68:	fa02 f303 	lsl.w	r3, r2, r3
 8001c6c:	3120      	adds	r1, #32
 8001c6e:	4a03      	ldr	r2, [pc, #12]	; (8001c7c <NVIC_Init+0x68>)
 8001c70:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8001c74:	bd10      	pop	{r4, pc}
 8001c76:	bf00      	nop
 8001c78:	e000ed00 	.word	0xe000ed00
 8001c7c:	e000e100 	.word	0xe000e100

08001c80 <_init>:
 8001c80:	e1a0c00d 	mov	ip, sp
 8001c84:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001c88:	e24cb004 	sub	fp, ip, #4
 8001c8c:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001c90:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001c94:	e12fff1e 	bx	lr

08001c98 <_fini>:
 8001c98:	e1a0c00d 	mov	ip, sp
 8001c9c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001ca0:	e24cb004 	sub	fp, ip, #4
 8001ca4:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001ca8:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001cac:	e12fff1e 	bx	lr
 8001cb0:	69647473 	.word	0x69647473
 8001cb4:	6e69206f 	.word	0x6e69206f
 8001cb8:	64207469 	.word	0x64207469
 8001cbc:	0a656e6f 	.word	0x0a656e6f
 8001cc0:	00          	.byte	0x00
 8001cc1:	62          	.byte	0x62
 8001cc2:	6f6f      	.short	0x6f6f
 8001cc4:	676e6974 	.word	0x676e6974
 8001cc8:	6f726620 	.word	0x6f726620
 8001ccc:	7525206d 	.word	0x7525206d
 8001cd0:	6172000a 	.word	0x6172000a
 8001cd4:	7473206d 	.word	0x7473206d
 8001cd8:	20747261 	.word	0x20747261
 8001cdc:	0a207525 	.word	0x0a207525
 8001ce0:	6d617200 	.word	0x6d617200
 8001ce4:	7a697320 	.word	0x7a697320
 8001ce8:	75252065 	.word	0x75252065
 8001cec:	72000a20 	.word	0x72000a20
 8001cf0:	66206d61 	.word	0x66206d61
 8001cf4:	20656572 	.word	0x20656572
 8001cf8:	0a207525 	.word	0x0a207525
 8001cfc:	61656800 	.word	0x61656800
 8001d00:	74732070 	.word	0x74732070
 8001d04:	20747261 	.word	0x20747261
 8001d08:	0a207525 	.word	0x0a207525
 8001d0c:	00          	.byte	0x00
 8001d0d:	72          	.byte	0x72
 8001d0e:	626f      	.short	0x626f
 8001d10:	6520746f 	.word	0x6520746f
 8001d14:	726f7272 	.word	0x726f7272
 8001d18:	3a732520 	.word	0x3a732520
 8001d1c:	000a7525 	.word	0x000a7525
 8001d20:	5f62696c 	.word	0x5f62696c
 8001d24:	2f727375 	.word	0x2f727375
 8001d28:	69726561 	.word	0x69726561
 8001d2c:	6f725f73 	.word	0x6f725f73
 8001d30:	2f746f62 	.word	0x2f746f62
 8001d34:	69726561 	.word	0x69726561
 8001d38:	6f725f73 	.word	0x6f725f73
 8001d3c:	2e746f62 	.word	0x2e746f62
 8001d40:	205b0063 	.word	0x205b0063
 8001d44:	25206925 	.word	0x25206925
 8001d48:	69252069 	.word	0x69252069
 8001d4c:	00205d20 	.word	0x00205d20
 8001d50:	6925203e 	.word	0x6925203e
 8001d54:	3e3e3e20 	.word	0x3e3e3e20
 8001d58:	2069253e 	.word	0x2069253e
 8001d5c:	205b003c 	.word	0x205b003c
 8001d60:	25206925 	.word	0x25206925
 8001d64:	69252069 	.word	0x69252069
 8001d68:	5d692520 	.word	0x5d692520
 8001d6c:	2d000a20 	.word	0x2d000a20
 8001d70:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d74:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d78:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d7c:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d80:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d84:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d88:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d8c:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d90:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d94:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d98:	2d2d2d2d 	.word	0x2d2d2d2d
 8001d9c:	2d2d2d2d 	.word	0x2d2d2d2d
 8001da0:	0a2d2d2d 	.word	0x0a2d2d2d
 8001da4:	000a      	.short	0x000a
 8001da6:	6e61      	.short	0x6e61
 8001da8:	6568746f 	.word	0x6568746f
 8001dac:	68632072 	.word	0x68632072
 8001db0:	20646c69 	.word	0x20646c69
 8001db4:	65726874 	.word	0x65726874
 8001db8:	202c6461 	.word	0x202c6461
 8001dbc:	20736572 	.word	0x20736572
 8001dc0:	000a7525 	.word	0x000a7525
 8001dc4:	65726874 	.word	0x65726874
 8001dc8:	31206461 	.word	0x31206461
 8001dcc:	7263000a 	.word	0x7263000a
 8001dd0:	69746165 	.word	0x69746165
 8001dd4:	6320676e 	.word	0x6320676e
 8001dd8:	646c6968 	.word	0x646c6968
 8001ddc:	72687420 	.word	0x72687420
 8001de0:	0a646165 	.word	0x0a646165
 8001de4:	72687400 	.word	0x72687400
 8001de8:	20646165 	.word	0x20646165
 8001dec:	61657263 	.word	0x61657263
 8001df0:	676e6974 	.word	0x676e6974
 8001df4:	72726520 	.word	0x72726520
 8001df8:	000a726f 	.word	0x000a726f
 8001dfc:	74696177 	.word	0x74696177
 8001e00:	20676e69 	.word	0x20676e69
 8001e04:	20726f66 	.word	0x20726f66
 8001e08:	65726874 	.word	0x65726874
 8001e0c:	25206461 	.word	0x25206461
 8001e10:	6f642075 	.word	0x6f642075
 8001e14:	000a656e 	.word	0x000a656e
 8001e18:	69726570 	.word	0x69726570
 8001e1c:	6369646f 	.word	0x6369646f
 8001e20:	72687420 	.word	0x72687420
 8001e24:	0a646165 	.word	0x0a646165
 8001e28:	65770a00 	.word	0x65770a00
 8001e2c:	6d6f636c 	.word	0x6d6f636c
 8001e30:	6f742065 	.word	0x6f742065
 8001e34:	7a755320 	.word	0x7a755320
 8001e38:	4f616875 	.word	0x4f616875
 8001e3c:	5f5e2053 	.word	0x5f5e2053
 8001e40:	2e32205e 	.word	0x2e32205e
 8001e44:	0a302e32 	.word	0x0a302e32
 8001e48:	4c495542 	.word	0x4c495542
 8001e4c:	65532044 	.word	0x65532044
 8001e50:	33322070 	.word	0x33322070
 8001e54:	31303220 	.word	0x31303220
 8001e58:	39302035 	.word	0x39302035
 8001e5c:	3a38323a 	.word	0x3a38323a
 8001e60:	000a3731 	.word	0x000a3731

08001e64 <__EH_FRAME_BEGIN__>:
 8001e64:	00000000                                ....
