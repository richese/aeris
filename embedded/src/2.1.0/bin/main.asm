
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
 80001aa:	f002 f8ab 	bl	8002304 <sleep>
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
 8000282:	f002 f82d 	bl	80022e0 <sys_tick_init>
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
 80003fe:	f001 fd13 	bl	8001e28 <uart_write>
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
 80005d4:	08002634 	.word	0x08002634

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
 8000652:	f001 fbe9 	bl	8001e28 <uart_write>
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
 8000690:	f001 fad2 	bl	8001c38 <timer_get_time>
 8000694:	4405      	add	r5, r0
 8000696:	f001 fc7f 	bl	8001f98 <uart_clear_buffer>
 800069a:	2400      	movs	r4, #0
 800069c:	f001 fbce 	bl	8001e3c <uart_is_char>
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
 80006b8:	f001 fc6e 	bl	8001f98 <uart_clear_buffer>
 80006bc:	2001      	movs	r0, #1
 80006be:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80006c0:	2400      	movs	r4, #0
 80006c2:	f001 fab9 	bl	8001c38 <timer_get_time>
 80006c6:	42a8      	cmp	r0, r5
 80006c8:	d3e8      	bcc.n	800069c <esp8266_find_stream+0x14>
 80006ca:	f001 fc65 	bl	8001f98 <uart_clear_buffer>
 80006ce:	2000      	movs	r0, #0
 80006d0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

