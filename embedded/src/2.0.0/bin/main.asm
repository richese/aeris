
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
 80001aa:	f001 fefb 	bl	8001fa4 <sleep>
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
 8000282:	f001 fe7d 	bl	8001f80 <sys_tick_init>
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
 80003fe:	f001 fb67 	bl	8001ad0 <uart_write>
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
 80005d4:	080022d4 	.word	0x080022d4

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
 8000652:	f001 fa3d 	bl	8001ad0 <uart_write>
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
 8000690:	f001 f926 	bl	80018e0 <timer_get_time>
 8000694:	4405      	add	r5, r0
 8000696:	f001 fad3 	bl	8001c40 <uart_clear_buffer>
 800069a:	2400      	movs	r4, #0
 800069c:	f001 fa22 	bl	8001ae4 <uart_is_char>
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
 80006b8:	f001 fac2 	bl	8001c40 <uart_clear_buffer>
 80006bc:	2001      	movs	r0, #1
 80006be:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80006c0:	2400      	movs	r4, #0
 80006c2:	f001 f90d 	bl	80018e0 <timer_get_time>
 80006c6:	42a8      	cmp	r0, r5
 80006c8:	d3e8      	bcc.n	800069c <esp8266_find_stream+0x14>
 80006ca:	f001 fab9 	bl	8001c40 <uart_clear_buffer>
 80006ce:	2000      	movs	r0, #0
 80006d0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

