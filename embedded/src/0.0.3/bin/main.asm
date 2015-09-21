
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
 80001aa:	f001 f92f 	bl	800140c <sleep>
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
 8000282:	f001 f8b1 	bl	80013e8 <sys_tick_init>
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
 80003dc:	20000628 	.word	0x20000628
 80003e0:	200000f8 	.word	0x200000f8
 80003e4:	200000fc 	.word	0x200000fc

080003e8 <putc_>:
 80003e8:	b538      	push	{r3, r4, r5, lr}
 80003ea:	4c06      	ldr	r4, [pc, #24]	; (8000404 <putc_+0x1c>)
 80003ec:	4605      	mov	r5, r0
 80003ee:	4620      	mov	r0, r4
 80003f0:	f000 f912 	bl	8000618 <mutex_lock>
 80003f4:	4628      	mov	r0, r5
 80003f6:	f000 ff43 	bl	8001280 <uart_write>
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
 80005cc:	080018a8 	.word	0x080018a8

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
 80006ac:	080018b9 	.word	0x080018b9
 80006b0:	08001878 	.word	0x08001878
 80006b4:	080018ca 	.word	0x080018ca
 80006b8:	080018d9 	.word	0x080018d9
 80006bc:	20000628 	.word	0x20000628
 80006c0:	080018e7 	.word	0x080018e7
 80006c4:	080018f5 	.word	0x080018f5
 80006c8:	20000628 	.word	0x20000628
 80006cc:	0800199b 	.word	0x0800199b

080006d0 <main>:
 80006d0:	b508      	push	{r3, lr}
 80006d2:	f000 ffc9 	bl	8001668 <lib_low_level_init>
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
 80006f8:	08000d5d 	.word	0x08000d5d

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
 8000736:	68e3      	ldr	r3, [r4, #12]
 8000738:	6927      	ldr	r7, [r4, #16]
 800073a:	4829      	ldr	r0, [pc, #164]	; (80007e0 <aeris_set_motors+0xe4>)
 800073c:	ea83 78e3 	eor.w	r8, r3, r3, asr #31
 8000740:	eba8 78e3 	sub.w	r8, r8, r3, asr #31
 8000744:	2f00      	cmp	r7, #0
 8000746:	bfb8      	it	lt
 8000748:	427f      	neglt	r7, r7
 800074a:	2b00      	cmp	r3, #0
 800074c:	f04f 0104 	mov.w	r1, #4
 8000750:	dd02      	ble.n	8000758 <aeris_set_motors+0x5c>
 8000752:	f001 f844 	bl	80017de <GPIO_SetBits>
 8000756:	e001      	b.n	800075c <aeris_set_motors+0x60>
 8000758:	f001 f843 	bl	80017e2 <GPIO_ResetBits>
 800075c:	6923      	ldr	r3, [r4, #16]
 800075e:	4820      	ldr	r0, [pc, #128]	; (80007e0 <aeris_set_motors+0xe4>)
 8000760:	2b00      	cmp	r3, #0
 8000762:	f04f 0108 	mov.w	r1, #8
 8000766:	dd02      	ble.n	800076e <aeris_set_motors+0x72>
 8000768:	f001 f839 	bl	80017de <GPIO_SetBits>
 800076c:	e001      	b.n	8000772 <aeris_set_motors+0x76>
 800076e:	f001 f838 	bl	80017e2 <GPIO_ResetBits>
 8000772:	2370      	movs	r3, #112	; 0x70
 8000774:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000778:	2301      	movs	r3, #1
 800077a:	f8ad 3006 	strh.w	r3, [sp, #6]
 800077e:	2304      	movs	r3, #4
 8000780:	f8ad 3008 	strh.w	r3, [sp, #8]
 8000784:	4e17      	ldr	r6, [pc, #92]	; (80007e4 <aeris_set_motors+0xe8>)
 8000786:	4818      	ldr	r0, [pc, #96]	; (80007e8 <aeris_set_motors+0xec>)
 8000788:	2302      	movs	r3, #2
 800078a:	f8ad 3010 	strh.w	r3, [sp, #16]
 800078e:	2300      	movs	r3, #0
 8000790:	f8ad 3012 	strh.w	r3, [sp, #18]
 8000794:	f8ad 3016 	strh.w	r3, [sp, #22]
 8000798:	6833      	ldr	r3, [r6, #0]
 800079a:	f242 7510 	movw	r5, #10000	; 0x2710
 800079e:	fbb3 f3f5 	udiv	r3, r3, r5
 80007a2:	3b02      	subs	r3, #2
 80007a4:	fb08 f303 	mul.w	r3, r8, r3
 80007a8:	2464      	movs	r4, #100	; 0x64
 80007aa:	f44f 7280 	mov.w	r2, #256	; 0x100
 80007ae:	fbb3 f3f4 	udiv	r3, r3, r4
 80007b2:	a901      	add	r1, sp, #4
 80007b4:	f8ad 2014 	strh.w	r2, [sp, #20]
 80007b8:	9303      	str	r3, [sp, #12]
 80007ba:	f000 fb25 	bl	8000e08 <TIM_OC1Init>
 80007be:	6833      	ldr	r3, [r6, #0]
 80007c0:	4809      	ldr	r0, [pc, #36]	; (80007e8 <aeris_set_motors+0xec>)
 80007c2:	fbb3 f5f5 	udiv	r5, r3, r5
 80007c6:	3d02      	subs	r5, #2
 80007c8:	436f      	muls	r7, r5
 80007ca:	fbb7 f4f4 	udiv	r4, r7, r4
 80007ce:	a901      	add	r1, sp, #4
 80007d0:	9403      	str	r4, [sp, #12]
 80007d2:	f000 fb51 	bl	8000e78 <TIM_OC2Init>
 80007d6:	b006      	add	sp, #24
 80007d8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
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
 80007f8:	f000 fff3 	bl	80017e2 <GPIO_ResetBits>
 80007fc:	e001      	b.n	8000802 <aeris_set_rgbw+0x16>
 80007fe:	f000 ffee 	bl	80017de <GPIO_SetBits>
 8000802:	7d63      	ldrb	r3, [r4, #21]
 8000804:	480f      	ldr	r0, [pc, #60]	; (8000844 <aeris_set_rgbw+0x58>)
 8000806:	2120      	movs	r1, #32
 8000808:	b113      	cbz	r3, 8000810 <aeris_set_rgbw+0x24>
 800080a:	f000 ffea 	bl	80017e2 <GPIO_ResetBits>
 800080e:	e001      	b.n	8000814 <aeris_set_rgbw+0x28>
 8000810:	f000 ffe5 	bl	80017de <GPIO_SetBits>
 8000814:	7da3      	ldrb	r3, [r4, #22]
 8000816:	480b      	ldr	r0, [pc, #44]	; (8000844 <aeris_set_rgbw+0x58>)
 8000818:	2140      	movs	r1, #64	; 0x40
 800081a:	b113      	cbz	r3, 8000822 <aeris_set_rgbw+0x36>
 800081c:	f000 ffe1 	bl	80017e2 <GPIO_ResetBits>
 8000820:	e001      	b.n	8000826 <aeris_set_rgbw+0x3a>
 8000822:	f000 ffdc 	bl	80017de <GPIO_SetBits>
 8000826:	7de3      	ldrb	r3, [r4, #23]
 8000828:	4807      	ldr	r0, [pc, #28]	; (8000848 <aeris_set_rgbw+0x5c>)
 800082a:	2120      	movs	r1, #32
 800082c:	b11b      	cbz	r3, 8000836 <aeris_set_rgbw+0x4a>
 800082e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000832:	f000 bfd4 	b.w	80017de <GPIO_SetBits>
 8000836:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800083a:	f000 bfd2 	b.w	80017e2 <GPIO_ResetBits>
 800083e:	bf00      	nop
 8000840:	20000590 	.word	0x20000590
 8000844:	40020400 	.word	0x40020400
 8000848:	40020800 	.word	0x40020800

0800084c <aeris_init_surface_sensor>:
 800084c:	b510      	push	{r4, lr}
 800084e:	4604      	mov	r4, r0
 8000850:	f000 fc7c 	bl	800114c <i2cStart>
 8000854:	20e0      	movs	r0, #224	; 0xe0
 8000856:	f000 fc97 	bl	8001188 <i2cWrite>
 800085a:	2301      	movs	r3, #1
 800085c:	fa03 f004 	lsl.w	r0, r3, r4
 8000860:	b2c0      	uxtb	r0, r0
 8000862:	f000 fc91 	bl	8001188 <i2cWrite>
 8000866:	f000 fc80 	bl	800116a <i2cStop>
 800086a:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 800086e:	f000 fbcf 	bl	8001010 <timer_delay_loops>
 8000872:	2072      	movs	r0, #114	; 0x72
 8000874:	2181      	movs	r1, #129	; 0x81
 8000876:	22ff      	movs	r2, #255	; 0xff
 8000878:	f000 fcd6 	bl	8001228 <i2c_write_reg>
 800087c:	2072      	movs	r0, #114	; 0x72
 800087e:	2183      	movs	r1, #131	; 0x83
 8000880:	22ff      	movs	r2, #255	; 0xff
 8000882:	f000 fcd1 	bl	8001228 <i2c_write_reg>
 8000886:	2072      	movs	r0, #114	; 0x72
 8000888:	218d      	movs	r1, #141	; 0x8d
 800088a:	2200      	movs	r2, #0
 800088c:	f000 fccc 	bl	8001228 <i2c_write_reg>
 8000890:	2072      	movs	r0, #114	; 0x72
 8000892:	2180      	movs	r1, #128	; 0x80
 8000894:	2203      	movs	r2, #3
 8000896:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800089a:	f000 bcc5 	b.w	8001228 <i2c_write_reg>
	...

080008a0 <aeris_init>:
 80008a0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80008a4:	4ba1      	ldr	r3, [pc, #644]	; (8000b2c <aeris_init+0x28c>)
 80008a6:	2200      	movs	r2, #0
 80008a8:	2101      	movs	r1, #1
 80008aa:	7519      	strb	r1, [r3, #20]
 80008ac:	b089      	sub	sp, #36	; 0x24
 80008ae:	601a      	str	r2, [r3, #0]
 80008b0:	60da      	str	r2, [r3, #12]
 80008b2:	611a      	str	r2, [r3, #16]
 80008b4:	755a      	strb	r2, [r3, #21]
 80008b6:	759a      	strb	r2, [r3, #22]
 80008b8:	75da      	strb	r2, [r3, #23]
 80008ba:	831a      	strh	r2, [r3, #24]
 80008bc:	835a      	strh	r2, [r3, #26]
 80008be:	839a      	strh	r2, [r3, #28]
 80008c0:	83da      	strh	r2, [r3, #30]
 80008c2:	841a      	strh	r2, [r3, #32]
 80008c4:	845a      	strh	r2, [r3, #34]	; 0x22
 80008c6:	849a      	strh	r2, [r3, #36]	; 0x24
 80008c8:	84da      	strh	r2, [r3, #38]	; 0x26
 80008ca:	851a      	strh	r2, [r3, #40]	; 0x28
 80008cc:	855a      	strh	r2, [r3, #42]	; 0x2a
 80008ce:	859a      	strh	r2, [r3, #44]	; 0x2c
 80008d0:	85da      	strh	r2, [r3, #46]	; 0x2e
 80008d2:	861a      	strh	r2, [r3, #48]	; 0x30
 80008d4:	865a      	strh	r2, [r3, #50]	; 0x32
 80008d6:	869a      	strh	r2, [r3, #52]	; 0x34
 80008d8:	86da      	strh	r2, [r3, #54]	; 0x36
 80008da:	2608      	movs	r6, #8
 80008dc:	4619      	mov	r1, r3
 80008de:	2200      	movs	r2, #0
 80008e0:	3e01      	subs	r6, #1
 80008e2:	871a      	strh	r2, [r3, #56]	; 0x38
 80008e4:	f8a3 2048 	strh.w	r2, [r3, #72]	; 0x48
 80008e8:	f8a3 2058 	strh.w	r2, [r3, #88]	; 0x58
 80008ec:	f8a3 2068 	strh.w	r2, [r3, #104]	; 0x68
 80008f0:	4693      	mov	fp, r2
 80008f2:	f103 0302 	add.w	r3, r3, #2
 80008f6:	d1f2      	bne.n	80008de <aeris_init+0x3e>
 80008f8:	f881 2078 	strb.w	r2, [r1, #120]	; 0x78
 80008fc:	2008      	movs	r0, #8
 80008fe:	2101      	movs	r1, #1
 8000900:	f000 fe9a 	bl	8001638 <RCC_APB1PeriphClockCmd>
 8000904:	2401      	movs	r4, #1
 8000906:	2502      	movs	r5, #2
 8000908:	2703      	movs	r7, #3
 800090a:	4889      	ldr	r0, [pc, #548]	; (8000b30 <aeris_init+0x290>)
 800090c:	9503      	str	r5, [sp, #12]
 800090e:	a903      	add	r1, sp, #12
 8000910:	f88d 4010 	strb.w	r4, [sp, #16]
 8000914:	f88d b012 	strb.w	fp, [sp, #18]
 8000918:	f88d 7011 	strb.w	r7, [sp, #17]
 800091c:	f88d b013 	strb.w	fp, [sp, #19]
 8000920:	f000 ff1c 	bl	800175c <GPIO_Init>
 8000924:	4882      	ldr	r0, [pc, #520]	; (8000b30 <aeris_init+0x290>)
 8000926:	f8df 8204 	ldr.w	r8, [pc, #516]	; 8000b2c <aeris_init+0x28c>
 800092a:	4629      	mov	r1, r5
 800092c:	f000 ff57 	bl	80017de <GPIO_SetBits>
 8000930:	f04f 0904 	mov.w	r9, #4
 8000934:	487e      	ldr	r0, [pc, #504]	; (8000b30 <aeris_init+0x290>)
 8000936:	f8cd 900c 	str.w	r9, [sp, #12]
 800093a:	a903      	add	r1, sp, #12
 800093c:	f88d 4010 	strb.w	r4, [sp, #16]
 8000940:	f88d b012 	strb.w	fp, [sp, #18]
 8000944:	f88d 7011 	strb.w	r7, [sp, #17]
 8000948:	f88d b013 	strb.w	fp, [sp, #19]
 800094c:	f000 ff06 	bl	800175c <GPIO_Init>
 8000950:	4877      	ldr	r0, [pc, #476]	; (8000b30 <aeris_init+0x290>)
 8000952:	4649      	mov	r1, r9
 8000954:	f000 ff45 	bl	80017e2 <GPIO_ResetBits>
 8000958:	f04f 0a08 	mov.w	sl, #8
 800095c:	4874      	ldr	r0, [pc, #464]	; (8000b30 <aeris_init+0x290>)
 800095e:	f8cd a00c 	str.w	sl, [sp, #12]
 8000962:	a903      	add	r1, sp, #12
 8000964:	f88d 4010 	strb.w	r4, [sp, #16]
 8000968:	f88d b012 	strb.w	fp, [sp, #18]
 800096c:	f88d 7011 	strb.w	r7, [sp, #17]
 8000970:	f88d b013 	strb.w	fp, [sp, #19]
 8000974:	f000 fef2 	bl	800175c <GPIO_Init>
 8000978:	4651      	mov	r1, sl
 800097a:	486d      	ldr	r0, [pc, #436]	; (8000b30 <aeris_init+0x290>)
 800097c:	f000 ff31 	bl	80017e2 <GPIO_ResetBits>
 8000980:	486c      	ldr	r0, [pc, #432]	; (8000b34 <aeris_init+0x294>)
 8000982:	9703      	str	r7, [sp, #12]
 8000984:	a903      	add	r1, sp, #12
 8000986:	f88d 5010 	strb.w	r5, [sp, #16]
 800098a:	f88d 5011 	strb.w	r5, [sp, #17]
 800098e:	f000 fee5 	bl	800175c <GPIO_Init>
 8000992:	4868      	ldr	r0, [pc, #416]	; (8000b34 <aeris_init+0x294>)
 8000994:	4631      	mov	r1, r6
 8000996:	462a      	mov	r2, r5
 8000998:	f000 ff25 	bl	80017e6 <GPIO_PinAFConfig>
 800099c:	462a      	mov	r2, r5
 800099e:	4865      	ldr	r0, [pc, #404]	; (8000b34 <aeris_init+0x294>)
 80009a0:	4621      	mov	r1, r4
 80009a2:	f000 ff20 	bl	80017e6 <GPIO_PinAFConfig>
 80009a6:	4b64      	ldr	r3, [pc, #400]	; (8000b38 <aeris_init+0x298>)
 80009a8:	4864      	ldr	r0, [pc, #400]	; (8000b3c <aeris_init+0x29c>)
 80009aa:	681b      	ldr	r3, [r3, #0]
 80009ac:	f8ad 6014 	strh.w	r6, [sp, #20]
 80009b0:	f242 7a10 	movw	sl, #10000	; 0x2710
 80009b4:	fbb3 f3fa 	udiv	r3, r3, sl
 80009b8:	3b01      	subs	r3, #1
 80009ba:	a905      	add	r1, sp, #20
 80009bc:	9306      	str	r3, [sp, #24]
 80009be:	f8ad 6016 	strh.w	r6, [sp, #22]
 80009c2:	f8ad 601c 	strh.w	r6, [sp, #28]
 80009c6:	f88d b01e 	strb.w	fp, [sp, #30]
 80009ca:	f000 f9d3 	bl	8000d74 <TIM_TimeBaseInit>
 80009ce:	f7ff fe95 	bl	80006fc <aeris_set_motors>
 80009d2:	485a      	ldr	r0, [pc, #360]	; (8000b3c <aeris_init+0x29c>)
 80009d4:	4621      	mov	r1, r4
 80009d6:	f000 fa0b 	bl	8000df0 <TIM_Cmd>
 80009da:	4858      	ldr	r0, [pc, #352]	; (8000b3c <aeris_init+0x29c>)
 80009dc:	4621      	mov	r1, r4
 80009de:	f000 fa8f 	bl	8000f00 <TIM_CtrlPWMOutputs>
 80009e2:	f7ff fe8b 	bl	80006fc <aeris_set_motors>
 80009e6:	2370      	movs	r3, #112	; 0x70
 80009e8:	4855      	ldr	r0, [pc, #340]	; (8000b40 <aeris_init+0x2a0>)
 80009ea:	9303      	str	r3, [sp, #12]
 80009ec:	a903      	add	r1, sp, #12
 80009ee:	f88d 4010 	strb.w	r4, [sp, #16]
 80009f2:	f88d b012 	strb.w	fp, [sp, #18]
 80009f6:	f88d 7011 	strb.w	r7, [sp, #17]
 80009fa:	f88d b013 	strb.w	fp, [sp, #19]
 80009fe:	f000 fead 	bl	800175c <GPIO_Init>
 8000a02:	2320      	movs	r3, #32
 8000a04:	484a      	ldr	r0, [pc, #296]	; (8000b30 <aeris_init+0x290>)
 8000a06:	9303      	str	r3, [sp, #12]
 8000a08:	a903      	add	r1, sp, #12
 8000a0a:	f88d 4010 	strb.w	r4, [sp, #16]
 8000a0e:	f88d b012 	strb.w	fp, [sp, #18]
 8000a12:	f88d 7011 	strb.w	r7, [sp, #17]
 8000a16:	f88d b013 	strb.w	fp, [sp, #19]
 8000a1a:	f000 fe9f 	bl	800175c <GPIO_Init>
 8000a1e:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8000a22:	4847      	ldr	r0, [pc, #284]	; (8000b40 <aeris_init+0x2a0>)
 8000a24:	9303      	str	r3, [sp, #12]
 8000a26:	a903      	add	r1, sp, #12
 8000a28:	f88d b010 	strb.w	fp, [sp, #16]
 8000a2c:	f88d 5011 	strb.w	r5, [sp, #17]
 8000a30:	f88d 4013 	strb.w	r4, [sp, #19]
 8000a34:	f000 fe92 	bl	800175c <GPIO_Init>
 8000a38:	f7ff fed8 	bl	80007ec <aeris_set_rgbw>
 8000a3c:	f000 f920 	bl	8000c80 <lsm9ds0_init>
 8000a40:	9001      	str	r0, [sp, #4]
 8000a42:	b380      	cbz	r0, 8000aa6 <aeris_init+0x206>
 8000a44:	229d      	movs	r2, #157	; 0x9d
 8000a46:	483f      	ldr	r0, [pc, #252]	; (8000b44 <aeris_init+0x2a4>)
 8000a48:	493f      	ldr	r1, [pc, #252]	; (8000b48 <aeris_init+0x2a8>)
 8000a4a:	f7ff fd47 	bl	80004dc <printf_>
 8000a4e:	f7ff fc05 	bl	800025c <sched_off>
 8000a52:	483b      	ldr	r0, [pc, #236]	; (8000b40 <aeris_init+0x2a0>)
 8000a54:	2110      	movs	r1, #16
 8000a56:	f000 fec2 	bl	80017de <GPIO_SetBits>
 8000a5a:	4839      	ldr	r0, [pc, #228]	; (8000b40 <aeris_init+0x2a0>)
 8000a5c:	2120      	movs	r1, #32
 8000a5e:	f000 febe 	bl	80017de <GPIO_SetBits>
 8000a62:	4837      	ldr	r0, [pc, #220]	; (8000b40 <aeris_init+0x2a0>)
 8000a64:	2140      	movs	r1, #64	; 0x40
 8000a66:	f000 feba 	bl	80017de <GPIO_SetBits>
 8000a6a:	9b01      	ldr	r3, [sp, #4]
 8000a6c:	429e      	cmp	r6, r3
 8000a6e:	d210      	bcs.n	8000a92 <aeris_init+0x1f2>
 8000a70:	2110      	movs	r1, #16
 8000a72:	4833      	ldr	r0, [pc, #204]	; (8000b40 <aeris_init+0x2a0>)
 8000a74:	f000 feb5 	bl	80017e2 <GPIO_ResetBits>
 8000a78:	f242 7010 	movw	r0, #10000	; 0x2710
 8000a7c:	f000 fac8 	bl	8001010 <timer_delay_loops>
 8000a80:	482f      	ldr	r0, [pc, #188]	; (8000b40 <aeris_init+0x2a0>)
 8000a82:	2110      	movs	r1, #16
 8000a84:	f000 feab 	bl	80017de <GPIO_SetBits>
 8000a88:	4830      	ldr	r0, [pc, #192]	; (8000b4c <aeris_init+0x2ac>)
 8000a8a:	f000 fac1 	bl	8001010 <timer_delay_loops>
 8000a8e:	3601      	adds	r6, #1
 8000a90:	e7eb      	b.n	8000a6a <aeris_init+0x1ca>
 8000a92:	482f      	ldr	r0, [pc, #188]	; (8000b50 <aeris_init+0x2b0>)
 8000a94:	f000 fabc 	bl	8001010 <timer_delay_loops>
 8000a98:	482a      	ldr	r0, [pc, #168]	; (8000b44 <aeris_init+0x2a4>)
 8000a9a:	492b      	ldr	r1, [pc, #172]	; (8000b48 <aeris_init+0x2a8>)
 8000a9c:	229d      	movs	r2, #157	; 0x9d
 8000a9e:	f7ff fd1d 	bl	80004dc <printf_>
 8000aa2:	2600      	movs	r6, #0
 8000aa4:	e7e1      	b.n	8000a6a <aeris_init+0x1ca>
 8000aa6:	a903      	add	r1, sp, #12
 8000aa8:	4825      	ldr	r0, [pc, #148]	; (8000b40 <aeris_init+0x2a0>)
 8000aaa:	9503      	str	r5, [sp, #12]
 8000aac:	f88d 4010 	strb.w	r4, [sp, #16]
 8000ab0:	f88d b012 	strb.w	fp, [sp, #18]
 8000ab4:	f88d 7011 	strb.w	r7, [sp, #17]
 8000ab8:	f88d b013 	strb.w	fp, [sp, #19]
 8000abc:	f000 fe4e 	bl	800175c <GPIO_Init>
 8000ac0:	4629      	mov	r1, r5
 8000ac2:	481f      	ldr	r0, [pc, #124]	; (8000b40 <aeris_init+0x2a0>)
 8000ac4:	f000 fe8d 	bl	80017e2 <GPIO_ResetBits>
 8000ac8:	4650      	mov	r0, sl
 8000aca:	f000 faa1 	bl	8001010 <timer_delay_loops>
 8000ace:	4629      	mov	r1, r5
 8000ad0:	481b      	ldr	r0, [pc, #108]	; (8000b40 <aeris_init+0x2a0>)
 8000ad2:	f000 fe84 	bl	80017de <GPIO_SetBits>
 8000ad6:	4650      	mov	r0, sl
 8000ad8:	f000 fa9a 	bl	8001010 <timer_delay_loops>
 8000adc:	4630      	mov	r0, r6
 8000ade:	f7ff feb5 	bl	800084c <aeris_init_surface_sensor>
 8000ae2:	4620      	mov	r0, r4
 8000ae4:	f7ff feb2 	bl	800084c <aeris_init_surface_sensor>
 8000ae8:	4628      	mov	r0, r5
 8000aea:	f7ff feaf 	bl	800084c <aeris_init_surface_sensor>
 8000aee:	4638      	mov	r0, r7
 8000af0:	f7ff feac 	bl	800084c <aeris_init_surface_sensor>
 8000af4:	4648      	mov	r0, r9
 8000af6:	f7ff fea9 	bl	800084c <aeris_init_surface_sensor>
 8000afa:	2005      	movs	r0, #5
 8000afc:	f7ff fea6 	bl	800084c <aeris_init_surface_sensor>
 8000b00:	2006      	movs	r0, #6
 8000b02:	f7ff fea3 	bl	800084c <aeris_init_surface_sensor>
 8000b06:	2007      	movs	r0, #7
 8000b08:	f7ff fea0 	bl	800084c <aeris_init_surface_sensor>
 8000b0c:	f888 4017 	strb.w	r4, [r8, #23]
 8000b10:	f7ff fe6c 	bl	80007ec <aeris_set_rgbw>
 8000b14:	f888 b014 	strb.w	fp, [r8, #20]
 8000b18:	f888 4015 	strb.w	r4, [r8, #21]
 8000b1c:	f888 b016 	strb.w	fp, [r8, #22]
 8000b20:	f7ff fe64 	bl	80007ec <aeris_set_rgbw>
 8000b24:	4630      	mov	r0, r6
 8000b26:	b009      	add	sp, #36	; 0x24
 8000b28:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8000b2c:	20000590 	.word	0x20000590
 8000b30:	40020800 	.word	0x40020800
 8000b34:	40020000 	.word	0x40020000
 8000b38:	20000000 	.word	0x20000000
 8000b3c:	40000c00 	.word	0x40000c00
 8000b40:	40020400 	.word	0x40020400
 8000b44:	08001905 	.word	0x08001905
 8000b48:	08001918 	.word	0x08001918
 8000b4c:	001e8480 	.word	0x001e8480
 8000b50:	00989680 	.word	0x00989680

08000b54 <aeris_motor_test>:
 8000b54:	b508      	push	{r3, lr}
 8000b56:	4c0a      	ldr	r4, [pc, #40]	; (8000b80 <aeris_motor_test+0x2c>)
 8000b58:	2364      	movs	r3, #100	; 0x64
 8000b5a:	60e3      	str	r3, [r4, #12]
 8000b5c:	6123      	str	r3, [r4, #16]
 8000b5e:	f7ff fdcd 	bl	80006fc <aeris_set_motors>
 8000b62:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000b66:	f000 fa67 	bl	8001038 <timer_delay_ms>
 8000b6a:	2300      	movs	r3, #0
 8000b6c:	60e3      	str	r3, [r4, #12]
 8000b6e:	6123      	str	r3, [r4, #16]
 8000b70:	f7ff fdc4 	bl	80006fc <aeris_set_motors>
 8000b74:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000b78:	f000 fa5e 	bl	8001038 <timer_delay_ms>
 8000b7c:	e7eb      	b.n	8000b56 <aeris_motor_test+0x2>
 8000b7e:	bf00      	nop
 8000b80:	20000590 	.word	0x20000590

08000b84 <lsm9ds0_read>:
 8000b84:	b538      	push	{r3, r4, r5, lr}
 8000b86:	2128      	movs	r1, #40	; 0x28
 8000b88:	20d4      	movs	r0, #212	; 0xd4
 8000b8a:	f000 fb60 	bl	800124e <i2c_read_reg>
 8000b8e:	2129      	movs	r1, #41	; 0x29
 8000b90:	4605      	mov	r5, r0
 8000b92:	20d4      	movs	r0, #212	; 0xd4
 8000b94:	f000 fb5b 	bl	800124e <i2c_read_reg>
 8000b98:	4c38      	ldr	r4, [pc, #224]	; (8000c7c <lsm9ds0_read+0xf8>)
 8000b9a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b9e:	81a0      	strh	r0, [r4, #12]
 8000ba0:	212a      	movs	r1, #42	; 0x2a
 8000ba2:	20d4      	movs	r0, #212	; 0xd4
 8000ba4:	f000 fb53 	bl	800124e <i2c_read_reg>
 8000ba8:	212b      	movs	r1, #43	; 0x2b
 8000baa:	4605      	mov	r5, r0
 8000bac:	20d4      	movs	r0, #212	; 0xd4
 8000bae:	f000 fb4e 	bl	800124e <i2c_read_reg>
 8000bb2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000bb6:	81e0      	strh	r0, [r4, #14]
 8000bb8:	212c      	movs	r1, #44	; 0x2c
 8000bba:	20d4      	movs	r0, #212	; 0xd4
 8000bbc:	f000 fb47 	bl	800124e <i2c_read_reg>
 8000bc0:	212d      	movs	r1, #45	; 0x2d
 8000bc2:	4605      	mov	r5, r0
 8000bc4:	20d4      	movs	r0, #212	; 0xd4
 8000bc6:	f000 fb42 	bl	800124e <i2c_read_reg>
 8000bca:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000bce:	8220      	strh	r0, [r4, #16]
 8000bd0:	2108      	movs	r1, #8
 8000bd2:	203c      	movs	r0, #60	; 0x3c
 8000bd4:	f000 fb3b 	bl	800124e <i2c_read_reg>
 8000bd8:	2109      	movs	r1, #9
 8000bda:	4605      	mov	r5, r0
 8000bdc:	203c      	movs	r0, #60	; 0x3c
 8000bde:	f000 fb36 	bl	800124e <i2c_read_reg>
 8000be2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000be6:	80e0      	strh	r0, [r4, #6]
 8000be8:	210a      	movs	r1, #10
 8000bea:	203c      	movs	r0, #60	; 0x3c
 8000bec:	f000 fb2f 	bl	800124e <i2c_read_reg>
 8000bf0:	210b      	movs	r1, #11
 8000bf2:	4605      	mov	r5, r0
 8000bf4:	203c      	movs	r0, #60	; 0x3c
 8000bf6:	f000 fb2a 	bl	800124e <i2c_read_reg>
 8000bfa:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000bfe:	8120      	strh	r0, [r4, #8]
 8000c00:	210c      	movs	r1, #12
 8000c02:	203c      	movs	r0, #60	; 0x3c
 8000c04:	f000 fb23 	bl	800124e <i2c_read_reg>
 8000c08:	210d      	movs	r1, #13
 8000c0a:	4605      	mov	r5, r0
 8000c0c:	203c      	movs	r0, #60	; 0x3c
 8000c0e:	f000 fb1e 	bl	800124e <i2c_read_reg>
 8000c12:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000c16:	8160      	strh	r0, [r4, #10]
 8000c18:	2128      	movs	r1, #40	; 0x28
 8000c1a:	203c      	movs	r0, #60	; 0x3c
 8000c1c:	f000 fb17 	bl	800124e <i2c_read_reg>
 8000c20:	2129      	movs	r1, #41	; 0x29
 8000c22:	4605      	mov	r5, r0
 8000c24:	203c      	movs	r0, #60	; 0x3c
 8000c26:	f000 fb12 	bl	800124e <i2c_read_reg>
 8000c2a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000c2e:	8020      	strh	r0, [r4, #0]
 8000c30:	212a      	movs	r1, #42	; 0x2a
 8000c32:	203c      	movs	r0, #60	; 0x3c
 8000c34:	f000 fb0b 	bl	800124e <i2c_read_reg>
 8000c38:	212b      	movs	r1, #43	; 0x2b
 8000c3a:	4605      	mov	r5, r0
 8000c3c:	203c      	movs	r0, #60	; 0x3c
 8000c3e:	f000 fb06 	bl	800124e <i2c_read_reg>
 8000c42:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000c46:	8060      	strh	r0, [r4, #2]
 8000c48:	212c      	movs	r1, #44	; 0x2c
 8000c4a:	203c      	movs	r0, #60	; 0x3c
 8000c4c:	f000 faff 	bl	800124e <i2c_read_reg>
 8000c50:	212d      	movs	r1, #45	; 0x2d
 8000c52:	4605      	mov	r5, r0
 8000c54:	203c      	movs	r0, #60	; 0x3c
 8000c56:	f000 fafa 	bl	800124e <i2c_read_reg>
 8000c5a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000c5e:	80a0      	strh	r0, [r4, #4]
 8000c60:	2105      	movs	r1, #5
 8000c62:	203c      	movs	r0, #60	; 0x3c
 8000c64:	f000 faf3 	bl	800124e <i2c_read_reg>
 8000c68:	2106      	movs	r1, #6
 8000c6a:	4605      	mov	r5, r0
 8000c6c:	203c      	movs	r0, #60	; 0x3c
 8000c6e:	f000 faee 	bl	800124e <i2c_read_reg>
 8000c72:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000c76:	8320      	strh	r0, [r4, #24]
 8000c78:	bd38      	pop	{r3, r4, r5, pc}
 8000c7a:	bf00      	nop
 8000c7c:	20000574 	.word	0x20000574

08000c80 <lsm9ds0_init>:
 8000c80:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000c84:	4d34      	ldr	r5, [pc, #208]	; (8000d58 <lsm9ds0_init+0xd8>)
 8000c86:	2400      	movs	r4, #0
 8000c88:	20d4      	movs	r0, #212	; 0xd4
 8000c8a:	210f      	movs	r1, #15
 8000c8c:	802c      	strh	r4, [r5, #0]
 8000c8e:	806c      	strh	r4, [r5, #2]
 8000c90:	80ac      	strh	r4, [r5, #4]
 8000c92:	80ec      	strh	r4, [r5, #6]
 8000c94:	812c      	strh	r4, [r5, #8]
 8000c96:	816c      	strh	r4, [r5, #10]
 8000c98:	81ac      	strh	r4, [r5, #12]
 8000c9a:	81ec      	strh	r4, [r5, #14]
 8000c9c:	822c      	strh	r4, [r5, #16]
 8000c9e:	826c      	strh	r4, [r5, #18]
 8000ca0:	82ac      	strh	r4, [r5, #20]
 8000ca2:	82ec      	strh	r4, [r5, #22]
 8000ca4:	832c      	strh	r4, [r5, #24]
 8000ca6:	f000 fad2 	bl	800124e <i2c_read_reg>
 8000caa:	28d4      	cmp	r0, #212	; 0xd4
 8000cac:	4606      	mov	r6, r0
 8000cae:	d14e      	bne.n	8000d4e <lsm9ds0_init+0xce>
 8000cb0:	203c      	movs	r0, #60	; 0x3c
 8000cb2:	210f      	movs	r1, #15
 8000cb4:	f000 facb 	bl	800124e <i2c_read_reg>
 8000cb8:	2849      	cmp	r0, #73	; 0x49
 8000cba:	bf18      	it	ne
 8000cbc:	2602      	movne	r6, #2
 8000cbe:	d147      	bne.n	8000d50 <lsm9ds0_init+0xd0>
 8000cc0:	4630      	mov	r0, r6
 8000cc2:	2120      	movs	r1, #32
 8000cc4:	22ff      	movs	r2, #255	; 0xff
 8000cc6:	f000 faaf 	bl	8001228 <i2c_write_reg>
 8000cca:	4630      	mov	r0, r6
 8000ccc:	2123      	movs	r1, #35	; 0x23
 8000cce:	2218      	movs	r2, #24
 8000cd0:	f000 faaa 	bl	8001228 <i2c_write_reg>
 8000cd4:	203c      	movs	r0, #60	; 0x3c
 8000cd6:	211f      	movs	r1, #31
 8000cd8:	4622      	mov	r2, r4
 8000cda:	f000 faa5 	bl	8001228 <i2c_write_reg>
 8000cde:	203c      	movs	r0, #60	; 0x3c
 8000ce0:	2120      	movs	r1, #32
 8000ce2:	2267      	movs	r2, #103	; 0x67
 8000ce4:	f000 faa0 	bl	8001228 <i2c_write_reg>
 8000ce8:	203c      	movs	r0, #60	; 0x3c
 8000cea:	2121      	movs	r1, #33	; 0x21
 8000cec:	4622      	mov	r2, r4
 8000cee:	f000 fa9b 	bl	8001228 <i2c_write_reg>
 8000cf2:	203c      	movs	r0, #60	; 0x3c
 8000cf4:	2124      	movs	r1, #36	; 0x24
 8000cf6:	22f4      	movs	r2, #244	; 0xf4
 8000cf8:	f000 fa96 	bl	8001228 <i2c_write_reg>
 8000cfc:	203c      	movs	r0, #60	; 0x3c
 8000cfe:	2125      	movs	r1, #37	; 0x25
 8000d00:	4622      	mov	r2, r4
 8000d02:	f000 fa91 	bl	8001228 <i2c_write_reg>
 8000d06:	203c      	movs	r0, #60	; 0x3c
 8000d08:	2126      	movs	r1, #38	; 0x26
 8000d0a:	2280      	movs	r2, #128	; 0x80
 8000d0c:	f000 fa8c 	bl	8001228 <i2c_write_reg>
 8000d10:	f7ff ff38 	bl	8000b84 <lsm9ds0_read>
 8000d14:	2664      	movs	r6, #100	; 0x64
 8000d16:	4627      	mov	r7, r4
 8000d18:	46a0      	mov	r8, r4
 8000d1a:	f7ff ff33 	bl	8000b84 <lsm9ds0_read>
 8000d1e:	f9b5 200c 	ldrsh.w	r2, [r5, #12]
 8000d22:	4b0d      	ldr	r3, [pc, #52]	; (8000d58 <lsm9ds0_init+0xd8>)
 8000d24:	4490      	add	r8, r2
 8000d26:	f9b5 200e 	ldrsh.w	r2, [r5, #14]
 8000d2a:	4417      	add	r7, r2
 8000d2c:	f9b5 2010 	ldrsh.w	r2, [r5, #16]
 8000d30:	3e01      	subs	r6, #1
 8000d32:	4414      	add	r4, r2
 8000d34:	d1f1      	bne.n	8000d1a <lsm9ds0_init+0x9a>
 8000d36:	2264      	movs	r2, #100	; 0x64
 8000d38:	fb98 f8f2 	sdiv	r8, r8, r2
 8000d3c:	fb97 f7f2 	sdiv	r7, r7, r2
 8000d40:	fb94 f4f2 	sdiv	r4, r4, r2
 8000d44:	f8a3 8012 	strh.w	r8, [r3, #18]
 8000d48:	829f      	strh	r7, [r3, #20]
 8000d4a:	82dc      	strh	r4, [r3, #22]
 8000d4c:	e000      	b.n	8000d50 <lsm9ds0_init+0xd0>
 8000d4e:	2601      	movs	r6, #1
 8000d50:	4630      	mov	r0, r6
 8000d52:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000d56:	bf00      	nop
 8000d58:	20000574 	.word	0x20000574

08000d5c <main_thread>:
 8000d5c:	b508      	push	{r3, lr}
 8000d5e:	4804      	ldr	r0, [pc, #16]	; (8000d70 <main_thread+0x14>)
 8000d60:	f7ff fbbc 	bl	80004dc <printf_>
 8000d64:	f7ff fd9c 	bl	80008a0 <aeris_init>
 8000d68:	f7ff fef4 	bl	8000b54 <aeris_motor_test>
 8000d6c:	e7fe      	b.n	8000d6c <main_thread+0x10>
 8000d6e:	bf00      	nop
 8000d70:	08001a21 	.word	0x08001a21

08000d74 <TIM_TimeBaseInit>:
 8000d74:	4a1c      	ldr	r2, [pc, #112]	; (8000de8 <TIM_TimeBaseInit+0x74>)
 8000d76:	8803      	ldrh	r3, [r0, #0]
 8000d78:	4290      	cmp	r0, r2
 8000d7a:	b29b      	uxth	r3, r3
 8000d7c:	d012      	beq.n	8000da4 <TIM_TimeBaseInit+0x30>
 8000d7e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000d82:	4290      	cmp	r0, r2
 8000d84:	d00e      	beq.n	8000da4 <TIM_TimeBaseInit+0x30>
 8000d86:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8000d8a:	d00b      	beq.n	8000da4 <TIM_TimeBaseInit+0x30>
 8000d8c:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 8000d90:	4290      	cmp	r0, r2
 8000d92:	d007      	beq.n	8000da4 <TIM_TimeBaseInit+0x30>
 8000d94:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000d98:	4290      	cmp	r0, r2
 8000d9a:	d003      	beq.n	8000da4 <TIM_TimeBaseInit+0x30>
 8000d9c:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000da0:	4290      	cmp	r0, r2
 8000da2:	d103      	bne.n	8000dac <TIM_TimeBaseInit+0x38>
 8000da4:	884a      	ldrh	r2, [r1, #2]
 8000da6:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8000daa:	4313      	orrs	r3, r2
 8000dac:	4a0f      	ldr	r2, [pc, #60]	; (8000dec <TIM_TimeBaseInit+0x78>)
 8000dae:	4290      	cmp	r0, r2
 8000db0:	d008      	beq.n	8000dc4 <TIM_TimeBaseInit+0x50>
 8000db2:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000db6:	4290      	cmp	r0, r2
 8000db8:	d004      	beq.n	8000dc4 <TIM_TimeBaseInit+0x50>
 8000dba:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000dbe:	890a      	ldrh	r2, [r1, #8]
 8000dc0:	b29b      	uxth	r3, r3
 8000dc2:	4313      	orrs	r3, r2
 8000dc4:	8003      	strh	r3, [r0, #0]
 8000dc6:	684b      	ldr	r3, [r1, #4]
 8000dc8:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000dca:	880b      	ldrh	r3, [r1, #0]
 8000dcc:	8503      	strh	r3, [r0, #40]	; 0x28
 8000dce:	4b06      	ldr	r3, [pc, #24]	; (8000de8 <TIM_TimeBaseInit+0x74>)
 8000dd0:	4298      	cmp	r0, r3
 8000dd2:	d003      	beq.n	8000ddc <TIM_TimeBaseInit+0x68>
 8000dd4:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000dd8:	4298      	cmp	r0, r3
 8000dda:	d101      	bne.n	8000de0 <TIM_TimeBaseInit+0x6c>
 8000ddc:	7a8b      	ldrb	r3, [r1, #10]
 8000dde:	8603      	strh	r3, [r0, #48]	; 0x30
 8000de0:	2301      	movs	r3, #1
 8000de2:	8283      	strh	r3, [r0, #20]
 8000de4:	4770      	bx	lr
 8000de6:	bf00      	nop
 8000de8:	40010000 	.word	0x40010000
 8000dec:	40001000 	.word	0x40001000

08000df0 <TIM_Cmd>:
 8000df0:	8803      	ldrh	r3, [r0, #0]
 8000df2:	b119      	cbz	r1, 8000dfc <TIM_Cmd+0xc>
 8000df4:	b29b      	uxth	r3, r3
 8000df6:	f043 0301 	orr.w	r3, r3, #1
 8000dfa:	e003      	b.n	8000e04 <TIM_Cmd+0x14>
 8000dfc:	f023 0301 	bic.w	r3, r3, #1
 8000e00:	041b      	lsls	r3, r3, #16
 8000e02:	0c1b      	lsrs	r3, r3, #16
 8000e04:	8003      	strh	r3, [r0, #0]
 8000e06:	4770      	bx	lr

08000e08 <TIM_OC1Init>:
 8000e08:	8c03      	ldrh	r3, [r0, #32]
 8000e0a:	f023 0301 	bic.w	r3, r3, #1
 8000e0e:	041b      	lsls	r3, r3, #16
 8000e10:	0c1b      	lsrs	r3, r3, #16
 8000e12:	8403      	strh	r3, [r0, #32]
 8000e14:	b570      	push	{r4, r5, r6, lr}
 8000e16:	8c03      	ldrh	r3, [r0, #32]
 8000e18:	8884      	ldrh	r4, [r0, #4]
 8000e1a:	8b02      	ldrh	r2, [r0, #24]
 8000e1c:	880d      	ldrh	r5, [r1, #0]
 8000e1e:	884e      	ldrh	r6, [r1, #2]
 8000e20:	f022 0273 	bic.w	r2, r2, #115	; 0x73
 8000e24:	0412      	lsls	r2, r2, #16
 8000e26:	0c12      	lsrs	r2, r2, #16
 8000e28:	432a      	orrs	r2, r5
 8000e2a:	898d      	ldrh	r5, [r1, #12]
 8000e2c:	f023 0302 	bic.w	r3, r3, #2
 8000e30:	041b      	lsls	r3, r3, #16
 8000e32:	4335      	orrs	r5, r6
 8000e34:	b2ad      	uxth	r5, r5
 8000e36:	0c1b      	lsrs	r3, r3, #16
 8000e38:	432b      	orrs	r3, r5
 8000e3a:	4d0e      	ldr	r5, [pc, #56]	; (8000e74 <TIM_OC1Init+0x6c>)
 8000e3c:	42a8      	cmp	r0, r5
 8000e3e:	b2a4      	uxth	r4, r4
 8000e40:	d003      	beq.n	8000e4a <TIM_OC1Init+0x42>
 8000e42:	f505 6580 	add.w	r5, r5, #1024	; 0x400
 8000e46:	42a8      	cmp	r0, r5
 8000e48:	d10e      	bne.n	8000e68 <TIM_OC1Init+0x60>
 8000e4a:	89cd      	ldrh	r5, [r1, #14]
 8000e4c:	8a4e      	ldrh	r6, [r1, #18]
 8000e4e:	f023 0308 	bic.w	r3, r3, #8
 8000e52:	432b      	orrs	r3, r5
 8000e54:	888d      	ldrh	r5, [r1, #4]
 8000e56:	f023 0304 	bic.w	r3, r3, #4
 8000e5a:	432b      	orrs	r3, r5
 8000e5c:	8a0d      	ldrh	r5, [r1, #16]
 8000e5e:	4335      	orrs	r5, r6
 8000e60:	f424 7440 	bic.w	r4, r4, #768	; 0x300
 8000e64:	b2ad      	uxth	r5, r5
 8000e66:	432c      	orrs	r4, r5
 8000e68:	8084      	strh	r4, [r0, #4]
 8000e6a:	8302      	strh	r2, [r0, #24]
 8000e6c:	688a      	ldr	r2, [r1, #8]
 8000e6e:	6342      	str	r2, [r0, #52]	; 0x34
 8000e70:	8403      	strh	r3, [r0, #32]
 8000e72:	bd70      	pop	{r4, r5, r6, pc}
 8000e74:	40010000 	.word	0x40010000

08000e78 <TIM_OC2Init>:
 8000e78:	8c03      	ldrh	r3, [r0, #32]
 8000e7a:	f023 0310 	bic.w	r3, r3, #16
 8000e7e:	041b      	lsls	r3, r3, #16
 8000e80:	0c1b      	lsrs	r3, r3, #16
 8000e82:	8403      	strh	r3, [r0, #32]
 8000e84:	8c03      	ldrh	r3, [r0, #32]
 8000e86:	8882      	ldrh	r2, [r0, #4]
 8000e88:	b530      	push	{r4, r5, lr}
 8000e8a:	8b04      	ldrh	r4, [r0, #24]
 8000e8c:	880d      	ldrh	r5, [r1, #0]
 8000e8e:	f424 44e6 	bic.w	r4, r4, #29440	; 0x7300
 8000e92:	0424      	lsls	r4, r4, #16
 8000e94:	0c24      	lsrs	r4, r4, #16
 8000e96:	f023 0320 	bic.w	r3, r3, #32
 8000e9a:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
 8000e9e:	041b      	lsls	r3, r3, #16
 8000ea0:	898d      	ldrh	r5, [r1, #12]
 8000ea2:	0c1b      	lsrs	r3, r3, #16
 8000ea4:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 8000ea8:	884d      	ldrh	r5, [r1, #2]
 8000eaa:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 8000eae:	4d13      	ldr	r5, [pc, #76]	; (8000efc <TIM_OC2Init+0x84>)
 8000eb0:	42a8      	cmp	r0, r5
 8000eb2:	b292      	uxth	r2, r2
 8000eb4:	b2a4      	uxth	r4, r4
 8000eb6:	b29b      	uxth	r3, r3
 8000eb8:	d003      	beq.n	8000ec2 <TIM_OC2Init+0x4a>
 8000eba:	f505 6580 	add.w	r5, r5, #1024	; 0x400
 8000ebe:	42a8      	cmp	r0, r5
 8000ec0:	d115      	bne.n	8000eee <TIM_OC2Init+0x76>
 8000ec2:	89cd      	ldrh	r5, [r1, #14]
 8000ec4:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 8000ec8:	b29b      	uxth	r3, r3
 8000eca:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 8000ece:	f64f 75bf 	movw	r5, #65471	; 0xffbf
 8000ed2:	401d      	ands	r5, r3
 8000ed4:	888b      	ldrh	r3, [r1, #4]
 8000ed6:	ea45 1303 	orr.w	r3, r5, r3, lsl #4
 8000eda:	8a0d      	ldrh	r5, [r1, #16]
 8000edc:	f422 6240 	bic.w	r2, r2, #3072	; 0xc00
 8000ee0:	ea42 0285 	orr.w	r2, r2, r5, lsl #2
 8000ee4:	8a4d      	ldrh	r5, [r1, #18]
 8000ee6:	ea42 0285 	orr.w	r2, r2, r5, lsl #2
 8000eea:	b29b      	uxth	r3, r3
 8000eec:	b292      	uxth	r2, r2
 8000eee:	8082      	strh	r2, [r0, #4]
 8000ef0:	688a      	ldr	r2, [r1, #8]
 8000ef2:	8304      	strh	r4, [r0, #24]
 8000ef4:	6382      	str	r2, [r0, #56]	; 0x38
 8000ef6:	8403      	strh	r3, [r0, #32]
 8000ef8:	bd30      	pop	{r4, r5, pc}
 8000efa:	bf00      	nop
 8000efc:	40010000 	.word	0x40010000

08000f00 <TIM_CtrlPWMOutputs>:
 8000f00:	f8b0 3044 	ldrh.w	r3, [r0, #68]	; 0x44
 8000f04:	b129      	cbz	r1, 8000f12 <TIM_CtrlPWMOutputs+0x12>
 8000f06:	ea6f 4343 	mvn.w	r3, r3, lsl #17
 8000f0a:	ea6f 4353 	mvn.w	r3, r3, lsr #17
 8000f0e:	b29b      	uxth	r3, r3
 8000f10:	e001      	b.n	8000f16 <TIM_CtrlPWMOutputs+0x16>
 8000f12:	f3c3 030e 	ubfx	r3, r3, #0, #15
 8000f16:	f8a0 3044 	strh.w	r3, [r0, #68]	; 0x44
 8000f1a:	4770      	bx	lr

08000f1c <TIM_ClearITPendingBit>:
 8000f1c:	43c9      	mvns	r1, r1
 8000f1e:	b289      	uxth	r1, r1
 8000f20:	8201      	strh	r1, [r0, #16]
 8000f22:	4770      	bx	lr

08000f24 <timer_init>:
 8000f24:	b530      	push	{r4, r5, lr}
 8000f26:	2000      	movs	r0, #0
 8000f28:	b085      	sub	sp, #20
 8000f2a:	4a1e      	ldr	r2, [pc, #120]	; (8000fa4 <timer_init+0x80>)
 8000f2c:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8000f30:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000f34:	4a1c      	ldr	r2, [pc, #112]	; (8000fa8 <timer_init+0x84>)
 8000f36:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000f3a:	4b1c      	ldr	r3, [pc, #112]	; (8000fac <timer_init+0x88>)
 8000f3c:	2400      	movs	r4, #0
 8000f3e:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 8000f42:	3001      	adds	r0, #1
 8000f44:	2804      	cmp	r0, #4
 8000f46:	4625      	mov	r5, r4
 8000f48:	d1ef      	bne.n	8000f2a <timer_init+0x6>
 8000f4a:	4b19      	ldr	r3, [pc, #100]	; (8000fb0 <timer_init+0x8c>)
 8000f4c:	2101      	movs	r1, #1
 8000f4e:	601c      	str	r4, [r3, #0]
 8000f50:	f000 fb72 	bl	8001638 <RCC_APB1PeriphClockCmd>
 8000f54:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000f58:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000f5c:	f88d 400e 	strb.w	r4, [sp, #14]
 8000f60:	4c14      	ldr	r4, [pc, #80]	; (8000fb4 <timer_init+0x90>)
 8000f62:	2353      	movs	r3, #83	; 0x53
 8000f64:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000f68:	4620      	mov	r0, r4
 8000f6a:	2331      	movs	r3, #49	; 0x31
 8000f6c:	a901      	add	r1, sp, #4
 8000f6e:	9302      	str	r3, [sp, #8]
 8000f70:	f7ff ff00 	bl	8000d74 <TIM_TimeBaseInit>
 8000f74:	4620      	mov	r0, r4
 8000f76:	2101      	movs	r1, #1
 8000f78:	f7ff ff3a 	bl	8000df0 <TIM_Cmd>
 8000f7c:	89a3      	ldrh	r3, [r4, #12]
 8000f7e:	b29b      	uxth	r3, r3
 8000f80:	f043 0301 	orr.w	r3, r3, #1
 8000f84:	81a3      	strh	r3, [r4, #12]
 8000f86:	231e      	movs	r3, #30
 8000f88:	f88d 3000 	strb.w	r3, [sp]
 8000f8c:	4668      	mov	r0, sp
 8000f8e:	2301      	movs	r3, #1
 8000f90:	f88d 5001 	strb.w	r5, [sp, #1]
 8000f94:	f88d 3002 	strb.w	r3, [sp, #2]
 8000f98:	f88d 3003 	strb.w	r3, [sp, #3]
 8000f9c:	f000 fc36 	bl	800180c <NVIC_Init>
 8000fa0:	b005      	add	sp, #20
 8000fa2:	bd30      	pop	{r4, r5, pc}
 8000fa4:	20000620 	.word	0x20000620
 8000fa8:	20000614 	.word	0x20000614
 8000fac:	2000060c 	.word	0x2000060c
 8000fb0:	2000061c 	.word	0x2000061c
 8000fb4:	40000800 	.word	0x40000800

08000fb8 <TIM4_IRQHandler>:
 8000fb8:	2300      	movs	r3, #0
 8000fba:	4a10      	ldr	r2, [pc, #64]	; (8000ffc <TIM4_IRQHandler+0x44>)
 8000fbc:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000fc0:	b289      	uxth	r1, r1
 8000fc2:	b129      	cbz	r1, 8000fd0 <TIM4_IRQHandler+0x18>
 8000fc4:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000fc8:	b289      	uxth	r1, r1
 8000fca:	3901      	subs	r1, #1
 8000fcc:	b289      	uxth	r1, r1
 8000fce:	e007      	b.n	8000fe0 <TIM4_IRQHandler+0x28>
 8000fd0:	490b      	ldr	r1, [pc, #44]	; (8001000 <TIM4_IRQHandler+0x48>)
 8000fd2:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8000fd6:	b289      	uxth	r1, r1
 8000fd8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000fdc:	4a09      	ldr	r2, [pc, #36]	; (8001004 <TIM4_IRQHandler+0x4c>)
 8000fde:	2101      	movs	r1, #1
 8000fe0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000fe4:	3301      	adds	r3, #1
 8000fe6:	2b04      	cmp	r3, #4
 8000fe8:	d1e7      	bne.n	8000fba <TIM4_IRQHandler+0x2>
 8000fea:	4b07      	ldr	r3, [pc, #28]	; (8001008 <TIM4_IRQHandler+0x50>)
 8000fec:	4807      	ldr	r0, [pc, #28]	; (800100c <TIM4_IRQHandler+0x54>)
 8000fee:	681a      	ldr	r2, [r3, #0]
 8000ff0:	2101      	movs	r1, #1
 8000ff2:	3201      	adds	r2, #1
 8000ff4:	601a      	str	r2, [r3, #0]
 8000ff6:	f7ff bf91 	b.w	8000f1c <TIM_ClearITPendingBit>
 8000ffa:	bf00      	nop
 8000ffc:	20000620 	.word	0x20000620
 8001000:	20000614 	.word	0x20000614
 8001004:	2000060c 	.word	0x2000060c
 8001008:	2000061c 	.word	0x2000061c
 800100c:	40000800 	.word	0x40000800

08001010 <timer_delay_loops>:
 8001010:	f110 30ff 	adds.w	r0, r0, #4294967295
 8001014:	d301      	bcc.n	800101a <timer_delay_loops+0xa>
 8001016:	bf00      	nop
 8001018:	e7fa      	b.n	8001010 <timer_delay_loops>
 800101a:	4770      	bx	lr

0800101c <timer_get_time>:
 800101c:	b082      	sub	sp, #8
 800101e:	b672      	cpsid	i
 8001020:	4b04      	ldr	r3, [pc, #16]	; (8001034 <timer_get_time+0x18>)
 8001022:	681b      	ldr	r3, [r3, #0]
 8001024:	9301      	str	r3, [sp, #4]
 8001026:	b662      	cpsie	i
 8001028:	9801      	ldr	r0, [sp, #4]
 800102a:	230a      	movs	r3, #10
 800102c:	fbb0 f0f3 	udiv	r0, r0, r3
 8001030:	b002      	add	sp, #8
 8001032:	4770      	bx	lr
 8001034:	2000061c 	.word	0x2000061c

08001038 <timer_delay_ms>:
 8001038:	b513      	push	{r0, r1, r4, lr}
 800103a:	4604      	mov	r4, r0
 800103c:	f7ff ffee 	bl	800101c <timer_get_time>
 8001040:	4420      	add	r0, r4
 8001042:	9001      	str	r0, [sp, #4]
 8001044:	9c01      	ldr	r4, [sp, #4]
 8001046:	f7ff ffe9 	bl	800101c <timer_get_time>
 800104a:	4284      	cmp	r4, r0
 800104c:	d902      	bls.n	8001054 <timer_delay_ms+0x1c>
 800104e:	f000 f9dd 	bl	800140c <sleep>
 8001052:	e7f7      	b.n	8001044 <timer_delay_ms+0xc>
 8001054:	b002      	add	sp, #8
 8001056:	bd10      	pop	{r4, pc}

08001058 <i2c_delay>:
 8001058:	bf00      	nop
 800105a:	bf00      	nop
 800105c:	4770      	bx	lr
	...

08001060 <SetLowSDA>:
 8001060:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001062:	4d0d      	ldr	r5, [pc, #52]	; (8001098 <SetLowSDA+0x38>)
 8001064:	2301      	movs	r3, #1
 8001066:	2202      	movs	r2, #2
 8001068:	f44f 4480 	mov.w	r4, #16384	; 0x4000
 800106c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001070:	f88d 3006 	strb.w	r3, [sp, #6]
 8001074:	4628      	mov	r0, r5
 8001076:	2300      	movs	r3, #0
 8001078:	4669      	mov	r1, sp
 800107a:	f88d 2005 	strb.w	r2, [sp, #5]
 800107e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001082:	9400      	str	r4, [sp, #0]
 8001084:	f000 fb6a 	bl	800175c <GPIO_Init>
 8001088:	4628      	mov	r0, r5
 800108a:	4621      	mov	r1, r4
 800108c:	f000 fba9 	bl	80017e2 <GPIO_ResetBits>
 8001090:	f7ff ffe2 	bl	8001058 <i2c_delay>
 8001094:	b003      	add	sp, #12
 8001096:	bd30      	pop	{r4, r5, pc}
 8001098:	40020400 	.word	0x40020400

0800109c <SetHighSDA>:
 800109c:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800109e:	4d0d      	ldr	r5, [pc, #52]	; (80010d4 <SetHighSDA+0x38>)
 80010a0:	2202      	movs	r2, #2
 80010a2:	2300      	movs	r3, #0
 80010a4:	f44f 4480 	mov.w	r4, #16384	; 0x4000
 80010a8:	f88d 2005 	strb.w	r2, [sp, #5]
 80010ac:	4628      	mov	r0, r5
 80010ae:	2201      	movs	r2, #1
 80010b0:	4669      	mov	r1, sp
 80010b2:	f88d 3004 	strb.w	r3, [sp, #4]
 80010b6:	f88d 2006 	strb.w	r2, [sp, #6]
 80010ba:	f88d 3007 	strb.w	r3, [sp, #7]
 80010be:	9400      	str	r4, [sp, #0]
 80010c0:	f000 fb4c 	bl	800175c <GPIO_Init>
 80010c4:	4628      	mov	r0, r5
 80010c6:	4621      	mov	r1, r4
 80010c8:	f000 fb89 	bl	80017de <GPIO_SetBits>
 80010cc:	f7ff ffc4 	bl	8001058 <i2c_delay>
 80010d0:	b003      	add	sp, #12
 80010d2:	bd30      	pop	{r4, r5, pc}
 80010d4:	40020400 	.word	0x40020400

080010d8 <SetLowSCL>:
 80010d8:	b508      	push	{r3, lr}
 80010da:	4804      	ldr	r0, [pc, #16]	; (80010ec <SetLowSCL+0x14>)
 80010dc:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80010e0:	f000 fb7f 	bl	80017e2 <GPIO_ResetBits>
 80010e4:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80010e8:	f7ff bfb6 	b.w	8001058 <i2c_delay>
 80010ec:	40020400 	.word	0x40020400

080010f0 <SetHighSCL>:
 80010f0:	b508      	push	{r3, lr}
 80010f2:	4804      	ldr	r0, [pc, #16]	; (8001104 <SetHighSCL+0x14>)
 80010f4:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80010f8:	f000 fb71 	bl	80017de <GPIO_SetBits>
 80010fc:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001100:	f7ff bfaa 	b.w	8001058 <i2c_delay>
 8001104:	40020400 	.word	0x40020400

08001108 <i2c_0_init>:
 8001108:	b507      	push	{r0, r1, r2, lr}
 800110a:	2002      	movs	r0, #2
 800110c:	2101      	movs	r1, #1
 800110e:	f000 fa87 	bl	8001620 <RCC_AHB1PeriphClockCmd>
 8001112:	f44f 4340 	mov.w	r3, #49152	; 0xc000
 8001116:	9300      	str	r3, [sp, #0]
 8001118:	2301      	movs	r3, #1
 800111a:	2202      	movs	r2, #2
 800111c:	480a      	ldr	r0, [pc, #40]	; (8001148 <i2c_0_init+0x40>)
 800111e:	f88d 3004 	strb.w	r3, [sp, #4]
 8001122:	4669      	mov	r1, sp
 8001124:	f88d 3006 	strb.w	r3, [sp, #6]
 8001128:	2300      	movs	r3, #0
 800112a:	f88d 2005 	strb.w	r2, [sp, #5]
 800112e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001132:	f000 fb13 	bl	800175c <GPIO_Init>
 8001136:	f7ff ffdb 	bl	80010f0 <SetHighSCL>
 800113a:	f7ff ff91 	bl	8001060 <SetLowSDA>
 800113e:	f7ff ffad 	bl	800109c <SetHighSDA>
 8001142:	b003      	add	sp, #12
 8001144:	f85d fb04 	ldr.w	pc, [sp], #4
 8001148:	40020400 	.word	0x40020400

0800114c <i2cStart>:
 800114c:	b508      	push	{r3, lr}
 800114e:	f7ff ffcf 	bl	80010f0 <SetHighSCL>
 8001152:	f7ff ffa3 	bl	800109c <SetHighSDA>
 8001156:	f7ff ffcb 	bl	80010f0 <SetHighSCL>
 800115a:	f7ff ff81 	bl	8001060 <SetLowSDA>
 800115e:	f7ff ffbb 	bl	80010d8 <SetLowSCL>
 8001162:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001166:	f7ff bf99 	b.w	800109c <SetHighSDA>

0800116a <i2cStop>:
 800116a:	b508      	push	{r3, lr}
 800116c:	f7ff ffb4 	bl	80010d8 <SetLowSCL>
 8001170:	f7ff ff76 	bl	8001060 <SetLowSDA>
 8001174:	f7ff ffbc 	bl	80010f0 <SetHighSCL>
 8001178:	f7ff ff72 	bl	8001060 <SetLowSDA>
 800117c:	f7ff ffb8 	bl	80010f0 <SetHighSCL>
 8001180:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001184:	f7ff bf8a 	b.w	800109c <SetHighSDA>

08001188 <i2cWrite>:
 8001188:	b538      	push	{r3, r4, r5, lr}
 800118a:	4604      	mov	r4, r0
 800118c:	2508      	movs	r5, #8
 800118e:	f7ff ffa3 	bl	80010d8 <SetLowSCL>
 8001192:	0623      	lsls	r3, r4, #24
 8001194:	d502      	bpl.n	800119c <i2cWrite+0x14>
 8001196:	f7ff ff81 	bl	800109c <SetHighSDA>
 800119a:	e001      	b.n	80011a0 <i2cWrite+0x18>
 800119c:	f7ff ff60 	bl	8001060 <SetLowSDA>
 80011a0:	3d01      	subs	r5, #1
 80011a2:	f7ff ffa5 	bl	80010f0 <SetHighSCL>
 80011a6:	0064      	lsls	r4, r4, #1
 80011a8:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80011ac:	b2e4      	uxtb	r4, r4
 80011ae:	d1ee      	bne.n	800118e <i2cWrite+0x6>
 80011b0:	f7ff ff92 	bl	80010d8 <SetLowSCL>
 80011b4:	f7ff ff72 	bl	800109c <SetHighSDA>
 80011b8:	f7ff ff9a 	bl	80010f0 <SetHighSCL>
 80011bc:	4b05      	ldr	r3, [pc, #20]	; (80011d4 <i2cWrite+0x4c>)
 80011be:	691c      	ldr	r4, [r3, #16]
 80011c0:	f7ff ff8a 	bl	80010d8 <SetLowSCL>
 80011c4:	f7ff ff48 	bl	8001058 <i2c_delay>
 80011c8:	f484 4080 	eor.w	r0, r4, #16384	; 0x4000
 80011cc:	f3c0 3080 	ubfx	r0, r0, #14, #1
 80011d0:	bd38      	pop	{r3, r4, r5, pc}
 80011d2:	bf00      	nop
 80011d4:	40020400 	.word	0x40020400

080011d8 <i2cRead>:
 80011d8:	b570      	push	{r4, r5, r6, lr}
 80011da:	4606      	mov	r6, r0
 80011dc:	f7ff ff7c 	bl	80010d8 <SetLowSCL>
 80011e0:	f7ff ff5c 	bl	800109c <SetHighSDA>
 80011e4:	2508      	movs	r5, #8
 80011e6:	2400      	movs	r4, #0
 80011e8:	f7ff ff82 	bl	80010f0 <SetHighSCL>
 80011ec:	4b0d      	ldr	r3, [pc, #52]	; (8001224 <i2cRead+0x4c>)
 80011ee:	691b      	ldr	r3, [r3, #16]
 80011f0:	0064      	lsls	r4, r4, #1
 80011f2:	045a      	lsls	r2, r3, #17
 80011f4:	b2e4      	uxtb	r4, r4
 80011f6:	bf48      	it	mi
 80011f8:	3401      	addmi	r4, #1
 80011fa:	f105 35ff 	add.w	r5, r5, #4294967295
 80011fe:	bf48      	it	mi
 8001200:	b2e4      	uxtbmi	r4, r4
 8001202:	f7ff ff69 	bl	80010d8 <SetLowSCL>
 8001206:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 800120a:	d1ed      	bne.n	80011e8 <i2cRead+0x10>
 800120c:	b10e      	cbz	r6, 8001212 <i2cRead+0x3a>
 800120e:	f7ff ff27 	bl	8001060 <SetLowSDA>
 8001212:	f7ff ff6d 	bl	80010f0 <SetHighSCL>
 8001216:	f7ff ff5f 	bl	80010d8 <SetLowSCL>
 800121a:	f7ff ff1d 	bl	8001058 <i2c_delay>
 800121e:	4620      	mov	r0, r4
 8001220:	bd70      	pop	{r4, r5, r6, pc}
 8001222:	bf00      	nop
 8001224:	40020400 	.word	0x40020400

08001228 <i2c_write_reg>:
 8001228:	b570      	push	{r4, r5, r6, lr}
 800122a:	4605      	mov	r5, r0
 800122c:	460c      	mov	r4, r1
 800122e:	4616      	mov	r6, r2
 8001230:	f7ff ff8c 	bl	800114c <i2cStart>
 8001234:	4628      	mov	r0, r5
 8001236:	f7ff ffa7 	bl	8001188 <i2cWrite>
 800123a:	4620      	mov	r0, r4
 800123c:	f7ff ffa4 	bl	8001188 <i2cWrite>
 8001240:	4630      	mov	r0, r6
 8001242:	f7ff ffa1 	bl	8001188 <i2cWrite>
 8001246:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800124a:	f7ff bf8e 	b.w	800116a <i2cStop>

0800124e <i2c_read_reg>:
 800124e:	b538      	push	{r3, r4, r5, lr}
 8001250:	4604      	mov	r4, r0
 8001252:	460d      	mov	r5, r1
 8001254:	f7ff ff7a 	bl	800114c <i2cStart>
 8001258:	4620      	mov	r0, r4
 800125a:	f7ff ff95 	bl	8001188 <i2cWrite>
 800125e:	4628      	mov	r0, r5
 8001260:	f7ff ff92 	bl	8001188 <i2cWrite>
 8001264:	f7ff ff72 	bl	800114c <i2cStart>
 8001268:	f044 0001 	orr.w	r0, r4, #1
 800126c:	f7ff ff8c 	bl	8001188 <i2cWrite>
 8001270:	2000      	movs	r0, #0
 8001272:	f7ff ffb1 	bl	80011d8 <i2cRead>
 8001276:	4604      	mov	r4, r0
 8001278:	f7ff ff77 	bl	800116a <i2cStop>
 800127c:	4620      	mov	r0, r4
 800127e:	bd38      	pop	{r3, r4, r5, pc}

08001280 <uart_write>:
 8001280:	4b03      	ldr	r3, [pc, #12]	; (8001290 <uart_write+0x10>)
 8001282:	881a      	ldrh	r2, [r3, #0]
 8001284:	0652      	lsls	r2, r2, #25
 8001286:	d401      	bmi.n	800128c <uart_write+0xc>
 8001288:	bf00      	nop
 800128a:	e7f9      	b.n	8001280 <uart_write>
 800128c:	8098      	strh	r0, [r3, #4]
 800128e:	4770      	bx	lr
 8001290:	40011000 	.word	0x40011000

08001294 <uart_init>:
 8001294:	b530      	push	{r4, r5, lr}
 8001296:	2010      	movs	r0, #16
 8001298:	b087      	sub	sp, #28
 800129a:	2101      	movs	r1, #1
 800129c:	f000 f9d8 	bl	8001650 <RCC_APB2PeriphClockCmd>
 80012a0:	2001      	movs	r0, #1
 80012a2:	4d1c      	ldr	r5, [pc, #112]	; (8001314 <uart_init+0x80>)
 80012a4:	4601      	mov	r1, r0
 80012a6:	f000 f9bb 	bl	8001620 <RCC_AHB1PeriphClockCmd>
 80012aa:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 80012ae:	2400      	movs	r4, #0
 80012b0:	9300      	str	r3, [sp, #0]
 80012b2:	4628      	mov	r0, r5
 80012b4:	2302      	movs	r3, #2
 80012b6:	4669      	mov	r1, sp
 80012b8:	f88d 3004 	strb.w	r3, [sp, #4]
 80012bc:	f88d 3005 	strb.w	r3, [sp, #5]
 80012c0:	f88d 4006 	strb.w	r4, [sp, #6]
 80012c4:	f88d 4007 	strb.w	r4, [sp, #7]
 80012c8:	f000 fa48 	bl	800175c <GPIO_Init>
 80012cc:	4628      	mov	r0, r5
 80012ce:	2109      	movs	r1, #9
 80012d0:	2207      	movs	r2, #7
 80012d2:	f000 fa88 	bl	80017e6 <GPIO_PinAFConfig>
 80012d6:	2207      	movs	r2, #7
 80012d8:	4628      	mov	r0, r5
 80012da:	210a      	movs	r1, #10
 80012dc:	f000 fa83 	bl	80017e6 <GPIO_PinAFConfig>
 80012e0:	f8ad 400c 	strh.w	r4, [sp, #12]
 80012e4:	f8ad 400e 	strh.w	r4, [sp, #14]
 80012e8:	f8ad 4010 	strh.w	r4, [sp, #16]
 80012ec:	f8ad 4014 	strh.w	r4, [sp, #20]
 80012f0:	4c09      	ldr	r4, [pc, #36]	; (8001318 <uart_init+0x84>)
 80012f2:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 80012f6:	9302      	str	r3, [sp, #8]
 80012f8:	4620      	mov	r0, r4
 80012fa:	230c      	movs	r3, #12
 80012fc:	a902      	add	r1, sp, #8
 80012fe:	f8ad 3012 	strh.w	r3, [sp, #18]
 8001302:	f000 f80b 	bl	800131c <USART_Init>
 8001306:	4620      	mov	r0, r4
 8001308:	2101      	movs	r1, #1
 800130a:	f000 f861 	bl	80013d0 <USART_Cmd>
 800130e:	b007      	add	sp, #28
 8001310:	bd30      	pop	{r4, r5, pc}
 8001312:	bf00      	nop
 8001314:	40020000 	.word	0x40020000
 8001318:	40011000 	.word	0x40011000

0800131c <USART_Init>:
 800131c:	8a03      	ldrh	r3, [r0, #16]
 800131e:	88ca      	ldrh	r2, [r1, #6]
 8001320:	b29b      	uxth	r3, r3
 8001322:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 8001326:	b530      	push	{r4, r5, lr}
 8001328:	4313      	orrs	r3, r2
 800132a:	460d      	mov	r5, r1
 800132c:	8203      	strh	r3, [r0, #16]
 800132e:	8983      	ldrh	r3, [r0, #12]
 8001330:	8909      	ldrh	r1, [r1, #8]
 8001332:	88aa      	ldrh	r2, [r5, #4]
 8001334:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8001338:	430a      	orrs	r2, r1
 800133a:	8969      	ldrh	r1, [r5, #10]
 800133c:	f023 030c 	bic.w	r3, r3, #12
 8001340:	430a      	orrs	r2, r1
 8001342:	041b      	lsls	r3, r3, #16
 8001344:	b292      	uxth	r2, r2
 8001346:	0c1b      	lsrs	r3, r3, #16
 8001348:	4313      	orrs	r3, r2
 800134a:	8183      	strh	r3, [r0, #12]
 800134c:	8a83      	ldrh	r3, [r0, #20]
 800134e:	89aa      	ldrh	r2, [r5, #12]
 8001350:	b29b      	uxth	r3, r3
 8001352:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001356:	4313      	orrs	r3, r2
 8001358:	b085      	sub	sp, #20
 800135a:	8283      	strh	r3, [r0, #20]
 800135c:	4604      	mov	r4, r0
 800135e:	4668      	mov	r0, sp
 8001360:	f000 f91a 	bl	8001598 <RCC_GetClocksFreq>
 8001364:	4b19      	ldr	r3, [pc, #100]	; (80013cc <USART_Init+0xb0>)
 8001366:	429c      	cmp	r4, r3
 8001368:	d003      	beq.n	8001372 <USART_Init+0x56>
 800136a:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 800136e:	429c      	cmp	r4, r3
 8001370:	d101      	bne.n	8001376 <USART_Init+0x5a>
 8001372:	9b03      	ldr	r3, [sp, #12]
 8001374:	e000      	b.n	8001378 <USART_Init+0x5c>
 8001376:	9b02      	ldr	r3, [sp, #8]
 8001378:	89a2      	ldrh	r2, [r4, #12]
 800137a:	b212      	sxth	r2, r2
 800137c:	2a00      	cmp	r2, #0
 800137e:	682a      	ldr	r2, [r5, #0]
 8001380:	f04f 0119 	mov.w	r1, #25
 8001384:	bfb4      	ite	lt
 8001386:	0052      	lsllt	r2, r2, #1
 8001388:	0092      	lslge	r2, r2, #2
 800138a:	4359      	muls	r1, r3
 800138c:	fbb1 f1f2 	udiv	r1, r1, r2
 8001390:	2364      	movs	r3, #100	; 0x64
 8001392:	fbb1 f2f3 	udiv	r2, r1, r3
 8001396:	0112      	lsls	r2, r2, #4
 8001398:	0910      	lsrs	r0, r2, #4
 800139a:	fb03 1110 	mls	r1, r3, r0, r1
 800139e:	89a0      	ldrh	r0, [r4, #12]
 80013a0:	b200      	sxth	r0, r0
 80013a2:	2800      	cmp	r0, #0
 80013a4:	da06      	bge.n	80013b4 <USART_Init+0x98>
 80013a6:	00c9      	lsls	r1, r1, #3
 80013a8:	3132      	adds	r1, #50	; 0x32
 80013aa:	fbb1 f3f3 	udiv	r3, r1, r3
 80013ae:	f003 0307 	and.w	r3, r3, #7
 80013b2:	e005      	b.n	80013c0 <USART_Init+0xa4>
 80013b4:	0109      	lsls	r1, r1, #4
 80013b6:	3132      	adds	r1, #50	; 0x32
 80013b8:	fbb1 f3f3 	udiv	r3, r1, r3
 80013bc:	f003 030f 	and.w	r3, r3, #15
 80013c0:	431a      	orrs	r2, r3
 80013c2:	b292      	uxth	r2, r2
 80013c4:	8122      	strh	r2, [r4, #8]
 80013c6:	b005      	add	sp, #20
 80013c8:	bd30      	pop	{r4, r5, pc}
 80013ca:	bf00      	nop
 80013cc:	40011000 	.word	0x40011000

080013d0 <USART_Cmd>:
 80013d0:	8983      	ldrh	r3, [r0, #12]
 80013d2:	b119      	cbz	r1, 80013dc <USART_Cmd+0xc>
 80013d4:	b29b      	uxth	r3, r3
 80013d6:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 80013da:	e003      	b.n	80013e4 <USART_Cmd+0x14>
 80013dc:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 80013e0:	041b      	lsls	r3, r3, #16
 80013e2:	0c1b      	lsrs	r3, r3, #16
 80013e4:	8183      	strh	r3, [r0, #12]
 80013e6:	4770      	bx	lr

080013e8 <sys_tick_init>:
 80013e8:	4b05      	ldr	r3, [pc, #20]	; (8001400 <sys_tick_init+0x18>)
 80013ea:	4a06      	ldr	r2, [pc, #24]	; (8001404 <sys_tick_init+0x1c>)
 80013ec:	605a      	str	r2, [r3, #4]
 80013ee:	4a06      	ldr	r2, [pc, #24]	; (8001408 <sys_tick_init+0x20>)
 80013f0:	21f0      	movs	r1, #240	; 0xf0
 80013f2:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 80013f6:	2200      	movs	r2, #0
 80013f8:	609a      	str	r2, [r3, #8]
 80013fa:	2207      	movs	r2, #7
 80013fc:	601a      	str	r2, [r3, #0]
 80013fe:	4770      	bx	lr
 8001400:	e000e010 	.word	0xe000e010
 8001404:	00029040 	.word	0x00029040
 8001408:	e000ed00 	.word	0xe000ed00

0800140c <sleep>:
 800140c:	bf30      	wfi
 800140e:	4770      	bx	lr

08001410 <sytem_clock_init>:
 8001410:	f000 b800 	b.w	8001414 <SystemInit>

08001414 <SystemInit>:
 8001414:	4b3b      	ldr	r3, [pc, #236]	; (8001504 <SystemInit+0xf0>)
 8001416:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800141a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800141e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001422:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001426:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800142a:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800142e:	4b36      	ldr	r3, [pc, #216]	; (8001508 <SystemInit+0xf4>)
 8001430:	681a      	ldr	r2, [r3, #0]
 8001432:	f042 0201 	orr.w	r2, r2, #1
 8001436:	601a      	str	r2, [r3, #0]
 8001438:	2200      	movs	r2, #0
 800143a:	609a      	str	r2, [r3, #8]
 800143c:	6819      	ldr	r1, [r3, #0]
 800143e:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 8001442:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 8001446:	6019      	str	r1, [r3, #0]
 8001448:	4930      	ldr	r1, [pc, #192]	; (800150c <SystemInit+0xf8>)
 800144a:	6059      	str	r1, [r3, #4]
 800144c:	6819      	ldr	r1, [r3, #0]
 800144e:	b082      	sub	sp, #8
 8001450:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 8001454:	6019      	str	r1, [r3, #0]
 8001456:	60da      	str	r2, [r3, #12]
 8001458:	9200      	str	r2, [sp, #0]
 800145a:	9201      	str	r2, [sp, #4]
 800145c:	681a      	ldr	r2, [r3, #0]
 800145e:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001462:	601a      	str	r2, [r3, #0]
 8001464:	4b28      	ldr	r3, [pc, #160]	; (8001508 <SystemInit+0xf4>)
 8001466:	681a      	ldr	r2, [r3, #0]
 8001468:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 800146c:	9201      	str	r2, [sp, #4]
 800146e:	9a00      	ldr	r2, [sp, #0]
 8001470:	3201      	adds	r2, #1
 8001472:	9200      	str	r2, [sp, #0]
 8001474:	9a01      	ldr	r2, [sp, #4]
 8001476:	b91a      	cbnz	r2, 8001480 <SystemInit+0x6c>
 8001478:	9a00      	ldr	r2, [sp, #0]
 800147a:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 800147e:	d1f1      	bne.n	8001464 <SystemInit+0x50>
 8001480:	681b      	ldr	r3, [r3, #0]
 8001482:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8001486:	bf18      	it	ne
 8001488:	2301      	movne	r3, #1
 800148a:	9301      	str	r3, [sp, #4]
 800148c:	9b01      	ldr	r3, [sp, #4]
 800148e:	2b01      	cmp	r3, #1
 8001490:	d005      	beq.n	800149e <SystemInit+0x8a>
 8001492:	4b1c      	ldr	r3, [pc, #112]	; (8001504 <SystemInit+0xf0>)
 8001494:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8001498:	609a      	str	r2, [r3, #8]
 800149a:	b002      	add	sp, #8
 800149c:	4770      	bx	lr
 800149e:	4b1a      	ldr	r3, [pc, #104]	; (8001508 <SystemInit+0xf4>)
 80014a0:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80014a2:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 80014a6:	641a      	str	r2, [r3, #64]	; 0x40
 80014a8:	4a19      	ldr	r2, [pc, #100]	; (8001510 <SystemInit+0xfc>)
 80014aa:	6811      	ldr	r1, [r2, #0]
 80014ac:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 80014b0:	6011      	str	r1, [r2, #0]
 80014b2:	689a      	ldr	r2, [r3, #8]
 80014b4:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 80014b8:	609a      	str	r2, [r3, #8]
 80014ba:	689a      	ldr	r2, [r3, #8]
 80014bc:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 80014c0:	609a      	str	r2, [r3, #8]
 80014c2:	689a      	ldr	r2, [r3, #8]
 80014c4:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 80014c8:	609a      	str	r2, [r3, #8]
 80014ca:	4a12      	ldr	r2, [pc, #72]	; (8001514 <SystemInit+0x100>)
 80014cc:	605a      	str	r2, [r3, #4]
 80014ce:	681a      	ldr	r2, [r3, #0]
 80014d0:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 80014d4:	601a      	str	r2, [r3, #0]
 80014d6:	6819      	ldr	r1, [r3, #0]
 80014d8:	4a0b      	ldr	r2, [pc, #44]	; (8001508 <SystemInit+0xf4>)
 80014da:	0189      	lsls	r1, r1, #6
 80014dc:	d5fb      	bpl.n	80014d6 <SystemInit+0xc2>
 80014de:	4b0e      	ldr	r3, [pc, #56]	; (8001518 <SystemInit+0x104>)
 80014e0:	f240 6105 	movw	r1, #1541	; 0x605
 80014e4:	6019      	str	r1, [r3, #0]
 80014e6:	6893      	ldr	r3, [r2, #8]
 80014e8:	f023 0303 	bic.w	r3, r3, #3
 80014ec:	6093      	str	r3, [r2, #8]
 80014ee:	6893      	ldr	r3, [r2, #8]
 80014f0:	f043 0302 	orr.w	r3, r3, #2
 80014f4:	6093      	str	r3, [r2, #8]
 80014f6:	4b04      	ldr	r3, [pc, #16]	; (8001508 <SystemInit+0xf4>)
 80014f8:	689b      	ldr	r3, [r3, #8]
 80014fa:	f003 030c 	and.w	r3, r3, #12
 80014fe:	2b08      	cmp	r3, #8
 8001500:	d1f9      	bne.n	80014f6 <SystemInit+0xe2>
 8001502:	e7c6      	b.n	8001492 <SystemInit+0x7e>
 8001504:	e000ed00 	.word	0xe000ed00
 8001508:	40023800 	.word	0x40023800
 800150c:	24003010 	.word	0x24003010
 8001510:	40007000 	.word	0x40007000
 8001514:	07405408 	.word	0x07405408
 8001518:	40023c00 	.word	0x40023c00

0800151c <Default_Handler>:
 800151c:	4668      	mov	r0, sp
 800151e:	f020 0107 	bic.w	r1, r0, #7
 8001522:	468d      	mov	sp, r1
 8001524:	bf00      	nop
 8001526:	e7fd      	b.n	8001524 <Default_Handler+0x8>

08001528 <HardFault_Handler>:
 8001528:	2010      	movs	r0, #16
 800152a:	f000 f8ab 	bl	8001684 <led_on>
 800152e:	4b06      	ldr	r3, [pc, #24]	; (8001548 <HardFault_Handler+0x20>)
 8001530:	3b01      	subs	r3, #1
 8001532:	d001      	beq.n	8001538 <HardFault_Handler+0x10>
 8001534:	bf00      	nop
 8001536:	e7fb      	b.n	8001530 <HardFault_Handler+0x8>
 8001538:	2010      	movs	r0, #16
 800153a:	f000 f8ab 	bl	8001694 <led_off>
 800153e:	4b02      	ldr	r3, [pc, #8]	; (8001548 <HardFault_Handler+0x20>)
 8001540:	3b01      	subs	r3, #1
 8001542:	d0f1      	beq.n	8001528 <HardFault_Handler>
 8001544:	bf00      	nop
 8001546:	e7fb      	b.n	8001540 <HardFault_Handler+0x18>
 8001548:	00989681 	.word	0x00989681

0800154c <_reset_init>:
 800154c:	4a0e      	ldr	r2, [pc, #56]	; (8001588 <_reset_init+0x3c>)
 800154e:	480f      	ldr	r0, [pc, #60]	; (800158c <_reset_init+0x40>)
 8001550:	1a80      	subs	r0, r0, r2
 8001552:	1080      	asrs	r0, r0, #2
 8001554:	2300      	movs	r3, #0
 8001556:	4283      	cmp	r3, r0
 8001558:	d006      	beq.n	8001568 <_reset_init+0x1c>
 800155a:	490d      	ldr	r1, [pc, #52]	; (8001590 <_reset_init+0x44>)
 800155c:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8001560:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001564:	3301      	adds	r3, #1
 8001566:	e7f6      	b.n	8001556 <_reset_init+0xa>
 8001568:	4b0a      	ldr	r3, [pc, #40]	; (8001594 <_reset_init+0x48>)
 800156a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800156e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001572:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001576:	f503 730c 	add.w	r3, r3, #560	; 0x230
 800157a:	685a      	ldr	r2, [r3, #4]
 800157c:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8001580:	605a      	str	r2, [r3, #4]
 8001582:	f7ff b8a5 	b.w	80006d0 <main>
 8001586:	bf00      	nop
 8001588:	20000000 	.word	0x20000000
 800158c:	20000014 	.word	0x20000014
 8001590:	08001a60 	.word	0x08001a60
 8001594:	e000ed00 	.word	0xe000ed00

08001598 <RCC_GetClocksFreq>:
 8001598:	4b1d      	ldr	r3, [pc, #116]	; (8001610 <RCC_GetClocksFreq+0x78>)
 800159a:	689a      	ldr	r2, [r3, #8]
 800159c:	f002 020c 	and.w	r2, r2, #12
 80015a0:	2a04      	cmp	r2, #4
 80015a2:	b510      	push	{r4, lr}
 80015a4:	d003      	beq.n	80015ae <RCC_GetClocksFreq+0x16>
 80015a6:	2a08      	cmp	r2, #8
 80015a8:	d003      	beq.n	80015b2 <RCC_GetClocksFreq+0x1a>
 80015aa:	4b1a      	ldr	r3, [pc, #104]	; (8001614 <RCC_GetClocksFreq+0x7c>)
 80015ac:	e018      	b.n	80015e0 <RCC_GetClocksFreq+0x48>
 80015ae:	4b1a      	ldr	r3, [pc, #104]	; (8001618 <RCC_GetClocksFreq+0x80>)
 80015b0:	e016      	b.n	80015e0 <RCC_GetClocksFreq+0x48>
 80015b2:	6859      	ldr	r1, [r3, #4]
 80015b4:	685a      	ldr	r2, [r3, #4]
 80015b6:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 80015ba:	6859      	ldr	r1, [r3, #4]
 80015bc:	bf14      	ite	ne
 80015be:	4b16      	ldrne	r3, [pc, #88]	; (8001618 <RCC_GetClocksFreq+0x80>)
 80015c0:	4b14      	ldreq	r3, [pc, #80]	; (8001614 <RCC_GetClocksFreq+0x7c>)
 80015c2:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 80015c6:	fbb3 f3f2 	udiv	r3, r3, r2
 80015ca:	4a11      	ldr	r2, [pc, #68]	; (8001610 <RCC_GetClocksFreq+0x78>)
 80015cc:	6852      	ldr	r2, [r2, #4]
 80015ce:	f3c2 4201 	ubfx	r2, r2, #16, #2
 80015d2:	f3c1 1188 	ubfx	r1, r1, #6, #9
 80015d6:	3201      	adds	r2, #1
 80015d8:	434b      	muls	r3, r1
 80015da:	0052      	lsls	r2, r2, #1
 80015dc:	fbb3 f3f2 	udiv	r3, r3, r2
 80015e0:	490b      	ldr	r1, [pc, #44]	; (8001610 <RCC_GetClocksFreq+0x78>)
 80015e2:	6003      	str	r3, [r0, #0]
 80015e4:	688b      	ldr	r3, [r1, #8]
 80015e6:	4a0d      	ldr	r2, [pc, #52]	; (800161c <RCC_GetClocksFreq+0x84>)
 80015e8:	f3c3 1303 	ubfx	r3, r3, #4, #4
 80015ec:	5cd4      	ldrb	r4, [r2, r3]
 80015ee:	6803      	ldr	r3, [r0, #0]
 80015f0:	40e3      	lsrs	r3, r4
 80015f2:	6043      	str	r3, [r0, #4]
 80015f4:	688c      	ldr	r4, [r1, #8]
 80015f6:	f3c4 2482 	ubfx	r4, r4, #10, #3
 80015fa:	5d14      	ldrb	r4, [r2, r4]
 80015fc:	fa23 f404 	lsr.w	r4, r3, r4
 8001600:	6084      	str	r4, [r0, #8]
 8001602:	6889      	ldr	r1, [r1, #8]
 8001604:	f3c1 3142 	ubfx	r1, r1, #13, #3
 8001608:	5c52      	ldrb	r2, [r2, r1]
 800160a:	40d3      	lsrs	r3, r2
 800160c:	60c3      	str	r3, [r0, #12]
 800160e:	bd10      	pop	{r4, pc}
 8001610:	40023800 	.word	0x40023800
 8001614:	00f42400 	.word	0x00f42400
 8001618:	007a1200 	.word	0x007a1200
 800161c:	20000004 	.word	0x20000004

08001620 <RCC_AHB1PeriphClockCmd>:
 8001620:	4b04      	ldr	r3, [pc, #16]	; (8001634 <RCC_AHB1PeriphClockCmd+0x14>)
 8001622:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8001624:	b109      	cbz	r1, 800162a <RCC_AHB1PeriphClockCmd+0xa>
 8001626:	4310      	orrs	r0, r2
 8001628:	e001      	b.n	800162e <RCC_AHB1PeriphClockCmd+0xe>
 800162a:	ea22 0000 	bic.w	r0, r2, r0
 800162e:	6318      	str	r0, [r3, #48]	; 0x30
 8001630:	4770      	bx	lr
 8001632:	bf00      	nop
 8001634:	40023800 	.word	0x40023800

08001638 <RCC_APB1PeriphClockCmd>:
 8001638:	4b04      	ldr	r3, [pc, #16]	; (800164c <RCC_APB1PeriphClockCmd+0x14>)
 800163a:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 800163c:	b109      	cbz	r1, 8001642 <RCC_APB1PeriphClockCmd+0xa>
 800163e:	4310      	orrs	r0, r2
 8001640:	e001      	b.n	8001646 <RCC_APB1PeriphClockCmd+0xe>
 8001642:	ea22 0000 	bic.w	r0, r2, r0
 8001646:	6418      	str	r0, [r3, #64]	; 0x40
 8001648:	4770      	bx	lr
 800164a:	bf00      	nop
 800164c:	40023800 	.word	0x40023800

08001650 <RCC_APB2PeriphClockCmd>:
 8001650:	4b04      	ldr	r3, [pc, #16]	; (8001664 <RCC_APB2PeriphClockCmd+0x14>)
 8001652:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8001654:	b109      	cbz	r1, 800165a <RCC_APB2PeriphClockCmd+0xa>
 8001656:	4310      	orrs	r0, r2
 8001658:	e001      	b.n	800165e <RCC_APB2PeriphClockCmd+0xe>
 800165a:	ea22 0000 	bic.w	r0, r2, r0
 800165e:	6458      	str	r0, [r3, #68]	; 0x44
 8001660:	4770      	bx	lr
 8001662:	bf00      	nop
 8001664:	40023800 	.word	0x40023800

08001668 <lib_low_level_init>:
 8001668:	b508      	push	{r3, lr}
 800166a:	f7ff fed1 	bl	8001410 <sytem_clock_init>
 800166e:	f000 f819 	bl	80016a4 <gpio_init>
 8001672:	f7ff fe0f 	bl	8001294 <uart_init>
 8001676:	f7ff fc55 	bl	8000f24 <timer_init>
 800167a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800167e:	f7ff bd43 	b.w	8001108 <i2c_0_init>
	...

08001684 <led_on>:
 8001684:	b672      	cpsid	i
 8001686:	4b02      	ldr	r3, [pc, #8]	; (8001690 <led_on+0xc>)
 8001688:	b280      	uxth	r0, r0
 800168a:	8318      	strh	r0, [r3, #24]
 800168c:	b662      	cpsie	i
 800168e:	4770      	bx	lr
 8001690:	40020400 	.word	0x40020400

08001694 <led_off>:
 8001694:	b672      	cpsid	i
 8001696:	4b02      	ldr	r3, [pc, #8]	; (80016a0 <led_off+0xc>)
 8001698:	b280      	uxth	r0, r0
 800169a:	8358      	strh	r0, [r3, #26]
 800169c:	b662      	cpsie	i
 800169e:	4770      	bx	lr
 80016a0:	40020400 	.word	0x40020400

080016a4 <gpio_init>:
 80016a4:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80016a6:	2001      	movs	r0, #1
 80016a8:	4601      	mov	r1, r0
 80016aa:	f7ff ffb9 	bl	8001620 <RCC_AHB1PeriphClockCmd>
 80016ae:	2002      	movs	r0, #2
 80016b0:	2101      	movs	r1, #1
 80016b2:	f7ff ffb5 	bl	8001620 <RCC_AHB1PeriphClockCmd>
 80016b6:	2004      	movs	r0, #4
 80016b8:	2101      	movs	r1, #1
 80016ba:	f7ff ffb1 	bl	8001620 <RCC_AHB1PeriphClockCmd>
 80016be:	2008      	movs	r0, #8
 80016c0:	2101      	movs	r1, #1
 80016c2:	f7ff ffad 	bl	8001620 <RCC_AHB1PeriphClockCmd>
 80016c6:	2008      	movs	r0, #8
 80016c8:	2101      	movs	r1, #1
 80016ca:	f7ff ffa9 	bl	8001620 <RCC_AHB1PeriphClockCmd>
 80016ce:	2010      	movs	r0, #16
 80016d0:	2101      	movs	r1, #1
 80016d2:	f7ff ffa5 	bl	8001620 <RCC_AHB1PeriphClockCmd>
 80016d6:	2020      	movs	r0, #32
 80016d8:	2101      	movs	r1, #1
 80016da:	f7ff ffa1 	bl	8001620 <RCC_AHB1PeriphClockCmd>
 80016de:	2400      	movs	r4, #0
 80016e0:	2601      	movs	r6, #1
 80016e2:	2370      	movs	r3, #112	; 0x70
 80016e4:	2703      	movs	r7, #3
 80016e6:	4669      	mov	r1, sp
 80016e8:	4819      	ldr	r0, [pc, #100]	; (8001750 <gpio_init+0xac>)
 80016ea:	9300      	str	r3, [sp, #0]
 80016ec:	f88d 4006 	strb.w	r4, [sp, #6]
 80016f0:	f88d 4007 	strb.w	r4, [sp, #7]
 80016f4:	f88d 6004 	strb.w	r6, [sp, #4]
 80016f8:	f88d 7005 	strb.w	r7, [sp, #5]
 80016fc:	f000 f82e 	bl	800175c <GPIO_Init>
 8001700:	2302      	movs	r3, #2
 8001702:	4669      	mov	r1, sp
 8001704:	4813      	ldr	r0, [pc, #76]	; (8001754 <gpio_init+0xb0>)
 8001706:	f88d 3005 	strb.w	r3, [sp, #5]
 800170a:	f88d 4004 	strb.w	r4, [sp, #4]
 800170e:	9600      	str	r6, [sp, #0]
 8001710:	f000 f824 	bl	800175c <GPIO_Init>
 8001714:	f88d 4006 	strb.w	r4, [sp, #6]
 8001718:	f88d 4007 	strb.w	r4, [sp, #7]
 800171c:	4c0e      	ldr	r4, [pc, #56]	; (8001758 <gpio_init+0xb4>)
 800171e:	f88d 6004 	strb.w	r6, [sp, #4]
 8001722:	2520      	movs	r5, #32
 8001724:	4620      	mov	r0, r4
 8001726:	4669      	mov	r1, sp
 8001728:	9500      	str	r5, [sp, #0]
 800172a:	f88d 7005 	strb.w	r7, [sp, #5]
 800172e:	f000 f815 	bl	800175c <GPIO_Init>
 8001732:	4629      	mov	r1, r5
 8001734:	4620      	mov	r0, r4
 8001736:	f000 f852 	bl	80017de <GPIO_SetBits>
 800173a:	2010      	movs	r0, #16
 800173c:	f7ff ffaa 	bl	8001694 <led_off>
 8001740:	4628      	mov	r0, r5
 8001742:	f7ff ffa7 	bl	8001694 <led_off>
 8001746:	2040      	movs	r0, #64	; 0x40
 8001748:	f7ff ffa4 	bl	8001694 <led_off>
 800174c:	b003      	add	sp, #12
 800174e:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001750:	40020400 	.word	0x40020400
 8001754:	40020000 	.word	0x40020000
 8001758:	40020800 	.word	0x40020800

0800175c <GPIO_Init>:
 800175c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8001760:	680f      	ldr	r7, [r1, #0]
 8001762:	2300      	movs	r3, #0
 8001764:	2201      	movs	r2, #1
 8001766:	409a      	lsls	r2, r3
 8001768:	ea02 0507 	and.w	r5, r2, r7
 800176c:	4295      	cmp	r5, r2
 800176e:	d131      	bne.n	80017d4 <GPIO_Init+0x78>
 8001770:	005a      	lsls	r2, r3, #1
 8001772:	2403      	movs	r4, #3
 8001774:	6806      	ldr	r6, [r0, #0]
 8001776:	4094      	lsls	r4, r2
 8001778:	43e4      	mvns	r4, r4
 800177a:	4026      	ands	r6, r4
 800177c:	6006      	str	r6, [r0, #0]
 800177e:	790e      	ldrb	r6, [r1, #4]
 8001780:	f8d0 c000 	ldr.w	ip, [r0]
 8001784:	fa06 f802 	lsl.w	r8, r6, r2
 8001788:	3e01      	subs	r6, #1
 800178a:	b2f6      	uxtb	r6, r6
 800178c:	ea48 0c0c 	orr.w	ip, r8, ip
 8001790:	2e01      	cmp	r6, #1
 8001792:	f8c0 c000 	str.w	ip, [r0]
 8001796:	d814      	bhi.n	80017c2 <GPIO_Init+0x66>
 8001798:	6886      	ldr	r6, [r0, #8]
 800179a:	f891 c005 	ldrb.w	ip, [r1, #5]
 800179e:	4026      	ands	r6, r4
 80017a0:	6086      	str	r6, [r0, #8]
 80017a2:	6886      	ldr	r6, [r0, #8]
 80017a4:	fa0c fc02 	lsl.w	ip, ip, r2
 80017a8:	ea4c 0606 	orr.w	r6, ip, r6
 80017ac:	6086      	str	r6, [r0, #8]
 80017ae:	6846      	ldr	r6, [r0, #4]
 80017b0:	ea26 0505 	bic.w	r5, r6, r5
 80017b4:	6045      	str	r5, [r0, #4]
 80017b6:	798d      	ldrb	r5, [r1, #6]
 80017b8:	6846      	ldr	r6, [r0, #4]
 80017ba:	409d      	lsls	r5, r3
 80017bc:	b2ad      	uxth	r5, r5
 80017be:	4335      	orrs	r5, r6
 80017c0:	6045      	str	r5, [r0, #4]
 80017c2:	68c5      	ldr	r5, [r0, #12]
 80017c4:	402c      	ands	r4, r5
 80017c6:	60c4      	str	r4, [r0, #12]
 80017c8:	79cd      	ldrb	r5, [r1, #7]
 80017ca:	68c4      	ldr	r4, [r0, #12]
 80017cc:	fa05 f202 	lsl.w	r2, r5, r2
 80017d0:	4322      	orrs	r2, r4
 80017d2:	60c2      	str	r2, [r0, #12]
 80017d4:	3301      	adds	r3, #1
 80017d6:	2b10      	cmp	r3, #16
 80017d8:	d1c4      	bne.n	8001764 <GPIO_Init+0x8>
 80017da:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

080017de <GPIO_SetBits>:
 80017de:	8301      	strh	r1, [r0, #24]
 80017e0:	4770      	bx	lr

080017e2 <GPIO_ResetBits>:
 80017e2:	8341      	strh	r1, [r0, #26]
 80017e4:	4770      	bx	lr

080017e6 <GPIO_PinAFConfig>:
 80017e6:	f001 0307 	and.w	r3, r1, #7
 80017ea:	08c9      	lsrs	r1, r1, #3
 80017ec:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 80017f0:	b510      	push	{r4, lr}
 80017f2:	009b      	lsls	r3, r3, #2
 80017f4:	6a04      	ldr	r4, [r0, #32]
 80017f6:	210f      	movs	r1, #15
 80017f8:	4099      	lsls	r1, r3
 80017fa:	ea24 0101 	bic.w	r1, r4, r1
 80017fe:	6201      	str	r1, [r0, #32]
 8001800:	6a01      	ldr	r1, [r0, #32]
 8001802:	409a      	lsls	r2, r3
 8001804:	4311      	orrs	r1, r2
 8001806:	6201      	str	r1, [r0, #32]
 8001808:	bd10      	pop	{r4, pc}
	...

0800180c <NVIC_Init>:
 800180c:	78c2      	ldrb	r2, [r0, #3]
 800180e:	7803      	ldrb	r3, [r0, #0]
 8001810:	b510      	push	{r4, lr}
 8001812:	b30a      	cbz	r2, 8001858 <NVIC_Init+0x4c>
 8001814:	4a16      	ldr	r2, [pc, #88]	; (8001870 <NVIC_Init+0x64>)
 8001816:	7844      	ldrb	r4, [r0, #1]
 8001818:	68d2      	ldr	r2, [r2, #12]
 800181a:	43d2      	mvns	r2, r2
 800181c:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001820:	f1c2 0104 	rsb	r1, r2, #4
 8001824:	b2c9      	uxtb	r1, r1
 8001826:	fa04 f101 	lsl.w	r1, r4, r1
 800182a:	240f      	movs	r4, #15
 800182c:	fa44 f202 	asr.w	r2, r4, r2
 8001830:	7884      	ldrb	r4, [r0, #2]
 8001832:	b2c9      	uxtb	r1, r1
 8001834:	4022      	ands	r2, r4
 8001836:	430a      	orrs	r2, r1
 8001838:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 800183c:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001840:	0112      	lsls	r2, r2, #4
 8001842:	b2d2      	uxtb	r2, r2
 8001844:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8001848:	7803      	ldrb	r3, [r0, #0]
 800184a:	2201      	movs	r2, #1
 800184c:	0959      	lsrs	r1, r3, #5
 800184e:	f003 031f 	and.w	r3, r3, #31
 8001852:	fa02 f303 	lsl.w	r3, r2, r3
 8001856:	e006      	b.n	8001866 <NVIC_Init+0x5a>
 8001858:	0959      	lsrs	r1, r3, #5
 800185a:	2201      	movs	r2, #1
 800185c:	f003 031f 	and.w	r3, r3, #31
 8001860:	fa02 f303 	lsl.w	r3, r2, r3
 8001864:	3120      	adds	r1, #32
 8001866:	4a03      	ldr	r2, [pc, #12]	; (8001874 <NVIC_Init+0x68>)
 8001868:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 800186c:	bd10      	pop	{r4, pc}
 800186e:	bf00      	nop
 8001870:	e000ed00 	.word	0xe000ed00
 8001874:	e000e100 	.word	0xe000e100

08001878 <_init>:
 8001878:	e1a0c00d 	mov	ip, sp
 800187c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001880:	e24cb004 	sub	fp, ip, #4
 8001884:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001888:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 800188c:	e12fff1e 	bx	lr

08001890 <_fini>:
 8001890:	e1a0c00d 	mov	ip, sp
 8001894:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001898:	e24cb004 	sub	fp, ip, #4
 800189c:	e24bd028 	sub	sp, fp, #40	; 0x28
 80018a0:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80018a4:	e12fff1e 	bx	lr
 80018a8:	69647473 	.word	0x69647473
 80018ac:	6e69206f 	.word	0x6e69206f
 80018b0:	64207469 	.word	0x64207469
 80018b4:	0a656e6f 	.word	0x0a656e6f
 80018b8:	00          	.byte	0x00
 80018b9:	62          	.byte	0x62
 80018ba:	6f6f      	.short	0x6f6f
 80018bc:	676e6974 	.word	0x676e6974
 80018c0:	6f726620 	.word	0x6f726620
 80018c4:	7525206d 	.word	0x7525206d
 80018c8:	6172000a 	.word	0x6172000a
 80018cc:	7473206d 	.word	0x7473206d
 80018d0:	20747261 	.word	0x20747261
 80018d4:	0a207525 	.word	0x0a207525
 80018d8:	6d617200 	.word	0x6d617200
 80018dc:	7a697320 	.word	0x7a697320
 80018e0:	75252065 	.word	0x75252065
 80018e4:	72000a20 	.word	0x72000a20
 80018e8:	66206d61 	.word	0x66206d61
 80018ec:	20656572 	.word	0x20656572
 80018f0:	0a207525 	.word	0x0a207525
 80018f4:	61656800 	.word	0x61656800
 80018f8:	74732070 	.word	0x74732070
 80018fc:	20747261 	.word	0x20747261
 8001900:	0a207525 	.word	0x0a207525
 8001904:	00          	.byte	0x00
 8001905:	72          	.byte	0x72
 8001906:	626f      	.short	0x626f
 8001908:	6520746f 	.word	0x6520746f
 800190c:	726f7272 	.word	0x726f7272
 8001910:	3a732520 	.word	0x3a732520
 8001914:	000a7525 	.word	0x000a7525
 8001918:	5f62696c 	.word	0x5f62696c
 800191c:	2f727375 	.word	0x2f727375
 8001920:	69726561 	.word	0x69726561
 8001924:	6f725f73 	.word	0x6f725f73
 8001928:	2f746f62 	.word	0x2f746f62
 800192c:	69726561 	.word	0x69726561
 8001930:	6f725f73 	.word	0x6f725f73
 8001934:	2e746f62 	.word	0x2e746f62
 8001938:	205b0063 	.word	0x205b0063
 800193c:	25206925 	.word	0x25206925
 8001940:	69252069 	.word	0x69252069
 8001944:	00205d20 	.word	0x00205d20
 8001948:	6925203e 	.word	0x6925203e
 800194c:	3e3e3e20 	.word	0x3e3e3e20
 8001950:	2069253e 	.word	0x2069253e
 8001954:	205b003c 	.word	0x205b003c
 8001958:	25206925 	.word	0x25206925
 800195c:	69252069 	.word	0x69252069
 8001960:	5d692520 	.word	0x5d692520
 8001964:	2d000a20 	.word	0x2d000a20
 8001968:	2d2d2d2d 	.word	0x2d2d2d2d
 800196c:	2d2d2d2d 	.word	0x2d2d2d2d
 8001970:	2d2d2d2d 	.word	0x2d2d2d2d
 8001974:	2d2d2d2d 	.word	0x2d2d2d2d
 8001978:	2d2d2d2d 	.word	0x2d2d2d2d
 800197c:	2d2d2d2d 	.word	0x2d2d2d2d
 8001980:	2d2d2d2d 	.word	0x2d2d2d2d
 8001984:	2d2d2d2d 	.word	0x2d2d2d2d
 8001988:	2d2d2d2d 	.word	0x2d2d2d2d
 800198c:	2d2d2d2d 	.word	0x2d2d2d2d
 8001990:	2d2d2d2d 	.word	0x2d2d2d2d
 8001994:	2d2d2d2d 	.word	0x2d2d2d2d
 8001998:	0a2d2d2d 	.word	0x0a2d2d2d
 800199c:	000a      	.short	0x000a
 800199e:	6e61      	.short	0x6e61
 80019a0:	6568746f 	.word	0x6568746f
 80019a4:	68632072 	.word	0x68632072
 80019a8:	20646c69 	.word	0x20646c69
 80019ac:	65726874 	.word	0x65726874
 80019b0:	202c6461 	.word	0x202c6461
 80019b4:	20736572 	.word	0x20736572
 80019b8:	000a7525 	.word	0x000a7525
 80019bc:	65726874 	.word	0x65726874
 80019c0:	31206461 	.word	0x31206461
 80019c4:	7263000a 	.word	0x7263000a
 80019c8:	69746165 	.word	0x69746165
 80019cc:	6320676e 	.word	0x6320676e
 80019d0:	646c6968 	.word	0x646c6968
 80019d4:	72687420 	.word	0x72687420
 80019d8:	0a646165 	.word	0x0a646165
 80019dc:	72687400 	.word	0x72687400
 80019e0:	20646165 	.word	0x20646165
 80019e4:	61657263 	.word	0x61657263
 80019e8:	676e6974 	.word	0x676e6974
 80019ec:	72726520 	.word	0x72726520
 80019f0:	000a726f 	.word	0x000a726f
 80019f4:	74696177 	.word	0x74696177
 80019f8:	20676e69 	.word	0x20676e69
 80019fc:	20726f66 	.word	0x20726f66
 8001a00:	65726874 	.word	0x65726874
 8001a04:	25206461 	.word	0x25206461
 8001a08:	6f642075 	.word	0x6f642075
 8001a0c:	000a656e 	.word	0x000a656e
 8001a10:	69726570 	.word	0x69726570
 8001a14:	6369646f 	.word	0x6369646f
 8001a18:	72687420 	.word	0x72687420
 8001a1c:	0a646165 	.word	0x0a646165
 8001a20:	65770a00 	.word	0x65770a00
 8001a24:	6d6f636c 	.word	0x6d6f636c
 8001a28:	6f742065 	.word	0x6f742065
 8001a2c:	7a755320 	.word	0x7a755320
 8001a30:	4f616875 	.word	0x4f616875
 8001a34:	5f5e2053 	.word	0x5f5e2053
 8001a38:	2e32205e 	.word	0x2e32205e
 8001a3c:	0a302e32 	.word	0x0a302e32
 8001a40:	4c495542 	.word	0x4c495542
 8001a44:	65532044 	.word	0x65532044
 8001a48:	31322070 	.word	0x31322070
 8001a4c:	31303220 	.word	0x31303220
 8001a50:	31312035 	.word	0x31312035
 8001a54:	3a34353a 	.word	0x3a34353a
 8001a58:	000a3530 	.word	0x000a3530

08001a5c <__EH_FRAME_BEGIN__>:
 8001a5c:	00000000                                ....