080006d4 <esp8266_init>:
 80006d4:	b510      	push	{r4, lr}
 80006d6:	4604      	mov	r4, r0
 80006d8:	f640 30b8 	movw	r0, #3000	; 0xbb8
 80006dc:	f001 faba 	bl	8001c54 <timer_delay_ms>
 80006e0:	b10c      	cbz	r4, 80006e6 <esp8266_init+0x12>
 80006e2:	4818      	ldr	r0, [pc, #96]	; (8000744 <esp8266_init+0x70>)
 80006e4:	e000      	b.n	80006e8 <esp8266_init+0x14>
 80006e6:	4818      	ldr	r0, [pc, #96]	; (8000748 <esp8266_init+0x74>)
 80006e8:	f7ff ffae 	bl	8000648 <esp8266_send>
 80006ec:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006f0:	f001 fab0 	bl	8001c54 <timer_delay_ms>
 80006f4:	4815      	ldr	r0, [pc, #84]	; (800074c <esp8266_init+0x78>)
 80006f6:	f7ff ffa7 	bl	8000648 <esp8266_send>
 80006fa:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006fe:	f001 faa9 	bl	8001c54 <timer_delay_ms>
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
 8000738:	f001 fa8c 	bl	8001c54 <timer_delay_ms>
 800073c:	2000      	movs	r0, #0
 800073e:	bd10      	pop	{r4, pc}
 8000740:	2002      	movs	r0, #2
 8000742:	bd10      	pop	{r4, pc}
 8000744:	08002645 	.word	0x08002645
 8000748:	08002653 	.word	0x08002653
 800074c:	08002661 	.word	0x08002661
 8000750:	0800266f 	.word	0x0800266f
 8000754:	0800267a 	.word	0x0800267a
 8000758:	080026b8 	.word	0x080026b8
 800075c:	08002687 	.word	0x08002687
 8000760:	08002690 	.word	0x08002690
 8000764:	080026e0 	.word	0x080026e0
 8000768:	08002694 	.word	0x08002694

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
 8000786:	f001 fa57 	bl	8001c38 <timer_get_time>
 800078a:	4405      	add	r5, r0
 800078c:	f001 fb56 	bl	8001e3c <uart_is_char>
 8000790:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000794:	4298      	cmp	r0, r3
 8000796:	bf1c      	itt	ne
 8000798:	5530      	strbne	r0, [r6, r4]
 800079a:	3401      	addne	r4, #1
 800079c:	f001 fa4c 	bl	8001c38 <timer_get_time>
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
 8000828:	f001 fa14 	bl	8001c54 <timer_delay_ms>
 800082c:	2004      	movs	r0, #4
 800082e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000830:	42ac      	cmp	r4, r5
 8000832:	d004      	beq.n	800083e <esp8266_connect+0x7a>
 8000834:	f814 0b01 	ldrb.w	r0, [r4], #1
 8000838:	f001 faf6 	bl	8001e28 <uart_write>
 800083c:	e7f8      	b.n	8000830 <esp8266_connect+0x6c>
 800083e:	4823      	ldr	r0, [pc, #140]	; (80008cc <esp8266_connect+0x108>)
 8000840:	2107      	movs	r1, #7
 8000842:	2264      	movs	r2, #100	; 0x64
 8000844:	f7ff ff20 	bl	8000688 <esp8266_find_stream>
 8000848:	b938      	cbnz	r0, 800085a <esp8266_connect+0x96>
 800084a:	481f      	ldr	r0, [pc, #124]	; (80008c8 <esp8266_connect+0x104>)
 800084c:	f7ff fefc 	bl	8000648 <esp8266_send>
 8000850:	2064      	movs	r0, #100	; 0x64
 8000852:	f001 f9ff 	bl	8001c54 <timer_delay_ms>
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
 8000872:	f001 f9ef 	bl	8001c54 <timer_delay_ms>
 8000876:	2006      	movs	r0, #6
 8000878:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800087a:	f001 fafb 	bl	8001e74 <uart_read>
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
 80008a0:	f001 f9d8 	bl	8001c54 <timer_delay_ms>
 80008a4:	f504 707a 	add.w	r0, r4, #1000	; 0x3e8
 80008a8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008aa:	2003      	movs	r0, #3
 80008ac:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008ae:	bf00      	nop
 80008b0:	080026a8 	.word	0x080026a8
 80008b4:	080026bc 	.word	0x080026bc
 80008b8:	08002691 	.word	0x08002691
 80008bc:	080026e0 	.word	0x080026e0
 80008c0:	080026bf 	.word	0x080026bf
 80008c4:	080026cb 	.word	0x080026cb
 80008c8:	080026cd 	.word	0x080026cd
 80008cc:	080026db 	.word	0x080026db
 80008d0:	080026e3 	.word	0x080026e3

080008d4 <motors_uninit>:
 80008d4:	b508      	push	{r3, lr}
 80008d6:	20c0      	movs	r0, #192	; 0xc0
 80008d8:	2100      	movs	r1, #0
 80008da:	2218      	movs	r2, #24
 80008dc:	f001 fc52 	bl	8002184 <i2c_write_reg>
 80008e0:	20c2      	movs	r0, #194	; 0xc2
 80008e2:	2100      	movs	r1, #0
 80008e4:	2218      	movs	r2, #24
 80008e6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80008ea:	f001 bc4b 	b.w	8002184 <i2c_write_reg>
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
 8000958:	f001 fc14 	bl	8002184 <i2c_write_reg>
 800095c:	20c0      	movs	r0, #192	; 0xc0
 800095e:	2100      	movs	r1, #0
 8000960:	462a      	mov	r2, r5
 8000962:	f001 fc0f 	bl	8002184 <i2c_write_reg>
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
 800099e:	f001 fbf1 	bl	8002184 <i2c_write_reg>
 80009a2:	4622      	mov	r2, r4
 80009a4:	20c2      	movs	r0, #194	; 0xc2
 80009a6:	2100      	movs	r1, #0
 80009a8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80009ac:	f001 bbea 	b.w	8002184 <i2c_write_reg>
 80009b0:	20000208 	.word	0x20000208

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
 80009c8:	20000208 	.word	0x20000208

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
 8000a08:	f001 fbbc 	bl	8002184 <i2c_write_reg>
 8000a0c:	203c      	movs	r0, #60	; 0x3c
 8000a0e:	2120      	movs	r1, #32
 8000a10:	2200      	movs	r2, #0
 8000a12:	f001 fbb7 	bl	8002184 <i2c_write_reg>
 8000a16:	203c      	movs	r0, #60	; 0x3c
 8000a18:	2124      	movs	r1, #36	; 0x24
 8000a1a:	2200      	movs	r2, #0
 8000a1c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000a20:	f001 bbb0 	b.w	8002184 <i2c_write_reg>

08000a24 <lsm9ds0_read>:
 8000a24:	b538      	push	{r3, r4, r5, lr}
 8000a26:	2128      	movs	r1, #40	; 0x28
 8000a28:	20d4      	movs	r0, #212	; 0xd4
 8000a2a:	f001 fbbe 	bl	80021aa <i2c_read_reg>
 8000a2e:	2129      	movs	r1, #41	; 0x29
 8000a30:	4604      	mov	r4, r0
 8000a32:	20d4      	movs	r0, #212	; 0xd4
 8000a34:	f001 fbb9 	bl	80021aa <i2c_read_reg>
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
 8000a54:	f001 fba9 	bl	80021aa <i2c_read_reg>
 8000a58:	212b      	movs	r1, #43	; 0x2b
 8000a5a:	4605      	mov	r5, r0
 8000a5c:	20d4      	movs	r0, #212	; 0xd4
 8000a5e:	f001 fba4 	bl	80021aa <i2c_read_reg>
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
 8000a7c:	f001 fb95 	bl	80021aa <i2c_read_reg>
 8000a80:	212d      	movs	r1, #45	; 0x2d
 8000a82:	4605      	mov	r5, r0
 8000a84:	20d4      	movs	r0, #212	; 0xd4
 8000a86:	f001 fb90 	bl	80021aa <i2c_read_reg>
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
 8000aa4:	f001 fb81 	bl	80021aa <i2c_read_reg>
 8000aa8:	2109      	movs	r1, #9
 8000aaa:	4605      	mov	r5, r0
 8000aac:	203c      	movs	r0, #60	; 0x3c
 8000aae:	f001 fb7c 	bl	80021aa <i2c_read_reg>
 8000ab2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ab6:	b285      	uxth	r5, r0
 8000ab8:	210a      	movs	r1, #10
 8000aba:	203c      	movs	r0, #60	; 0x3c
 8000abc:	80e5      	strh	r5, [r4, #6]
 8000abe:	f001 fb74 	bl	80021aa <i2c_read_reg>
 8000ac2:	210b      	movs	r1, #11
 8000ac4:	4605      	mov	r5, r0
 8000ac6:	203c      	movs	r0, #60	; 0x3c
 8000ac8:	f001 fb6f 	bl	80021aa <i2c_read_reg>
 8000acc:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ad0:	b285      	uxth	r5, r0
 8000ad2:	210c      	movs	r1, #12
 8000ad4:	203c      	movs	r0, #60	; 0x3c
 8000ad6:	8125      	strh	r5, [r4, #8]
 8000ad8:	f001 fb67 	bl	80021aa <i2c_read_reg>
 8000adc:	210d      	movs	r1, #13
 8000ade:	4605      	mov	r5, r0
 8000ae0:	203c      	movs	r0, #60	; 0x3c
 8000ae2:	f001 fb62 	bl	80021aa <i2c_read_reg>
 8000ae6:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000aea:	b285      	uxth	r5, r0
 8000aec:	2128      	movs	r1, #40	; 0x28
 8000aee:	203c      	movs	r0, #60	; 0x3c
 8000af0:	8165      	strh	r5, [r4, #10]
 8000af2:	f001 fb5a 	bl	80021aa <i2c_read_reg>
 8000af6:	2129      	movs	r1, #41	; 0x29
 8000af8:	4605      	mov	r5, r0
 8000afa:	203c      	movs	r0, #60	; 0x3c
 8000afc:	f001 fb55 	bl	80021aa <i2c_read_reg>
 8000b00:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b04:	b285      	uxth	r5, r0
 8000b06:	212a      	movs	r1, #42	; 0x2a
 8000b08:	203c      	movs	r0, #60	; 0x3c
 8000b0a:	8025      	strh	r5, [r4, #0]
 8000b0c:	f001 fb4d 	bl	80021aa <i2c_read_reg>
 8000b10:	212b      	movs	r1, #43	; 0x2b
 8000b12:	4605      	mov	r5, r0
 8000b14:	203c      	movs	r0, #60	; 0x3c
 8000b16:	f001 fb48 	bl	80021aa <i2c_read_reg>
 8000b1a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b1e:	b285      	uxth	r5, r0
 8000b20:	212c      	movs	r1, #44	; 0x2c
 8000b22:	203c      	movs	r0, #60	; 0x3c
 8000b24:	8065      	strh	r5, [r4, #2]
 8000b26:	f001 fb40 	bl	80021aa <i2c_read_reg>
 8000b2a:	212d      	movs	r1, #45	; 0x2d
 8000b2c:	4605      	mov	r5, r0
 8000b2e:	203c      	movs	r0, #60	; 0x3c
 8000b30:	f001 fb3b 	bl	80021aa <i2c_read_reg>
 8000b34:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b38:	b285      	uxth	r5, r0
 8000b3a:	2105      	movs	r1, #5
 8000b3c:	203c      	movs	r0, #60	; 0x3c
 8000b3e:	80a5      	strh	r5, [r4, #4]
 8000b40:	f001 fb33 	bl	80021aa <i2c_read_reg>
 8000b44:	2106      	movs	r1, #6
 8000b46:	4605      	mov	r5, r0
 8000b48:	203c      	movs	r0, #60	; 0x3c
 8000b4a:	f001 fb2e 	bl	80021aa <i2c_read_reg>
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
 8000b8a:	f001 f863 	bl	8001c54 <timer_delay_ms>
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
 8000bda:	f001 fae6 	bl	80021aa <i2c_read_reg>
 8000bde:	28d4      	cmp	r0, #212	; 0xd4
 8000be0:	4605      	mov	r5, r0
 8000be2:	d137      	bne.n	8000c54 <lsm9ds0_init+0xa0>
 8000be4:	203c      	movs	r0, #60	; 0x3c
 8000be6:	210f      	movs	r1, #15
 8000be8:	f001 fadf 	bl	80021aa <i2c_read_reg>
 8000bec:	2849      	cmp	r0, #73	; 0x49
 8000bee:	d133      	bne.n	8000c58 <lsm9ds0_init+0xa4>
 8000bf0:	4628      	mov	r0, r5
 8000bf2:	2120      	movs	r1, #32
 8000bf4:	22ff      	movs	r2, #255	; 0xff
 8000bf6:	f001 fac5 	bl	8002184 <i2c_write_reg>
 8000bfa:	4628      	mov	r0, r5
 8000bfc:	2123      	movs	r1, #35	; 0x23
 8000bfe:	2218      	movs	r2, #24
 8000c00:	f001 fac0 	bl	8002184 <i2c_write_reg>
 8000c04:	203c      	movs	r0, #60	; 0x3c
 8000c06:	211f      	movs	r1, #31
 8000c08:	4622      	mov	r2, r4
 8000c0a:	f001 fabb 	bl	8002184 <i2c_write_reg>
 8000c0e:	203c      	movs	r0, #60	; 0x3c
 8000c10:	2120      	movs	r1, #32
 8000c12:	2267      	movs	r2, #103	; 0x67
 8000c14:	f001 fab6 	bl	8002184 <i2c_write_reg>
 8000c18:	203c      	movs	r0, #60	; 0x3c
 8000c1a:	2121      	movs	r1, #33	; 0x21
 8000c1c:	4622      	mov	r2, r4
 8000c1e:	f001 fab1 	bl	8002184 <i2c_write_reg>
 8000c22:	203c      	movs	r0, #60	; 0x3c
 8000c24:	2124      	movs	r1, #36	; 0x24
 8000c26:	22f4      	movs	r2, #244	; 0xf4
 8000c28:	f001 faac 	bl	8002184 <i2c_write_reg>
 8000c2c:	203c      	movs	r0, #60	; 0x3c
 8000c2e:	2125      	movs	r1, #37	; 0x25
 8000c30:	4622      	mov	r2, r4
 8000c32:	f001 faa7 	bl	8002184 <i2c_write_reg>
 8000c36:	203c      	movs	r0, #60	; 0x3c
 8000c38:	2126      	movs	r1, #38	; 0x26
 8000c3a:	2280      	movs	r2, #128	; 0x80
 8000c3c:	f001 faa2 	bl	8002184 <i2c_write_reg>
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
 8000c64:	f001 fc12 	bl	800248c <led_off>
 8000c68:	2072      	movs	r0, #114	; 0x72
 8000c6a:	2180      	movs	r1, #128	; 0x80
 8000c6c:	2200      	movs	r2, #0
 8000c6e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000c72:	f000 bb5e 	b.w	8001332 <rgb_i2c_write_reg>
	...

08000c78 <rgb_sensor_read>:
 8000c78:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000c7a:	f000 fadb 	bl	8001234 <rgb_i2cStart>
 8000c7e:	2072      	movs	r0, #114	; 0x72
 8000c80:	4d70      	ldr	r5, [pc, #448]	; (8000e44 <rgb_sensor_read+0x1cc>)
 8000c82:	4c71      	ldr	r4, [pc, #452]	; (8000e48 <rgb_sensor_read+0x1d0>)
 8000c84:	f000 faf4 	bl	8001270 <rgb_i2cWrite>
 8000c88:	20b4      	movs	r0, #180	; 0xb4
 8000c8a:	f000 faf1 	bl	8001270 <rgb_i2cWrite>
 8000c8e:	f000 fad1 	bl	8001234 <rgb_i2cStart>
 8000c92:	2073      	movs	r0, #115	; 0x73
 8000c94:	f000 faec 	bl	8001270 <rgb_i2cWrite>
 8000c98:	2001      	movs	r0, #1
 8000c9a:	4629      	mov	r1, r5
 8000c9c:	f000 fb08 	bl	80012b0 <rgb_i2cRead>
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
 8000cb4:	f000 fafc 	bl	80012b0 <rgb_i2cRead>
 8000cb8:	2300      	movs	r3, #0
 8000cba:	f103 020c 	add.w	r2, r3, #12
 8000cbe:	5ce8      	ldrb	r0, [r5, r3]
 8000cc0:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000cc4:	4f60      	ldr	r7, [pc, #384]	; (8000e48 <rgb_sensor_read+0x1d0>)
 8000cc6:	4e5f      	ldr	r6, [pc, #380]	; (8000e44 <rgb_sensor_read+0x1cc>)
 8000cc8:	b289      	uxth	r1, r1
 8000cca:	3301      	adds	r3, #1
 8000ccc:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000cd0:	2b04      	cmp	r3, #4
 8000cd2:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000cd6:	d1f0      	bne.n	8000cba <rgb_sensor_read+0x42>
 8000cd8:	2001      	movs	r0, #1
 8000cda:	4631      	mov	r1, r6
 8000cdc:	f000 fae8 	bl	80012b0 <rgb_i2cRead>
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
 8000cf4:	f000 fadc 	bl	80012b0 <rgb_i2cRead>
 8000cf8:	2300      	movs	r3, #0
 8000cfa:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
 8000cfe:	5ce9      	ldrb	r1, [r5, r3]
 8000d00:	4f51      	ldr	r7, [pc, #324]	; (8000e48 <rgb_sensor_read+0x1d0>)
 8000d02:	4e50      	ldr	r6, [pc, #320]	; (8000e44 <rgb_sensor_read+0x1cc>)
 8000d04:	b292      	uxth	r2, r2
 8000d06:	ea42 2201 	orr.w	r2, r2, r1, lsl #8
 8000d0a:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
 8000d0e:	3301      	adds	r3, #1
 8000d10:	2b04      	cmp	r3, #4
 8000d12:	d1f2      	bne.n	8000cfa <rgb_sensor_read+0x82>
 8000d14:	2001      	movs	r0, #1
 8000d16:	4631      	mov	r1, r6
 8000d18:	f000 faca 	bl	80012b0 <rgb_i2cRead>
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
 8000d30:	f000 fabe 	bl	80012b0 <rgb_i2cRead>
 8000d34:	2300      	movs	r3, #0
 8000d36:	1d1a      	adds	r2, r3, #4
 8000d38:	5ce8      	ldrb	r0, [r5, r3]
 8000d3a:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d3e:	4f42      	ldr	r7, [pc, #264]	; (8000e48 <rgb_sensor_read+0x1d0>)
 8000d40:	4e40      	ldr	r6, [pc, #256]	; (8000e44 <rgb_sensor_read+0x1cc>)
 8000d42:	b289      	uxth	r1, r1
 8000d44:	3301      	adds	r3, #1
 8000d46:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d4a:	2b04      	cmp	r3, #4
 8000d4c:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d50:	d1f1      	bne.n	8000d36 <rgb_sensor_read+0xbe>
 8000d52:	2001      	movs	r0, #1
 8000d54:	4631      	mov	r1, r6
 8000d56:	f000 faab 	bl	80012b0 <rgb_i2cRead>
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
 8000d6e:	f000 fa9f 	bl	80012b0 <rgb_i2cRead>
 8000d72:	2300      	movs	r3, #0
 8000d74:	f103 0208 	add.w	r2, r3, #8
 8000d78:	5ce8      	ldrb	r0, [r5, r3]
 8000d7a:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d7e:	4f32      	ldr	r7, [pc, #200]	; (8000e48 <rgb_sensor_read+0x1d0>)
 8000d80:	4e30      	ldr	r6, [pc, #192]	; (8000e44 <rgb_sensor_read+0x1cc>)
 8000d82:	b289      	uxth	r1, r1
 8000d84:	3301      	adds	r3, #1
 8000d86:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d8a:	2b04      	cmp	r3, #4
 8000d8c:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d90:	d1f0      	bne.n	8000d74 <rgb_sensor_read+0xfc>
 8000d92:	2001      	movs	r0, #1
 8000d94:	4631      	mov	r1, r6
 8000d96:	f000 fa8b 	bl	80012b0 <rgb_i2cRead>
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
 8000dae:	f000 fa7f 	bl	80012b0 <rgb_i2cRead>
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
 8000dce:	f000 fa40 	bl	8001252 <rgb_i2cStop>
 8000dd2:	2300      	movs	r3, #0
 8000dd4:	1d1d      	adds	r5, r3, #4
 8000dd6:	f834 1013 	ldrh.w	r1, [r4, r3, lsl #1]
 8000dda:	f834 2015 	ldrh.w	r2, [r4, r5, lsl #1]
 8000dde:	f103 0008 	add.w	r0, r3, #8
 8000de2:	b212      	sxth	r2, r2
 8000de4:	fa02 f281 	sxtah	r2, r2, r1
 8000de8:	f834 1010 	ldrh.w	r1, [r4, r0, lsl #1]
 8000dec:	f834 7013 	ldrh.w	r7, [r4, r3, lsl #1]
 8000df0:	fa02 f281 	sxtah	r2, r2, r1
 8000df4:	b2bf      	uxth	r7, r7
 8000df6:	2164      	movs	r1, #100	; 0x64
 8000df8:	fb17 f701 	smulbb	r7, r7, r1
 8000dfc:	f103 0634 	add.w	r6, r3, #52	; 0x34
 8000e00:	fb97 f7f2 	sdiv	r7, r7, r2
 8000e04:	b2bf      	uxth	r7, r7
 8000e06:	f824 7016 	strh.w	r7, [r4, r6, lsl #1]
 8000e0a:	f834 6015 	ldrh.w	r6, [r4, r5, lsl #1]
 8000e0e:	b2b6      	uxth	r6, r6
 8000e10:	fb16 f601 	smulbb	r6, r6, r1
 8000e14:	fb96 f6f2 	sdiv	r6, r6, r2
 8000e18:	f103 0538 	add.w	r5, r3, #56	; 0x38
 8000e1c:	b2b6      	uxth	r6, r6
 8000e1e:	f824 6015 	strh.w	r6, [r4, r5, lsl #1]
 8000e22:	f834 0010 	ldrh.w	r0, [r4, r0, lsl #1]
 8000e26:	b280      	uxth	r0, r0
 8000e28:	fb10 f101 	smulbb	r1, r0, r1
 8000e2c:	fb91 f2f2 	sdiv	r2, r1, r2
 8000e30:	f103 003c 	add.w	r0, r3, #60	; 0x3c
 8000e34:	3301      	adds	r3, #1
 8000e36:	b292      	uxth	r2, r2
 8000e38:	2b04      	cmp	r3, #4
 8000e3a:	f824 2010 	strh.w	r2, [r4, r0, lsl #1]
 8000e3e:	d1c9      	bne.n	8000dd4 <rgb_sensor_read+0x15c>
 8000e40:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000e42:	bf00      	nop
 8000e44:	20000624 	.word	0x20000624
 8000e48:	20000188 	.word	0x20000188

08000e4c <rgb_sensor_init>:
 8000e4c:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000e4e:	2300      	movs	r3, #0
 8000e50:	4a2a      	ldr	r2, [pc, #168]	; (8000efc <rgb_sensor_init+0xb0>)
 8000e52:	1d19      	adds	r1, r3, #4
 8000e54:	2400      	movs	r4, #0
 8000e56:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8000e5a:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e5e:	f103 0108 	add.w	r1, r3, #8
 8000e62:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e66:	f103 0110 	add.w	r1, r3, #16
 8000e6a:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e6e:	f103 010c 	add.w	r1, r3, #12
 8000e72:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e76:	f103 0134 	add.w	r1, r3, #52	; 0x34
 8000e7a:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e7e:	f103 0138 	add.w	r1, r3, #56	; 0x38
 8000e82:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e86:	f103 013c 	add.w	r1, r3, #60	; 0x3c
 8000e8a:	3301      	adds	r3, #1
 8000e8c:	2b04      	cmp	r3, #4
 8000e8e:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e92:	d1dd      	bne.n	8000e50 <rgb_sensor_init+0x4>
 8000e94:	2008      	movs	r0, #8
 8000e96:	f001 fae3 	bl	8002460 <led_on>
 8000e9a:	f000 f99b 	bl	80011d4 <rgb_i2c_init>
 8000e9e:	2072      	movs	r0, #114	; 0x72
 8000ea0:	2181      	movs	r1, #129	; 0x81
 8000ea2:	22ff      	movs	r2, #255	; 0xff
 8000ea4:	f000 fa45 	bl	8001332 <rgb_i2c_write_reg>
 8000ea8:	2072      	movs	r0, #114	; 0x72
 8000eaa:	2183      	movs	r1, #131	; 0x83
 8000eac:	22ff      	movs	r2, #255	; 0xff
 8000eae:	f000 fa40 	bl	8001332 <rgb_i2c_write_reg>
 8000eb2:	2072      	movs	r0, #114	; 0x72
 8000eb4:	218d      	movs	r1, #141	; 0x8d
 8000eb6:	4622      	mov	r2, r4
 8000eb8:	f000 fa3b 	bl	8001332 <rgb_i2c_write_reg>
 8000ebc:	2072      	movs	r0, #114	; 0x72
 8000ebe:	2180      	movs	r1, #128	; 0x80
 8000ec0:	2203      	movs	r2, #3
 8000ec2:	f000 fa36 	bl	8001332 <rgb_i2c_write_reg>
 8000ec6:	ad01      	add	r5, sp, #4
 8000ec8:	2072      	movs	r0, #114	; 0x72
 8000eca:	218f      	movs	r1, #143	; 0x8f
 8000ecc:	2223      	movs	r2, #35	; 0x23
 8000ece:	f000 fa30 	bl	8001332 <rgb_i2c_write_reg>
 8000ed2:	f7ff fed1 	bl	8000c78 <rgb_sensor_read>
 8000ed6:	2072      	movs	r0, #114	; 0x72
 8000ed8:	2192      	movs	r1, #146	; 0x92
 8000eda:	462a      	mov	r2, r5
 8000edc:	f000 fa3c 	bl	8001358 <rgb_i2c_read_reg>
 8000ee0:	4620      	mov	r0, r4
 8000ee2:	4623      	mov	r3, r4
 8000ee4:	5cea      	ldrb	r2, [r5, r3]
 8000ee6:	2a69      	cmp	r2, #105	; 0x69
 8000ee8:	d002      	beq.n	8000ef0 <rgb_sensor_init+0xa4>
 8000eea:	2201      	movs	r2, #1
 8000eec:	409a      	lsls	r2, r3
 8000eee:	4310      	orrs	r0, r2
 8000ef0:	3301      	adds	r3, #1
 8000ef2:	2b04      	cmp	r3, #4
 8000ef4:	d1f6      	bne.n	8000ee4 <rgb_sensor_init+0x98>
 8000ef6:	b003      	add	sp, #12
 8000ef8:	bd30      	pop	{r4, r5, pc}
 8000efa:	bf00      	nop
 8000efc:	20000188 	.word	0x20000188

08000f00 <rgb_get_line_position>:
 8000f00:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
 8000f04:	4b54      	ldr	r3, [pc, #336]	; (8001058 <rgb_get_line_position+0x158>)
 8000f06:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
 8000f08:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
 8000f0c:	2100      	movs	r1, #0
 8000f0e:	466c      	mov	r4, sp
 8000f10:	460d      	mov	r5, r1
 8000f12:	460a      	mov	r2, r1
 8000f14:	4b51      	ldr	r3, [pc, #324]	; (800105c <rgb_get_line_position+0x15c>)
 8000f16:	f102 060c 	add.w	r6, r2, #12
 8000f1a:	f102 000a 	add.w	r0, r2, #10
 8000f1e:	f833 c016 	ldrh.w	ip, [r3, r6, lsl #1]
 8000f22:	f853 7020 	ldr.w	r7, [r3, r0, lsl #2]
 8000f26:	fa0f fc8c 	sxth.w	ip, ip
 8000f2a:	ebc7 0c0c 	rsb	ip, r7, ip
 8000f2e:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8000f32:	fb07 110c 	mla	r1, r7, ip, r1
 8000f36:	f833 7016 	ldrh.w	r7, [r3, r6, lsl #1]
 8000f3a:	f853 6020 	ldr.w	r6, [r3, r0, lsl #2]
 8000f3e:	3201      	adds	r2, #1
 8000f40:	b238      	sxth	r0, r7
 8000f42:	1b80      	subs	r0, r0, r6
 8000f44:	2a04      	cmp	r2, #4
 8000f46:	4405      	add	r5, r0
 8000f48:	d1e4      	bne.n	8000f14 <rgb_get_line_position+0x14>
 8000f4a:	4845      	ldr	r0, [pc, #276]	; (8001060 <rgb_get_line_position+0x160>)
 8000f4c:	2200      	movs	r2, #0
 8000f4e:	2d14      	cmp	r5, #20
 8000f50:	7402      	strb	r2, [r0, #16]
 8000f52:	dd05      	ble.n	8000f60 <rgb_get_line_position+0x60>
 8000f54:	fb91 f1f5 	sdiv	r1, r1, r5
 8000f58:	2201      	movs	r2, #1
 8000f5a:	3947      	subs	r1, #71	; 0x47
 8000f5c:	7402      	strb	r2, [r0, #16]
 8000f5e:	6001      	str	r1, [r0, #0]
 8000f60:	2100      	movs	r1, #0
 8000f62:	460d      	mov	r5, r1
 8000f64:	460a      	mov	r2, r1
 8000f66:	f102 060e 	add.w	r6, r2, #14
 8000f6a:	f833 c012 	ldrh.w	ip, [r3, r2, lsl #1]
 8000f6e:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000f72:	fa0f fc8c 	sxth.w	ip, ip
 8000f76:	ebc7 0c0c 	rsb	ip, r7, ip
 8000f7a:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8000f7e:	fb07 110c 	mla	r1, r7, ip, r1
 8000f82:	f833 c012 	ldrh.w	ip, [r3, r2, lsl #1]
 8000f86:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000f8a:	3201      	adds	r2, #1
 8000f8c:	fa0f f68c 	sxth.w	r6, ip
 8000f90:	1bf6      	subs	r6, r6, r7
 8000f92:	2a04      	cmp	r2, #4
 8000f94:	4435      	add	r5, r6
 8000f96:	d1e6      	bne.n	8000f66 <rgb_get_line_position+0x66>
 8000f98:	2600      	movs	r6, #0
 8000f9a:	2d28      	cmp	r5, #40	; 0x28
 8000f9c:	4a30      	ldr	r2, [pc, #192]	; (8001060 <rgb_get_line_position+0x160>)
 8000f9e:	7446      	strb	r6, [r0, #17]
 8000fa0:	dd05      	ble.n	8000fae <rgb_get_line_position+0xae>
 8000fa2:	fb91 f1f5 	sdiv	r1, r1, r5
 8000fa6:	2601      	movs	r6, #1
 8000fa8:	3947      	subs	r1, #71	; 0x47
 8000faa:	7456      	strb	r6, [r2, #17]
 8000fac:	6051      	str	r1, [r2, #4]
 8000fae:	2100      	movs	r1, #0
 8000fb0:	460d      	mov	r5, r1
 8000fb2:	460a      	mov	r2, r1
 8000fb4:	f102 0c04 	add.w	ip, r2, #4
 8000fb8:	f102 0612 	add.w	r6, r2, #18
 8000fbc:	f833 801c 	ldrh.w	r8, [r3, ip, lsl #1]
 8000fc0:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000fc4:	f833 c01c 	ldrh.w	ip, [r3, ip, lsl #1]
 8000fc8:	fa0f f888 	sxth.w	r8, r8
 8000fcc:	ebc7 0808 	rsb	r8, r7, r8
 8000fd0:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8000fd4:	fb07 1108 	mla	r1, r7, r8, r1
 8000fd8:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000fdc:	3201      	adds	r2, #1
 8000fde:	fa0f f68c 	sxth.w	r6, ip
 8000fe2:	1bf6      	subs	r6, r6, r7
 8000fe4:	2a04      	cmp	r2, #4
 8000fe6:	4435      	add	r5, r6
 8000fe8:	d1e4      	bne.n	8000fb4 <rgb_get_line_position+0xb4>
 8000fea:	2600      	movs	r6, #0
 8000fec:	2d0a      	cmp	r5, #10
 8000fee:	4a1c      	ldr	r2, [pc, #112]	; (8001060 <rgb_get_line_position+0x160>)
 8000ff0:	7486      	strb	r6, [r0, #18]
 8000ff2:	dd05      	ble.n	8001000 <rgb_get_line_position+0x100>
 8000ff4:	fb91 f1f5 	sdiv	r1, r1, r5
 8000ff8:	2601      	movs	r6, #1
 8000ffa:	3947      	subs	r1, #71	; 0x47
 8000ffc:	7496      	strb	r6, [r2, #18]
 8000ffe:	6091      	str	r1, [r2, #8]
 8001000:	2100      	movs	r1, #0
 8001002:	460d      	mov	r5, r1
 8001004:	460a      	mov	r2, r1
 8001006:	f102 0c08 	add.w	ip, r2, #8
 800100a:	f102 0616 	add.w	r6, r2, #22
 800100e:	f833 801c 	ldrh.w	r8, [r3, ip, lsl #1]
 8001012:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8001016:	f833 c01c 	ldrh.w	ip, [r3, ip, lsl #1]
 800101a:	fa0f f888 	sxth.w	r8, r8
 800101e:	ebc7 0808 	rsb	r8, r7, r8
 8001022:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8001026:	fb07 1108 	mla	r1, r7, r8, r1
 800102a:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 800102e:	3201      	adds	r2, #1
 8001030:	fa0f f68c 	sxth.w	r6, ip
 8001034:	1bf6      	subs	r6, r6, r7
 8001036:	2a04      	cmp	r2, #4
 8001038:	4435      	add	r5, r6
 800103a:	d1e4      	bne.n	8001006 <rgb_get_line_position+0x106>
 800103c:	2200      	movs	r2, #0
 800103e:	2d0a      	cmp	r5, #10
 8001040:	4b07      	ldr	r3, [pc, #28]	; (8001060 <rgb_get_line_position+0x160>)
 8001042:	74c2      	strb	r2, [r0, #19]
 8001044:	dd05      	ble.n	8001052 <rgb_get_line_position+0x152>
 8001046:	fb91 f1f5 	sdiv	r1, r1, r5
 800104a:	2201      	movs	r2, #1
 800104c:	3947      	subs	r1, #71	; 0x47
 800104e:	74da      	strb	r2, [r3, #19]
 8001050:	60d9      	str	r1, [r3, #12]
 8001052:	b004      	add	sp, #16
 8001054:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001058:	080026ec 	.word	0x080026ec
 800105c:	20000188 	.word	0x20000188
 8001060:	20000610 	.word	0x20000610

08001064 <rgb_set_background>:
 8001064:	b530      	push	{r4, r5, lr}
 8001066:	2200      	movs	r2, #0
 8001068:	4b37      	ldr	r3, [pc, #220]	; (8001148 <rgb_set_background+0xe4>)
 800106a:	f102 000a 	add.w	r0, r2, #10
 800106e:	2100      	movs	r1, #0
 8001070:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 8001074:	f102 000e 	add.w	r0, r2, #14
 8001078:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 800107c:	f102 0016 	add.w	r0, r2, #22
 8001080:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 8001084:	f102 0012 	add.w	r0, r2, #18
 8001088:	3201      	adds	r2, #1
 800108a:	2a04      	cmp	r2, #4
 800108c:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 8001090:	d1ea      	bne.n	8001068 <rgb_set_background+0x4>
 8001092:	2164      	movs	r1, #100	; 0x64
 8001094:	2200      	movs	r2, #0
 8001096:	f102 000a 	add.w	r0, r2, #10
 800109a:	f102 050c 	add.w	r5, r2, #12
 800109e:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 80010a2:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 80010a6:	fa04 f485 	sxtah	r4, r4, r5
 80010aa:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 80010ae:	f102 000e 	add.w	r0, r2, #14
 80010b2:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 80010b6:	f833 5012 	ldrh.w	r5, [r3, r2, lsl #1]
 80010ba:	fa04 f485 	sxtah	r4, r4, r5
 80010be:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 80010c2:	1d15      	adds	r5, r2, #4
 80010c4:	f102 0016 	add.w	r0, r2, #22
 80010c8:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 80010cc:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 80010d0:	fa04 f485 	sxtah	r4, r4, r5
 80010d4:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 80010d8:	f102 0508 	add.w	r5, r2, #8
 80010dc:	f102 0012 	add.w	r0, r2, #18
 80010e0:	3201      	adds	r2, #1
 80010e2:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 80010e6:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 80010ea:	2a04      	cmp	r2, #4
 80010ec:	fa04 f485 	sxtah	r4, r4, r5
 80010f0:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 80010f4:	d1cf      	bne.n	8001096 <rgb_set_background+0x32>
 80010f6:	3901      	subs	r1, #1
 80010f8:	d1cc      	bne.n	8001094 <rgb_set_background+0x30>
 80010fa:	460a      	mov	r2, r1
 80010fc:	f102 000a 	add.w	r0, r2, #10
 8001100:	2164      	movs	r1, #100	; 0x64
 8001102:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001106:	fb94 f4f1 	sdiv	r4, r4, r1
 800110a:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 800110e:	f102 000e 	add.w	r0, r2, #14
 8001112:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001116:	fb94 f4f1 	sdiv	r4, r4, r1
 800111a:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 800111e:	f102 0016 	add.w	r0, r2, #22
 8001122:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001126:	fb94 f4f1 	sdiv	r4, r4, r1
 800112a:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 800112e:	f102 0012 	add.w	r0, r2, #18
 8001132:	3201      	adds	r2, #1
 8001134:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001138:	2a04      	cmp	r2, #4
 800113a:	fb94 f1f1 	sdiv	r1, r4, r1
 800113e:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 8001142:	d1db      	bne.n	80010fc <rgb_set_background+0x98>
 8001144:	bd30      	pop	{r4, r5, pc}
 8001146:	bf00      	nop
 8001148:	20000188 	.word	0x20000188

0800114c <rgb_i2c_delay>:
 800114c:	bf00      	nop
 800114e:	4770      	bx	lr

08001150 <RGBSetLowSDA>:
 8001150:	b513      	push	{r0, r1, r4, lr}
 8001152:	2301      	movs	r3, #1
 8001154:	2203      	movs	r2, #3
 8001156:	24f0      	movs	r4, #240	; 0xf0
 8001158:	f88d 3004 	strb.w	r3, [sp, #4]
 800115c:	f88d 3006 	strb.w	r3, [sp, #6]
 8001160:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001164:	2300      	movs	r3, #0
 8001166:	4669      	mov	r1, sp
 8001168:	f88d 2005 	strb.w	r2, [sp, #5]
 800116c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001170:	9400      	str	r4, [sp, #0]
 8001172:	f001 f910 	bl	8002396 <GPIO_Init>
 8001176:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800117a:	851c      	strh	r4, [r3, #40]	; 0x28
 800117c:	f7ff ffe6 	bl	800114c <rgb_i2c_delay>
 8001180:	b002      	add	sp, #8
 8001182:	bd10      	pop	{r4, pc}

08001184 <RGBSetHighSDA>:
 8001184:	b513      	push	{r0, r1, r4, lr}
 8001186:	2300      	movs	r3, #0
 8001188:	2203      	movs	r2, #3
 800118a:	24f0      	movs	r4, #240	; 0xf0
 800118c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001190:	4669      	mov	r1, sp
 8001192:	f88d 3004 	strb.w	r3, [sp, #4]
 8001196:	f88d 2005 	strb.w	r2, [sp, #5]
 800119a:	f88d 3007 	strb.w	r3, [sp, #7]
 800119e:	9400      	str	r4, [sp, #0]
 80011a0:	f001 f8f9 	bl	8002396 <GPIO_Init>
 80011a4:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80011a8:	619c      	str	r4, [r3, #24]
 80011aa:	f7ff ffcf 	bl	800114c <rgb_i2c_delay>
 80011ae:	b002      	add	sp, #8
 80011b0:	bd10      	pop	{r4, pc}
	...

080011b4 <RGBSetLowSCL>:
 80011b4:	4b02      	ldr	r3, [pc, #8]	; (80011c0 <RGBSetLowSCL+0xc>)
 80011b6:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 80011ba:	851a      	strh	r2, [r3, #40]	; 0x28
 80011bc:	f7ff bfc6 	b.w	800114c <rgb_i2c_delay>
 80011c0:	48000800 	.word	0x48000800

080011c4 <RGBSetHighSCL>:
 80011c4:	4b02      	ldr	r3, [pc, #8]	; (80011d0 <RGBSetHighSCL+0xc>)
 80011c6:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 80011ca:	619a      	str	r2, [r3, #24]
 80011cc:	f7ff bfbe 	b.w	800114c <rgb_i2c_delay>
 80011d0:	48000800 	.word	0x48000800

080011d4 <rgb_i2c_init>:
 80011d4:	b573      	push	{r0, r1, r4, r5, r6, lr}
 80011d6:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 80011da:	2400      	movs	r4, #0
 80011dc:	9300      	str	r3, [sp, #0]
 80011de:	2603      	movs	r6, #3
 80011e0:	2301      	movs	r3, #1
 80011e2:	4669      	mov	r1, sp
 80011e4:	4812      	ldr	r0, [pc, #72]	; (8001230 <rgb_i2c_init+0x5c>)
 80011e6:	f88d 3004 	strb.w	r3, [sp, #4]
 80011ea:	25f0      	movs	r5, #240	; 0xf0
 80011ec:	f88d 6005 	strb.w	r6, [sp, #5]
 80011f0:	f88d 4006 	strb.w	r4, [sp, #6]
 80011f4:	f88d 4007 	strb.w	r4, [sp, #7]
 80011f8:	f001 f8cd 	bl	8002396 <GPIO_Init>
 80011fc:	4669      	mov	r1, sp
 80011fe:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001202:	9500      	str	r5, [sp, #0]
 8001204:	f88d 4004 	strb.w	r4, [sp, #4]
 8001208:	f88d 6005 	strb.w	r6, [sp, #5]
 800120c:	f88d 4007 	strb.w	r4, [sp, #7]
 8001210:	f001 f8c1 	bl	8002396 <GPIO_Init>
 8001214:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001218:	4629      	mov	r1, r5
 800121a:	f001 f902 	bl	8002422 <GPIO_SetBits>
 800121e:	f7ff ffd1 	bl	80011c4 <RGBSetHighSCL>
 8001222:	f7ff ff95 	bl	8001150 <RGBSetLowSDA>
 8001226:	f7ff ffad 	bl	8001184 <RGBSetHighSDA>
 800122a:	b002      	add	sp, #8
 800122c:	bd70      	pop	{r4, r5, r6, pc}
 800122e:	bf00      	nop
 8001230:	48000800 	.word	0x48000800

08001234 <rgb_i2cStart>:
 8001234:	b508      	push	{r3, lr}
 8001236:	f7ff ffc5 	bl	80011c4 <RGBSetHighSCL>
 800123a:	f7ff ffa3 	bl	8001184 <RGBSetHighSDA>
 800123e:	f7ff ffc1 	bl	80011c4 <RGBSetHighSCL>
 8001242:	f7ff ff85 	bl	8001150 <RGBSetLowSDA>
 8001246:	f7ff ffb5 	bl	80011b4 <RGBSetLowSCL>
 800124a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800124e:	f7ff bf99 	b.w	8001184 <RGBSetHighSDA>

08001252 <rgb_i2cStop>:
 8001252:	b508      	push	{r3, lr}
 8001254:	f7ff ffae 	bl	80011b4 <RGBSetLowSCL>
 8001258:	f7ff ff7a 	bl	8001150 <RGBSetLowSDA>
 800125c:	f7ff ffb2 	bl	80011c4 <RGBSetHighSCL>
 8001260:	f7ff ff76 	bl	8001150 <RGBSetLowSDA>
 8001264:	f7ff ffae 	bl	80011c4 <RGBSetHighSCL>
 8001268:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800126c:	f7ff bf8a 	b.w	8001184 <RGBSetHighSDA>

08001270 <rgb_i2cWrite>:
 8001270:	b538      	push	{r3, r4, r5, lr}
 8001272:	4604      	mov	r4, r0
 8001274:	2508      	movs	r5, #8
 8001276:	f7ff ff9d 	bl	80011b4 <RGBSetLowSCL>
 800127a:	0623      	lsls	r3, r4, #24
 800127c:	d502      	bpl.n	8001284 <rgb_i2cWrite+0x14>
 800127e:	f7ff ff81 	bl	8001184 <RGBSetHighSDA>
 8001282:	e001      	b.n	8001288 <rgb_i2cWrite+0x18>
 8001284:	f7ff ff64 	bl	8001150 <RGBSetLowSDA>
 8001288:	3d01      	subs	r5, #1
 800128a:	f7ff ff9b 	bl	80011c4 <RGBSetHighSCL>
 800128e:	0064      	lsls	r4, r4, #1
 8001290:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001294:	b2e4      	uxtb	r4, r4
 8001296:	d1ee      	bne.n	8001276 <rgb_i2cWrite+0x6>
 8001298:	f7ff ff8c 	bl	80011b4 <RGBSetLowSCL>
 800129c:	f7ff ff72 	bl	8001184 <RGBSetHighSDA>
 80012a0:	f7ff ff90 	bl	80011c4 <RGBSetHighSCL>
 80012a4:	f7ff ff86 	bl	80011b4 <RGBSetLowSCL>
 80012a8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80012ac:	f7ff bf4e 	b.w	800114c <rgb_i2c_delay>

080012b0 <rgb_i2cRead>:
 80012b0:	2300      	movs	r3, #0
 80012b2:	b570      	push	{r4, r5, r6, lr}
 80012b4:	700b      	strb	r3, [r1, #0]
 80012b6:	704b      	strb	r3, [r1, #1]
 80012b8:	708b      	strb	r3, [r1, #2]
 80012ba:	70cb      	strb	r3, [r1, #3]
 80012bc:	4606      	mov	r6, r0
 80012be:	460c      	mov	r4, r1
 80012c0:	f7ff ff78 	bl	80011b4 <RGBSetLowSCL>
 80012c4:	f7ff ff5e 	bl	8001184 <RGBSetHighSDA>
 80012c8:	2508      	movs	r5, #8
 80012ca:	2300      	movs	r3, #0
 80012cc:	5ce2      	ldrb	r2, [r4, r3]
 80012ce:	0052      	lsls	r2, r2, #1
 80012d0:	54e2      	strb	r2, [r4, r3]
 80012d2:	3301      	adds	r3, #1
 80012d4:	2b04      	cmp	r3, #4
 80012d6:	d1f9      	bne.n	80012cc <rgb_i2cRead+0x1c>
 80012d8:	f7ff ff74 	bl	80011c4 <RGBSetHighSCL>
 80012dc:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80012e0:	8a1b      	ldrh	r3, [r3, #16]
 80012e2:	b29b      	uxth	r3, r3
 80012e4:	06da      	lsls	r2, r3, #27
 80012e6:	d503      	bpl.n	80012f0 <rgb_i2cRead+0x40>
 80012e8:	7822      	ldrb	r2, [r4, #0]
 80012ea:	f042 0201 	orr.w	r2, r2, #1
 80012ee:	7022      	strb	r2, [r4, #0]
 80012f0:	0698      	lsls	r0, r3, #26
 80012f2:	d503      	bpl.n	80012fc <rgb_i2cRead+0x4c>
 80012f4:	7862      	ldrb	r2, [r4, #1]
 80012f6:	f042 0201 	orr.w	r2, r2, #1
 80012fa:	7062      	strb	r2, [r4, #1]
 80012fc:	0659      	lsls	r1, r3, #25
 80012fe:	d503      	bpl.n	8001308 <rgb_i2cRead+0x58>
 8001300:	78a2      	ldrb	r2, [r4, #2]
 8001302:	f042 0201 	orr.w	r2, r2, #1
 8001306:	70a2      	strb	r2, [r4, #2]
 8001308:	061a      	lsls	r2, r3, #24
 800130a:	d503      	bpl.n	8001314 <rgb_i2cRead+0x64>
 800130c:	78e3      	ldrb	r3, [r4, #3]
 800130e:	f043 0301 	orr.w	r3, r3, #1
 8001312:	70e3      	strb	r3, [r4, #3]
 8001314:	f7ff ff4e 	bl	80011b4 <RGBSetLowSCL>
 8001318:	3d01      	subs	r5, #1
 800131a:	d1d6      	bne.n	80012ca <rgb_i2cRead+0x1a>
 800131c:	b10e      	cbz	r6, 8001322 <rgb_i2cRead+0x72>
 800131e:	f7ff ff17 	bl	8001150 <RGBSetLowSDA>
 8001322:	f7ff ff4f 	bl	80011c4 <RGBSetHighSCL>
 8001326:	f7ff ff45 	bl	80011b4 <RGBSetLowSCL>
 800132a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800132e:	f7ff bf0d 	b.w	800114c <rgb_i2c_delay>

08001332 <rgb_i2c_write_reg>:
 8001332:	b570      	push	{r4, r5, r6, lr}
 8001334:	4605      	mov	r5, r0
 8001336:	460c      	mov	r4, r1
 8001338:	4616      	mov	r6, r2
 800133a:	f7ff ff7b 	bl	8001234 <rgb_i2cStart>
 800133e:	4628      	mov	r0, r5
 8001340:	f7ff ff96 	bl	8001270 <rgb_i2cWrite>
 8001344:	4620      	mov	r0, r4
 8001346:	f7ff ff93 	bl	8001270 <rgb_i2cWrite>
 800134a:	4630      	mov	r0, r6
 800134c:	f7ff ff90 	bl	8001270 <rgb_i2cWrite>
 8001350:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001354:	f7ff bf7d 	b.w	8001252 <rgb_i2cStop>

08001358 <rgb_i2c_read_reg>:
 8001358:	b570      	push	{r4, r5, r6, lr}
 800135a:	4604      	mov	r4, r0
 800135c:	460d      	mov	r5, r1
 800135e:	4616      	mov	r6, r2
 8001360:	f7ff ff68 	bl	8001234 <rgb_i2cStart>
 8001364:	4620      	mov	r0, r4
 8001366:	f7ff ff83 	bl	8001270 <rgb_i2cWrite>
 800136a:	4628      	mov	r0, r5
 800136c:	f7ff ff80 	bl	8001270 <rgb_i2cWrite>
 8001370:	f7ff ff60 	bl	8001234 <rgb_i2cStart>
 8001374:	f044 0001 	orr.w	r0, r4, #1
 8001378:	f7ff ff7a 	bl	8001270 <rgb_i2cWrite>
 800137c:	4631      	mov	r1, r6
 800137e:	2000      	movs	r0, #0
 8001380:	f7ff ff96 	bl	80012b0 <rgb_i2cRead>
 8001384:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001388:	f7ff bf63 	b.w	8001252 <rgb_i2cStop>

0800138c <device_sleep>:
 800138c:	4b01      	ldr	r3, [pc, #4]	; (8001394 <device_sleep+0x8>)
 800138e:	22ff      	movs	r2, #255	; 0xff
 8001390:	701a      	strb	r2, [r3, #0]
 8001392:	4770      	bx	lr
 8001394:	20000030 	.word	0x20000030

08001398 <device_wake_up>:
 8001398:	4b01      	ldr	r3, [pc, #4]	; (80013a0 <device_wake_up+0x8>)
 800139a:	2200      	movs	r2, #0
 800139c:	701a      	strb	r2, [r3, #0]
 800139e:	4770      	bx	lr
 80013a0:	20000030 	.word	0x20000030

080013a4 <device_i2c_thread>:
 80013a4:	b538      	push	{r3, r4, r5, lr}
 80013a6:	2000      	movs	r0, #0
 80013a8:	210a      	movs	r1, #10
 80013aa:	f000 fc63 	bl	8001c74 <event_timer_set_period>
 80013ae:	2501      	movs	r5, #1
 80013b0:	2400      	movs	r4, #0
 80013b2:	2c01      	cmp	r4, #1
 80013b4:	d017      	beq.n	80013e6 <device_i2c_thread+0x42>
 80013b6:	d30f      	bcc.n	80013d8 <device_i2c_thread+0x34>
 80013b8:	2c02      	cmp	r4, #2
 80013ba:	d1fa      	bne.n	80013b2 <device_i2c_thread+0xe>
 80013bc:	f7ff fb20 	bl	8000a00 <lsm9ds0_uninit>
 80013c0:	f7ff fa88 	bl	80008d4 <motors_uninit>
 80013c4:	2064      	movs	r0, #100	; 0x64
 80013c6:	f000 fc45 	bl	8001c54 <timer_delay_ms>
 80013ca:	4b0d      	ldr	r3, [pc, #52]	; (8001400 <device_i2c_thread+0x5c>)
 80013cc:	781c      	ldrb	r4, [r3, #0]
 80013ce:	2c00      	cmp	r4, #0
 80013d0:	bf14      	ite	ne
 80013d2:	2402      	movne	r4, #2
 80013d4:	2400      	moveq	r4, #0
 80013d6:	e7ec      	b.n	80013b2 <device_i2c_thread+0xe>
 80013d8:	f7ff faec 	bl	80009b4 <motors_init>
 80013dc:	4628      	mov	r0, r5
 80013de:	f7ff fbe9 	bl	8000bb4 <lsm9ds0_init>
 80013e2:	2500      	movs	r5, #0
 80013e4:	2401      	movs	r4, #1
 80013e6:	2000      	movs	r0, #0
 80013e8:	f000 fc5a 	bl	8001ca0 <event_timer_wait>
 80013ec:	f7ff fb1a 	bl	8000a24 <lsm9ds0_read>
 80013f0:	f7ff fa7e 	bl	80008f0 <motors_update>
 80013f4:	4b02      	ldr	r3, [pc, #8]	; (8001400 <device_i2c_thread+0x5c>)
 80013f6:	781b      	ldrb	r3, [r3, #0]
 80013f8:	2b00      	cmp	r3, #0
 80013fa:	bf18      	it	ne
 80013fc:	2402      	movne	r4, #2
 80013fe:	e7d8      	b.n	80013b2 <device_i2c_thread+0xe>
 8001400:	20000030 	.word	0x20000030

08001404 <device_rgb_sensors_thread>:
 8001404:	b510      	push	{r4, lr}
 8001406:	2001      	movs	r0, #1
 8001408:	210a      	movs	r1, #10
 800140a:	f000 fc33 	bl	8001c74 <event_timer_set_period>
 800140e:	2400      	movs	r4, #0
 8001410:	2001      	movs	r0, #1
 8001412:	f000 fc45 	bl	8001ca0 <event_timer_wait>
 8001416:	2c01      	cmp	r4, #1
 8001418:	d01a      	beq.n	8001450 <device_rgb_sensors_thread+0x4c>
 800141a:	d30d      	bcc.n	8001438 <device_rgb_sensors_thread+0x34>
 800141c:	2c02      	cmp	r4, #2
 800141e:	d1f7      	bne.n	8001410 <device_rgb_sensors_thread+0xc>
 8001420:	f7ff fc1e 	bl	8000c60 <rgb_sensor_uninit>
 8001424:	2064      	movs	r0, #100	; 0x64
 8001426:	f000 fc15 	bl	8001c54 <timer_delay_ms>
 800142a:	4b0d      	ldr	r3, [pc, #52]	; (8001460 <device_rgb_sensors_thread+0x5c>)
 800142c:	781c      	ldrb	r4, [r3, #0]
 800142e:	2c00      	cmp	r4, #0
 8001430:	bf14      	ite	ne
 8001432:	2402      	movne	r4, #2
 8001434:	2400      	moveq	r4, #0
 8001436:	e7eb      	b.n	8001410 <device_rgb_sensors_thread+0xc>
 8001438:	f7ff fd08 	bl	8000e4c <rgb_sensor_init>
 800143c:	4604      	mov	r4, r0
 800143e:	b128      	cbz	r0, 800144c <device_rgb_sensors_thread+0x48>
 8001440:	f7ff fc0e 	bl	8000c60 <rgb_sensor_uninit>
 8001444:	2001      	movs	r0, #1
 8001446:	4621      	mov	r1, r4
 8001448:	f000 f852 	bl	80014f0 <abort_error_>
 800144c:	2401      	movs	r4, #1
 800144e:	e7df      	b.n	8001410 <device_rgb_sensors_thread+0xc>
 8001450:	f7ff fc12 	bl	8000c78 <rgb_sensor_read>
 8001454:	4b02      	ldr	r3, [pc, #8]	; (8001460 <device_rgb_sensors_thread+0x5c>)
 8001456:	781b      	ldrb	r3, [r3, #0]
 8001458:	2b00      	cmp	r3, #0
 800145a:	d0f7      	beq.n	800144c <device_rgb_sensors_thread+0x48>
 800145c:	2402      	movs	r4, #2
 800145e:	e7d7      	b.n	8001410 <device_rgb_sensors_thread+0xc>
 8001460:	20000030 	.word	0x20000030

08001464 <device_wifi_thread>:
 8001464:	b570      	push	{r4, r5, r6, lr}
 8001466:	4b1f      	ldr	r3, [pc, #124]	; (80014e4 <device_wifi_thread+0x80>)
 8001468:	b0a6      	sub	sp, #152	; 0x98
 800146a:	ac02      	add	r4, sp, #8
 800146c:	f103 0210 	add.w	r2, r3, #16
 8001470:	4626      	mov	r6, r4
 8001472:	6818      	ldr	r0, [r3, #0]
 8001474:	6859      	ldr	r1, [r3, #4]
 8001476:	4625      	mov	r5, r4
 8001478:	c503      	stmia	r5!, {r0, r1}
 800147a:	3308      	adds	r3, #8
 800147c:	4293      	cmp	r3, r2
 800147e:	462c      	mov	r4, r5
 8001480:	d1f7      	bne.n	8001472 <device_wifi_thread+0xe>
 8001482:	4630      	mov	r0, r6
 8001484:	f7fe ffac 	bl	80003e0 <strlen_>
 8001488:	2100      	movs	r1, #0
 800148a:	4605      	mov	r5, r0
 800148c:	2901      	cmp	r1, #1
 800148e:	d01c      	beq.n	80014ca <device_wifi_thread+0x66>
 8001490:	d30d      	bcc.n	80014ae <device_wifi_thread+0x4a>
 8001492:	2900      	cmp	r1, #0
 8001494:	d0fa      	beq.n	800148c <device_wifi_thread+0x28>
 8001496:	f7ff f969 	bl	800076c <esp8266_uninit>
 800149a:	2064      	movs	r0, #100	; 0x64
 800149c:	f000 fbda 	bl	8001c54 <timer_delay_ms>
 80014a0:	4b11      	ldr	r3, [pc, #68]	; (80014e8 <device_wifi_thread+0x84>)
 80014a2:	7819      	ldrb	r1, [r3, #0]
 80014a4:	2900      	cmp	r1, #0
 80014a6:	bf14      	ite	ne
 80014a8:	2102      	movne	r1, #2
 80014aa:	2100      	moveq	r1, #0
 80014ac:	e7ee      	b.n	800148c <device_wifi_thread+0x28>
 80014ae:	2001      	movs	r0, #1
 80014b0:	f000 ffd6 	bl	8002460 <led_on>
 80014b4:	2000      	movs	r0, #0
 80014b6:	f7ff f90d 	bl	80006d4 <esp8266_init>
 80014ba:	4604      	mov	r4, r0
 80014bc:	b128      	cbz	r0, 80014ca <device_wifi_thread+0x66>
 80014be:	f7ff f955 	bl	800076c <esp8266_uninit>
 80014c2:	2003      	movs	r0, #3
 80014c4:	4621      	mov	r1, r4
 80014c6:	f000 f813 	bl	80014f0 <abort_error_>
 80014ca:	ab06      	add	r3, sp, #24
 80014cc:	9300      	str	r3, [sp, #0]
 80014ce:	2380      	movs	r3, #128	; 0x80
 80014d0:	9301      	str	r3, [sp, #4]
 80014d2:	f240 71da 	movw	r1, #2010	; 0x7da
 80014d6:	4632      	mov	r2, r6
 80014d8:	462b      	mov	r3, r5
 80014da:	4804      	ldr	r0, [pc, #16]	; (80014ec <device_wifi_thread+0x88>)
 80014dc:	f7ff f972 	bl	80007c4 <esp8266_connect>
 80014e0:	e7f3      	b.n	80014ca <device_wifi_thread+0x66>
 80014e2:	bf00      	nop
 80014e4:	08002708 	.word	0x08002708
 80014e8:	20000030 	.word	0x20000030
 80014ec:	080026fc 	.word	0x080026fc

080014f0 <abort_error_>:
 80014f0:	b570      	push	{r4, r5, r6, lr}
 80014f2:	4605      	mov	r5, r0
 80014f4:	460e      	mov	r6, r1
 80014f6:	480d      	ldr	r0, [pc, #52]	; (800152c <abort_error_+0x3c>)
 80014f8:	4629      	mov	r1, r5
 80014fa:	4632      	mov	r2, r6
 80014fc:	f7fe fff2 	bl	80004e4 <printf_>
 8001500:	2408      	movs	r4, #8
 8001502:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001506:	f000 ffab 	bl	8002460 <led_on>
 800150a:	201e      	movs	r0, #30
 800150c:	f000 fba2 	bl	8001c54 <timer_delay_ms>
 8001510:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001514:	f000 ffba 	bl	800248c <led_off>
 8001518:	2046      	movs	r0, #70	; 0x46
 800151a:	f000 fb9b 	bl	8001c54 <timer_delay_ms>
 800151e:	3c01      	subs	r4, #1
 8001520:	d1ef      	bne.n	8001502 <abort_error_+0x12>
 8001522:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8001526:	f000 fb95 	bl	8001c54 <timer_delay_ms>
 800152a:	e7e4      	b.n	80014f6 <abort_error_+0x6>
 800152c:	08002718 	.word	0x08002718

08001530 <line_follower_test>:
 8001530:	b510      	push	{r4, lr}
 8001532:	ed2d 8b06 	vpush	{d8-d10}
 8001536:	eddf 8a38 	vldr	s17, [pc, #224]	; 8001618 <line_follower_test+0xe8>
 800153a:	4604      	mov	r4, r0
 800153c:	eeb0 9a68 	vmov.f32	s18, s17
 8001540:	eef0 9a68 	vmov.f32	s19, s17
 8001544:	f7ff fcdc 	bl	8000f00 <rgb_get_line_position>
 8001548:	2c03      	cmp	r4, #3
 800154a:	d81b      	bhi.n	8001584 <line_follower_test+0x54>
 800154c:	e8df f004 	tbb	[pc, r4]
 8001550:	0e0a0602 	.word	0x0e0a0602
 8001554:	4b31      	ldr	r3, [pc, #196]	; (800161c <line_follower_test+0xec>)
 8001556:	ed93 8a00 	vldr	s16, [r3]
 800155a:	e00a      	b.n	8001572 <line_follower_test+0x42>
 800155c:	4b2f      	ldr	r3, [pc, #188]	; (800161c <line_follower_test+0xec>)
 800155e:	ed93 8a01 	vldr	s16, [r3, #4]
 8001562:	e006      	b.n	8001572 <line_follower_test+0x42>
 8001564:	4b2d      	ldr	r3, [pc, #180]	; (800161c <line_follower_test+0xec>)
 8001566:	ed93 8a02 	vldr	s16, [r3, #8]
 800156a:	e002      	b.n	8001572 <line_follower_test+0x42>
 800156c:	4b2b      	ldr	r3, [pc, #172]	; (800161c <line_follower_test+0xec>)
 800156e:	ed93 8a03 	vldr	s16, [r3, #12]
 8001572:	eeb8 8ac8 	vcvt.f32.s32	s16, s16
 8001576:	eddf 7a2a 	vldr	s15, [pc, #168]	; 8001620 <line_follower_test+0xf0>
 800157a:	ee88 8a27 	vdiv.f32	s16, s16, s15
 800157e:	ee39 8ac8 	vsub.f32	s16, s19, s16
 8001582:	e001      	b.n	8001588 <line_follower_test+0x58>
 8001584:	eeb0 8a68 	vmov.f32	s16, s17
 8001588:	ed9f aa26 	vldr	s20, [pc, #152]	; 8001624 <line_follower_test+0xf4>
 800158c:	eeb4 8aca 	vcmpe.f32	s16, s20
 8001590:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001594:	dc09      	bgt.n	80015aa <line_follower_test+0x7a>
 8001596:	eddf 7a24 	vldr	s15, [pc, #144]	; 8001628 <line_follower_test+0xf8>
 800159a:	eeb4 8a67 	vcmp.f32	s16, s15
 800159e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80015a2:	bf48      	it	mi
 80015a4:	eeb0 8a67 	vmovmi.f32	s16, s15
 80015a8:	e001      	b.n	80015ae <line_follower_test+0x7e>
 80015aa:	eeb0 8a4a 	vmov.f32	s16, s20
 80015ae:	eddf 7a1f 	vldr	s15, [pc, #124]	; 800162c <line_follower_test+0xfc>
 80015b2:	ee78 8a68 	vsub.f32	s17, s16, s17
 80015b6:	ee18 0a10 	vmov	r0, s16
 80015ba:	ee68 8aa7 	vmul.f32	s17, s17, s15
 80015be:	eddf 7a1c 	vldr	s15, [pc, #112]	; 8001630 <line_follower_test+0x100>
 80015c2:	ee48 8a27 	vmla.f32	s17, s16, s15
 80015c6:	f7ff fa01 	bl	80009cc <m_abs>
 80015ca:	ee07 0a90 	vmov	s15, r0
 80015ce:	ee3a aa67 	vsub.f32	s20, s20, s15
 80015d2:	eddf 7a18 	vldr	s15, [pc, #96]	; 8001634 <line_follower_test+0x104>
 80015d6:	ee6a 7a27 	vmul.f32	s15, s20, s15
 80015da:	ee17 0a90 	vmov	r0, s15
 80015de:	eddf 7a16 	vldr	s15, [pc, #88]	; 8001638 <line_follower_test+0x108>
 80015e2:	ee79 7a27 	vadd.f32	s15, s18, s15
 80015e6:	ee17 1a90 	vmov	r1, s15
 80015ea:	f7ff f9fb 	bl	80009e4 <m_min>
 80015ee:	ee09 0a10 	vmov	s18, r0
 80015f2:	ee79 7a28 	vadd.f32	s15, s18, s17
 80015f6:	ee79 8a68 	vsub.f32	s17, s18, s17
 80015fa:	4b10      	ldr	r3, [pc, #64]	; (800163c <line_follower_test+0x10c>)
 80015fc:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 8001600:	eefd 8ae8 	vcvt.s32.f32	s17, s17
 8001604:	200a      	movs	r0, #10
 8001606:	edc3 7a00 	vstr	s15, [r3]
 800160a:	edc3 8a01 	vstr	s17, [r3, #4]
 800160e:	f000 fb21 	bl	8001c54 <timer_delay_ms>
 8001612:	eef0 8a48 	vmov.f32	s17, s16
 8001616:	e795      	b.n	8001544 <line_follower_test+0x14>
 8001618:	00000000 	.word	0x00000000
 800161c:	20000610 	.word	0x20000610
 8001620:	428c0000 	.word	0x428c0000
 8001624:	3f800000 	.word	0x3f800000
 8001628:	bf800000 	.word	0xbf800000
 800162c:	42c80000 	.word	0x42c80000
 8001630:	42200000 	.word	0x42200000
 8001634:	41a00000 	.word	0x41a00000
 8001638:	3e4ccccd 	.word	0x3e4ccccd
 800163c:	20000208 	.word	0x20000208

08001640 <main_thread>:
 8001640:	b508      	push	{r3, lr}
 8001642:	4823      	ldr	r0, [pc, #140]	; (80016d0 <main_thread+0x90>)
 8001644:	f7fe ff4e 	bl	80004e4 <printf_>
 8001648:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 800164c:	f000 fb02 	bl	8001c54 <timer_delay_ms>
 8001650:	f7ff fea2 	bl	8001398 <device_wake_up>
 8001654:	491f      	ldr	r1, [pc, #124]	; (80016d4 <main_thread+0x94>)
 8001656:	4820      	ldr	r0, [pc, #128]	; (80016d8 <main_thread+0x98>)
 8001658:	f44f 7200 	mov.w	r2, #512	; 0x200
 800165c:	2306      	movs	r3, #6
 800165e:	f7fe fe15 	bl	800028c <create_thread>
 8001662:	491e      	ldr	r1, [pc, #120]	; (80016dc <main_thread+0x9c>)
 8001664:	481e      	ldr	r0, [pc, #120]	; (80016e0 <main_thread+0xa0>)
 8001666:	f44f 7200 	mov.w	r2, #512	; 0x200
 800166a:	2306      	movs	r3, #6
 800166c:	f7fe fe0e 	bl	800028c <create_thread>
 8001670:	491c      	ldr	r1, [pc, #112]	; (80016e4 <main_thread+0xa4>)
 8001672:	481d      	ldr	r0, [pc, #116]	; (80016e8 <main_thread+0xa8>)
 8001674:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001678:	2306      	movs	r3, #6
 800167a:	f7fe fe07 	bl	800028c <create_thread>
 800167e:	20c8      	movs	r0, #200	; 0xc8
 8001680:	f000 fae8 	bl	8001c54 <timer_delay_ms>
 8001684:	f7ff fcee 	bl	8001064 <rgb_set_background>
 8001688:	f000 ff74 	bl	8002574 <get_key>
 800168c:	b980      	cbnz	r0, 80016b0 <main_thread+0x70>
 800168e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001692:	f000 fee5 	bl	8002460 <led_on>
 8001696:	2064      	movs	r0, #100	; 0x64
 8001698:	f000 fadc 	bl	8001c54 <timer_delay_ms>
 800169c:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80016a0:	f000 fef4 	bl	800248c <led_off>
 80016a4:	20c8      	movs	r0, #200	; 0xc8
 80016a6:	f000 fad5 	bl	8001c54 <timer_delay_ms>
 80016aa:	f7ff fe6f 	bl	800138c <device_sleep>
 80016ae:	e7eb      	b.n	8001688 <main_thread+0x48>
 80016b0:	f7ff fe72 	bl	8001398 <device_wake_up>
 80016b4:	20c8      	movs	r0, #200	; 0xc8
 80016b6:	f000 facd 	bl	8001c54 <timer_delay_ms>
 80016ba:	2001      	movs	r0, #1
 80016bc:	f7ff ff38 	bl	8001530 <line_follower_test>
 80016c0:	f000 ff58 	bl	8002574 <get_key>
 80016c4:	2800      	cmp	r0, #0
 80016c6:	d1df      	bne.n	8001688 <main_thread+0x48>
 80016c8:	f7ff fc1a 	bl	8000f00 <rgb_get_line_position>
 80016cc:	e7f8      	b.n	80016c0 <main_thread+0x80>
 80016ce:	bf00      	nop
 80016d0:	0800272a 	.word	0x0800272a
 80016d4:	20000828 	.word	0x20000828
 80016d8:	08001405 	.word	0x08001405
 80016dc:	20000628 	.word	0x20000628
 80016e0:	080013a5 	.word	0x080013a5
 80016e4:	20000a28 	.word	0x20000a28
 80016e8:	08001465 	.word	0x08001465

080016ec <main>:
 80016ec:	b508      	push	{r3, lr}
 80016ee:	f000 fe45 	bl	800237c <lib_low_level_init>
 80016f2:	f7fe ff71 	bl	80005d8 <lib_os_init>
 80016f6:	4905      	ldr	r1, [pc, #20]	; (800170c <main+0x20>)
 80016f8:	4805      	ldr	r0, [pc, #20]	; (8001710 <main+0x24>)
 80016fa:	f44f 7200 	mov.w	r2, #512	; 0x200
 80016fe:	2306      	movs	r3, #6
 8001700:	f7fe fdc4 	bl	800028c <create_thread>
 8001704:	f7fe fdbc 	bl	8000280 <kernel_start>
 8001708:	2000      	movs	r0, #0
 800170a:	bd08      	pop	{r3, pc}
 800170c:	20000c28 	.word	0x20000c28
 8001710:	08001641 	.word	0x08001641

08001714 <RCC_GetClocksFreq>:
 8001714:	4ba5      	ldr	r3, [pc, #660]	; (80019ac <RCC_GetClocksFreq+0x298>)
 8001716:	685a      	ldr	r2, [r3, #4]
 8001718:	f002 020c 	and.w	r2, r2, #12
 800171c:	2a04      	cmp	r2, #4
 800171e:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8001722:	d005      	beq.n	8001730 <RCC_GetClocksFreq+0x1c>
 8001724:	2a08      	cmp	r2, #8
 8001726:	d006      	beq.n	8001736 <RCC_GetClocksFreq+0x22>
 8001728:	4ba1      	ldr	r3, [pc, #644]	; (80019b0 <RCC_GetClocksFreq+0x29c>)
 800172a:	6003      	str	r3, [r0, #0]
 800172c:	b9ba      	cbnz	r2, 800175e <RCC_GetClocksFreq+0x4a>
 800172e:	e017      	b.n	8001760 <RCC_GetClocksFreq+0x4c>
 8001730:	4b9f      	ldr	r3, [pc, #636]	; (80019b0 <RCC_GetClocksFreq+0x29c>)
 8001732:	6003      	str	r3, [r0, #0]
 8001734:	e013      	b.n	800175e <RCC_GetClocksFreq+0x4a>
 8001736:	6859      	ldr	r1, [r3, #4]
 8001738:	685c      	ldr	r4, [r3, #4]
 800173a:	f3c1 4183 	ubfx	r1, r1, #18, #4
 800173e:	03e2      	lsls	r2, r4, #15
 8001740:	f101 0102 	add.w	r1, r1, #2
 8001744:	d401      	bmi.n	800174a <RCC_GetClocksFreq+0x36>
 8001746:	4a9b      	ldr	r2, [pc, #620]	; (80019b4 <RCC_GetClocksFreq+0x2a0>)
 8001748:	e006      	b.n	8001758 <RCC_GetClocksFreq+0x44>
 800174a:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 800174c:	4b98      	ldr	r3, [pc, #608]	; (80019b0 <RCC_GetClocksFreq+0x29c>)
 800174e:	f002 020f 	and.w	r2, r2, #15
 8001752:	3201      	adds	r2, #1
 8001754:	fbb3 f2f2 	udiv	r2, r3, r2
 8001758:	434a      	muls	r2, r1
 800175a:	6002      	str	r2, [r0, #0]
 800175c:	e000      	b.n	8001760 <RCC_GetClocksFreq+0x4c>
 800175e:	2200      	movs	r2, #0
 8001760:	4f92      	ldr	r7, [pc, #584]	; (80019ac <RCC_GetClocksFreq+0x298>)
 8001762:	4d95      	ldr	r5, [pc, #596]	; (80019b8 <RCC_GetClocksFreq+0x2a4>)
 8001764:	687b      	ldr	r3, [r7, #4]
 8001766:	f8df 8254 	ldr.w	r8, [pc, #596]	; 80019bc <RCC_GetClocksFreq+0x2a8>
 800176a:	f3c3 1303 	ubfx	r3, r3, #4, #4
 800176e:	5cec      	ldrb	r4, [r5, r3]
 8001770:	6803      	ldr	r3, [r0, #0]
 8001772:	b2e4      	uxtb	r4, r4
 8001774:	fa23 f104 	lsr.w	r1, r3, r4
 8001778:	6041      	str	r1, [r0, #4]
 800177a:	687e      	ldr	r6, [r7, #4]
 800177c:	f3c6 2602 	ubfx	r6, r6, #8, #3
 8001780:	5dae      	ldrb	r6, [r5, r6]
 8001782:	fa21 f606 	lsr.w	r6, r1, r6
 8001786:	6086      	str	r6, [r0, #8]
 8001788:	f8d7 c004 	ldr.w	ip, [r7, #4]
 800178c:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8001790:	f815 500c 	ldrb.w	r5, [r5, ip]
 8001794:	b2ed      	uxtb	r5, r5
 8001796:	40e9      	lsrs	r1, r5
 8001798:	60c1      	str	r1, [r0, #12]
 800179a:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 800179e:	f3c9 1904 	ubfx	r9, r9, #4, #5
 80017a2:	f009 0c0f 	and.w	ip, r9, #15
 80017a6:	f019 0f10 	tst.w	r9, #16
 80017aa:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 80017ae:	fa1f fc8c 	uxth.w	ip, ip
 80017b2:	d007      	beq.n	80017c4 <RCC_GetClocksFreq+0xb0>
 80017b4:	f1bc 0f00 	cmp.w	ip, #0
 80017b8:	d004      	beq.n	80017c4 <RCC_GetClocksFreq+0xb0>
 80017ba:	fbb2 fcfc 	udiv	ip, r2, ip
 80017be:	f8c0 c010 	str.w	ip, [r0, #16]
 80017c2:	e000      	b.n	80017c6 <RCC_GetClocksFreq+0xb2>
 80017c4:	6103      	str	r3, [r0, #16]
 80017c6:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 80017c8:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 80017cc:	f00c 070f 	and.w	r7, ip, #15
 80017d0:	f01c 0f10 	tst.w	ip, #16
 80017d4:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 80017d8:	b2bf      	uxth	r7, r7
 80017da:	d004      	beq.n	80017e6 <RCC_GetClocksFreq+0xd2>
 80017dc:	b11f      	cbz	r7, 80017e6 <RCC_GetClocksFreq+0xd2>
 80017de:	fbb2 f7f7 	udiv	r7, r2, r7
 80017e2:	6147      	str	r7, [r0, #20]
 80017e4:	e000      	b.n	80017e8 <RCC_GetClocksFreq+0xd4>
 80017e6:	6143      	str	r3, [r0, #20]
 80017e8:	4f70      	ldr	r7, [pc, #448]	; (80019ac <RCC_GetClocksFreq+0x298>)
 80017ea:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80017ee:	f01c 0f10 	tst.w	ip, #16
 80017f2:	bf0a      	itet	eq
 80017f4:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 80019b0 <RCC_GetClocksFreq+0x29c>
 80017f8:	6183      	strne	r3, [r0, #24]
 80017fa:	f8c0 c018 	streq.w	ip, [r0, #24]
 80017fe:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001800:	06bf      	lsls	r7, r7, #26
 8001802:	bf56      	itet	pl
 8001804:	4f6a      	ldrpl	r7, [pc, #424]	; (80019b0 <RCC_GetClocksFreq+0x29c>)
 8001806:	61c3      	strmi	r3, [r0, #28]
 8001808:	61c7      	strpl	r7, [r0, #28]
 800180a:	4f68      	ldr	r7, [pc, #416]	; (80019ac <RCC_GetClocksFreq+0x298>)
 800180c:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001810:	f01c 0f40 	tst.w	ip, #64	; 0x40
 8001814:	bf0a      	itet	eq
 8001816:	f8df c198 	ldreq.w	ip, [pc, #408]	; 80019b0 <RCC_GetClocksFreq+0x29c>
 800181a:	6203      	strne	r3, [r0, #32]
 800181c:	f8c0 c020 	streq.w	ip, [r0, #32]
 8001820:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001822:	05ff      	lsls	r7, r7, #23
 8001824:	d506      	bpl.n	8001834 <RCC_GetClocksFreq+0x120>
 8001826:	4293      	cmp	r3, r2
 8001828:	d104      	bne.n	8001834 <RCC_GetClocksFreq+0x120>
 800182a:	42a5      	cmp	r5, r4
 800182c:	d102      	bne.n	8001834 <RCC_GetClocksFreq+0x120>
 800182e:	005f      	lsls	r7, r3, #1
 8001830:	6247      	str	r7, [r0, #36]	; 0x24
 8001832:	e000      	b.n	8001836 <RCC_GetClocksFreq+0x122>
 8001834:	6241      	str	r1, [r0, #36]	; 0x24
 8001836:	4f5d      	ldr	r7, [pc, #372]	; (80019ac <RCC_GetClocksFreq+0x298>)
 8001838:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800183c:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 8001840:	d008      	beq.n	8001854 <RCC_GetClocksFreq+0x140>
 8001842:	4293      	cmp	r3, r2
 8001844:	d106      	bne.n	8001854 <RCC_GetClocksFreq+0x140>
 8001846:	42a5      	cmp	r5, r4
 8001848:	d104      	bne.n	8001854 <RCC_GetClocksFreq+0x140>
 800184a:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 800184e:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 8001852:	e000      	b.n	8001856 <RCC_GetClocksFreq+0x142>
 8001854:	6281      	str	r1, [r0, #40]	; 0x28
 8001856:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001858:	05bf      	lsls	r7, r7, #22
 800185a:	d506      	bpl.n	800186a <RCC_GetClocksFreq+0x156>
 800185c:	4293      	cmp	r3, r2
 800185e:	d104      	bne.n	800186a <RCC_GetClocksFreq+0x156>
 8001860:	42a5      	cmp	r5, r4
 8001862:	d102      	bne.n	800186a <RCC_GetClocksFreq+0x156>
 8001864:	005f      	lsls	r7, r3, #1
 8001866:	62c7      	str	r7, [r0, #44]	; 0x2c
 8001868:	e000      	b.n	800186c <RCC_GetClocksFreq+0x158>
 800186a:	62c1      	str	r1, [r0, #44]	; 0x2c
 800186c:	4f4f      	ldr	r7, [pc, #316]	; (80019ac <RCC_GetClocksFreq+0x298>)
 800186e:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001872:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 8001876:	d008      	beq.n	800188a <RCC_GetClocksFreq+0x176>
 8001878:	4293      	cmp	r3, r2
 800187a:	d106      	bne.n	800188a <RCC_GetClocksFreq+0x176>
 800187c:	42a5      	cmp	r5, r4
 800187e:	d104      	bne.n	800188a <RCC_GetClocksFreq+0x176>
 8001880:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001884:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8001888:	e000      	b.n	800188c <RCC_GetClocksFreq+0x178>
 800188a:	64c1      	str	r1, [r0, #76]	; 0x4c
 800188c:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 800188e:	053f      	lsls	r7, r7, #20
 8001890:	d506      	bpl.n	80018a0 <RCC_GetClocksFreq+0x18c>
 8001892:	4293      	cmp	r3, r2
 8001894:	d104      	bne.n	80018a0 <RCC_GetClocksFreq+0x18c>
 8001896:	42a5      	cmp	r5, r4
 8001898:	d102      	bne.n	80018a0 <RCC_GetClocksFreq+0x18c>
 800189a:	005f      	lsls	r7, r3, #1
 800189c:	6507      	str	r7, [r0, #80]	; 0x50
 800189e:	e000      	b.n	80018a2 <RCC_GetClocksFreq+0x18e>
 80018a0:	6501      	str	r1, [r0, #80]	; 0x50
 80018a2:	4f42      	ldr	r7, [pc, #264]	; (80019ac <RCC_GetClocksFreq+0x298>)
 80018a4:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80018a8:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 80018ac:	d008      	beq.n	80018c0 <RCC_GetClocksFreq+0x1ac>
 80018ae:	4293      	cmp	r3, r2
 80018b0:	d106      	bne.n	80018c0 <RCC_GetClocksFreq+0x1ac>
 80018b2:	42a5      	cmp	r5, r4
 80018b4:	d104      	bne.n	80018c0 <RCC_GetClocksFreq+0x1ac>
 80018b6:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 80018ba:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 80018be:	e000      	b.n	80018c2 <RCC_GetClocksFreq+0x1ae>
 80018c0:	6501      	str	r1, [r0, #80]	; 0x50
 80018c2:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80018c4:	043f      	lsls	r7, r7, #16
 80018c6:	d506      	bpl.n	80018d6 <RCC_GetClocksFreq+0x1c2>
 80018c8:	4293      	cmp	r3, r2
 80018ca:	d104      	bne.n	80018d6 <RCC_GetClocksFreq+0x1c2>
 80018cc:	42a5      	cmp	r5, r4
 80018ce:	d102      	bne.n	80018d6 <RCC_GetClocksFreq+0x1c2>
 80018d0:	005a      	lsls	r2, r3, #1
 80018d2:	6582      	str	r2, [r0, #88]	; 0x58
 80018d4:	e000      	b.n	80018d8 <RCC_GetClocksFreq+0x1c4>
 80018d6:	6581      	str	r1, [r0, #88]	; 0x58
 80018d8:	4a34      	ldr	r2, [pc, #208]	; (80019ac <RCC_GetClocksFreq+0x298>)
 80018da:	6b14      	ldr	r4, [r2, #48]	; 0x30
 80018dc:	07a4      	lsls	r4, r4, #30
 80018de:	d014      	beq.n	800190a <RCC_GetClocksFreq+0x1f6>
 80018e0:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80018e2:	f001 0103 	and.w	r1, r1, #3
 80018e6:	2901      	cmp	r1, #1
 80018e8:	d101      	bne.n	80018ee <RCC_GetClocksFreq+0x1da>
 80018ea:	6383      	str	r3, [r0, #56]	; 0x38
 80018ec:	e00e      	b.n	800190c <RCC_GetClocksFreq+0x1f8>
 80018ee:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80018f0:	f001 0103 	and.w	r1, r1, #3
 80018f4:	2902      	cmp	r1, #2
 80018f6:	d102      	bne.n	80018fe <RCC_GetClocksFreq+0x1ea>
 80018f8:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80018fc:	e005      	b.n	800190a <RCC_GetClocksFreq+0x1f6>
 80018fe:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001900:	f001 0103 	and.w	r1, r1, #3
 8001904:	2903      	cmp	r1, #3
 8001906:	d101      	bne.n	800190c <RCC_GetClocksFreq+0x1f8>
 8001908:	4929      	ldr	r1, [pc, #164]	; (80019b0 <RCC_GetClocksFreq+0x29c>)
 800190a:	6381      	str	r1, [r0, #56]	; 0x38
 800190c:	6b12      	ldr	r2, [r2, #48]	; 0x30
 800190e:	4927      	ldr	r1, [pc, #156]	; (80019ac <RCC_GetClocksFreq+0x298>)
 8001910:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 8001914:	d101      	bne.n	800191a <RCC_GetClocksFreq+0x206>
 8001916:	63c6      	str	r6, [r0, #60]	; 0x3c
 8001918:	e018      	b.n	800194c <RCC_GetClocksFreq+0x238>
 800191a:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800191c:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001920:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 8001924:	d101      	bne.n	800192a <RCC_GetClocksFreq+0x216>
 8001926:	63c3      	str	r3, [r0, #60]	; 0x3c
 8001928:	e010      	b.n	800194c <RCC_GetClocksFreq+0x238>
 800192a:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800192c:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001930:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 8001934:	d102      	bne.n	800193c <RCC_GetClocksFreq+0x228>
 8001936:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800193a:	e006      	b.n	800194a <RCC_GetClocksFreq+0x236>
 800193c:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800193e:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8001942:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 8001946:	d101      	bne.n	800194c <RCC_GetClocksFreq+0x238>
 8001948:	4a19      	ldr	r2, [pc, #100]	; (80019b0 <RCC_GetClocksFreq+0x29c>)
 800194a:	63c2      	str	r2, [r0, #60]	; 0x3c
 800194c:	4a17      	ldr	r2, [pc, #92]	; (80019ac <RCC_GetClocksFreq+0x298>)
 800194e:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001950:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8001954:	d101      	bne.n	800195a <RCC_GetClocksFreq+0x246>
 8001956:	6406      	str	r6, [r0, #64]	; 0x40
 8001958:	e018      	b.n	800198c <RCC_GetClocksFreq+0x278>
 800195a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800195c:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001960:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8001964:	d101      	bne.n	800196a <RCC_GetClocksFreq+0x256>
 8001966:	6403      	str	r3, [r0, #64]	; 0x40
 8001968:	e010      	b.n	800198c <RCC_GetClocksFreq+0x278>
 800196a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800196c:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001970:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 8001974:	d102      	bne.n	800197c <RCC_GetClocksFreq+0x268>
 8001976:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 800197a:	e006      	b.n	800198a <RCC_GetClocksFreq+0x276>
 800197c:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800197e:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001982:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 8001986:	d101      	bne.n	800198c <RCC_GetClocksFreq+0x278>
 8001988:	4909      	ldr	r1, [pc, #36]	; (80019b0 <RCC_GetClocksFreq+0x29c>)
 800198a:	6401      	str	r1, [r0, #64]	; 0x40
 800198c:	6b12      	ldr	r2, [r2, #48]	; 0x30
 800198e:	4907      	ldr	r1, [pc, #28]	; (80019ac <RCC_GetClocksFreq+0x298>)
 8001990:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 8001994:	d101      	bne.n	800199a <RCC_GetClocksFreq+0x286>
 8001996:	6446      	str	r6, [r0, #68]	; 0x44
 8001998:	e023      	b.n	80019e2 <RCC_GetClocksFreq+0x2ce>
 800199a:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800199c:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80019a0:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 80019a4:	d10c      	bne.n	80019c0 <RCC_GetClocksFreq+0x2ac>
 80019a6:	6443      	str	r3, [r0, #68]	; 0x44
 80019a8:	e01b      	b.n	80019e2 <RCC_GetClocksFreq+0x2ce>
 80019aa:	bf00      	nop
 80019ac:	40021000 	.word	0x40021000
 80019b0:	007a1200 	.word	0x007a1200
 80019b4:	003d0900 	.word	0x003d0900
 80019b8:	20000020 	.word	0x20000020
 80019bc:	20000000 	.word	0x20000000
 80019c0:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80019c2:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80019c6:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 80019ca:	d102      	bne.n	80019d2 <RCC_GetClocksFreq+0x2be>
 80019cc:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80019d0:	e006      	b.n	80019e0 <RCC_GetClocksFreq+0x2cc>
 80019d2:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80019d4:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80019d8:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 80019dc:	d101      	bne.n	80019e2 <RCC_GetClocksFreq+0x2ce>
 80019de:	4a11      	ldr	r2, [pc, #68]	; (8001a24 <RCC_GetClocksFreq+0x310>)
 80019e0:	6442      	str	r2, [r0, #68]	; 0x44
 80019e2:	4a11      	ldr	r2, [pc, #68]	; (8001a28 <RCC_GetClocksFreq+0x314>)
 80019e4:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80019e6:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 80019ea:	d102      	bne.n	80019f2 <RCC_GetClocksFreq+0x2de>
 80019ec:	6486      	str	r6, [r0, #72]	; 0x48
 80019ee:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80019f2:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80019f4:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 80019f8:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 80019fc:	d00f      	beq.n	8001a1e <RCC_GetClocksFreq+0x30a>
 80019fe:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001a00:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001a04:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 8001a08:	d102      	bne.n	8001a10 <RCC_GetClocksFreq+0x2fc>
 8001a0a:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001a0e:	e006      	b.n	8001a1e <RCC_GetClocksFreq+0x30a>
 8001a10:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001a12:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001a16:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8001a1a:	d101      	bne.n	8001a20 <RCC_GetClocksFreq+0x30c>
 8001a1c:	4b01      	ldr	r3, [pc, #4]	; (8001a24 <RCC_GetClocksFreq+0x310>)
 8001a1e:	6483      	str	r3, [r0, #72]	; 0x48
 8001a20:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001a24:	007a1200 	.word	0x007a1200
 8001a28:	40021000 	.word	0x40021000

08001a2c <RCC_AHBPeriphClockCmd>:
 8001a2c:	bf00      	nop
 8001a2e:	bf00      	nop
 8001a30:	4b04      	ldr	r3, [pc, #16]	; (8001a44 <RCC_AHBPeriphClockCmd+0x18>)
 8001a32:	695a      	ldr	r2, [r3, #20]
 8001a34:	b109      	cbz	r1, 8001a3a <RCC_AHBPeriphClockCmd+0xe>
 8001a36:	4310      	orrs	r0, r2
 8001a38:	e001      	b.n	8001a3e <RCC_AHBPeriphClockCmd+0x12>
 8001a3a:	ea22 0000 	bic.w	r0, r2, r0
 8001a3e:	6158      	str	r0, [r3, #20]
 8001a40:	4770      	bx	lr
 8001a42:	bf00      	nop
 8001a44:	40021000 	.word	0x40021000

08001a48 <RCC_APB2PeriphClockCmd>:
 8001a48:	bf00      	nop
 8001a4a:	bf00      	nop
 8001a4c:	4b04      	ldr	r3, [pc, #16]	; (8001a60 <RCC_APB2PeriphClockCmd+0x18>)
 8001a4e:	699a      	ldr	r2, [r3, #24]
 8001a50:	b109      	cbz	r1, 8001a56 <RCC_APB2PeriphClockCmd+0xe>
 8001a52:	4310      	orrs	r0, r2
 8001a54:	e001      	b.n	8001a5a <RCC_APB2PeriphClockCmd+0x12>
 8001a56:	ea22 0000 	bic.w	r0, r2, r0
 8001a5a:	6198      	str	r0, [r3, #24]
 8001a5c:	4770      	bx	lr
 8001a5e:	bf00      	nop
 8001a60:	40021000 	.word	0x40021000

08001a64 <RCC_APB1PeriphClockCmd>:
 8001a64:	bf00      	nop
 8001a66:	bf00      	nop
 8001a68:	4b04      	ldr	r3, [pc, #16]	; (8001a7c <RCC_APB1PeriphClockCmd+0x18>)
 8001a6a:	69da      	ldr	r2, [r3, #28]
 8001a6c:	b109      	cbz	r1, 8001a72 <RCC_APB1PeriphClockCmd+0xe>
 8001a6e:	4310      	orrs	r0, r2
 8001a70:	e001      	b.n	8001a76 <RCC_APB1PeriphClockCmd+0x12>
 8001a72:	ea22 0000 	bic.w	r0, r2, r0
 8001a76:	61d8      	str	r0, [r3, #28]
 8001a78:	4770      	bx	lr
 8001a7a:	bf00      	nop
 8001a7c:	40021000 	.word	0x40021000

08001a80 <TIM_TimeBaseInit>:
 8001a80:	bf00      	nop
 8001a82:	bf00      	nop
 8001a84:	bf00      	nop
 8001a86:	4a24      	ldr	r2, [pc, #144]	; (8001b18 <TIM_TimeBaseInit+0x98>)
 8001a88:	8803      	ldrh	r3, [r0, #0]
 8001a8a:	4290      	cmp	r0, r2
 8001a8c:	b29b      	uxth	r3, r3
 8001a8e:	d012      	beq.n	8001ab6 <TIM_TimeBaseInit+0x36>
 8001a90:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8001a94:	4290      	cmp	r0, r2
 8001a96:	d00e      	beq.n	8001ab6 <TIM_TimeBaseInit+0x36>
 8001a98:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001a9c:	d00b      	beq.n	8001ab6 <TIM_TimeBaseInit+0x36>
 8001a9e:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 8001aa2:	4290      	cmp	r0, r2
 8001aa4:	d007      	beq.n	8001ab6 <TIM_TimeBaseInit+0x36>
 8001aa6:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001aaa:	4290      	cmp	r0, r2
 8001aac:	d003      	beq.n	8001ab6 <TIM_TimeBaseInit+0x36>
 8001aae:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 8001ab2:	4290      	cmp	r0, r2
 8001ab4:	d103      	bne.n	8001abe <TIM_TimeBaseInit+0x3e>
 8001ab6:	884a      	ldrh	r2, [r1, #2]
 8001ab8:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001abc:	4313      	orrs	r3, r2
 8001abe:	4a17      	ldr	r2, [pc, #92]	; (8001b1c <TIM_TimeBaseInit+0x9c>)
 8001ac0:	4290      	cmp	r0, r2
 8001ac2:	d008      	beq.n	8001ad6 <TIM_TimeBaseInit+0x56>
 8001ac4:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001ac8:	4290      	cmp	r0, r2
 8001aca:	d004      	beq.n	8001ad6 <TIM_TimeBaseInit+0x56>
 8001acc:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001ad0:	890a      	ldrh	r2, [r1, #8]
 8001ad2:	b29b      	uxth	r3, r3
 8001ad4:	4313      	orrs	r3, r2
 8001ad6:	8003      	strh	r3, [r0, #0]
 8001ad8:	684b      	ldr	r3, [r1, #4]
 8001ada:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001adc:	880b      	ldrh	r3, [r1, #0]
 8001ade:	8503      	strh	r3, [r0, #40]	; 0x28
 8001ae0:	4b0d      	ldr	r3, [pc, #52]	; (8001b18 <TIM_TimeBaseInit+0x98>)
 8001ae2:	4298      	cmp	r0, r3
 8001ae4:	d013      	beq.n	8001b0e <TIM_TimeBaseInit+0x8e>
 8001ae6:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001aea:	4298      	cmp	r0, r3
 8001aec:	d00f      	beq.n	8001b0e <TIM_TimeBaseInit+0x8e>
 8001aee:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 8001af2:	4298      	cmp	r0, r3
 8001af4:	d00b      	beq.n	8001b0e <TIM_TimeBaseInit+0x8e>
 8001af6:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001afa:	4298      	cmp	r0, r3
 8001afc:	d007      	beq.n	8001b0e <TIM_TimeBaseInit+0x8e>
 8001afe:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001b02:	4298      	cmp	r0, r3
 8001b04:	d003      	beq.n	8001b0e <TIM_TimeBaseInit+0x8e>
 8001b06:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001b0a:	4298      	cmp	r0, r3
 8001b0c:	d101      	bne.n	8001b12 <TIM_TimeBaseInit+0x92>
 8001b0e:	894b      	ldrh	r3, [r1, #10]
 8001b10:	8603      	strh	r3, [r0, #48]	; 0x30
 8001b12:	2301      	movs	r3, #1
 8001b14:	6143      	str	r3, [r0, #20]
 8001b16:	4770      	bx	lr
 8001b18:	40012c00 	.word	0x40012c00
 8001b1c:	40001000 	.word	0x40001000

08001b20 <TIM_Cmd>:
 8001b20:	bf00      	nop
 8001b22:	bf00      	nop
 8001b24:	8803      	ldrh	r3, [r0, #0]
 8001b26:	b119      	cbz	r1, 8001b30 <TIM_Cmd+0x10>
 8001b28:	b29b      	uxth	r3, r3
 8001b2a:	f043 0301 	orr.w	r3, r3, #1
 8001b2e:	e003      	b.n	8001b38 <TIM_Cmd+0x18>
 8001b30:	f023 0301 	bic.w	r3, r3, #1
 8001b34:	041b      	lsls	r3, r3, #16
 8001b36:	0c1b      	lsrs	r3, r3, #16
 8001b38:	8003      	strh	r3, [r0, #0]
 8001b3a:	4770      	bx	lr

08001b3c <TIM_ClearITPendingBit>:
 8001b3c:	bf00      	nop
 8001b3e:	43c9      	mvns	r1, r1
 8001b40:	b289      	uxth	r1, r1
 8001b42:	6101      	str	r1, [r0, #16]
 8001b44:	4770      	bx	lr
	...

08001b48 <timer_init>:
 8001b48:	b530      	push	{r4, r5, lr}
 8001b4a:	2300      	movs	r3, #0
 8001b4c:	b085      	sub	sp, #20
 8001b4e:	491f      	ldr	r1, [pc, #124]	; (8001bcc <timer_init+0x84>)
 8001b50:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001b54:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001b58:	491d      	ldr	r1, [pc, #116]	; (8001bd0 <timer_init+0x88>)
 8001b5a:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001b5e:	4a1d      	ldr	r2, [pc, #116]	; (8001bd4 <timer_init+0x8c>)
 8001b60:	2400      	movs	r4, #0
 8001b62:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8001b66:	3301      	adds	r3, #1
 8001b68:	2b04      	cmp	r3, #4
 8001b6a:	4625      	mov	r5, r4
 8001b6c:	d1ef      	bne.n	8001b4e <timer_init+0x6>
 8001b6e:	4b1a      	ldr	r3, [pc, #104]	; (8001bd8 <timer_init+0x90>)
 8001b70:	2002      	movs	r0, #2
 8001b72:	2101      	movs	r1, #1
 8001b74:	601c      	str	r4, [r3, #0]
 8001b76:	f7ff ff75 	bl	8001a64 <RCC_APB1PeriphClockCmd>
 8001b7a:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001b7e:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001b82:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001b86:	4c15      	ldr	r4, [pc, #84]	; (8001bdc <timer_init+0x94>)
 8001b88:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001b8c:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001b90:	4620      	mov	r0, r4
 8001b92:	2331      	movs	r3, #49	; 0x31
 8001b94:	a901      	add	r1, sp, #4
 8001b96:	9302      	str	r3, [sp, #8]
 8001b98:	f7ff ff72 	bl	8001a80 <TIM_TimeBaseInit>
 8001b9c:	4620      	mov	r0, r4
 8001b9e:	2101      	movs	r1, #1
 8001ba0:	f7ff ffbe 	bl	8001b20 <TIM_Cmd>
 8001ba4:	68e3      	ldr	r3, [r4, #12]
 8001ba6:	f043 0301 	orr.w	r3, r3, #1
 8001baa:	60e3      	str	r3, [r4, #12]
 8001bac:	231d      	movs	r3, #29
 8001bae:	f88d 3000 	strb.w	r3, [sp]
 8001bb2:	4668      	mov	r0, sp
 8001bb4:	2301      	movs	r3, #1
 8001bb6:	f88d 5001 	strb.w	r5, [sp, #1]
 8001bba:	f88d 3002 	strb.w	r3, [sp, #2]
 8001bbe:	f88d 3003 	strb.w	r3, [sp, #3]
 8001bc2:	f000 fba3 	bl	800230c <NVIC_Init>
 8001bc6:	b005      	add	sp, #20
 8001bc8:	bd30      	pop	{r4, r5, pc}
 8001bca:	bf00      	nop
 8001bcc:	20000e3c 	.word	0x20000e3c
 8001bd0:	20000e30 	.word	0x20000e30
 8001bd4:	20000e28 	.word	0x20000e28
 8001bd8:	20000e38 	.word	0x20000e38
 8001bdc:	40000400 	.word	0x40000400

08001be0 <TIM3_IRQHandler>:
 8001be0:	2300      	movs	r3, #0
 8001be2:	4a10      	ldr	r2, [pc, #64]	; (8001c24 <TIM3_IRQHandler+0x44>)
 8001be4:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001be8:	b289      	uxth	r1, r1
 8001bea:	b129      	cbz	r1, 8001bf8 <TIM3_IRQHandler+0x18>
 8001bec:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001bf0:	b289      	uxth	r1, r1
 8001bf2:	3901      	subs	r1, #1
 8001bf4:	b289      	uxth	r1, r1
 8001bf6:	e007      	b.n	8001c08 <TIM3_IRQHandler+0x28>
 8001bf8:	490b      	ldr	r1, [pc, #44]	; (8001c28 <TIM3_IRQHandler+0x48>)
 8001bfa:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001bfe:	b289      	uxth	r1, r1
 8001c00:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001c04:	4a09      	ldr	r2, [pc, #36]	; (8001c2c <TIM3_IRQHandler+0x4c>)
 8001c06:	2101      	movs	r1, #1
 8001c08:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001c0c:	3301      	adds	r3, #1
 8001c0e:	2b04      	cmp	r3, #4
 8001c10:	d1e7      	bne.n	8001be2 <TIM3_IRQHandler+0x2>
 8001c12:	4b07      	ldr	r3, [pc, #28]	; (8001c30 <TIM3_IRQHandler+0x50>)
 8001c14:	4807      	ldr	r0, [pc, #28]	; (8001c34 <TIM3_IRQHandler+0x54>)
 8001c16:	681a      	ldr	r2, [r3, #0]
 8001c18:	2101      	movs	r1, #1
 8001c1a:	3201      	adds	r2, #1
 8001c1c:	601a      	str	r2, [r3, #0]
 8001c1e:	f7ff bf8d 	b.w	8001b3c <TIM_ClearITPendingBit>
 8001c22:	bf00      	nop
 8001c24:	20000e3c 	.word	0x20000e3c
 8001c28:	20000e30 	.word	0x20000e30
 8001c2c:	20000e28 	.word	0x20000e28
 8001c30:	20000e38 	.word	0x20000e38
 8001c34:	40000400 	.word	0x40000400

08001c38 <timer_get_time>:
 8001c38:	b082      	sub	sp, #8
 8001c3a:	b672      	cpsid	i
 8001c3c:	4b04      	ldr	r3, [pc, #16]	; (8001c50 <timer_get_time+0x18>)
 8001c3e:	681b      	ldr	r3, [r3, #0]
 8001c40:	9301      	str	r3, [sp, #4]
 8001c42:	b662      	cpsie	i
 8001c44:	9801      	ldr	r0, [sp, #4]
 8001c46:	230a      	movs	r3, #10
 8001c48:	fbb0 f0f3 	udiv	r0, r0, r3
 8001c4c:	b002      	add	sp, #8
 8001c4e:	4770      	bx	lr
 8001c50:	20000e38 	.word	0x20000e38

08001c54 <timer_delay_ms>:
 8001c54:	b513      	push	{r0, r1, r4, lr}
 8001c56:	4604      	mov	r4, r0
 8001c58:	f7ff ffee 	bl	8001c38 <timer_get_time>
 8001c5c:	4420      	add	r0, r4
 8001c5e:	9001      	str	r0, [sp, #4]
 8001c60:	9c01      	ldr	r4, [sp, #4]
 8001c62:	f7ff ffe9 	bl	8001c38 <timer_get_time>
 8001c66:	4284      	cmp	r4, r0
 8001c68:	d902      	bls.n	8001c70 <timer_delay_ms+0x1c>
 8001c6a:	f000 fb4b 	bl	8002304 <sleep>
 8001c6e:	e7f7      	b.n	8001c60 <timer_delay_ms+0xc>
 8001c70:	b002      	add	sp, #8
 8001c72:	bd10      	pop	{r4, pc}

08001c74 <event_timer_set_period>:
 8001c74:	b672      	cpsid	i
 8001c76:	230a      	movs	r3, #10
 8001c78:	4359      	muls	r1, r3
 8001c7a:	4b06      	ldr	r3, [pc, #24]	; (8001c94 <event_timer_set_period+0x20>)
 8001c7c:	b289      	uxth	r1, r1
 8001c7e:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001c82:	4b05      	ldr	r3, [pc, #20]	; (8001c98 <event_timer_set_period+0x24>)
 8001c84:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001c88:	4b04      	ldr	r3, [pc, #16]	; (8001c9c <event_timer_set_period+0x28>)
 8001c8a:	2200      	movs	r2, #0
 8001c8c:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 8001c90:	b662      	cpsie	i
 8001c92:	4770      	bx	lr
 8001c94:	20000e3c 	.word	0x20000e3c
 8001c98:	20000e30 	.word	0x20000e30
 8001c9c:	20000e28 	.word	0x20000e28

08001ca0 <event_timer_wait>:
 8001ca0:	b510      	push	{r4, lr}
 8001ca2:	4604      	mov	r4, r0
 8001ca4:	4b06      	ldr	r3, [pc, #24]	; (8001cc0 <event_timer_wait+0x20>)
 8001ca6:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 8001caa:	b292      	uxth	r2, r2
 8001cac:	b912      	cbnz	r2, 8001cb4 <event_timer_wait+0x14>
 8001cae:	f000 fb29 	bl	8002304 <sleep>
 8001cb2:	e7f7      	b.n	8001ca4 <event_timer_wait+0x4>
 8001cb4:	b672      	cpsid	i
 8001cb6:	2200      	movs	r2, #0
 8001cb8:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 8001cbc:	b662      	cpsie	i
 8001cbe:	bd10      	pop	{r4, pc}
 8001cc0:	20000e28 	.word	0x20000e28

08001cc4 <USART_Init>:
 8001cc4:	b530      	push	{r4, r5, lr}
 8001cc6:	4604      	mov	r4, r0
 8001cc8:	b099      	sub	sp, #100	; 0x64
 8001cca:	460d      	mov	r5, r1
 8001ccc:	bf00      	nop
 8001cce:	bf00      	nop
 8001cd0:	bf00      	nop
 8001cd2:	bf00      	nop
 8001cd4:	bf00      	nop
 8001cd6:	bf00      	nop
 8001cd8:	bf00      	nop
 8001cda:	6803      	ldr	r3, [r0, #0]
 8001cdc:	f023 0301 	bic.w	r3, r3, #1
 8001ce0:	6003      	str	r3, [r0, #0]
 8001ce2:	6842      	ldr	r2, [r0, #4]
 8001ce4:	688b      	ldr	r3, [r1, #8]
 8001ce6:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 8001cea:	4313      	orrs	r3, r2
 8001cec:	6043      	str	r3, [r0, #4]
 8001cee:	686a      	ldr	r2, [r5, #4]
 8001cf0:	68eb      	ldr	r3, [r5, #12]
 8001cf2:	6801      	ldr	r1, [r0, #0]
 8001cf4:	431a      	orrs	r2, r3
 8001cf6:	692b      	ldr	r3, [r5, #16]
 8001cf8:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 8001cfc:	f021 010c 	bic.w	r1, r1, #12
 8001d00:	4313      	orrs	r3, r2
 8001d02:	430b      	orrs	r3, r1
 8001d04:	6003      	str	r3, [r0, #0]
 8001d06:	6882      	ldr	r2, [r0, #8]
 8001d08:	696b      	ldr	r3, [r5, #20]
 8001d0a:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 8001d0e:	4313      	orrs	r3, r2
 8001d10:	6083      	str	r3, [r0, #8]
 8001d12:	a801      	add	r0, sp, #4
 8001d14:	f7ff fcfe 	bl	8001714 <RCC_GetClocksFreq>
 8001d18:	4b17      	ldr	r3, [pc, #92]	; (8001d78 <USART_Init+0xb4>)
 8001d1a:	429c      	cmp	r4, r3
 8001d1c:	d101      	bne.n	8001d22 <USART_Init+0x5e>
 8001d1e:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 8001d20:	e00e      	b.n	8001d40 <USART_Init+0x7c>
 8001d22:	4b16      	ldr	r3, [pc, #88]	; (8001d7c <USART_Init+0xb8>)
 8001d24:	429c      	cmp	r4, r3
 8001d26:	d101      	bne.n	8001d2c <USART_Init+0x68>
 8001d28:	9a10      	ldr	r2, [sp, #64]	; 0x40
 8001d2a:	e009      	b.n	8001d40 <USART_Init+0x7c>
 8001d2c:	4b14      	ldr	r3, [pc, #80]	; (8001d80 <USART_Init+0xbc>)
 8001d2e:	429c      	cmp	r4, r3
 8001d30:	d101      	bne.n	8001d36 <USART_Init+0x72>
 8001d32:	9a11      	ldr	r2, [sp, #68]	; 0x44
 8001d34:	e004      	b.n	8001d40 <USART_Init+0x7c>
 8001d36:	4b13      	ldr	r3, [pc, #76]	; (8001d84 <USART_Init+0xc0>)
 8001d38:	429c      	cmp	r4, r3
 8001d3a:	bf0c      	ite	eq
 8001d3c:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 8001d3e:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 8001d40:	6823      	ldr	r3, [r4, #0]
 8001d42:	6829      	ldr	r1, [r5, #0]
 8001d44:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 8001d48:	bf18      	it	ne
 8001d4a:	0052      	lslne	r2, r2, #1
 8001d4c:	fbb2 f3f1 	udiv	r3, r2, r1
 8001d50:	fb01 2213 	mls	r2, r1, r3, r2
 8001d54:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 8001d58:	6822      	ldr	r2, [r4, #0]
 8001d5a:	bf28      	it	cs
 8001d5c:	3301      	addcs	r3, #1
 8001d5e:	0412      	lsls	r2, r2, #16
 8001d60:	d506      	bpl.n	8001d70 <USART_Init+0xac>
 8001d62:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 8001d66:	f3c3 0142 	ubfx	r1, r3, #1, #3
 8001d6a:	401a      	ands	r2, r3
 8001d6c:	ea41 0302 	orr.w	r3, r1, r2
 8001d70:	b29b      	uxth	r3, r3
 8001d72:	81a3      	strh	r3, [r4, #12]
 8001d74:	b019      	add	sp, #100	; 0x64
 8001d76:	bd30      	pop	{r4, r5, pc}
 8001d78:	40013800 	.word	0x40013800
 8001d7c:	40004400 	.word	0x40004400
 8001d80:	40004800 	.word	0x40004800
 8001d84:	40004c00 	.word	0x40004c00

08001d88 <USART_Cmd>:
 8001d88:	bf00      	nop
 8001d8a:	bf00      	nop
 8001d8c:	6803      	ldr	r3, [r0, #0]
 8001d8e:	b111      	cbz	r1, 8001d96 <USART_Cmd+0xe>
 8001d90:	f043 0301 	orr.w	r3, r3, #1
 8001d94:	e001      	b.n	8001d9a <USART_Cmd+0x12>
 8001d96:	f023 0301 	bic.w	r3, r3, #1
 8001d9a:	6003      	str	r3, [r0, #0]
 8001d9c:	4770      	bx	lr

08001d9e <USART_ReceiveData>:
 8001d9e:	bf00      	nop
 8001da0:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8001da2:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8001da6:	4770      	bx	lr

08001da8 <USART_ITConfig>:
 8001da8:	b510      	push	{r4, lr}
 8001daa:	bf00      	nop
 8001dac:	bf00      	nop
 8001dae:	bf00      	nop
 8001db0:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8001db4:	2401      	movs	r4, #1
 8001db6:	b2c9      	uxtb	r1, r1
 8001db8:	2b02      	cmp	r3, #2
 8001dba:	fa04 f101 	lsl.w	r1, r4, r1
 8001dbe:	d101      	bne.n	8001dc4 <USART_ITConfig+0x1c>
 8001dc0:	3004      	adds	r0, #4
 8001dc2:	e002      	b.n	8001dca <USART_ITConfig+0x22>
 8001dc4:	2b03      	cmp	r3, #3
 8001dc6:	bf08      	it	eq
 8001dc8:	3008      	addeq	r0, #8
 8001dca:	6803      	ldr	r3, [r0, #0]
 8001dcc:	b10a      	cbz	r2, 8001dd2 <USART_ITConfig+0x2a>
 8001dce:	4319      	orrs	r1, r3
 8001dd0:	e001      	b.n	8001dd6 <USART_ITConfig+0x2e>
 8001dd2:	ea23 0101 	bic.w	r1, r3, r1
 8001dd6:	6001      	str	r1, [r0, #0]
 8001dd8:	bd10      	pop	{r4, pc}

08001dda <USART_GetITStatus>:
 8001dda:	b510      	push	{r4, lr}
 8001ddc:	bf00      	nop
 8001dde:	bf00      	nop
 8001de0:	2401      	movs	r4, #1
 8001de2:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8001de6:	b2cb      	uxtb	r3, r1
 8001de8:	42a2      	cmp	r2, r4
 8001dea:	fa04 f303 	lsl.w	r3, r4, r3
 8001dee:	d101      	bne.n	8001df4 <USART_GetITStatus+0x1a>
 8001df0:	6802      	ldr	r2, [r0, #0]
 8001df2:	e003      	b.n	8001dfc <USART_GetITStatus+0x22>
 8001df4:	2a02      	cmp	r2, #2
 8001df6:	bf0c      	ite	eq
 8001df8:	6842      	ldreq	r2, [r0, #4]
 8001dfa:	6882      	ldrne	r2, [r0, #8]
 8001dfc:	4013      	ands	r3, r2
 8001dfe:	69c2      	ldr	r2, [r0, #28]
 8001e00:	b143      	cbz	r3, 8001e14 <USART_GetITStatus+0x3a>
 8001e02:	2301      	movs	r3, #1
 8001e04:	0c09      	lsrs	r1, r1, #16
 8001e06:	fa03 f101 	lsl.w	r1, r3, r1
 8001e0a:	4211      	tst	r1, r2
 8001e0c:	bf0c      	ite	eq
 8001e0e:	2000      	moveq	r0, #0
 8001e10:	2001      	movne	r0, #1
 8001e12:	bd10      	pop	{r4, pc}
 8001e14:	4618      	mov	r0, r3
 8001e16:	bd10      	pop	{r4, pc}

08001e18 <USART_ClearITPendingBit>:
 8001e18:	bf00      	nop
 8001e1a:	bf00      	nop
 8001e1c:	2301      	movs	r3, #1
 8001e1e:	0c09      	lsrs	r1, r1, #16
 8001e20:	fa03 f101 	lsl.w	r1, r3, r1
 8001e24:	6201      	str	r1, [r0, #32]
 8001e26:	4770      	bx	lr

08001e28 <uart_write>:
 8001e28:	4b03      	ldr	r3, [pc, #12]	; (8001e38 <uart_write+0x10>)
 8001e2a:	69da      	ldr	r2, [r3, #28]
 8001e2c:	0612      	lsls	r2, r2, #24
 8001e2e:	d401      	bmi.n	8001e34 <uart_write+0xc>
 8001e30:	bf00      	nop
 8001e32:	e7f9      	b.n	8001e28 <uart_write>
 8001e34:	8518      	strh	r0, [r3, #40]	; 0x28
 8001e36:	4770      	bx	lr
 8001e38:	40013800 	.word	0x40013800

08001e3c <uart_is_char>:
 8001e3c:	4b0a      	ldr	r3, [pc, #40]	; (8001e68 <uart_is_char+0x2c>)
 8001e3e:	4a0b      	ldr	r2, [pc, #44]	; (8001e6c <uart_is_char+0x30>)
 8001e40:	6819      	ldr	r1, [r3, #0]
 8001e42:	6812      	ldr	r2, [r2, #0]
 8001e44:	4291      	cmp	r1, r2
 8001e46:	d00c      	beq.n	8001e62 <uart_is_char+0x26>
 8001e48:	681a      	ldr	r2, [r3, #0]
 8001e4a:	4909      	ldr	r1, [pc, #36]	; (8001e70 <uart_is_char+0x34>)
 8001e4c:	5c88      	ldrb	r0, [r1, r2]
 8001e4e:	681a      	ldr	r2, [r3, #0]
 8001e50:	3201      	adds	r2, #1
 8001e52:	601a      	str	r2, [r3, #0]
 8001e54:	681a      	ldr	r2, [r3, #0]
 8001e56:	2a0f      	cmp	r2, #15
 8001e58:	b2c0      	uxtb	r0, r0
 8001e5a:	d904      	bls.n	8001e66 <uart_is_char+0x2a>
 8001e5c:	2200      	movs	r2, #0
 8001e5e:	601a      	str	r2, [r3, #0]
 8001e60:	4770      	bx	lr
 8001e62:	f64f 70ff 	movw	r0, #65535	; 0xffff
 8001e66:	4770      	bx	lr
 8001e68:	20000e58 	.word	0x20000e58
 8001e6c:	20000e54 	.word	0x20000e54
 8001e70:	20000e44 	.word	0x20000e44

08001e74 <uart_read>:
 8001e74:	b508      	push	{r3, lr}
 8001e76:	f7ff ffe1 	bl	8001e3c <uart_is_char>
 8001e7a:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8001e7e:	4298      	cmp	r0, r3
 8001e80:	d101      	bne.n	8001e86 <uart_read+0x12>
 8001e82:	bf00      	nop
 8001e84:	e7f7      	b.n	8001e76 <uart_read+0x2>
 8001e86:	b2c0      	uxtb	r0, r0
 8001e88:	bd08      	pop	{r3, pc}
	...

08001e8c <uart_init>:
 8001e8c:	b530      	push	{r4, r5, lr}
 8001e8e:	4b2c      	ldr	r3, [pc, #176]	; (8001f40 <uart_init+0xb4>)
 8001e90:	4d2c      	ldr	r5, [pc, #176]	; (8001f44 <uart_init+0xb8>)
 8001e92:	2400      	movs	r4, #0
 8001e94:	601c      	str	r4, [r3, #0]
 8001e96:	4b2c      	ldr	r3, [pc, #176]	; (8001f48 <uart_init+0xbc>)
 8001e98:	b08b      	sub	sp, #44	; 0x2c
 8001e9a:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001e9e:	2101      	movs	r1, #1
 8001ea0:	601c      	str	r4, [r3, #0]
 8001ea2:	f7ff fdc3 	bl	8001a2c <RCC_AHBPeriphClockCmd>
 8001ea6:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001eaa:	2101      	movs	r1, #1
 8001eac:	f7ff fdcc 	bl	8001a48 <RCC_APB2PeriphClockCmd>
 8001eb0:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001eb4:	9302      	str	r3, [sp, #8]
 8001eb6:	2302      	movs	r3, #2
 8001eb8:	f88d 300c 	strb.w	r3, [sp, #12]
 8001ebc:	a902      	add	r1, sp, #8
 8001ebe:	2303      	movs	r3, #3
 8001ec0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001ec4:	f88d 300d 	strb.w	r3, [sp, #13]
 8001ec8:	f88d 400e 	strb.w	r4, [sp, #14]
 8001ecc:	f88d 400f 	strb.w	r4, [sp, #15]
 8001ed0:	f000 fa61 	bl	8002396 <GPIO_Init>
 8001ed4:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001ed8:	2109      	movs	r1, #9
 8001eda:	2207      	movs	r2, #7
 8001edc:	f000 faa9 	bl	8002432 <GPIO_PinAFConfig>
 8001ee0:	2207      	movs	r2, #7
 8001ee2:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001ee6:	210a      	movs	r1, #10
 8001ee8:	f000 faa3 	bl	8002432 <GPIO_PinAFConfig>
 8001eec:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001ef0:	9304      	str	r3, [sp, #16]
 8001ef2:	4628      	mov	r0, r5
 8001ef4:	230c      	movs	r3, #12
 8001ef6:	a904      	add	r1, sp, #16
 8001ef8:	9308      	str	r3, [sp, #32]
 8001efa:	9405      	str	r4, [sp, #20]
 8001efc:	9406      	str	r4, [sp, #24]
 8001efe:	9407      	str	r4, [sp, #28]
 8001f00:	9409      	str	r4, [sp, #36]	; 0x24
 8001f02:	f7ff fedf 	bl	8001cc4 <USART_Init>
 8001f06:	4628      	mov	r0, r5
 8001f08:	2101      	movs	r1, #1
 8001f0a:	f7ff ff3d 	bl	8001d88 <USART_Cmd>
 8001f0e:	2201      	movs	r2, #1
 8001f10:	4628      	mov	r0, r5
 8001f12:	490e      	ldr	r1, [pc, #56]	; (8001f4c <uart_init+0xc0>)
 8001f14:	f7ff ff48 	bl	8001da8 <USART_ITConfig>
 8001f18:	2325      	movs	r3, #37	; 0x25
 8001f1a:	f88d 4005 	strb.w	r4, [sp, #5]
 8001f1e:	f88d 4006 	strb.w	r4, [sp, #6]
 8001f22:	a801      	add	r0, sp, #4
 8001f24:	2401      	movs	r4, #1
 8001f26:	f88d 3004 	strb.w	r3, [sp, #4]
 8001f2a:	f88d 4007 	strb.w	r4, [sp, #7]
 8001f2e:	f000 f9ed 	bl	800230c <NVIC_Init>
 8001f32:	4628      	mov	r0, r5
 8001f34:	4621      	mov	r1, r4
 8001f36:	f7ff ff27 	bl	8001d88 <USART_Cmd>
 8001f3a:	b00b      	add	sp, #44	; 0x2c
 8001f3c:	bd30      	pop	{r4, r5, pc}
 8001f3e:	bf00      	nop
 8001f40:	20000e54 	.word	0x20000e54
 8001f44:	40013800 	.word	0x40013800
 8001f48:	20000e58 	.word	0x20000e58
 8001f4c:	00050105 	.word	0x00050105

08001f50 <USART1_IRQHandler>:
 8001f50:	b508      	push	{r3, lr}
 8001f52:	480d      	ldr	r0, [pc, #52]	; (8001f88 <USART1_IRQHandler+0x38>)
 8001f54:	490d      	ldr	r1, [pc, #52]	; (8001f8c <USART1_IRQHandler+0x3c>)
 8001f56:	f7ff ff40 	bl	8001dda <USART_GetITStatus>
 8001f5a:	b178      	cbz	r0, 8001f7c <USART1_IRQHandler+0x2c>
 8001f5c:	480a      	ldr	r0, [pc, #40]	; (8001f88 <USART1_IRQHandler+0x38>)
 8001f5e:	f7ff ff1e 	bl	8001d9e <USART_ReceiveData>
 8001f62:	4b0b      	ldr	r3, [pc, #44]	; (8001f90 <USART1_IRQHandler+0x40>)
 8001f64:	490b      	ldr	r1, [pc, #44]	; (8001f94 <USART1_IRQHandler+0x44>)
 8001f66:	681a      	ldr	r2, [r3, #0]
 8001f68:	b2c0      	uxtb	r0, r0
 8001f6a:	5488      	strb	r0, [r1, r2]
 8001f6c:	681a      	ldr	r2, [r3, #0]
 8001f6e:	3201      	adds	r2, #1
 8001f70:	601a      	str	r2, [r3, #0]
 8001f72:	681a      	ldr	r2, [r3, #0]
 8001f74:	2a0f      	cmp	r2, #15
 8001f76:	bf84      	itt	hi
 8001f78:	2200      	movhi	r2, #0
 8001f7a:	601a      	strhi	r2, [r3, #0]
 8001f7c:	4802      	ldr	r0, [pc, #8]	; (8001f88 <USART1_IRQHandler+0x38>)
 8001f7e:	4903      	ldr	r1, [pc, #12]	; (8001f8c <USART1_IRQHandler+0x3c>)
 8001f80:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001f84:	f7ff bf48 	b.w	8001e18 <USART_ClearITPendingBit>
 8001f88:	40013800 	.word	0x40013800
 8001f8c:	00050105 	.word	0x00050105
 8001f90:	20000e54 	.word	0x20000e54
 8001f94:	20000e44 	.word	0x20000e44

08001f98 <uart_clear_buffer>:
 8001f98:	b672      	cpsid	i
 8001f9a:	2300      	movs	r3, #0
 8001f9c:	4a03      	ldr	r2, [pc, #12]	; (8001fac <uart_clear_buffer+0x14>)
 8001f9e:	2100      	movs	r1, #0
 8001fa0:	54d1      	strb	r1, [r2, r3]
 8001fa2:	3301      	adds	r3, #1
 8001fa4:	2b10      	cmp	r3, #16
 8001fa6:	d1f9      	bne.n	8001f9c <uart_clear_buffer+0x4>
 8001fa8:	b662      	cpsie	i
 8001faa:	4770      	bx	lr
 8001fac:	20000e44 	.word	0x20000e44

08001fb0 <i2c_delay>:
 8001fb0:	230b      	movs	r3, #11
 8001fb2:	3b01      	subs	r3, #1
 8001fb4:	d001      	beq.n	8001fba <i2c_delay+0xa>
 8001fb6:	bf00      	nop
 8001fb8:	e7fb      	b.n	8001fb2 <i2c_delay+0x2>
 8001fba:	4770      	bx	lr

08001fbc <SetLowSDA>:
 8001fbc:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001fbe:	4d0d      	ldr	r5, [pc, #52]	; (8001ff4 <SetLowSDA+0x38>)
 8001fc0:	2301      	movs	r3, #1
 8001fc2:	2203      	movs	r2, #3
 8001fc4:	2480      	movs	r4, #128	; 0x80
 8001fc6:	f88d 3004 	strb.w	r3, [sp, #4]
 8001fca:	f88d 3006 	strb.w	r3, [sp, #6]
 8001fce:	4628      	mov	r0, r5
 8001fd0:	2300      	movs	r3, #0
 8001fd2:	4669      	mov	r1, sp
 8001fd4:	f88d 2005 	strb.w	r2, [sp, #5]
 8001fd8:	f88d 3007 	strb.w	r3, [sp, #7]
 8001fdc:	9400      	str	r4, [sp, #0]
 8001fde:	f000 f9da 	bl	8002396 <GPIO_Init>
 8001fe2:	4628      	mov	r0, r5
 8001fe4:	4621      	mov	r1, r4
 8001fe6:	f000 fa20 	bl	800242a <GPIO_ResetBits>
 8001fea:	f7ff ffe1 	bl	8001fb0 <i2c_delay>
 8001fee:	b003      	add	sp, #12
 8001ff0:	bd30      	pop	{r4, r5, pc}
 8001ff2:	bf00      	nop
 8001ff4:	48000400 	.word	0x48000400

08001ff8 <SetHighSDA>:
 8001ff8:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001ffa:	4d0d      	ldr	r5, [pc, #52]	; (8002030 <SetHighSDA+0x38>)
 8001ffc:	2203      	movs	r2, #3
 8001ffe:	2300      	movs	r3, #0
 8002000:	2480      	movs	r4, #128	; 0x80
 8002002:	f88d 2005 	strb.w	r2, [sp, #5]
 8002006:	4628      	mov	r0, r5
 8002008:	2201      	movs	r2, #1
 800200a:	4669      	mov	r1, sp
 800200c:	f88d 3004 	strb.w	r3, [sp, #4]
 8002010:	f88d 2006 	strb.w	r2, [sp, #6]
 8002014:	f88d 3007 	strb.w	r3, [sp, #7]
 8002018:	9400      	str	r4, [sp, #0]
 800201a:	f000 f9bc 	bl	8002396 <GPIO_Init>
 800201e:	4628      	mov	r0, r5
 8002020:	4621      	mov	r1, r4
 8002022:	f000 f9fe 	bl	8002422 <GPIO_SetBits>
 8002026:	f7ff ffc3 	bl	8001fb0 <i2c_delay>
 800202a:	b003      	add	sp, #12
 800202c:	bd30      	pop	{r4, r5, pc}
 800202e:	bf00      	nop
 8002030:	48000400 	.word	0x48000400

08002034 <SetLowSCL>:
 8002034:	b508      	push	{r3, lr}
 8002036:	4804      	ldr	r0, [pc, #16]	; (8002048 <SetLowSCL+0x14>)
 8002038:	2140      	movs	r1, #64	; 0x40
 800203a:	f000 f9f6 	bl	800242a <GPIO_ResetBits>
 800203e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8002042:	f7ff bfb5 	b.w	8001fb0 <i2c_delay>
 8002046:	bf00      	nop
 8002048:	48000400 	.word	0x48000400

0800204c <SetHighSCL>:
 800204c:	b508      	push	{r3, lr}
 800204e:	4804      	ldr	r0, [pc, #16]	; (8002060 <SetHighSCL+0x14>)
 8002050:	2140      	movs	r1, #64	; 0x40
 8002052:	f000 f9e6 	bl	8002422 <GPIO_SetBits>
 8002056:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800205a:	f7ff bfa9 	b.w	8001fb0 <i2c_delay>
 800205e:	bf00      	nop
 8002060:	48000400 	.word	0x48000400

08002064 <i2c_0_init>:
 8002064:	b507      	push	{r0, r1, r2, lr}
 8002066:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 800206a:	2101      	movs	r1, #1
 800206c:	f7ff fcde 	bl	8001a2c <RCC_AHBPeriphClockCmd>
 8002070:	23c0      	movs	r3, #192	; 0xc0
 8002072:	9300      	str	r3, [sp, #0]
 8002074:	2301      	movs	r3, #1
 8002076:	2203      	movs	r2, #3
 8002078:	480a      	ldr	r0, [pc, #40]	; (80020a4 <i2c_0_init+0x40>)
 800207a:	f88d 3004 	strb.w	r3, [sp, #4]
 800207e:	4669      	mov	r1, sp
 8002080:	f88d 3006 	strb.w	r3, [sp, #6]
 8002084:	2300      	movs	r3, #0
 8002086:	f88d 2005 	strb.w	r2, [sp, #5]
 800208a:	f88d 3007 	strb.w	r3, [sp, #7]
 800208e:	f000 f982 	bl	8002396 <GPIO_Init>
 8002092:	f7ff ffdb 	bl	800204c <SetHighSCL>
 8002096:	f7ff ff91 	bl	8001fbc <SetLowSDA>
 800209a:	f7ff ffad 	bl	8001ff8 <SetHighSDA>
 800209e:	b003      	add	sp, #12
 80020a0:	f85d fb04 	ldr.w	pc, [sp], #4
 80020a4:	48000400 	.word	0x48000400

080020a8 <i2cStart>:
 80020a8:	b508      	push	{r3, lr}
 80020aa:	f7ff ffcf 	bl	800204c <SetHighSCL>
 80020ae:	f7ff ffa3 	bl	8001ff8 <SetHighSDA>
 80020b2:	f7ff ffcb 	bl	800204c <SetHighSCL>
 80020b6:	f7ff ff81 	bl	8001fbc <SetLowSDA>
 80020ba:	f7ff ffbb 	bl	8002034 <SetLowSCL>
 80020be:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80020c2:	f7ff bf99 	b.w	8001ff8 <SetHighSDA>

080020c6 <i2cStop>:
 80020c6:	b508      	push	{r3, lr}
 80020c8:	f7ff ffb4 	bl	8002034 <SetLowSCL>
 80020cc:	f7ff ff76 	bl	8001fbc <SetLowSDA>
 80020d0:	f7ff ffbc 	bl	800204c <SetHighSCL>
 80020d4:	f7ff ff72 	bl	8001fbc <SetLowSDA>
 80020d8:	f7ff ffb8 	bl	800204c <SetHighSCL>
 80020dc:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80020e0:	f7ff bf8a 	b.w	8001ff8 <SetHighSDA>

080020e4 <i2cWrite>:
 80020e4:	b538      	push	{r3, r4, r5, lr}
 80020e6:	4604      	mov	r4, r0
 80020e8:	2508      	movs	r5, #8
 80020ea:	f7ff ffa3 	bl	8002034 <SetLowSCL>
 80020ee:	0623      	lsls	r3, r4, #24
 80020f0:	d502      	bpl.n	80020f8 <i2cWrite+0x14>
 80020f2:	f7ff ff81 	bl	8001ff8 <SetHighSDA>
 80020f6:	e001      	b.n	80020fc <i2cWrite+0x18>
 80020f8:	f7ff ff60 	bl	8001fbc <SetLowSDA>
 80020fc:	3d01      	subs	r5, #1
 80020fe:	f7ff ffa5 	bl	800204c <SetHighSCL>
 8002102:	0064      	lsls	r4, r4, #1
 8002104:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8002108:	b2e4      	uxtb	r4, r4
 800210a:	d1ee      	bne.n	80020ea <i2cWrite+0x6>
 800210c:	f7ff ff92 	bl	8002034 <SetLowSCL>
 8002110:	f7ff ff72 	bl	8001ff8 <SetHighSDA>
 8002114:	f7ff ff9a 	bl	800204c <SetHighSCL>
 8002118:	4b05      	ldr	r3, [pc, #20]	; (8002130 <i2cWrite+0x4c>)
 800211a:	8a1c      	ldrh	r4, [r3, #16]
 800211c:	b2a4      	uxth	r4, r4
 800211e:	f7ff ff89 	bl	8002034 <SetLowSCL>
 8002122:	f7ff ff45 	bl	8001fb0 <i2c_delay>
 8002126:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 800212a:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 800212e:	bd38      	pop	{r3, r4, r5, pc}
 8002130:	48000400 	.word	0x48000400

08002134 <i2cRead>:
 8002134:	b570      	push	{r4, r5, r6, lr}
 8002136:	4606      	mov	r6, r0
 8002138:	f7ff ff7c 	bl	8002034 <SetLowSCL>
 800213c:	f7ff ff5c 	bl	8001ff8 <SetHighSDA>
 8002140:	2508      	movs	r5, #8
 8002142:	2400      	movs	r4, #0
 8002144:	f7ff ff82 	bl	800204c <SetHighSCL>
 8002148:	4b0d      	ldr	r3, [pc, #52]	; (8002180 <i2cRead+0x4c>)
 800214a:	8a1b      	ldrh	r3, [r3, #16]
 800214c:	0064      	lsls	r4, r4, #1
 800214e:	061a      	lsls	r2, r3, #24
 8002150:	b2e4      	uxtb	r4, r4
 8002152:	bf48      	it	mi
 8002154:	3401      	addmi	r4, #1
 8002156:	f105 35ff 	add.w	r5, r5, #4294967295
 800215a:	bf48      	it	mi
 800215c:	b2e4      	uxtbmi	r4, r4
 800215e:	f7ff ff69 	bl	8002034 <SetLowSCL>
 8002162:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8002166:	d1ed      	bne.n	8002144 <i2cRead+0x10>
 8002168:	b10e      	cbz	r6, 800216e <i2cRead+0x3a>
 800216a:	f7ff ff27 	bl	8001fbc <SetLowSDA>
 800216e:	f7ff ff6d 	bl	800204c <SetHighSCL>
 8002172:	f7ff ff5f 	bl	8002034 <SetLowSCL>
 8002176:	f7ff ff1b 	bl	8001fb0 <i2c_delay>
 800217a:	4620      	mov	r0, r4
 800217c:	bd70      	pop	{r4, r5, r6, pc}
 800217e:	bf00      	nop
 8002180:	48000400 	.word	0x48000400

08002184 <i2c_write_reg>:
 8002184:	b570      	push	{r4, r5, r6, lr}
 8002186:	4605      	mov	r5, r0
 8002188:	460c      	mov	r4, r1
 800218a:	4616      	mov	r6, r2
 800218c:	f7ff ff8c 	bl	80020a8 <i2cStart>
 8002190:	4628      	mov	r0, r5
 8002192:	f7ff ffa7 	bl	80020e4 <i2cWrite>
 8002196:	4620      	mov	r0, r4
 8002198:	f7ff ffa4 	bl	80020e4 <i2cWrite>
 800219c:	4630      	mov	r0, r6
 800219e:	f7ff ffa1 	bl	80020e4 <i2cWrite>
 80021a2:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80021a6:	f7ff bf8e 	b.w	80020c6 <i2cStop>

080021aa <i2c_read_reg>:
 80021aa:	b538      	push	{r3, r4, r5, lr}
 80021ac:	4604      	mov	r4, r0
 80021ae:	460d      	mov	r5, r1
 80021b0:	f7ff ff7a 	bl	80020a8 <i2cStart>
 80021b4:	4620      	mov	r0, r4
 80021b6:	f7ff ff95 	bl	80020e4 <i2cWrite>
 80021ba:	4628      	mov	r0, r5
 80021bc:	f7ff ff92 	bl	80020e4 <i2cWrite>
 80021c0:	f7ff ff72 	bl	80020a8 <i2cStart>
 80021c4:	f044 0001 	orr.w	r0, r4, #1
 80021c8:	f7ff ff8c 	bl	80020e4 <i2cWrite>
 80021cc:	2000      	movs	r0, #0
 80021ce:	f7ff ffb1 	bl	8002134 <i2cRead>
 80021d2:	4604      	mov	r4, r0
 80021d4:	f7ff ff77 	bl	80020c6 <i2cStop>
 80021d8:	4620      	mov	r0, r4
 80021da:	bd38      	pop	{r3, r4, r5, pc}

080021dc <SystemInit>:
 80021dc:	4b3b      	ldr	r3, [pc, #236]	; (80022cc <SystemInit+0xf0>)
 80021de:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 80021e2:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80021e6:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80021ea:	4b39      	ldr	r3, [pc, #228]	; (80022d0 <SystemInit+0xf4>)
 80021ec:	681a      	ldr	r2, [r3, #0]
 80021ee:	f042 0201 	orr.w	r2, r2, #1
 80021f2:	601a      	str	r2, [r3, #0]
 80021f4:	6859      	ldr	r1, [r3, #4]
 80021f6:	4a37      	ldr	r2, [pc, #220]	; (80022d4 <SystemInit+0xf8>)
 80021f8:	400a      	ands	r2, r1
 80021fa:	605a      	str	r2, [r3, #4]
 80021fc:	681a      	ldr	r2, [r3, #0]
 80021fe:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 8002202:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8002206:	601a      	str	r2, [r3, #0]
 8002208:	681a      	ldr	r2, [r3, #0]
 800220a:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 800220e:	601a      	str	r2, [r3, #0]
 8002210:	685a      	ldr	r2, [r3, #4]
 8002212:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8002216:	605a      	str	r2, [r3, #4]
 8002218:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 800221a:	f022 020f 	bic.w	r2, r2, #15
 800221e:	62da      	str	r2, [r3, #44]	; 0x2c
 8002220:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002222:	4a2d      	ldr	r2, [pc, #180]	; (80022d8 <SystemInit+0xfc>)
 8002224:	b082      	sub	sp, #8
 8002226:	400a      	ands	r2, r1
 8002228:	631a      	str	r2, [r3, #48]	; 0x30
 800222a:	2200      	movs	r2, #0
 800222c:	609a      	str	r2, [r3, #8]
 800222e:	9200      	str	r2, [sp, #0]
 8002230:	9201      	str	r2, [sp, #4]
 8002232:	681a      	ldr	r2, [r3, #0]
 8002234:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8002238:	601a      	str	r2, [r3, #0]
 800223a:	4b25      	ldr	r3, [pc, #148]	; (80022d0 <SystemInit+0xf4>)
 800223c:	681a      	ldr	r2, [r3, #0]
 800223e:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8002242:	9201      	str	r2, [sp, #4]
 8002244:	9a00      	ldr	r2, [sp, #0]
 8002246:	3201      	adds	r2, #1
 8002248:	9200      	str	r2, [sp, #0]
 800224a:	9a01      	ldr	r2, [sp, #4]
 800224c:	b91a      	cbnz	r2, 8002256 <SystemInit+0x7a>
 800224e:	9a00      	ldr	r2, [sp, #0]
 8002250:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8002254:	d1f1      	bne.n	800223a <SystemInit+0x5e>
 8002256:	681b      	ldr	r3, [r3, #0]
 8002258:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 800225c:	bf18      	it	ne
 800225e:	2301      	movne	r3, #1
 8002260:	9301      	str	r3, [sp, #4]
 8002262:	9b01      	ldr	r3, [sp, #4]
 8002264:	2b01      	cmp	r3, #1
 8002266:	d005      	beq.n	8002274 <SystemInit+0x98>
 8002268:	4b18      	ldr	r3, [pc, #96]	; (80022cc <SystemInit+0xf0>)
 800226a:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 800226e:	609a      	str	r2, [r3, #8]
 8002270:	b002      	add	sp, #8
 8002272:	4770      	bx	lr
 8002274:	4b19      	ldr	r3, [pc, #100]	; (80022dc <SystemInit+0x100>)
 8002276:	2212      	movs	r2, #18
 8002278:	601a      	str	r2, [r3, #0]
 800227a:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 800227e:	685a      	ldr	r2, [r3, #4]
 8002280:	605a      	str	r2, [r3, #4]
 8002282:	685a      	ldr	r2, [r3, #4]
 8002284:	605a      	str	r2, [r3, #4]
 8002286:	685a      	ldr	r2, [r3, #4]
 8002288:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 800228c:	605a      	str	r2, [r3, #4]
 800228e:	685a      	ldr	r2, [r3, #4]
 8002290:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8002294:	605a      	str	r2, [r3, #4]
 8002296:	685a      	ldr	r2, [r3, #4]
 8002298:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 800229c:	605a      	str	r2, [r3, #4]
 800229e:	681a      	ldr	r2, [r3, #0]
 80022a0:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 80022a4:	601a      	str	r2, [r3, #0]
 80022a6:	6819      	ldr	r1, [r3, #0]
 80022a8:	4a09      	ldr	r2, [pc, #36]	; (80022d0 <SystemInit+0xf4>)
 80022aa:	0189      	lsls	r1, r1, #6
 80022ac:	d5fb      	bpl.n	80022a6 <SystemInit+0xca>
 80022ae:	6853      	ldr	r3, [r2, #4]
 80022b0:	f023 0303 	bic.w	r3, r3, #3
 80022b4:	6053      	str	r3, [r2, #4]
 80022b6:	6853      	ldr	r3, [r2, #4]
 80022b8:	f043 0302 	orr.w	r3, r3, #2
 80022bc:	6053      	str	r3, [r2, #4]
 80022be:	4b04      	ldr	r3, [pc, #16]	; (80022d0 <SystemInit+0xf4>)
 80022c0:	685b      	ldr	r3, [r3, #4]
 80022c2:	f003 030c 	and.w	r3, r3, #12
 80022c6:	2b08      	cmp	r3, #8
 80022c8:	d1f9      	bne.n	80022be <SystemInit+0xe2>
 80022ca:	e7cd      	b.n	8002268 <SystemInit+0x8c>
 80022cc:	e000ed00 	.word	0xe000ed00
 80022d0:	40021000 	.word	0x40021000
 80022d4:	f87fc00c 	.word	0xf87fc00c
 80022d8:	ff00fccc 	.word	0xff00fccc
 80022dc:	40022000 	.word	0x40022000

080022e0 <sys_tick_init>:
 80022e0:	4b05      	ldr	r3, [pc, #20]	; (80022f8 <sys_tick_init+0x18>)
 80022e2:	4a06      	ldr	r2, [pc, #24]	; (80022fc <sys_tick_init+0x1c>)
 80022e4:	605a      	str	r2, [r3, #4]
 80022e6:	4a06      	ldr	r2, [pc, #24]	; (8002300 <sys_tick_init+0x20>)
 80022e8:	21f0      	movs	r1, #240	; 0xf0
 80022ea:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 80022ee:	2200      	movs	r2, #0
 80022f0:	609a      	str	r2, [r3, #8]
 80022f2:	2207      	movs	r2, #7
 80022f4:	601a      	str	r2, [r3, #0]
 80022f6:	4770      	bx	lr
 80022f8:	e000e010 	.word	0xe000e010
 80022fc:	00029040 	.word	0x00029040
 8002300:	e000ed00 	.word	0xe000ed00

08002304 <sleep>:
 8002304:	bf30      	wfi
 8002306:	4770      	bx	lr

08002308 <sytem_clock_init>:
 8002308:	f7ff bf68 	b.w	80021dc <SystemInit>

0800230c <NVIC_Init>:
 800230c:	b510      	push	{r4, lr}
 800230e:	bf00      	nop
 8002310:	bf00      	nop
 8002312:	bf00      	nop
 8002314:	78c2      	ldrb	r2, [r0, #3]
 8002316:	7803      	ldrb	r3, [r0, #0]
 8002318:	b30a      	cbz	r2, 800235e <NVIC_Init+0x52>
 800231a:	4a16      	ldr	r2, [pc, #88]	; (8002374 <NVIC_Init+0x68>)
 800231c:	7844      	ldrb	r4, [r0, #1]
 800231e:	68d2      	ldr	r2, [r2, #12]
 8002320:	43d2      	mvns	r2, r2
 8002322:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8002326:	f1c2 0104 	rsb	r1, r2, #4
 800232a:	b2c9      	uxtb	r1, r1
 800232c:	fa04 f101 	lsl.w	r1, r4, r1
 8002330:	240f      	movs	r4, #15
 8002332:	fa44 f202 	asr.w	r2, r4, r2
 8002336:	7884      	ldrb	r4, [r0, #2]
 8002338:	b2c9      	uxtb	r1, r1
 800233a:	4022      	ands	r2, r4
 800233c:	430a      	orrs	r2, r1
 800233e:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8002342:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8002346:	0112      	lsls	r2, r2, #4
 8002348:	b2d2      	uxtb	r2, r2
 800234a:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 800234e:	7803      	ldrb	r3, [r0, #0]
 8002350:	2201      	movs	r2, #1
 8002352:	0959      	lsrs	r1, r3, #5
 8002354:	f003 031f 	and.w	r3, r3, #31
 8002358:	fa02 f303 	lsl.w	r3, r2, r3
 800235c:	e006      	b.n	800236c <NVIC_Init+0x60>
 800235e:	0959      	lsrs	r1, r3, #5
 8002360:	2201      	movs	r2, #1
 8002362:	f003 031f 	and.w	r3, r3, #31
 8002366:	fa02 f303 	lsl.w	r3, r2, r3
 800236a:	3120      	adds	r1, #32
 800236c:	4a02      	ldr	r2, [pc, #8]	; (8002378 <NVIC_Init+0x6c>)
 800236e:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8002372:	bd10      	pop	{r4, pc}
 8002374:	e000ed00 	.word	0xe000ed00
 8002378:	e000e100 	.word	0xe000e100

0800237c <lib_low_level_init>:
 800237c:	b508      	push	{r3, lr}
 800237e:	f7ff ffc3 	bl	8002308 <sytem_clock_init>
 8002382:	f000 f899 	bl	80024b8 <gpio_init>
 8002386:	f7ff fd81 	bl	8001e8c <uart_init>
 800238a:	f7ff fbdd 	bl	8001b48 <timer_init>
 800238e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8002392:	f7ff be67 	b.w	8002064 <i2c_0_init>

08002396 <GPIO_Init>:
 8002396:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002398:	bf00      	nop
 800239a:	bf00      	nop
 800239c:	bf00      	nop
 800239e:	bf00      	nop
 80023a0:	2300      	movs	r3, #0
 80023a2:	680e      	ldr	r6, [r1, #0]
 80023a4:	461a      	mov	r2, r3
 80023a6:	2501      	movs	r5, #1
 80023a8:	4095      	lsls	r5, r2
 80023aa:	ea05 0406 	and.w	r4, r5, r6
 80023ae:	42ac      	cmp	r4, r5
 80023b0:	d131      	bne.n	8002416 <GPIO_Init+0x80>
 80023b2:	790d      	ldrb	r5, [r1, #4]
 80023b4:	1e6f      	subs	r7, r5, #1
 80023b6:	b2ff      	uxtb	r7, r7
 80023b8:	2f01      	cmp	r7, #1
 80023ba:	d81c      	bhi.n	80023f6 <GPIO_Init+0x60>
 80023bc:	bf00      	nop
 80023be:	f04f 0c03 	mov.w	ip, #3
 80023c2:	6887      	ldr	r7, [r0, #8]
 80023c4:	fa0c fc03 	lsl.w	ip, ip, r3
 80023c8:	ea27 070c 	bic.w	r7, r7, ip
 80023cc:	6087      	str	r7, [r0, #8]
 80023ce:	f891 c005 	ldrb.w	ip, [r1, #5]
 80023d2:	6887      	ldr	r7, [r0, #8]
 80023d4:	fa0c fc03 	lsl.w	ip, ip, r3
 80023d8:	ea4c 0707 	orr.w	r7, ip, r7
 80023dc:	6087      	str	r7, [r0, #8]
 80023de:	bf00      	nop
 80023e0:	8887      	ldrh	r7, [r0, #4]
 80023e2:	b2bf      	uxth	r7, r7
 80023e4:	ea27 0404 	bic.w	r4, r7, r4
 80023e8:	8084      	strh	r4, [r0, #4]
 80023ea:	798c      	ldrb	r4, [r1, #6]
 80023ec:	8887      	ldrh	r7, [r0, #4]
 80023ee:	4094      	lsls	r4, r2
 80023f0:	433c      	orrs	r4, r7
 80023f2:	b2a4      	uxth	r4, r4
 80023f4:	8084      	strh	r4, [r0, #4]
 80023f6:	2403      	movs	r4, #3
 80023f8:	6807      	ldr	r7, [r0, #0]
 80023fa:	409c      	lsls	r4, r3
 80023fc:	43e4      	mvns	r4, r4
 80023fe:	4027      	ands	r7, r4
 8002400:	6007      	str	r7, [r0, #0]
 8002402:	6807      	ldr	r7, [r0, #0]
 8002404:	409d      	lsls	r5, r3
 8002406:	433d      	orrs	r5, r7
 8002408:	6005      	str	r5, [r0, #0]
 800240a:	68c5      	ldr	r5, [r0, #12]
 800240c:	402c      	ands	r4, r5
 800240e:	79cd      	ldrb	r5, [r1, #7]
 8002410:	409d      	lsls	r5, r3
 8002412:	432c      	orrs	r4, r5
 8002414:	60c4      	str	r4, [r0, #12]
 8002416:	3201      	adds	r2, #1
 8002418:	2a10      	cmp	r2, #16
 800241a:	f103 0302 	add.w	r3, r3, #2
 800241e:	d1c2      	bne.n	80023a6 <GPIO_Init+0x10>
 8002420:	bdf0      	pop	{r4, r5, r6, r7, pc}

08002422 <GPIO_SetBits>:
 8002422:	bf00      	nop
 8002424:	bf00      	nop
 8002426:	6181      	str	r1, [r0, #24]
 8002428:	4770      	bx	lr

0800242a <GPIO_ResetBits>:
 800242a:	bf00      	nop
 800242c:	bf00      	nop
 800242e:	8501      	strh	r1, [r0, #40]	; 0x28
 8002430:	4770      	bx	lr

08002432 <GPIO_PinAFConfig>:
 8002432:	b510      	push	{r4, lr}
 8002434:	bf00      	nop
 8002436:	bf00      	nop
 8002438:	bf00      	nop
 800243a:	f001 0307 	and.w	r3, r1, #7
 800243e:	08c9      	lsrs	r1, r1, #3
 8002440:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8002444:	009b      	lsls	r3, r3, #2
 8002446:	6a04      	ldr	r4, [r0, #32]
 8002448:	210f      	movs	r1, #15
 800244a:	4099      	lsls	r1, r3
 800244c:	ea24 0101 	bic.w	r1, r4, r1
 8002450:	6201      	str	r1, [r0, #32]
 8002452:	6a01      	ldr	r1, [r0, #32]
 8002454:	fa02 f303 	lsl.w	r3, r2, r3
 8002458:	430b      	orrs	r3, r1
 800245a:	6203      	str	r3, [r0, #32]
 800245c:	bd10      	pop	{r4, pc}
	...

08002460 <led_on>:
 8002460:	0401      	lsls	r1, r0, #16
 8002462:	d503      	bpl.n	800246c <led_on+0xc>
 8002464:	4b08      	ldr	r3, [pc, #32]	; (8002488 <led_on+0x28>)
 8002466:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800246a:	619a      	str	r2, [r3, #24]
 800246c:	0702      	lsls	r2, r0, #28
 800246e:	d503      	bpl.n	8002478 <led_on+0x18>
 8002470:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002474:	2208      	movs	r2, #8
 8002476:	851a      	strh	r2, [r3, #40]	; 0x28
 8002478:	07c3      	lsls	r3, r0, #31
 800247a:	d503      	bpl.n	8002484 <led_on+0x24>
 800247c:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002480:	2201      	movs	r2, #1
 8002482:	619a      	str	r2, [r3, #24]
 8002484:	4770      	bx	lr
 8002486:	bf00      	nop
 8002488:	48000400 	.word	0x48000400

0800248c <led_off>:
 800248c:	0402      	lsls	r2, r0, #16
 800248e:	d503      	bpl.n	8002498 <led_off+0xc>
 8002490:	4b08      	ldr	r3, [pc, #32]	; (80024b4 <led_off+0x28>)
 8002492:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8002496:	851a      	strh	r2, [r3, #40]	; 0x28
 8002498:	0703      	lsls	r3, r0, #28
 800249a:	d503      	bpl.n	80024a4 <led_off+0x18>
 800249c:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80024a0:	2208      	movs	r2, #8
 80024a2:	619a      	str	r2, [r3, #24]
 80024a4:	07c0      	lsls	r0, r0, #31
 80024a6:	d503      	bpl.n	80024b0 <led_off+0x24>
 80024a8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80024ac:	2201      	movs	r2, #1
 80024ae:	851a      	strh	r2, [r3, #40]	; 0x28
 80024b0:	4770      	bx	lr
 80024b2:	bf00      	nop
 80024b4:	48000400 	.word	0x48000400

080024b8 <gpio_init>:
 80024b8:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 80024bc:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80024c0:	2101      	movs	r1, #1
 80024c2:	f7ff fab3 	bl	8001a2c <RCC_AHBPeriphClockCmd>
 80024c6:	f8df 90a8 	ldr.w	r9, [pc, #168]	; 8002570 <gpio_init+0xb8>
 80024ca:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 80024ce:	2101      	movs	r1, #1
 80024d0:	f7ff faac 	bl	8001a2c <RCC_AHBPeriphClockCmd>
 80024d4:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 80024d8:	2101      	movs	r1, #1
 80024da:	f7ff faa7 	bl	8001a2c <RCC_AHBPeriphClockCmd>
 80024de:	2400      	movs	r4, #0
 80024e0:	2501      	movs	r5, #1
 80024e2:	2603      	movs	r6, #3
 80024e4:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 80024e8:	4648      	mov	r0, r9
 80024ea:	4669      	mov	r1, sp
 80024ec:	2708      	movs	r7, #8
 80024ee:	f8cd 8000 	str.w	r8, [sp]
 80024f2:	f88d 5004 	strb.w	r5, [sp, #4]
 80024f6:	f88d 4006 	strb.w	r4, [sp, #6]
 80024fa:	f88d 6005 	strb.w	r6, [sp, #5]
 80024fe:	f88d 4007 	strb.w	r4, [sp, #7]
 8002502:	f7ff ff48 	bl	8002396 <GPIO_Init>
 8002506:	4669      	mov	r1, sp
 8002508:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800250c:	9700      	str	r7, [sp, #0]
 800250e:	f88d 5004 	strb.w	r5, [sp, #4]
 8002512:	f88d 4006 	strb.w	r4, [sp, #6]
 8002516:	f88d 6005 	strb.w	r6, [sp, #5]
 800251a:	f88d 4007 	strb.w	r4, [sp, #7]
 800251e:	f7ff ff3a 	bl	8002396 <GPIO_Init>
 8002522:	4669      	mov	r1, sp
 8002524:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8002528:	9500      	str	r5, [sp, #0]
 800252a:	f88d 5004 	strb.w	r5, [sp, #4]
 800252e:	f88d 4006 	strb.w	r4, [sp, #6]
 8002532:	f88d 6005 	strb.w	r6, [sp, #5]
 8002536:	f88d 4007 	strb.w	r4, [sp, #7]
 800253a:	f7ff ff2c 	bl	8002396 <GPIO_Init>
 800253e:	f44f 7300 	mov.w	r3, #512	; 0x200
 8002542:	4669      	mov	r1, sp
 8002544:	4648      	mov	r0, r9
 8002546:	9300      	str	r3, [sp, #0]
 8002548:	f88d 4004 	strb.w	r4, [sp, #4]
 800254c:	f88d 6005 	strb.w	r6, [sp, #5]
 8002550:	f88d 4007 	strb.w	r4, [sp, #7]
 8002554:	f7ff ff1f 	bl	8002396 <GPIO_Init>
 8002558:	4640      	mov	r0, r8
 800255a:	f7ff ff81 	bl	8002460 <led_on>
 800255e:	4638      	mov	r0, r7
 8002560:	f7ff ff94 	bl	800248c <led_off>
 8002564:	4628      	mov	r0, r5
 8002566:	f7ff ff91 	bl	800248c <led_off>
 800256a:	b003      	add	sp, #12
 800256c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8002570:	48000400 	.word	0x48000400

08002574 <get_key>:
 8002574:	4b02      	ldr	r3, [pc, #8]	; (8002580 <get_key+0xc>)
 8002576:	8a18      	ldrh	r0, [r3, #16]
 8002578:	43c0      	mvns	r0, r0
 800257a:	f400 7000 	and.w	r0, r0, #512	; 0x200
 800257e:	4770      	bx	lr
 8002580:	48000400 	.word	0x48000400

08002584 <Default_Handler>:
 8002584:	4668      	mov	r0, sp
 8002586:	f020 0107 	bic.w	r1, r0, #7
 800258a:	468d      	mov	sp, r1
 800258c:	bf00      	nop
 800258e:	e7fd      	b.n	800258c <Default_Handler+0x8>

08002590 <HardFault_Handler>:
 8002590:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8002594:	f7ff ff64 	bl	8002460 <led_on>
 8002598:	4b06      	ldr	r3, [pc, #24]	; (80025b4 <HardFault_Handler+0x24>)
 800259a:	3b01      	subs	r3, #1
 800259c:	d001      	beq.n	80025a2 <HardFault_Handler+0x12>
 800259e:	bf00      	nop
 80025a0:	e7fb      	b.n	800259a <HardFault_Handler+0xa>
 80025a2:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80025a6:	f7ff ff71 	bl	800248c <led_off>
 80025aa:	4b02      	ldr	r3, [pc, #8]	; (80025b4 <HardFault_Handler+0x24>)
 80025ac:	3b01      	subs	r3, #1
 80025ae:	d0ef      	beq.n	8002590 <HardFault_Handler>
 80025b0:	bf00      	nop
 80025b2:	e7fb      	b.n	80025ac <HardFault_Handler+0x1c>
 80025b4:	00989681 	.word	0x00989681

080025b8 <_reset_init>:
 80025b8:	4a0e      	ldr	r2, [pc, #56]	; (80025f4 <_reset_init+0x3c>)
 80025ba:	480f      	ldr	r0, [pc, #60]	; (80025f8 <_reset_init+0x40>)
 80025bc:	1a80      	subs	r0, r0, r2
 80025be:	1080      	asrs	r0, r0, #2
 80025c0:	2300      	movs	r3, #0
 80025c2:	4283      	cmp	r3, r0
 80025c4:	d006      	beq.n	80025d4 <_reset_init+0x1c>
 80025c6:	490d      	ldr	r1, [pc, #52]	; (80025fc <_reset_init+0x44>)
 80025c8:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 80025cc:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 80025d0:	3301      	adds	r3, #1
 80025d2:	e7f6      	b.n	80025c2 <_reset_init+0xa>
 80025d4:	4b0a      	ldr	r3, [pc, #40]	; (8002600 <_reset_init+0x48>)
 80025d6:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 80025da:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80025de:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80025e2:	f503 730c 	add.w	r3, r3, #560	; 0x230
 80025e6:	685a      	ldr	r2, [r3, #4]
 80025e8:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 80025ec:	605a      	str	r2, [r3, #4]
 80025ee:	f7ff b87d 	b.w	80016ec <main>
 80025f2:	bf00      	nop
 80025f4:	20000000 	.word	0x20000000
 80025f8:	20000030 	.word	0x20000030
 80025fc:	0800276c 	.word	0x0800276c
 8002600:	e000ed00 	.word	0xe000ed00

08002604 <_init>:
 8002604:	e1a0c00d 	mov	ip, sp
 8002608:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 800260c:	e24cb004 	sub	fp, ip, #4
 8002610:	e24bd028 	sub	sp, fp, #40	; 0x28
 8002614:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8002618:	e12fff1e 	bx	lr

0800261c <_fini>:
 800261c:	e1a0c00d 	mov	ip, sp
 8002620:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8002624:	e24cb004 	sub	fp, ip, #4
 8002628:	e24bd028 	sub	sp, fp, #40	; 0x28
 800262c:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8002630:	e12fff1e 	bx	lr
 8002634:	69647473 	.word	0x69647473
 8002638:	6e69206f 	.word	0x6e69206f
 800263c:	64207469 	.word	0x64207469
 8002640:	0a656e6f 	.word	0x0a656e6f
 8002644:	00          	.byte	0x00
 8002645:	41          	.byte	0x41
 8002646:	2b54      	.short	0x2b54
 8002648:	4d504943 	.word	0x4d504943
 800264c:	313d5855 	.word	0x313d5855
 8002650:	41000a0d 	.word	0x41000a0d
 8002654:	49432b54 	.word	0x49432b54
 8002658:	58554d50 	.word	0x58554d50
 800265c:	0a0d303d 	.word	0x0a0d303d
 8002660:	2b544100 	.word	0x2b544100
 8002664:	4f4d5743 	.word	0x4f4d5743
 8002668:	313d4544 	.word	0x313d4544
 800266c:	41000a0d 	.word	0x41000a0d
 8002670:	57432b54 	.word	0x57432b54
 8002674:	3d50414a 	.word	0x3d50414a
 8002678:	69640022 	.word	0x69640022
 800267c:	6e6f6373 	.word	0x6e6f6373
 8002680:	7463656e 	.word	0x7463656e
 8002684:	76006465 	.word	0x76006465
 8002688:	68797265 	.word	0x68797265
 800268c:	00647261 	.word	0x00647261
 8002690:	000a0d22 	.word	0x000a0d22
 8002694:	432b5441 	.word	0x432b5441
 8002698:	45535049 	.word	0x45535049
 800269c:	52455652 	.word	0x52455652
 80026a0:	382c313d 	.word	0x382c313d
 80026a4:	000a0d30 	.word	0x000a0d30
 80026a8:	432b5441 	.word	0x432b5441
 80026ac:	54535049 	.word	0x54535049
 80026b0:	3d545241 	.word	0x3d545241
 80026b4:	50435422 	.word	0x50435422
 80026b8:	00222c22 	.word	0x00222c22
 80026bc:	41002c22 	.word	0x41002c22
 80026c0:	49432b54 	.word	0x49432b54
 80026c4:	4e455350 	.word	0x4e455350
 80026c8:	3e003d44 	.word	0x3e003d44
 80026cc:	2b544100 	.word	0x2b544100
 80026d0:	43504943 	.word	0x43504943
 80026d4:	45534f4c 	.word	0x45534f4c
 80026d8:	53000a0d 	.word	0x53000a0d
 80026dc:	20444e45 	.word	0x20444e45
 80026e0:	2b004b4f 	.word	0x2b004b4f
 80026e4:	2c445049 	.word	0x2c445049
 80026e8:	00000000 	.word	0x00000000
 80026ec:	00000020 	.word	0x00000020
 80026f0:	00000040 	.word	0x00000040
 80026f4:	00000060 	.word	0x00000060
 80026f8:	00000080 	.word	0x00000080
 80026fc:	2e323931 	.word	0x2e323931
 8002700:	2e383631 	.word	0x2e383631
 8002704:	00322e32 	.word	0x00322e32
 8002708:	38707365 	.word	0x38707365
 800270c:	20363632 	.word	0x20363632
 8002710:	7373656d 	.word	0x7373656d
 8002714:	00656761 	.word	0x00656761
 8002718:	6f727265 	.word	0x6f727265
 800271c:	6f632072 	.word	0x6f632072
 8002720:	25206564 	.word	0x25206564
 8002724:	75253a75 	.word	0x75253a75
 8002728:	000a      	.short	0x000a
 800272a:	770a      	.short	0x770a
 800272c:	6f636c65 	.word	0x6f636c65
 8002730:	7420656d 	.word	0x7420656d
 8002734:	7553206f 	.word	0x7553206f
 8002738:	6168757a 	.word	0x6168757a
 800273c:	5e20534f 	.word	0x5e20534f
 8002740:	32205e5f 	.word	0x32205e5f
 8002744:	362e302e 	.word	0x362e302e
 8002748:	4955420a 	.word	0x4955420a
 800274c:	4120444c 	.word	0x4120444c
 8002750:	32207270 	.word	0x32207270
 8002754:	30322030 	.word	0x30322030
 8002758:	31203631 	.word	0x31203631
 800275c:	30343a32 	.word	0x30343a32
 8002760:	0a34343a 	.word	0x0a34343a
 8002764:	00000000 	.word	0x00000000

08002768 <__EH_FRAME_BEGIN__>:
 8002768:	00000000                                ....
