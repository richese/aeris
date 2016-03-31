
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
 80001aa:	f002 f81f 	bl	80021ec <sleep>
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
 8000282:	f001 ffa1 	bl	80021c8 <sys_tick_init>
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

080003ac <messages_init>:
 80003ac:	4a0a      	ldr	r2, [pc, #40]	; (80003d8 <messages_init+0x2c>)
 80003ae:	2300      	movs	r3, #0
 80003b0:	b510      	push	{r4, lr}
 80003b2:	6013      	str	r3, [r2, #0]
 80003b4:	6053      	str	r3, [r2, #4]
 80003b6:	6093      	str	r3, [r2, #8]
 80003b8:	60d3      	str	r3, [r2, #12]
 80003ba:	6113      	str	r3, [r2, #16]
 80003bc:	6153      	str	r3, [r2, #20]
 80003be:	4c07      	ldr	r4, [pc, #28]	; (80003dc <messages_init+0x30>)
 80003c0:	0118      	lsls	r0, r3, #4
 80003c2:	1821      	adds	r1, r4, r0
 80003c4:	3301      	adds	r3, #1
 80003c6:	2200      	movs	r2, #0
 80003c8:	2b04      	cmp	r3, #4
 80003ca:	604a      	str	r2, [r1, #4]
 80003cc:	5022      	str	r2, [r4, r0]
 80003ce:	60ca      	str	r2, [r1, #12]
 80003d0:	608a      	str	r2, [r1, #8]
 80003d2:	d1f4      	bne.n	80003be <messages_init+0x12>
 80003d4:	bd10      	pop	{r4, pc}
 80003d6:	bf00      	nop
 80003d8:	20000100 	.word	0x20000100
 80003dc:	20000118 	.word	0x20000118

080003e0 <strlen_>:
 80003e0:	2300      	movs	r3, #0
 80003e2:	5cc2      	ldrb	r2, [r0, r3]
 80003e4:	b10a      	cbz	r2, 80003ea <strlen_+0xa>
 80003e6:	3301      	adds	r3, #1
 80003e8:	e7fb      	b.n	80003e2 <strlen_+0x2>
 80003ea:	4618      	mov	r0, r3
 80003ec:	4770      	bx	lr
	...

080003f0 <putc_>:
 80003f0:	b538      	push	{r3, r4, r5, lr}
 80003f2:	4c06      	ldr	r4, [pc, #24]	; (800040c <putc_+0x1c>)
 80003f4:	4605      	mov	r5, r0
 80003f6:	4620      	mov	r0, r4
 80003f8:	f000 f901 	bl	80005fe <mutex_lock>
 80003fc:	4628      	mov	r0, r5
 80003fe:	f001 fc87 	bl	8001d10 <uart_write>
 8000402:	4620      	mov	r0, r4
 8000404:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000408:	f000 b915 	b.w	8000636 <mutex_unlock>
 800040c:	20000158 	.word	0x20000158

08000410 <puts_>:
 8000410:	b510      	push	{r4, lr}
 8000412:	4604      	mov	r4, r0
 8000414:	4807      	ldr	r0, [pc, #28]	; (8000434 <puts_+0x24>)
 8000416:	f000 f8f2 	bl	80005fe <mutex_lock>
 800041a:	3c01      	subs	r4, #1
 800041c:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000420:	b110      	cbz	r0, 8000428 <puts_+0x18>
 8000422:	f7ff ffe5 	bl	80003f0 <putc_>
 8000426:	e7f9      	b.n	800041c <puts_+0xc>
 8000428:	4802      	ldr	r0, [pc, #8]	; (8000434 <puts_+0x24>)
 800042a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800042e:	f000 b902 	b.w	8000636 <mutex_unlock>
 8000432:	bf00      	nop
 8000434:	20000164 	.word	0x20000164

08000438 <puti_>:
 8000438:	b530      	push	{r4, r5, lr}
 800043a:	b085      	sub	sp, #20
 800043c:	1e03      	subs	r3, r0, #0
 800043e:	f04f 0200 	mov.w	r2, #0
 8000442:	bfa8      	it	ge
 8000444:	4614      	movge	r4, r2
 8000446:	f88d 200f 	strb.w	r2, [sp, #15]
 800044a:	bfbc      	itt	lt
 800044c:	425b      	neglt	r3, r3
 800044e:	2401      	movlt	r4, #1
 8000450:	220a      	movs	r2, #10
 8000452:	210a      	movs	r1, #10
 8000454:	fb93 f5f1 	sdiv	r5, r3, r1
 8000458:	fb01 3315 	mls	r3, r1, r5, r3
 800045c:	a801      	add	r0, sp, #4
 800045e:	3330      	adds	r3, #48	; 0x30
 8000460:	5413      	strb	r3, [r2, r0]
 8000462:	1e51      	subs	r1, r2, #1
 8000464:	462b      	mov	r3, r5
 8000466:	b10d      	cbz	r5, 800046c <puti_+0x34>
 8000468:	460a      	mov	r2, r1
 800046a:	e7f2      	b.n	8000452 <puti_+0x1a>
 800046c:	b12c      	cbz	r4, 800047a <puti_+0x42>
 800046e:	ab04      	add	r3, sp, #16
 8000470:	440b      	add	r3, r1
 8000472:	222d      	movs	r2, #45	; 0x2d
 8000474:	f803 2c0c 	strb.w	r2, [r3, #-12]
 8000478:	460a      	mov	r2, r1
 800047a:	4410      	add	r0, r2
 800047c:	f7ff ffc8 	bl	8000410 <puts_>
 8000480:	b005      	add	sp, #20
 8000482:	bd30      	pop	{r4, r5, pc}

08000484 <putui_>:
 8000484:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000486:	2300      	movs	r3, #0
 8000488:	f88d 300f 	strb.w	r3, [sp, #15]
 800048c:	230a      	movs	r3, #10
 800048e:	240a      	movs	r4, #10
 8000490:	fbb0 f1f4 	udiv	r1, r0, r4
 8000494:	fb04 0011 	mls	r0, r4, r1, r0
 8000498:	aa01      	add	r2, sp, #4
 800049a:	3030      	adds	r0, #48	; 0x30
 800049c:	5498      	strb	r0, [r3, r2]
 800049e:	1e5c      	subs	r4, r3, #1
 80004a0:	4608      	mov	r0, r1
 80004a2:	b109      	cbz	r1, 80004a8 <putui_+0x24>
 80004a4:	4623      	mov	r3, r4
 80004a6:	e7f2      	b.n	800048e <putui_+0xa>
 80004a8:	18d0      	adds	r0, r2, r3
 80004aa:	f7ff ffb1 	bl	8000410 <puts_>
 80004ae:	b004      	add	sp, #16
 80004b0:	bd10      	pop	{r4, pc}

080004b2 <putx_>:
 80004b2:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80004b4:	2300      	movs	r3, #0
 80004b6:	f88d 300f 	strb.w	r3, [sp, #15]
 80004ba:	230a      	movs	r3, #10
 80004bc:	f000 010f 	and.w	r1, r0, #15
 80004c0:	2909      	cmp	r1, #9
 80004c2:	aa01      	add	r2, sp, #4
 80004c4:	bf94      	ite	ls
 80004c6:	3130      	addls	r1, #48	; 0x30
 80004c8:	3157      	addhi	r1, #87	; 0x57
 80004ca:	0900      	lsrs	r0, r0, #4
 80004cc:	54d1      	strb	r1, [r2, r3]
 80004ce:	f103 31ff 	add.w	r1, r3, #4294967295
 80004d2:	d001      	beq.n	80004d8 <putx_+0x26>
 80004d4:	460b      	mov	r3, r1
 80004d6:	e7f1      	b.n	80004bc <putx_+0xa>
 80004d8:	18d0      	adds	r0, r2, r3
 80004da:	f7ff ff99 	bl	8000410 <puts_>
 80004de:	b005      	add	sp, #20
 80004e0:	f85d fb04 	ldr.w	pc, [sp], #4

080004e4 <printf_>:
 80004e4:	b40f      	push	{r0, r1, r2, r3}
 80004e6:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80004e8:	ac06      	add	r4, sp, #24
 80004ea:	4826      	ldr	r0, [pc, #152]	; (8000584 <printf_+0xa0>)
 80004ec:	f854 5b04 	ldr.w	r5, [r4], #4
 80004f0:	f000 f885 	bl	80005fe <mutex_lock>
 80004f4:	9401      	str	r4, [sp, #4]
 80004f6:	2400      	movs	r4, #0
 80004f8:	5d28      	ldrb	r0, [r5, r4]
 80004fa:	2800      	cmp	r0, #0
 80004fc:	d039      	beq.n	8000572 <printf_+0x8e>
 80004fe:	2825      	cmp	r0, #37	; 0x25
 8000500:	d003      	beq.n	800050a <printf_+0x26>
 8000502:	f7ff ff75 	bl	80003f0 <putc_>
 8000506:	3401      	adds	r4, #1
 8000508:	e7f6      	b.n	80004f8 <printf_+0x14>
 800050a:	192b      	adds	r3, r5, r4
 800050c:	7858      	ldrb	r0, [r3, #1]
 800050e:	2869      	cmp	r0, #105	; 0x69
 8000510:	d016      	beq.n	8000540 <printf_+0x5c>
 8000512:	d808      	bhi.n	8000526 <printf_+0x42>
 8000514:	2825      	cmp	r0, #37	; 0x25
 8000516:	d028      	beq.n	800056a <printf_+0x86>
 8000518:	2863      	cmp	r0, #99	; 0x63
 800051a:	d128      	bne.n	800056e <printf_+0x8a>
 800051c:	9b01      	ldr	r3, [sp, #4]
 800051e:	1d1a      	adds	r2, r3, #4
 8000520:	9201      	str	r2, [sp, #4]
 8000522:	7818      	ldrb	r0, [r3, #0]
 8000524:	e021      	b.n	800056a <printf_+0x86>
 8000526:	2875      	cmp	r0, #117	; 0x75
 8000528:	d011      	beq.n	800054e <printf_+0x6a>
 800052a:	2878      	cmp	r0, #120	; 0x78
 800052c:	d016      	beq.n	800055c <printf_+0x78>
 800052e:	2873      	cmp	r0, #115	; 0x73
 8000530:	d11d      	bne.n	800056e <printf_+0x8a>
 8000532:	9b01      	ldr	r3, [sp, #4]
 8000534:	1d1a      	adds	r2, r3, #4
 8000536:	6818      	ldr	r0, [r3, #0]
 8000538:	9201      	str	r2, [sp, #4]
 800053a:	f7ff ff69 	bl	8000410 <puts_>
 800053e:	e016      	b.n	800056e <printf_+0x8a>
 8000540:	9b01      	ldr	r3, [sp, #4]
 8000542:	1d1a      	adds	r2, r3, #4
 8000544:	6818      	ldr	r0, [r3, #0]
 8000546:	9201      	str	r2, [sp, #4]
 8000548:	f7ff ff76 	bl	8000438 <puti_>
 800054c:	e00f      	b.n	800056e <printf_+0x8a>
 800054e:	9b01      	ldr	r3, [sp, #4]
 8000550:	1d1a      	adds	r2, r3, #4
 8000552:	6818      	ldr	r0, [r3, #0]
 8000554:	9201      	str	r2, [sp, #4]
 8000556:	f7ff ff95 	bl	8000484 <putui_>
 800055a:	e008      	b.n	800056e <printf_+0x8a>
 800055c:	9b01      	ldr	r3, [sp, #4]
 800055e:	1d1a      	adds	r2, r3, #4
 8000560:	6818      	ldr	r0, [r3, #0]
 8000562:	9201      	str	r2, [sp, #4]
 8000564:	f7ff ffa5 	bl	80004b2 <putx_>
 8000568:	e001      	b.n	800056e <printf_+0x8a>
 800056a:	f7ff ff41 	bl	80003f0 <putc_>
 800056e:	3402      	adds	r4, #2
 8000570:	e7c2      	b.n	80004f8 <printf_+0x14>
 8000572:	4804      	ldr	r0, [pc, #16]	; (8000584 <printf_+0xa0>)
 8000574:	f000 f85f 	bl	8000636 <mutex_unlock>
 8000578:	b003      	add	sp, #12
 800057a:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 800057e:	b004      	add	sp, #16
 8000580:	4770      	bx	lr
 8000582:	bf00      	nop
 8000584:	20000160 	.word	0x20000160

08000588 <stdio_init>:
 8000588:	b510      	push	{r4, lr}
 800058a:	480e      	ldr	r0, [pc, #56]	; (80005c4 <stdio_init+0x3c>)
 800058c:	f000 f82d 	bl	80005ea <mutex_init>
 8000590:	480d      	ldr	r0, [pc, #52]	; (80005c8 <stdio_init+0x40>)
 8000592:	f000 f82a 	bl	80005ea <mutex_init>
 8000596:	480d      	ldr	r0, [pc, #52]	; (80005cc <stdio_init+0x44>)
 8000598:	f000 f827 	bl	80005ea <mutex_init>
 800059c:	480c      	ldr	r0, [pc, #48]	; (80005d0 <stdio_init+0x48>)
 800059e:	f000 f824 	bl	80005ea <mutex_init>
 80005a2:	2408      	movs	r4, #8
 80005a4:	2020      	movs	r0, #32
 80005a6:	f7ff ff23 	bl	80003f0 <putc_>
 80005aa:	3c01      	subs	r4, #1
 80005ac:	d1fa      	bne.n	80005a4 <stdio_init+0x1c>
 80005ae:	2420      	movs	r4, #32
 80005b0:	200a      	movs	r0, #10
 80005b2:	f7ff ff1d 	bl	80003f0 <putc_>
 80005b6:	3c01      	subs	r4, #1
 80005b8:	d1fa      	bne.n	80005b0 <stdio_init+0x28>
 80005ba:	4806      	ldr	r0, [pc, #24]	; (80005d4 <stdio_init+0x4c>)
 80005bc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005c0:	f7ff bf90 	b.w	80004e4 <printf_>
 80005c4:	20000158 	.word	0x20000158
 80005c8:	2000015c 	.word	0x2000015c
 80005cc:	20000164 	.word	0x20000164
 80005d0:	20000160 	.word	0x20000160
 80005d4:	0800251c 	.word	0x0800251c

080005d8 <lib_os_init>:
 80005d8:	b508      	push	{r3, lr}
 80005da:	f7ff fe91 	bl	8000300 <kernel_init>
 80005de:	f7ff fee5 	bl	80003ac <messages_init>
 80005e2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80005e6:	f7ff bfcf 	b.w	8000588 <stdio_init>

080005ea <mutex_init>:
 80005ea:	b510      	push	{r4, lr}
 80005ec:	4604      	mov	r4, r0
 80005ee:	f7ff fe35 	bl	800025c <sched_off>
 80005f2:	2300      	movs	r3, #0
 80005f4:	6023      	str	r3, [r4, #0]
 80005f6:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005fa:	f7ff be31 	b.w	8000260 <sched_on>

080005fe <mutex_lock>:
 80005fe:	b513      	push	{r0, r1, r4, lr}
 8000600:	4604      	mov	r4, r0
 8000602:	f7ff fe2b 	bl	800025c <sched_off>
 8000606:	6823      	ldr	r3, [r4, #0]
 8000608:	9301      	str	r3, [sp, #4]
 800060a:	f7ff fe29 	bl	8000260 <sched_on>
 800060e:	9b01      	ldr	r3, [sp, #4]
 8000610:	b10b      	cbz	r3, 8000616 <mutex_lock+0x18>
 8000612:	f7ff fe97 	bl	8000344 <set_wait_state>
 8000616:	9b01      	ldr	r3, [sp, #4]
 8000618:	2b00      	cmp	r3, #0
 800061a:	d1f2      	bne.n	8000602 <mutex_lock+0x4>
 800061c:	f7ff fe1e 	bl	800025c <sched_off>
 8000620:	6823      	ldr	r3, [r4, #0]
 8000622:	9301      	str	r3, [sp, #4]
 8000624:	9b01      	ldr	r3, [sp, #4]
 8000626:	2b00      	cmp	r3, #0
 8000628:	d1eb      	bne.n	8000602 <mutex_lock+0x4>
 800062a:	2301      	movs	r3, #1
 800062c:	6023      	str	r3, [r4, #0]
 800062e:	f7ff fe17 	bl	8000260 <sched_on>
 8000632:	b002      	add	sp, #8
 8000634:	bd10      	pop	{r4, pc}

08000636 <mutex_unlock>:
 8000636:	b508      	push	{r3, lr}
 8000638:	f7ff ffd7 	bl	80005ea <mutex_init>
 800063c:	f7ff fea4 	bl	8000388 <wake_up_threads>
 8000640:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000644:	f7ff be0e 	b.w	8000264 <yield>

08000648 <esp8266_send>:
 8000648:	b510      	push	{r4, lr}
 800064a:	1e44      	subs	r4, r0, #1
 800064c:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000650:	b110      	cbz	r0, 8000658 <esp8266_send+0x10>
 8000652:	f001 fb5d 	bl	8001d10 <uart_write>
 8000656:	e7f9      	b.n	800064c <esp8266_send+0x4>
 8000658:	bd10      	pop	{r4, pc}

0800065a <esp8266_send_uint>:
 800065a:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800065c:	2300      	movs	r3, #0
 800065e:	f88d 300f 	strb.w	r3, [sp, #15]
 8000662:	230a      	movs	r3, #10
 8000664:	240a      	movs	r4, #10
 8000666:	fbb0 f1f4 	udiv	r1, r0, r4
 800066a:	fb04 0011 	mls	r0, r4, r1, r0
 800066e:	aa01      	add	r2, sp, #4
 8000670:	3030      	adds	r0, #48	; 0x30
 8000672:	5498      	strb	r0, [r3, r2]
 8000674:	1e5c      	subs	r4, r3, #1
 8000676:	4608      	mov	r0, r1
 8000678:	b109      	cbz	r1, 800067e <esp8266_send_uint+0x24>
 800067a:	4623      	mov	r3, r4
 800067c:	e7f2      	b.n	8000664 <esp8266_send_uint+0xa>
 800067e:	18d0      	adds	r0, r2, r3
 8000680:	f7ff ffe2 	bl	8000648 <esp8266_send>
 8000684:	b004      	add	sp, #16
 8000686:	bd10      	pop	{r4, pc}

08000688 <esp8266_find_stream>:
 8000688:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800068a:	4615      	mov	r5, r2
 800068c:	460f      	mov	r7, r1
 800068e:	4606      	mov	r6, r0
 8000690:	f001 fa46 	bl	8001b20 <timer_get_time>
 8000694:	4405      	add	r5, r0
 8000696:	f001 fbf3 	bl	8001e80 <uart_clear_buffer>
 800069a:	2400      	movs	r4, #0
 800069c:	f001 fb42 	bl	8001d24 <uart_is_char>
 80006a0:	f64f 72ff 	movw	r2, #65535	; 0xffff
 80006a4:	4290      	cmp	r0, r2
 80006a6:	d00c      	beq.n	80006c2 <esp8266_find_stream+0x3a>
 80006a8:	5d32      	ldrb	r2, [r6, r4]
 80006aa:	4282      	cmp	r2, r0
 80006ac:	d108      	bne.n	80006c0 <esp8266_find_stream+0x38>
 80006ae:	1e7b      	subs	r3, r7, #1
 80006b0:	429c      	cmp	r4, r3
 80006b2:	d201      	bcs.n	80006b8 <esp8266_find_stream+0x30>
 80006b4:	3401      	adds	r4, #1
 80006b6:	e004      	b.n	80006c2 <esp8266_find_stream+0x3a>
 80006b8:	f001 fbe2 	bl	8001e80 <uart_clear_buffer>
 80006bc:	2001      	movs	r0, #1
 80006be:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80006c0:	2400      	movs	r4, #0
 80006c2:	f001 fa2d 	bl	8001b20 <timer_get_time>
 80006c6:	42a8      	cmp	r0, r5
 80006c8:	d3e8      	bcc.n	800069c <esp8266_find_stream+0x14>
 80006ca:	f001 fbd9 	bl	8001e80 <uart_clear_buffer>
 80006ce:	2000      	movs	r0, #0
 80006d0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

080006d4 <esp8266_init>:
 80006d4:	b510      	push	{r4, lr}
 80006d6:	4604      	mov	r4, r0
 80006d8:	f640 30b8 	movw	r0, #3000	; 0xbb8
 80006dc:	f001 fa2e 	bl	8001b3c <timer_delay_ms>
 80006e0:	b10c      	cbz	r4, 80006e6 <esp8266_init+0x12>
 80006e2:	4818      	ldr	r0, [pc, #96]	; (8000744 <esp8266_init+0x70>)
 80006e4:	e000      	b.n	80006e8 <esp8266_init+0x14>
 80006e6:	4818      	ldr	r0, [pc, #96]	; (8000748 <esp8266_init+0x74>)
 80006e8:	f7ff ffae 	bl	8000648 <esp8266_send>
 80006ec:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006f0:	f001 fa24 	bl	8001b3c <timer_delay_ms>
 80006f4:	4815      	ldr	r0, [pc, #84]	; (800074c <esp8266_init+0x78>)
 80006f6:	f7ff ffa7 	bl	8000648 <esp8266_send>
 80006fa:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006fe:	f001 fa1d 	bl	8001b3c <timer_delay_ms>
 8000702:	4813      	ldr	r0, [pc, #76]	; (8000750 <esp8266_init+0x7c>)
 8000704:	f7ff ffa0 	bl	8000648 <esp8266_send>
 8000708:	4812      	ldr	r0, [pc, #72]	; (8000754 <esp8266_init+0x80>)
 800070a:	f7ff ff9d 	bl	8000648 <esp8266_send>
 800070e:	4812      	ldr	r0, [pc, #72]	; (8000758 <esp8266_init+0x84>)
 8000710:	f7ff ff9a 	bl	8000648 <esp8266_send>
 8000714:	4811      	ldr	r0, [pc, #68]	; (800075c <esp8266_init+0x88>)
 8000716:	f7ff ff97 	bl	8000648 <esp8266_send>
 800071a:	4811      	ldr	r0, [pc, #68]	; (8000760 <esp8266_init+0x8c>)
 800071c:	f7ff ff94 	bl	8000648 <esp8266_send>
 8000720:	4810      	ldr	r0, [pc, #64]	; (8000764 <esp8266_init+0x90>)
 8000722:	2102      	movs	r1, #2
 8000724:	f644 6220 	movw	r2, #20000	; 0x4e20
 8000728:	f7ff ffae 	bl	8000688 <esp8266_find_stream>
 800072c:	b140      	cbz	r0, 8000740 <esp8266_init+0x6c>
 800072e:	b12c      	cbz	r4, 800073c <esp8266_init+0x68>
 8000730:	480d      	ldr	r0, [pc, #52]	; (8000768 <esp8266_init+0x94>)
 8000732:	f7ff ff89 	bl	8000648 <esp8266_send>
 8000736:	20c8      	movs	r0, #200	; 0xc8
 8000738:	f001 fa00 	bl	8001b3c <timer_delay_ms>
 800073c:	2000      	movs	r0, #0
 800073e:	bd10      	pop	{r4, pc}
 8000740:	2002      	movs	r0, #2
 8000742:	bd10      	pop	{r4, pc}
 8000744:	0800252d 	.word	0x0800252d
 8000748:	0800253b 	.word	0x0800253b
 800074c:	08002549 	.word	0x08002549
 8000750:	08002557 	.word	0x08002557
 8000754:	08002562 	.word	0x08002562
 8000758:	080025a0 	.word	0x080025a0
 800075c:	0800256f 	.word	0x0800256f
 8000760:	08002578 	.word	0x08002578
 8000764:	080025c8 	.word	0x080025c8
 8000768:	0800257c 	.word	0x0800257c

0800076c <esp8266_uninit>:
 800076c:	4770      	bx	lr

0800076e <esp8266_get_nonblocking>:
 800076e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000770:	4606      	mov	r6, r0
 8000772:	460f      	mov	r7, r1
 8000774:	4615      	mov	r5, r2
 8000776:	2300      	movs	r3, #0
 8000778:	42bb      	cmp	r3, r7
 800077a:	f04f 0400 	mov.w	r4, #0
 800077e:	d002      	beq.n	8000786 <esp8266_get_nonblocking+0x18>
 8000780:	54f4      	strb	r4, [r6, r3]
 8000782:	3301      	adds	r3, #1
 8000784:	e7f8      	b.n	8000778 <esp8266_get_nonblocking+0xa>
 8000786:	f001 f9cb 	bl	8001b20 <timer_get_time>
 800078a:	4405      	add	r5, r0
 800078c:	f001 faca 	bl	8001d24 <uart_is_char>
 8000790:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000794:	4298      	cmp	r0, r3
 8000796:	bf1c      	itt	ne
 8000798:	5530      	strbne	r0, [r6, r4]
 800079a:	3401      	addne	r4, #1
 800079c:	f001 f9c0 	bl	8001b20 <timer_get_time>
 80007a0:	42bc      	cmp	r4, r7
 80007a2:	d207      	bcs.n	80007b4 <esp8266_get_nonblocking+0x46>
 80007a4:	4285      	cmp	r5, r0
 80007a6:	d8f1      	bhi.n	800078c <esp8266_get_nonblocking+0x1e>
 80007a8:	42a8      	cmp	r0, r5
 80007aa:	bf94      	ite	ls
 80007ac:	4620      	movls	r0, r4
 80007ae:	f04f 30ff 	movhi.w	r0, #4294967295
 80007b2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80007b4:	42a8      	cmp	r0, r5
 80007b6:	bf8c      	ite	hi
 80007b8:	f04f 30ff 	movhi.w	r0, #4294967295
 80007bc:	f06f 0001 	mvnls.w	r0, #1
 80007c0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

080007c4 <esp8266_connect>:
 80007c4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80007c6:	4606      	mov	r6, r0
 80007c8:	4839      	ldr	r0, [pc, #228]	; (80008b0 <esp8266_connect+0xec>)
 80007ca:	460f      	mov	r7, r1
 80007cc:	4614      	mov	r4, r2
 80007ce:	461d      	mov	r5, r3
 80007d0:	f7ff ff3a 	bl	8000648 <esp8266_send>
 80007d4:	4630      	mov	r0, r6
 80007d6:	f7ff ff37 	bl	8000648 <esp8266_send>
 80007da:	4836      	ldr	r0, [pc, #216]	; (80008b4 <esp8266_connect+0xf0>)
 80007dc:	f7ff ff34 	bl	8000648 <esp8266_send>
 80007e0:	4638      	mov	r0, r7
 80007e2:	f7ff ff3a 	bl	800065a <esp8266_send_uint>
 80007e6:	4834      	ldr	r0, [pc, #208]	; (80008b8 <esp8266_connect+0xf4>)
 80007e8:	f7ff ff2e 	bl	8000648 <esp8266_send>
 80007ec:	4833      	ldr	r0, [pc, #204]	; (80008bc <esp8266_connect+0xf8>)
 80007ee:	2107      	movs	r1, #7
 80007f0:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 80007f4:	f7ff ff48 	bl	8000688 <esp8266_find_stream>
 80007f8:	2800      	cmp	r0, #0
 80007fa:	d056      	beq.n	80008aa <esp8266_connect+0xe6>
 80007fc:	4830      	ldr	r0, [pc, #192]	; (80008c0 <esp8266_connect+0xfc>)
 80007fe:	f7ff ff23 	bl	8000648 <esp8266_send>
 8000802:	4628      	mov	r0, r5
 8000804:	f7ff ff29 	bl	800065a <esp8266_send_uint>
 8000808:	482b      	ldr	r0, [pc, #172]	; (80008b8 <esp8266_connect+0xf4>)
 800080a:	f7ff ff1d 	bl	8000648 <esp8266_send>
 800080e:	482d      	ldr	r0, [pc, #180]	; (80008c4 <esp8266_connect+0x100>)
 8000810:	2101      	movs	r1, #1
 8000812:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 8000816:	f7ff ff37 	bl	8000688 <esp8266_find_stream>
 800081a:	b108      	cbz	r0, 8000820 <esp8266_connect+0x5c>
 800081c:	4425      	add	r5, r4
 800081e:	e007      	b.n	8000830 <esp8266_connect+0x6c>
 8000820:	4829      	ldr	r0, [pc, #164]	; (80008c8 <esp8266_connect+0x104>)
 8000822:	f7ff ff11 	bl	8000648 <esp8266_send>
 8000826:	2064      	movs	r0, #100	; 0x64
 8000828:	f001 f988 	bl	8001b3c <timer_delay_ms>
 800082c:	2004      	movs	r0, #4
 800082e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000830:	42ac      	cmp	r4, r5
 8000832:	d004      	beq.n	800083e <esp8266_connect+0x7a>
 8000834:	f814 0b01 	ldrb.w	r0, [r4], #1
 8000838:	f001 fa6a 	bl	8001d10 <uart_write>
 800083c:	e7f8      	b.n	8000830 <esp8266_connect+0x6c>
 800083e:	4823      	ldr	r0, [pc, #140]	; (80008cc <esp8266_connect+0x108>)
 8000840:	2107      	movs	r1, #7
 8000842:	2264      	movs	r2, #100	; 0x64
 8000844:	f7ff ff20 	bl	8000688 <esp8266_find_stream>
 8000848:	b938      	cbnz	r0, 800085a <esp8266_connect+0x96>
 800084a:	481f      	ldr	r0, [pc, #124]	; (80008c8 <esp8266_connect+0x104>)
 800084c:	f7ff fefc 	bl	8000648 <esp8266_send>
 8000850:	2064      	movs	r0, #100	; 0x64
 8000852:	f001 f973 	bl	8001b3c <timer_delay_ms>
 8000856:	2005      	movs	r0, #5
 8000858:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800085a:	481d      	ldr	r0, [pc, #116]	; (80008d0 <esp8266_connect+0x10c>)
 800085c:	2105      	movs	r1, #5
 800085e:	2264      	movs	r2, #100	; 0x64
 8000860:	f7ff ff12 	bl	8000688 <esp8266_find_stream>
 8000864:	b108      	cbz	r0, 800086a <esp8266_connect+0xa6>
 8000866:	2400      	movs	r4, #0
 8000868:	e007      	b.n	800087a <esp8266_connect+0xb6>
 800086a:	4817      	ldr	r0, [pc, #92]	; (80008c8 <esp8266_connect+0x104>)
 800086c:	f7ff feec 	bl	8000648 <esp8266_send>
 8000870:	2064      	movs	r0, #100	; 0x64
 8000872:	f001 f963 	bl	8001b3c <timer_delay_ms>
 8000876:	2006      	movs	r0, #6
 8000878:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800087a:	f001 fa6f 	bl	8001d5c <uart_read>
 800087e:	283a      	cmp	r0, #58	; 0x3a
 8000880:	d004      	beq.n	800088c <esp8266_connect+0xc8>
 8000882:	230a      	movs	r3, #10
 8000884:	fb03 0404 	mla	r4, r3, r4, r0
 8000888:	3c30      	subs	r4, #48	; 0x30
 800088a:	e7f6      	b.n	800087a <esp8266_connect+0xb6>
 800088c:	9907      	ldr	r1, [sp, #28]
 800088e:	9806      	ldr	r0, [sp, #24]
 8000890:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
 8000894:	f7ff ff6b 	bl	800076e <esp8266_get_nonblocking>
 8000898:	480b      	ldr	r0, [pc, #44]	; (80008c8 <esp8266_connect+0x104>)
 800089a:	f7ff fed5 	bl	8000648 <esp8266_send>
 800089e:	2064      	movs	r0, #100	; 0x64
 80008a0:	f001 f94c 	bl	8001b3c <timer_delay_ms>
 80008a4:	f504 707a 	add.w	r0, r4, #1000	; 0x3e8
 80008a8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008aa:	2003      	movs	r0, #3
 80008ac:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008ae:	bf00      	nop
 80008b0:	08002590 	.word	0x08002590
 80008b4:	080025a4 	.word	0x080025a4
 80008b8:	08002579 	.word	0x08002579
 80008bc:	080025c8 	.word	0x080025c8
 80008c0:	080025a7 	.word	0x080025a7
 80008c4:	080025b3 	.word	0x080025b3
 80008c8:	080025b5 	.word	0x080025b5
 80008cc:	080025c3 	.word	0x080025c3
 80008d0:	080025cb 	.word	0x080025cb

080008d4 <motors_uninit>:
 80008d4:	b508      	push	{r3, lr}
 80008d6:	20c0      	movs	r0, #192	; 0xc0
 80008d8:	2100      	movs	r1, #0
 80008da:	2218      	movs	r2, #24
 80008dc:	f001 fbc6 	bl	800206c <i2c_write_reg>
 80008e0:	20c2      	movs	r0, #194	; 0xc2
 80008e2:	2100      	movs	r1, #0
 80008e4:	2218      	movs	r2, #24
 80008e6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80008ea:	f001 bbbf 	b.w	800206c <i2c_write_reg>
	...

080008f0 <motors_update>:
 80008f0:	4a2f      	ldr	r2, [pc, #188]	; (80009b0 <motors_update+0xc0>)
 80008f2:	b538      	push	{r3, r4, r5, lr}
 80008f4:	6813      	ldr	r3, [r2, #0]
 80008f6:	6854      	ldr	r4, [r2, #4]
 80008f8:	b2db      	uxtb	r3, r3
 80008fa:	b25a      	sxtb	r2, r3
 80008fc:	2a2c      	cmp	r2, #44	; 0x2c
 80008fe:	b2e4      	uxtb	r4, r4
 8000900:	dc04      	bgt.n	800090c <motors_update+0x1c>
 8000902:	f112 0f2c 	cmn.w	r2, #44	; 0x2c
 8000906:	bfb8      	it	lt
 8000908:	23d4      	movlt	r3, #212	; 0xd4
 800090a:	e000      	b.n	800090e <motors_update+0x1e>
 800090c:	232c      	movs	r3, #44	; 0x2c
 800090e:	b262      	sxtb	r2, r4
 8000910:	2a2c      	cmp	r2, #44	; 0x2c
 8000912:	dc04      	bgt.n	800091e <motors_update+0x2e>
 8000914:	f112 0f2c 	cmn.w	r2, #44	; 0x2c
 8000918:	bfb8      	it	lt
 800091a:	24d4      	movlt	r4, #212	; 0xd4
 800091c:	e000      	b.n	8000920 <motors_update+0x30>
 800091e:	242c      	movs	r4, #44	; 0x2c
 8000920:	b1b3      	cbz	r3, 8000950 <motors_update+0x60>
 8000922:	b25a      	sxtb	r2, r3
 8000924:	2a00      	cmp	r2, #0
 8000926:	dd07      	ble.n	8000938 <motors_update+0x48>
 8000928:	2a05      	cmp	r2, #5
 800092a:	bfd8      	it	le
 800092c:	2306      	movle	r3, #6
 800092e:	b25d      	sxtb	r5, r3
 8000930:	00ad      	lsls	r5, r5, #2
 8000932:	f045 0502 	orr.w	r5, r5, #2
 8000936:	e009      	b.n	800094c <motors_update+0x5c>
 8000938:	425b      	negs	r3, r3
 800093a:	b2db      	uxtb	r3, r3
 800093c:	b25a      	sxtb	r2, r3
 800093e:	2a05      	cmp	r2, #5
 8000940:	bfd8      	it	le
 8000942:	2306      	movle	r3, #6
 8000944:	b25d      	sxtb	r5, r3
 8000946:	00ad      	lsls	r5, r5, #2
 8000948:	f045 0501 	orr.w	r5, r5, #1
 800094c:	b2ed      	uxtb	r5, r5
 800094e:	e000      	b.n	8000952 <motors_update+0x62>
 8000950:	251b      	movs	r5, #27
 8000952:	2100      	movs	r1, #0
 8000954:	460a      	mov	r2, r1
 8000956:	20c0      	movs	r0, #192	; 0xc0
 8000958:	f001 fb88 	bl	800206c <i2c_write_reg>
 800095c:	20c0      	movs	r0, #192	; 0xc0
 800095e:	2100      	movs	r1, #0
 8000960:	462a      	mov	r2, r5
 8000962:	f001 fb83 	bl	800206c <i2c_write_reg>
 8000966:	b1b4      	cbz	r4, 8000996 <motors_update+0xa6>
 8000968:	b263      	sxtb	r3, r4
 800096a:	2b00      	cmp	r3, #0
 800096c:	dd07      	ble.n	800097e <motors_update+0x8e>
 800096e:	2b05      	cmp	r3, #5
 8000970:	bfd8      	it	le
 8000972:	2406      	movle	r4, #6
 8000974:	b264      	sxtb	r4, r4
 8000976:	00a4      	lsls	r4, r4, #2
 8000978:	f044 0401 	orr.w	r4, r4, #1
 800097c:	e009      	b.n	8000992 <motors_update+0xa2>
 800097e:	4264      	negs	r4, r4
 8000980:	b2e4      	uxtb	r4, r4
 8000982:	b263      	sxtb	r3, r4
 8000984:	2b05      	cmp	r3, #5
 8000986:	bfd8      	it	le
 8000988:	2406      	movle	r4, #6
 800098a:	b264      	sxtb	r4, r4
 800098c:	00a4      	lsls	r4, r4, #2
 800098e:	f044 0402 	orr.w	r4, r4, #2
 8000992:	b2e4      	uxtb	r4, r4
 8000994:	e000      	b.n	8000998 <motors_update+0xa8>
 8000996:	241b      	movs	r4, #27
 8000998:	2100      	movs	r1, #0
 800099a:	460a      	mov	r2, r1
 800099c:	20c2      	movs	r0, #194	; 0xc2
 800099e:	f001 fb65 	bl	800206c <i2c_write_reg>
 80009a2:	4622      	mov	r2, r4
 80009a4:	20c2      	movs	r0, #194	; 0xc2
 80009a6:	2100      	movs	r1, #0
 80009a8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80009ac:	f001 bb5e 	b.w	800206c <i2c_write_reg>
 80009b0:	200001c0 	.word	0x200001c0

080009b4 <motors_init>:
 80009b4:	b510      	push	{r4, lr}
 80009b6:	4b04      	ldr	r3, [pc, #16]	; (80009c8 <motors_init+0x14>)
 80009b8:	2400      	movs	r4, #0
 80009ba:	601c      	str	r4, [r3, #0]
 80009bc:	605c      	str	r4, [r3, #4]
 80009be:	f7ff ff97 	bl	80008f0 <motors_update>
 80009c2:	4620      	mov	r0, r4
 80009c4:	bd10      	pop	{r4, pc}
 80009c6:	bf00      	nop
 80009c8:	200001c0 	.word	0x200001c0

080009cc <m_abs>:
 80009cc:	ee07 0a90 	vmov	s15, r0
 80009d0:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 80009d4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80009d8:	bf48      	it	mi
 80009da:	eef1 7a67 	vnegmi.f32	s15, s15
 80009de:	ee17 0a90 	vmov	r0, s15
 80009e2:	4770      	bx	lr

080009e4 <m_min>:
 80009e4:	ee07 0a10 	vmov	s14, r0
 80009e8:	ee07 1a90 	vmov	s15, r1
 80009ec:	eeb4 7ae7 	vcmpe.f32	s14, s15
 80009f0:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80009f4:	bf54      	ite	pl
 80009f6:	ee17 0a90 	vmovpl	r0, s15
 80009fa:	ee17 0a10 	vmovmi	r0, s14
 80009fe:	4770      	bx	lr

08000a00 <lsm9ds0_uninit>:
 8000a00:	b508      	push	{r3, lr}
 8000a02:	20d4      	movs	r0, #212	; 0xd4
 8000a04:	2120      	movs	r1, #32
 8000a06:	2200      	movs	r2, #0
 8000a08:	f001 fb30 	bl	800206c <i2c_write_reg>
 8000a0c:	203c      	movs	r0, #60	; 0x3c
 8000a0e:	2120      	movs	r1, #32
 8000a10:	2200      	movs	r2, #0
 8000a12:	f001 fb2b 	bl	800206c <i2c_write_reg>
 8000a16:	203c      	movs	r0, #60	; 0x3c
 8000a18:	2124      	movs	r1, #36	; 0x24
 8000a1a:	2200      	movs	r2, #0
 8000a1c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000a20:	f001 bb24 	b.w	800206c <i2c_write_reg>

08000a24 <lsm9ds0_read>:
 8000a24:	b538      	push	{r3, r4, r5, lr}
 8000a26:	2128      	movs	r1, #40	; 0x28
 8000a28:	20d4      	movs	r0, #212	; 0xd4
 8000a2a:	f001 fb32 	bl	8002092 <i2c_read_reg>
 8000a2e:	2129      	movs	r1, #41	; 0x29
 8000a30:	4604      	mov	r4, r0
 8000a32:	20d4      	movs	r0, #212	; 0xd4
 8000a34:	f001 fb2d 	bl	8002092 <i2c_read_reg>
 8000a38:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
 8000a3c:	4c46      	ldr	r4, [pc, #280]	; (8000b58 <lsm9ds0_read+0x134>)
 8000a3e:	b280      	uxth	r0, r0
 8000a40:	81a0      	strh	r0, [r4, #12]
 8000a42:	89a2      	ldrh	r2, [r4, #12]
 8000a44:	8a63      	ldrh	r3, [r4, #18]
 8000a46:	b292      	uxth	r2, r2
 8000a48:	b29b      	uxth	r3, r3
 8000a4a:	1ad3      	subs	r3, r2, r3
 8000a4c:	b29b      	uxth	r3, r3
 8000a4e:	212a      	movs	r1, #42	; 0x2a
 8000a50:	20d4      	movs	r0, #212	; 0xd4
 8000a52:	8323      	strh	r3, [r4, #24]
 8000a54:	f001 fb1d 	bl	8002092 <i2c_read_reg>
 8000a58:	212b      	movs	r1, #43	; 0x2b
 8000a5a:	4605      	mov	r5, r0
 8000a5c:	20d4      	movs	r0, #212	; 0xd4
 8000a5e:	f001 fb18 	bl	8002092 <i2c_read_reg>
 8000a62:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000a66:	b285      	uxth	r5, r0
 8000a68:	81e5      	strh	r5, [r4, #14]
 8000a6a:	89e2      	ldrh	r2, [r4, #14]
 8000a6c:	8aa3      	ldrh	r3, [r4, #20]
 8000a6e:	b292      	uxth	r2, r2
 8000a70:	b29b      	uxth	r3, r3
 8000a72:	1ad3      	subs	r3, r2, r3
 8000a74:	b29b      	uxth	r3, r3
 8000a76:	212c      	movs	r1, #44	; 0x2c
 8000a78:	20d4      	movs	r0, #212	; 0xd4
 8000a7a:	8363      	strh	r3, [r4, #26]
 8000a7c:	f001 fb09 	bl	8002092 <i2c_read_reg>
 8000a80:	212d      	movs	r1, #45	; 0x2d
 8000a82:	4605      	mov	r5, r0
 8000a84:	20d4      	movs	r0, #212	; 0xd4
 8000a86:	f001 fb04 	bl	8002092 <i2c_read_reg>
 8000a8a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000a8e:	b285      	uxth	r5, r0
 8000a90:	8225      	strh	r5, [r4, #16]
 8000a92:	8a22      	ldrh	r2, [r4, #16]
 8000a94:	8ae3      	ldrh	r3, [r4, #22]
 8000a96:	b292      	uxth	r2, r2
 8000a98:	b29b      	uxth	r3, r3
 8000a9a:	1ad3      	subs	r3, r2, r3
 8000a9c:	b29b      	uxth	r3, r3
 8000a9e:	2108      	movs	r1, #8
 8000aa0:	203c      	movs	r0, #60	; 0x3c
 8000aa2:	83a3      	strh	r3, [r4, #28]
 8000aa4:	f001 faf5 	bl	8002092 <i2c_read_reg>
 8000aa8:	2109      	movs	r1, #9
 8000aaa:	4605      	mov	r5, r0
 8000aac:	203c      	movs	r0, #60	; 0x3c
 8000aae:	f001 faf0 	bl	8002092 <i2c_read_reg>
 8000ab2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ab6:	b285      	uxth	r5, r0
 8000ab8:	210a      	movs	r1, #10
 8000aba:	203c      	movs	r0, #60	; 0x3c
 8000abc:	80e5      	strh	r5, [r4, #6]
 8000abe:	f001 fae8 	bl	8002092 <i2c_read_reg>
 8000ac2:	210b      	movs	r1, #11
 8000ac4:	4605      	mov	r5, r0
 8000ac6:	203c      	movs	r0, #60	; 0x3c
 8000ac8:	f001 fae3 	bl	8002092 <i2c_read_reg>
 8000acc:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ad0:	b285      	uxth	r5, r0
 8000ad2:	210c      	movs	r1, #12
 8000ad4:	203c      	movs	r0, #60	; 0x3c
 8000ad6:	8125      	strh	r5, [r4, #8]
 8000ad8:	f001 fadb 	bl	8002092 <i2c_read_reg>
 8000adc:	210d      	movs	r1, #13
 8000ade:	4605      	mov	r5, r0
 8000ae0:	203c      	movs	r0, #60	; 0x3c
 8000ae2:	f001 fad6 	bl	8002092 <i2c_read_reg>
 8000ae6:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000aea:	b285      	uxth	r5, r0
 8000aec:	2128      	movs	r1, #40	; 0x28
 8000aee:	203c      	movs	r0, #60	; 0x3c
 8000af0:	8165      	strh	r5, [r4, #10]
 8000af2:	f001 face 	bl	8002092 <i2c_read_reg>
 8000af6:	2129      	movs	r1, #41	; 0x29
 8000af8:	4605      	mov	r5, r0
 8000afa:	203c      	movs	r0, #60	; 0x3c
 8000afc:	f001 fac9 	bl	8002092 <i2c_read_reg>
 8000b00:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b04:	b285      	uxth	r5, r0
 8000b06:	212a      	movs	r1, #42	; 0x2a
 8000b08:	203c      	movs	r0, #60	; 0x3c
 8000b0a:	8025      	strh	r5, [r4, #0]
 8000b0c:	f001 fac1 	bl	8002092 <i2c_read_reg>
 8000b10:	212b      	movs	r1, #43	; 0x2b
 8000b12:	4605      	mov	r5, r0
 8000b14:	203c      	movs	r0, #60	; 0x3c
 8000b16:	f001 fabc 	bl	8002092 <i2c_read_reg>
 8000b1a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b1e:	b285      	uxth	r5, r0
 8000b20:	212c      	movs	r1, #44	; 0x2c
 8000b22:	203c      	movs	r0, #60	; 0x3c
 8000b24:	8065      	strh	r5, [r4, #2]
 8000b26:	f001 fab4 	bl	8002092 <i2c_read_reg>
 8000b2a:	212d      	movs	r1, #45	; 0x2d
 8000b2c:	4605      	mov	r5, r0
 8000b2e:	203c      	movs	r0, #60	; 0x3c
 8000b30:	f001 faaf 	bl	8002092 <i2c_read_reg>
 8000b34:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b38:	b285      	uxth	r5, r0
 8000b3a:	2105      	movs	r1, #5
 8000b3c:	203c      	movs	r0, #60	; 0x3c
 8000b3e:	80a5      	strh	r5, [r4, #4]
 8000b40:	f001 faa7 	bl	8002092 <i2c_read_reg>
 8000b44:	2106      	movs	r1, #6
 8000b46:	4605      	mov	r5, r0
 8000b48:	203c      	movs	r0, #60	; 0x3c
 8000b4a:	f001 faa2 	bl	8002092 <i2c_read_reg>
 8000b4e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b52:	b285      	uxth	r5, r0
 8000b54:	83e5      	strh	r5, [r4, #30]
 8000b56:	bd38      	pop	{r3, r4, r5, pc}
 8000b58:	20000168 	.word	0x20000168

08000b5c <lsm9ds0_calibrate>:
 8000b5c:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000b60:	2500      	movs	r5, #0
 8000b62:	4681      	mov	r9, r0
 8000b64:	462f      	mov	r7, r5
 8000b66:	46a8      	mov	r8, r5
 8000b68:	462c      	mov	r4, r5
 8000b6a:	454c      	cmp	r4, r9
 8000b6c:	4e10      	ldr	r6, [pc, #64]	; (8000bb0 <lsm9ds0_calibrate+0x54>)
 8000b6e:	d00f      	beq.n	8000b90 <lsm9ds0_calibrate+0x34>
 8000b70:	f7ff ff58 	bl	8000a24 <lsm9ds0_read>
 8000b74:	89b3      	ldrh	r3, [r6, #12]
 8000b76:	fa08 f883 	sxtah	r8, r8, r3
 8000b7a:	89f3      	ldrh	r3, [r6, #14]
 8000b7c:	fa07 f783 	sxtah	r7, r7, r3
 8000b80:	8a33      	ldrh	r3, [r6, #16]
 8000b82:	200a      	movs	r0, #10
 8000b84:	fa05 f583 	sxtah	r5, r5, r3
 8000b88:	3401      	adds	r4, #1
 8000b8a:	f000 ffd7 	bl	8001b3c <timer_delay_ms>
 8000b8e:	e7ec      	b.n	8000b6a <lsm9ds0_calibrate+0xe>
 8000b90:	fb98 f8f4 	sdiv	r8, r8, r4
 8000b94:	fb97 f7f4 	sdiv	r7, r7, r4
 8000b98:	fb95 f4f4 	sdiv	r4, r5, r4
 8000b9c:	fa1f f888 	uxth.w	r8, r8
 8000ba0:	b2bf      	uxth	r7, r7
 8000ba2:	b2a4      	uxth	r4, r4
 8000ba4:	f8a6 8012 	strh.w	r8, [r6, #18]
 8000ba8:	82b7      	strh	r7, [r6, #20]
 8000baa:	82f4      	strh	r4, [r6, #22]
 8000bac:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000bb0:	20000168 	.word	0x20000168

08000bb4 <lsm9ds0_init>:
 8000bb4:	4b29      	ldr	r3, [pc, #164]	; (8000c5c <lsm9ds0_init+0xa8>)
 8000bb6:	b570      	push	{r4, r5, r6, lr}
 8000bb8:	210f      	movs	r1, #15
 8000bba:	2400      	movs	r4, #0
 8000bbc:	4606      	mov	r6, r0
 8000bbe:	20d4      	movs	r0, #212	; 0xd4
 8000bc0:	801c      	strh	r4, [r3, #0]
 8000bc2:	805c      	strh	r4, [r3, #2]
 8000bc4:	809c      	strh	r4, [r3, #4]
 8000bc6:	80dc      	strh	r4, [r3, #6]
 8000bc8:	811c      	strh	r4, [r3, #8]
 8000bca:	815c      	strh	r4, [r3, #10]
 8000bcc:	819c      	strh	r4, [r3, #12]
 8000bce:	81dc      	strh	r4, [r3, #14]
 8000bd0:	821c      	strh	r4, [r3, #16]
 8000bd2:	831c      	strh	r4, [r3, #24]
 8000bd4:	835c      	strh	r4, [r3, #26]
 8000bd6:	839c      	strh	r4, [r3, #28]
 8000bd8:	83dc      	strh	r4, [r3, #30]
 8000bda:	f001 fa5a 	bl	8002092 <i2c_read_reg>
 8000bde:	28d4      	cmp	r0, #212	; 0xd4
 8000be0:	4605      	mov	r5, r0
 8000be2:	d137      	bne.n	8000c54 <lsm9ds0_init+0xa0>
 8000be4:	203c      	movs	r0, #60	; 0x3c
 8000be6:	210f      	movs	r1, #15
 8000be8:	f001 fa53 	bl	8002092 <i2c_read_reg>
 8000bec:	2849      	cmp	r0, #73	; 0x49
 8000bee:	d133      	bne.n	8000c58 <lsm9ds0_init+0xa4>
 8000bf0:	4628      	mov	r0, r5
 8000bf2:	2120      	movs	r1, #32
 8000bf4:	22ff      	movs	r2, #255	; 0xff
 8000bf6:	f001 fa39 	bl	800206c <i2c_write_reg>
 8000bfa:	4628      	mov	r0, r5
 8000bfc:	2123      	movs	r1, #35	; 0x23
 8000bfe:	2218      	movs	r2, #24
 8000c00:	f001 fa34 	bl	800206c <i2c_write_reg>
 8000c04:	203c      	movs	r0, #60	; 0x3c
 8000c06:	211f      	movs	r1, #31
 8000c08:	4622      	mov	r2, r4
 8000c0a:	f001 fa2f 	bl	800206c <i2c_write_reg>
 8000c0e:	203c      	movs	r0, #60	; 0x3c
 8000c10:	2120      	movs	r1, #32
 8000c12:	2267      	movs	r2, #103	; 0x67
 8000c14:	f001 fa2a 	bl	800206c <i2c_write_reg>
 8000c18:	203c      	movs	r0, #60	; 0x3c
 8000c1a:	2121      	movs	r1, #33	; 0x21
 8000c1c:	4622      	mov	r2, r4
 8000c1e:	f001 fa25 	bl	800206c <i2c_write_reg>
 8000c22:	203c      	movs	r0, #60	; 0x3c
 8000c24:	2124      	movs	r1, #36	; 0x24
 8000c26:	22f4      	movs	r2, #244	; 0xf4
 8000c28:	f001 fa20 	bl	800206c <i2c_write_reg>
 8000c2c:	203c      	movs	r0, #60	; 0x3c
 8000c2e:	2125      	movs	r1, #37	; 0x25
 8000c30:	4622      	mov	r2, r4
 8000c32:	f001 fa1b 	bl	800206c <i2c_write_reg>
 8000c36:	203c      	movs	r0, #60	; 0x3c
 8000c38:	2126      	movs	r1, #38	; 0x26
 8000c3a:	2280      	movs	r2, #128	; 0x80
 8000c3c:	f001 fa16 	bl	800206c <i2c_write_reg>
 8000c40:	f7ff fef0 	bl	8000a24 <lsm9ds0_read>
 8000c44:	b116      	cbz	r6, 8000c4c <lsm9ds0_init+0x98>
 8000c46:	2064      	movs	r0, #100	; 0x64
 8000c48:	f7ff ff88 	bl	8000b5c <lsm9ds0_calibrate>
 8000c4c:	f7ff feea 	bl	8000a24 <lsm9ds0_read>
 8000c50:	2000      	movs	r0, #0
 8000c52:	bd70      	pop	{r4, r5, r6, pc}
 8000c54:	2001      	movs	r0, #1
 8000c56:	bd70      	pop	{r4, r5, r6, pc}
 8000c58:	2002      	movs	r0, #2
 8000c5a:	bd70      	pop	{r4, r5, r6, pc}
 8000c5c:	20000168 	.word	0x20000168

08000c60 <rgb_sensor_uninit>:
 8000c60:	b508      	push	{r3, lr}
 8000c62:	2008      	movs	r0, #8
 8000c64:	f001 fb86 	bl	8002374 <led_off>
 8000c68:	2072      	movs	r0, #114	; 0x72
 8000c6a:	2180      	movs	r1, #128	; 0x80
 8000c6c:	2200      	movs	r2, #0
 8000c6e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000c72:	f000 ba58 	b.w	8001126 <rgb_i2c_write_reg>
	...

08000c78 <rgb_sensor_read>:
 8000c78:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000c7a:	f000 f9d5 	bl	8001028 <rgb_i2cStart>
 8000c7e:	2072      	movs	r0, #114	; 0x72
 8000c80:	4d55      	ldr	r5, [pc, #340]	; (8000dd8 <rgb_sensor_read+0x160>)
 8000c82:	4c56      	ldr	r4, [pc, #344]	; (8000ddc <rgb_sensor_read+0x164>)
 8000c84:	f000 f9ee 	bl	8001064 <rgb_i2cWrite>
 8000c88:	20b4      	movs	r0, #180	; 0xb4
 8000c8a:	f000 f9eb 	bl	8001064 <rgb_i2cWrite>
 8000c8e:	f000 f9cb 	bl	8001028 <rgb_i2cStart>
 8000c92:	2073      	movs	r0, #115	; 0x73
 8000c94:	f000 f9e6 	bl	8001064 <rgb_i2cWrite>
 8000c98:	2001      	movs	r0, #1
 8000c9a:	4629      	mov	r1, r5
 8000c9c:	f000 fa02 	bl	80010a4 <rgb_i2cRead>
 8000ca0:	782b      	ldrb	r3, [r5, #0]
 8000ca2:	8323      	strh	r3, [r4, #24]
 8000ca4:	786b      	ldrb	r3, [r5, #1]
 8000ca6:	8363      	strh	r3, [r4, #26]
 8000ca8:	78ab      	ldrb	r3, [r5, #2]
 8000caa:	83a3      	strh	r3, [r4, #28]
 8000cac:	78eb      	ldrb	r3, [r5, #3]
 8000cae:	2001      	movs	r0, #1
 8000cb0:	4629      	mov	r1, r5
 8000cb2:	83e3      	strh	r3, [r4, #30]
 8000cb4:	f000 f9f6 	bl	80010a4 <rgb_i2cRead>
 8000cb8:	2300      	movs	r3, #0
 8000cba:	f103 020c 	add.w	r2, r3, #12
 8000cbe:	5ce8      	ldrb	r0, [r5, r3]
 8000cc0:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000cc4:	4f45      	ldr	r7, [pc, #276]	; (8000ddc <rgb_sensor_read+0x164>)
 8000cc6:	4e44      	ldr	r6, [pc, #272]	; (8000dd8 <rgb_sensor_read+0x160>)
 8000cc8:	b289      	uxth	r1, r1
 8000cca:	3301      	adds	r3, #1
 8000ccc:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000cd0:	2b04      	cmp	r3, #4
 8000cd2:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000cd6:	d1f0      	bne.n	8000cba <rgb_sensor_read+0x42>
 8000cd8:	2001      	movs	r0, #1
 8000cda:	4631      	mov	r1, r6
 8000cdc:	f000 f9e2 	bl	80010a4 <rgb_i2cRead>
 8000ce0:	7833      	ldrb	r3, [r6, #0]
 8000ce2:	803b      	strh	r3, [r7, #0]
 8000ce4:	7873      	ldrb	r3, [r6, #1]
 8000ce6:	807b      	strh	r3, [r7, #2]
 8000ce8:	78b3      	ldrb	r3, [r6, #2]
 8000cea:	80bb      	strh	r3, [r7, #4]
 8000cec:	78f3      	ldrb	r3, [r6, #3]
 8000cee:	2001      	movs	r0, #1
 8000cf0:	4631      	mov	r1, r6
 8000cf2:	80fb      	strh	r3, [r7, #6]
 8000cf4:	f000 f9d6 	bl	80010a4 <rgb_i2cRead>
 8000cf8:	2300      	movs	r3, #0
 8000cfa:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
 8000cfe:	5ce9      	ldrb	r1, [r5, r3]
 8000d00:	4f36      	ldr	r7, [pc, #216]	; (8000ddc <rgb_sensor_read+0x164>)
 8000d02:	4e35      	ldr	r6, [pc, #212]	; (8000dd8 <rgb_sensor_read+0x160>)
 8000d04:	b292      	uxth	r2, r2
 8000d06:	ea42 2201 	orr.w	r2, r2, r1, lsl #8
 8000d0a:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
 8000d0e:	3301      	adds	r3, #1
 8000d10:	2b04      	cmp	r3, #4
 8000d12:	d1f2      	bne.n	8000cfa <rgb_sensor_read+0x82>
 8000d14:	2001      	movs	r0, #1
 8000d16:	4631      	mov	r1, r6
 8000d18:	f000 f9c4 	bl	80010a4 <rgb_i2cRead>
 8000d1c:	7833      	ldrb	r3, [r6, #0]
 8000d1e:	813b      	strh	r3, [r7, #8]
 8000d20:	7873      	ldrb	r3, [r6, #1]
 8000d22:	817b      	strh	r3, [r7, #10]
 8000d24:	78b3      	ldrb	r3, [r6, #2]
 8000d26:	81bb      	strh	r3, [r7, #12]
 8000d28:	78f3      	ldrb	r3, [r6, #3]
 8000d2a:	2001      	movs	r0, #1
 8000d2c:	4631      	mov	r1, r6
 8000d2e:	81fb      	strh	r3, [r7, #14]
 8000d30:	f000 f9b8 	bl	80010a4 <rgb_i2cRead>
 8000d34:	2300      	movs	r3, #0
 8000d36:	1d1a      	adds	r2, r3, #4
 8000d38:	5ce8      	ldrb	r0, [r5, r3]
 8000d3a:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d3e:	4f27      	ldr	r7, [pc, #156]	; (8000ddc <rgb_sensor_read+0x164>)
 8000d40:	4e25      	ldr	r6, [pc, #148]	; (8000dd8 <rgb_sensor_read+0x160>)
 8000d42:	b289      	uxth	r1, r1
 8000d44:	3301      	adds	r3, #1
 8000d46:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d4a:	2b04      	cmp	r3, #4
 8000d4c:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d50:	d1f1      	bne.n	8000d36 <rgb_sensor_read+0xbe>
 8000d52:	2001      	movs	r0, #1
 8000d54:	4631      	mov	r1, r6
 8000d56:	f000 f9a5 	bl	80010a4 <rgb_i2cRead>
 8000d5a:	7833      	ldrb	r3, [r6, #0]
 8000d5c:	823b      	strh	r3, [r7, #16]
 8000d5e:	7873      	ldrb	r3, [r6, #1]
 8000d60:	827b      	strh	r3, [r7, #18]
 8000d62:	78b3      	ldrb	r3, [r6, #2]
 8000d64:	82bb      	strh	r3, [r7, #20]
 8000d66:	78f3      	ldrb	r3, [r6, #3]
 8000d68:	2001      	movs	r0, #1
 8000d6a:	4631      	mov	r1, r6
 8000d6c:	82fb      	strh	r3, [r7, #22]
 8000d6e:	f000 f999 	bl	80010a4 <rgb_i2cRead>
 8000d72:	2300      	movs	r3, #0
 8000d74:	f103 0208 	add.w	r2, r3, #8
 8000d78:	5ce8      	ldrb	r0, [r5, r3]
 8000d7a:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d7e:	4f17      	ldr	r7, [pc, #92]	; (8000ddc <rgb_sensor_read+0x164>)
 8000d80:	4e15      	ldr	r6, [pc, #84]	; (8000dd8 <rgb_sensor_read+0x160>)
 8000d82:	b289      	uxth	r1, r1
 8000d84:	3301      	adds	r3, #1
 8000d86:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d8a:	2b04      	cmp	r3, #4
 8000d8c:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d90:	d1f0      	bne.n	8000d74 <rgb_sensor_read+0xfc>
 8000d92:	2001      	movs	r0, #1
 8000d94:	4631      	mov	r1, r6
 8000d96:	f000 f985 	bl	80010a4 <rgb_i2cRead>
 8000d9a:	7833      	ldrb	r3, [r6, #0]
 8000d9c:	843b      	strh	r3, [r7, #32]
 8000d9e:	7873      	ldrb	r3, [r6, #1]
 8000da0:	847b      	strh	r3, [r7, #34]	; 0x22
 8000da2:	78b3      	ldrb	r3, [r6, #2]
 8000da4:	84bb      	strh	r3, [r7, #36]	; 0x24
 8000da6:	78f3      	ldrb	r3, [r6, #3]
 8000da8:	2000      	movs	r0, #0
 8000daa:	4631      	mov	r1, r6
 8000dac:	84fb      	strh	r3, [r7, #38]	; 0x26
 8000dae:	f000 f979 	bl	80010a4 <rgb_i2cRead>
 8000db2:	2300      	movs	r3, #0
 8000db4:	f103 0210 	add.w	r2, r3, #16
 8000db8:	5ce8      	ldrb	r0, [r5, r3]
 8000dba:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000dbe:	3301      	adds	r3, #1
 8000dc0:	b289      	uxth	r1, r1
 8000dc2:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000dc6:	2b04      	cmp	r3, #4
 8000dc8:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000dcc:	d1f2      	bne.n	8000db4 <rgb_sensor_read+0x13c>
 8000dce:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8000dd2:	f000 b938 	b.w	8001046 <rgb_i2cStop>
 8000dd6:	bf00      	nop
 8000dd8:	200005d0 	.word	0x200005d0
 8000ddc:	20000188 	.word	0x20000188

08000de0 <rgb_sensor_init>:
 8000de0:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000de2:	2300      	movs	r3, #0
 8000de4:	4a24      	ldr	r2, [pc, #144]	; (8000e78 <rgb_sensor_init+0x98>)
 8000de6:	1d19      	adds	r1, r3, #4
 8000de8:	2400      	movs	r4, #0
 8000dea:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8000dee:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000df2:	f103 0108 	add.w	r1, r3, #8
 8000df6:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000dfa:	f103 0110 	add.w	r1, r3, #16
 8000dfe:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e02:	f103 010c 	add.w	r1, r3, #12
 8000e06:	3301      	adds	r3, #1
 8000e08:	2b04      	cmp	r3, #4
 8000e0a:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e0e:	d1e9      	bne.n	8000de4 <rgb_sensor_init+0x4>
 8000e10:	2008      	movs	r0, #8
 8000e12:	f001 fa99 	bl	8002348 <led_on>
 8000e16:	f000 f8d7 	bl	8000fc8 <rgb_i2c_init>
 8000e1a:	2072      	movs	r0, #114	; 0x72
 8000e1c:	2181      	movs	r1, #129	; 0x81
 8000e1e:	22ff      	movs	r2, #255	; 0xff
 8000e20:	f000 f981 	bl	8001126 <rgb_i2c_write_reg>
 8000e24:	2072      	movs	r0, #114	; 0x72
 8000e26:	2183      	movs	r1, #131	; 0x83
 8000e28:	22ff      	movs	r2, #255	; 0xff
 8000e2a:	f000 f97c 	bl	8001126 <rgb_i2c_write_reg>
 8000e2e:	2072      	movs	r0, #114	; 0x72
 8000e30:	218d      	movs	r1, #141	; 0x8d
 8000e32:	4622      	mov	r2, r4
 8000e34:	f000 f977 	bl	8001126 <rgb_i2c_write_reg>
 8000e38:	2072      	movs	r0, #114	; 0x72
 8000e3a:	2180      	movs	r1, #128	; 0x80
 8000e3c:	2203      	movs	r2, #3
 8000e3e:	f000 f972 	bl	8001126 <rgb_i2c_write_reg>
 8000e42:	ad01      	add	r5, sp, #4
 8000e44:	2072      	movs	r0, #114	; 0x72
 8000e46:	218f      	movs	r1, #143	; 0x8f
 8000e48:	2223      	movs	r2, #35	; 0x23
 8000e4a:	f000 f96c 	bl	8001126 <rgb_i2c_write_reg>
 8000e4e:	f7ff ff13 	bl	8000c78 <rgb_sensor_read>
 8000e52:	2072      	movs	r0, #114	; 0x72
 8000e54:	2192      	movs	r1, #146	; 0x92
 8000e56:	462a      	mov	r2, r5
 8000e58:	f000 f978 	bl	800114c <rgb_i2c_read_reg>
 8000e5c:	4620      	mov	r0, r4
 8000e5e:	4623      	mov	r3, r4
 8000e60:	5cea      	ldrb	r2, [r5, r3]
 8000e62:	2a69      	cmp	r2, #105	; 0x69
 8000e64:	d002      	beq.n	8000e6c <rgb_sensor_init+0x8c>
 8000e66:	2201      	movs	r2, #1
 8000e68:	409a      	lsls	r2, r3
 8000e6a:	4310      	orrs	r0, r2
 8000e6c:	3301      	adds	r3, #1
 8000e6e:	2b04      	cmp	r3, #4
 8000e70:	d1f6      	bne.n	8000e60 <rgb_sensor_init+0x80>
 8000e72:	b003      	add	sp, #12
 8000e74:	bd30      	pop	{r4, r5, pc}
 8000e76:	bf00      	nop
 8000e78:	20000188 	.word	0x20000188

08000e7c <rgb_get_line_position>:
 8000e7c:	4b18      	ldr	r3, [pc, #96]	; (8000ee0 <rgb_get_line_position+0x64>)
 8000e7e:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000e80:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
 8000e82:	b085      	sub	sp, #20
 8000e84:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
 8000e88:	2200      	movs	r2, #0
 8000e8a:	466c      	mov	r4, sp
 8000e8c:	4611      	mov	r1, r2
 8000e8e:	4613      	mov	r3, r2
 8000e90:	4814      	ldr	r0, [pc, #80]	; (8000ee4 <rgb_get_line_position+0x68>)
 8000e92:	f103 060c 	add.w	r6, r3, #12
 8000e96:	f103 050a 	add.w	r5, r3, #10
 8000e9a:	f830 c016 	ldrh.w	ip, [r0, r6, lsl #1]
 8000e9e:	f850 7025 	ldr.w	r7, [r0, r5, lsl #2]
 8000ea2:	f830 6016 	ldrh.w	r6, [r0, r6, lsl #1]
 8000ea6:	f850 5025 	ldr.w	r5, [r0, r5, lsl #2]
 8000eaa:	fa0f fc8c 	sxth.w	ip, ip
 8000eae:	ebc7 0c0c 	rsb	ip, r7, ip
 8000eb2:	b230      	sxth	r0, r6
 8000eb4:	f854 7023 	ldr.w	r7, [r4, r3, lsl #2]
 8000eb8:	3301      	adds	r3, #1
 8000eba:	1b40      	subs	r0, r0, r5
 8000ebc:	2b04      	cmp	r3, #4
 8000ebe:	fb07 220c 	mla	r2, r7, ip, r2
 8000ec2:	4401      	add	r1, r0
 8000ec4:	d1e4      	bne.n	8000e90 <rgb_get_line_position+0x14>
 8000ec6:	4b08      	ldr	r3, [pc, #32]	; (8000ee8 <rgb_get_line_position+0x6c>)
 8000ec8:	2000      	movs	r0, #0
 8000eca:	2914      	cmp	r1, #20
 8000ecc:	7118      	strb	r0, [r3, #4]
 8000ece:	dd05      	ble.n	8000edc <rgb_get_line_position+0x60>
 8000ed0:	fb92 f2f1 	sdiv	r2, r2, r1
 8000ed4:	2001      	movs	r0, #1
 8000ed6:	3a47      	subs	r2, #71	; 0x47
 8000ed8:	7118      	strb	r0, [r3, #4]
 8000eda:	601a      	str	r2, [r3, #0]
 8000edc:	b005      	add	sp, #20
 8000ede:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000ee0:	080025d4 	.word	0x080025d4
 8000ee4:	20000188 	.word	0x20000188
 8000ee8:	200005c8 	.word	0x200005c8

08000eec <rgb_set_background>:
 8000eec:	4b13      	ldr	r3, [pc, #76]	; (8000f3c <rgb_set_background+0x50>)
 8000eee:	2200      	movs	r2, #0
 8000ef0:	b530      	push	{r4, r5, lr}
 8000ef2:	2164      	movs	r1, #100	; 0x64
 8000ef4:	629a      	str	r2, [r3, #40]	; 0x28
 8000ef6:	62da      	str	r2, [r3, #44]	; 0x2c
 8000ef8:	631a      	str	r2, [r3, #48]	; 0x30
 8000efa:	635a      	str	r2, [r3, #52]	; 0x34
 8000efc:	2200      	movs	r2, #0
 8000efe:	f102 000a 	add.w	r0, r2, #10
 8000f02:	f102 050c 	add.w	r5, r2, #12
 8000f06:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8000f0a:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 8000f0e:	3201      	adds	r2, #1
 8000f10:	fa04 f485 	sxtah	r4, r4, r5
 8000f14:	2a04      	cmp	r2, #4
 8000f16:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 8000f1a:	d1f0      	bne.n	8000efe <rgb_set_background+0x12>
 8000f1c:	3901      	subs	r1, #1
 8000f1e:	d1ed      	bne.n	8000efc <rgb_set_background+0x10>
 8000f20:	460a      	mov	r2, r1
 8000f22:	f102 010a 	add.w	r1, r2, #10
 8000f26:	2064      	movs	r0, #100	; 0x64
 8000f28:	f853 4021 	ldr.w	r4, [r3, r1, lsl #2]
 8000f2c:	3201      	adds	r2, #1
 8000f2e:	fb94 f0f0 	sdiv	r0, r4, r0
 8000f32:	2a04      	cmp	r2, #4
 8000f34:	f843 0021 	str.w	r0, [r3, r1, lsl #2]
 8000f38:	d1f3      	bne.n	8000f22 <rgb_set_background+0x36>
 8000f3a:	bd30      	pop	{r4, r5, pc}
 8000f3c:	20000188 	.word	0x20000188

08000f40 <rgb_i2c_delay>:
 8000f40:	bf00      	nop
 8000f42:	4770      	bx	lr

08000f44 <RGBSetLowSDA>:
 8000f44:	b513      	push	{r0, r1, r4, lr}
 8000f46:	2301      	movs	r3, #1
 8000f48:	2203      	movs	r2, #3
 8000f4a:	24f0      	movs	r4, #240	; 0xf0
 8000f4c:	f88d 3004 	strb.w	r3, [sp, #4]
 8000f50:	f88d 3006 	strb.w	r3, [sp, #6]
 8000f54:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000f58:	2300      	movs	r3, #0
 8000f5a:	4669      	mov	r1, sp
 8000f5c:	f88d 2005 	strb.w	r2, [sp, #5]
 8000f60:	f88d 3007 	strb.w	r3, [sp, #7]
 8000f64:	9400      	str	r4, [sp, #0]
 8000f66:	f001 f98a 	bl	800227e <GPIO_Init>
 8000f6a:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000f6e:	851c      	strh	r4, [r3, #40]	; 0x28
 8000f70:	f7ff ffe6 	bl	8000f40 <rgb_i2c_delay>
 8000f74:	b002      	add	sp, #8
 8000f76:	bd10      	pop	{r4, pc}

08000f78 <RGBSetHighSDA>:
 8000f78:	b513      	push	{r0, r1, r4, lr}
 8000f7a:	2300      	movs	r3, #0
 8000f7c:	2203      	movs	r2, #3
 8000f7e:	24f0      	movs	r4, #240	; 0xf0
 8000f80:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000f84:	4669      	mov	r1, sp
 8000f86:	f88d 3004 	strb.w	r3, [sp, #4]
 8000f8a:	f88d 2005 	strb.w	r2, [sp, #5]
 8000f8e:	f88d 3007 	strb.w	r3, [sp, #7]
 8000f92:	9400      	str	r4, [sp, #0]
 8000f94:	f001 f973 	bl	800227e <GPIO_Init>
 8000f98:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000f9c:	619c      	str	r4, [r3, #24]
 8000f9e:	f7ff ffcf 	bl	8000f40 <rgb_i2c_delay>
 8000fa2:	b002      	add	sp, #8
 8000fa4:	bd10      	pop	{r4, pc}
	...

08000fa8 <RGBSetLowSCL>:
 8000fa8:	4b02      	ldr	r3, [pc, #8]	; (8000fb4 <RGBSetLowSCL+0xc>)
 8000faa:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8000fae:	851a      	strh	r2, [r3, #40]	; 0x28
 8000fb0:	f7ff bfc6 	b.w	8000f40 <rgb_i2c_delay>
 8000fb4:	48000800 	.word	0x48000800

08000fb8 <RGBSetHighSCL>:
 8000fb8:	4b02      	ldr	r3, [pc, #8]	; (8000fc4 <RGBSetHighSCL+0xc>)
 8000fba:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8000fbe:	619a      	str	r2, [r3, #24]
 8000fc0:	f7ff bfbe 	b.w	8000f40 <rgb_i2c_delay>
 8000fc4:	48000800 	.word	0x48000800

08000fc8 <rgb_i2c_init>:
 8000fc8:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8000fca:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000fce:	2400      	movs	r4, #0
 8000fd0:	9300      	str	r3, [sp, #0]
 8000fd2:	2603      	movs	r6, #3
 8000fd4:	2301      	movs	r3, #1
 8000fd6:	4669      	mov	r1, sp
 8000fd8:	4812      	ldr	r0, [pc, #72]	; (8001024 <rgb_i2c_init+0x5c>)
 8000fda:	f88d 3004 	strb.w	r3, [sp, #4]
 8000fde:	25f0      	movs	r5, #240	; 0xf0
 8000fe0:	f88d 6005 	strb.w	r6, [sp, #5]
 8000fe4:	f88d 4006 	strb.w	r4, [sp, #6]
 8000fe8:	f88d 4007 	strb.w	r4, [sp, #7]
 8000fec:	f001 f947 	bl	800227e <GPIO_Init>
 8000ff0:	4669      	mov	r1, sp
 8000ff2:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000ff6:	9500      	str	r5, [sp, #0]
 8000ff8:	f88d 4004 	strb.w	r4, [sp, #4]
 8000ffc:	f88d 6005 	strb.w	r6, [sp, #5]
 8001000:	f88d 4007 	strb.w	r4, [sp, #7]
 8001004:	f001 f93b 	bl	800227e <GPIO_Init>
 8001008:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800100c:	4629      	mov	r1, r5
 800100e:	f001 f97c 	bl	800230a <GPIO_SetBits>
 8001012:	f7ff ffd1 	bl	8000fb8 <RGBSetHighSCL>
 8001016:	f7ff ff95 	bl	8000f44 <RGBSetLowSDA>
 800101a:	f7ff ffad 	bl	8000f78 <RGBSetHighSDA>
 800101e:	b002      	add	sp, #8
 8001020:	bd70      	pop	{r4, r5, r6, pc}
 8001022:	bf00      	nop
 8001024:	48000800 	.word	0x48000800

08001028 <rgb_i2cStart>:
 8001028:	b508      	push	{r3, lr}
 800102a:	f7ff ffc5 	bl	8000fb8 <RGBSetHighSCL>
 800102e:	f7ff ffa3 	bl	8000f78 <RGBSetHighSDA>
 8001032:	f7ff ffc1 	bl	8000fb8 <RGBSetHighSCL>
 8001036:	f7ff ff85 	bl	8000f44 <RGBSetLowSDA>
 800103a:	f7ff ffb5 	bl	8000fa8 <RGBSetLowSCL>
 800103e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001042:	f7ff bf99 	b.w	8000f78 <RGBSetHighSDA>

08001046 <rgb_i2cStop>:
 8001046:	b508      	push	{r3, lr}
 8001048:	f7ff ffae 	bl	8000fa8 <RGBSetLowSCL>
 800104c:	f7ff ff7a 	bl	8000f44 <RGBSetLowSDA>
 8001050:	f7ff ffb2 	bl	8000fb8 <RGBSetHighSCL>
 8001054:	f7ff ff76 	bl	8000f44 <RGBSetLowSDA>
 8001058:	f7ff ffae 	bl	8000fb8 <RGBSetHighSCL>
 800105c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001060:	f7ff bf8a 	b.w	8000f78 <RGBSetHighSDA>

08001064 <rgb_i2cWrite>:
 8001064:	b538      	push	{r3, r4, r5, lr}
 8001066:	4604      	mov	r4, r0
 8001068:	2508      	movs	r5, #8
 800106a:	f7ff ff9d 	bl	8000fa8 <RGBSetLowSCL>
 800106e:	0623      	lsls	r3, r4, #24
 8001070:	d502      	bpl.n	8001078 <rgb_i2cWrite+0x14>
 8001072:	f7ff ff81 	bl	8000f78 <RGBSetHighSDA>
 8001076:	e001      	b.n	800107c <rgb_i2cWrite+0x18>
 8001078:	f7ff ff64 	bl	8000f44 <RGBSetLowSDA>
 800107c:	3d01      	subs	r5, #1
 800107e:	f7ff ff9b 	bl	8000fb8 <RGBSetHighSCL>
 8001082:	0064      	lsls	r4, r4, #1
 8001084:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001088:	b2e4      	uxtb	r4, r4
 800108a:	d1ee      	bne.n	800106a <rgb_i2cWrite+0x6>
 800108c:	f7ff ff8c 	bl	8000fa8 <RGBSetLowSCL>
 8001090:	f7ff ff72 	bl	8000f78 <RGBSetHighSDA>
 8001094:	f7ff ff90 	bl	8000fb8 <RGBSetHighSCL>
 8001098:	f7ff ff86 	bl	8000fa8 <RGBSetLowSCL>
 800109c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80010a0:	f7ff bf4e 	b.w	8000f40 <rgb_i2c_delay>

080010a4 <rgb_i2cRead>:
 80010a4:	2300      	movs	r3, #0
 80010a6:	b570      	push	{r4, r5, r6, lr}
 80010a8:	700b      	strb	r3, [r1, #0]
 80010aa:	704b      	strb	r3, [r1, #1]
 80010ac:	708b      	strb	r3, [r1, #2]
 80010ae:	70cb      	strb	r3, [r1, #3]
 80010b0:	4606      	mov	r6, r0
 80010b2:	460c      	mov	r4, r1
 80010b4:	f7ff ff78 	bl	8000fa8 <RGBSetLowSCL>
 80010b8:	f7ff ff5e 	bl	8000f78 <RGBSetHighSDA>
 80010bc:	2508      	movs	r5, #8
 80010be:	2300      	movs	r3, #0
 80010c0:	5ce2      	ldrb	r2, [r4, r3]
 80010c2:	0052      	lsls	r2, r2, #1
 80010c4:	54e2      	strb	r2, [r4, r3]
 80010c6:	3301      	adds	r3, #1
 80010c8:	2b04      	cmp	r3, #4
 80010ca:	d1f9      	bne.n	80010c0 <rgb_i2cRead+0x1c>
 80010cc:	f7ff ff74 	bl	8000fb8 <RGBSetHighSCL>
 80010d0:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80010d4:	8a1b      	ldrh	r3, [r3, #16]
 80010d6:	b29b      	uxth	r3, r3
 80010d8:	06da      	lsls	r2, r3, #27
 80010da:	d503      	bpl.n	80010e4 <rgb_i2cRead+0x40>
 80010dc:	7822      	ldrb	r2, [r4, #0]
 80010de:	f042 0201 	orr.w	r2, r2, #1
 80010e2:	7022      	strb	r2, [r4, #0]
 80010e4:	0698      	lsls	r0, r3, #26
 80010e6:	d503      	bpl.n	80010f0 <rgb_i2cRead+0x4c>
 80010e8:	7862      	ldrb	r2, [r4, #1]
 80010ea:	f042 0201 	orr.w	r2, r2, #1
 80010ee:	7062      	strb	r2, [r4, #1]
 80010f0:	0659      	lsls	r1, r3, #25
 80010f2:	d503      	bpl.n	80010fc <rgb_i2cRead+0x58>
 80010f4:	78a2      	ldrb	r2, [r4, #2]
 80010f6:	f042 0201 	orr.w	r2, r2, #1
 80010fa:	70a2      	strb	r2, [r4, #2]
 80010fc:	061a      	lsls	r2, r3, #24
 80010fe:	d503      	bpl.n	8001108 <rgb_i2cRead+0x64>
 8001100:	78e3      	ldrb	r3, [r4, #3]
 8001102:	f043 0301 	orr.w	r3, r3, #1
 8001106:	70e3      	strb	r3, [r4, #3]
 8001108:	f7ff ff4e 	bl	8000fa8 <RGBSetLowSCL>
 800110c:	3d01      	subs	r5, #1
 800110e:	d1d6      	bne.n	80010be <rgb_i2cRead+0x1a>
 8001110:	b10e      	cbz	r6, 8001116 <rgb_i2cRead+0x72>
 8001112:	f7ff ff17 	bl	8000f44 <RGBSetLowSDA>
 8001116:	f7ff ff4f 	bl	8000fb8 <RGBSetHighSCL>
 800111a:	f7ff ff45 	bl	8000fa8 <RGBSetLowSCL>
 800111e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001122:	f7ff bf0d 	b.w	8000f40 <rgb_i2c_delay>

08001126 <rgb_i2c_write_reg>:
 8001126:	b570      	push	{r4, r5, r6, lr}
 8001128:	4605      	mov	r5, r0
 800112a:	460c      	mov	r4, r1
 800112c:	4616      	mov	r6, r2
 800112e:	f7ff ff7b 	bl	8001028 <rgb_i2cStart>
 8001132:	4628      	mov	r0, r5
 8001134:	f7ff ff96 	bl	8001064 <rgb_i2cWrite>
 8001138:	4620      	mov	r0, r4
 800113a:	f7ff ff93 	bl	8001064 <rgb_i2cWrite>
 800113e:	4630      	mov	r0, r6
 8001140:	f7ff ff90 	bl	8001064 <rgb_i2cWrite>
 8001144:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001148:	f7ff bf7d 	b.w	8001046 <rgb_i2cStop>

0800114c <rgb_i2c_read_reg>:
 800114c:	b570      	push	{r4, r5, r6, lr}
 800114e:	4604      	mov	r4, r0
 8001150:	460d      	mov	r5, r1
 8001152:	4616      	mov	r6, r2
 8001154:	f7ff ff68 	bl	8001028 <rgb_i2cStart>
 8001158:	4620      	mov	r0, r4
 800115a:	f7ff ff83 	bl	8001064 <rgb_i2cWrite>
 800115e:	4628      	mov	r0, r5
 8001160:	f7ff ff80 	bl	8001064 <rgb_i2cWrite>
 8001164:	f7ff ff60 	bl	8001028 <rgb_i2cStart>
 8001168:	f044 0001 	orr.w	r0, r4, #1
 800116c:	f7ff ff7a 	bl	8001064 <rgb_i2cWrite>
 8001170:	4631      	mov	r1, r6
 8001172:	2000      	movs	r0, #0
 8001174:	f7ff ff96 	bl	80010a4 <rgb_i2cRead>
 8001178:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800117c:	f7ff bf63 	b.w	8001046 <rgb_i2cStop>

08001180 <device_sleep>:
 8001180:	4b01      	ldr	r3, [pc, #4]	; (8001188 <device_sleep+0x8>)
 8001182:	22ff      	movs	r2, #255	; 0xff
 8001184:	701a      	strb	r2, [r3, #0]
 8001186:	4770      	bx	lr
 8001188:	20000030 	.word	0x20000030

0800118c <device_wake_up>:
 800118c:	4b01      	ldr	r3, [pc, #4]	; (8001194 <device_wake_up+0x8>)
 800118e:	2200      	movs	r2, #0
 8001190:	701a      	strb	r2, [r3, #0]
 8001192:	4770      	bx	lr
 8001194:	20000030 	.word	0x20000030

08001198 <device_i2c_thread>:
 8001198:	b538      	push	{r3, r4, r5, lr}
 800119a:	2000      	movs	r0, #0
 800119c:	210a      	movs	r1, #10
 800119e:	f000 fcdd 	bl	8001b5c <event_timer_set_period>
 80011a2:	2501      	movs	r5, #1
 80011a4:	2400      	movs	r4, #0
 80011a6:	2c01      	cmp	r4, #1
 80011a8:	d017      	beq.n	80011da <device_i2c_thread+0x42>
 80011aa:	d30f      	bcc.n	80011cc <device_i2c_thread+0x34>
 80011ac:	2c02      	cmp	r4, #2
 80011ae:	d1fa      	bne.n	80011a6 <device_i2c_thread+0xe>
 80011b0:	f7ff fc26 	bl	8000a00 <lsm9ds0_uninit>
 80011b4:	f7ff fb8e 	bl	80008d4 <motors_uninit>
 80011b8:	2064      	movs	r0, #100	; 0x64
 80011ba:	f000 fcbf 	bl	8001b3c <timer_delay_ms>
 80011be:	4b0d      	ldr	r3, [pc, #52]	; (80011f4 <device_i2c_thread+0x5c>)
 80011c0:	781c      	ldrb	r4, [r3, #0]
 80011c2:	2c00      	cmp	r4, #0
 80011c4:	bf14      	ite	ne
 80011c6:	2402      	movne	r4, #2
 80011c8:	2400      	moveq	r4, #0
 80011ca:	e7ec      	b.n	80011a6 <device_i2c_thread+0xe>
 80011cc:	f7ff fbf2 	bl	80009b4 <motors_init>
 80011d0:	4628      	mov	r0, r5
 80011d2:	f7ff fcef 	bl	8000bb4 <lsm9ds0_init>
 80011d6:	2500      	movs	r5, #0
 80011d8:	2401      	movs	r4, #1
 80011da:	2000      	movs	r0, #0
 80011dc:	f000 fcd4 	bl	8001b88 <event_timer_wait>
 80011e0:	f7ff fc20 	bl	8000a24 <lsm9ds0_read>
 80011e4:	f7ff fb84 	bl	80008f0 <motors_update>
 80011e8:	4b02      	ldr	r3, [pc, #8]	; (80011f4 <device_i2c_thread+0x5c>)
 80011ea:	781b      	ldrb	r3, [r3, #0]
 80011ec:	2b00      	cmp	r3, #0
 80011ee:	bf18      	it	ne
 80011f0:	2402      	movne	r4, #2
 80011f2:	e7d8      	b.n	80011a6 <device_i2c_thread+0xe>
 80011f4:	20000030 	.word	0x20000030

080011f8 <device_rgb_sensors_thread>:
 80011f8:	b510      	push	{r4, lr}
 80011fa:	2001      	movs	r0, #1
 80011fc:	210a      	movs	r1, #10
 80011fe:	f000 fcad 	bl	8001b5c <event_timer_set_period>
 8001202:	2400      	movs	r4, #0
 8001204:	2001      	movs	r0, #1
 8001206:	f000 fcbf 	bl	8001b88 <event_timer_wait>
 800120a:	f7ff fd35 	bl	8000c78 <rgb_sensor_read>
 800120e:	2c01      	cmp	r4, #1
 8001210:	d01a      	beq.n	8001248 <device_rgb_sensors_thread+0x50>
 8001212:	d30d      	bcc.n	8001230 <device_rgb_sensors_thread+0x38>
 8001214:	2c02      	cmp	r4, #2
 8001216:	d1f5      	bne.n	8001204 <device_rgb_sensors_thread+0xc>
 8001218:	f7ff fd22 	bl	8000c60 <rgb_sensor_uninit>
 800121c:	2064      	movs	r0, #100	; 0x64
 800121e:	f000 fc8d 	bl	8001b3c <timer_delay_ms>
 8001222:	4b0f      	ldr	r3, [pc, #60]	; (8001260 <device_rgb_sensors_thread+0x68>)
 8001224:	781c      	ldrb	r4, [r3, #0]
 8001226:	2c00      	cmp	r4, #0
 8001228:	bf14      	ite	ne
 800122a:	2402      	movne	r4, #2
 800122c:	2400      	moveq	r4, #0
 800122e:	e7e9      	b.n	8001204 <device_rgb_sensors_thread+0xc>
 8001230:	f7ff fdd6 	bl	8000de0 <rgb_sensor_init>
 8001234:	4604      	mov	r4, r0
 8001236:	b128      	cbz	r0, 8001244 <device_rgb_sensors_thread+0x4c>
 8001238:	f7ff fd12 	bl	8000c60 <rgb_sensor_uninit>
 800123c:	2001      	movs	r0, #1
 800123e:	4621      	mov	r1, r4
 8001240:	f000 f856 	bl	80012f0 <abort_error_>
 8001244:	2401      	movs	r4, #1
 8001246:	e7dd      	b.n	8001204 <device_rgb_sensors_thread+0xc>
 8001248:	4620      	mov	r0, r4
 800124a:	f000 fc9d 	bl	8001b88 <event_timer_wait>
 800124e:	f7ff fd13 	bl	8000c78 <rgb_sensor_read>
 8001252:	4b03      	ldr	r3, [pc, #12]	; (8001260 <device_rgb_sensors_thread+0x68>)
 8001254:	781b      	ldrb	r3, [r3, #0]
 8001256:	2b00      	cmp	r3, #0
 8001258:	d0f4      	beq.n	8001244 <device_rgb_sensors_thread+0x4c>
 800125a:	2402      	movs	r4, #2
 800125c:	e7d2      	b.n	8001204 <device_rgb_sensors_thread+0xc>
 800125e:	bf00      	nop
 8001260:	20000030 	.word	0x20000030

08001264 <device_wifi_thread>:
 8001264:	b570      	push	{r4, r5, r6, lr}
 8001266:	4b1f      	ldr	r3, [pc, #124]	; (80012e4 <device_wifi_thread+0x80>)
 8001268:	b0a6      	sub	sp, #152	; 0x98
 800126a:	ac02      	add	r4, sp, #8
 800126c:	f103 0210 	add.w	r2, r3, #16
 8001270:	4626      	mov	r6, r4
 8001272:	6818      	ldr	r0, [r3, #0]
 8001274:	6859      	ldr	r1, [r3, #4]
 8001276:	4625      	mov	r5, r4
 8001278:	c503      	stmia	r5!, {r0, r1}
 800127a:	3308      	adds	r3, #8
 800127c:	4293      	cmp	r3, r2
 800127e:	462c      	mov	r4, r5
 8001280:	d1f7      	bne.n	8001272 <device_wifi_thread+0xe>
 8001282:	4630      	mov	r0, r6
 8001284:	f7ff f8ac 	bl	80003e0 <strlen_>
 8001288:	2100      	movs	r1, #0
 800128a:	4605      	mov	r5, r0
 800128c:	2901      	cmp	r1, #1
 800128e:	d01c      	beq.n	80012ca <device_wifi_thread+0x66>
 8001290:	d30d      	bcc.n	80012ae <device_wifi_thread+0x4a>
 8001292:	2900      	cmp	r1, #0
 8001294:	d0fa      	beq.n	800128c <device_wifi_thread+0x28>
 8001296:	f7ff fa69 	bl	800076c <esp8266_uninit>
 800129a:	2064      	movs	r0, #100	; 0x64
 800129c:	f000 fc4e 	bl	8001b3c <timer_delay_ms>
 80012a0:	4b11      	ldr	r3, [pc, #68]	; (80012e8 <device_wifi_thread+0x84>)
 80012a2:	7819      	ldrb	r1, [r3, #0]
 80012a4:	2900      	cmp	r1, #0
 80012a6:	bf14      	ite	ne
 80012a8:	2102      	movne	r1, #2
 80012aa:	2100      	moveq	r1, #0
 80012ac:	e7ee      	b.n	800128c <device_wifi_thread+0x28>
 80012ae:	2001      	movs	r0, #1
 80012b0:	f001 f84a 	bl	8002348 <led_on>
 80012b4:	2000      	movs	r0, #0
 80012b6:	f7ff fa0d 	bl	80006d4 <esp8266_init>
 80012ba:	4604      	mov	r4, r0
 80012bc:	b128      	cbz	r0, 80012ca <device_wifi_thread+0x66>
 80012be:	f7ff fa55 	bl	800076c <esp8266_uninit>
 80012c2:	2003      	movs	r0, #3
 80012c4:	4621      	mov	r1, r4
 80012c6:	f000 f813 	bl	80012f0 <abort_error_>
 80012ca:	ab06      	add	r3, sp, #24
 80012cc:	9300      	str	r3, [sp, #0]
 80012ce:	2380      	movs	r3, #128	; 0x80
 80012d0:	9301      	str	r3, [sp, #4]
 80012d2:	f240 71da 	movw	r1, #2010	; 0x7da
 80012d6:	4632      	mov	r2, r6
 80012d8:	462b      	mov	r3, r5
 80012da:	4804      	ldr	r0, [pc, #16]	; (80012ec <device_wifi_thread+0x88>)
 80012dc:	f7ff fa72 	bl	80007c4 <esp8266_connect>
 80012e0:	e7f3      	b.n	80012ca <device_wifi_thread+0x66>
 80012e2:	bf00      	nop
 80012e4:	080025f0 	.word	0x080025f0
 80012e8:	20000030 	.word	0x20000030
 80012ec:	080025e4 	.word	0x080025e4

080012f0 <abort_error_>:
 80012f0:	b570      	push	{r4, r5, r6, lr}
 80012f2:	4605      	mov	r5, r0
 80012f4:	460e      	mov	r6, r1
 80012f6:	480d      	ldr	r0, [pc, #52]	; (800132c <abort_error_+0x3c>)
 80012f8:	4629      	mov	r1, r5
 80012fa:	4632      	mov	r2, r6
 80012fc:	f7ff f8f2 	bl	80004e4 <printf_>
 8001300:	2408      	movs	r4, #8
 8001302:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001306:	f001 f81f 	bl	8002348 <led_on>
 800130a:	201e      	movs	r0, #30
 800130c:	f000 fc16 	bl	8001b3c <timer_delay_ms>
 8001310:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001314:	f001 f82e 	bl	8002374 <led_off>
 8001318:	2046      	movs	r0, #70	; 0x46
 800131a:	f000 fc0f 	bl	8001b3c <timer_delay_ms>
 800131e:	3c01      	subs	r4, #1
 8001320:	d1ef      	bne.n	8001302 <abort_error_+0x12>
 8001322:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8001326:	f000 fc09 	bl	8001b3c <timer_delay_ms>
 800132a:	e7e4      	b.n	80012f6 <abort_error_+0x6>
 800132c:	08002600 	.word	0x08002600

08001330 <sensor_test>:
 8001330:	b538      	push	{r3, r4, r5, lr}
 8001332:	4c37      	ldr	r4, [pc, #220]	; (8001410 <sensor_test+0xe0>)
 8001334:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001338:	f001 f806 	bl	8002348 <led_on>
 800133c:	4835      	ldr	r0, [pc, #212]	; (8001414 <sensor_test+0xe4>)
 800133e:	f7ff f8d1 	bl	80004e4 <printf_>
 8001342:	89a1      	ldrh	r1, [r4, #12]
 8001344:	89e2      	ldrh	r2, [r4, #14]
 8001346:	8a23      	ldrh	r3, [r4, #16]
 8001348:	4833      	ldr	r0, [pc, #204]	; (8001418 <sensor_test+0xe8>)
 800134a:	b209      	sxth	r1, r1
 800134c:	b212      	sxth	r2, r2
 800134e:	b21b      	sxth	r3, r3
 8001350:	f7ff f8c8 	bl	80004e4 <printf_>
 8001354:	88e1      	ldrh	r1, [r4, #6]
 8001356:	8922      	ldrh	r2, [r4, #8]
 8001358:	8963      	ldrh	r3, [r4, #10]
 800135a:	482f      	ldr	r0, [pc, #188]	; (8001418 <sensor_test+0xe8>)
 800135c:	b209      	sxth	r1, r1
 800135e:	b212      	sxth	r2, r2
 8001360:	b21b      	sxth	r3, r3
 8001362:	f7ff f8bf 	bl	80004e4 <printf_>
 8001366:	8821      	ldrh	r1, [r4, #0]
 8001368:	8862      	ldrh	r2, [r4, #2]
 800136a:	88a3      	ldrh	r3, [r4, #4]
 800136c:	482b      	ldr	r0, [pc, #172]	; (800141c <sensor_test+0xec>)
 800136e:	b209      	sxth	r1, r1
 8001370:	b212      	sxth	r2, r2
 8001372:	b21b      	sxth	r3, r3
 8001374:	f7ff f8b6 	bl	80004e4 <printf_>
 8001378:	4829      	ldr	r0, [pc, #164]	; (8001420 <sensor_test+0xf0>)
 800137a:	f7ff f8b3 	bl	80004e4 <printf_>
 800137e:	4829      	ldr	r0, [pc, #164]	; (8001424 <sensor_test+0xf4>)
 8001380:	f7ff f8b0 	bl	80004e4 <printf_>
 8001384:	4828      	ldr	r0, [pc, #160]	; (8001428 <sensor_test+0xf8>)
 8001386:	f7ff f8ad 	bl	80004e4 <printf_>
 800138a:	2400      	movs	r4, #0
 800138c:	4d27      	ldr	r5, [pc, #156]	; (800142c <sensor_test+0xfc>)
 800138e:	4828      	ldr	r0, [pc, #160]	; (8001430 <sensor_test+0x100>)
 8001390:	f835 1014 	ldrh.w	r1, [r5, r4, lsl #1]
 8001394:	3401      	adds	r4, #1
 8001396:	b209      	sxth	r1, r1
 8001398:	f7ff f8a4 	bl	80004e4 <printf_>
 800139c:	2c04      	cmp	r4, #4
 800139e:	d1f5      	bne.n	800138c <sensor_test+0x5c>
 80013a0:	4824      	ldr	r0, [pc, #144]	; (8001434 <sensor_test+0x104>)
 80013a2:	f7ff f89f 	bl	80004e4 <printf_>
 80013a6:	2400      	movs	r4, #0
 80013a8:	1d23      	adds	r3, r4, #4
 80013aa:	4821      	ldr	r0, [pc, #132]	; (8001430 <sensor_test+0x100>)
 80013ac:	f835 1013 	ldrh.w	r1, [r5, r3, lsl #1]
 80013b0:	3401      	adds	r4, #1
 80013b2:	b209      	sxth	r1, r1
 80013b4:	f7ff f896 	bl	80004e4 <printf_>
 80013b8:	2c04      	cmp	r4, #4
 80013ba:	d1f5      	bne.n	80013a8 <sensor_test+0x78>
 80013bc:	481e      	ldr	r0, [pc, #120]	; (8001438 <sensor_test+0x108>)
 80013be:	f7ff f891 	bl	80004e4 <printf_>
 80013c2:	2400      	movs	r4, #0
 80013c4:	f104 0308 	add.w	r3, r4, #8
 80013c8:	4819      	ldr	r0, [pc, #100]	; (8001430 <sensor_test+0x100>)
 80013ca:	f835 1013 	ldrh.w	r1, [r5, r3, lsl #1]
 80013ce:	3401      	adds	r4, #1
 80013d0:	b209      	sxth	r1, r1
 80013d2:	f7ff f887 	bl	80004e4 <printf_>
 80013d6:	2c04      	cmp	r4, #4
 80013d8:	d1f4      	bne.n	80013c4 <sensor_test+0x94>
 80013da:	4818      	ldr	r0, [pc, #96]	; (800143c <sensor_test+0x10c>)
 80013dc:	f7ff f882 	bl	80004e4 <printf_>
 80013e0:	2400      	movs	r4, #0
 80013e2:	f104 030c 	add.w	r3, r4, #12
 80013e6:	4812      	ldr	r0, [pc, #72]	; (8001430 <sensor_test+0x100>)
 80013e8:	f835 1013 	ldrh.w	r1, [r5, r3, lsl #1]
 80013ec:	3401      	adds	r4, #1
 80013ee:	b209      	sxth	r1, r1
 80013f0:	f7ff f878 	bl	80004e4 <printf_>
 80013f4:	2c04      	cmp	r4, #4
 80013f6:	d1f4      	bne.n	80013e2 <sensor_test+0xb2>
 80013f8:	4811      	ldr	r0, [pc, #68]	; (8001440 <sensor_test+0x110>)
 80013fa:	f7ff f873 	bl	80004e4 <printf_>
 80013fe:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001402:	f000 ffb7 	bl	8002374 <led_off>
 8001406:	f44f 7096 	mov.w	r0, #300	; 0x12c
 800140a:	f000 fb97 	bl	8001b3c <timer_delay_ms>
 800140e:	e790      	b.n	8001332 <sensor_test+0x2>
 8001410:	20000168 	.word	0x20000168
 8001414:	08002612 	.word	0x08002612
 8001418:	0800261d 	.word	0x0800261d
 800141c:	08002629 	.word	0x08002629
 8001420:	0800265b 	.word	0x0800265b
 8001424:	08002632 	.word	0x08002632
 8001428:	08002642 	.word	0x08002642
 800142c:	20000188 	.word	0x20000188
 8001430:	08002647 	.word	0x08002647
 8001434:	0800264b 	.word	0x0800264b
 8001438:	08002650 	.word	0x08002650
 800143c:	08002655 	.word	0x08002655
 8001440:	0800265a 	.word	0x0800265a

08001444 <line_follower_test>:
 8001444:	b508      	push	{r3, lr}
 8001446:	ed2d 8b06 	vpush	{d8-d10}
 800144a:	eddf 8a2d 	vldr	s17, [pc, #180]	; 8001500 <line_follower_test+0xbc>
 800144e:	eeb0 9a68 	vmov.f32	s18, s17
 8001452:	eeb0 aa68 	vmov.f32	s20, s17
 8001456:	f7ff fd11 	bl	8000e7c <rgb_get_line_position>
 800145a:	4b2a      	ldr	r3, [pc, #168]	; (8001504 <line_follower_test+0xc0>)
 800145c:	ed93 8a00 	vldr	s16, [r3]
 8001460:	eddf 7a29 	vldr	s15, [pc, #164]	; 8001508 <line_follower_test+0xc4>
 8001464:	eeb8 8ac8 	vcvt.f32.s32	s16, s16
 8001468:	eddf 9a28 	vldr	s19, [pc, #160]	; 800150c <line_follower_test+0xc8>
 800146c:	ee88 8a27 	vdiv.f32	s16, s16, s15
 8001470:	ee3a 8a48 	vsub.f32	s16, s20, s16
 8001474:	eeb4 8ae9 	vcmpe.f32	s16, s19
 8001478:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800147c:	dc09      	bgt.n	8001492 <line_follower_test+0x4e>
 800147e:	eddf 7a24 	vldr	s15, [pc, #144]	; 8001510 <line_follower_test+0xcc>
 8001482:	eeb4 8a67 	vcmp.f32	s16, s15
 8001486:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800148a:	bf48      	it	mi
 800148c:	eeb0 8a67 	vmovmi.f32	s16, s15
 8001490:	e001      	b.n	8001496 <line_follower_test+0x52>
 8001492:	eeb0 8a69 	vmov.f32	s16, s19
 8001496:	eddf 7a1f 	vldr	s15, [pc, #124]	; 8001514 <line_follower_test+0xd0>
 800149a:	ee78 8a68 	vsub.f32	s17, s16, s17
 800149e:	ee18 0a10 	vmov	r0, s16
 80014a2:	ee68 8aa7 	vmul.f32	s17, s17, s15
 80014a6:	eddf 7a1c 	vldr	s15, [pc, #112]	; 8001518 <line_follower_test+0xd4>
 80014aa:	ee48 8a27 	vmla.f32	s17, s16, s15
 80014ae:	f7ff fa8d 	bl	80009cc <m_abs>
 80014b2:	ee07 0a90 	vmov	s15, r0
 80014b6:	ee79 9ae7 	vsub.f32	s19, s19, s15
 80014ba:	eddf 7a18 	vldr	s15, [pc, #96]	; 800151c <line_follower_test+0xd8>
 80014be:	ee69 7aa7 	vmul.f32	s15, s19, s15
 80014c2:	ee17 0a90 	vmov	r0, s15
 80014c6:	eddf 7a16 	vldr	s15, [pc, #88]	; 8001520 <line_follower_test+0xdc>
 80014ca:	ee79 7a27 	vadd.f32	s15, s18, s15
 80014ce:	ee17 1a90 	vmov	r1, s15
 80014d2:	f7ff fa87 	bl	80009e4 <m_min>
 80014d6:	ee09 0a10 	vmov	s18, r0
 80014da:	ee79 7a28 	vadd.f32	s15, s18, s17
 80014de:	ee79 8a68 	vsub.f32	s17, s18, s17
 80014e2:	4b10      	ldr	r3, [pc, #64]	; (8001524 <line_follower_test+0xe0>)
 80014e4:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 80014e8:	eefd 8ae8 	vcvt.s32.f32	s17, s17
 80014ec:	200a      	movs	r0, #10
 80014ee:	edc3 7a00 	vstr	s15, [r3]
 80014f2:	edc3 8a01 	vstr	s17, [r3, #4]
 80014f6:	f000 fb21 	bl	8001b3c <timer_delay_ms>
 80014fa:	eef0 8a48 	vmov.f32	s17, s16
 80014fe:	e7aa      	b.n	8001456 <line_follower_test+0x12>
 8001500:	00000000 	.word	0x00000000
 8001504:	200005c8 	.word	0x200005c8
 8001508:	428c0000 	.word	0x428c0000
 800150c:	3f800000 	.word	0x3f800000
 8001510:	bf800000 	.word	0xbf800000
 8001514:	42c80000 	.word	0x42c80000
 8001518:	42200000 	.word	0x42200000
 800151c:	42480000 	.word	0x42480000
 8001520:	3e4ccccd 	.word	0x3e4ccccd
 8001524:	200001c0 	.word	0x200001c0

08001528 <main_thread>:
 8001528:	b508      	push	{r3, lr}
 800152a:	4823      	ldr	r0, [pc, #140]	; (80015b8 <main_thread+0x90>)
 800152c:	f7fe ffda 	bl	80004e4 <printf_>
 8001530:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 8001534:	f000 fb02 	bl	8001b3c <timer_delay_ms>
 8001538:	f7ff fe28 	bl	800118c <device_wake_up>
 800153c:	491f      	ldr	r1, [pc, #124]	; (80015bc <main_thread+0x94>)
 800153e:	4820      	ldr	r0, [pc, #128]	; (80015c0 <main_thread+0x98>)
 8001540:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001544:	2306      	movs	r3, #6
 8001546:	f7fe fea1 	bl	800028c <create_thread>
 800154a:	491e      	ldr	r1, [pc, #120]	; (80015c4 <main_thread+0x9c>)
 800154c:	481e      	ldr	r0, [pc, #120]	; (80015c8 <main_thread+0xa0>)
 800154e:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001552:	2306      	movs	r3, #6
 8001554:	f7fe fe9a 	bl	800028c <create_thread>
 8001558:	491c      	ldr	r1, [pc, #112]	; (80015cc <main_thread+0xa4>)
 800155a:	481d      	ldr	r0, [pc, #116]	; (80015d0 <main_thread+0xa8>)
 800155c:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001560:	2306      	movs	r3, #6
 8001562:	f7fe fe93 	bl	800028c <create_thread>
 8001566:	20c8      	movs	r0, #200	; 0xc8
 8001568:	f000 fae8 	bl	8001b3c <timer_delay_ms>
 800156c:	f7ff fcbe 	bl	8000eec <rgb_set_background>
 8001570:	f000 ff74 	bl	800245c <get_key>
 8001574:	b980      	cbnz	r0, 8001598 <main_thread+0x70>
 8001576:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 800157a:	f000 fee5 	bl	8002348 <led_on>
 800157e:	2064      	movs	r0, #100	; 0x64
 8001580:	f000 fadc 	bl	8001b3c <timer_delay_ms>
 8001584:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001588:	f000 fef4 	bl	8002374 <led_off>
 800158c:	20c8      	movs	r0, #200	; 0xc8
 800158e:	f000 fad5 	bl	8001b3c <timer_delay_ms>
 8001592:	f7ff fdf5 	bl	8001180 <device_sleep>
 8001596:	e7eb      	b.n	8001570 <main_thread+0x48>
 8001598:	f7ff fdf8 	bl	800118c <device_wake_up>
 800159c:	20c8      	movs	r0, #200	; 0xc8
 800159e:	f000 facd 	bl	8001b3c <timer_delay_ms>
 80015a2:	f7ff fec5 	bl	8001330 <sensor_test>
 80015a6:	f7ff ff4d 	bl	8001444 <line_follower_test>
 80015aa:	f000 ff57 	bl	800245c <get_key>
 80015ae:	2800      	cmp	r0, #0
 80015b0:	d1de      	bne.n	8001570 <main_thread+0x48>
 80015b2:	f7ff fc63 	bl	8000e7c <rgb_get_line_position>
 80015b6:	e7f8      	b.n	80015aa <main_thread+0x82>
 80015b8:	08002667 	.word	0x08002667
 80015bc:	200007d4 	.word	0x200007d4
 80015c0:	080011f9 	.word	0x080011f9
 80015c4:	200005d4 	.word	0x200005d4
 80015c8:	08001199 	.word	0x08001199
 80015cc:	200009d4 	.word	0x200009d4
 80015d0:	08001265 	.word	0x08001265

080015d4 <main>:
 80015d4:	b508      	push	{r3, lr}
 80015d6:	f000 fe45 	bl	8002264 <lib_low_level_init>
 80015da:	f7fe fffd 	bl	80005d8 <lib_os_init>
 80015de:	4905      	ldr	r1, [pc, #20]	; (80015f4 <main+0x20>)
 80015e0:	4805      	ldr	r0, [pc, #20]	; (80015f8 <main+0x24>)
 80015e2:	f44f 7200 	mov.w	r2, #512	; 0x200
 80015e6:	2306      	movs	r3, #6
 80015e8:	f7fe fe50 	bl	800028c <create_thread>
 80015ec:	f7fe fe48 	bl	8000280 <kernel_start>
 80015f0:	2000      	movs	r0, #0
 80015f2:	bd08      	pop	{r3, pc}
 80015f4:	20000bd4 	.word	0x20000bd4
 80015f8:	08001529 	.word	0x08001529

080015fc <RCC_GetClocksFreq>:
 80015fc:	4ba5      	ldr	r3, [pc, #660]	; (8001894 <RCC_GetClocksFreq+0x298>)
 80015fe:	685a      	ldr	r2, [r3, #4]
 8001600:	f002 020c 	and.w	r2, r2, #12
 8001604:	2a04      	cmp	r2, #4
 8001606:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 800160a:	d005      	beq.n	8001618 <RCC_GetClocksFreq+0x1c>
 800160c:	2a08      	cmp	r2, #8
 800160e:	d006      	beq.n	800161e <RCC_GetClocksFreq+0x22>
 8001610:	4ba1      	ldr	r3, [pc, #644]	; (8001898 <RCC_GetClocksFreq+0x29c>)
 8001612:	6003      	str	r3, [r0, #0]
 8001614:	b9ba      	cbnz	r2, 8001646 <RCC_GetClocksFreq+0x4a>
 8001616:	e017      	b.n	8001648 <RCC_GetClocksFreq+0x4c>
 8001618:	4b9f      	ldr	r3, [pc, #636]	; (8001898 <RCC_GetClocksFreq+0x29c>)
 800161a:	6003      	str	r3, [r0, #0]
 800161c:	e013      	b.n	8001646 <RCC_GetClocksFreq+0x4a>
 800161e:	6859      	ldr	r1, [r3, #4]
 8001620:	685c      	ldr	r4, [r3, #4]
 8001622:	f3c1 4183 	ubfx	r1, r1, #18, #4
 8001626:	03e2      	lsls	r2, r4, #15
 8001628:	f101 0102 	add.w	r1, r1, #2
 800162c:	d401      	bmi.n	8001632 <RCC_GetClocksFreq+0x36>
 800162e:	4a9b      	ldr	r2, [pc, #620]	; (800189c <RCC_GetClocksFreq+0x2a0>)
 8001630:	e006      	b.n	8001640 <RCC_GetClocksFreq+0x44>
 8001632:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001634:	4b98      	ldr	r3, [pc, #608]	; (8001898 <RCC_GetClocksFreq+0x29c>)
 8001636:	f002 020f 	and.w	r2, r2, #15
 800163a:	3201      	adds	r2, #1
 800163c:	fbb3 f2f2 	udiv	r2, r3, r2
 8001640:	434a      	muls	r2, r1
 8001642:	6002      	str	r2, [r0, #0]
 8001644:	e000      	b.n	8001648 <RCC_GetClocksFreq+0x4c>
 8001646:	2200      	movs	r2, #0
 8001648:	4f92      	ldr	r7, [pc, #584]	; (8001894 <RCC_GetClocksFreq+0x298>)
 800164a:	4d95      	ldr	r5, [pc, #596]	; (80018a0 <RCC_GetClocksFreq+0x2a4>)
 800164c:	687b      	ldr	r3, [r7, #4]
 800164e:	f8df 8254 	ldr.w	r8, [pc, #596]	; 80018a4 <RCC_GetClocksFreq+0x2a8>
 8001652:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8001656:	5cec      	ldrb	r4, [r5, r3]
 8001658:	6803      	ldr	r3, [r0, #0]
 800165a:	b2e4      	uxtb	r4, r4
 800165c:	fa23 f104 	lsr.w	r1, r3, r4
 8001660:	6041      	str	r1, [r0, #4]
 8001662:	687e      	ldr	r6, [r7, #4]
 8001664:	f3c6 2602 	ubfx	r6, r6, #8, #3
 8001668:	5dae      	ldrb	r6, [r5, r6]
 800166a:	fa21 f606 	lsr.w	r6, r1, r6
 800166e:	6086      	str	r6, [r0, #8]
 8001670:	f8d7 c004 	ldr.w	ip, [r7, #4]
 8001674:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8001678:	f815 500c 	ldrb.w	r5, [r5, ip]
 800167c:	b2ed      	uxtb	r5, r5
 800167e:	40e9      	lsrs	r1, r5
 8001680:	60c1      	str	r1, [r0, #12]
 8001682:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 8001686:	f3c9 1904 	ubfx	r9, r9, #4, #5
 800168a:	f009 0c0f 	and.w	ip, r9, #15
 800168e:	f019 0f10 	tst.w	r9, #16
 8001692:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 8001696:	fa1f fc8c 	uxth.w	ip, ip
 800169a:	d007      	beq.n	80016ac <RCC_GetClocksFreq+0xb0>
 800169c:	f1bc 0f00 	cmp.w	ip, #0
 80016a0:	d004      	beq.n	80016ac <RCC_GetClocksFreq+0xb0>
 80016a2:	fbb2 fcfc 	udiv	ip, r2, ip
 80016a6:	f8c0 c010 	str.w	ip, [r0, #16]
 80016aa:	e000      	b.n	80016ae <RCC_GetClocksFreq+0xb2>
 80016ac:	6103      	str	r3, [r0, #16]
 80016ae:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 80016b0:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 80016b4:	f00c 070f 	and.w	r7, ip, #15
 80016b8:	f01c 0f10 	tst.w	ip, #16
 80016bc:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 80016c0:	b2bf      	uxth	r7, r7
 80016c2:	d004      	beq.n	80016ce <RCC_GetClocksFreq+0xd2>
 80016c4:	b11f      	cbz	r7, 80016ce <RCC_GetClocksFreq+0xd2>
 80016c6:	fbb2 f7f7 	udiv	r7, r2, r7
 80016ca:	6147      	str	r7, [r0, #20]
 80016cc:	e000      	b.n	80016d0 <RCC_GetClocksFreq+0xd4>
 80016ce:	6143      	str	r3, [r0, #20]
 80016d0:	4f70      	ldr	r7, [pc, #448]	; (8001894 <RCC_GetClocksFreq+0x298>)
 80016d2:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80016d6:	f01c 0f10 	tst.w	ip, #16
 80016da:	bf0a      	itet	eq
 80016dc:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 8001898 <RCC_GetClocksFreq+0x29c>
 80016e0:	6183      	strne	r3, [r0, #24]
 80016e2:	f8c0 c018 	streq.w	ip, [r0, #24]
 80016e6:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80016e8:	06bf      	lsls	r7, r7, #26
 80016ea:	bf56      	itet	pl
 80016ec:	4f6a      	ldrpl	r7, [pc, #424]	; (8001898 <RCC_GetClocksFreq+0x29c>)
 80016ee:	61c3      	strmi	r3, [r0, #28]
 80016f0:	61c7      	strpl	r7, [r0, #28]
 80016f2:	4f68      	ldr	r7, [pc, #416]	; (8001894 <RCC_GetClocksFreq+0x298>)
 80016f4:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80016f8:	f01c 0f40 	tst.w	ip, #64	; 0x40
 80016fc:	bf0a      	itet	eq
 80016fe:	f8df c198 	ldreq.w	ip, [pc, #408]	; 8001898 <RCC_GetClocksFreq+0x29c>
 8001702:	6203      	strne	r3, [r0, #32]
 8001704:	f8c0 c020 	streq.w	ip, [r0, #32]
 8001708:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 800170a:	05ff      	lsls	r7, r7, #23
 800170c:	d506      	bpl.n	800171c <RCC_GetClocksFreq+0x120>
 800170e:	4293      	cmp	r3, r2
 8001710:	d104      	bne.n	800171c <RCC_GetClocksFreq+0x120>
 8001712:	42a5      	cmp	r5, r4
 8001714:	d102      	bne.n	800171c <RCC_GetClocksFreq+0x120>
 8001716:	005f      	lsls	r7, r3, #1
 8001718:	6247      	str	r7, [r0, #36]	; 0x24
 800171a:	e000      	b.n	800171e <RCC_GetClocksFreq+0x122>
 800171c:	6241      	str	r1, [r0, #36]	; 0x24
 800171e:	4f5d      	ldr	r7, [pc, #372]	; (8001894 <RCC_GetClocksFreq+0x298>)
 8001720:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001724:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 8001728:	d008      	beq.n	800173c <RCC_GetClocksFreq+0x140>
 800172a:	4293      	cmp	r3, r2
 800172c:	d106      	bne.n	800173c <RCC_GetClocksFreq+0x140>
 800172e:	42a5      	cmp	r5, r4
 8001730:	d104      	bne.n	800173c <RCC_GetClocksFreq+0x140>
 8001732:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001736:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 800173a:	e000      	b.n	800173e <RCC_GetClocksFreq+0x142>
 800173c:	6281      	str	r1, [r0, #40]	; 0x28
 800173e:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001740:	05bf      	lsls	r7, r7, #22
 8001742:	d506      	bpl.n	8001752 <RCC_GetClocksFreq+0x156>
 8001744:	4293      	cmp	r3, r2
 8001746:	d104      	bne.n	8001752 <RCC_GetClocksFreq+0x156>
 8001748:	42a5      	cmp	r5, r4
 800174a:	d102      	bne.n	8001752 <RCC_GetClocksFreq+0x156>
 800174c:	005f      	lsls	r7, r3, #1
 800174e:	62c7      	str	r7, [r0, #44]	; 0x2c
 8001750:	e000      	b.n	8001754 <RCC_GetClocksFreq+0x158>
 8001752:	62c1      	str	r1, [r0, #44]	; 0x2c
 8001754:	4f4f      	ldr	r7, [pc, #316]	; (8001894 <RCC_GetClocksFreq+0x298>)
 8001756:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800175a:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 800175e:	d008      	beq.n	8001772 <RCC_GetClocksFreq+0x176>
 8001760:	4293      	cmp	r3, r2
 8001762:	d106      	bne.n	8001772 <RCC_GetClocksFreq+0x176>
 8001764:	42a5      	cmp	r5, r4
 8001766:	d104      	bne.n	8001772 <RCC_GetClocksFreq+0x176>
 8001768:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 800176c:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8001770:	e000      	b.n	8001774 <RCC_GetClocksFreq+0x178>
 8001772:	64c1      	str	r1, [r0, #76]	; 0x4c
 8001774:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001776:	053f      	lsls	r7, r7, #20
 8001778:	d506      	bpl.n	8001788 <RCC_GetClocksFreq+0x18c>
 800177a:	4293      	cmp	r3, r2
 800177c:	d104      	bne.n	8001788 <RCC_GetClocksFreq+0x18c>
 800177e:	42a5      	cmp	r5, r4
 8001780:	d102      	bne.n	8001788 <RCC_GetClocksFreq+0x18c>
 8001782:	005f      	lsls	r7, r3, #1
 8001784:	6507      	str	r7, [r0, #80]	; 0x50
 8001786:	e000      	b.n	800178a <RCC_GetClocksFreq+0x18e>
 8001788:	6501      	str	r1, [r0, #80]	; 0x50
 800178a:	4f42      	ldr	r7, [pc, #264]	; (8001894 <RCC_GetClocksFreq+0x298>)
 800178c:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001790:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 8001794:	d008      	beq.n	80017a8 <RCC_GetClocksFreq+0x1ac>
 8001796:	4293      	cmp	r3, r2
 8001798:	d106      	bne.n	80017a8 <RCC_GetClocksFreq+0x1ac>
 800179a:	42a5      	cmp	r5, r4
 800179c:	d104      	bne.n	80017a8 <RCC_GetClocksFreq+0x1ac>
 800179e:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 80017a2:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 80017a6:	e000      	b.n	80017aa <RCC_GetClocksFreq+0x1ae>
 80017a8:	6501      	str	r1, [r0, #80]	; 0x50
 80017aa:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80017ac:	043f      	lsls	r7, r7, #16
 80017ae:	d506      	bpl.n	80017be <RCC_GetClocksFreq+0x1c2>
 80017b0:	4293      	cmp	r3, r2
 80017b2:	d104      	bne.n	80017be <RCC_GetClocksFreq+0x1c2>
 80017b4:	42a5      	cmp	r5, r4
 80017b6:	d102      	bne.n	80017be <RCC_GetClocksFreq+0x1c2>
 80017b8:	005a      	lsls	r2, r3, #1
 80017ba:	6582      	str	r2, [r0, #88]	; 0x58
 80017bc:	e000      	b.n	80017c0 <RCC_GetClocksFreq+0x1c4>
 80017be:	6581      	str	r1, [r0, #88]	; 0x58
 80017c0:	4a34      	ldr	r2, [pc, #208]	; (8001894 <RCC_GetClocksFreq+0x298>)
 80017c2:	6b14      	ldr	r4, [r2, #48]	; 0x30
 80017c4:	07a4      	lsls	r4, r4, #30
 80017c6:	d014      	beq.n	80017f2 <RCC_GetClocksFreq+0x1f6>
 80017c8:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80017ca:	f001 0103 	and.w	r1, r1, #3
 80017ce:	2901      	cmp	r1, #1
 80017d0:	d101      	bne.n	80017d6 <RCC_GetClocksFreq+0x1da>
 80017d2:	6383      	str	r3, [r0, #56]	; 0x38
 80017d4:	e00e      	b.n	80017f4 <RCC_GetClocksFreq+0x1f8>
 80017d6:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80017d8:	f001 0103 	and.w	r1, r1, #3
 80017dc:	2902      	cmp	r1, #2
 80017de:	d102      	bne.n	80017e6 <RCC_GetClocksFreq+0x1ea>
 80017e0:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80017e4:	e005      	b.n	80017f2 <RCC_GetClocksFreq+0x1f6>
 80017e6:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80017e8:	f001 0103 	and.w	r1, r1, #3
 80017ec:	2903      	cmp	r1, #3
 80017ee:	d101      	bne.n	80017f4 <RCC_GetClocksFreq+0x1f8>
 80017f0:	4929      	ldr	r1, [pc, #164]	; (8001898 <RCC_GetClocksFreq+0x29c>)
 80017f2:	6381      	str	r1, [r0, #56]	; 0x38
 80017f4:	6b12      	ldr	r2, [r2, #48]	; 0x30
 80017f6:	4927      	ldr	r1, [pc, #156]	; (8001894 <RCC_GetClocksFreq+0x298>)
 80017f8:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 80017fc:	d101      	bne.n	8001802 <RCC_GetClocksFreq+0x206>
 80017fe:	63c6      	str	r6, [r0, #60]	; 0x3c
 8001800:	e018      	b.n	8001834 <RCC_GetClocksFreq+0x238>
 8001802:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001804:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001808:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 800180c:	d101      	bne.n	8001812 <RCC_GetClocksFreq+0x216>
 800180e:	63c3      	str	r3, [r0, #60]	; 0x3c
 8001810:	e010      	b.n	8001834 <RCC_GetClocksFreq+0x238>
 8001812:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001814:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001818:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 800181c:	d102      	bne.n	8001824 <RCC_GetClocksFreq+0x228>
 800181e:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001822:	e006      	b.n	8001832 <RCC_GetClocksFreq+0x236>
 8001824:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001826:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 800182a:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 800182e:	d101      	bne.n	8001834 <RCC_GetClocksFreq+0x238>
 8001830:	4a19      	ldr	r2, [pc, #100]	; (8001898 <RCC_GetClocksFreq+0x29c>)
 8001832:	63c2      	str	r2, [r0, #60]	; 0x3c
 8001834:	4a17      	ldr	r2, [pc, #92]	; (8001894 <RCC_GetClocksFreq+0x298>)
 8001836:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001838:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 800183c:	d101      	bne.n	8001842 <RCC_GetClocksFreq+0x246>
 800183e:	6406      	str	r6, [r0, #64]	; 0x40
 8001840:	e018      	b.n	8001874 <RCC_GetClocksFreq+0x278>
 8001842:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001844:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001848:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 800184c:	d101      	bne.n	8001852 <RCC_GetClocksFreq+0x256>
 800184e:	6403      	str	r3, [r0, #64]	; 0x40
 8001850:	e010      	b.n	8001874 <RCC_GetClocksFreq+0x278>
 8001852:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001854:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001858:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 800185c:	d102      	bne.n	8001864 <RCC_GetClocksFreq+0x268>
 800185e:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001862:	e006      	b.n	8001872 <RCC_GetClocksFreq+0x276>
 8001864:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001866:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 800186a:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 800186e:	d101      	bne.n	8001874 <RCC_GetClocksFreq+0x278>
 8001870:	4909      	ldr	r1, [pc, #36]	; (8001898 <RCC_GetClocksFreq+0x29c>)
 8001872:	6401      	str	r1, [r0, #64]	; 0x40
 8001874:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001876:	4907      	ldr	r1, [pc, #28]	; (8001894 <RCC_GetClocksFreq+0x298>)
 8001878:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 800187c:	d101      	bne.n	8001882 <RCC_GetClocksFreq+0x286>
 800187e:	6446      	str	r6, [r0, #68]	; 0x44
 8001880:	e023      	b.n	80018ca <RCC_GetClocksFreq+0x2ce>
 8001882:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001884:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001888:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 800188c:	d10c      	bne.n	80018a8 <RCC_GetClocksFreq+0x2ac>
 800188e:	6443      	str	r3, [r0, #68]	; 0x44
 8001890:	e01b      	b.n	80018ca <RCC_GetClocksFreq+0x2ce>
 8001892:	bf00      	nop
 8001894:	40021000 	.word	0x40021000
 8001898:	007a1200 	.word	0x007a1200
 800189c:	003d0900 	.word	0x003d0900
 80018a0:	20000020 	.word	0x20000020
 80018a4:	20000000 	.word	0x20000000
 80018a8:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80018aa:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80018ae:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 80018b2:	d102      	bne.n	80018ba <RCC_GetClocksFreq+0x2be>
 80018b4:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80018b8:	e006      	b.n	80018c8 <RCC_GetClocksFreq+0x2cc>
 80018ba:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80018bc:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80018c0:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 80018c4:	d101      	bne.n	80018ca <RCC_GetClocksFreq+0x2ce>
 80018c6:	4a11      	ldr	r2, [pc, #68]	; (800190c <RCC_GetClocksFreq+0x310>)
 80018c8:	6442      	str	r2, [r0, #68]	; 0x44
 80018ca:	4a11      	ldr	r2, [pc, #68]	; (8001910 <RCC_GetClocksFreq+0x314>)
 80018cc:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80018ce:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 80018d2:	d102      	bne.n	80018da <RCC_GetClocksFreq+0x2de>
 80018d4:	6486      	str	r6, [r0, #72]	; 0x48
 80018d6:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80018da:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80018dc:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 80018e0:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 80018e4:	d00f      	beq.n	8001906 <RCC_GetClocksFreq+0x30a>
 80018e6:	6b13      	ldr	r3, [r2, #48]	; 0x30
 80018e8:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80018ec:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 80018f0:	d102      	bne.n	80018f8 <RCC_GetClocksFreq+0x2fc>
 80018f2:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80018f6:	e006      	b.n	8001906 <RCC_GetClocksFreq+0x30a>
 80018f8:	6b13      	ldr	r3, [r2, #48]	; 0x30
 80018fa:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80018fe:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8001902:	d101      	bne.n	8001908 <RCC_GetClocksFreq+0x30c>
 8001904:	4b01      	ldr	r3, [pc, #4]	; (800190c <RCC_GetClocksFreq+0x310>)
 8001906:	6483      	str	r3, [r0, #72]	; 0x48
 8001908:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800190c:	007a1200 	.word	0x007a1200
 8001910:	40021000 	.word	0x40021000

08001914 <RCC_AHBPeriphClockCmd>:
 8001914:	bf00      	nop
 8001916:	bf00      	nop
 8001918:	4b04      	ldr	r3, [pc, #16]	; (800192c <RCC_AHBPeriphClockCmd+0x18>)
 800191a:	695a      	ldr	r2, [r3, #20]
 800191c:	b109      	cbz	r1, 8001922 <RCC_AHBPeriphClockCmd+0xe>
 800191e:	4310      	orrs	r0, r2
 8001920:	e001      	b.n	8001926 <RCC_AHBPeriphClockCmd+0x12>
 8001922:	ea22 0000 	bic.w	r0, r2, r0
 8001926:	6158      	str	r0, [r3, #20]
 8001928:	4770      	bx	lr
 800192a:	bf00      	nop
 800192c:	40021000 	.word	0x40021000

08001930 <RCC_APB2PeriphClockCmd>:
 8001930:	bf00      	nop
 8001932:	bf00      	nop
 8001934:	4b04      	ldr	r3, [pc, #16]	; (8001948 <RCC_APB2PeriphClockCmd+0x18>)
 8001936:	699a      	ldr	r2, [r3, #24]
 8001938:	b109      	cbz	r1, 800193e <RCC_APB2PeriphClockCmd+0xe>
 800193a:	4310      	orrs	r0, r2
 800193c:	e001      	b.n	8001942 <RCC_APB2PeriphClockCmd+0x12>
 800193e:	ea22 0000 	bic.w	r0, r2, r0
 8001942:	6198      	str	r0, [r3, #24]
 8001944:	4770      	bx	lr
 8001946:	bf00      	nop
 8001948:	40021000 	.word	0x40021000

0800194c <RCC_APB1PeriphClockCmd>:
 800194c:	bf00      	nop
 800194e:	bf00      	nop
 8001950:	4b04      	ldr	r3, [pc, #16]	; (8001964 <RCC_APB1PeriphClockCmd+0x18>)
 8001952:	69da      	ldr	r2, [r3, #28]
 8001954:	b109      	cbz	r1, 800195a <RCC_APB1PeriphClockCmd+0xe>
 8001956:	4310      	orrs	r0, r2
 8001958:	e001      	b.n	800195e <RCC_APB1PeriphClockCmd+0x12>
 800195a:	ea22 0000 	bic.w	r0, r2, r0
 800195e:	61d8      	str	r0, [r3, #28]
 8001960:	4770      	bx	lr
 8001962:	bf00      	nop
 8001964:	40021000 	.word	0x40021000

08001968 <TIM_TimeBaseInit>:
 8001968:	bf00      	nop
 800196a:	bf00      	nop
 800196c:	bf00      	nop
 800196e:	4a24      	ldr	r2, [pc, #144]	; (8001a00 <TIM_TimeBaseInit+0x98>)
 8001970:	8803      	ldrh	r3, [r0, #0]
 8001972:	4290      	cmp	r0, r2
 8001974:	b29b      	uxth	r3, r3
 8001976:	d012      	beq.n	800199e <TIM_TimeBaseInit+0x36>
 8001978:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 800197c:	4290      	cmp	r0, r2
 800197e:	d00e      	beq.n	800199e <TIM_TimeBaseInit+0x36>
 8001980:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001984:	d00b      	beq.n	800199e <TIM_TimeBaseInit+0x36>
 8001986:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 800198a:	4290      	cmp	r0, r2
 800198c:	d007      	beq.n	800199e <TIM_TimeBaseInit+0x36>
 800198e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001992:	4290      	cmp	r0, r2
 8001994:	d003      	beq.n	800199e <TIM_TimeBaseInit+0x36>
 8001996:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 800199a:	4290      	cmp	r0, r2
 800199c:	d103      	bne.n	80019a6 <TIM_TimeBaseInit+0x3e>
 800199e:	884a      	ldrh	r2, [r1, #2]
 80019a0:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 80019a4:	4313      	orrs	r3, r2
 80019a6:	4a17      	ldr	r2, [pc, #92]	; (8001a04 <TIM_TimeBaseInit+0x9c>)
 80019a8:	4290      	cmp	r0, r2
 80019aa:	d008      	beq.n	80019be <TIM_TimeBaseInit+0x56>
 80019ac:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80019b0:	4290      	cmp	r0, r2
 80019b2:	d004      	beq.n	80019be <TIM_TimeBaseInit+0x56>
 80019b4:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 80019b8:	890a      	ldrh	r2, [r1, #8]
 80019ba:	b29b      	uxth	r3, r3
 80019bc:	4313      	orrs	r3, r2
 80019be:	8003      	strh	r3, [r0, #0]
 80019c0:	684b      	ldr	r3, [r1, #4]
 80019c2:	62c3      	str	r3, [r0, #44]	; 0x2c
 80019c4:	880b      	ldrh	r3, [r1, #0]
 80019c6:	8503      	strh	r3, [r0, #40]	; 0x28
 80019c8:	4b0d      	ldr	r3, [pc, #52]	; (8001a00 <TIM_TimeBaseInit+0x98>)
 80019ca:	4298      	cmp	r0, r3
 80019cc:	d013      	beq.n	80019f6 <TIM_TimeBaseInit+0x8e>
 80019ce:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80019d2:	4298      	cmp	r0, r3
 80019d4:	d00f      	beq.n	80019f6 <TIM_TimeBaseInit+0x8e>
 80019d6:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 80019da:	4298      	cmp	r0, r3
 80019dc:	d00b      	beq.n	80019f6 <TIM_TimeBaseInit+0x8e>
 80019de:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80019e2:	4298      	cmp	r0, r3
 80019e4:	d007      	beq.n	80019f6 <TIM_TimeBaseInit+0x8e>
 80019e6:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80019ea:	4298      	cmp	r0, r3
 80019ec:	d003      	beq.n	80019f6 <TIM_TimeBaseInit+0x8e>
 80019ee:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80019f2:	4298      	cmp	r0, r3
 80019f4:	d101      	bne.n	80019fa <TIM_TimeBaseInit+0x92>
 80019f6:	894b      	ldrh	r3, [r1, #10]
 80019f8:	8603      	strh	r3, [r0, #48]	; 0x30
 80019fa:	2301      	movs	r3, #1
 80019fc:	6143      	str	r3, [r0, #20]
 80019fe:	4770      	bx	lr
 8001a00:	40012c00 	.word	0x40012c00
 8001a04:	40001000 	.word	0x40001000

08001a08 <TIM_Cmd>:
 8001a08:	bf00      	nop
 8001a0a:	bf00      	nop
 8001a0c:	8803      	ldrh	r3, [r0, #0]
 8001a0e:	b119      	cbz	r1, 8001a18 <TIM_Cmd+0x10>
 8001a10:	b29b      	uxth	r3, r3
 8001a12:	f043 0301 	orr.w	r3, r3, #1
 8001a16:	e003      	b.n	8001a20 <TIM_Cmd+0x18>
 8001a18:	f023 0301 	bic.w	r3, r3, #1
 8001a1c:	041b      	lsls	r3, r3, #16
 8001a1e:	0c1b      	lsrs	r3, r3, #16
 8001a20:	8003      	strh	r3, [r0, #0]
 8001a22:	4770      	bx	lr

08001a24 <TIM_ClearITPendingBit>:
 8001a24:	bf00      	nop
 8001a26:	43c9      	mvns	r1, r1
 8001a28:	b289      	uxth	r1, r1
 8001a2a:	6101      	str	r1, [r0, #16]
 8001a2c:	4770      	bx	lr
	...

08001a30 <timer_init>:
 8001a30:	b530      	push	{r4, r5, lr}
 8001a32:	2300      	movs	r3, #0
 8001a34:	b085      	sub	sp, #20
 8001a36:	491f      	ldr	r1, [pc, #124]	; (8001ab4 <timer_init+0x84>)
 8001a38:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001a3c:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001a40:	491d      	ldr	r1, [pc, #116]	; (8001ab8 <timer_init+0x88>)
 8001a42:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001a46:	4a1d      	ldr	r2, [pc, #116]	; (8001abc <timer_init+0x8c>)
 8001a48:	2400      	movs	r4, #0
 8001a4a:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8001a4e:	3301      	adds	r3, #1
 8001a50:	2b04      	cmp	r3, #4
 8001a52:	4625      	mov	r5, r4
 8001a54:	d1ef      	bne.n	8001a36 <timer_init+0x6>
 8001a56:	4b1a      	ldr	r3, [pc, #104]	; (8001ac0 <timer_init+0x90>)
 8001a58:	2002      	movs	r0, #2
 8001a5a:	2101      	movs	r1, #1
 8001a5c:	601c      	str	r4, [r3, #0]
 8001a5e:	f7ff ff75 	bl	800194c <RCC_APB1PeriphClockCmd>
 8001a62:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001a66:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001a6a:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001a6e:	4c15      	ldr	r4, [pc, #84]	; (8001ac4 <timer_init+0x94>)
 8001a70:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001a74:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001a78:	4620      	mov	r0, r4
 8001a7a:	2331      	movs	r3, #49	; 0x31
 8001a7c:	a901      	add	r1, sp, #4
 8001a7e:	9302      	str	r3, [sp, #8]
 8001a80:	f7ff ff72 	bl	8001968 <TIM_TimeBaseInit>
 8001a84:	4620      	mov	r0, r4
 8001a86:	2101      	movs	r1, #1
 8001a88:	f7ff ffbe 	bl	8001a08 <TIM_Cmd>
 8001a8c:	68e3      	ldr	r3, [r4, #12]
 8001a8e:	f043 0301 	orr.w	r3, r3, #1
 8001a92:	60e3      	str	r3, [r4, #12]
 8001a94:	231d      	movs	r3, #29
 8001a96:	f88d 3000 	strb.w	r3, [sp]
 8001a9a:	4668      	mov	r0, sp
 8001a9c:	2301      	movs	r3, #1
 8001a9e:	f88d 5001 	strb.w	r5, [sp, #1]
 8001aa2:	f88d 3002 	strb.w	r3, [sp, #2]
 8001aa6:	f88d 3003 	strb.w	r3, [sp, #3]
 8001aaa:	f000 fba3 	bl	80021f4 <NVIC_Init>
 8001aae:	b005      	add	sp, #20
 8001ab0:	bd30      	pop	{r4, r5, pc}
 8001ab2:	bf00      	nop
 8001ab4:	20000de8 	.word	0x20000de8
 8001ab8:	20000ddc 	.word	0x20000ddc
 8001abc:	20000dd4 	.word	0x20000dd4
 8001ac0:	20000de4 	.word	0x20000de4
 8001ac4:	40000400 	.word	0x40000400

08001ac8 <TIM3_IRQHandler>:
 8001ac8:	2300      	movs	r3, #0
 8001aca:	4a10      	ldr	r2, [pc, #64]	; (8001b0c <TIM3_IRQHandler+0x44>)
 8001acc:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001ad0:	b289      	uxth	r1, r1
 8001ad2:	b129      	cbz	r1, 8001ae0 <TIM3_IRQHandler+0x18>
 8001ad4:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001ad8:	b289      	uxth	r1, r1
 8001ada:	3901      	subs	r1, #1
 8001adc:	b289      	uxth	r1, r1
 8001ade:	e007      	b.n	8001af0 <TIM3_IRQHandler+0x28>
 8001ae0:	490b      	ldr	r1, [pc, #44]	; (8001b10 <TIM3_IRQHandler+0x48>)
 8001ae2:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001ae6:	b289      	uxth	r1, r1
 8001ae8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001aec:	4a09      	ldr	r2, [pc, #36]	; (8001b14 <TIM3_IRQHandler+0x4c>)
 8001aee:	2101      	movs	r1, #1
 8001af0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001af4:	3301      	adds	r3, #1
 8001af6:	2b04      	cmp	r3, #4
 8001af8:	d1e7      	bne.n	8001aca <TIM3_IRQHandler+0x2>
 8001afa:	4b07      	ldr	r3, [pc, #28]	; (8001b18 <TIM3_IRQHandler+0x50>)
 8001afc:	4807      	ldr	r0, [pc, #28]	; (8001b1c <TIM3_IRQHandler+0x54>)
 8001afe:	681a      	ldr	r2, [r3, #0]
 8001b00:	2101      	movs	r1, #1
 8001b02:	3201      	adds	r2, #1
 8001b04:	601a      	str	r2, [r3, #0]
 8001b06:	f7ff bf8d 	b.w	8001a24 <TIM_ClearITPendingBit>
 8001b0a:	bf00      	nop
 8001b0c:	20000de8 	.word	0x20000de8
 8001b10:	20000ddc 	.word	0x20000ddc
 8001b14:	20000dd4 	.word	0x20000dd4
 8001b18:	20000de4 	.word	0x20000de4
 8001b1c:	40000400 	.word	0x40000400

08001b20 <timer_get_time>:
 8001b20:	b082      	sub	sp, #8
 8001b22:	b672      	cpsid	i
 8001b24:	4b04      	ldr	r3, [pc, #16]	; (8001b38 <timer_get_time+0x18>)
 8001b26:	681b      	ldr	r3, [r3, #0]
 8001b28:	9301      	str	r3, [sp, #4]
 8001b2a:	b662      	cpsie	i
 8001b2c:	9801      	ldr	r0, [sp, #4]
 8001b2e:	230a      	movs	r3, #10
 8001b30:	fbb0 f0f3 	udiv	r0, r0, r3
 8001b34:	b002      	add	sp, #8
 8001b36:	4770      	bx	lr
 8001b38:	20000de4 	.word	0x20000de4

08001b3c <timer_delay_ms>:
 8001b3c:	b513      	push	{r0, r1, r4, lr}
 8001b3e:	4604      	mov	r4, r0
 8001b40:	f7ff ffee 	bl	8001b20 <timer_get_time>
 8001b44:	4420      	add	r0, r4
 8001b46:	9001      	str	r0, [sp, #4]
 8001b48:	9c01      	ldr	r4, [sp, #4]
 8001b4a:	f7ff ffe9 	bl	8001b20 <timer_get_time>
 8001b4e:	4284      	cmp	r4, r0
 8001b50:	d902      	bls.n	8001b58 <timer_delay_ms+0x1c>
 8001b52:	f000 fb4b 	bl	80021ec <sleep>
 8001b56:	e7f7      	b.n	8001b48 <timer_delay_ms+0xc>
 8001b58:	b002      	add	sp, #8
 8001b5a:	bd10      	pop	{r4, pc}

08001b5c <event_timer_set_period>:
 8001b5c:	b672      	cpsid	i
 8001b5e:	230a      	movs	r3, #10
 8001b60:	4359      	muls	r1, r3
 8001b62:	4b06      	ldr	r3, [pc, #24]	; (8001b7c <event_timer_set_period+0x20>)
 8001b64:	b289      	uxth	r1, r1
 8001b66:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001b6a:	4b05      	ldr	r3, [pc, #20]	; (8001b80 <event_timer_set_period+0x24>)
 8001b6c:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001b70:	4b04      	ldr	r3, [pc, #16]	; (8001b84 <event_timer_set_period+0x28>)
 8001b72:	2200      	movs	r2, #0
 8001b74:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 8001b78:	b662      	cpsie	i
 8001b7a:	4770      	bx	lr
 8001b7c:	20000de8 	.word	0x20000de8
 8001b80:	20000ddc 	.word	0x20000ddc
 8001b84:	20000dd4 	.word	0x20000dd4

08001b88 <event_timer_wait>:
 8001b88:	b510      	push	{r4, lr}
 8001b8a:	4604      	mov	r4, r0
 8001b8c:	4b06      	ldr	r3, [pc, #24]	; (8001ba8 <event_timer_wait+0x20>)
 8001b8e:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 8001b92:	b292      	uxth	r2, r2
 8001b94:	b912      	cbnz	r2, 8001b9c <event_timer_wait+0x14>
 8001b96:	f000 fb29 	bl	80021ec <sleep>
 8001b9a:	e7f7      	b.n	8001b8c <event_timer_wait+0x4>
 8001b9c:	b672      	cpsid	i
 8001b9e:	2200      	movs	r2, #0
 8001ba0:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 8001ba4:	b662      	cpsie	i
 8001ba6:	bd10      	pop	{r4, pc}
 8001ba8:	20000dd4 	.word	0x20000dd4

08001bac <USART_Init>:
 8001bac:	b530      	push	{r4, r5, lr}
 8001bae:	4604      	mov	r4, r0
 8001bb0:	b099      	sub	sp, #100	; 0x64
 8001bb2:	460d      	mov	r5, r1
 8001bb4:	bf00      	nop
 8001bb6:	bf00      	nop
 8001bb8:	bf00      	nop
 8001bba:	bf00      	nop
 8001bbc:	bf00      	nop
 8001bbe:	bf00      	nop
 8001bc0:	bf00      	nop
 8001bc2:	6803      	ldr	r3, [r0, #0]
 8001bc4:	f023 0301 	bic.w	r3, r3, #1
 8001bc8:	6003      	str	r3, [r0, #0]
 8001bca:	6842      	ldr	r2, [r0, #4]
 8001bcc:	688b      	ldr	r3, [r1, #8]
 8001bce:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 8001bd2:	4313      	orrs	r3, r2
 8001bd4:	6043      	str	r3, [r0, #4]
 8001bd6:	686a      	ldr	r2, [r5, #4]
 8001bd8:	68eb      	ldr	r3, [r5, #12]
 8001bda:	6801      	ldr	r1, [r0, #0]
 8001bdc:	431a      	orrs	r2, r3
 8001bde:	692b      	ldr	r3, [r5, #16]
 8001be0:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 8001be4:	f021 010c 	bic.w	r1, r1, #12
 8001be8:	4313      	orrs	r3, r2
 8001bea:	430b      	orrs	r3, r1
 8001bec:	6003      	str	r3, [r0, #0]
 8001bee:	6882      	ldr	r2, [r0, #8]
 8001bf0:	696b      	ldr	r3, [r5, #20]
 8001bf2:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 8001bf6:	4313      	orrs	r3, r2
 8001bf8:	6083      	str	r3, [r0, #8]
 8001bfa:	a801      	add	r0, sp, #4
 8001bfc:	f7ff fcfe 	bl	80015fc <RCC_GetClocksFreq>
 8001c00:	4b17      	ldr	r3, [pc, #92]	; (8001c60 <USART_Init+0xb4>)
 8001c02:	429c      	cmp	r4, r3
 8001c04:	d101      	bne.n	8001c0a <USART_Init+0x5e>
 8001c06:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 8001c08:	e00e      	b.n	8001c28 <USART_Init+0x7c>
 8001c0a:	4b16      	ldr	r3, [pc, #88]	; (8001c64 <USART_Init+0xb8>)
 8001c0c:	429c      	cmp	r4, r3
 8001c0e:	d101      	bne.n	8001c14 <USART_Init+0x68>
 8001c10:	9a10      	ldr	r2, [sp, #64]	; 0x40
 8001c12:	e009      	b.n	8001c28 <USART_Init+0x7c>
 8001c14:	4b14      	ldr	r3, [pc, #80]	; (8001c68 <USART_Init+0xbc>)
 8001c16:	429c      	cmp	r4, r3
 8001c18:	d101      	bne.n	8001c1e <USART_Init+0x72>
 8001c1a:	9a11      	ldr	r2, [sp, #68]	; 0x44
 8001c1c:	e004      	b.n	8001c28 <USART_Init+0x7c>
 8001c1e:	4b13      	ldr	r3, [pc, #76]	; (8001c6c <USART_Init+0xc0>)
 8001c20:	429c      	cmp	r4, r3
 8001c22:	bf0c      	ite	eq
 8001c24:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 8001c26:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 8001c28:	6823      	ldr	r3, [r4, #0]
 8001c2a:	6829      	ldr	r1, [r5, #0]
 8001c2c:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 8001c30:	bf18      	it	ne
 8001c32:	0052      	lslne	r2, r2, #1
 8001c34:	fbb2 f3f1 	udiv	r3, r2, r1
 8001c38:	fb01 2213 	mls	r2, r1, r3, r2
 8001c3c:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 8001c40:	6822      	ldr	r2, [r4, #0]
 8001c42:	bf28      	it	cs
 8001c44:	3301      	addcs	r3, #1
 8001c46:	0412      	lsls	r2, r2, #16
 8001c48:	d506      	bpl.n	8001c58 <USART_Init+0xac>
 8001c4a:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 8001c4e:	f3c3 0142 	ubfx	r1, r3, #1, #3
 8001c52:	401a      	ands	r2, r3
 8001c54:	ea41 0302 	orr.w	r3, r1, r2
 8001c58:	b29b      	uxth	r3, r3
 8001c5a:	81a3      	strh	r3, [r4, #12]
 8001c5c:	b019      	add	sp, #100	; 0x64
 8001c5e:	bd30      	pop	{r4, r5, pc}
 8001c60:	40013800 	.word	0x40013800
 8001c64:	40004400 	.word	0x40004400
 8001c68:	40004800 	.word	0x40004800
 8001c6c:	40004c00 	.word	0x40004c00

08001c70 <USART_Cmd>:
 8001c70:	bf00      	nop
 8001c72:	bf00      	nop
 8001c74:	6803      	ldr	r3, [r0, #0]
 8001c76:	b111      	cbz	r1, 8001c7e <USART_Cmd+0xe>
 8001c78:	f043 0301 	orr.w	r3, r3, #1
 8001c7c:	e001      	b.n	8001c82 <USART_Cmd+0x12>
 8001c7e:	f023 0301 	bic.w	r3, r3, #1
 8001c82:	6003      	str	r3, [r0, #0]
 8001c84:	4770      	bx	lr

08001c86 <USART_ReceiveData>:
 8001c86:	bf00      	nop
 8001c88:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8001c8a:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8001c8e:	4770      	bx	lr

08001c90 <USART_ITConfig>:
 8001c90:	b510      	push	{r4, lr}
 8001c92:	bf00      	nop
 8001c94:	bf00      	nop
 8001c96:	bf00      	nop
 8001c98:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8001c9c:	2401      	movs	r4, #1
 8001c9e:	b2c9      	uxtb	r1, r1
 8001ca0:	2b02      	cmp	r3, #2
 8001ca2:	fa04 f101 	lsl.w	r1, r4, r1
 8001ca6:	d101      	bne.n	8001cac <USART_ITConfig+0x1c>
 8001ca8:	3004      	adds	r0, #4
 8001caa:	e002      	b.n	8001cb2 <USART_ITConfig+0x22>
 8001cac:	2b03      	cmp	r3, #3
 8001cae:	bf08      	it	eq
 8001cb0:	3008      	addeq	r0, #8
 8001cb2:	6803      	ldr	r3, [r0, #0]
 8001cb4:	b10a      	cbz	r2, 8001cba <USART_ITConfig+0x2a>
 8001cb6:	4319      	orrs	r1, r3
 8001cb8:	e001      	b.n	8001cbe <USART_ITConfig+0x2e>
 8001cba:	ea23 0101 	bic.w	r1, r3, r1
 8001cbe:	6001      	str	r1, [r0, #0]
 8001cc0:	bd10      	pop	{r4, pc}

08001cc2 <USART_GetITStatus>:
 8001cc2:	b510      	push	{r4, lr}
 8001cc4:	bf00      	nop
 8001cc6:	bf00      	nop
 8001cc8:	2401      	movs	r4, #1
 8001cca:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8001cce:	b2cb      	uxtb	r3, r1
 8001cd0:	42a2      	cmp	r2, r4
 8001cd2:	fa04 f303 	lsl.w	r3, r4, r3
 8001cd6:	d101      	bne.n	8001cdc <USART_GetITStatus+0x1a>
 8001cd8:	6802      	ldr	r2, [r0, #0]
 8001cda:	e003      	b.n	8001ce4 <USART_GetITStatus+0x22>
 8001cdc:	2a02      	cmp	r2, #2
 8001cde:	bf0c      	ite	eq
 8001ce0:	6842      	ldreq	r2, [r0, #4]
 8001ce2:	6882      	ldrne	r2, [r0, #8]
 8001ce4:	4013      	ands	r3, r2
 8001ce6:	69c2      	ldr	r2, [r0, #28]
 8001ce8:	b143      	cbz	r3, 8001cfc <USART_GetITStatus+0x3a>
 8001cea:	2301      	movs	r3, #1
 8001cec:	0c09      	lsrs	r1, r1, #16
 8001cee:	fa03 f101 	lsl.w	r1, r3, r1
 8001cf2:	4211      	tst	r1, r2
 8001cf4:	bf0c      	ite	eq
 8001cf6:	2000      	moveq	r0, #0
 8001cf8:	2001      	movne	r0, #1
 8001cfa:	bd10      	pop	{r4, pc}
 8001cfc:	4618      	mov	r0, r3
 8001cfe:	bd10      	pop	{r4, pc}

08001d00 <USART_ClearITPendingBit>:
 8001d00:	bf00      	nop
 8001d02:	bf00      	nop
 8001d04:	2301      	movs	r3, #1
 8001d06:	0c09      	lsrs	r1, r1, #16
 8001d08:	fa03 f101 	lsl.w	r1, r3, r1
 8001d0c:	6201      	str	r1, [r0, #32]
 8001d0e:	4770      	bx	lr

08001d10 <uart_write>:
 8001d10:	4b03      	ldr	r3, [pc, #12]	; (8001d20 <uart_write+0x10>)
 8001d12:	69da      	ldr	r2, [r3, #28]
 8001d14:	0612      	lsls	r2, r2, #24
 8001d16:	d401      	bmi.n	8001d1c <uart_write+0xc>
 8001d18:	bf00      	nop
 8001d1a:	e7f9      	b.n	8001d10 <uart_write>
 8001d1c:	8518      	strh	r0, [r3, #40]	; 0x28
 8001d1e:	4770      	bx	lr
 8001d20:	40013800 	.word	0x40013800

08001d24 <uart_is_char>:
 8001d24:	4b0a      	ldr	r3, [pc, #40]	; (8001d50 <uart_is_char+0x2c>)
 8001d26:	4a0b      	ldr	r2, [pc, #44]	; (8001d54 <uart_is_char+0x30>)
 8001d28:	6819      	ldr	r1, [r3, #0]
 8001d2a:	6812      	ldr	r2, [r2, #0]
 8001d2c:	4291      	cmp	r1, r2
 8001d2e:	d00c      	beq.n	8001d4a <uart_is_char+0x26>
 8001d30:	681a      	ldr	r2, [r3, #0]
 8001d32:	4909      	ldr	r1, [pc, #36]	; (8001d58 <uart_is_char+0x34>)
 8001d34:	5c88      	ldrb	r0, [r1, r2]
 8001d36:	681a      	ldr	r2, [r3, #0]
 8001d38:	3201      	adds	r2, #1
 8001d3a:	601a      	str	r2, [r3, #0]
 8001d3c:	681a      	ldr	r2, [r3, #0]
 8001d3e:	2a0f      	cmp	r2, #15
 8001d40:	b2c0      	uxtb	r0, r0
 8001d42:	d904      	bls.n	8001d4e <uart_is_char+0x2a>
 8001d44:	2200      	movs	r2, #0
 8001d46:	601a      	str	r2, [r3, #0]
 8001d48:	4770      	bx	lr
 8001d4a:	f64f 70ff 	movw	r0, #65535	; 0xffff
 8001d4e:	4770      	bx	lr
 8001d50:	20000e04 	.word	0x20000e04
 8001d54:	20000e00 	.word	0x20000e00
 8001d58:	20000df0 	.word	0x20000df0

08001d5c <uart_read>:
 8001d5c:	b508      	push	{r3, lr}
 8001d5e:	f7ff ffe1 	bl	8001d24 <uart_is_char>
 8001d62:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8001d66:	4298      	cmp	r0, r3
 8001d68:	d101      	bne.n	8001d6e <uart_read+0x12>
 8001d6a:	bf00      	nop
 8001d6c:	e7f7      	b.n	8001d5e <uart_read+0x2>
 8001d6e:	b2c0      	uxtb	r0, r0
 8001d70:	bd08      	pop	{r3, pc}
	...

08001d74 <uart_init>:
 8001d74:	b530      	push	{r4, r5, lr}
 8001d76:	4b2c      	ldr	r3, [pc, #176]	; (8001e28 <uart_init+0xb4>)
 8001d78:	4d2c      	ldr	r5, [pc, #176]	; (8001e2c <uart_init+0xb8>)
 8001d7a:	2400      	movs	r4, #0
 8001d7c:	601c      	str	r4, [r3, #0]
 8001d7e:	4b2c      	ldr	r3, [pc, #176]	; (8001e30 <uart_init+0xbc>)
 8001d80:	b08b      	sub	sp, #44	; 0x2c
 8001d82:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001d86:	2101      	movs	r1, #1
 8001d88:	601c      	str	r4, [r3, #0]
 8001d8a:	f7ff fdc3 	bl	8001914 <RCC_AHBPeriphClockCmd>
 8001d8e:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001d92:	2101      	movs	r1, #1
 8001d94:	f7ff fdcc 	bl	8001930 <RCC_APB2PeriphClockCmd>
 8001d98:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001d9c:	9302      	str	r3, [sp, #8]
 8001d9e:	2302      	movs	r3, #2
 8001da0:	f88d 300c 	strb.w	r3, [sp, #12]
 8001da4:	a902      	add	r1, sp, #8
 8001da6:	2303      	movs	r3, #3
 8001da8:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001dac:	f88d 300d 	strb.w	r3, [sp, #13]
 8001db0:	f88d 400e 	strb.w	r4, [sp, #14]
 8001db4:	f88d 400f 	strb.w	r4, [sp, #15]
 8001db8:	f000 fa61 	bl	800227e <GPIO_Init>
 8001dbc:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001dc0:	2109      	movs	r1, #9
 8001dc2:	2207      	movs	r2, #7
 8001dc4:	f000 faa9 	bl	800231a <GPIO_PinAFConfig>
 8001dc8:	2207      	movs	r2, #7
 8001dca:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001dce:	210a      	movs	r1, #10
 8001dd0:	f000 faa3 	bl	800231a <GPIO_PinAFConfig>
 8001dd4:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001dd8:	9304      	str	r3, [sp, #16]
 8001dda:	4628      	mov	r0, r5
 8001ddc:	230c      	movs	r3, #12
 8001dde:	a904      	add	r1, sp, #16
 8001de0:	9308      	str	r3, [sp, #32]
 8001de2:	9405      	str	r4, [sp, #20]
 8001de4:	9406      	str	r4, [sp, #24]
 8001de6:	9407      	str	r4, [sp, #28]
 8001de8:	9409      	str	r4, [sp, #36]	; 0x24
 8001dea:	f7ff fedf 	bl	8001bac <USART_Init>
 8001dee:	4628      	mov	r0, r5
 8001df0:	2101      	movs	r1, #1
 8001df2:	f7ff ff3d 	bl	8001c70 <USART_Cmd>
 8001df6:	2201      	movs	r2, #1
 8001df8:	4628      	mov	r0, r5
 8001dfa:	490e      	ldr	r1, [pc, #56]	; (8001e34 <uart_init+0xc0>)
 8001dfc:	f7ff ff48 	bl	8001c90 <USART_ITConfig>
 8001e00:	2325      	movs	r3, #37	; 0x25
 8001e02:	f88d 4005 	strb.w	r4, [sp, #5]
 8001e06:	f88d 4006 	strb.w	r4, [sp, #6]
 8001e0a:	a801      	add	r0, sp, #4
 8001e0c:	2401      	movs	r4, #1
 8001e0e:	f88d 3004 	strb.w	r3, [sp, #4]
 8001e12:	f88d 4007 	strb.w	r4, [sp, #7]
 8001e16:	f000 f9ed 	bl	80021f4 <NVIC_Init>
 8001e1a:	4628      	mov	r0, r5
 8001e1c:	4621      	mov	r1, r4
 8001e1e:	f7ff ff27 	bl	8001c70 <USART_Cmd>
 8001e22:	b00b      	add	sp, #44	; 0x2c
 8001e24:	bd30      	pop	{r4, r5, pc}
 8001e26:	bf00      	nop
 8001e28:	20000e00 	.word	0x20000e00
 8001e2c:	40013800 	.word	0x40013800
 8001e30:	20000e04 	.word	0x20000e04
 8001e34:	00050105 	.word	0x00050105

08001e38 <USART1_IRQHandler>:
 8001e38:	b508      	push	{r3, lr}
 8001e3a:	480d      	ldr	r0, [pc, #52]	; (8001e70 <USART1_IRQHandler+0x38>)
 8001e3c:	490d      	ldr	r1, [pc, #52]	; (8001e74 <USART1_IRQHandler+0x3c>)
 8001e3e:	f7ff ff40 	bl	8001cc2 <USART_GetITStatus>
 8001e42:	b178      	cbz	r0, 8001e64 <USART1_IRQHandler+0x2c>
 8001e44:	480a      	ldr	r0, [pc, #40]	; (8001e70 <USART1_IRQHandler+0x38>)
 8001e46:	f7ff ff1e 	bl	8001c86 <USART_ReceiveData>
 8001e4a:	4b0b      	ldr	r3, [pc, #44]	; (8001e78 <USART1_IRQHandler+0x40>)
 8001e4c:	490b      	ldr	r1, [pc, #44]	; (8001e7c <USART1_IRQHandler+0x44>)
 8001e4e:	681a      	ldr	r2, [r3, #0]
 8001e50:	b2c0      	uxtb	r0, r0
 8001e52:	5488      	strb	r0, [r1, r2]
 8001e54:	681a      	ldr	r2, [r3, #0]
 8001e56:	3201      	adds	r2, #1
 8001e58:	601a      	str	r2, [r3, #0]
 8001e5a:	681a      	ldr	r2, [r3, #0]
 8001e5c:	2a0f      	cmp	r2, #15
 8001e5e:	bf84      	itt	hi
 8001e60:	2200      	movhi	r2, #0
 8001e62:	601a      	strhi	r2, [r3, #0]
 8001e64:	4802      	ldr	r0, [pc, #8]	; (8001e70 <USART1_IRQHandler+0x38>)
 8001e66:	4903      	ldr	r1, [pc, #12]	; (8001e74 <USART1_IRQHandler+0x3c>)
 8001e68:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001e6c:	f7ff bf48 	b.w	8001d00 <USART_ClearITPendingBit>
 8001e70:	40013800 	.word	0x40013800
 8001e74:	00050105 	.word	0x00050105
 8001e78:	20000e00 	.word	0x20000e00
 8001e7c:	20000df0 	.word	0x20000df0

08001e80 <uart_clear_buffer>:
 8001e80:	b672      	cpsid	i
 8001e82:	2300      	movs	r3, #0
 8001e84:	4a03      	ldr	r2, [pc, #12]	; (8001e94 <uart_clear_buffer+0x14>)
 8001e86:	2100      	movs	r1, #0
 8001e88:	54d1      	strb	r1, [r2, r3]
 8001e8a:	3301      	adds	r3, #1
 8001e8c:	2b10      	cmp	r3, #16
 8001e8e:	d1f9      	bne.n	8001e84 <uart_clear_buffer+0x4>
 8001e90:	b662      	cpsie	i
 8001e92:	4770      	bx	lr
 8001e94:	20000df0 	.word	0x20000df0

08001e98 <i2c_delay>:
 8001e98:	230b      	movs	r3, #11
 8001e9a:	3b01      	subs	r3, #1
 8001e9c:	d001      	beq.n	8001ea2 <i2c_delay+0xa>
 8001e9e:	bf00      	nop
 8001ea0:	e7fb      	b.n	8001e9a <i2c_delay+0x2>
 8001ea2:	4770      	bx	lr

08001ea4 <SetLowSDA>:
 8001ea4:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001ea6:	4d0d      	ldr	r5, [pc, #52]	; (8001edc <SetLowSDA+0x38>)
 8001ea8:	2301      	movs	r3, #1
 8001eaa:	2203      	movs	r2, #3
 8001eac:	2480      	movs	r4, #128	; 0x80
 8001eae:	f88d 3004 	strb.w	r3, [sp, #4]
 8001eb2:	f88d 3006 	strb.w	r3, [sp, #6]
 8001eb6:	4628      	mov	r0, r5
 8001eb8:	2300      	movs	r3, #0
 8001eba:	4669      	mov	r1, sp
 8001ebc:	f88d 2005 	strb.w	r2, [sp, #5]
 8001ec0:	f88d 3007 	strb.w	r3, [sp, #7]
 8001ec4:	9400      	str	r4, [sp, #0]
 8001ec6:	f000 f9da 	bl	800227e <GPIO_Init>
 8001eca:	4628      	mov	r0, r5
 8001ecc:	4621      	mov	r1, r4
 8001ece:	f000 fa20 	bl	8002312 <GPIO_ResetBits>
 8001ed2:	f7ff ffe1 	bl	8001e98 <i2c_delay>
 8001ed6:	b003      	add	sp, #12
 8001ed8:	bd30      	pop	{r4, r5, pc}
 8001eda:	bf00      	nop
 8001edc:	48000400 	.word	0x48000400

08001ee0 <SetHighSDA>:
 8001ee0:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001ee2:	4d0d      	ldr	r5, [pc, #52]	; (8001f18 <SetHighSDA+0x38>)
 8001ee4:	2203      	movs	r2, #3
 8001ee6:	2300      	movs	r3, #0
 8001ee8:	2480      	movs	r4, #128	; 0x80
 8001eea:	f88d 2005 	strb.w	r2, [sp, #5]
 8001eee:	4628      	mov	r0, r5
 8001ef0:	2201      	movs	r2, #1
 8001ef2:	4669      	mov	r1, sp
 8001ef4:	f88d 3004 	strb.w	r3, [sp, #4]
 8001ef8:	f88d 2006 	strb.w	r2, [sp, #6]
 8001efc:	f88d 3007 	strb.w	r3, [sp, #7]
 8001f00:	9400      	str	r4, [sp, #0]
 8001f02:	f000 f9bc 	bl	800227e <GPIO_Init>
 8001f06:	4628      	mov	r0, r5
 8001f08:	4621      	mov	r1, r4
 8001f0a:	f000 f9fe 	bl	800230a <GPIO_SetBits>
 8001f0e:	f7ff ffc3 	bl	8001e98 <i2c_delay>
 8001f12:	b003      	add	sp, #12
 8001f14:	bd30      	pop	{r4, r5, pc}
 8001f16:	bf00      	nop
 8001f18:	48000400 	.word	0x48000400

08001f1c <SetLowSCL>:
 8001f1c:	b508      	push	{r3, lr}
 8001f1e:	4804      	ldr	r0, [pc, #16]	; (8001f30 <SetLowSCL+0x14>)
 8001f20:	2140      	movs	r1, #64	; 0x40
 8001f22:	f000 f9f6 	bl	8002312 <GPIO_ResetBits>
 8001f26:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001f2a:	f7ff bfb5 	b.w	8001e98 <i2c_delay>
 8001f2e:	bf00      	nop
 8001f30:	48000400 	.word	0x48000400

08001f34 <SetHighSCL>:
 8001f34:	b508      	push	{r3, lr}
 8001f36:	4804      	ldr	r0, [pc, #16]	; (8001f48 <SetHighSCL+0x14>)
 8001f38:	2140      	movs	r1, #64	; 0x40
 8001f3a:	f000 f9e6 	bl	800230a <GPIO_SetBits>
 8001f3e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001f42:	f7ff bfa9 	b.w	8001e98 <i2c_delay>
 8001f46:	bf00      	nop
 8001f48:	48000400 	.word	0x48000400

08001f4c <i2c_0_init>:
 8001f4c:	b507      	push	{r0, r1, r2, lr}
 8001f4e:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001f52:	2101      	movs	r1, #1
 8001f54:	f7ff fcde 	bl	8001914 <RCC_AHBPeriphClockCmd>
 8001f58:	23c0      	movs	r3, #192	; 0xc0
 8001f5a:	9300      	str	r3, [sp, #0]
 8001f5c:	2301      	movs	r3, #1
 8001f5e:	2203      	movs	r2, #3
 8001f60:	480a      	ldr	r0, [pc, #40]	; (8001f8c <i2c_0_init+0x40>)
 8001f62:	f88d 3004 	strb.w	r3, [sp, #4]
 8001f66:	4669      	mov	r1, sp
 8001f68:	f88d 3006 	strb.w	r3, [sp, #6]
 8001f6c:	2300      	movs	r3, #0
 8001f6e:	f88d 2005 	strb.w	r2, [sp, #5]
 8001f72:	f88d 3007 	strb.w	r3, [sp, #7]
 8001f76:	f000 f982 	bl	800227e <GPIO_Init>
 8001f7a:	f7ff ffdb 	bl	8001f34 <SetHighSCL>
 8001f7e:	f7ff ff91 	bl	8001ea4 <SetLowSDA>
 8001f82:	f7ff ffad 	bl	8001ee0 <SetHighSDA>
 8001f86:	b003      	add	sp, #12
 8001f88:	f85d fb04 	ldr.w	pc, [sp], #4
 8001f8c:	48000400 	.word	0x48000400

08001f90 <i2cStart>:
 8001f90:	b508      	push	{r3, lr}
 8001f92:	f7ff ffcf 	bl	8001f34 <SetHighSCL>
 8001f96:	f7ff ffa3 	bl	8001ee0 <SetHighSDA>
 8001f9a:	f7ff ffcb 	bl	8001f34 <SetHighSCL>
 8001f9e:	f7ff ff81 	bl	8001ea4 <SetLowSDA>
 8001fa2:	f7ff ffbb 	bl	8001f1c <SetLowSCL>
 8001fa6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001faa:	f7ff bf99 	b.w	8001ee0 <SetHighSDA>

08001fae <i2cStop>:
 8001fae:	b508      	push	{r3, lr}
 8001fb0:	f7ff ffb4 	bl	8001f1c <SetLowSCL>
 8001fb4:	f7ff ff76 	bl	8001ea4 <SetLowSDA>
 8001fb8:	f7ff ffbc 	bl	8001f34 <SetHighSCL>
 8001fbc:	f7ff ff72 	bl	8001ea4 <SetLowSDA>
 8001fc0:	f7ff ffb8 	bl	8001f34 <SetHighSCL>
 8001fc4:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001fc8:	f7ff bf8a 	b.w	8001ee0 <SetHighSDA>

08001fcc <i2cWrite>:
 8001fcc:	b538      	push	{r3, r4, r5, lr}
 8001fce:	4604      	mov	r4, r0
 8001fd0:	2508      	movs	r5, #8
 8001fd2:	f7ff ffa3 	bl	8001f1c <SetLowSCL>
 8001fd6:	0623      	lsls	r3, r4, #24
 8001fd8:	d502      	bpl.n	8001fe0 <i2cWrite+0x14>
 8001fda:	f7ff ff81 	bl	8001ee0 <SetHighSDA>
 8001fde:	e001      	b.n	8001fe4 <i2cWrite+0x18>
 8001fe0:	f7ff ff60 	bl	8001ea4 <SetLowSDA>
 8001fe4:	3d01      	subs	r5, #1
 8001fe6:	f7ff ffa5 	bl	8001f34 <SetHighSCL>
 8001fea:	0064      	lsls	r4, r4, #1
 8001fec:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001ff0:	b2e4      	uxtb	r4, r4
 8001ff2:	d1ee      	bne.n	8001fd2 <i2cWrite+0x6>
 8001ff4:	f7ff ff92 	bl	8001f1c <SetLowSCL>
 8001ff8:	f7ff ff72 	bl	8001ee0 <SetHighSDA>
 8001ffc:	f7ff ff9a 	bl	8001f34 <SetHighSCL>
 8002000:	4b05      	ldr	r3, [pc, #20]	; (8002018 <i2cWrite+0x4c>)
 8002002:	8a1c      	ldrh	r4, [r3, #16]
 8002004:	b2a4      	uxth	r4, r4
 8002006:	f7ff ff89 	bl	8001f1c <SetLowSCL>
 800200a:	f7ff ff45 	bl	8001e98 <i2c_delay>
 800200e:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 8002012:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 8002016:	bd38      	pop	{r3, r4, r5, pc}
 8002018:	48000400 	.word	0x48000400

0800201c <i2cRead>:
 800201c:	b570      	push	{r4, r5, r6, lr}
 800201e:	4606      	mov	r6, r0
 8002020:	f7ff ff7c 	bl	8001f1c <SetLowSCL>
 8002024:	f7ff ff5c 	bl	8001ee0 <SetHighSDA>
 8002028:	2508      	movs	r5, #8
 800202a:	2400      	movs	r4, #0
 800202c:	f7ff ff82 	bl	8001f34 <SetHighSCL>
 8002030:	4b0d      	ldr	r3, [pc, #52]	; (8002068 <i2cRead+0x4c>)
 8002032:	8a1b      	ldrh	r3, [r3, #16]
 8002034:	0064      	lsls	r4, r4, #1
 8002036:	061a      	lsls	r2, r3, #24
 8002038:	b2e4      	uxtb	r4, r4
 800203a:	bf48      	it	mi
 800203c:	3401      	addmi	r4, #1
 800203e:	f105 35ff 	add.w	r5, r5, #4294967295
 8002042:	bf48      	it	mi
 8002044:	b2e4      	uxtbmi	r4, r4
 8002046:	f7ff ff69 	bl	8001f1c <SetLowSCL>
 800204a:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 800204e:	d1ed      	bne.n	800202c <i2cRead+0x10>
 8002050:	b10e      	cbz	r6, 8002056 <i2cRead+0x3a>
 8002052:	f7ff ff27 	bl	8001ea4 <SetLowSDA>
 8002056:	f7ff ff6d 	bl	8001f34 <SetHighSCL>
 800205a:	f7ff ff5f 	bl	8001f1c <SetLowSCL>
 800205e:	f7ff ff1b 	bl	8001e98 <i2c_delay>
 8002062:	4620      	mov	r0, r4
 8002064:	bd70      	pop	{r4, r5, r6, pc}
 8002066:	bf00      	nop
 8002068:	48000400 	.word	0x48000400

0800206c <i2c_write_reg>:
 800206c:	b570      	push	{r4, r5, r6, lr}
 800206e:	4605      	mov	r5, r0
 8002070:	460c      	mov	r4, r1
 8002072:	4616      	mov	r6, r2
 8002074:	f7ff ff8c 	bl	8001f90 <i2cStart>
 8002078:	4628      	mov	r0, r5
 800207a:	f7ff ffa7 	bl	8001fcc <i2cWrite>
 800207e:	4620      	mov	r0, r4
 8002080:	f7ff ffa4 	bl	8001fcc <i2cWrite>
 8002084:	4630      	mov	r0, r6
 8002086:	f7ff ffa1 	bl	8001fcc <i2cWrite>
 800208a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800208e:	f7ff bf8e 	b.w	8001fae <i2cStop>

08002092 <i2c_read_reg>:
 8002092:	b538      	push	{r3, r4, r5, lr}
 8002094:	4604      	mov	r4, r0
 8002096:	460d      	mov	r5, r1
 8002098:	f7ff ff7a 	bl	8001f90 <i2cStart>
 800209c:	4620      	mov	r0, r4
 800209e:	f7ff ff95 	bl	8001fcc <i2cWrite>
 80020a2:	4628      	mov	r0, r5
 80020a4:	f7ff ff92 	bl	8001fcc <i2cWrite>
 80020a8:	f7ff ff72 	bl	8001f90 <i2cStart>
 80020ac:	f044 0001 	orr.w	r0, r4, #1
 80020b0:	f7ff ff8c 	bl	8001fcc <i2cWrite>
 80020b4:	2000      	movs	r0, #0
 80020b6:	f7ff ffb1 	bl	800201c <i2cRead>
 80020ba:	4604      	mov	r4, r0
 80020bc:	f7ff ff77 	bl	8001fae <i2cStop>
 80020c0:	4620      	mov	r0, r4
 80020c2:	bd38      	pop	{r3, r4, r5, pc}

080020c4 <SystemInit>:
 80020c4:	4b3b      	ldr	r3, [pc, #236]	; (80021b4 <SystemInit+0xf0>)
 80020c6:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 80020ca:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80020ce:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80020d2:	4b39      	ldr	r3, [pc, #228]	; (80021b8 <SystemInit+0xf4>)
 80020d4:	681a      	ldr	r2, [r3, #0]
 80020d6:	f042 0201 	orr.w	r2, r2, #1
 80020da:	601a      	str	r2, [r3, #0]
 80020dc:	6859      	ldr	r1, [r3, #4]
 80020de:	4a37      	ldr	r2, [pc, #220]	; (80021bc <SystemInit+0xf8>)
 80020e0:	400a      	ands	r2, r1
 80020e2:	605a      	str	r2, [r3, #4]
 80020e4:	681a      	ldr	r2, [r3, #0]
 80020e6:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 80020ea:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 80020ee:	601a      	str	r2, [r3, #0]
 80020f0:	681a      	ldr	r2, [r3, #0]
 80020f2:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 80020f6:	601a      	str	r2, [r3, #0]
 80020f8:	685a      	ldr	r2, [r3, #4]
 80020fa:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 80020fe:	605a      	str	r2, [r3, #4]
 8002100:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8002102:	f022 020f 	bic.w	r2, r2, #15
 8002106:	62da      	str	r2, [r3, #44]	; 0x2c
 8002108:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800210a:	4a2d      	ldr	r2, [pc, #180]	; (80021c0 <SystemInit+0xfc>)
 800210c:	b082      	sub	sp, #8
 800210e:	400a      	ands	r2, r1
 8002110:	631a      	str	r2, [r3, #48]	; 0x30
 8002112:	2200      	movs	r2, #0
 8002114:	609a      	str	r2, [r3, #8]
 8002116:	9200      	str	r2, [sp, #0]
 8002118:	9201      	str	r2, [sp, #4]
 800211a:	681a      	ldr	r2, [r3, #0]
 800211c:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8002120:	601a      	str	r2, [r3, #0]
 8002122:	4b25      	ldr	r3, [pc, #148]	; (80021b8 <SystemInit+0xf4>)
 8002124:	681a      	ldr	r2, [r3, #0]
 8002126:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 800212a:	9201      	str	r2, [sp, #4]
 800212c:	9a00      	ldr	r2, [sp, #0]
 800212e:	3201      	adds	r2, #1
 8002130:	9200      	str	r2, [sp, #0]
 8002132:	9a01      	ldr	r2, [sp, #4]
 8002134:	b91a      	cbnz	r2, 800213e <SystemInit+0x7a>
 8002136:	9a00      	ldr	r2, [sp, #0]
 8002138:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 800213c:	d1f1      	bne.n	8002122 <SystemInit+0x5e>
 800213e:	681b      	ldr	r3, [r3, #0]
 8002140:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8002144:	bf18      	it	ne
 8002146:	2301      	movne	r3, #1
 8002148:	9301      	str	r3, [sp, #4]
 800214a:	9b01      	ldr	r3, [sp, #4]
 800214c:	2b01      	cmp	r3, #1
 800214e:	d005      	beq.n	800215c <SystemInit+0x98>
 8002150:	4b18      	ldr	r3, [pc, #96]	; (80021b4 <SystemInit+0xf0>)
 8002152:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8002156:	609a      	str	r2, [r3, #8]
 8002158:	b002      	add	sp, #8
 800215a:	4770      	bx	lr
 800215c:	4b19      	ldr	r3, [pc, #100]	; (80021c4 <SystemInit+0x100>)
 800215e:	2212      	movs	r2, #18
 8002160:	601a      	str	r2, [r3, #0]
 8002162:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 8002166:	685a      	ldr	r2, [r3, #4]
 8002168:	605a      	str	r2, [r3, #4]
 800216a:	685a      	ldr	r2, [r3, #4]
 800216c:	605a      	str	r2, [r3, #4]
 800216e:	685a      	ldr	r2, [r3, #4]
 8002170:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8002174:	605a      	str	r2, [r3, #4]
 8002176:	685a      	ldr	r2, [r3, #4]
 8002178:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 800217c:	605a      	str	r2, [r3, #4]
 800217e:	685a      	ldr	r2, [r3, #4]
 8002180:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8002184:	605a      	str	r2, [r3, #4]
 8002186:	681a      	ldr	r2, [r3, #0]
 8002188:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 800218c:	601a      	str	r2, [r3, #0]
 800218e:	6819      	ldr	r1, [r3, #0]
 8002190:	4a09      	ldr	r2, [pc, #36]	; (80021b8 <SystemInit+0xf4>)
 8002192:	0189      	lsls	r1, r1, #6
 8002194:	d5fb      	bpl.n	800218e <SystemInit+0xca>
 8002196:	6853      	ldr	r3, [r2, #4]
 8002198:	f023 0303 	bic.w	r3, r3, #3
 800219c:	6053      	str	r3, [r2, #4]
 800219e:	6853      	ldr	r3, [r2, #4]
 80021a0:	f043 0302 	orr.w	r3, r3, #2
 80021a4:	6053      	str	r3, [r2, #4]
 80021a6:	4b04      	ldr	r3, [pc, #16]	; (80021b8 <SystemInit+0xf4>)
 80021a8:	685b      	ldr	r3, [r3, #4]
 80021aa:	f003 030c 	and.w	r3, r3, #12
 80021ae:	2b08      	cmp	r3, #8
 80021b0:	d1f9      	bne.n	80021a6 <SystemInit+0xe2>
 80021b2:	e7cd      	b.n	8002150 <SystemInit+0x8c>
 80021b4:	e000ed00 	.word	0xe000ed00
 80021b8:	40021000 	.word	0x40021000
 80021bc:	f87fc00c 	.word	0xf87fc00c
 80021c0:	ff00fccc 	.word	0xff00fccc
 80021c4:	40022000 	.word	0x40022000

080021c8 <sys_tick_init>:
 80021c8:	4b05      	ldr	r3, [pc, #20]	; (80021e0 <sys_tick_init+0x18>)
 80021ca:	4a06      	ldr	r2, [pc, #24]	; (80021e4 <sys_tick_init+0x1c>)
 80021cc:	605a      	str	r2, [r3, #4]
 80021ce:	4a06      	ldr	r2, [pc, #24]	; (80021e8 <sys_tick_init+0x20>)
 80021d0:	21f0      	movs	r1, #240	; 0xf0
 80021d2:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 80021d6:	2200      	movs	r2, #0
 80021d8:	609a      	str	r2, [r3, #8]
 80021da:	2207      	movs	r2, #7
 80021dc:	601a      	str	r2, [r3, #0]
 80021de:	4770      	bx	lr
 80021e0:	e000e010 	.word	0xe000e010
 80021e4:	00029040 	.word	0x00029040
 80021e8:	e000ed00 	.word	0xe000ed00

080021ec <sleep>:
 80021ec:	bf30      	wfi
 80021ee:	4770      	bx	lr

080021f0 <sytem_clock_init>:
 80021f0:	f7ff bf68 	b.w	80020c4 <SystemInit>

080021f4 <NVIC_Init>:
 80021f4:	b510      	push	{r4, lr}
 80021f6:	bf00      	nop
 80021f8:	bf00      	nop
 80021fa:	bf00      	nop
 80021fc:	78c2      	ldrb	r2, [r0, #3]
 80021fe:	7803      	ldrb	r3, [r0, #0]
 8002200:	b30a      	cbz	r2, 8002246 <NVIC_Init+0x52>
 8002202:	4a16      	ldr	r2, [pc, #88]	; (800225c <NVIC_Init+0x68>)
 8002204:	7844      	ldrb	r4, [r0, #1]
 8002206:	68d2      	ldr	r2, [r2, #12]
 8002208:	43d2      	mvns	r2, r2
 800220a:	f3c2 2202 	ubfx	r2, r2, #8, #3
 800220e:	f1c2 0104 	rsb	r1, r2, #4
 8002212:	b2c9      	uxtb	r1, r1
 8002214:	fa04 f101 	lsl.w	r1, r4, r1
 8002218:	240f      	movs	r4, #15
 800221a:	fa44 f202 	asr.w	r2, r4, r2
 800221e:	7884      	ldrb	r4, [r0, #2]
 8002220:	b2c9      	uxtb	r1, r1
 8002222:	4022      	ands	r2, r4
 8002224:	430a      	orrs	r2, r1
 8002226:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 800222a:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 800222e:	0112      	lsls	r2, r2, #4
 8002230:	b2d2      	uxtb	r2, r2
 8002232:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8002236:	7803      	ldrb	r3, [r0, #0]
 8002238:	2201      	movs	r2, #1
 800223a:	0959      	lsrs	r1, r3, #5
 800223c:	f003 031f 	and.w	r3, r3, #31
 8002240:	fa02 f303 	lsl.w	r3, r2, r3
 8002244:	e006      	b.n	8002254 <NVIC_Init+0x60>
 8002246:	0959      	lsrs	r1, r3, #5
 8002248:	2201      	movs	r2, #1
 800224a:	f003 031f 	and.w	r3, r3, #31
 800224e:	fa02 f303 	lsl.w	r3, r2, r3
 8002252:	3120      	adds	r1, #32
 8002254:	4a02      	ldr	r2, [pc, #8]	; (8002260 <NVIC_Init+0x6c>)
 8002256:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 800225a:	bd10      	pop	{r4, pc}
 800225c:	e000ed00 	.word	0xe000ed00
 8002260:	e000e100 	.word	0xe000e100

08002264 <lib_low_level_init>:
 8002264:	b508      	push	{r3, lr}
 8002266:	f7ff ffc3 	bl	80021f0 <sytem_clock_init>
 800226a:	f000 f899 	bl	80023a0 <gpio_init>
 800226e:	f7ff fd81 	bl	8001d74 <uart_init>
 8002272:	f7ff fbdd 	bl	8001a30 <timer_init>
 8002276:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800227a:	f7ff be67 	b.w	8001f4c <i2c_0_init>

0800227e <GPIO_Init>:
 800227e:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002280:	bf00      	nop
 8002282:	bf00      	nop
 8002284:	bf00      	nop
 8002286:	bf00      	nop
 8002288:	2300      	movs	r3, #0
 800228a:	680e      	ldr	r6, [r1, #0]
 800228c:	461a      	mov	r2, r3
 800228e:	2501      	movs	r5, #1
 8002290:	4095      	lsls	r5, r2
 8002292:	ea05 0406 	and.w	r4, r5, r6
 8002296:	42ac      	cmp	r4, r5
 8002298:	d131      	bne.n	80022fe <GPIO_Init+0x80>
 800229a:	790d      	ldrb	r5, [r1, #4]
 800229c:	1e6f      	subs	r7, r5, #1
 800229e:	b2ff      	uxtb	r7, r7
 80022a0:	2f01      	cmp	r7, #1
 80022a2:	d81c      	bhi.n	80022de <GPIO_Init+0x60>
 80022a4:	bf00      	nop
 80022a6:	f04f 0c03 	mov.w	ip, #3
 80022aa:	6887      	ldr	r7, [r0, #8]
 80022ac:	fa0c fc03 	lsl.w	ip, ip, r3
 80022b0:	ea27 070c 	bic.w	r7, r7, ip
 80022b4:	6087      	str	r7, [r0, #8]
 80022b6:	f891 c005 	ldrb.w	ip, [r1, #5]
 80022ba:	6887      	ldr	r7, [r0, #8]
 80022bc:	fa0c fc03 	lsl.w	ip, ip, r3
 80022c0:	ea4c 0707 	orr.w	r7, ip, r7
 80022c4:	6087      	str	r7, [r0, #8]
 80022c6:	bf00      	nop
 80022c8:	8887      	ldrh	r7, [r0, #4]
 80022ca:	b2bf      	uxth	r7, r7
 80022cc:	ea27 0404 	bic.w	r4, r7, r4
 80022d0:	8084      	strh	r4, [r0, #4]
 80022d2:	798c      	ldrb	r4, [r1, #6]
 80022d4:	8887      	ldrh	r7, [r0, #4]
 80022d6:	4094      	lsls	r4, r2
 80022d8:	433c      	orrs	r4, r7
 80022da:	b2a4      	uxth	r4, r4
 80022dc:	8084      	strh	r4, [r0, #4]
 80022de:	2403      	movs	r4, #3
 80022e0:	6807      	ldr	r7, [r0, #0]
 80022e2:	409c      	lsls	r4, r3
 80022e4:	43e4      	mvns	r4, r4
 80022e6:	4027      	ands	r7, r4
 80022e8:	6007      	str	r7, [r0, #0]
 80022ea:	6807      	ldr	r7, [r0, #0]
 80022ec:	409d      	lsls	r5, r3
 80022ee:	433d      	orrs	r5, r7
 80022f0:	6005      	str	r5, [r0, #0]
 80022f2:	68c5      	ldr	r5, [r0, #12]
 80022f4:	402c      	ands	r4, r5
 80022f6:	79cd      	ldrb	r5, [r1, #7]
 80022f8:	409d      	lsls	r5, r3
 80022fa:	432c      	orrs	r4, r5
 80022fc:	60c4      	str	r4, [r0, #12]
 80022fe:	3201      	adds	r2, #1
 8002300:	2a10      	cmp	r2, #16
 8002302:	f103 0302 	add.w	r3, r3, #2
 8002306:	d1c2      	bne.n	800228e <GPIO_Init+0x10>
 8002308:	bdf0      	pop	{r4, r5, r6, r7, pc}

0800230a <GPIO_SetBits>:
 800230a:	bf00      	nop
 800230c:	bf00      	nop
 800230e:	6181      	str	r1, [r0, #24]
 8002310:	4770      	bx	lr

08002312 <GPIO_ResetBits>:
 8002312:	bf00      	nop
 8002314:	bf00      	nop
 8002316:	8501      	strh	r1, [r0, #40]	; 0x28
 8002318:	4770      	bx	lr

0800231a <GPIO_PinAFConfig>:
 800231a:	b510      	push	{r4, lr}
 800231c:	bf00      	nop
 800231e:	bf00      	nop
 8002320:	bf00      	nop
 8002322:	f001 0307 	and.w	r3, r1, #7
 8002326:	08c9      	lsrs	r1, r1, #3
 8002328:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 800232c:	009b      	lsls	r3, r3, #2
 800232e:	6a04      	ldr	r4, [r0, #32]
 8002330:	210f      	movs	r1, #15
 8002332:	4099      	lsls	r1, r3
 8002334:	ea24 0101 	bic.w	r1, r4, r1
 8002338:	6201      	str	r1, [r0, #32]
 800233a:	6a01      	ldr	r1, [r0, #32]
 800233c:	fa02 f303 	lsl.w	r3, r2, r3
 8002340:	430b      	orrs	r3, r1
 8002342:	6203      	str	r3, [r0, #32]
 8002344:	bd10      	pop	{r4, pc}
	...

08002348 <led_on>:
 8002348:	0401      	lsls	r1, r0, #16
 800234a:	d503      	bpl.n	8002354 <led_on+0xc>
 800234c:	4b08      	ldr	r3, [pc, #32]	; (8002370 <led_on+0x28>)
 800234e:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8002352:	619a      	str	r2, [r3, #24]
 8002354:	0702      	lsls	r2, r0, #28
 8002356:	d503      	bpl.n	8002360 <led_on+0x18>
 8002358:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800235c:	2208      	movs	r2, #8
 800235e:	851a      	strh	r2, [r3, #40]	; 0x28
 8002360:	07c3      	lsls	r3, r0, #31
 8002362:	d503      	bpl.n	800236c <led_on+0x24>
 8002364:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002368:	2201      	movs	r2, #1
 800236a:	619a      	str	r2, [r3, #24]
 800236c:	4770      	bx	lr
 800236e:	bf00      	nop
 8002370:	48000400 	.word	0x48000400

08002374 <led_off>:
 8002374:	0402      	lsls	r2, r0, #16
 8002376:	d503      	bpl.n	8002380 <led_off+0xc>
 8002378:	4b08      	ldr	r3, [pc, #32]	; (800239c <led_off+0x28>)
 800237a:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800237e:	851a      	strh	r2, [r3, #40]	; 0x28
 8002380:	0703      	lsls	r3, r0, #28
 8002382:	d503      	bpl.n	800238c <led_off+0x18>
 8002384:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002388:	2208      	movs	r2, #8
 800238a:	619a      	str	r2, [r3, #24]
 800238c:	07c0      	lsls	r0, r0, #31
 800238e:	d503      	bpl.n	8002398 <led_off+0x24>
 8002390:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002394:	2201      	movs	r2, #1
 8002396:	851a      	strh	r2, [r3, #40]	; 0x28
 8002398:	4770      	bx	lr
 800239a:	bf00      	nop
 800239c:	48000400 	.word	0x48000400

080023a0 <gpio_init>:
 80023a0:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 80023a4:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80023a8:	2101      	movs	r1, #1
 80023aa:	f7ff fab3 	bl	8001914 <RCC_AHBPeriphClockCmd>
 80023ae:	f8df 90a8 	ldr.w	r9, [pc, #168]	; 8002458 <gpio_init+0xb8>
 80023b2:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 80023b6:	2101      	movs	r1, #1
 80023b8:	f7ff faac 	bl	8001914 <RCC_AHBPeriphClockCmd>
 80023bc:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 80023c0:	2101      	movs	r1, #1
 80023c2:	f7ff faa7 	bl	8001914 <RCC_AHBPeriphClockCmd>
 80023c6:	2400      	movs	r4, #0
 80023c8:	2501      	movs	r5, #1
 80023ca:	2603      	movs	r6, #3
 80023cc:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 80023d0:	4648      	mov	r0, r9
 80023d2:	4669      	mov	r1, sp
 80023d4:	2708      	movs	r7, #8
 80023d6:	f8cd 8000 	str.w	r8, [sp]
 80023da:	f88d 5004 	strb.w	r5, [sp, #4]
 80023de:	f88d 4006 	strb.w	r4, [sp, #6]
 80023e2:	f88d 6005 	strb.w	r6, [sp, #5]
 80023e6:	f88d 4007 	strb.w	r4, [sp, #7]
 80023ea:	f7ff ff48 	bl	800227e <GPIO_Init>
 80023ee:	4669      	mov	r1, sp
 80023f0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80023f4:	9700      	str	r7, [sp, #0]
 80023f6:	f88d 5004 	strb.w	r5, [sp, #4]
 80023fa:	f88d 4006 	strb.w	r4, [sp, #6]
 80023fe:	f88d 6005 	strb.w	r6, [sp, #5]
 8002402:	f88d 4007 	strb.w	r4, [sp, #7]
 8002406:	f7ff ff3a 	bl	800227e <GPIO_Init>
 800240a:	4669      	mov	r1, sp
 800240c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8002410:	9500      	str	r5, [sp, #0]
 8002412:	f88d 5004 	strb.w	r5, [sp, #4]
 8002416:	f88d 4006 	strb.w	r4, [sp, #6]
 800241a:	f88d 6005 	strb.w	r6, [sp, #5]
 800241e:	f88d 4007 	strb.w	r4, [sp, #7]
 8002422:	f7ff ff2c 	bl	800227e <GPIO_Init>
 8002426:	f44f 7300 	mov.w	r3, #512	; 0x200
 800242a:	4669      	mov	r1, sp
 800242c:	4648      	mov	r0, r9
 800242e:	9300      	str	r3, [sp, #0]
 8002430:	f88d 4004 	strb.w	r4, [sp, #4]
 8002434:	f88d 6005 	strb.w	r6, [sp, #5]
 8002438:	f88d 4007 	strb.w	r4, [sp, #7]
 800243c:	f7ff ff1f 	bl	800227e <GPIO_Init>
 8002440:	4640      	mov	r0, r8
 8002442:	f7ff ff81 	bl	8002348 <led_on>
 8002446:	4638      	mov	r0, r7
 8002448:	f7ff ff94 	bl	8002374 <led_off>
 800244c:	4628      	mov	r0, r5
 800244e:	f7ff ff91 	bl	8002374 <led_off>
 8002452:	b003      	add	sp, #12
 8002454:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8002458:	48000400 	.word	0x48000400

0800245c <get_key>:
 800245c:	4b02      	ldr	r3, [pc, #8]	; (8002468 <get_key+0xc>)
 800245e:	8a18      	ldrh	r0, [r3, #16]
 8002460:	43c0      	mvns	r0, r0
 8002462:	f400 7000 	and.w	r0, r0, #512	; 0x200
 8002466:	4770      	bx	lr
 8002468:	48000400 	.word	0x48000400

0800246c <Default_Handler>:
 800246c:	4668      	mov	r0, sp
 800246e:	f020 0107 	bic.w	r1, r0, #7
 8002472:	468d      	mov	sp, r1
 8002474:	bf00      	nop
 8002476:	e7fd      	b.n	8002474 <Default_Handler+0x8>

08002478 <HardFault_Handler>:
 8002478:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 800247c:	f7ff ff64 	bl	8002348 <led_on>
 8002480:	4b06      	ldr	r3, [pc, #24]	; (800249c <HardFault_Handler+0x24>)
 8002482:	3b01      	subs	r3, #1
 8002484:	d001      	beq.n	800248a <HardFault_Handler+0x12>
 8002486:	bf00      	nop
 8002488:	e7fb      	b.n	8002482 <HardFault_Handler+0xa>
 800248a:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 800248e:	f7ff ff71 	bl	8002374 <led_off>
 8002492:	4b02      	ldr	r3, [pc, #8]	; (800249c <HardFault_Handler+0x24>)
 8002494:	3b01      	subs	r3, #1
 8002496:	d0ef      	beq.n	8002478 <HardFault_Handler>
 8002498:	bf00      	nop
 800249a:	e7fb      	b.n	8002494 <HardFault_Handler+0x1c>
 800249c:	00989681 	.word	0x00989681

080024a0 <_reset_init>:
 80024a0:	4a0e      	ldr	r2, [pc, #56]	; (80024dc <_reset_init+0x3c>)
 80024a2:	480f      	ldr	r0, [pc, #60]	; (80024e0 <_reset_init+0x40>)
 80024a4:	1a80      	subs	r0, r0, r2
 80024a6:	1080      	asrs	r0, r0, #2
 80024a8:	2300      	movs	r3, #0
 80024aa:	4283      	cmp	r3, r0
 80024ac:	d006      	beq.n	80024bc <_reset_init+0x1c>
 80024ae:	490d      	ldr	r1, [pc, #52]	; (80024e4 <_reset_init+0x44>)
 80024b0:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 80024b4:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 80024b8:	3301      	adds	r3, #1
 80024ba:	e7f6      	b.n	80024aa <_reset_init+0xa>
 80024bc:	4b0a      	ldr	r3, [pc, #40]	; (80024e8 <_reset_init+0x48>)
 80024be:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 80024c2:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80024c6:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80024ca:	f503 730c 	add.w	r3, r3, #560	; 0x230
 80024ce:	685a      	ldr	r2, [r3, #4]
 80024d0:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 80024d4:	605a      	str	r2, [r3, #4]
 80024d6:	f7ff b87d 	b.w	80015d4 <main>
 80024da:	bf00      	nop
 80024dc:	20000000 	.word	0x20000000
 80024e0:	20000030 	.word	0x20000030
 80024e4:	080026a8 	.word	0x080026a8
 80024e8:	e000ed00 	.word	0xe000ed00

080024ec <_init>:
 80024ec:	e1a0c00d 	mov	ip, sp
 80024f0:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80024f4:	e24cb004 	sub	fp, ip, #4
 80024f8:	e24bd028 	sub	sp, fp, #40	; 0x28
 80024fc:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8002500:	e12fff1e 	bx	lr

08002504 <_fini>:
 8002504:	e1a0c00d 	mov	ip, sp
 8002508:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 800250c:	e24cb004 	sub	fp, ip, #4
 8002510:	e24bd028 	sub	sp, fp, #40	; 0x28
 8002514:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8002518:	e12fff1e 	bx	lr
 800251c:	69647473 	.word	0x69647473
 8002520:	6e69206f 	.word	0x6e69206f
 8002524:	64207469 	.word	0x64207469
 8002528:	0a656e6f 	.word	0x0a656e6f
 800252c:	00          	.byte	0x00
 800252d:	41          	.byte	0x41
 800252e:	2b54      	.short	0x2b54
 8002530:	4d504943 	.word	0x4d504943
 8002534:	313d5855 	.word	0x313d5855
 8002538:	41000a0d 	.word	0x41000a0d
 800253c:	49432b54 	.word	0x49432b54
 8002540:	58554d50 	.word	0x58554d50
 8002544:	0a0d303d 	.word	0x0a0d303d
 8002548:	2b544100 	.word	0x2b544100
 800254c:	4f4d5743 	.word	0x4f4d5743
 8002550:	313d4544 	.word	0x313d4544
 8002554:	41000a0d 	.word	0x41000a0d
 8002558:	57432b54 	.word	0x57432b54
 800255c:	3d50414a 	.word	0x3d50414a
 8002560:	69640022 	.word	0x69640022
 8002564:	6e6f6373 	.word	0x6e6f6373
 8002568:	7463656e 	.word	0x7463656e
 800256c:	76006465 	.word	0x76006465
 8002570:	68797265 	.word	0x68797265
 8002574:	00647261 	.word	0x00647261
 8002578:	000a0d22 	.word	0x000a0d22
 800257c:	432b5441 	.word	0x432b5441
 8002580:	45535049 	.word	0x45535049
 8002584:	52455652 	.word	0x52455652
 8002588:	382c313d 	.word	0x382c313d
 800258c:	000a0d30 	.word	0x000a0d30
 8002590:	432b5441 	.word	0x432b5441
 8002594:	54535049 	.word	0x54535049
 8002598:	3d545241 	.word	0x3d545241
 800259c:	50435422 	.word	0x50435422
 80025a0:	00222c22 	.word	0x00222c22
 80025a4:	41002c22 	.word	0x41002c22
 80025a8:	49432b54 	.word	0x49432b54
 80025ac:	4e455350 	.word	0x4e455350
 80025b0:	3e003d44 	.word	0x3e003d44
 80025b4:	2b544100 	.word	0x2b544100
 80025b8:	43504943 	.word	0x43504943
 80025bc:	45534f4c 	.word	0x45534f4c
 80025c0:	53000a0d 	.word	0x53000a0d
 80025c4:	20444e45 	.word	0x20444e45
 80025c8:	2b004b4f 	.word	0x2b004b4f
 80025cc:	2c445049 	.word	0x2c445049
 80025d0:	00000000 	.word	0x00000000
 80025d4:	00000020 	.word	0x00000020
 80025d8:	00000040 	.word	0x00000040
 80025dc:	00000060 	.word	0x00000060
 80025e0:	00000080 	.word	0x00000080
 80025e4:	2e323931 	.word	0x2e323931
 80025e8:	2e383631 	.word	0x2e383631
 80025ec:	00322e32 	.word	0x00322e32
 80025f0:	38707365 	.word	0x38707365
 80025f4:	20363632 	.word	0x20363632
 80025f8:	7373656d 	.word	0x7373656d
 80025fc:	00656761 	.word	0x00656761
 8002600:	6f727265 	.word	0x6f727265
 8002604:	6f632072 	.word	0x6f632072
 8002608:	25206564 	.word	0x25206564
 800260c:	75253a75 	.word	0x75253a75
 8002610:	000a      	.short	0x000a
 8002612:	534c      	.short	0x534c
 8002614:	5344394d 	.word	0x5344394d
 8002618:	203a2030 	.word	0x203a2030
 800261c:	20692500 	.word	0x20692500
 8002620:	25206925 	.word	0x25206925
 8002624:	202c2069 	.word	0x202c2069
 8002628:	20692500 	.word	0x20692500
 800262c:	25206925 	.word	0x25206925
 8002630:	520a0069 	.word	0x520a0069
 8002634:	73204247 	.word	0x73204247
 8002638:	61667275 	.word	0x61667275
 800263c:	3a206563 	.word	0x3a206563
 8002640:	520a0020 	.word	0x520a0020
 8002644:	2500203a 	.word	0x2500203a
 8002648:	0a002069 	.word	0x0a002069
 800264c:	00203a47 	.word	0x00203a47
 8002650:	203a420a 	.word	0x203a420a
 8002654:	3a410a00 	.word	0x3a410a00
 8002658:	0a0a0020 	.word	0x0a0a0020
 800265c:	20692500 	.word	0x20692500
 8002660:	25206925 	.word	0x25206925
 8002664:	0a69      	.short	0x0a69
 8002666:	00          	.byte	0x00
 8002667:	0a          	.byte	0x0a
 8002668:	636c6577 	.word	0x636c6577
 800266c:	20656d6f 	.word	0x20656d6f
 8002670:	53206f74 	.word	0x53206f74
 8002674:	68757a75 	.word	0x68757a75
 8002678:	20534f61 	.word	0x20534f61
 800267c:	205e5f5e 	.word	0x205e5f5e
 8002680:	2e302e32 	.word	0x2e302e32
 8002684:	55420a36 	.word	0x55420a36
 8002688:	20444c49 	.word	0x20444c49
 800268c:	2072614d 	.word	0x2072614d
 8002690:	32203133 	.word	0x32203133
 8002694:	20363130 	.word	0x20363130
 8002698:	353a3231 	.word	0x353a3231
 800269c:	34313a33 	.word	0x34313a33
 80026a0:	0000000a 	.word	0x0000000a

080026a4 <__EH_FRAME_BEGIN__>:
 80026a4:	00000000                                ....