080006d4 <esp8266_init>:
 80006d4:	b510      	push	{r4, lr}
 80006d6:	4604      	mov	r4, r0
 80006d8:	f640 30b8 	movw	r0, #3000	; 0xbb8
 80006dc:	f001 f90e 	bl	80018fc <timer_delay_ms>
 80006e0:	b10c      	cbz	r4, 80006e6 <esp8266_init+0x12>
 80006e2:	4818      	ldr	r0, [pc, #96]	; (8000744 <esp8266_init+0x70>)
 80006e4:	e000      	b.n	80006e8 <esp8266_init+0x14>
 80006e6:	4818      	ldr	r0, [pc, #96]	; (8000748 <esp8266_init+0x74>)
 80006e8:	f7ff ffae 	bl	8000648 <esp8266_send>
 80006ec:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006f0:	f001 f904 	bl	80018fc <timer_delay_ms>
 80006f4:	4815      	ldr	r0, [pc, #84]	; (800074c <esp8266_init+0x78>)
 80006f6:	f7ff ffa7 	bl	8000648 <esp8266_send>
 80006fa:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006fe:	f001 f8fd 	bl	80018fc <timer_delay_ms>
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
 8000738:	f001 f8e0 	bl	80018fc <timer_delay_ms>
 800073c:	2000      	movs	r0, #0
 800073e:	bd10      	pop	{r4, pc}
 8000740:	2002      	movs	r0, #2
 8000742:	bd10      	pop	{r4, pc}
 8000744:	080022e5 	.word	0x080022e5
 8000748:	080022f3 	.word	0x080022f3
 800074c:	08002301 	.word	0x08002301
 8000750:	0800230f 	.word	0x0800230f
 8000754:	0800231a 	.word	0x0800231a
 8000758:	08002358 	.word	0x08002358
 800075c:	08002327 	.word	0x08002327
 8000760:	08002330 	.word	0x08002330
 8000764:	08002380 	.word	0x08002380
 8000768:	08002334 	.word	0x08002334

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
 8000786:	f001 f8ab 	bl	80018e0 <timer_get_time>
 800078a:	4405      	add	r5, r0
 800078c:	f001 f9aa 	bl	8001ae4 <uart_is_char>
 8000790:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000794:	4298      	cmp	r0, r3
 8000796:	bf1c      	itt	ne
 8000798:	5530      	strbne	r0, [r6, r4]
 800079a:	3401      	addne	r4, #1
 800079c:	f001 f8a0 	bl	80018e0 <timer_get_time>
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
 8000828:	f001 f868 	bl	80018fc <timer_delay_ms>
 800082c:	2004      	movs	r0, #4
 800082e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000830:	42ac      	cmp	r4, r5
 8000832:	d004      	beq.n	800083e <esp8266_connect+0x7a>
 8000834:	f814 0b01 	ldrb.w	r0, [r4], #1
 8000838:	f001 f94a 	bl	8001ad0 <uart_write>
 800083c:	e7f8      	b.n	8000830 <esp8266_connect+0x6c>
 800083e:	4823      	ldr	r0, [pc, #140]	; (80008cc <esp8266_connect+0x108>)
 8000840:	2107      	movs	r1, #7
 8000842:	2264      	movs	r2, #100	; 0x64
 8000844:	f7ff ff20 	bl	8000688 <esp8266_find_stream>
 8000848:	b938      	cbnz	r0, 800085a <esp8266_connect+0x96>
 800084a:	481f      	ldr	r0, [pc, #124]	; (80008c8 <esp8266_connect+0x104>)
 800084c:	f7ff fefc 	bl	8000648 <esp8266_send>
 8000850:	2064      	movs	r0, #100	; 0x64
 8000852:	f001 f853 	bl	80018fc <timer_delay_ms>
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
 8000872:	f001 f843 	bl	80018fc <timer_delay_ms>
 8000876:	2006      	movs	r0, #6
 8000878:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800087a:	f001 f94f 	bl	8001b1c <uart_read>
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
 80008a0:	f001 f82c 	bl	80018fc <timer_delay_ms>
 80008a4:	f504 707a 	add.w	r0, r4, #1000	; 0x3e8
 80008a8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008aa:	2003      	movs	r0, #3
 80008ac:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008ae:	bf00      	nop
 80008b0:	08002348 	.word	0x08002348
 80008b4:	0800235c 	.word	0x0800235c
 80008b8:	08002331 	.word	0x08002331
 80008bc:	08002380 	.word	0x08002380
 80008c0:	0800235f 	.word	0x0800235f
 80008c4:	0800236b 	.word	0x0800236b
 80008c8:	0800236d 	.word	0x0800236d
 80008cc:	0800237b 	.word	0x0800237b
 80008d0:	08002383 	.word	0x08002383

080008d4 <motors_uninit>:
 80008d4:	b508      	push	{r3, lr}
 80008d6:	20c0      	movs	r0, #192	; 0xc0
 80008d8:	2100      	movs	r1, #0
 80008da:	2218      	movs	r2, #24
 80008dc:	f001 faa2 	bl	8001e24 <i2c_write_reg>
 80008e0:	20c2      	movs	r0, #194	; 0xc2
 80008e2:	2100      	movs	r1, #0
 80008e4:	2218      	movs	r2, #24
 80008e6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80008ea:	f001 ba9b 	b.w	8001e24 <i2c_write_reg>
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
 8000958:	f001 fa64 	bl	8001e24 <i2c_write_reg>
 800095c:	20c0      	movs	r0, #192	; 0xc0
 800095e:	2100      	movs	r1, #0
 8000960:	462a      	mov	r2, r5
 8000962:	f001 fa5f 	bl	8001e24 <i2c_write_reg>
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
 800099e:	f001 fa41 	bl	8001e24 <i2c_write_reg>
 80009a2:	4622      	mov	r2, r4
 80009a4:	20c2      	movs	r0, #194	; 0xc2
 80009a6:	2100      	movs	r1, #0
 80009a8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80009ac:	f001 ba3a 	b.w	8001e24 <i2c_write_reg>
 80009b0:	200001b0 	.word	0x200001b0

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
 80009c8:	200001b0 	.word	0x200001b0

080009cc <lsm9ds0_uninit>:
 80009cc:	b508      	push	{r3, lr}
 80009ce:	20d4      	movs	r0, #212	; 0xd4
 80009d0:	2120      	movs	r1, #32
 80009d2:	2200      	movs	r2, #0
 80009d4:	f001 fa26 	bl	8001e24 <i2c_write_reg>
 80009d8:	203c      	movs	r0, #60	; 0x3c
 80009da:	2120      	movs	r1, #32
 80009dc:	2200      	movs	r2, #0
 80009de:	f001 fa21 	bl	8001e24 <i2c_write_reg>
 80009e2:	203c      	movs	r0, #60	; 0x3c
 80009e4:	2124      	movs	r1, #36	; 0x24
 80009e6:	2200      	movs	r2, #0
 80009e8:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80009ec:	f001 ba1a 	b.w	8001e24 <i2c_write_reg>

080009f0 <lsm9ds0_read>:
 80009f0:	b538      	push	{r3, r4, r5, lr}
 80009f2:	2128      	movs	r1, #40	; 0x28
 80009f4:	20d4      	movs	r0, #212	; 0xd4
 80009f6:	f001 fa28 	bl	8001e4a <i2c_read_reg>
 80009fa:	2129      	movs	r1, #41	; 0x29
 80009fc:	4604      	mov	r4, r0
 80009fe:	20d4      	movs	r0, #212	; 0xd4
 8000a00:	f001 fa23 	bl	8001e4a <i2c_read_reg>
 8000a04:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
 8000a08:	4c46      	ldr	r4, [pc, #280]	; (8000b24 <lsm9ds0_read+0x134>)
 8000a0a:	b280      	uxth	r0, r0
 8000a0c:	81a0      	strh	r0, [r4, #12]
 8000a0e:	89a2      	ldrh	r2, [r4, #12]
 8000a10:	8a63      	ldrh	r3, [r4, #18]
 8000a12:	b292      	uxth	r2, r2
 8000a14:	b29b      	uxth	r3, r3
 8000a16:	1ad3      	subs	r3, r2, r3
 8000a18:	b29b      	uxth	r3, r3
 8000a1a:	212a      	movs	r1, #42	; 0x2a
 8000a1c:	20d4      	movs	r0, #212	; 0xd4
 8000a1e:	8323      	strh	r3, [r4, #24]
 8000a20:	f001 fa13 	bl	8001e4a <i2c_read_reg>
 8000a24:	212b      	movs	r1, #43	; 0x2b
 8000a26:	4605      	mov	r5, r0
 8000a28:	20d4      	movs	r0, #212	; 0xd4
 8000a2a:	f001 fa0e 	bl	8001e4a <i2c_read_reg>
 8000a2e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000a32:	b285      	uxth	r5, r0
 8000a34:	81e5      	strh	r5, [r4, #14]
 8000a36:	89e2      	ldrh	r2, [r4, #14]
 8000a38:	8aa3      	ldrh	r3, [r4, #20]
 8000a3a:	b292      	uxth	r2, r2
 8000a3c:	b29b      	uxth	r3, r3
 8000a3e:	1ad3      	subs	r3, r2, r3
 8000a40:	b29b      	uxth	r3, r3
 8000a42:	212c      	movs	r1, #44	; 0x2c
 8000a44:	20d4      	movs	r0, #212	; 0xd4
 8000a46:	8363      	strh	r3, [r4, #26]
 8000a48:	f001 f9ff 	bl	8001e4a <i2c_read_reg>
 8000a4c:	212d      	movs	r1, #45	; 0x2d
 8000a4e:	4605      	mov	r5, r0
 8000a50:	20d4      	movs	r0, #212	; 0xd4
 8000a52:	f001 f9fa 	bl	8001e4a <i2c_read_reg>
 8000a56:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000a5a:	b285      	uxth	r5, r0
 8000a5c:	8225      	strh	r5, [r4, #16]
 8000a5e:	8a22      	ldrh	r2, [r4, #16]
 8000a60:	8ae3      	ldrh	r3, [r4, #22]
 8000a62:	b292      	uxth	r2, r2
 8000a64:	b29b      	uxth	r3, r3
 8000a66:	1ad3      	subs	r3, r2, r3
 8000a68:	b29b      	uxth	r3, r3
 8000a6a:	2108      	movs	r1, #8
 8000a6c:	203c      	movs	r0, #60	; 0x3c
 8000a6e:	83a3      	strh	r3, [r4, #28]
 8000a70:	f001 f9eb 	bl	8001e4a <i2c_read_reg>
 8000a74:	2109      	movs	r1, #9
 8000a76:	4605      	mov	r5, r0
 8000a78:	203c      	movs	r0, #60	; 0x3c
 8000a7a:	f001 f9e6 	bl	8001e4a <i2c_read_reg>
 8000a7e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000a82:	b285      	uxth	r5, r0
 8000a84:	210a      	movs	r1, #10
 8000a86:	203c      	movs	r0, #60	; 0x3c
 8000a88:	80e5      	strh	r5, [r4, #6]
 8000a8a:	f001 f9de 	bl	8001e4a <i2c_read_reg>
 8000a8e:	210b      	movs	r1, #11
 8000a90:	4605      	mov	r5, r0
 8000a92:	203c      	movs	r0, #60	; 0x3c
 8000a94:	f001 f9d9 	bl	8001e4a <i2c_read_reg>
 8000a98:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000a9c:	b285      	uxth	r5, r0
 8000a9e:	210c      	movs	r1, #12
 8000aa0:	203c      	movs	r0, #60	; 0x3c
 8000aa2:	8125      	strh	r5, [r4, #8]
 8000aa4:	f001 f9d1 	bl	8001e4a <i2c_read_reg>
 8000aa8:	210d      	movs	r1, #13
 8000aaa:	4605      	mov	r5, r0
 8000aac:	203c      	movs	r0, #60	; 0x3c
 8000aae:	f001 f9cc 	bl	8001e4a <i2c_read_reg>
 8000ab2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ab6:	b285      	uxth	r5, r0
 8000ab8:	2128      	movs	r1, #40	; 0x28
 8000aba:	203c      	movs	r0, #60	; 0x3c
 8000abc:	8165      	strh	r5, [r4, #10]
 8000abe:	f001 f9c4 	bl	8001e4a <i2c_read_reg>
 8000ac2:	2129      	movs	r1, #41	; 0x29
 8000ac4:	4605      	mov	r5, r0
 8000ac6:	203c      	movs	r0, #60	; 0x3c
 8000ac8:	f001 f9bf 	bl	8001e4a <i2c_read_reg>
 8000acc:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ad0:	b285      	uxth	r5, r0
 8000ad2:	212a      	movs	r1, #42	; 0x2a
 8000ad4:	203c      	movs	r0, #60	; 0x3c
 8000ad6:	8025      	strh	r5, [r4, #0]
 8000ad8:	f001 f9b7 	bl	8001e4a <i2c_read_reg>
 8000adc:	212b      	movs	r1, #43	; 0x2b
 8000ade:	4605      	mov	r5, r0
 8000ae0:	203c      	movs	r0, #60	; 0x3c
 8000ae2:	f001 f9b2 	bl	8001e4a <i2c_read_reg>
 8000ae6:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000aea:	b285      	uxth	r5, r0
 8000aec:	212c      	movs	r1, #44	; 0x2c
 8000aee:	203c      	movs	r0, #60	; 0x3c
 8000af0:	8065      	strh	r5, [r4, #2]
 8000af2:	f001 f9aa 	bl	8001e4a <i2c_read_reg>
 8000af6:	212d      	movs	r1, #45	; 0x2d
 8000af8:	4605      	mov	r5, r0
 8000afa:	203c      	movs	r0, #60	; 0x3c
 8000afc:	f001 f9a5 	bl	8001e4a <i2c_read_reg>
 8000b00:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b04:	b285      	uxth	r5, r0
 8000b06:	2105      	movs	r1, #5
 8000b08:	203c      	movs	r0, #60	; 0x3c
 8000b0a:	80a5      	strh	r5, [r4, #4]
 8000b0c:	f001 f99d 	bl	8001e4a <i2c_read_reg>
 8000b10:	2106      	movs	r1, #6
 8000b12:	4605      	mov	r5, r0
 8000b14:	203c      	movs	r0, #60	; 0x3c
 8000b16:	f001 f998 	bl	8001e4a <i2c_read_reg>
 8000b1a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b1e:	b285      	uxth	r5, r0
 8000b20:	83e5      	strh	r5, [r4, #30]
 8000b22:	bd38      	pop	{r3, r4, r5, pc}
 8000b24:	20000168 	.word	0x20000168

08000b28 <lsm9ds0_calibrate>:
 8000b28:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000b2c:	2500      	movs	r5, #0
 8000b2e:	4681      	mov	r9, r0
 8000b30:	462f      	mov	r7, r5
 8000b32:	46a8      	mov	r8, r5
 8000b34:	462c      	mov	r4, r5
 8000b36:	454c      	cmp	r4, r9
 8000b38:	4e10      	ldr	r6, [pc, #64]	; (8000b7c <lsm9ds0_calibrate+0x54>)
 8000b3a:	d00f      	beq.n	8000b5c <lsm9ds0_calibrate+0x34>
 8000b3c:	f7ff ff58 	bl	80009f0 <lsm9ds0_read>
 8000b40:	89b3      	ldrh	r3, [r6, #12]
 8000b42:	fa08 f883 	sxtah	r8, r8, r3
 8000b46:	89f3      	ldrh	r3, [r6, #14]
 8000b48:	fa07 f783 	sxtah	r7, r7, r3
 8000b4c:	8a33      	ldrh	r3, [r6, #16]
 8000b4e:	200a      	movs	r0, #10
 8000b50:	fa05 f583 	sxtah	r5, r5, r3
 8000b54:	3401      	adds	r4, #1
 8000b56:	f000 fed1 	bl	80018fc <timer_delay_ms>
 8000b5a:	e7ec      	b.n	8000b36 <lsm9ds0_calibrate+0xe>
 8000b5c:	fb98 f8f4 	sdiv	r8, r8, r4
 8000b60:	fb97 f7f4 	sdiv	r7, r7, r4
 8000b64:	fb95 f4f4 	sdiv	r4, r5, r4
 8000b68:	fa1f f888 	uxth.w	r8, r8
 8000b6c:	b2bf      	uxth	r7, r7
 8000b6e:	b2a4      	uxth	r4, r4
 8000b70:	f8a6 8012 	strh.w	r8, [r6, #18]
 8000b74:	82b7      	strh	r7, [r6, #20]
 8000b76:	82f4      	strh	r4, [r6, #22]
 8000b78:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000b7c:	20000168 	.word	0x20000168

08000b80 <lsm9ds0_init>:
 8000b80:	4b29      	ldr	r3, [pc, #164]	; (8000c28 <lsm9ds0_init+0xa8>)
 8000b82:	b570      	push	{r4, r5, r6, lr}
 8000b84:	210f      	movs	r1, #15
 8000b86:	2400      	movs	r4, #0
 8000b88:	4606      	mov	r6, r0
 8000b8a:	20d4      	movs	r0, #212	; 0xd4
 8000b8c:	801c      	strh	r4, [r3, #0]
 8000b8e:	805c      	strh	r4, [r3, #2]
 8000b90:	809c      	strh	r4, [r3, #4]
 8000b92:	80dc      	strh	r4, [r3, #6]
 8000b94:	811c      	strh	r4, [r3, #8]
 8000b96:	815c      	strh	r4, [r3, #10]
 8000b98:	819c      	strh	r4, [r3, #12]
 8000b9a:	81dc      	strh	r4, [r3, #14]
 8000b9c:	821c      	strh	r4, [r3, #16]
 8000b9e:	831c      	strh	r4, [r3, #24]
 8000ba0:	835c      	strh	r4, [r3, #26]
 8000ba2:	839c      	strh	r4, [r3, #28]
 8000ba4:	83dc      	strh	r4, [r3, #30]
 8000ba6:	f001 f950 	bl	8001e4a <i2c_read_reg>
 8000baa:	28d4      	cmp	r0, #212	; 0xd4
 8000bac:	4605      	mov	r5, r0
 8000bae:	d137      	bne.n	8000c20 <lsm9ds0_init+0xa0>
 8000bb0:	203c      	movs	r0, #60	; 0x3c
 8000bb2:	210f      	movs	r1, #15
 8000bb4:	f001 f949 	bl	8001e4a <i2c_read_reg>
 8000bb8:	2849      	cmp	r0, #73	; 0x49
 8000bba:	d133      	bne.n	8000c24 <lsm9ds0_init+0xa4>
 8000bbc:	4628      	mov	r0, r5
 8000bbe:	2120      	movs	r1, #32
 8000bc0:	22ff      	movs	r2, #255	; 0xff
 8000bc2:	f001 f92f 	bl	8001e24 <i2c_write_reg>
 8000bc6:	4628      	mov	r0, r5
 8000bc8:	2123      	movs	r1, #35	; 0x23
 8000bca:	2218      	movs	r2, #24
 8000bcc:	f001 f92a 	bl	8001e24 <i2c_write_reg>
 8000bd0:	203c      	movs	r0, #60	; 0x3c
 8000bd2:	211f      	movs	r1, #31
 8000bd4:	4622      	mov	r2, r4
 8000bd6:	f001 f925 	bl	8001e24 <i2c_write_reg>
 8000bda:	203c      	movs	r0, #60	; 0x3c
 8000bdc:	2120      	movs	r1, #32
 8000bde:	2267      	movs	r2, #103	; 0x67
 8000be0:	f001 f920 	bl	8001e24 <i2c_write_reg>
 8000be4:	203c      	movs	r0, #60	; 0x3c
 8000be6:	2121      	movs	r1, #33	; 0x21
 8000be8:	4622      	mov	r2, r4
 8000bea:	f001 f91b 	bl	8001e24 <i2c_write_reg>
 8000bee:	203c      	movs	r0, #60	; 0x3c
 8000bf0:	2124      	movs	r1, #36	; 0x24
 8000bf2:	22f4      	movs	r2, #244	; 0xf4
 8000bf4:	f001 f916 	bl	8001e24 <i2c_write_reg>
 8000bf8:	203c      	movs	r0, #60	; 0x3c
 8000bfa:	2125      	movs	r1, #37	; 0x25
 8000bfc:	4622      	mov	r2, r4
 8000bfe:	f001 f911 	bl	8001e24 <i2c_write_reg>
 8000c02:	203c      	movs	r0, #60	; 0x3c
 8000c04:	2126      	movs	r1, #38	; 0x26
 8000c06:	2280      	movs	r2, #128	; 0x80
 8000c08:	f001 f90c 	bl	8001e24 <i2c_write_reg>
 8000c0c:	f7ff fef0 	bl	80009f0 <lsm9ds0_read>
 8000c10:	b116      	cbz	r6, 8000c18 <lsm9ds0_init+0x98>
 8000c12:	2064      	movs	r0, #100	; 0x64
 8000c14:	f7ff ff88 	bl	8000b28 <lsm9ds0_calibrate>
 8000c18:	f7ff feea 	bl	80009f0 <lsm9ds0_read>
 8000c1c:	2000      	movs	r0, #0
 8000c1e:	bd70      	pop	{r4, r5, r6, pc}
 8000c20:	2001      	movs	r0, #1
 8000c22:	bd70      	pop	{r4, r5, r6, pc}
 8000c24:	2002      	movs	r0, #2
 8000c26:	bd70      	pop	{r4, r5, r6, pc}
 8000c28:	20000168 	.word	0x20000168

08000c2c <rgb_sensor_uninit>:
 8000c2c:	b508      	push	{r3, lr}
 8000c2e:	2008      	movs	r0, #8
 8000c30:	f001 fa7c 	bl	800212c <led_off>
 8000c34:	2072      	movs	r0, #114	; 0x72
 8000c36:	2180      	movs	r1, #128	; 0x80
 8000c38:	2200      	movs	r2, #0
 8000c3a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000c3e:	f000 ba16 	b.w	800106e <rgb_i2c_write_reg>
	...

08000c44 <rgb_sensor_read>:
 8000c44:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000c46:	f000 f993 	bl	8000f70 <rgb_i2cStart>
 8000c4a:	2072      	movs	r0, #114	; 0x72
 8000c4c:	4d55      	ldr	r5, [pc, #340]	; (8000da4 <rgb_sensor_read+0x160>)
 8000c4e:	4c56      	ldr	r4, [pc, #344]	; (8000da8 <rgb_sensor_read+0x164>)
 8000c50:	f000 f9ac 	bl	8000fac <rgb_i2cWrite>
 8000c54:	20b4      	movs	r0, #180	; 0xb4
 8000c56:	f000 f9a9 	bl	8000fac <rgb_i2cWrite>
 8000c5a:	f000 f989 	bl	8000f70 <rgb_i2cStart>
 8000c5e:	2073      	movs	r0, #115	; 0x73
 8000c60:	f000 f9a4 	bl	8000fac <rgb_i2cWrite>
 8000c64:	2001      	movs	r0, #1
 8000c66:	4629      	mov	r1, r5
 8000c68:	f000 f9c0 	bl	8000fec <rgb_i2cRead>
 8000c6c:	782b      	ldrb	r3, [r5, #0]
 8000c6e:	8323      	strh	r3, [r4, #24]
 8000c70:	786b      	ldrb	r3, [r5, #1]
 8000c72:	8363      	strh	r3, [r4, #26]
 8000c74:	78ab      	ldrb	r3, [r5, #2]
 8000c76:	83a3      	strh	r3, [r4, #28]
 8000c78:	78eb      	ldrb	r3, [r5, #3]
 8000c7a:	2001      	movs	r0, #1
 8000c7c:	4629      	mov	r1, r5
 8000c7e:	83e3      	strh	r3, [r4, #30]
 8000c80:	f000 f9b4 	bl	8000fec <rgb_i2cRead>
 8000c84:	2300      	movs	r3, #0
 8000c86:	f103 020c 	add.w	r2, r3, #12
 8000c8a:	5ce8      	ldrb	r0, [r5, r3]
 8000c8c:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000c90:	4f45      	ldr	r7, [pc, #276]	; (8000da8 <rgb_sensor_read+0x164>)
 8000c92:	4e44      	ldr	r6, [pc, #272]	; (8000da4 <rgb_sensor_read+0x160>)
 8000c94:	b289      	uxth	r1, r1
 8000c96:	3301      	adds	r3, #1
 8000c98:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000c9c:	2b04      	cmp	r3, #4
 8000c9e:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000ca2:	d1f0      	bne.n	8000c86 <rgb_sensor_read+0x42>
 8000ca4:	2001      	movs	r0, #1
 8000ca6:	4631      	mov	r1, r6
 8000ca8:	f000 f9a0 	bl	8000fec <rgb_i2cRead>
 8000cac:	7833      	ldrb	r3, [r6, #0]
 8000cae:	803b      	strh	r3, [r7, #0]
 8000cb0:	7873      	ldrb	r3, [r6, #1]
 8000cb2:	807b      	strh	r3, [r7, #2]
 8000cb4:	78b3      	ldrb	r3, [r6, #2]
 8000cb6:	80bb      	strh	r3, [r7, #4]
 8000cb8:	78f3      	ldrb	r3, [r6, #3]
 8000cba:	2001      	movs	r0, #1
 8000cbc:	4631      	mov	r1, r6
 8000cbe:	80fb      	strh	r3, [r7, #6]
 8000cc0:	f000 f994 	bl	8000fec <rgb_i2cRead>
 8000cc4:	2300      	movs	r3, #0
 8000cc6:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
 8000cca:	5ce9      	ldrb	r1, [r5, r3]
 8000ccc:	4f36      	ldr	r7, [pc, #216]	; (8000da8 <rgb_sensor_read+0x164>)
 8000cce:	4e35      	ldr	r6, [pc, #212]	; (8000da4 <rgb_sensor_read+0x160>)
 8000cd0:	b292      	uxth	r2, r2
 8000cd2:	ea42 2201 	orr.w	r2, r2, r1, lsl #8
 8000cd6:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
 8000cda:	3301      	adds	r3, #1
 8000cdc:	2b04      	cmp	r3, #4
 8000cde:	d1f2      	bne.n	8000cc6 <rgb_sensor_read+0x82>
 8000ce0:	2001      	movs	r0, #1
 8000ce2:	4631      	mov	r1, r6
 8000ce4:	f000 f982 	bl	8000fec <rgb_i2cRead>
 8000ce8:	7833      	ldrb	r3, [r6, #0]
 8000cea:	813b      	strh	r3, [r7, #8]
 8000cec:	7873      	ldrb	r3, [r6, #1]
 8000cee:	817b      	strh	r3, [r7, #10]
 8000cf0:	78b3      	ldrb	r3, [r6, #2]
 8000cf2:	81bb      	strh	r3, [r7, #12]
 8000cf4:	78f3      	ldrb	r3, [r6, #3]
 8000cf6:	2001      	movs	r0, #1
 8000cf8:	4631      	mov	r1, r6
 8000cfa:	81fb      	strh	r3, [r7, #14]
 8000cfc:	f000 f976 	bl	8000fec <rgb_i2cRead>
 8000d00:	2300      	movs	r3, #0
 8000d02:	1d1a      	adds	r2, r3, #4
 8000d04:	5ce8      	ldrb	r0, [r5, r3]
 8000d06:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d0a:	4f27      	ldr	r7, [pc, #156]	; (8000da8 <rgb_sensor_read+0x164>)
 8000d0c:	4e25      	ldr	r6, [pc, #148]	; (8000da4 <rgb_sensor_read+0x160>)
 8000d0e:	b289      	uxth	r1, r1
 8000d10:	3301      	adds	r3, #1
 8000d12:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d16:	2b04      	cmp	r3, #4
 8000d18:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d1c:	d1f1      	bne.n	8000d02 <rgb_sensor_read+0xbe>
 8000d1e:	2001      	movs	r0, #1
 8000d20:	4631      	mov	r1, r6
 8000d22:	f000 f963 	bl	8000fec <rgb_i2cRead>
 8000d26:	7833      	ldrb	r3, [r6, #0]
 8000d28:	823b      	strh	r3, [r7, #16]
 8000d2a:	7873      	ldrb	r3, [r6, #1]
 8000d2c:	827b      	strh	r3, [r7, #18]
 8000d2e:	78b3      	ldrb	r3, [r6, #2]
 8000d30:	82bb      	strh	r3, [r7, #20]
 8000d32:	78f3      	ldrb	r3, [r6, #3]
 8000d34:	2001      	movs	r0, #1
 8000d36:	4631      	mov	r1, r6
 8000d38:	82fb      	strh	r3, [r7, #22]
 8000d3a:	f000 f957 	bl	8000fec <rgb_i2cRead>
 8000d3e:	2300      	movs	r3, #0
 8000d40:	f103 0208 	add.w	r2, r3, #8
 8000d44:	5ce8      	ldrb	r0, [r5, r3]
 8000d46:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d4a:	4f17      	ldr	r7, [pc, #92]	; (8000da8 <rgb_sensor_read+0x164>)
 8000d4c:	4e15      	ldr	r6, [pc, #84]	; (8000da4 <rgb_sensor_read+0x160>)
 8000d4e:	b289      	uxth	r1, r1
 8000d50:	3301      	adds	r3, #1
 8000d52:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d56:	2b04      	cmp	r3, #4
 8000d58:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d5c:	d1f0      	bne.n	8000d40 <rgb_sensor_read+0xfc>
 8000d5e:	2001      	movs	r0, #1
 8000d60:	4631      	mov	r1, r6
 8000d62:	f000 f943 	bl	8000fec <rgb_i2cRead>
 8000d66:	7833      	ldrb	r3, [r6, #0]
 8000d68:	843b      	strh	r3, [r7, #32]
 8000d6a:	7873      	ldrb	r3, [r6, #1]
 8000d6c:	847b      	strh	r3, [r7, #34]	; 0x22
 8000d6e:	78b3      	ldrb	r3, [r6, #2]
 8000d70:	84bb      	strh	r3, [r7, #36]	; 0x24
 8000d72:	78f3      	ldrb	r3, [r6, #3]
 8000d74:	2000      	movs	r0, #0
 8000d76:	4631      	mov	r1, r6
 8000d78:	84fb      	strh	r3, [r7, #38]	; 0x26
 8000d7a:	f000 f937 	bl	8000fec <rgb_i2cRead>
 8000d7e:	2300      	movs	r3, #0
 8000d80:	f103 0210 	add.w	r2, r3, #16
 8000d84:	5ce8      	ldrb	r0, [r5, r3]
 8000d86:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d8a:	3301      	adds	r3, #1
 8000d8c:	b289      	uxth	r1, r1
 8000d8e:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d92:	2b04      	cmp	r3, #4
 8000d94:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d98:	d1f2      	bne.n	8000d80 <rgb_sensor_read+0x13c>
 8000d9a:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8000d9e:	f000 b8f6 	b.w	8000f8e <rgb_i2cStop>
 8000da2:	bf00      	nop
 8000da4:	200005b8 	.word	0x200005b8
 8000da8:	20000188 	.word	0x20000188

08000dac <rgb_sensor_init>:
 8000dac:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000dae:	2300      	movs	r3, #0
 8000db0:	4a24      	ldr	r2, [pc, #144]	; (8000e44 <rgb_sensor_init+0x98>)
 8000db2:	1d19      	adds	r1, r3, #4
 8000db4:	2400      	movs	r4, #0
 8000db6:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8000dba:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000dbe:	f103 0108 	add.w	r1, r3, #8
 8000dc2:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000dc6:	f103 0110 	add.w	r1, r3, #16
 8000dca:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000dce:	f103 010c 	add.w	r1, r3, #12
 8000dd2:	3301      	adds	r3, #1
 8000dd4:	2b04      	cmp	r3, #4
 8000dd6:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000dda:	d1e9      	bne.n	8000db0 <rgb_sensor_init+0x4>
 8000ddc:	2008      	movs	r0, #8
 8000dde:	f001 f98f 	bl	8002100 <led_on>
 8000de2:	f000 f895 	bl	8000f10 <rgb_i2c_init>
 8000de6:	2072      	movs	r0, #114	; 0x72
 8000de8:	2181      	movs	r1, #129	; 0x81
 8000dea:	22ff      	movs	r2, #255	; 0xff
 8000dec:	f000 f93f 	bl	800106e <rgb_i2c_write_reg>
 8000df0:	2072      	movs	r0, #114	; 0x72
 8000df2:	2183      	movs	r1, #131	; 0x83
 8000df4:	22ff      	movs	r2, #255	; 0xff
 8000df6:	f000 f93a 	bl	800106e <rgb_i2c_write_reg>
 8000dfa:	2072      	movs	r0, #114	; 0x72
 8000dfc:	218d      	movs	r1, #141	; 0x8d
 8000dfe:	4622      	mov	r2, r4
 8000e00:	f000 f935 	bl	800106e <rgb_i2c_write_reg>
 8000e04:	2072      	movs	r0, #114	; 0x72
 8000e06:	2180      	movs	r1, #128	; 0x80
 8000e08:	2203      	movs	r2, #3
 8000e0a:	f000 f930 	bl	800106e <rgb_i2c_write_reg>
 8000e0e:	ad01      	add	r5, sp, #4
 8000e10:	2072      	movs	r0, #114	; 0x72
 8000e12:	218f      	movs	r1, #143	; 0x8f
 8000e14:	2223      	movs	r2, #35	; 0x23
 8000e16:	f000 f92a 	bl	800106e <rgb_i2c_write_reg>
 8000e1a:	f7ff ff13 	bl	8000c44 <rgb_sensor_read>
 8000e1e:	2072      	movs	r0, #114	; 0x72
 8000e20:	2192      	movs	r1, #146	; 0x92
 8000e22:	462a      	mov	r2, r5
 8000e24:	f000 f936 	bl	8001094 <rgb_i2c_read_reg>
 8000e28:	4620      	mov	r0, r4
 8000e2a:	4623      	mov	r3, r4
 8000e2c:	5cea      	ldrb	r2, [r5, r3]
 8000e2e:	2a69      	cmp	r2, #105	; 0x69
 8000e30:	d002      	beq.n	8000e38 <rgb_sensor_init+0x8c>
 8000e32:	2201      	movs	r2, #1
 8000e34:	409a      	lsls	r2, r3
 8000e36:	4310      	orrs	r0, r2
 8000e38:	3301      	adds	r3, #1
 8000e3a:	2b04      	cmp	r3, #4
 8000e3c:	d1f6      	bne.n	8000e2c <rgb_sensor_init+0x80>
 8000e3e:	b003      	add	sp, #12
 8000e40:	bd30      	pop	{r4, r5, pc}
 8000e42:	bf00      	nop
 8000e44:	20000188 	.word	0x20000188

08000e48 <rgb_get_line_position>:
 8000e48:	b510      	push	{r4, lr}
 8000e4a:	2300      	movs	r3, #0
 8000e4c:	461a      	mov	r2, r3
 8000e4e:	490c      	ldr	r1, [pc, #48]	; (8000e80 <rgb_get_line_position+0x38>)
 8000e50:	f102 000c 	add.w	r0, r2, #12
 8000e54:	f103 040c 	add.w	r4, r3, #12
 8000e58:	f831 0010 	ldrh.w	r0, [r1, r0, lsl #1]
 8000e5c:	f831 1014 	ldrh.w	r1, [r1, r4, lsl #1]
 8000e60:	b200      	sxth	r0, r0
 8000e62:	b209      	sxth	r1, r1
 8000e64:	4288      	cmp	r0, r1
 8000e66:	bfc8      	it	gt
 8000e68:	4613      	movgt	r3, r2
 8000e6a:	3201      	adds	r2, #1
 8000e6c:	2a04      	cmp	r2, #4
 8000e6e:	d1ee      	bne.n	8000e4e <rgb_get_line_position+0x6>
 8000e70:	2b03      	cmp	r3, #3
 8000e72:	d802      	bhi.n	8000e7a <rgb_get_line_position+0x32>
 8000e74:	4a03      	ldr	r2, [pc, #12]	; (8000e84 <rgb_get_line_position+0x3c>)
 8000e76:	56d0      	ldrsb	r0, [r2, r3]
 8000e78:	bd10      	pop	{r4, pc}
 8000e7a:	2000      	movs	r0, #0
 8000e7c:	bd10      	pop	{r4, pc}
 8000e7e:	bf00      	nop
 8000e80:	20000188 	.word	0x20000188
 8000e84:	08002389 	.word	0x08002389

08000e88 <rgb_i2c_delay>:
 8000e88:	bf00      	nop
 8000e8a:	4770      	bx	lr

08000e8c <RGBSetLowSDA>:
 8000e8c:	b513      	push	{r0, r1, r4, lr}
 8000e8e:	2301      	movs	r3, #1
 8000e90:	2203      	movs	r2, #3
 8000e92:	24f0      	movs	r4, #240	; 0xf0
 8000e94:	f88d 3004 	strb.w	r3, [sp, #4]
 8000e98:	f88d 3006 	strb.w	r3, [sp, #6]
 8000e9c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000ea0:	2300      	movs	r3, #0
 8000ea2:	4669      	mov	r1, sp
 8000ea4:	f88d 2005 	strb.w	r2, [sp, #5]
 8000ea8:	f88d 3007 	strb.w	r3, [sp, #7]
 8000eac:	9400      	str	r4, [sp, #0]
 8000eae:	f001 f8c2 	bl	8002036 <GPIO_Init>
 8000eb2:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000eb6:	851c      	strh	r4, [r3, #40]	; 0x28
 8000eb8:	f7ff ffe6 	bl	8000e88 <rgb_i2c_delay>
 8000ebc:	b002      	add	sp, #8
 8000ebe:	bd10      	pop	{r4, pc}

08000ec0 <RGBSetHighSDA>:
 8000ec0:	b513      	push	{r0, r1, r4, lr}
 8000ec2:	2300      	movs	r3, #0
 8000ec4:	2203      	movs	r2, #3
 8000ec6:	24f0      	movs	r4, #240	; 0xf0
 8000ec8:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000ecc:	4669      	mov	r1, sp
 8000ece:	f88d 3004 	strb.w	r3, [sp, #4]
 8000ed2:	f88d 2005 	strb.w	r2, [sp, #5]
 8000ed6:	f88d 3007 	strb.w	r3, [sp, #7]
 8000eda:	9400      	str	r4, [sp, #0]
 8000edc:	f001 f8ab 	bl	8002036 <GPIO_Init>
 8000ee0:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000ee4:	619c      	str	r4, [r3, #24]
 8000ee6:	f7ff ffcf 	bl	8000e88 <rgb_i2c_delay>
 8000eea:	b002      	add	sp, #8
 8000eec:	bd10      	pop	{r4, pc}
	...

08000ef0 <RGBSetLowSCL>:
 8000ef0:	4b02      	ldr	r3, [pc, #8]	; (8000efc <RGBSetLowSCL+0xc>)
 8000ef2:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8000ef6:	851a      	strh	r2, [r3, #40]	; 0x28
 8000ef8:	f7ff bfc6 	b.w	8000e88 <rgb_i2c_delay>
 8000efc:	48000800 	.word	0x48000800

08000f00 <RGBSetHighSCL>:
 8000f00:	4b02      	ldr	r3, [pc, #8]	; (8000f0c <RGBSetHighSCL+0xc>)
 8000f02:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8000f06:	619a      	str	r2, [r3, #24]
 8000f08:	f7ff bfbe 	b.w	8000e88 <rgb_i2c_delay>
 8000f0c:	48000800 	.word	0x48000800

08000f10 <rgb_i2c_init>:
 8000f10:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8000f12:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000f16:	2400      	movs	r4, #0
 8000f18:	9300      	str	r3, [sp, #0]
 8000f1a:	2603      	movs	r6, #3
 8000f1c:	2301      	movs	r3, #1
 8000f1e:	4669      	mov	r1, sp
 8000f20:	4812      	ldr	r0, [pc, #72]	; (8000f6c <rgb_i2c_init+0x5c>)
 8000f22:	f88d 3004 	strb.w	r3, [sp, #4]
 8000f26:	25f0      	movs	r5, #240	; 0xf0
 8000f28:	f88d 6005 	strb.w	r6, [sp, #5]
 8000f2c:	f88d 4006 	strb.w	r4, [sp, #6]
 8000f30:	f88d 4007 	strb.w	r4, [sp, #7]
 8000f34:	f001 f87f 	bl	8002036 <GPIO_Init>
 8000f38:	4669      	mov	r1, sp
 8000f3a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000f3e:	9500      	str	r5, [sp, #0]
 8000f40:	f88d 4004 	strb.w	r4, [sp, #4]
 8000f44:	f88d 6005 	strb.w	r6, [sp, #5]
 8000f48:	f88d 4007 	strb.w	r4, [sp, #7]
 8000f4c:	f001 f873 	bl	8002036 <GPIO_Init>
 8000f50:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000f54:	4629      	mov	r1, r5
 8000f56:	f001 f8b4 	bl	80020c2 <GPIO_SetBits>
 8000f5a:	f7ff ffd1 	bl	8000f00 <RGBSetHighSCL>
 8000f5e:	f7ff ff95 	bl	8000e8c <RGBSetLowSDA>
 8000f62:	f7ff ffad 	bl	8000ec0 <RGBSetHighSDA>
 8000f66:	b002      	add	sp, #8
 8000f68:	bd70      	pop	{r4, r5, r6, pc}
 8000f6a:	bf00      	nop
 8000f6c:	48000800 	.word	0x48000800

08000f70 <rgb_i2cStart>:
 8000f70:	b508      	push	{r3, lr}
 8000f72:	f7ff ffc5 	bl	8000f00 <RGBSetHighSCL>
 8000f76:	f7ff ffa3 	bl	8000ec0 <RGBSetHighSDA>
 8000f7a:	f7ff ffc1 	bl	8000f00 <RGBSetHighSCL>
 8000f7e:	f7ff ff85 	bl	8000e8c <RGBSetLowSDA>
 8000f82:	f7ff ffb5 	bl	8000ef0 <RGBSetLowSCL>
 8000f86:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000f8a:	f7ff bf99 	b.w	8000ec0 <RGBSetHighSDA>

08000f8e <rgb_i2cStop>:
 8000f8e:	b508      	push	{r3, lr}
 8000f90:	f7ff ffae 	bl	8000ef0 <RGBSetLowSCL>
 8000f94:	f7ff ff7a 	bl	8000e8c <RGBSetLowSDA>
 8000f98:	f7ff ffb2 	bl	8000f00 <RGBSetHighSCL>
 8000f9c:	f7ff ff76 	bl	8000e8c <RGBSetLowSDA>
 8000fa0:	f7ff ffae 	bl	8000f00 <RGBSetHighSCL>
 8000fa4:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000fa8:	f7ff bf8a 	b.w	8000ec0 <RGBSetHighSDA>

08000fac <rgb_i2cWrite>:
 8000fac:	b538      	push	{r3, r4, r5, lr}
 8000fae:	4604      	mov	r4, r0
 8000fb0:	2508      	movs	r5, #8
 8000fb2:	f7ff ff9d 	bl	8000ef0 <RGBSetLowSCL>
 8000fb6:	0623      	lsls	r3, r4, #24
 8000fb8:	d502      	bpl.n	8000fc0 <rgb_i2cWrite+0x14>
 8000fba:	f7ff ff81 	bl	8000ec0 <RGBSetHighSDA>
 8000fbe:	e001      	b.n	8000fc4 <rgb_i2cWrite+0x18>
 8000fc0:	f7ff ff64 	bl	8000e8c <RGBSetLowSDA>
 8000fc4:	3d01      	subs	r5, #1
 8000fc6:	f7ff ff9b 	bl	8000f00 <RGBSetHighSCL>
 8000fca:	0064      	lsls	r4, r4, #1
 8000fcc:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8000fd0:	b2e4      	uxtb	r4, r4
 8000fd2:	d1ee      	bne.n	8000fb2 <rgb_i2cWrite+0x6>
 8000fd4:	f7ff ff8c 	bl	8000ef0 <RGBSetLowSCL>
 8000fd8:	f7ff ff72 	bl	8000ec0 <RGBSetHighSDA>
 8000fdc:	f7ff ff90 	bl	8000f00 <RGBSetHighSCL>
 8000fe0:	f7ff ff86 	bl	8000ef0 <RGBSetLowSCL>
 8000fe4:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000fe8:	f7ff bf4e 	b.w	8000e88 <rgb_i2c_delay>

08000fec <rgb_i2cRead>:
 8000fec:	2300      	movs	r3, #0
 8000fee:	b570      	push	{r4, r5, r6, lr}
 8000ff0:	700b      	strb	r3, [r1, #0]
 8000ff2:	704b      	strb	r3, [r1, #1]
 8000ff4:	708b      	strb	r3, [r1, #2]
 8000ff6:	70cb      	strb	r3, [r1, #3]
 8000ff8:	4606      	mov	r6, r0
 8000ffa:	460c      	mov	r4, r1
 8000ffc:	f7ff ff78 	bl	8000ef0 <RGBSetLowSCL>
 8001000:	f7ff ff5e 	bl	8000ec0 <RGBSetHighSDA>
 8001004:	2508      	movs	r5, #8
 8001006:	2300      	movs	r3, #0
 8001008:	5ce2      	ldrb	r2, [r4, r3]
 800100a:	0052      	lsls	r2, r2, #1
 800100c:	54e2      	strb	r2, [r4, r3]
 800100e:	3301      	adds	r3, #1
 8001010:	2b04      	cmp	r3, #4
 8001012:	d1f9      	bne.n	8001008 <rgb_i2cRead+0x1c>
 8001014:	f7ff ff74 	bl	8000f00 <RGBSetHighSCL>
 8001018:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800101c:	8a1b      	ldrh	r3, [r3, #16]
 800101e:	b29b      	uxth	r3, r3
 8001020:	06da      	lsls	r2, r3, #27
 8001022:	d503      	bpl.n	800102c <rgb_i2cRead+0x40>
 8001024:	7822      	ldrb	r2, [r4, #0]
 8001026:	f042 0201 	orr.w	r2, r2, #1
 800102a:	7022      	strb	r2, [r4, #0]
 800102c:	0698      	lsls	r0, r3, #26
 800102e:	d503      	bpl.n	8001038 <rgb_i2cRead+0x4c>
 8001030:	7862      	ldrb	r2, [r4, #1]
 8001032:	f042 0201 	orr.w	r2, r2, #1
 8001036:	7062      	strb	r2, [r4, #1]
 8001038:	0659      	lsls	r1, r3, #25
 800103a:	d503      	bpl.n	8001044 <rgb_i2cRead+0x58>
 800103c:	78a2      	ldrb	r2, [r4, #2]
 800103e:	f042 0201 	orr.w	r2, r2, #1
 8001042:	70a2      	strb	r2, [r4, #2]
 8001044:	061a      	lsls	r2, r3, #24
 8001046:	d503      	bpl.n	8001050 <rgb_i2cRead+0x64>
 8001048:	78e3      	ldrb	r3, [r4, #3]
 800104a:	f043 0301 	orr.w	r3, r3, #1
 800104e:	70e3      	strb	r3, [r4, #3]
 8001050:	f7ff ff4e 	bl	8000ef0 <RGBSetLowSCL>
 8001054:	3d01      	subs	r5, #1
 8001056:	d1d6      	bne.n	8001006 <rgb_i2cRead+0x1a>
 8001058:	b10e      	cbz	r6, 800105e <rgb_i2cRead+0x72>
 800105a:	f7ff ff17 	bl	8000e8c <RGBSetLowSDA>
 800105e:	f7ff ff4f 	bl	8000f00 <RGBSetHighSCL>
 8001062:	f7ff ff45 	bl	8000ef0 <RGBSetLowSCL>
 8001066:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800106a:	f7ff bf0d 	b.w	8000e88 <rgb_i2c_delay>

0800106e <rgb_i2c_write_reg>:
 800106e:	b570      	push	{r4, r5, r6, lr}
 8001070:	4605      	mov	r5, r0
 8001072:	460c      	mov	r4, r1
 8001074:	4616      	mov	r6, r2
 8001076:	f7ff ff7b 	bl	8000f70 <rgb_i2cStart>
 800107a:	4628      	mov	r0, r5
 800107c:	f7ff ff96 	bl	8000fac <rgb_i2cWrite>
 8001080:	4620      	mov	r0, r4
 8001082:	f7ff ff93 	bl	8000fac <rgb_i2cWrite>
 8001086:	4630      	mov	r0, r6
 8001088:	f7ff ff90 	bl	8000fac <rgb_i2cWrite>
 800108c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001090:	f7ff bf7d 	b.w	8000f8e <rgb_i2cStop>

08001094 <rgb_i2c_read_reg>:
 8001094:	b570      	push	{r4, r5, r6, lr}
 8001096:	4604      	mov	r4, r0
 8001098:	460d      	mov	r5, r1
 800109a:	4616      	mov	r6, r2
 800109c:	f7ff ff68 	bl	8000f70 <rgb_i2cStart>
 80010a0:	4620      	mov	r0, r4
 80010a2:	f7ff ff83 	bl	8000fac <rgb_i2cWrite>
 80010a6:	4628      	mov	r0, r5
 80010a8:	f7ff ff80 	bl	8000fac <rgb_i2cWrite>
 80010ac:	f7ff ff60 	bl	8000f70 <rgb_i2cStart>
 80010b0:	f044 0001 	orr.w	r0, r4, #1
 80010b4:	f7ff ff7a 	bl	8000fac <rgb_i2cWrite>
 80010b8:	4631      	mov	r1, r6
 80010ba:	2000      	movs	r0, #0
 80010bc:	f7ff ff96 	bl	8000fec <rgb_i2cRead>
 80010c0:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80010c4:	f7ff bf63 	b.w	8000f8e <rgb_i2cStop>

080010c8 <device_sleep>:
 80010c8:	4b01      	ldr	r3, [pc, #4]	; (80010d0 <device_sleep+0x8>)
 80010ca:	22ff      	movs	r2, #255	; 0xff
 80010cc:	701a      	strb	r2, [r3, #0]
 80010ce:	4770      	bx	lr
 80010d0:	20000030 	.word	0x20000030

080010d4 <device_wake_up>:
 80010d4:	4b01      	ldr	r3, [pc, #4]	; (80010dc <device_wake_up+0x8>)
 80010d6:	2200      	movs	r2, #0
 80010d8:	701a      	strb	r2, [r3, #0]
 80010da:	4770      	bx	lr
 80010dc:	20000030 	.word	0x20000030

080010e0 <device_i2c_thread>:
 80010e0:	b538      	push	{r3, r4, r5, lr}
 80010e2:	2000      	movs	r0, #0
 80010e4:	210a      	movs	r1, #10
 80010e6:	f000 fc19 	bl	800191c <event_timer_set_period>
 80010ea:	2501      	movs	r5, #1
 80010ec:	2400      	movs	r4, #0
 80010ee:	2c01      	cmp	r4, #1
 80010f0:	d021      	beq.n	8001136 <device_i2c_thread+0x56>
 80010f2:	d30f      	bcc.n	8001114 <device_i2c_thread+0x34>
 80010f4:	2c02      	cmp	r4, #2
 80010f6:	d1fa      	bne.n	80010ee <device_i2c_thread+0xe>
 80010f8:	f7ff fc68 	bl	80009cc <lsm9ds0_uninit>
 80010fc:	f7ff fbea 	bl	80008d4 <motors_uninit>
 8001100:	2064      	movs	r0, #100	; 0x64
 8001102:	f000 fbfb 	bl	80018fc <timer_delay_ms>
 8001106:	4b12      	ldr	r3, [pc, #72]	; (8001150 <device_i2c_thread+0x70>)
 8001108:	781c      	ldrb	r4, [r3, #0]
 800110a:	2c00      	cmp	r4, #0
 800110c:	bf14      	ite	ne
 800110e:	2402      	movne	r4, #2
 8001110:	2400      	moveq	r4, #0
 8001112:	e7ec      	b.n	80010ee <device_i2c_thread+0xe>
 8001114:	f7ff fc4e 	bl	80009b4 <motors_init>
 8001118:	4628      	mov	r0, r5
 800111a:	f7ff fd31 	bl	8000b80 <lsm9ds0_init>
 800111e:	4605      	mov	r5, r0
 8001120:	b140      	cbz	r0, 8001134 <device_i2c_thread+0x54>
 8001122:	f7ff fc53 	bl	80009cc <lsm9ds0_uninit>
 8001126:	f7ff fbd5 	bl	80008d4 <motors_uninit>
 800112a:	4629      	mov	r1, r5
 800112c:	2002      	movs	r0, #2
 800112e:	f000 f88d 	bl	800124c <abort_error_>
 8001132:	2500      	movs	r5, #0
 8001134:	2401      	movs	r4, #1
 8001136:	2000      	movs	r0, #0
 8001138:	f000 fc06 	bl	8001948 <event_timer_wait>
 800113c:	f7ff fc58 	bl	80009f0 <lsm9ds0_read>
 8001140:	f7ff fbd6 	bl	80008f0 <motors_update>
 8001144:	4b02      	ldr	r3, [pc, #8]	; (8001150 <device_i2c_thread+0x70>)
 8001146:	781b      	ldrb	r3, [r3, #0]
 8001148:	2b00      	cmp	r3, #0
 800114a:	bf18      	it	ne
 800114c:	2402      	movne	r4, #2
 800114e:	e7ce      	b.n	80010ee <device_i2c_thread+0xe>
 8001150:	20000030 	.word	0x20000030

08001154 <device_rgb_sensors_thread>:
 8001154:	b510      	push	{r4, lr}
 8001156:	2001      	movs	r0, #1
 8001158:	210a      	movs	r1, #10
 800115a:	f000 fbdf 	bl	800191c <event_timer_set_period>
 800115e:	2400      	movs	r4, #0
 8001160:	2001      	movs	r0, #1
 8001162:	f000 fbf1 	bl	8001948 <event_timer_wait>
 8001166:	f7ff fd6d 	bl	8000c44 <rgb_sensor_read>
 800116a:	2c01      	cmp	r4, #1
 800116c:	d01a      	beq.n	80011a4 <device_rgb_sensors_thread+0x50>
 800116e:	d30d      	bcc.n	800118c <device_rgb_sensors_thread+0x38>
 8001170:	2c02      	cmp	r4, #2
 8001172:	d1f5      	bne.n	8001160 <device_rgb_sensors_thread+0xc>
 8001174:	f7ff fd5a 	bl	8000c2c <rgb_sensor_uninit>
 8001178:	2064      	movs	r0, #100	; 0x64
 800117a:	f000 fbbf 	bl	80018fc <timer_delay_ms>
 800117e:	4b0f      	ldr	r3, [pc, #60]	; (80011bc <device_rgb_sensors_thread+0x68>)
 8001180:	781c      	ldrb	r4, [r3, #0]
 8001182:	2c00      	cmp	r4, #0
 8001184:	bf14      	ite	ne
 8001186:	2402      	movne	r4, #2
 8001188:	2400      	moveq	r4, #0
 800118a:	e7e9      	b.n	8001160 <device_rgb_sensors_thread+0xc>
 800118c:	f7ff fe0e 	bl	8000dac <rgb_sensor_init>
 8001190:	4604      	mov	r4, r0
 8001192:	b128      	cbz	r0, 80011a0 <device_rgb_sensors_thread+0x4c>
 8001194:	f7ff fd4a 	bl	8000c2c <rgb_sensor_uninit>
 8001198:	2001      	movs	r0, #1
 800119a:	4621      	mov	r1, r4
 800119c:	f000 f856 	bl	800124c <abort_error_>
 80011a0:	2401      	movs	r4, #1
 80011a2:	e7dd      	b.n	8001160 <device_rgb_sensors_thread+0xc>
 80011a4:	4620      	mov	r0, r4
 80011a6:	f000 fbcf 	bl	8001948 <event_timer_wait>
 80011aa:	f7ff fd4b 	bl	8000c44 <rgb_sensor_read>
 80011ae:	4b03      	ldr	r3, [pc, #12]	; (80011bc <device_rgb_sensors_thread+0x68>)
 80011b0:	781b      	ldrb	r3, [r3, #0]
 80011b2:	2b00      	cmp	r3, #0
 80011b4:	d0f4      	beq.n	80011a0 <device_rgb_sensors_thread+0x4c>
 80011b6:	2402      	movs	r4, #2
 80011b8:	e7d2      	b.n	8001160 <device_rgb_sensors_thread+0xc>
 80011ba:	bf00      	nop
 80011bc:	20000030 	.word	0x20000030

080011c0 <device_wifi_thread>:
 80011c0:	b570      	push	{r4, r5, r6, lr}
 80011c2:	4b1f      	ldr	r3, [pc, #124]	; (8001240 <device_wifi_thread+0x80>)
 80011c4:	b0a6      	sub	sp, #152	; 0x98
 80011c6:	ac02      	add	r4, sp, #8
 80011c8:	f103 0210 	add.w	r2, r3, #16
 80011cc:	4626      	mov	r6, r4
 80011ce:	6818      	ldr	r0, [r3, #0]
 80011d0:	6859      	ldr	r1, [r3, #4]
 80011d2:	4625      	mov	r5, r4
 80011d4:	c503      	stmia	r5!, {r0, r1}
 80011d6:	3308      	adds	r3, #8
 80011d8:	4293      	cmp	r3, r2
 80011da:	462c      	mov	r4, r5
 80011dc:	d1f7      	bne.n	80011ce <device_wifi_thread+0xe>
 80011de:	4630      	mov	r0, r6
 80011e0:	f7ff f8fe 	bl	80003e0 <strlen_>
 80011e4:	2100      	movs	r1, #0
 80011e6:	4605      	mov	r5, r0
 80011e8:	2901      	cmp	r1, #1
 80011ea:	d01c      	beq.n	8001226 <device_wifi_thread+0x66>
 80011ec:	d30d      	bcc.n	800120a <device_wifi_thread+0x4a>
 80011ee:	2900      	cmp	r1, #0
 80011f0:	d0fa      	beq.n	80011e8 <device_wifi_thread+0x28>
 80011f2:	f7ff fabb 	bl	800076c <esp8266_uninit>
 80011f6:	2064      	movs	r0, #100	; 0x64
 80011f8:	f000 fb80 	bl	80018fc <timer_delay_ms>
 80011fc:	4b11      	ldr	r3, [pc, #68]	; (8001244 <device_wifi_thread+0x84>)
 80011fe:	7819      	ldrb	r1, [r3, #0]
 8001200:	2900      	cmp	r1, #0
 8001202:	bf14      	ite	ne
 8001204:	2102      	movne	r1, #2
 8001206:	2100      	moveq	r1, #0
 8001208:	e7ee      	b.n	80011e8 <device_wifi_thread+0x28>
 800120a:	2001      	movs	r0, #1
 800120c:	f000 ff78 	bl	8002100 <led_on>
 8001210:	2000      	movs	r0, #0
 8001212:	f7ff fa5f 	bl	80006d4 <esp8266_init>
 8001216:	4604      	mov	r4, r0
 8001218:	b128      	cbz	r0, 8001226 <device_wifi_thread+0x66>
 800121a:	f7ff faa7 	bl	800076c <esp8266_uninit>
 800121e:	2003      	movs	r0, #3
 8001220:	4621      	mov	r1, r4
 8001222:	f000 f813 	bl	800124c <abort_error_>
 8001226:	ab06      	add	r3, sp, #24
 8001228:	9300      	str	r3, [sp, #0]
 800122a:	2380      	movs	r3, #128	; 0x80
 800122c:	9301      	str	r3, [sp, #4]
 800122e:	f240 71da 	movw	r1, #2010	; 0x7da
 8001232:	4632      	mov	r2, r6
 8001234:	462b      	mov	r3, r5
 8001236:	4804      	ldr	r0, [pc, #16]	; (8001248 <device_wifi_thread+0x88>)
 8001238:	f7ff fac4 	bl	80007c4 <esp8266_connect>
 800123c:	e7f3      	b.n	8001226 <device_wifi_thread+0x66>
 800123e:	bf00      	nop
 8001240:	08002399 	.word	0x08002399
 8001244:	20000030 	.word	0x20000030
 8001248:	0800238d 	.word	0x0800238d

0800124c <abort_error_>:
 800124c:	b570      	push	{r4, r5, r6, lr}
 800124e:	4605      	mov	r5, r0
 8001250:	460e      	mov	r6, r1
 8001252:	480d      	ldr	r0, [pc, #52]	; (8001288 <abort_error_+0x3c>)
 8001254:	4629      	mov	r1, r5
 8001256:	4632      	mov	r2, r6
 8001258:	f7ff f944 	bl	80004e4 <printf_>
 800125c:	2408      	movs	r4, #8
 800125e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001262:	f000 ff4d 	bl	8002100 <led_on>
 8001266:	201e      	movs	r0, #30
 8001268:	f000 fb48 	bl	80018fc <timer_delay_ms>
 800126c:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001270:	f000 ff5c 	bl	800212c <led_off>
 8001274:	2046      	movs	r0, #70	; 0x46
 8001276:	f000 fb41 	bl	80018fc <timer_delay_ms>
 800127a:	3c01      	subs	r4, #1
 800127c:	d1ef      	bne.n	800125e <abort_error_+0x12>
 800127e:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8001282:	f000 fb3b 	bl	80018fc <timer_delay_ms>
 8001286:	e7e4      	b.n	8001252 <abort_error_+0x6>
 8001288:	080023a9 	.word	0x080023a9

0800128c <line_follower_test>:
 800128c:	b508      	push	{r3, lr}
 800128e:	ed2d 8b04 	vpush	{d8-d9}
 8001292:	ed9f 8a15 	vldr	s16, [pc, #84]	; 80012e8 <line_follower_test+0x5c>
 8001296:	eeb0 9a48 	vmov.f32	s18, s16
 800129a:	f7ff fdd5 	bl	8000e48 <rgb_get_line_position>
 800129e:	ee07 0a90 	vmov	s15, r0
 80012a2:	eef8 8ae7 	vcvt.f32.s32	s17, s15
 80012a6:	ed9f 7a11 	vldr	s14, [pc, #68]	; 80012ec <line_follower_test+0x60>
 80012aa:	ee79 8a68 	vsub.f32	s17, s18, s17
 80012ae:	4b10      	ldr	r3, [pc, #64]	; (80012f0 <line_follower_test+0x64>)
 80012b0:	ee78 7ac8 	vsub.f32	s15, s17, s16
 80012b4:	200a      	movs	r0, #10
 80012b6:	ee67 7a87 	vmul.f32	s15, s15, s14
 80012ba:	ed9f 7a0e 	vldr	s14, [pc, #56]	; 80012f4 <line_follower_test+0x68>
 80012be:	ee48 7a87 	vmla.f32	s15, s17, s14
 80012c2:	ed9f 7a0d 	vldr	s14, [pc, #52]	; 80012f8 <line_follower_test+0x6c>
 80012c6:	ee77 6a67 	vsub.f32	s13, s14, s15
 80012ca:	ee77 7a87 	vadd.f32	s15, s15, s14
 80012ce:	eefd 6ae6 	vcvt.s32.f32	s13, s13
 80012d2:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 80012d6:	edc3 6a00 	vstr	s13, [r3]
 80012da:	eeb0 8a68 	vmov.f32	s16, s17
 80012de:	edc3 7a01 	vstr	s15, [r3, #4]
 80012e2:	f000 fb0b 	bl	80018fc <timer_delay_ms>
 80012e6:	e7d8      	b.n	800129a <line_follower_test+0xe>
 80012e8:	00000000 	.word	0x00000000
 80012ec:	42480000 	.word	0x42480000
 80012f0:	200001b0 	.word	0x200001b0
 80012f4:	41200000 	.word	0x41200000
 80012f8:	41f00000 	.word	0x41f00000

080012fc <main_thread>:
 80012fc:	b508      	push	{r3, lr}
 80012fe:	481e      	ldr	r0, [pc, #120]	; (8001378 <main_thread+0x7c>)
 8001300:	f7ff f8f0 	bl	80004e4 <printf_>
 8001304:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 8001308:	f000 faf8 	bl	80018fc <timer_delay_ms>
 800130c:	f7ff fee2 	bl	80010d4 <device_wake_up>
 8001310:	491a      	ldr	r1, [pc, #104]	; (800137c <main_thread+0x80>)
 8001312:	481b      	ldr	r0, [pc, #108]	; (8001380 <main_thread+0x84>)
 8001314:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001318:	2306      	movs	r3, #6
 800131a:	f7fe ffb7 	bl	800028c <create_thread>
 800131e:	4919      	ldr	r1, [pc, #100]	; (8001384 <main_thread+0x88>)
 8001320:	4819      	ldr	r0, [pc, #100]	; (8001388 <main_thread+0x8c>)
 8001322:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001326:	2306      	movs	r3, #6
 8001328:	f7fe ffb0 	bl	800028c <create_thread>
 800132c:	4817      	ldr	r0, [pc, #92]	; (800138c <main_thread+0x90>)
 800132e:	4918      	ldr	r1, [pc, #96]	; (8001390 <main_thread+0x94>)
 8001330:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001334:	2306      	movs	r3, #6
 8001336:	f7fe ffa9 	bl	800028c <create_thread>
 800133a:	20c8      	movs	r0, #200	; 0xc8
 800133c:	f000 fade 	bl	80018fc <timer_delay_ms>
 8001340:	f000 ff68 	bl	8002214 <get_key>
 8001344:	b980      	cbnz	r0, 8001368 <main_thread+0x6c>
 8001346:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 800134a:	f000 fed9 	bl	8002100 <led_on>
 800134e:	2064      	movs	r0, #100	; 0x64
 8001350:	f000 fad4 	bl	80018fc <timer_delay_ms>
 8001354:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001358:	f000 fee8 	bl	800212c <led_off>
 800135c:	20c8      	movs	r0, #200	; 0xc8
 800135e:	f000 facd 	bl	80018fc <timer_delay_ms>
 8001362:	f7ff feb1 	bl	80010c8 <device_sleep>
 8001366:	e7eb      	b.n	8001340 <main_thread+0x44>
 8001368:	f7ff feb4 	bl	80010d4 <device_wake_up>
 800136c:	20c8      	movs	r0, #200	; 0xc8
 800136e:	f000 fac5 	bl	80018fc <timer_delay_ms>
 8001372:	f7ff ff8b 	bl	800128c <line_follower_test>
 8001376:	e7e3      	b.n	8001340 <main_thread+0x44>
 8001378:	080023bb 	.word	0x080023bb
 800137c:	200007bc 	.word	0x200007bc
 8001380:	08001155 	.word	0x08001155
 8001384:	200005bc 	.word	0x200005bc
 8001388:	080010e1 	.word	0x080010e1
 800138c:	080011c1 	.word	0x080011c1
 8001390:	200009bc 	.word	0x200009bc

08001394 <main>:
 8001394:	b508      	push	{r3, lr}
 8001396:	f000 fe41 	bl	800201c <lib_low_level_init>
 800139a:	f7ff f91d 	bl	80005d8 <lib_os_init>
 800139e:	4905      	ldr	r1, [pc, #20]	; (80013b4 <main+0x20>)
 80013a0:	4805      	ldr	r0, [pc, #20]	; (80013b8 <main+0x24>)
 80013a2:	f44f 7200 	mov.w	r2, #512	; 0x200
 80013a6:	2306      	movs	r3, #6
 80013a8:	f7fe ff70 	bl	800028c <create_thread>
 80013ac:	f7fe ff68 	bl	8000280 <kernel_start>
 80013b0:	2000      	movs	r0, #0
 80013b2:	bd08      	pop	{r3, pc}
 80013b4:	20000bbc 	.word	0x20000bbc
 80013b8:	080012fd 	.word	0x080012fd

080013bc <RCC_GetClocksFreq>:
 80013bc:	4ba5      	ldr	r3, [pc, #660]	; (8001654 <RCC_GetClocksFreq+0x298>)
 80013be:	685a      	ldr	r2, [r3, #4]
 80013c0:	f002 020c 	and.w	r2, r2, #12
 80013c4:	2a04      	cmp	r2, #4
 80013c6:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 80013ca:	d005      	beq.n	80013d8 <RCC_GetClocksFreq+0x1c>
 80013cc:	2a08      	cmp	r2, #8
 80013ce:	d006      	beq.n	80013de <RCC_GetClocksFreq+0x22>
 80013d0:	4ba1      	ldr	r3, [pc, #644]	; (8001658 <RCC_GetClocksFreq+0x29c>)
 80013d2:	6003      	str	r3, [r0, #0]
 80013d4:	b9ba      	cbnz	r2, 8001406 <RCC_GetClocksFreq+0x4a>
 80013d6:	e017      	b.n	8001408 <RCC_GetClocksFreq+0x4c>
 80013d8:	4b9f      	ldr	r3, [pc, #636]	; (8001658 <RCC_GetClocksFreq+0x29c>)
 80013da:	6003      	str	r3, [r0, #0]
 80013dc:	e013      	b.n	8001406 <RCC_GetClocksFreq+0x4a>
 80013de:	6859      	ldr	r1, [r3, #4]
 80013e0:	685c      	ldr	r4, [r3, #4]
 80013e2:	f3c1 4183 	ubfx	r1, r1, #18, #4
 80013e6:	03e2      	lsls	r2, r4, #15
 80013e8:	f101 0102 	add.w	r1, r1, #2
 80013ec:	d401      	bmi.n	80013f2 <RCC_GetClocksFreq+0x36>
 80013ee:	4a9b      	ldr	r2, [pc, #620]	; (800165c <RCC_GetClocksFreq+0x2a0>)
 80013f0:	e006      	b.n	8001400 <RCC_GetClocksFreq+0x44>
 80013f2:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80013f4:	4b98      	ldr	r3, [pc, #608]	; (8001658 <RCC_GetClocksFreq+0x29c>)
 80013f6:	f002 020f 	and.w	r2, r2, #15
 80013fa:	3201      	adds	r2, #1
 80013fc:	fbb3 f2f2 	udiv	r2, r3, r2
 8001400:	434a      	muls	r2, r1
 8001402:	6002      	str	r2, [r0, #0]
 8001404:	e000      	b.n	8001408 <RCC_GetClocksFreq+0x4c>
 8001406:	2200      	movs	r2, #0
 8001408:	4f92      	ldr	r7, [pc, #584]	; (8001654 <RCC_GetClocksFreq+0x298>)
 800140a:	4d95      	ldr	r5, [pc, #596]	; (8001660 <RCC_GetClocksFreq+0x2a4>)
 800140c:	687b      	ldr	r3, [r7, #4]
 800140e:	f8df 8254 	ldr.w	r8, [pc, #596]	; 8001664 <RCC_GetClocksFreq+0x2a8>
 8001412:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8001416:	5cec      	ldrb	r4, [r5, r3]
 8001418:	6803      	ldr	r3, [r0, #0]
 800141a:	b2e4      	uxtb	r4, r4
 800141c:	fa23 f104 	lsr.w	r1, r3, r4
 8001420:	6041      	str	r1, [r0, #4]
 8001422:	687e      	ldr	r6, [r7, #4]
 8001424:	f3c6 2602 	ubfx	r6, r6, #8, #3
 8001428:	5dae      	ldrb	r6, [r5, r6]
 800142a:	fa21 f606 	lsr.w	r6, r1, r6
 800142e:	6086      	str	r6, [r0, #8]
 8001430:	f8d7 c004 	ldr.w	ip, [r7, #4]
 8001434:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8001438:	f815 500c 	ldrb.w	r5, [r5, ip]
 800143c:	b2ed      	uxtb	r5, r5
 800143e:	40e9      	lsrs	r1, r5
 8001440:	60c1      	str	r1, [r0, #12]
 8001442:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 8001446:	f3c9 1904 	ubfx	r9, r9, #4, #5
 800144a:	f009 0c0f 	and.w	ip, r9, #15
 800144e:	f019 0f10 	tst.w	r9, #16
 8001452:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 8001456:	fa1f fc8c 	uxth.w	ip, ip
 800145a:	d007      	beq.n	800146c <RCC_GetClocksFreq+0xb0>
 800145c:	f1bc 0f00 	cmp.w	ip, #0
 8001460:	d004      	beq.n	800146c <RCC_GetClocksFreq+0xb0>
 8001462:	fbb2 fcfc 	udiv	ip, r2, ip
 8001466:	f8c0 c010 	str.w	ip, [r0, #16]
 800146a:	e000      	b.n	800146e <RCC_GetClocksFreq+0xb2>
 800146c:	6103      	str	r3, [r0, #16]
 800146e:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 8001470:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 8001474:	f00c 070f 	and.w	r7, ip, #15
 8001478:	f01c 0f10 	tst.w	ip, #16
 800147c:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 8001480:	b2bf      	uxth	r7, r7
 8001482:	d004      	beq.n	800148e <RCC_GetClocksFreq+0xd2>
 8001484:	b11f      	cbz	r7, 800148e <RCC_GetClocksFreq+0xd2>
 8001486:	fbb2 f7f7 	udiv	r7, r2, r7
 800148a:	6147      	str	r7, [r0, #20]
 800148c:	e000      	b.n	8001490 <RCC_GetClocksFreq+0xd4>
 800148e:	6143      	str	r3, [r0, #20]
 8001490:	4f70      	ldr	r7, [pc, #448]	; (8001654 <RCC_GetClocksFreq+0x298>)
 8001492:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001496:	f01c 0f10 	tst.w	ip, #16
 800149a:	bf0a      	itet	eq
 800149c:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 8001658 <RCC_GetClocksFreq+0x29c>
 80014a0:	6183      	strne	r3, [r0, #24]
 80014a2:	f8c0 c018 	streq.w	ip, [r0, #24]
 80014a6:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80014a8:	06bf      	lsls	r7, r7, #26
 80014aa:	bf56      	itet	pl
 80014ac:	4f6a      	ldrpl	r7, [pc, #424]	; (8001658 <RCC_GetClocksFreq+0x29c>)
 80014ae:	61c3      	strmi	r3, [r0, #28]
 80014b0:	61c7      	strpl	r7, [r0, #28]
 80014b2:	4f68      	ldr	r7, [pc, #416]	; (8001654 <RCC_GetClocksFreq+0x298>)
 80014b4:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80014b8:	f01c 0f40 	tst.w	ip, #64	; 0x40
 80014bc:	bf0a      	itet	eq
 80014be:	f8df c198 	ldreq.w	ip, [pc, #408]	; 8001658 <RCC_GetClocksFreq+0x29c>
 80014c2:	6203      	strne	r3, [r0, #32]
 80014c4:	f8c0 c020 	streq.w	ip, [r0, #32]
 80014c8:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80014ca:	05ff      	lsls	r7, r7, #23
 80014cc:	d506      	bpl.n	80014dc <RCC_GetClocksFreq+0x120>
 80014ce:	4293      	cmp	r3, r2
 80014d0:	d104      	bne.n	80014dc <RCC_GetClocksFreq+0x120>
 80014d2:	42a5      	cmp	r5, r4
 80014d4:	d102      	bne.n	80014dc <RCC_GetClocksFreq+0x120>
 80014d6:	005f      	lsls	r7, r3, #1
 80014d8:	6247      	str	r7, [r0, #36]	; 0x24
 80014da:	e000      	b.n	80014de <RCC_GetClocksFreq+0x122>
 80014dc:	6241      	str	r1, [r0, #36]	; 0x24
 80014de:	4f5d      	ldr	r7, [pc, #372]	; (8001654 <RCC_GetClocksFreq+0x298>)
 80014e0:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80014e4:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 80014e8:	d008      	beq.n	80014fc <RCC_GetClocksFreq+0x140>
 80014ea:	4293      	cmp	r3, r2
 80014ec:	d106      	bne.n	80014fc <RCC_GetClocksFreq+0x140>
 80014ee:	42a5      	cmp	r5, r4
 80014f0:	d104      	bne.n	80014fc <RCC_GetClocksFreq+0x140>
 80014f2:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 80014f6:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 80014fa:	e000      	b.n	80014fe <RCC_GetClocksFreq+0x142>
 80014fc:	6281      	str	r1, [r0, #40]	; 0x28
 80014fe:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001500:	05bf      	lsls	r7, r7, #22
 8001502:	d506      	bpl.n	8001512 <RCC_GetClocksFreq+0x156>
 8001504:	4293      	cmp	r3, r2
 8001506:	d104      	bne.n	8001512 <RCC_GetClocksFreq+0x156>
 8001508:	42a5      	cmp	r5, r4
 800150a:	d102      	bne.n	8001512 <RCC_GetClocksFreq+0x156>
 800150c:	005f      	lsls	r7, r3, #1
 800150e:	62c7      	str	r7, [r0, #44]	; 0x2c
 8001510:	e000      	b.n	8001514 <RCC_GetClocksFreq+0x158>
 8001512:	62c1      	str	r1, [r0, #44]	; 0x2c
 8001514:	4f4f      	ldr	r7, [pc, #316]	; (8001654 <RCC_GetClocksFreq+0x298>)
 8001516:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800151a:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 800151e:	d008      	beq.n	8001532 <RCC_GetClocksFreq+0x176>
 8001520:	4293      	cmp	r3, r2
 8001522:	d106      	bne.n	8001532 <RCC_GetClocksFreq+0x176>
 8001524:	42a5      	cmp	r5, r4
 8001526:	d104      	bne.n	8001532 <RCC_GetClocksFreq+0x176>
 8001528:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 800152c:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8001530:	e000      	b.n	8001534 <RCC_GetClocksFreq+0x178>
 8001532:	64c1      	str	r1, [r0, #76]	; 0x4c
 8001534:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001536:	053f      	lsls	r7, r7, #20
 8001538:	d506      	bpl.n	8001548 <RCC_GetClocksFreq+0x18c>
 800153a:	4293      	cmp	r3, r2
 800153c:	d104      	bne.n	8001548 <RCC_GetClocksFreq+0x18c>
 800153e:	42a5      	cmp	r5, r4
 8001540:	d102      	bne.n	8001548 <RCC_GetClocksFreq+0x18c>
 8001542:	005f      	lsls	r7, r3, #1
 8001544:	6507      	str	r7, [r0, #80]	; 0x50
 8001546:	e000      	b.n	800154a <RCC_GetClocksFreq+0x18e>
 8001548:	6501      	str	r1, [r0, #80]	; 0x50
 800154a:	4f42      	ldr	r7, [pc, #264]	; (8001654 <RCC_GetClocksFreq+0x298>)
 800154c:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001550:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 8001554:	d008      	beq.n	8001568 <RCC_GetClocksFreq+0x1ac>
 8001556:	4293      	cmp	r3, r2
 8001558:	d106      	bne.n	8001568 <RCC_GetClocksFreq+0x1ac>
 800155a:	42a5      	cmp	r5, r4
 800155c:	d104      	bne.n	8001568 <RCC_GetClocksFreq+0x1ac>
 800155e:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001562:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 8001566:	e000      	b.n	800156a <RCC_GetClocksFreq+0x1ae>
 8001568:	6501      	str	r1, [r0, #80]	; 0x50
 800156a:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 800156c:	043f      	lsls	r7, r7, #16
 800156e:	d506      	bpl.n	800157e <RCC_GetClocksFreq+0x1c2>
 8001570:	4293      	cmp	r3, r2
 8001572:	d104      	bne.n	800157e <RCC_GetClocksFreq+0x1c2>
 8001574:	42a5      	cmp	r5, r4
 8001576:	d102      	bne.n	800157e <RCC_GetClocksFreq+0x1c2>
 8001578:	005a      	lsls	r2, r3, #1
 800157a:	6582      	str	r2, [r0, #88]	; 0x58
 800157c:	e000      	b.n	8001580 <RCC_GetClocksFreq+0x1c4>
 800157e:	6581      	str	r1, [r0, #88]	; 0x58
 8001580:	4a34      	ldr	r2, [pc, #208]	; (8001654 <RCC_GetClocksFreq+0x298>)
 8001582:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8001584:	07a4      	lsls	r4, r4, #30
 8001586:	d014      	beq.n	80015b2 <RCC_GetClocksFreq+0x1f6>
 8001588:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800158a:	f001 0103 	and.w	r1, r1, #3
 800158e:	2901      	cmp	r1, #1
 8001590:	d101      	bne.n	8001596 <RCC_GetClocksFreq+0x1da>
 8001592:	6383      	str	r3, [r0, #56]	; 0x38
 8001594:	e00e      	b.n	80015b4 <RCC_GetClocksFreq+0x1f8>
 8001596:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001598:	f001 0103 	and.w	r1, r1, #3
 800159c:	2902      	cmp	r1, #2
 800159e:	d102      	bne.n	80015a6 <RCC_GetClocksFreq+0x1ea>
 80015a0:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80015a4:	e005      	b.n	80015b2 <RCC_GetClocksFreq+0x1f6>
 80015a6:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80015a8:	f001 0103 	and.w	r1, r1, #3
 80015ac:	2903      	cmp	r1, #3
 80015ae:	d101      	bne.n	80015b4 <RCC_GetClocksFreq+0x1f8>
 80015b0:	4929      	ldr	r1, [pc, #164]	; (8001658 <RCC_GetClocksFreq+0x29c>)
 80015b2:	6381      	str	r1, [r0, #56]	; 0x38
 80015b4:	6b12      	ldr	r2, [r2, #48]	; 0x30
 80015b6:	4927      	ldr	r1, [pc, #156]	; (8001654 <RCC_GetClocksFreq+0x298>)
 80015b8:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 80015bc:	d101      	bne.n	80015c2 <RCC_GetClocksFreq+0x206>
 80015be:	63c6      	str	r6, [r0, #60]	; 0x3c
 80015c0:	e018      	b.n	80015f4 <RCC_GetClocksFreq+0x238>
 80015c2:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80015c4:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 80015c8:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 80015cc:	d101      	bne.n	80015d2 <RCC_GetClocksFreq+0x216>
 80015ce:	63c3      	str	r3, [r0, #60]	; 0x3c
 80015d0:	e010      	b.n	80015f4 <RCC_GetClocksFreq+0x238>
 80015d2:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80015d4:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 80015d8:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 80015dc:	d102      	bne.n	80015e4 <RCC_GetClocksFreq+0x228>
 80015de:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80015e2:	e006      	b.n	80015f2 <RCC_GetClocksFreq+0x236>
 80015e4:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80015e6:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 80015ea:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 80015ee:	d101      	bne.n	80015f4 <RCC_GetClocksFreq+0x238>
 80015f0:	4a19      	ldr	r2, [pc, #100]	; (8001658 <RCC_GetClocksFreq+0x29c>)
 80015f2:	63c2      	str	r2, [r0, #60]	; 0x3c
 80015f4:	4a17      	ldr	r2, [pc, #92]	; (8001654 <RCC_GetClocksFreq+0x298>)
 80015f6:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80015f8:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 80015fc:	d101      	bne.n	8001602 <RCC_GetClocksFreq+0x246>
 80015fe:	6406      	str	r6, [r0, #64]	; 0x40
 8001600:	e018      	b.n	8001634 <RCC_GetClocksFreq+0x278>
 8001602:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001604:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001608:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 800160c:	d101      	bne.n	8001612 <RCC_GetClocksFreq+0x256>
 800160e:	6403      	str	r3, [r0, #64]	; 0x40
 8001610:	e010      	b.n	8001634 <RCC_GetClocksFreq+0x278>
 8001612:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001614:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001618:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 800161c:	d102      	bne.n	8001624 <RCC_GetClocksFreq+0x268>
 800161e:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001622:	e006      	b.n	8001632 <RCC_GetClocksFreq+0x276>
 8001624:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001626:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 800162a:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 800162e:	d101      	bne.n	8001634 <RCC_GetClocksFreq+0x278>
 8001630:	4909      	ldr	r1, [pc, #36]	; (8001658 <RCC_GetClocksFreq+0x29c>)
 8001632:	6401      	str	r1, [r0, #64]	; 0x40
 8001634:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001636:	4907      	ldr	r1, [pc, #28]	; (8001654 <RCC_GetClocksFreq+0x298>)
 8001638:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 800163c:	d101      	bne.n	8001642 <RCC_GetClocksFreq+0x286>
 800163e:	6446      	str	r6, [r0, #68]	; 0x44
 8001640:	e023      	b.n	800168a <RCC_GetClocksFreq+0x2ce>
 8001642:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001644:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001648:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 800164c:	d10c      	bne.n	8001668 <RCC_GetClocksFreq+0x2ac>
 800164e:	6443      	str	r3, [r0, #68]	; 0x44
 8001650:	e01b      	b.n	800168a <RCC_GetClocksFreq+0x2ce>
 8001652:	bf00      	nop
 8001654:	40021000 	.word	0x40021000
 8001658:	007a1200 	.word	0x007a1200
 800165c:	003d0900 	.word	0x003d0900
 8001660:	20000020 	.word	0x20000020
 8001664:	20000000 	.word	0x20000000
 8001668:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800166a:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 800166e:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 8001672:	d102      	bne.n	800167a <RCC_GetClocksFreq+0x2be>
 8001674:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001678:	e006      	b.n	8001688 <RCC_GetClocksFreq+0x2cc>
 800167a:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800167c:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001680:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 8001684:	d101      	bne.n	800168a <RCC_GetClocksFreq+0x2ce>
 8001686:	4a11      	ldr	r2, [pc, #68]	; (80016cc <RCC_GetClocksFreq+0x310>)
 8001688:	6442      	str	r2, [r0, #68]	; 0x44
 800168a:	4a11      	ldr	r2, [pc, #68]	; (80016d0 <RCC_GetClocksFreq+0x314>)
 800168c:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800168e:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 8001692:	d102      	bne.n	800169a <RCC_GetClocksFreq+0x2de>
 8001694:	6486      	str	r6, [r0, #72]	; 0x48
 8001696:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800169a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800169c:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 80016a0:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 80016a4:	d00f      	beq.n	80016c6 <RCC_GetClocksFreq+0x30a>
 80016a6:	6b13      	ldr	r3, [r2, #48]	; 0x30
 80016a8:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80016ac:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 80016b0:	d102      	bne.n	80016b8 <RCC_GetClocksFreq+0x2fc>
 80016b2:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80016b6:	e006      	b.n	80016c6 <RCC_GetClocksFreq+0x30a>
 80016b8:	6b13      	ldr	r3, [r2, #48]	; 0x30
 80016ba:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80016be:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 80016c2:	d101      	bne.n	80016c8 <RCC_GetClocksFreq+0x30c>
 80016c4:	4b01      	ldr	r3, [pc, #4]	; (80016cc <RCC_GetClocksFreq+0x310>)
 80016c6:	6483      	str	r3, [r0, #72]	; 0x48
 80016c8:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80016cc:	007a1200 	.word	0x007a1200
 80016d0:	40021000 	.word	0x40021000

080016d4 <RCC_AHBPeriphClockCmd>:
 80016d4:	bf00      	nop
 80016d6:	bf00      	nop
 80016d8:	4b04      	ldr	r3, [pc, #16]	; (80016ec <RCC_AHBPeriphClockCmd+0x18>)
 80016da:	695a      	ldr	r2, [r3, #20]
 80016dc:	b109      	cbz	r1, 80016e2 <RCC_AHBPeriphClockCmd+0xe>
 80016de:	4310      	orrs	r0, r2
 80016e0:	e001      	b.n	80016e6 <RCC_AHBPeriphClockCmd+0x12>
 80016e2:	ea22 0000 	bic.w	r0, r2, r0
 80016e6:	6158      	str	r0, [r3, #20]
 80016e8:	4770      	bx	lr
 80016ea:	bf00      	nop
 80016ec:	40021000 	.word	0x40021000

080016f0 <RCC_APB2PeriphClockCmd>:
 80016f0:	bf00      	nop
 80016f2:	bf00      	nop
 80016f4:	4b04      	ldr	r3, [pc, #16]	; (8001708 <RCC_APB2PeriphClockCmd+0x18>)
 80016f6:	699a      	ldr	r2, [r3, #24]
 80016f8:	b109      	cbz	r1, 80016fe <RCC_APB2PeriphClockCmd+0xe>
 80016fa:	4310      	orrs	r0, r2
 80016fc:	e001      	b.n	8001702 <RCC_APB2PeriphClockCmd+0x12>
 80016fe:	ea22 0000 	bic.w	r0, r2, r0
 8001702:	6198      	str	r0, [r3, #24]
 8001704:	4770      	bx	lr
 8001706:	bf00      	nop
 8001708:	40021000 	.word	0x40021000

0800170c <RCC_APB1PeriphClockCmd>:
 800170c:	bf00      	nop
 800170e:	bf00      	nop
 8001710:	4b04      	ldr	r3, [pc, #16]	; (8001724 <RCC_APB1PeriphClockCmd+0x18>)
 8001712:	69da      	ldr	r2, [r3, #28]
 8001714:	b109      	cbz	r1, 800171a <RCC_APB1PeriphClockCmd+0xe>
 8001716:	4310      	orrs	r0, r2
 8001718:	e001      	b.n	800171e <RCC_APB1PeriphClockCmd+0x12>
 800171a:	ea22 0000 	bic.w	r0, r2, r0
 800171e:	61d8      	str	r0, [r3, #28]
 8001720:	4770      	bx	lr
 8001722:	bf00      	nop
 8001724:	40021000 	.word	0x40021000

08001728 <TIM_TimeBaseInit>:
 8001728:	bf00      	nop
 800172a:	bf00      	nop
 800172c:	bf00      	nop
 800172e:	4a24      	ldr	r2, [pc, #144]	; (80017c0 <TIM_TimeBaseInit+0x98>)
 8001730:	8803      	ldrh	r3, [r0, #0]
 8001732:	4290      	cmp	r0, r2
 8001734:	b29b      	uxth	r3, r3
 8001736:	d012      	beq.n	800175e <TIM_TimeBaseInit+0x36>
 8001738:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 800173c:	4290      	cmp	r0, r2
 800173e:	d00e      	beq.n	800175e <TIM_TimeBaseInit+0x36>
 8001740:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001744:	d00b      	beq.n	800175e <TIM_TimeBaseInit+0x36>
 8001746:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 800174a:	4290      	cmp	r0, r2
 800174c:	d007      	beq.n	800175e <TIM_TimeBaseInit+0x36>
 800174e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001752:	4290      	cmp	r0, r2
 8001754:	d003      	beq.n	800175e <TIM_TimeBaseInit+0x36>
 8001756:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 800175a:	4290      	cmp	r0, r2
 800175c:	d103      	bne.n	8001766 <TIM_TimeBaseInit+0x3e>
 800175e:	884a      	ldrh	r2, [r1, #2]
 8001760:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001764:	4313      	orrs	r3, r2
 8001766:	4a17      	ldr	r2, [pc, #92]	; (80017c4 <TIM_TimeBaseInit+0x9c>)
 8001768:	4290      	cmp	r0, r2
 800176a:	d008      	beq.n	800177e <TIM_TimeBaseInit+0x56>
 800176c:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001770:	4290      	cmp	r0, r2
 8001772:	d004      	beq.n	800177e <TIM_TimeBaseInit+0x56>
 8001774:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001778:	890a      	ldrh	r2, [r1, #8]
 800177a:	b29b      	uxth	r3, r3
 800177c:	4313      	orrs	r3, r2
 800177e:	8003      	strh	r3, [r0, #0]
 8001780:	684b      	ldr	r3, [r1, #4]
 8001782:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001784:	880b      	ldrh	r3, [r1, #0]
 8001786:	8503      	strh	r3, [r0, #40]	; 0x28
 8001788:	4b0d      	ldr	r3, [pc, #52]	; (80017c0 <TIM_TimeBaseInit+0x98>)
 800178a:	4298      	cmp	r0, r3
 800178c:	d013      	beq.n	80017b6 <TIM_TimeBaseInit+0x8e>
 800178e:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001792:	4298      	cmp	r0, r3
 8001794:	d00f      	beq.n	80017b6 <TIM_TimeBaseInit+0x8e>
 8001796:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 800179a:	4298      	cmp	r0, r3
 800179c:	d00b      	beq.n	80017b6 <TIM_TimeBaseInit+0x8e>
 800179e:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80017a2:	4298      	cmp	r0, r3
 80017a4:	d007      	beq.n	80017b6 <TIM_TimeBaseInit+0x8e>
 80017a6:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80017aa:	4298      	cmp	r0, r3
 80017ac:	d003      	beq.n	80017b6 <TIM_TimeBaseInit+0x8e>
 80017ae:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80017b2:	4298      	cmp	r0, r3
 80017b4:	d101      	bne.n	80017ba <TIM_TimeBaseInit+0x92>
 80017b6:	894b      	ldrh	r3, [r1, #10]
 80017b8:	8603      	strh	r3, [r0, #48]	; 0x30
 80017ba:	2301      	movs	r3, #1
 80017bc:	6143      	str	r3, [r0, #20]
 80017be:	4770      	bx	lr
 80017c0:	40012c00 	.word	0x40012c00
 80017c4:	40001000 	.word	0x40001000

080017c8 <TIM_Cmd>:
 80017c8:	bf00      	nop
 80017ca:	bf00      	nop
 80017cc:	8803      	ldrh	r3, [r0, #0]
 80017ce:	b119      	cbz	r1, 80017d8 <TIM_Cmd+0x10>
 80017d0:	b29b      	uxth	r3, r3
 80017d2:	f043 0301 	orr.w	r3, r3, #1
 80017d6:	e003      	b.n	80017e0 <TIM_Cmd+0x18>
 80017d8:	f023 0301 	bic.w	r3, r3, #1
 80017dc:	041b      	lsls	r3, r3, #16
 80017de:	0c1b      	lsrs	r3, r3, #16
 80017e0:	8003      	strh	r3, [r0, #0]
 80017e2:	4770      	bx	lr

080017e4 <TIM_ClearITPendingBit>:
 80017e4:	bf00      	nop
 80017e6:	43c9      	mvns	r1, r1
 80017e8:	b289      	uxth	r1, r1
 80017ea:	6101      	str	r1, [r0, #16]
 80017ec:	4770      	bx	lr
	...

080017f0 <timer_init>:
 80017f0:	b530      	push	{r4, r5, lr}
 80017f2:	2300      	movs	r3, #0
 80017f4:	b085      	sub	sp, #20
 80017f6:	491f      	ldr	r1, [pc, #124]	; (8001874 <timer_init+0x84>)
 80017f8:	f44f 6280 	mov.w	r2, #1024	; 0x400
 80017fc:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001800:	491d      	ldr	r1, [pc, #116]	; (8001878 <timer_init+0x88>)
 8001802:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001806:	4a1d      	ldr	r2, [pc, #116]	; (800187c <timer_init+0x8c>)
 8001808:	2400      	movs	r4, #0
 800180a:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 800180e:	3301      	adds	r3, #1
 8001810:	2b04      	cmp	r3, #4
 8001812:	4625      	mov	r5, r4
 8001814:	d1ef      	bne.n	80017f6 <timer_init+0x6>
 8001816:	4b1a      	ldr	r3, [pc, #104]	; (8001880 <timer_init+0x90>)
 8001818:	2002      	movs	r0, #2
 800181a:	2101      	movs	r1, #1
 800181c:	601c      	str	r4, [r3, #0]
 800181e:	f7ff ff75 	bl	800170c <RCC_APB1PeriphClockCmd>
 8001822:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001826:	f8ad 400c 	strh.w	r4, [sp, #12]
 800182a:	f8ad 400e 	strh.w	r4, [sp, #14]
 800182e:	4c15      	ldr	r4, [pc, #84]	; (8001884 <timer_init+0x94>)
 8001830:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001834:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001838:	4620      	mov	r0, r4
 800183a:	2331      	movs	r3, #49	; 0x31
 800183c:	a901      	add	r1, sp, #4
 800183e:	9302      	str	r3, [sp, #8]
 8001840:	f7ff ff72 	bl	8001728 <TIM_TimeBaseInit>
 8001844:	4620      	mov	r0, r4
 8001846:	2101      	movs	r1, #1
 8001848:	f7ff ffbe 	bl	80017c8 <TIM_Cmd>
 800184c:	68e3      	ldr	r3, [r4, #12]
 800184e:	f043 0301 	orr.w	r3, r3, #1
 8001852:	60e3      	str	r3, [r4, #12]
 8001854:	231d      	movs	r3, #29
 8001856:	f88d 3000 	strb.w	r3, [sp]
 800185a:	4668      	mov	r0, sp
 800185c:	2301      	movs	r3, #1
 800185e:	f88d 5001 	strb.w	r5, [sp, #1]
 8001862:	f88d 3002 	strb.w	r3, [sp, #2]
 8001866:	f88d 3003 	strb.w	r3, [sp, #3]
 800186a:	f000 fb9f 	bl	8001fac <NVIC_Init>
 800186e:	b005      	add	sp, #20
 8001870:	bd30      	pop	{r4, r5, pc}
 8001872:	bf00      	nop
 8001874:	20000dd0 	.word	0x20000dd0
 8001878:	20000dc4 	.word	0x20000dc4
 800187c:	20000dbc 	.word	0x20000dbc
 8001880:	20000dcc 	.word	0x20000dcc
 8001884:	40000400 	.word	0x40000400

08001888 <TIM3_IRQHandler>:
 8001888:	2300      	movs	r3, #0
 800188a:	4a10      	ldr	r2, [pc, #64]	; (80018cc <TIM3_IRQHandler+0x44>)
 800188c:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001890:	b289      	uxth	r1, r1
 8001892:	b129      	cbz	r1, 80018a0 <TIM3_IRQHandler+0x18>
 8001894:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001898:	b289      	uxth	r1, r1
 800189a:	3901      	subs	r1, #1
 800189c:	b289      	uxth	r1, r1
 800189e:	e007      	b.n	80018b0 <TIM3_IRQHandler+0x28>
 80018a0:	490b      	ldr	r1, [pc, #44]	; (80018d0 <TIM3_IRQHandler+0x48>)
 80018a2:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 80018a6:	b289      	uxth	r1, r1
 80018a8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 80018ac:	4a09      	ldr	r2, [pc, #36]	; (80018d4 <TIM3_IRQHandler+0x4c>)
 80018ae:	2101      	movs	r1, #1
 80018b0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 80018b4:	3301      	adds	r3, #1
 80018b6:	2b04      	cmp	r3, #4
 80018b8:	d1e7      	bne.n	800188a <TIM3_IRQHandler+0x2>
 80018ba:	4b07      	ldr	r3, [pc, #28]	; (80018d8 <TIM3_IRQHandler+0x50>)
 80018bc:	4807      	ldr	r0, [pc, #28]	; (80018dc <TIM3_IRQHandler+0x54>)
 80018be:	681a      	ldr	r2, [r3, #0]
 80018c0:	2101      	movs	r1, #1
 80018c2:	3201      	adds	r2, #1
 80018c4:	601a      	str	r2, [r3, #0]
 80018c6:	f7ff bf8d 	b.w	80017e4 <TIM_ClearITPendingBit>
 80018ca:	bf00      	nop
 80018cc:	20000dd0 	.word	0x20000dd0
 80018d0:	20000dc4 	.word	0x20000dc4
 80018d4:	20000dbc 	.word	0x20000dbc
 80018d8:	20000dcc 	.word	0x20000dcc
 80018dc:	40000400 	.word	0x40000400

080018e0 <timer_get_time>:
 80018e0:	b082      	sub	sp, #8
 80018e2:	b672      	cpsid	i
 80018e4:	4b04      	ldr	r3, [pc, #16]	; (80018f8 <timer_get_time+0x18>)
 80018e6:	681b      	ldr	r3, [r3, #0]
 80018e8:	9301      	str	r3, [sp, #4]
 80018ea:	b662      	cpsie	i
 80018ec:	9801      	ldr	r0, [sp, #4]
 80018ee:	230a      	movs	r3, #10
 80018f0:	fbb0 f0f3 	udiv	r0, r0, r3
 80018f4:	b002      	add	sp, #8
 80018f6:	4770      	bx	lr
 80018f8:	20000dcc 	.word	0x20000dcc

080018fc <timer_delay_ms>:
 80018fc:	b513      	push	{r0, r1, r4, lr}
 80018fe:	4604      	mov	r4, r0
 8001900:	f7ff ffee 	bl	80018e0 <timer_get_time>
 8001904:	4420      	add	r0, r4
 8001906:	9001      	str	r0, [sp, #4]
 8001908:	9c01      	ldr	r4, [sp, #4]
 800190a:	f7ff ffe9 	bl	80018e0 <timer_get_time>
 800190e:	4284      	cmp	r4, r0
 8001910:	d902      	bls.n	8001918 <timer_delay_ms+0x1c>
 8001912:	f000 fb47 	bl	8001fa4 <sleep>
 8001916:	e7f7      	b.n	8001908 <timer_delay_ms+0xc>
 8001918:	b002      	add	sp, #8
 800191a:	bd10      	pop	{r4, pc}

0800191c <event_timer_set_period>:
 800191c:	b672      	cpsid	i
 800191e:	230a      	movs	r3, #10
 8001920:	4359      	muls	r1, r3
 8001922:	4b06      	ldr	r3, [pc, #24]	; (800193c <event_timer_set_period+0x20>)
 8001924:	b289      	uxth	r1, r1
 8001926:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 800192a:	4b05      	ldr	r3, [pc, #20]	; (8001940 <event_timer_set_period+0x24>)
 800192c:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001930:	4b04      	ldr	r3, [pc, #16]	; (8001944 <event_timer_set_period+0x28>)
 8001932:	2200      	movs	r2, #0
 8001934:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 8001938:	b662      	cpsie	i
 800193a:	4770      	bx	lr
 800193c:	20000dd0 	.word	0x20000dd0
 8001940:	20000dc4 	.word	0x20000dc4
 8001944:	20000dbc 	.word	0x20000dbc

08001948 <event_timer_wait>:
 8001948:	b510      	push	{r4, lr}
 800194a:	4604      	mov	r4, r0
 800194c:	4b06      	ldr	r3, [pc, #24]	; (8001968 <event_timer_wait+0x20>)
 800194e:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 8001952:	b292      	uxth	r2, r2
 8001954:	b912      	cbnz	r2, 800195c <event_timer_wait+0x14>
 8001956:	f000 fb25 	bl	8001fa4 <sleep>
 800195a:	e7f7      	b.n	800194c <event_timer_wait+0x4>
 800195c:	b672      	cpsid	i
 800195e:	2200      	movs	r2, #0
 8001960:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 8001964:	b662      	cpsie	i
 8001966:	bd10      	pop	{r4, pc}
 8001968:	20000dbc 	.word	0x20000dbc

0800196c <USART_Init>:
 800196c:	b530      	push	{r4, r5, lr}
 800196e:	4604      	mov	r4, r0
 8001970:	b099      	sub	sp, #100	; 0x64
 8001972:	460d      	mov	r5, r1
 8001974:	bf00      	nop
 8001976:	bf00      	nop
 8001978:	bf00      	nop
 800197a:	bf00      	nop
 800197c:	bf00      	nop
 800197e:	bf00      	nop
 8001980:	bf00      	nop
 8001982:	6803      	ldr	r3, [r0, #0]
 8001984:	f023 0301 	bic.w	r3, r3, #1
 8001988:	6003      	str	r3, [r0, #0]
 800198a:	6842      	ldr	r2, [r0, #4]
 800198c:	688b      	ldr	r3, [r1, #8]
 800198e:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 8001992:	4313      	orrs	r3, r2
 8001994:	6043      	str	r3, [r0, #4]
 8001996:	686a      	ldr	r2, [r5, #4]
 8001998:	68eb      	ldr	r3, [r5, #12]
 800199a:	6801      	ldr	r1, [r0, #0]
 800199c:	431a      	orrs	r2, r3
 800199e:	692b      	ldr	r3, [r5, #16]
 80019a0:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 80019a4:	f021 010c 	bic.w	r1, r1, #12
 80019a8:	4313      	orrs	r3, r2
 80019aa:	430b      	orrs	r3, r1
 80019ac:	6003      	str	r3, [r0, #0]
 80019ae:	6882      	ldr	r2, [r0, #8]
 80019b0:	696b      	ldr	r3, [r5, #20]
 80019b2:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 80019b6:	4313      	orrs	r3, r2
 80019b8:	6083      	str	r3, [r0, #8]
 80019ba:	a801      	add	r0, sp, #4
 80019bc:	f7ff fcfe 	bl	80013bc <RCC_GetClocksFreq>
 80019c0:	4b17      	ldr	r3, [pc, #92]	; (8001a20 <USART_Init+0xb4>)
 80019c2:	429c      	cmp	r4, r3
 80019c4:	d101      	bne.n	80019ca <USART_Init+0x5e>
 80019c6:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 80019c8:	e00e      	b.n	80019e8 <USART_Init+0x7c>
 80019ca:	4b16      	ldr	r3, [pc, #88]	; (8001a24 <USART_Init+0xb8>)
 80019cc:	429c      	cmp	r4, r3
 80019ce:	d101      	bne.n	80019d4 <USART_Init+0x68>
 80019d0:	9a10      	ldr	r2, [sp, #64]	; 0x40
 80019d2:	e009      	b.n	80019e8 <USART_Init+0x7c>
 80019d4:	4b14      	ldr	r3, [pc, #80]	; (8001a28 <USART_Init+0xbc>)
 80019d6:	429c      	cmp	r4, r3
 80019d8:	d101      	bne.n	80019de <USART_Init+0x72>
 80019da:	9a11      	ldr	r2, [sp, #68]	; 0x44
 80019dc:	e004      	b.n	80019e8 <USART_Init+0x7c>
 80019de:	4b13      	ldr	r3, [pc, #76]	; (8001a2c <USART_Init+0xc0>)
 80019e0:	429c      	cmp	r4, r3
 80019e2:	bf0c      	ite	eq
 80019e4:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 80019e6:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 80019e8:	6823      	ldr	r3, [r4, #0]
 80019ea:	6829      	ldr	r1, [r5, #0]
 80019ec:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 80019f0:	bf18      	it	ne
 80019f2:	0052      	lslne	r2, r2, #1
 80019f4:	fbb2 f3f1 	udiv	r3, r2, r1
 80019f8:	fb01 2213 	mls	r2, r1, r3, r2
 80019fc:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 8001a00:	6822      	ldr	r2, [r4, #0]
 8001a02:	bf28      	it	cs
 8001a04:	3301      	addcs	r3, #1
 8001a06:	0412      	lsls	r2, r2, #16
 8001a08:	d506      	bpl.n	8001a18 <USART_Init+0xac>
 8001a0a:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 8001a0e:	f3c3 0142 	ubfx	r1, r3, #1, #3
 8001a12:	401a      	ands	r2, r3
 8001a14:	ea41 0302 	orr.w	r3, r1, r2
 8001a18:	b29b      	uxth	r3, r3
 8001a1a:	81a3      	strh	r3, [r4, #12]
 8001a1c:	b019      	add	sp, #100	; 0x64
 8001a1e:	bd30      	pop	{r4, r5, pc}
 8001a20:	40013800 	.word	0x40013800
 8001a24:	40004400 	.word	0x40004400
 8001a28:	40004800 	.word	0x40004800
 8001a2c:	40004c00 	.word	0x40004c00

08001a30 <USART_Cmd>:
 8001a30:	bf00      	nop
 8001a32:	bf00      	nop
 8001a34:	6803      	ldr	r3, [r0, #0]
 8001a36:	b111      	cbz	r1, 8001a3e <USART_Cmd+0xe>
 8001a38:	f043 0301 	orr.w	r3, r3, #1
 8001a3c:	e001      	b.n	8001a42 <USART_Cmd+0x12>
 8001a3e:	f023 0301 	bic.w	r3, r3, #1
 8001a42:	6003      	str	r3, [r0, #0]
 8001a44:	4770      	bx	lr

08001a46 <USART_ReceiveData>:
 8001a46:	bf00      	nop
 8001a48:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8001a4a:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8001a4e:	4770      	bx	lr

08001a50 <USART_ITConfig>:
 8001a50:	b510      	push	{r4, lr}
 8001a52:	bf00      	nop
 8001a54:	bf00      	nop
 8001a56:	bf00      	nop
 8001a58:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8001a5c:	2401      	movs	r4, #1
 8001a5e:	b2c9      	uxtb	r1, r1
 8001a60:	2b02      	cmp	r3, #2
 8001a62:	fa04 f101 	lsl.w	r1, r4, r1
 8001a66:	d101      	bne.n	8001a6c <USART_ITConfig+0x1c>
 8001a68:	3004      	adds	r0, #4
 8001a6a:	e002      	b.n	8001a72 <USART_ITConfig+0x22>
 8001a6c:	2b03      	cmp	r3, #3
 8001a6e:	bf08      	it	eq
 8001a70:	3008      	addeq	r0, #8
 8001a72:	6803      	ldr	r3, [r0, #0]
 8001a74:	b10a      	cbz	r2, 8001a7a <USART_ITConfig+0x2a>
 8001a76:	4319      	orrs	r1, r3
 8001a78:	e001      	b.n	8001a7e <USART_ITConfig+0x2e>
 8001a7a:	ea23 0101 	bic.w	r1, r3, r1
 8001a7e:	6001      	str	r1, [r0, #0]
 8001a80:	bd10      	pop	{r4, pc}

08001a82 <USART_GetITStatus>:
 8001a82:	b510      	push	{r4, lr}
 8001a84:	bf00      	nop
 8001a86:	bf00      	nop
 8001a88:	2401      	movs	r4, #1
 8001a8a:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8001a8e:	b2cb      	uxtb	r3, r1
 8001a90:	42a2      	cmp	r2, r4
 8001a92:	fa04 f303 	lsl.w	r3, r4, r3
 8001a96:	d101      	bne.n	8001a9c <USART_GetITStatus+0x1a>
 8001a98:	6802      	ldr	r2, [r0, #0]
 8001a9a:	e003      	b.n	8001aa4 <USART_GetITStatus+0x22>
 8001a9c:	2a02      	cmp	r2, #2
 8001a9e:	bf0c      	ite	eq
 8001aa0:	6842      	ldreq	r2, [r0, #4]
 8001aa2:	6882      	ldrne	r2, [r0, #8]
 8001aa4:	4013      	ands	r3, r2
 8001aa6:	69c2      	ldr	r2, [r0, #28]
 8001aa8:	b143      	cbz	r3, 8001abc <USART_GetITStatus+0x3a>
 8001aaa:	2301      	movs	r3, #1
 8001aac:	0c09      	lsrs	r1, r1, #16
 8001aae:	fa03 f101 	lsl.w	r1, r3, r1
 8001ab2:	4211      	tst	r1, r2
 8001ab4:	bf0c      	ite	eq
 8001ab6:	2000      	moveq	r0, #0
 8001ab8:	2001      	movne	r0, #1
 8001aba:	bd10      	pop	{r4, pc}
 8001abc:	4618      	mov	r0, r3
 8001abe:	bd10      	pop	{r4, pc}

08001ac0 <USART_ClearITPendingBit>:
 8001ac0:	bf00      	nop
 8001ac2:	bf00      	nop
 8001ac4:	2301      	movs	r3, #1
 8001ac6:	0c09      	lsrs	r1, r1, #16
 8001ac8:	fa03 f101 	lsl.w	r1, r3, r1
 8001acc:	6201      	str	r1, [r0, #32]
 8001ace:	4770      	bx	lr

08001ad0 <uart_write>:
 8001ad0:	4b03      	ldr	r3, [pc, #12]	; (8001ae0 <uart_write+0x10>)
 8001ad2:	69da      	ldr	r2, [r3, #28]
 8001ad4:	0612      	lsls	r2, r2, #24
 8001ad6:	d401      	bmi.n	8001adc <uart_write+0xc>
 8001ad8:	bf00      	nop
 8001ada:	e7f9      	b.n	8001ad0 <uart_write>
 8001adc:	8518      	strh	r0, [r3, #40]	; 0x28
 8001ade:	4770      	bx	lr
 8001ae0:	40013800 	.word	0x40013800

08001ae4 <uart_is_char>:
 8001ae4:	4b0a      	ldr	r3, [pc, #40]	; (8001b10 <uart_is_char+0x2c>)
 8001ae6:	4a0b      	ldr	r2, [pc, #44]	; (8001b14 <uart_is_char+0x30>)
 8001ae8:	6819      	ldr	r1, [r3, #0]
 8001aea:	6812      	ldr	r2, [r2, #0]
 8001aec:	4291      	cmp	r1, r2
 8001aee:	d00c      	beq.n	8001b0a <uart_is_char+0x26>
 8001af0:	681a      	ldr	r2, [r3, #0]
 8001af2:	4909      	ldr	r1, [pc, #36]	; (8001b18 <uart_is_char+0x34>)
 8001af4:	5c88      	ldrb	r0, [r1, r2]
 8001af6:	681a      	ldr	r2, [r3, #0]
 8001af8:	3201      	adds	r2, #1
 8001afa:	601a      	str	r2, [r3, #0]
 8001afc:	681a      	ldr	r2, [r3, #0]
 8001afe:	2a0f      	cmp	r2, #15
 8001b00:	b2c0      	uxtb	r0, r0
 8001b02:	d904      	bls.n	8001b0e <uart_is_char+0x2a>
 8001b04:	2200      	movs	r2, #0
 8001b06:	601a      	str	r2, [r3, #0]
 8001b08:	4770      	bx	lr
 8001b0a:	f64f 70ff 	movw	r0, #65535	; 0xffff
 8001b0e:	4770      	bx	lr
 8001b10:	20000dec 	.word	0x20000dec
 8001b14:	20000de8 	.word	0x20000de8
 8001b18:	20000dd8 	.word	0x20000dd8

08001b1c <uart_read>:
 8001b1c:	b508      	push	{r3, lr}
 8001b1e:	f7ff ffe1 	bl	8001ae4 <uart_is_char>
 8001b22:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8001b26:	4298      	cmp	r0, r3
 8001b28:	d101      	bne.n	8001b2e <uart_read+0x12>
 8001b2a:	bf00      	nop
 8001b2c:	e7f7      	b.n	8001b1e <uart_read+0x2>
 8001b2e:	b2c0      	uxtb	r0, r0
 8001b30:	bd08      	pop	{r3, pc}
	...

08001b34 <uart_init>:
 8001b34:	b530      	push	{r4, r5, lr}
 8001b36:	4b2c      	ldr	r3, [pc, #176]	; (8001be8 <uart_init+0xb4>)
 8001b38:	4d2c      	ldr	r5, [pc, #176]	; (8001bec <uart_init+0xb8>)
 8001b3a:	2400      	movs	r4, #0
 8001b3c:	601c      	str	r4, [r3, #0]
 8001b3e:	4b2c      	ldr	r3, [pc, #176]	; (8001bf0 <uart_init+0xbc>)
 8001b40:	b08b      	sub	sp, #44	; 0x2c
 8001b42:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001b46:	2101      	movs	r1, #1
 8001b48:	601c      	str	r4, [r3, #0]
 8001b4a:	f7ff fdc3 	bl	80016d4 <RCC_AHBPeriphClockCmd>
 8001b4e:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001b52:	2101      	movs	r1, #1
 8001b54:	f7ff fdcc 	bl	80016f0 <RCC_APB2PeriphClockCmd>
 8001b58:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001b5c:	9302      	str	r3, [sp, #8]
 8001b5e:	2302      	movs	r3, #2
 8001b60:	f88d 300c 	strb.w	r3, [sp, #12]
 8001b64:	a902      	add	r1, sp, #8
 8001b66:	2303      	movs	r3, #3
 8001b68:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001b6c:	f88d 300d 	strb.w	r3, [sp, #13]
 8001b70:	f88d 400e 	strb.w	r4, [sp, #14]
 8001b74:	f88d 400f 	strb.w	r4, [sp, #15]
 8001b78:	f000 fa5d 	bl	8002036 <GPIO_Init>
 8001b7c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001b80:	2109      	movs	r1, #9
 8001b82:	2207      	movs	r2, #7
 8001b84:	f000 faa5 	bl	80020d2 <GPIO_PinAFConfig>
 8001b88:	2207      	movs	r2, #7
 8001b8a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001b8e:	210a      	movs	r1, #10
 8001b90:	f000 fa9f 	bl	80020d2 <GPIO_PinAFConfig>
 8001b94:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001b98:	9304      	str	r3, [sp, #16]
 8001b9a:	4628      	mov	r0, r5
 8001b9c:	230c      	movs	r3, #12
 8001b9e:	a904      	add	r1, sp, #16
 8001ba0:	9308      	str	r3, [sp, #32]
 8001ba2:	9405      	str	r4, [sp, #20]
 8001ba4:	9406      	str	r4, [sp, #24]
 8001ba6:	9407      	str	r4, [sp, #28]
 8001ba8:	9409      	str	r4, [sp, #36]	; 0x24
 8001baa:	f7ff fedf 	bl	800196c <USART_Init>
 8001bae:	4628      	mov	r0, r5
 8001bb0:	2101      	movs	r1, #1
 8001bb2:	f7ff ff3d 	bl	8001a30 <USART_Cmd>
 8001bb6:	2201      	movs	r2, #1
 8001bb8:	4628      	mov	r0, r5
 8001bba:	490e      	ldr	r1, [pc, #56]	; (8001bf4 <uart_init+0xc0>)
 8001bbc:	f7ff ff48 	bl	8001a50 <USART_ITConfig>
 8001bc0:	2325      	movs	r3, #37	; 0x25
 8001bc2:	f88d 4005 	strb.w	r4, [sp, #5]
 8001bc6:	f88d 4006 	strb.w	r4, [sp, #6]
 8001bca:	a801      	add	r0, sp, #4
 8001bcc:	2401      	movs	r4, #1
 8001bce:	f88d 3004 	strb.w	r3, [sp, #4]
 8001bd2:	f88d 4007 	strb.w	r4, [sp, #7]
 8001bd6:	f000 f9e9 	bl	8001fac <NVIC_Init>
 8001bda:	4628      	mov	r0, r5
 8001bdc:	4621      	mov	r1, r4
 8001bde:	f7ff ff27 	bl	8001a30 <USART_Cmd>
 8001be2:	b00b      	add	sp, #44	; 0x2c
 8001be4:	bd30      	pop	{r4, r5, pc}
 8001be6:	bf00      	nop
 8001be8:	20000de8 	.word	0x20000de8
 8001bec:	40013800 	.word	0x40013800
 8001bf0:	20000dec 	.word	0x20000dec
 8001bf4:	00050105 	.word	0x00050105

08001bf8 <USART1_IRQHandler>:
 8001bf8:	b508      	push	{r3, lr}
 8001bfa:	480d      	ldr	r0, [pc, #52]	; (8001c30 <USART1_IRQHandler+0x38>)
 8001bfc:	490d      	ldr	r1, [pc, #52]	; (8001c34 <USART1_IRQHandler+0x3c>)
 8001bfe:	f7ff ff40 	bl	8001a82 <USART_GetITStatus>
 8001c02:	b178      	cbz	r0, 8001c24 <USART1_IRQHandler+0x2c>
 8001c04:	480a      	ldr	r0, [pc, #40]	; (8001c30 <USART1_IRQHandler+0x38>)
 8001c06:	f7ff ff1e 	bl	8001a46 <USART_ReceiveData>
 8001c0a:	4b0b      	ldr	r3, [pc, #44]	; (8001c38 <USART1_IRQHandler+0x40>)
 8001c0c:	490b      	ldr	r1, [pc, #44]	; (8001c3c <USART1_IRQHandler+0x44>)
 8001c0e:	681a      	ldr	r2, [r3, #0]
 8001c10:	b2c0      	uxtb	r0, r0
 8001c12:	5488      	strb	r0, [r1, r2]
 8001c14:	681a      	ldr	r2, [r3, #0]
 8001c16:	3201      	adds	r2, #1
 8001c18:	601a      	str	r2, [r3, #0]
 8001c1a:	681a      	ldr	r2, [r3, #0]
 8001c1c:	2a0f      	cmp	r2, #15
 8001c1e:	bf84      	itt	hi
 8001c20:	2200      	movhi	r2, #0
 8001c22:	601a      	strhi	r2, [r3, #0]
 8001c24:	4802      	ldr	r0, [pc, #8]	; (8001c30 <USART1_IRQHandler+0x38>)
 8001c26:	4903      	ldr	r1, [pc, #12]	; (8001c34 <USART1_IRQHandler+0x3c>)
 8001c28:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001c2c:	f7ff bf48 	b.w	8001ac0 <USART_ClearITPendingBit>
 8001c30:	40013800 	.word	0x40013800
 8001c34:	00050105 	.word	0x00050105
 8001c38:	20000de8 	.word	0x20000de8
 8001c3c:	20000dd8 	.word	0x20000dd8

08001c40 <uart_clear_buffer>:
 8001c40:	b672      	cpsid	i
 8001c42:	2300      	movs	r3, #0
 8001c44:	4a03      	ldr	r2, [pc, #12]	; (8001c54 <uart_clear_buffer+0x14>)
 8001c46:	2100      	movs	r1, #0
 8001c48:	54d1      	strb	r1, [r2, r3]
 8001c4a:	3301      	adds	r3, #1
 8001c4c:	2b10      	cmp	r3, #16
 8001c4e:	d1f9      	bne.n	8001c44 <uart_clear_buffer+0x4>
 8001c50:	b662      	cpsie	i
 8001c52:	4770      	bx	lr
 8001c54:	20000dd8 	.word	0x20000dd8

08001c58 <i2c_delay>:
 8001c58:	bf00      	nop
 8001c5a:	4770      	bx	lr

08001c5c <SetLowSDA>:
 8001c5c:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001c5e:	4d0d      	ldr	r5, [pc, #52]	; (8001c94 <SetLowSDA+0x38>)
 8001c60:	2301      	movs	r3, #1
 8001c62:	2203      	movs	r2, #3
 8001c64:	2480      	movs	r4, #128	; 0x80
 8001c66:	f88d 3004 	strb.w	r3, [sp, #4]
 8001c6a:	f88d 3006 	strb.w	r3, [sp, #6]
 8001c6e:	4628      	mov	r0, r5
 8001c70:	2300      	movs	r3, #0
 8001c72:	4669      	mov	r1, sp
 8001c74:	f88d 2005 	strb.w	r2, [sp, #5]
 8001c78:	f88d 3007 	strb.w	r3, [sp, #7]
 8001c7c:	9400      	str	r4, [sp, #0]
 8001c7e:	f000 f9da 	bl	8002036 <GPIO_Init>
 8001c82:	4628      	mov	r0, r5
 8001c84:	4621      	mov	r1, r4
 8001c86:	f000 fa20 	bl	80020ca <GPIO_ResetBits>
 8001c8a:	f7ff ffe5 	bl	8001c58 <i2c_delay>
 8001c8e:	b003      	add	sp, #12
 8001c90:	bd30      	pop	{r4, r5, pc}
 8001c92:	bf00      	nop
 8001c94:	48000400 	.word	0x48000400

08001c98 <SetHighSDA>:
 8001c98:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001c9a:	4d0d      	ldr	r5, [pc, #52]	; (8001cd0 <SetHighSDA+0x38>)
 8001c9c:	2203      	movs	r2, #3
 8001c9e:	2300      	movs	r3, #0
 8001ca0:	2480      	movs	r4, #128	; 0x80
 8001ca2:	f88d 2005 	strb.w	r2, [sp, #5]
 8001ca6:	4628      	mov	r0, r5
 8001ca8:	2201      	movs	r2, #1
 8001caa:	4669      	mov	r1, sp
 8001cac:	f88d 3004 	strb.w	r3, [sp, #4]
 8001cb0:	f88d 2006 	strb.w	r2, [sp, #6]
 8001cb4:	f88d 3007 	strb.w	r3, [sp, #7]
 8001cb8:	9400      	str	r4, [sp, #0]
 8001cba:	f000 f9bc 	bl	8002036 <GPIO_Init>
 8001cbe:	4628      	mov	r0, r5
 8001cc0:	4621      	mov	r1, r4
 8001cc2:	f000 f9fe 	bl	80020c2 <GPIO_SetBits>
 8001cc6:	f7ff ffc7 	bl	8001c58 <i2c_delay>
 8001cca:	b003      	add	sp, #12
 8001ccc:	bd30      	pop	{r4, r5, pc}
 8001cce:	bf00      	nop
 8001cd0:	48000400 	.word	0x48000400

08001cd4 <SetLowSCL>:
 8001cd4:	b508      	push	{r3, lr}
 8001cd6:	4804      	ldr	r0, [pc, #16]	; (8001ce8 <SetLowSCL+0x14>)
 8001cd8:	2140      	movs	r1, #64	; 0x40
 8001cda:	f000 f9f6 	bl	80020ca <GPIO_ResetBits>
 8001cde:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001ce2:	f7ff bfb9 	b.w	8001c58 <i2c_delay>
 8001ce6:	bf00      	nop
 8001ce8:	48000400 	.word	0x48000400

08001cec <SetHighSCL>:
 8001cec:	b508      	push	{r3, lr}
 8001cee:	4804      	ldr	r0, [pc, #16]	; (8001d00 <SetHighSCL+0x14>)
 8001cf0:	2140      	movs	r1, #64	; 0x40
 8001cf2:	f000 f9e6 	bl	80020c2 <GPIO_SetBits>
 8001cf6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001cfa:	f7ff bfad 	b.w	8001c58 <i2c_delay>
 8001cfe:	bf00      	nop
 8001d00:	48000400 	.word	0x48000400

08001d04 <i2c_0_init>:
 8001d04:	b507      	push	{r0, r1, r2, lr}
 8001d06:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001d0a:	2101      	movs	r1, #1
 8001d0c:	f7ff fce2 	bl	80016d4 <RCC_AHBPeriphClockCmd>
 8001d10:	23c0      	movs	r3, #192	; 0xc0
 8001d12:	9300      	str	r3, [sp, #0]
 8001d14:	2301      	movs	r3, #1
 8001d16:	2203      	movs	r2, #3
 8001d18:	480a      	ldr	r0, [pc, #40]	; (8001d44 <i2c_0_init+0x40>)
 8001d1a:	f88d 3004 	strb.w	r3, [sp, #4]
 8001d1e:	4669      	mov	r1, sp
 8001d20:	f88d 3006 	strb.w	r3, [sp, #6]
 8001d24:	2300      	movs	r3, #0
 8001d26:	f88d 2005 	strb.w	r2, [sp, #5]
 8001d2a:	f88d 3007 	strb.w	r3, [sp, #7]
 8001d2e:	f000 f982 	bl	8002036 <GPIO_Init>
 8001d32:	f7ff ffdb 	bl	8001cec <SetHighSCL>
 8001d36:	f7ff ff91 	bl	8001c5c <SetLowSDA>
 8001d3a:	f7ff ffad 	bl	8001c98 <SetHighSDA>
 8001d3e:	b003      	add	sp, #12
 8001d40:	f85d fb04 	ldr.w	pc, [sp], #4
 8001d44:	48000400 	.word	0x48000400

08001d48 <i2cStart>:
 8001d48:	b508      	push	{r3, lr}
 8001d4a:	f7ff ffcf 	bl	8001cec <SetHighSCL>
 8001d4e:	f7ff ffa3 	bl	8001c98 <SetHighSDA>
 8001d52:	f7ff ffcb 	bl	8001cec <SetHighSCL>
 8001d56:	f7ff ff81 	bl	8001c5c <SetLowSDA>
 8001d5a:	f7ff ffbb 	bl	8001cd4 <SetLowSCL>
 8001d5e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001d62:	f7ff bf99 	b.w	8001c98 <SetHighSDA>

08001d66 <i2cStop>:
 8001d66:	b508      	push	{r3, lr}
 8001d68:	f7ff ffb4 	bl	8001cd4 <SetLowSCL>
 8001d6c:	f7ff ff76 	bl	8001c5c <SetLowSDA>
 8001d70:	f7ff ffbc 	bl	8001cec <SetHighSCL>
 8001d74:	f7ff ff72 	bl	8001c5c <SetLowSDA>
 8001d78:	f7ff ffb8 	bl	8001cec <SetHighSCL>
 8001d7c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001d80:	f7ff bf8a 	b.w	8001c98 <SetHighSDA>

08001d84 <i2cWrite>:
 8001d84:	b538      	push	{r3, r4, r5, lr}
 8001d86:	4604      	mov	r4, r0
 8001d88:	2508      	movs	r5, #8
 8001d8a:	f7ff ffa3 	bl	8001cd4 <SetLowSCL>
 8001d8e:	0623      	lsls	r3, r4, #24
 8001d90:	d502      	bpl.n	8001d98 <i2cWrite+0x14>
 8001d92:	f7ff ff81 	bl	8001c98 <SetHighSDA>
 8001d96:	e001      	b.n	8001d9c <i2cWrite+0x18>
 8001d98:	f7ff ff60 	bl	8001c5c <SetLowSDA>
 8001d9c:	3d01      	subs	r5, #1
 8001d9e:	f7ff ffa5 	bl	8001cec <SetHighSCL>
 8001da2:	0064      	lsls	r4, r4, #1
 8001da4:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001da8:	b2e4      	uxtb	r4, r4
 8001daa:	d1ee      	bne.n	8001d8a <i2cWrite+0x6>
 8001dac:	f7ff ff92 	bl	8001cd4 <SetLowSCL>
 8001db0:	f7ff ff72 	bl	8001c98 <SetHighSDA>
 8001db4:	f7ff ff9a 	bl	8001cec <SetHighSCL>
 8001db8:	4b05      	ldr	r3, [pc, #20]	; (8001dd0 <i2cWrite+0x4c>)
 8001dba:	8a1c      	ldrh	r4, [r3, #16]
 8001dbc:	b2a4      	uxth	r4, r4
 8001dbe:	f7ff ff89 	bl	8001cd4 <SetLowSCL>
 8001dc2:	f7ff ff49 	bl	8001c58 <i2c_delay>
 8001dc6:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 8001dca:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 8001dce:	bd38      	pop	{r3, r4, r5, pc}
 8001dd0:	48000400 	.word	0x48000400

08001dd4 <i2cRead>:
 8001dd4:	b570      	push	{r4, r5, r6, lr}
 8001dd6:	4606      	mov	r6, r0
 8001dd8:	f7ff ff7c 	bl	8001cd4 <SetLowSCL>
 8001ddc:	f7ff ff5c 	bl	8001c98 <SetHighSDA>
 8001de0:	2508      	movs	r5, #8
 8001de2:	2400      	movs	r4, #0
 8001de4:	f7ff ff82 	bl	8001cec <SetHighSCL>
 8001de8:	4b0d      	ldr	r3, [pc, #52]	; (8001e20 <i2cRead+0x4c>)
 8001dea:	8a1b      	ldrh	r3, [r3, #16]
 8001dec:	0064      	lsls	r4, r4, #1
 8001dee:	061a      	lsls	r2, r3, #24
 8001df0:	b2e4      	uxtb	r4, r4
 8001df2:	bf48      	it	mi
 8001df4:	3401      	addmi	r4, #1
 8001df6:	f105 35ff 	add.w	r5, r5, #4294967295
 8001dfa:	bf48      	it	mi
 8001dfc:	b2e4      	uxtbmi	r4, r4
 8001dfe:	f7ff ff69 	bl	8001cd4 <SetLowSCL>
 8001e02:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001e06:	d1ed      	bne.n	8001de4 <i2cRead+0x10>
 8001e08:	b10e      	cbz	r6, 8001e0e <i2cRead+0x3a>
 8001e0a:	f7ff ff27 	bl	8001c5c <SetLowSDA>
 8001e0e:	f7ff ff6d 	bl	8001cec <SetHighSCL>
 8001e12:	f7ff ff5f 	bl	8001cd4 <SetLowSCL>
 8001e16:	f7ff ff1f 	bl	8001c58 <i2c_delay>
 8001e1a:	4620      	mov	r0, r4
 8001e1c:	bd70      	pop	{r4, r5, r6, pc}
 8001e1e:	bf00      	nop
 8001e20:	48000400 	.word	0x48000400

08001e24 <i2c_write_reg>:
 8001e24:	b570      	push	{r4, r5, r6, lr}
 8001e26:	4605      	mov	r5, r0
 8001e28:	460c      	mov	r4, r1
 8001e2a:	4616      	mov	r6, r2
 8001e2c:	f7ff ff8c 	bl	8001d48 <i2cStart>
 8001e30:	4628      	mov	r0, r5
 8001e32:	f7ff ffa7 	bl	8001d84 <i2cWrite>
 8001e36:	4620      	mov	r0, r4
 8001e38:	f7ff ffa4 	bl	8001d84 <i2cWrite>
 8001e3c:	4630      	mov	r0, r6
 8001e3e:	f7ff ffa1 	bl	8001d84 <i2cWrite>
 8001e42:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001e46:	f7ff bf8e 	b.w	8001d66 <i2cStop>

08001e4a <i2c_read_reg>:
 8001e4a:	b538      	push	{r3, r4, r5, lr}
 8001e4c:	4604      	mov	r4, r0
 8001e4e:	460d      	mov	r5, r1
 8001e50:	f7ff ff7a 	bl	8001d48 <i2cStart>
 8001e54:	4620      	mov	r0, r4
 8001e56:	f7ff ff95 	bl	8001d84 <i2cWrite>
 8001e5a:	4628      	mov	r0, r5
 8001e5c:	f7ff ff92 	bl	8001d84 <i2cWrite>
 8001e60:	f7ff ff72 	bl	8001d48 <i2cStart>
 8001e64:	f044 0001 	orr.w	r0, r4, #1
 8001e68:	f7ff ff8c 	bl	8001d84 <i2cWrite>
 8001e6c:	2000      	movs	r0, #0
 8001e6e:	f7ff ffb1 	bl	8001dd4 <i2cRead>
 8001e72:	4604      	mov	r4, r0
 8001e74:	f7ff ff77 	bl	8001d66 <i2cStop>
 8001e78:	4620      	mov	r0, r4
 8001e7a:	bd38      	pop	{r3, r4, r5, pc}

08001e7c <SystemInit>:
 8001e7c:	4b3b      	ldr	r3, [pc, #236]	; (8001f6c <SystemInit+0xf0>)
 8001e7e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001e82:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001e86:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001e8a:	4b39      	ldr	r3, [pc, #228]	; (8001f70 <SystemInit+0xf4>)
 8001e8c:	681a      	ldr	r2, [r3, #0]
 8001e8e:	f042 0201 	orr.w	r2, r2, #1
 8001e92:	601a      	str	r2, [r3, #0]
 8001e94:	6859      	ldr	r1, [r3, #4]
 8001e96:	4a37      	ldr	r2, [pc, #220]	; (8001f74 <SystemInit+0xf8>)
 8001e98:	400a      	ands	r2, r1
 8001e9a:	605a      	str	r2, [r3, #4]
 8001e9c:	681a      	ldr	r2, [r3, #0]
 8001e9e:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 8001ea2:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8001ea6:	601a      	str	r2, [r3, #0]
 8001ea8:	681a      	ldr	r2, [r3, #0]
 8001eaa:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 8001eae:	601a      	str	r2, [r3, #0]
 8001eb0:	685a      	ldr	r2, [r3, #4]
 8001eb2:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8001eb6:	605a      	str	r2, [r3, #4]
 8001eb8:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001eba:	f022 020f 	bic.w	r2, r2, #15
 8001ebe:	62da      	str	r2, [r3, #44]	; 0x2c
 8001ec0:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8001ec2:	4a2d      	ldr	r2, [pc, #180]	; (8001f78 <SystemInit+0xfc>)
 8001ec4:	b082      	sub	sp, #8
 8001ec6:	400a      	ands	r2, r1
 8001ec8:	631a      	str	r2, [r3, #48]	; 0x30
 8001eca:	2200      	movs	r2, #0
 8001ecc:	609a      	str	r2, [r3, #8]
 8001ece:	9200      	str	r2, [sp, #0]
 8001ed0:	9201      	str	r2, [sp, #4]
 8001ed2:	681a      	ldr	r2, [r3, #0]
 8001ed4:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001ed8:	601a      	str	r2, [r3, #0]
 8001eda:	4b25      	ldr	r3, [pc, #148]	; (8001f70 <SystemInit+0xf4>)
 8001edc:	681a      	ldr	r2, [r3, #0]
 8001ede:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8001ee2:	9201      	str	r2, [sp, #4]
 8001ee4:	9a00      	ldr	r2, [sp, #0]
 8001ee6:	3201      	adds	r2, #1
 8001ee8:	9200      	str	r2, [sp, #0]
 8001eea:	9a01      	ldr	r2, [sp, #4]
 8001eec:	b91a      	cbnz	r2, 8001ef6 <SystemInit+0x7a>
 8001eee:	9a00      	ldr	r2, [sp, #0]
 8001ef0:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8001ef4:	d1f1      	bne.n	8001eda <SystemInit+0x5e>
 8001ef6:	681b      	ldr	r3, [r3, #0]
 8001ef8:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8001efc:	bf18      	it	ne
 8001efe:	2301      	movne	r3, #1
 8001f00:	9301      	str	r3, [sp, #4]
 8001f02:	9b01      	ldr	r3, [sp, #4]
 8001f04:	2b01      	cmp	r3, #1
 8001f06:	d005      	beq.n	8001f14 <SystemInit+0x98>
 8001f08:	4b18      	ldr	r3, [pc, #96]	; (8001f6c <SystemInit+0xf0>)
 8001f0a:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8001f0e:	609a      	str	r2, [r3, #8]
 8001f10:	b002      	add	sp, #8
 8001f12:	4770      	bx	lr
 8001f14:	4b19      	ldr	r3, [pc, #100]	; (8001f7c <SystemInit+0x100>)
 8001f16:	2212      	movs	r2, #18
 8001f18:	601a      	str	r2, [r3, #0]
 8001f1a:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 8001f1e:	685a      	ldr	r2, [r3, #4]
 8001f20:	605a      	str	r2, [r3, #4]
 8001f22:	685a      	ldr	r2, [r3, #4]
 8001f24:	605a      	str	r2, [r3, #4]
 8001f26:	685a      	ldr	r2, [r3, #4]
 8001f28:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8001f2c:	605a      	str	r2, [r3, #4]
 8001f2e:	685a      	ldr	r2, [r3, #4]
 8001f30:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8001f34:	605a      	str	r2, [r3, #4]
 8001f36:	685a      	ldr	r2, [r3, #4]
 8001f38:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8001f3c:	605a      	str	r2, [r3, #4]
 8001f3e:	681a      	ldr	r2, [r3, #0]
 8001f40:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8001f44:	601a      	str	r2, [r3, #0]
 8001f46:	6819      	ldr	r1, [r3, #0]
 8001f48:	4a09      	ldr	r2, [pc, #36]	; (8001f70 <SystemInit+0xf4>)
 8001f4a:	0189      	lsls	r1, r1, #6
 8001f4c:	d5fb      	bpl.n	8001f46 <SystemInit+0xca>
 8001f4e:	6853      	ldr	r3, [r2, #4]
 8001f50:	f023 0303 	bic.w	r3, r3, #3
 8001f54:	6053      	str	r3, [r2, #4]
 8001f56:	6853      	ldr	r3, [r2, #4]
 8001f58:	f043 0302 	orr.w	r3, r3, #2
 8001f5c:	6053      	str	r3, [r2, #4]
 8001f5e:	4b04      	ldr	r3, [pc, #16]	; (8001f70 <SystemInit+0xf4>)
 8001f60:	685b      	ldr	r3, [r3, #4]
 8001f62:	f003 030c 	and.w	r3, r3, #12
 8001f66:	2b08      	cmp	r3, #8
 8001f68:	d1f9      	bne.n	8001f5e <SystemInit+0xe2>
 8001f6a:	e7cd      	b.n	8001f08 <SystemInit+0x8c>
 8001f6c:	e000ed00 	.word	0xe000ed00
 8001f70:	40021000 	.word	0x40021000
 8001f74:	f87fc00c 	.word	0xf87fc00c
 8001f78:	ff00fccc 	.word	0xff00fccc
 8001f7c:	40022000 	.word	0x40022000

08001f80 <sys_tick_init>:
 8001f80:	4b05      	ldr	r3, [pc, #20]	; (8001f98 <sys_tick_init+0x18>)
 8001f82:	4a06      	ldr	r2, [pc, #24]	; (8001f9c <sys_tick_init+0x1c>)
 8001f84:	605a      	str	r2, [r3, #4]
 8001f86:	4a06      	ldr	r2, [pc, #24]	; (8001fa0 <sys_tick_init+0x20>)
 8001f88:	21f0      	movs	r1, #240	; 0xf0
 8001f8a:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8001f8e:	2200      	movs	r2, #0
 8001f90:	609a      	str	r2, [r3, #8]
 8001f92:	2207      	movs	r2, #7
 8001f94:	601a      	str	r2, [r3, #0]
 8001f96:	4770      	bx	lr
 8001f98:	e000e010 	.word	0xe000e010
 8001f9c:	00029040 	.word	0x00029040
 8001fa0:	e000ed00 	.word	0xe000ed00

08001fa4 <sleep>:
 8001fa4:	bf30      	wfi
 8001fa6:	4770      	bx	lr

08001fa8 <sytem_clock_init>:
 8001fa8:	f7ff bf68 	b.w	8001e7c <SystemInit>

08001fac <NVIC_Init>:
 8001fac:	b510      	push	{r4, lr}
 8001fae:	bf00      	nop
 8001fb0:	bf00      	nop
 8001fb2:	bf00      	nop
 8001fb4:	78c2      	ldrb	r2, [r0, #3]
 8001fb6:	7803      	ldrb	r3, [r0, #0]
 8001fb8:	b30a      	cbz	r2, 8001ffe <NVIC_Init+0x52>
 8001fba:	4a16      	ldr	r2, [pc, #88]	; (8002014 <NVIC_Init+0x68>)
 8001fbc:	7844      	ldrb	r4, [r0, #1]
 8001fbe:	68d2      	ldr	r2, [r2, #12]
 8001fc0:	43d2      	mvns	r2, r2
 8001fc2:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001fc6:	f1c2 0104 	rsb	r1, r2, #4
 8001fca:	b2c9      	uxtb	r1, r1
 8001fcc:	fa04 f101 	lsl.w	r1, r4, r1
 8001fd0:	240f      	movs	r4, #15
 8001fd2:	fa44 f202 	asr.w	r2, r4, r2
 8001fd6:	7884      	ldrb	r4, [r0, #2]
 8001fd8:	b2c9      	uxtb	r1, r1
 8001fda:	4022      	ands	r2, r4
 8001fdc:	430a      	orrs	r2, r1
 8001fde:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8001fe2:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001fe6:	0112      	lsls	r2, r2, #4
 8001fe8:	b2d2      	uxtb	r2, r2
 8001fea:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8001fee:	7803      	ldrb	r3, [r0, #0]
 8001ff0:	2201      	movs	r2, #1
 8001ff2:	0959      	lsrs	r1, r3, #5
 8001ff4:	f003 031f 	and.w	r3, r3, #31
 8001ff8:	fa02 f303 	lsl.w	r3, r2, r3
 8001ffc:	e006      	b.n	800200c <NVIC_Init+0x60>
 8001ffe:	0959      	lsrs	r1, r3, #5
 8002000:	2201      	movs	r2, #1
 8002002:	f003 031f 	and.w	r3, r3, #31
 8002006:	fa02 f303 	lsl.w	r3, r2, r3
 800200a:	3120      	adds	r1, #32
 800200c:	4a02      	ldr	r2, [pc, #8]	; (8002018 <NVIC_Init+0x6c>)
 800200e:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8002012:	bd10      	pop	{r4, pc}
 8002014:	e000ed00 	.word	0xe000ed00
 8002018:	e000e100 	.word	0xe000e100

0800201c <lib_low_level_init>:
 800201c:	b508      	push	{r3, lr}
 800201e:	f7ff ffc3 	bl	8001fa8 <sytem_clock_init>
 8002022:	f000 f899 	bl	8002158 <gpio_init>
 8002026:	f7ff fd85 	bl	8001b34 <uart_init>
 800202a:	f7ff fbe1 	bl	80017f0 <timer_init>
 800202e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8002032:	f7ff be67 	b.w	8001d04 <i2c_0_init>

08002036 <GPIO_Init>:
 8002036:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002038:	bf00      	nop
 800203a:	bf00      	nop
 800203c:	bf00      	nop
 800203e:	bf00      	nop
 8002040:	2300      	movs	r3, #0
 8002042:	680e      	ldr	r6, [r1, #0]
 8002044:	461a      	mov	r2, r3
 8002046:	2501      	movs	r5, #1
 8002048:	4095      	lsls	r5, r2
 800204a:	ea05 0406 	and.w	r4, r5, r6
 800204e:	42ac      	cmp	r4, r5
 8002050:	d131      	bne.n	80020b6 <GPIO_Init+0x80>
 8002052:	790d      	ldrb	r5, [r1, #4]
 8002054:	1e6f      	subs	r7, r5, #1
 8002056:	b2ff      	uxtb	r7, r7
 8002058:	2f01      	cmp	r7, #1
 800205a:	d81c      	bhi.n	8002096 <GPIO_Init+0x60>
 800205c:	bf00      	nop
 800205e:	f04f 0c03 	mov.w	ip, #3
 8002062:	6887      	ldr	r7, [r0, #8]
 8002064:	fa0c fc03 	lsl.w	ip, ip, r3
 8002068:	ea27 070c 	bic.w	r7, r7, ip
 800206c:	6087      	str	r7, [r0, #8]
 800206e:	f891 c005 	ldrb.w	ip, [r1, #5]
 8002072:	6887      	ldr	r7, [r0, #8]
 8002074:	fa0c fc03 	lsl.w	ip, ip, r3
 8002078:	ea4c 0707 	orr.w	r7, ip, r7
 800207c:	6087      	str	r7, [r0, #8]
 800207e:	bf00      	nop
 8002080:	8887      	ldrh	r7, [r0, #4]
 8002082:	b2bf      	uxth	r7, r7
 8002084:	ea27 0404 	bic.w	r4, r7, r4
 8002088:	8084      	strh	r4, [r0, #4]
 800208a:	798c      	ldrb	r4, [r1, #6]
 800208c:	8887      	ldrh	r7, [r0, #4]
 800208e:	4094      	lsls	r4, r2
 8002090:	433c      	orrs	r4, r7
 8002092:	b2a4      	uxth	r4, r4
 8002094:	8084      	strh	r4, [r0, #4]
 8002096:	2403      	movs	r4, #3
 8002098:	6807      	ldr	r7, [r0, #0]
 800209a:	409c      	lsls	r4, r3
 800209c:	43e4      	mvns	r4, r4
 800209e:	4027      	ands	r7, r4
 80020a0:	6007      	str	r7, [r0, #0]
 80020a2:	6807      	ldr	r7, [r0, #0]
 80020a4:	409d      	lsls	r5, r3
 80020a6:	433d      	orrs	r5, r7
 80020a8:	6005      	str	r5, [r0, #0]
 80020aa:	68c5      	ldr	r5, [r0, #12]
 80020ac:	402c      	ands	r4, r5
 80020ae:	79cd      	ldrb	r5, [r1, #7]
 80020b0:	409d      	lsls	r5, r3
 80020b2:	432c      	orrs	r4, r5
 80020b4:	60c4      	str	r4, [r0, #12]
 80020b6:	3201      	adds	r2, #1
 80020b8:	2a10      	cmp	r2, #16
 80020ba:	f103 0302 	add.w	r3, r3, #2
 80020be:	d1c2      	bne.n	8002046 <GPIO_Init+0x10>
 80020c0:	bdf0      	pop	{r4, r5, r6, r7, pc}

080020c2 <GPIO_SetBits>:
 80020c2:	bf00      	nop
 80020c4:	bf00      	nop
 80020c6:	6181      	str	r1, [r0, #24]
 80020c8:	4770      	bx	lr

080020ca <GPIO_ResetBits>:
 80020ca:	bf00      	nop
 80020cc:	bf00      	nop
 80020ce:	8501      	strh	r1, [r0, #40]	; 0x28
 80020d0:	4770      	bx	lr

080020d2 <GPIO_PinAFConfig>:
 80020d2:	b510      	push	{r4, lr}
 80020d4:	bf00      	nop
 80020d6:	bf00      	nop
 80020d8:	bf00      	nop
 80020da:	f001 0307 	and.w	r3, r1, #7
 80020de:	08c9      	lsrs	r1, r1, #3
 80020e0:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 80020e4:	009b      	lsls	r3, r3, #2
 80020e6:	6a04      	ldr	r4, [r0, #32]
 80020e8:	210f      	movs	r1, #15
 80020ea:	4099      	lsls	r1, r3
 80020ec:	ea24 0101 	bic.w	r1, r4, r1
 80020f0:	6201      	str	r1, [r0, #32]
 80020f2:	6a01      	ldr	r1, [r0, #32]
 80020f4:	fa02 f303 	lsl.w	r3, r2, r3
 80020f8:	430b      	orrs	r3, r1
 80020fa:	6203      	str	r3, [r0, #32]
 80020fc:	bd10      	pop	{r4, pc}
	...

08002100 <led_on>:
 8002100:	0401      	lsls	r1, r0, #16
 8002102:	d503      	bpl.n	800210c <led_on+0xc>
 8002104:	4b08      	ldr	r3, [pc, #32]	; (8002128 <led_on+0x28>)
 8002106:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800210a:	619a      	str	r2, [r3, #24]
 800210c:	0702      	lsls	r2, r0, #28
 800210e:	d503      	bpl.n	8002118 <led_on+0x18>
 8002110:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002114:	2208      	movs	r2, #8
 8002116:	851a      	strh	r2, [r3, #40]	; 0x28
 8002118:	07c3      	lsls	r3, r0, #31
 800211a:	d503      	bpl.n	8002124 <led_on+0x24>
 800211c:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002120:	2201      	movs	r2, #1
 8002122:	619a      	str	r2, [r3, #24]
 8002124:	4770      	bx	lr
 8002126:	bf00      	nop
 8002128:	48000400 	.word	0x48000400

0800212c <led_off>:
 800212c:	0402      	lsls	r2, r0, #16
 800212e:	d503      	bpl.n	8002138 <led_off+0xc>
 8002130:	4b08      	ldr	r3, [pc, #32]	; (8002154 <led_off+0x28>)
 8002132:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8002136:	851a      	strh	r2, [r3, #40]	; 0x28
 8002138:	0703      	lsls	r3, r0, #28
 800213a:	d503      	bpl.n	8002144 <led_off+0x18>
 800213c:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002140:	2208      	movs	r2, #8
 8002142:	619a      	str	r2, [r3, #24]
 8002144:	07c0      	lsls	r0, r0, #31
 8002146:	d503      	bpl.n	8002150 <led_off+0x24>
 8002148:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800214c:	2201      	movs	r2, #1
 800214e:	851a      	strh	r2, [r3, #40]	; 0x28
 8002150:	4770      	bx	lr
 8002152:	bf00      	nop
 8002154:	48000400 	.word	0x48000400

08002158 <gpio_init>:
 8002158:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 800215c:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8002160:	2101      	movs	r1, #1
 8002162:	f7ff fab7 	bl	80016d4 <RCC_AHBPeriphClockCmd>
 8002166:	f8df 90a8 	ldr.w	r9, [pc, #168]	; 8002210 <gpio_init+0xb8>
 800216a:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 800216e:	2101      	movs	r1, #1
 8002170:	f7ff fab0 	bl	80016d4 <RCC_AHBPeriphClockCmd>
 8002174:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 8002178:	2101      	movs	r1, #1
 800217a:	f7ff faab 	bl	80016d4 <RCC_AHBPeriphClockCmd>
 800217e:	2400      	movs	r4, #0
 8002180:	2501      	movs	r5, #1
 8002182:	2603      	movs	r6, #3
 8002184:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 8002188:	4648      	mov	r0, r9
 800218a:	4669      	mov	r1, sp
 800218c:	2708      	movs	r7, #8
 800218e:	f8cd 8000 	str.w	r8, [sp]
 8002192:	f88d 5004 	strb.w	r5, [sp, #4]
 8002196:	f88d 4006 	strb.w	r4, [sp, #6]
 800219a:	f88d 6005 	strb.w	r6, [sp, #5]
 800219e:	f88d 4007 	strb.w	r4, [sp, #7]
 80021a2:	f7ff ff48 	bl	8002036 <GPIO_Init>
 80021a6:	4669      	mov	r1, sp
 80021a8:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80021ac:	9700      	str	r7, [sp, #0]
 80021ae:	f88d 5004 	strb.w	r5, [sp, #4]
 80021b2:	f88d 4006 	strb.w	r4, [sp, #6]
 80021b6:	f88d 6005 	strb.w	r6, [sp, #5]
 80021ba:	f88d 4007 	strb.w	r4, [sp, #7]
 80021be:	f7ff ff3a 	bl	8002036 <GPIO_Init>
 80021c2:	4669      	mov	r1, sp
 80021c4:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80021c8:	9500      	str	r5, [sp, #0]
 80021ca:	f88d 5004 	strb.w	r5, [sp, #4]
 80021ce:	f88d 4006 	strb.w	r4, [sp, #6]
 80021d2:	f88d 6005 	strb.w	r6, [sp, #5]
 80021d6:	f88d 4007 	strb.w	r4, [sp, #7]
 80021da:	f7ff ff2c 	bl	8002036 <GPIO_Init>
 80021de:	f44f 7300 	mov.w	r3, #512	; 0x200
 80021e2:	4669      	mov	r1, sp
 80021e4:	4648      	mov	r0, r9
 80021e6:	9300      	str	r3, [sp, #0]
 80021e8:	f88d 4004 	strb.w	r4, [sp, #4]
 80021ec:	f88d 6005 	strb.w	r6, [sp, #5]
 80021f0:	f88d 4007 	strb.w	r4, [sp, #7]
 80021f4:	f7ff ff1f 	bl	8002036 <GPIO_Init>
 80021f8:	4640      	mov	r0, r8
 80021fa:	f7ff ff81 	bl	8002100 <led_on>
 80021fe:	4638      	mov	r0, r7
 8002200:	f7ff ff94 	bl	800212c <led_off>
 8002204:	4628      	mov	r0, r5
 8002206:	f7ff ff91 	bl	800212c <led_off>
 800220a:	b003      	add	sp, #12
 800220c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8002210:	48000400 	.word	0x48000400

08002214 <get_key>:
 8002214:	4b02      	ldr	r3, [pc, #8]	; (8002220 <get_key+0xc>)
 8002216:	8a18      	ldrh	r0, [r3, #16]
 8002218:	43c0      	mvns	r0, r0
 800221a:	f400 7000 	and.w	r0, r0, #512	; 0x200
 800221e:	4770      	bx	lr
 8002220:	48000400 	.word	0x48000400

08002224 <Default_Handler>:
 8002224:	4668      	mov	r0, sp
 8002226:	f020 0107 	bic.w	r1, r0, #7
 800222a:	468d      	mov	sp, r1
 800222c:	bf00      	nop
 800222e:	e7fd      	b.n	800222c <Default_Handler+0x8>

08002230 <HardFault_Handler>:
 8002230:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8002234:	f7ff ff64 	bl	8002100 <led_on>
 8002238:	4b06      	ldr	r3, [pc, #24]	; (8002254 <HardFault_Handler+0x24>)
 800223a:	3b01      	subs	r3, #1
 800223c:	d001      	beq.n	8002242 <HardFault_Handler+0x12>
 800223e:	bf00      	nop
 8002240:	e7fb      	b.n	800223a <HardFault_Handler+0xa>
 8002242:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8002246:	f7ff ff71 	bl	800212c <led_off>
 800224a:	4b02      	ldr	r3, [pc, #8]	; (8002254 <HardFault_Handler+0x24>)
 800224c:	3b01      	subs	r3, #1
 800224e:	d0ef      	beq.n	8002230 <HardFault_Handler>
 8002250:	bf00      	nop
 8002252:	e7fb      	b.n	800224c <HardFault_Handler+0x1c>
 8002254:	00989681 	.word	0x00989681

08002258 <_reset_init>:
 8002258:	4a0e      	ldr	r2, [pc, #56]	; (8002294 <_reset_init+0x3c>)
 800225a:	480f      	ldr	r0, [pc, #60]	; (8002298 <_reset_init+0x40>)
 800225c:	1a80      	subs	r0, r0, r2
 800225e:	1080      	asrs	r0, r0, #2
 8002260:	2300      	movs	r3, #0
 8002262:	4283      	cmp	r3, r0
 8002264:	d006      	beq.n	8002274 <_reset_init+0x1c>
 8002266:	490d      	ldr	r1, [pc, #52]	; (800229c <_reset_init+0x44>)
 8002268:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 800226c:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8002270:	3301      	adds	r3, #1
 8002272:	e7f6      	b.n	8002262 <_reset_init+0xa>
 8002274:	4b0a      	ldr	r3, [pc, #40]	; (80022a0 <_reset_init+0x48>)
 8002276:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800227a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800227e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8002282:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8002286:	685a      	ldr	r2, [r3, #4]
 8002288:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 800228c:	605a      	str	r2, [r3, #4]
 800228e:	f7ff b881 	b.w	8001394 <main>
 8002292:	bf00      	nop
 8002294:	20000000 	.word	0x20000000
 8002298:	20000030 	.word	0x20000030
 800229c:	080023fc 	.word	0x080023fc
 80022a0:	e000ed00 	.word	0xe000ed00

080022a4 <_init>:
 80022a4:	e1a0c00d 	mov	ip, sp
 80022a8:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80022ac:	e24cb004 	sub	fp, ip, #4
 80022b0:	e24bd028 	sub	sp, fp, #40	; 0x28
 80022b4:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80022b8:	e12fff1e 	bx	lr

080022bc <_fini>:
 80022bc:	e1a0c00d 	mov	ip, sp
 80022c0:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80022c4:	e24cb004 	sub	fp, ip, #4
 80022c8:	e24bd028 	sub	sp, fp, #40	; 0x28
 80022cc:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80022d0:	e12fff1e 	bx	lr
 80022d4:	69647473 	.word	0x69647473
 80022d8:	6e69206f 	.word	0x6e69206f
 80022dc:	64207469 	.word	0x64207469
 80022e0:	0a656e6f 	.word	0x0a656e6f
 80022e4:	00          	.byte	0x00
 80022e5:	41          	.byte	0x41
 80022e6:	2b54      	.short	0x2b54
 80022e8:	4d504943 	.word	0x4d504943
 80022ec:	313d5855 	.word	0x313d5855
 80022f0:	41000a0d 	.word	0x41000a0d
 80022f4:	49432b54 	.word	0x49432b54
 80022f8:	58554d50 	.word	0x58554d50
 80022fc:	0a0d303d 	.word	0x0a0d303d
 8002300:	2b544100 	.word	0x2b544100
 8002304:	4f4d5743 	.word	0x4f4d5743
 8002308:	313d4544 	.word	0x313d4544
 800230c:	41000a0d 	.word	0x41000a0d
 8002310:	57432b54 	.word	0x57432b54
 8002314:	3d50414a 	.word	0x3d50414a
 8002318:	69640022 	.word	0x69640022
 800231c:	6e6f6373 	.word	0x6e6f6373
 8002320:	7463656e 	.word	0x7463656e
 8002324:	76006465 	.word	0x76006465
 8002328:	68797265 	.word	0x68797265
 800232c:	00647261 	.word	0x00647261
 8002330:	000a0d22 	.word	0x000a0d22
 8002334:	432b5441 	.word	0x432b5441
 8002338:	45535049 	.word	0x45535049
 800233c:	52455652 	.word	0x52455652
 8002340:	382c313d 	.word	0x382c313d
 8002344:	000a0d30 	.word	0x000a0d30
 8002348:	432b5441 	.word	0x432b5441
 800234c:	54535049 	.word	0x54535049
 8002350:	3d545241 	.word	0x3d545241
 8002354:	50435422 	.word	0x50435422
 8002358:	00222c22 	.word	0x00222c22
 800235c:	41002c22 	.word	0x41002c22
 8002360:	49432b54 	.word	0x49432b54
 8002364:	4e455350 	.word	0x4e455350
 8002368:	3e003d44 	.word	0x3e003d44
 800236c:	2b544100 	.word	0x2b544100
 8002370:	43504943 	.word	0x43504943
 8002374:	45534f4c 	.word	0x45534f4c
 8002378:	53000a0d 	.word	0x53000a0d
 800237c:	20444e45 	.word	0x20444e45
 8002380:	2b004b4f 	.word	0x2b004b4f
 8002384:	2c445049 	.word	0x2c445049
	...

08002389 <CSWTCH.5>:
 8002389:	0201fffe 2e323931 2e383631 00322e32     ....192.168.2.2.
 8002399:	38707365 20363632 7373656d 00656761     esp8266 message.
 80023a9:	6f727265 6f632072 25206564 75253a75     error code %u:%u
 80023b9:	770a000a 6f636c65 7420656d 7553206f     ...welcome to Su
 80023c9:	6168757a 5e20534f 32205e5f 362e302e     zuhaOS ^_^ 2.0.6
 80023d9:	4955420a 4d20444c 31207261 30322032     .BUILD Mar 12 20
 80023e9:	32203631 39303a31 0a38353a 00000000              16 21:09:58....

080023f8 <__EH_FRAME_BEGIN__>:
 80023f8:	00000000                                ....
