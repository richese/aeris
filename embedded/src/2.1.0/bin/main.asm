
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
 80001aa:	f002 f889 	bl	80022c0 <sleep>
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
 8000282:	f002 f80b 	bl	800229c <sys_tick_init>
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
 80003fe:	f001 fcf1 	bl	8001de4 <uart_write>
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
 80005d4:	080025f0 	.word	0x080025f0

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
 8000652:	f001 fbc7 	bl	8001de4 <uart_write>
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
 8000690:	f001 fab0 	bl	8001bf4 <timer_get_time>
 8000694:	4405      	add	r5, r0
 8000696:	f001 fc5d 	bl	8001f54 <uart_clear_buffer>
 800069a:	2400      	movs	r4, #0
 800069c:	f001 fbac 	bl	8001df8 <uart_is_char>
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
 80006b8:	f001 fc4c 	bl	8001f54 <uart_clear_buffer>
 80006bc:	2001      	movs	r0, #1
 80006be:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80006c0:	2400      	movs	r4, #0
 80006c2:	f001 fa97 	bl	8001bf4 <timer_get_time>
 80006c6:	42a8      	cmp	r0, r5
 80006c8:	d3e8      	bcc.n	800069c <esp8266_find_stream+0x14>
 80006ca:	f001 fc43 	bl	8001f54 <uart_clear_buffer>
 80006ce:	2000      	movs	r0, #0
 80006d0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

080006d4 <esp8266_init>:
 80006d4:	b510      	push	{r4, lr}
 80006d6:	4604      	mov	r4, r0
 80006d8:	f640 30b8 	movw	r0, #3000	; 0xbb8
 80006dc:	f001 fa98 	bl	8001c10 <timer_delay_ms>
 80006e0:	b10c      	cbz	r4, 80006e6 <esp8266_init+0x12>
 80006e2:	4818      	ldr	r0, [pc, #96]	; (8000744 <esp8266_init+0x70>)
 80006e4:	e000      	b.n	80006e8 <esp8266_init+0x14>
 80006e6:	4818      	ldr	r0, [pc, #96]	; (8000748 <esp8266_init+0x74>)
 80006e8:	f7ff ffae 	bl	8000648 <esp8266_send>
 80006ec:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006f0:	f001 fa8e 	bl	8001c10 <timer_delay_ms>
 80006f4:	4815      	ldr	r0, [pc, #84]	; (800074c <esp8266_init+0x78>)
 80006f6:	f7ff ffa7 	bl	8000648 <esp8266_send>
 80006fa:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006fe:	f001 fa87 	bl	8001c10 <timer_delay_ms>
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
 8000738:	f001 fa6a 	bl	8001c10 <timer_delay_ms>
 800073c:	2000      	movs	r0, #0
 800073e:	bd10      	pop	{r4, pc}
 8000740:	2002      	movs	r0, #2
 8000742:	bd10      	pop	{r4, pc}
 8000744:	08002601 	.word	0x08002601
 8000748:	0800260f 	.word	0x0800260f
 800074c:	0800261d 	.word	0x0800261d
 8000750:	0800262b 	.word	0x0800262b
 8000754:	08002636 	.word	0x08002636
 8000758:	08002674 	.word	0x08002674
 800075c:	08002643 	.word	0x08002643
 8000760:	0800264c 	.word	0x0800264c
 8000764:	0800269c 	.word	0x0800269c
 8000768:	08002650 	.word	0x08002650

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
 8000786:	f001 fa35 	bl	8001bf4 <timer_get_time>
 800078a:	4405      	add	r5, r0
 800078c:	f001 fb34 	bl	8001df8 <uart_is_char>
 8000790:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000794:	4298      	cmp	r0, r3
 8000796:	bf1c      	itt	ne
 8000798:	5530      	strbne	r0, [r6, r4]
 800079a:	3401      	addne	r4, #1
 800079c:	f001 fa2a 	bl	8001bf4 <timer_get_time>
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
 8000828:	f001 f9f2 	bl	8001c10 <timer_delay_ms>
 800082c:	2004      	movs	r0, #4
 800082e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000830:	42ac      	cmp	r4, r5
 8000832:	d004      	beq.n	800083e <esp8266_connect+0x7a>
 8000834:	f814 0b01 	ldrb.w	r0, [r4], #1
 8000838:	f001 fad4 	bl	8001de4 <uart_write>
 800083c:	e7f8      	b.n	8000830 <esp8266_connect+0x6c>
 800083e:	4823      	ldr	r0, [pc, #140]	; (80008cc <esp8266_connect+0x108>)
 8000840:	2107      	movs	r1, #7
 8000842:	2264      	movs	r2, #100	; 0x64
 8000844:	f7ff ff20 	bl	8000688 <esp8266_find_stream>
 8000848:	b938      	cbnz	r0, 800085a <esp8266_connect+0x96>
 800084a:	481f      	ldr	r0, [pc, #124]	; (80008c8 <esp8266_connect+0x104>)
 800084c:	f7ff fefc 	bl	8000648 <esp8266_send>
 8000850:	2064      	movs	r0, #100	; 0x64
 8000852:	f001 f9dd 	bl	8001c10 <timer_delay_ms>
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
 8000872:	f001 f9cd 	bl	8001c10 <timer_delay_ms>
 8000876:	2006      	movs	r0, #6
 8000878:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800087a:	f001 fad9 	bl	8001e30 <uart_read>
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
 80008a0:	f001 f9b6 	bl	8001c10 <timer_delay_ms>
 80008a4:	f504 707a 	add.w	r0, r4, #1000	; 0x3e8
 80008a8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008aa:	2003      	movs	r0, #3
 80008ac:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008ae:	bf00      	nop
 80008b0:	08002664 	.word	0x08002664
 80008b4:	08002678 	.word	0x08002678
 80008b8:	0800264d 	.word	0x0800264d
 80008bc:	0800269c 	.word	0x0800269c
 80008c0:	0800267b 	.word	0x0800267b
 80008c4:	08002687 	.word	0x08002687
 80008c8:	08002689 	.word	0x08002689
 80008cc:	08002697 	.word	0x08002697
 80008d0:	0800269f 	.word	0x0800269f

080008d4 <motors_uninit>:
 80008d4:	b508      	push	{r3, lr}
 80008d6:	20c0      	movs	r0, #192	; 0xc0
 80008d8:	2100      	movs	r1, #0
 80008da:	2218      	movs	r2, #24
 80008dc:	f001 fc30 	bl	8002140 <i2c_write_reg>
 80008e0:	20c2      	movs	r0, #194	; 0xc2
 80008e2:	2100      	movs	r1, #0
 80008e4:	2218      	movs	r2, #24
 80008e6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80008ea:	f001 bc29 	b.w	8002140 <i2c_write_reg>
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
 8000958:	f001 fbf2 	bl	8002140 <i2c_write_reg>
 800095c:	20c0      	movs	r0, #192	; 0xc0
 800095e:	2100      	movs	r1, #0
 8000960:	462a      	mov	r2, r5
 8000962:	f001 fbed 	bl	8002140 <i2c_write_reg>
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
 800099e:	f001 fbcf 	bl	8002140 <i2c_write_reg>
 80009a2:	4622      	mov	r2, r4
 80009a4:	20c2      	movs	r0, #194	; 0xc2
 80009a6:	2100      	movs	r1, #0
 80009a8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80009ac:	f001 bbc8 	b.w	8002140 <i2c_write_reg>
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

080009cc <lsm9ds0_uninit>:
 80009cc:	b508      	push	{r3, lr}
 80009ce:	20d4      	movs	r0, #212	; 0xd4
 80009d0:	2120      	movs	r1, #32
 80009d2:	2200      	movs	r2, #0
 80009d4:	f001 fbb4 	bl	8002140 <i2c_write_reg>
 80009d8:	203c      	movs	r0, #60	; 0x3c
 80009da:	2120      	movs	r1, #32
 80009dc:	2200      	movs	r2, #0
 80009de:	f001 fbaf 	bl	8002140 <i2c_write_reg>
 80009e2:	203c      	movs	r0, #60	; 0x3c
 80009e4:	2124      	movs	r1, #36	; 0x24
 80009e6:	2200      	movs	r2, #0
 80009e8:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80009ec:	f001 bba8 	b.w	8002140 <i2c_write_reg>

080009f0 <lsm9ds0_read>:
 80009f0:	b538      	push	{r3, r4, r5, lr}
 80009f2:	2128      	movs	r1, #40	; 0x28
 80009f4:	20d4      	movs	r0, #212	; 0xd4
 80009f6:	f001 fbb6 	bl	8002166 <i2c_read_reg>
 80009fa:	2129      	movs	r1, #41	; 0x29
 80009fc:	4604      	mov	r4, r0
 80009fe:	20d4      	movs	r0, #212	; 0xd4
 8000a00:	f001 fbb1 	bl	8002166 <i2c_read_reg>
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
 8000a20:	f001 fba1 	bl	8002166 <i2c_read_reg>
 8000a24:	212b      	movs	r1, #43	; 0x2b
 8000a26:	4605      	mov	r5, r0
 8000a28:	20d4      	movs	r0, #212	; 0xd4
 8000a2a:	f001 fb9c 	bl	8002166 <i2c_read_reg>
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
 8000a48:	f001 fb8d 	bl	8002166 <i2c_read_reg>
 8000a4c:	212d      	movs	r1, #45	; 0x2d
 8000a4e:	4605      	mov	r5, r0
 8000a50:	20d4      	movs	r0, #212	; 0xd4
 8000a52:	f001 fb88 	bl	8002166 <i2c_read_reg>
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
 8000a70:	f001 fb79 	bl	8002166 <i2c_read_reg>
 8000a74:	2109      	movs	r1, #9
 8000a76:	4605      	mov	r5, r0
 8000a78:	203c      	movs	r0, #60	; 0x3c
 8000a7a:	f001 fb74 	bl	8002166 <i2c_read_reg>
 8000a7e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000a82:	b285      	uxth	r5, r0
 8000a84:	210a      	movs	r1, #10
 8000a86:	203c      	movs	r0, #60	; 0x3c
 8000a88:	80e5      	strh	r5, [r4, #6]
 8000a8a:	f001 fb6c 	bl	8002166 <i2c_read_reg>
 8000a8e:	210b      	movs	r1, #11
 8000a90:	4605      	mov	r5, r0
 8000a92:	203c      	movs	r0, #60	; 0x3c
 8000a94:	f001 fb67 	bl	8002166 <i2c_read_reg>
 8000a98:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000a9c:	b285      	uxth	r5, r0
 8000a9e:	210c      	movs	r1, #12
 8000aa0:	203c      	movs	r0, #60	; 0x3c
 8000aa2:	8125      	strh	r5, [r4, #8]
 8000aa4:	f001 fb5f 	bl	8002166 <i2c_read_reg>
 8000aa8:	210d      	movs	r1, #13
 8000aaa:	4605      	mov	r5, r0
 8000aac:	203c      	movs	r0, #60	; 0x3c
 8000aae:	f001 fb5a 	bl	8002166 <i2c_read_reg>
 8000ab2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ab6:	b285      	uxth	r5, r0
 8000ab8:	2128      	movs	r1, #40	; 0x28
 8000aba:	203c      	movs	r0, #60	; 0x3c
 8000abc:	8165      	strh	r5, [r4, #10]
 8000abe:	f001 fb52 	bl	8002166 <i2c_read_reg>
 8000ac2:	2129      	movs	r1, #41	; 0x29
 8000ac4:	4605      	mov	r5, r0
 8000ac6:	203c      	movs	r0, #60	; 0x3c
 8000ac8:	f001 fb4d 	bl	8002166 <i2c_read_reg>
 8000acc:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ad0:	b285      	uxth	r5, r0
 8000ad2:	212a      	movs	r1, #42	; 0x2a
 8000ad4:	203c      	movs	r0, #60	; 0x3c
 8000ad6:	8025      	strh	r5, [r4, #0]
 8000ad8:	f001 fb45 	bl	8002166 <i2c_read_reg>
 8000adc:	212b      	movs	r1, #43	; 0x2b
 8000ade:	4605      	mov	r5, r0
 8000ae0:	203c      	movs	r0, #60	; 0x3c
 8000ae2:	f001 fb40 	bl	8002166 <i2c_read_reg>
 8000ae6:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000aea:	b285      	uxth	r5, r0
 8000aec:	212c      	movs	r1, #44	; 0x2c
 8000aee:	203c      	movs	r0, #60	; 0x3c
 8000af0:	8065      	strh	r5, [r4, #2]
 8000af2:	f001 fb38 	bl	8002166 <i2c_read_reg>
 8000af6:	212d      	movs	r1, #45	; 0x2d
 8000af8:	4605      	mov	r5, r0
 8000afa:	203c      	movs	r0, #60	; 0x3c
 8000afc:	f001 fb33 	bl	8002166 <i2c_read_reg>
 8000b00:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b04:	b285      	uxth	r5, r0
 8000b06:	2105      	movs	r1, #5
 8000b08:	203c      	movs	r0, #60	; 0x3c
 8000b0a:	80a5      	strh	r5, [r4, #4]
 8000b0c:	f001 fb2b 	bl	8002166 <i2c_read_reg>
 8000b10:	2106      	movs	r1, #6
 8000b12:	4605      	mov	r5, r0
 8000b14:	203c      	movs	r0, #60	; 0x3c
 8000b16:	f001 fb26 	bl	8002166 <i2c_read_reg>
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
 8000b56:	f001 f85b 	bl	8001c10 <timer_delay_ms>
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
 8000ba6:	f001 fade 	bl	8002166 <i2c_read_reg>
 8000baa:	28d4      	cmp	r0, #212	; 0xd4
 8000bac:	4605      	mov	r5, r0
 8000bae:	d137      	bne.n	8000c20 <lsm9ds0_init+0xa0>
 8000bb0:	203c      	movs	r0, #60	; 0x3c
 8000bb2:	210f      	movs	r1, #15
 8000bb4:	f001 fad7 	bl	8002166 <i2c_read_reg>
 8000bb8:	2849      	cmp	r0, #73	; 0x49
 8000bba:	d133      	bne.n	8000c24 <lsm9ds0_init+0xa4>
 8000bbc:	4628      	mov	r0, r5
 8000bbe:	2120      	movs	r1, #32
 8000bc0:	22ff      	movs	r2, #255	; 0xff
 8000bc2:	f001 fabd 	bl	8002140 <i2c_write_reg>
 8000bc6:	4628      	mov	r0, r5
 8000bc8:	2123      	movs	r1, #35	; 0x23
 8000bca:	2218      	movs	r2, #24
 8000bcc:	f001 fab8 	bl	8002140 <i2c_write_reg>
 8000bd0:	203c      	movs	r0, #60	; 0x3c
 8000bd2:	211f      	movs	r1, #31
 8000bd4:	4622      	mov	r2, r4
 8000bd6:	f001 fab3 	bl	8002140 <i2c_write_reg>
 8000bda:	203c      	movs	r0, #60	; 0x3c
 8000bdc:	2120      	movs	r1, #32
 8000bde:	2267      	movs	r2, #103	; 0x67
 8000be0:	f001 faae 	bl	8002140 <i2c_write_reg>
 8000be4:	203c      	movs	r0, #60	; 0x3c
 8000be6:	2121      	movs	r1, #33	; 0x21
 8000be8:	4622      	mov	r2, r4
 8000bea:	f001 faa9 	bl	8002140 <i2c_write_reg>
 8000bee:	203c      	movs	r0, #60	; 0x3c
 8000bf0:	2124      	movs	r1, #36	; 0x24
 8000bf2:	22f4      	movs	r2, #244	; 0xf4
 8000bf4:	f001 faa4 	bl	8002140 <i2c_write_reg>
 8000bf8:	203c      	movs	r0, #60	; 0x3c
 8000bfa:	2125      	movs	r1, #37	; 0x25
 8000bfc:	4622      	mov	r2, r4
 8000bfe:	f001 fa9f 	bl	8002140 <i2c_write_reg>
 8000c02:	203c      	movs	r0, #60	; 0x3c
 8000c04:	2126      	movs	r1, #38	; 0x26
 8000c06:	2280      	movs	r2, #128	; 0x80
 8000c08:	f001 fa9a 	bl	8002140 <i2c_write_reg>
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
 8000c30:	f001 fc0a 	bl	8002448 <led_off>
 8000c34:	2072      	movs	r0, #114	; 0x72
 8000c36:	2180      	movs	r1, #128	; 0x80
 8000c38:	2200      	movs	r2, #0
 8000c3a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000c3e:	f000 bb5e 	b.w	80012fe <rgb_i2c_write_reg>
	...

08000c44 <rgb_sensor_read>:
 8000c44:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000c46:	f000 fadb 	bl	8001200 <rgb_i2cStart>
 8000c4a:	2072      	movs	r0, #114	; 0x72
 8000c4c:	4d70      	ldr	r5, [pc, #448]	; (8000e10 <rgb_sensor_read+0x1cc>)
 8000c4e:	4c71      	ldr	r4, [pc, #452]	; (8000e14 <rgb_sensor_read+0x1d0>)
 8000c50:	f000 faf4 	bl	800123c <rgb_i2cWrite>
 8000c54:	20b4      	movs	r0, #180	; 0xb4
 8000c56:	f000 faf1 	bl	800123c <rgb_i2cWrite>
 8000c5a:	f000 fad1 	bl	8001200 <rgb_i2cStart>
 8000c5e:	2073      	movs	r0, #115	; 0x73
 8000c60:	f000 faec 	bl	800123c <rgb_i2cWrite>
 8000c64:	2001      	movs	r0, #1
 8000c66:	4629      	mov	r1, r5
 8000c68:	f000 fb08 	bl	800127c <rgb_i2cRead>
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
 8000c80:	f000 fafc 	bl	800127c <rgb_i2cRead>
 8000c84:	2300      	movs	r3, #0
 8000c86:	f103 020c 	add.w	r2, r3, #12
 8000c8a:	5ce8      	ldrb	r0, [r5, r3]
 8000c8c:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000c90:	4f60      	ldr	r7, [pc, #384]	; (8000e14 <rgb_sensor_read+0x1d0>)
 8000c92:	4e5f      	ldr	r6, [pc, #380]	; (8000e10 <rgb_sensor_read+0x1cc>)
 8000c94:	b289      	uxth	r1, r1
 8000c96:	3301      	adds	r3, #1
 8000c98:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000c9c:	2b04      	cmp	r3, #4
 8000c9e:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000ca2:	d1f0      	bne.n	8000c86 <rgb_sensor_read+0x42>
 8000ca4:	2001      	movs	r0, #1
 8000ca6:	4631      	mov	r1, r6
 8000ca8:	f000 fae8 	bl	800127c <rgb_i2cRead>
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
 8000cc0:	f000 fadc 	bl	800127c <rgb_i2cRead>
 8000cc4:	2300      	movs	r3, #0
 8000cc6:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
 8000cca:	5ce9      	ldrb	r1, [r5, r3]
 8000ccc:	4f51      	ldr	r7, [pc, #324]	; (8000e14 <rgb_sensor_read+0x1d0>)
 8000cce:	4e50      	ldr	r6, [pc, #320]	; (8000e10 <rgb_sensor_read+0x1cc>)
 8000cd0:	b292      	uxth	r2, r2
 8000cd2:	ea42 2201 	orr.w	r2, r2, r1, lsl #8
 8000cd6:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
 8000cda:	3301      	adds	r3, #1
 8000cdc:	2b04      	cmp	r3, #4
 8000cde:	d1f2      	bne.n	8000cc6 <rgb_sensor_read+0x82>
 8000ce0:	2001      	movs	r0, #1
 8000ce2:	4631      	mov	r1, r6
 8000ce4:	f000 faca 	bl	800127c <rgb_i2cRead>
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
 8000cfc:	f000 fabe 	bl	800127c <rgb_i2cRead>
 8000d00:	2300      	movs	r3, #0
 8000d02:	1d1a      	adds	r2, r3, #4
 8000d04:	5ce8      	ldrb	r0, [r5, r3]
 8000d06:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d0a:	4f42      	ldr	r7, [pc, #264]	; (8000e14 <rgb_sensor_read+0x1d0>)
 8000d0c:	4e40      	ldr	r6, [pc, #256]	; (8000e10 <rgb_sensor_read+0x1cc>)
 8000d0e:	b289      	uxth	r1, r1
 8000d10:	3301      	adds	r3, #1
 8000d12:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d16:	2b04      	cmp	r3, #4
 8000d18:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d1c:	d1f1      	bne.n	8000d02 <rgb_sensor_read+0xbe>
 8000d1e:	2001      	movs	r0, #1
 8000d20:	4631      	mov	r1, r6
 8000d22:	f000 faab 	bl	800127c <rgb_i2cRead>
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
 8000d3a:	f000 fa9f 	bl	800127c <rgb_i2cRead>
 8000d3e:	2300      	movs	r3, #0
 8000d40:	f103 0208 	add.w	r2, r3, #8
 8000d44:	5ce8      	ldrb	r0, [r5, r3]
 8000d46:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d4a:	4f32      	ldr	r7, [pc, #200]	; (8000e14 <rgb_sensor_read+0x1d0>)
 8000d4c:	4e30      	ldr	r6, [pc, #192]	; (8000e10 <rgb_sensor_read+0x1cc>)
 8000d4e:	b289      	uxth	r1, r1
 8000d50:	3301      	adds	r3, #1
 8000d52:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d56:	2b04      	cmp	r3, #4
 8000d58:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d5c:	d1f0      	bne.n	8000d40 <rgb_sensor_read+0xfc>
 8000d5e:	2001      	movs	r0, #1
 8000d60:	4631      	mov	r1, r6
 8000d62:	f000 fa8b 	bl	800127c <rgb_i2cRead>
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
 8000d7a:	f000 fa7f 	bl	800127c <rgb_i2cRead>
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
 8000d9a:	f000 fa40 	bl	800121e <rgb_i2cStop>
 8000d9e:	2300      	movs	r3, #0
 8000da0:	1d1d      	adds	r5, r3, #4
 8000da2:	f834 1013 	ldrh.w	r1, [r4, r3, lsl #1]
 8000da6:	f834 2015 	ldrh.w	r2, [r4, r5, lsl #1]
 8000daa:	f103 0008 	add.w	r0, r3, #8
 8000dae:	b212      	sxth	r2, r2
 8000db0:	fa02 f281 	sxtah	r2, r2, r1
 8000db4:	f834 1010 	ldrh.w	r1, [r4, r0, lsl #1]
 8000db8:	f834 7013 	ldrh.w	r7, [r4, r3, lsl #1]
 8000dbc:	fa02 f281 	sxtah	r2, r2, r1
 8000dc0:	b2bf      	uxth	r7, r7
 8000dc2:	2164      	movs	r1, #100	; 0x64
 8000dc4:	fb17 f701 	smulbb	r7, r7, r1
 8000dc8:	f103 0634 	add.w	r6, r3, #52	; 0x34
 8000dcc:	fb97 f7f2 	sdiv	r7, r7, r2
 8000dd0:	b2bf      	uxth	r7, r7
 8000dd2:	f824 7016 	strh.w	r7, [r4, r6, lsl #1]
 8000dd6:	f834 6015 	ldrh.w	r6, [r4, r5, lsl #1]
 8000dda:	b2b6      	uxth	r6, r6
 8000ddc:	fb16 f601 	smulbb	r6, r6, r1
 8000de0:	fb96 f6f2 	sdiv	r6, r6, r2
 8000de4:	f103 0538 	add.w	r5, r3, #56	; 0x38
 8000de8:	b2b6      	uxth	r6, r6
 8000dea:	f824 6015 	strh.w	r6, [r4, r5, lsl #1]
 8000dee:	f834 0010 	ldrh.w	r0, [r4, r0, lsl #1]
 8000df2:	b280      	uxth	r0, r0
 8000df4:	fb10 f101 	smulbb	r1, r0, r1
 8000df8:	fb91 f2f2 	sdiv	r2, r1, r2
 8000dfc:	f103 003c 	add.w	r0, r3, #60	; 0x3c
 8000e00:	3301      	adds	r3, #1
 8000e02:	b292      	uxth	r2, r2
 8000e04:	2b04      	cmp	r3, #4
 8000e06:	f824 2010 	strh.w	r2, [r4, r0, lsl #1]
 8000e0a:	d1c9      	bne.n	8000da0 <rgb_sensor_read+0x15c>
 8000e0c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000e0e:	bf00      	nop
 8000e10:	20000624 	.word	0x20000624
 8000e14:	20000188 	.word	0x20000188

08000e18 <rgb_sensor_init>:
 8000e18:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000e1a:	2300      	movs	r3, #0
 8000e1c:	4a2a      	ldr	r2, [pc, #168]	; (8000ec8 <rgb_sensor_init+0xb0>)
 8000e1e:	1d19      	adds	r1, r3, #4
 8000e20:	2400      	movs	r4, #0
 8000e22:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8000e26:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e2a:	f103 0108 	add.w	r1, r3, #8
 8000e2e:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e32:	f103 0110 	add.w	r1, r3, #16
 8000e36:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e3a:	f103 010c 	add.w	r1, r3, #12
 8000e3e:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e42:	f103 0134 	add.w	r1, r3, #52	; 0x34
 8000e46:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e4a:	f103 0138 	add.w	r1, r3, #56	; 0x38
 8000e4e:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e52:	f103 013c 	add.w	r1, r3, #60	; 0x3c
 8000e56:	3301      	adds	r3, #1
 8000e58:	2b04      	cmp	r3, #4
 8000e5a:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e5e:	d1dd      	bne.n	8000e1c <rgb_sensor_init+0x4>
 8000e60:	2008      	movs	r0, #8
 8000e62:	f001 fadb 	bl	800241c <led_on>
 8000e66:	f000 f99b 	bl	80011a0 <rgb_i2c_init>
 8000e6a:	2072      	movs	r0, #114	; 0x72
 8000e6c:	2181      	movs	r1, #129	; 0x81
 8000e6e:	22ff      	movs	r2, #255	; 0xff
 8000e70:	f000 fa45 	bl	80012fe <rgb_i2c_write_reg>
 8000e74:	2072      	movs	r0, #114	; 0x72
 8000e76:	2183      	movs	r1, #131	; 0x83
 8000e78:	22ff      	movs	r2, #255	; 0xff
 8000e7a:	f000 fa40 	bl	80012fe <rgb_i2c_write_reg>
 8000e7e:	2072      	movs	r0, #114	; 0x72
 8000e80:	218d      	movs	r1, #141	; 0x8d
 8000e82:	4622      	mov	r2, r4
 8000e84:	f000 fa3b 	bl	80012fe <rgb_i2c_write_reg>
 8000e88:	2072      	movs	r0, #114	; 0x72
 8000e8a:	2180      	movs	r1, #128	; 0x80
 8000e8c:	2203      	movs	r2, #3
 8000e8e:	f000 fa36 	bl	80012fe <rgb_i2c_write_reg>
 8000e92:	ad01      	add	r5, sp, #4
 8000e94:	2072      	movs	r0, #114	; 0x72
 8000e96:	218f      	movs	r1, #143	; 0x8f
 8000e98:	2223      	movs	r2, #35	; 0x23
 8000e9a:	f000 fa30 	bl	80012fe <rgb_i2c_write_reg>
 8000e9e:	f7ff fed1 	bl	8000c44 <rgb_sensor_read>
 8000ea2:	2072      	movs	r0, #114	; 0x72
 8000ea4:	2192      	movs	r1, #146	; 0x92
 8000ea6:	462a      	mov	r2, r5
 8000ea8:	f000 fa3c 	bl	8001324 <rgb_i2c_read_reg>
 8000eac:	4620      	mov	r0, r4
 8000eae:	4623      	mov	r3, r4
 8000eb0:	5cea      	ldrb	r2, [r5, r3]
 8000eb2:	2a69      	cmp	r2, #105	; 0x69
 8000eb4:	d002      	beq.n	8000ebc <rgb_sensor_init+0xa4>
 8000eb6:	2201      	movs	r2, #1
 8000eb8:	409a      	lsls	r2, r3
 8000eba:	4310      	orrs	r0, r2
 8000ebc:	3301      	adds	r3, #1
 8000ebe:	2b04      	cmp	r3, #4
 8000ec0:	d1f6      	bne.n	8000eb0 <rgb_sensor_init+0x98>
 8000ec2:	b003      	add	sp, #12
 8000ec4:	bd30      	pop	{r4, r5, pc}
 8000ec6:	bf00      	nop
 8000ec8:	20000188 	.word	0x20000188

08000ecc <rgb_get_line_position>:
 8000ecc:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
 8000ed0:	4b54      	ldr	r3, [pc, #336]	; (8001024 <rgb_get_line_position+0x158>)
 8000ed2:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
 8000ed4:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
 8000ed8:	2100      	movs	r1, #0
 8000eda:	466c      	mov	r4, sp
 8000edc:	460d      	mov	r5, r1
 8000ede:	460a      	mov	r2, r1
 8000ee0:	4b51      	ldr	r3, [pc, #324]	; (8001028 <rgb_get_line_position+0x15c>)
 8000ee2:	f102 060c 	add.w	r6, r2, #12
 8000ee6:	f102 000a 	add.w	r0, r2, #10
 8000eea:	f833 c016 	ldrh.w	ip, [r3, r6, lsl #1]
 8000eee:	f853 7020 	ldr.w	r7, [r3, r0, lsl #2]
 8000ef2:	fa0f fc8c 	sxth.w	ip, ip
 8000ef6:	ebc7 0c0c 	rsb	ip, r7, ip
 8000efa:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8000efe:	fb07 110c 	mla	r1, r7, ip, r1
 8000f02:	f833 7016 	ldrh.w	r7, [r3, r6, lsl #1]
 8000f06:	f853 6020 	ldr.w	r6, [r3, r0, lsl #2]
 8000f0a:	3201      	adds	r2, #1
 8000f0c:	b238      	sxth	r0, r7
 8000f0e:	1b80      	subs	r0, r0, r6
 8000f10:	2a04      	cmp	r2, #4
 8000f12:	4405      	add	r5, r0
 8000f14:	d1e4      	bne.n	8000ee0 <rgb_get_line_position+0x14>
 8000f16:	4845      	ldr	r0, [pc, #276]	; (800102c <rgb_get_line_position+0x160>)
 8000f18:	2200      	movs	r2, #0
 8000f1a:	2d14      	cmp	r5, #20
 8000f1c:	7402      	strb	r2, [r0, #16]
 8000f1e:	dd05      	ble.n	8000f2c <rgb_get_line_position+0x60>
 8000f20:	fb91 f1f5 	sdiv	r1, r1, r5
 8000f24:	2201      	movs	r2, #1
 8000f26:	3947      	subs	r1, #71	; 0x47
 8000f28:	7402      	strb	r2, [r0, #16]
 8000f2a:	6001      	str	r1, [r0, #0]
 8000f2c:	2100      	movs	r1, #0
 8000f2e:	460d      	mov	r5, r1
 8000f30:	460a      	mov	r2, r1
 8000f32:	f102 060e 	add.w	r6, r2, #14
 8000f36:	f833 c012 	ldrh.w	ip, [r3, r2, lsl #1]
 8000f3a:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000f3e:	fa0f fc8c 	sxth.w	ip, ip
 8000f42:	ebc7 0c0c 	rsb	ip, r7, ip
 8000f46:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8000f4a:	fb07 110c 	mla	r1, r7, ip, r1
 8000f4e:	f833 c012 	ldrh.w	ip, [r3, r2, lsl #1]
 8000f52:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000f56:	3201      	adds	r2, #1
 8000f58:	fa0f f68c 	sxth.w	r6, ip
 8000f5c:	1bf6      	subs	r6, r6, r7
 8000f5e:	2a04      	cmp	r2, #4
 8000f60:	4435      	add	r5, r6
 8000f62:	d1e6      	bne.n	8000f32 <rgb_get_line_position+0x66>
 8000f64:	2600      	movs	r6, #0
 8000f66:	2d28      	cmp	r5, #40	; 0x28
 8000f68:	4a30      	ldr	r2, [pc, #192]	; (800102c <rgb_get_line_position+0x160>)
 8000f6a:	7446      	strb	r6, [r0, #17]
 8000f6c:	dd05      	ble.n	8000f7a <rgb_get_line_position+0xae>
 8000f6e:	fb91 f1f5 	sdiv	r1, r1, r5
 8000f72:	2601      	movs	r6, #1
 8000f74:	3947      	subs	r1, #71	; 0x47
 8000f76:	7456      	strb	r6, [r2, #17]
 8000f78:	6051      	str	r1, [r2, #4]
 8000f7a:	2100      	movs	r1, #0
 8000f7c:	460d      	mov	r5, r1
 8000f7e:	460a      	mov	r2, r1
 8000f80:	f102 0c04 	add.w	ip, r2, #4
 8000f84:	f102 0612 	add.w	r6, r2, #18
 8000f88:	f833 801c 	ldrh.w	r8, [r3, ip, lsl #1]
 8000f8c:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000f90:	f833 c01c 	ldrh.w	ip, [r3, ip, lsl #1]
 8000f94:	fa0f f888 	sxth.w	r8, r8
 8000f98:	ebc7 0808 	rsb	r8, r7, r8
 8000f9c:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8000fa0:	fb07 1108 	mla	r1, r7, r8, r1
 8000fa4:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000fa8:	3201      	adds	r2, #1
 8000faa:	fa0f f68c 	sxth.w	r6, ip
 8000fae:	1bf6      	subs	r6, r6, r7
 8000fb0:	2a04      	cmp	r2, #4
 8000fb2:	4435      	add	r5, r6
 8000fb4:	d1e4      	bne.n	8000f80 <rgb_get_line_position+0xb4>
 8000fb6:	2600      	movs	r6, #0
 8000fb8:	2d0a      	cmp	r5, #10
 8000fba:	4a1c      	ldr	r2, [pc, #112]	; (800102c <rgb_get_line_position+0x160>)
 8000fbc:	7486      	strb	r6, [r0, #18]
 8000fbe:	dd05      	ble.n	8000fcc <rgb_get_line_position+0x100>
 8000fc0:	fb91 f1f5 	sdiv	r1, r1, r5
 8000fc4:	2601      	movs	r6, #1
 8000fc6:	3947      	subs	r1, #71	; 0x47
 8000fc8:	7496      	strb	r6, [r2, #18]
 8000fca:	6091      	str	r1, [r2, #8]
 8000fcc:	2100      	movs	r1, #0
 8000fce:	460d      	mov	r5, r1
 8000fd0:	460a      	mov	r2, r1
 8000fd2:	f102 0c08 	add.w	ip, r2, #8
 8000fd6:	f102 0616 	add.w	r6, r2, #22
 8000fda:	f833 801c 	ldrh.w	r8, [r3, ip, lsl #1]
 8000fde:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000fe2:	f833 c01c 	ldrh.w	ip, [r3, ip, lsl #1]
 8000fe6:	fa0f f888 	sxth.w	r8, r8
 8000fea:	ebc7 0808 	rsb	r8, r7, r8
 8000fee:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8000ff2:	fb07 1108 	mla	r1, r7, r8, r1
 8000ff6:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000ffa:	3201      	adds	r2, #1
 8000ffc:	fa0f f68c 	sxth.w	r6, ip
 8001000:	1bf6      	subs	r6, r6, r7
 8001002:	2a04      	cmp	r2, #4
 8001004:	4435      	add	r5, r6
 8001006:	d1e4      	bne.n	8000fd2 <rgb_get_line_position+0x106>
 8001008:	2200      	movs	r2, #0
 800100a:	2d0a      	cmp	r5, #10
 800100c:	4b07      	ldr	r3, [pc, #28]	; (800102c <rgb_get_line_position+0x160>)
 800100e:	74c2      	strb	r2, [r0, #19]
 8001010:	dd05      	ble.n	800101e <rgb_get_line_position+0x152>
 8001012:	fb91 f1f5 	sdiv	r1, r1, r5
 8001016:	2201      	movs	r2, #1
 8001018:	3947      	subs	r1, #71	; 0x47
 800101a:	74da      	strb	r2, [r3, #19]
 800101c:	60d9      	str	r1, [r3, #12]
 800101e:	b004      	add	sp, #16
 8001020:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001024:	080026a8 	.word	0x080026a8
 8001028:	20000188 	.word	0x20000188
 800102c:	20000610 	.word	0x20000610

08001030 <rgb_set_background>:
 8001030:	b530      	push	{r4, r5, lr}
 8001032:	2200      	movs	r2, #0
 8001034:	4b37      	ldr	r3, [pc, #220]	; (8001114 <rgb_set_background+0xe4>)
 8001036:	f102 000a 	add.w	r0, r2, #10
 800103a:	2100      	movs	r1, #0
 800103c:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 8001040:	f102 000e 	add.w	r0, r2, #14
 8001044:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 8001048:	f102 0016 	add.w	r0, r2, #22
 800104c:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 8001050:	f102 0012 	add.w	r0, r2, #18
 8001054:	3201      	adds	r2, #1
 8001056:	2a04      	cmp	r2, #4
 8001058:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 800105c:	d1ea      	bne.n	8001034 <rgb_set_background+0x4>
 800105e:	2164      	movs	r1, #100	; 0x64
 8001060:	2200      	movs	r2, #0
 8001062:	f102 000a 	add.w	r0, r2, #10
 8001066:	f102 050c 	add.w	r5, r2, #12
 800106a:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 800106e:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 8001072:	fa04 f485 	sxtah	r4, r4, r5
 8001076:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 800107a:	f102 000e 	add.w	r0, r2, #14
 800107e:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001082:	f833 5012 	ldrh.w	r5, [r3, r2, lsl #1]
 8001086:	fa04 f485 	sxtah	r4, r4, r5
 800108a:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 800108e:	1d15      	adds	r5, r2, #4
 8001090:	f102 0016 	add.w	r0, r2, #22
 8001094:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001098:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 800109c:	fa04 f485 	sxtah	r4, r4, r5
 80010a0:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 80010a4:	f102 0508 	add.w	r5, r2, #8
 80010a8:	f102 0012 	add.w	r0, r2, #18
 80010ac:	3201      	adds	r2, #1
 80010ae:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 80010b2:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 80010b6:	2a04      	cmp	r2, #4
 80010b8:	fa04 f485 	sxtah	r4, r4, r5
 80010bc:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 80010c0:	d1cf      	bne.n	8001062 <rgb_set_background+0x32>
 80010c2:	3901      	subs	r1, #1
 80010c4:	d1cc      	bne.n	8001060 <rgb_set_background+0x30>
 80010c6:	460a      	mov	r2, r1
 80010c8:	f102 000a 	add.w	r0, r2, #10
 80010cc:	2164      	movs	r1, #100	; 0x64
 80010ce:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 80010d2:	fb94 f4f1 	sdiv	r4, r4, r1
 80010d6:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 80010da:	f102 000e 	add.w	r0, r2, #14
 80010de:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 80010e2:	fb94 f4f1 	sdiv	r4, r4, r1
 80010e6:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 80010ea:	f102 0016 	add.w	r0, r2, #22
 80010ee:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 80010f2:	fb94 f4f1 	sdiv	r4, r4, r1
 80010f6:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 80010fa:	f102 0012 	add.w	r0, r2, #18
 80010fe:	3201      	adds	r2, #1
 8001100:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001104:	2a04      	cmp	r2, #4
 8001106:	fb94 f1f1 	sdiv	r1, r4, r1
 800110a:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 800110e:	d1db      	bne.n	80010c8 <rgb_set_background+0x98>
 8001110:	bd30      	pop	{r4, r5, pc}
 8001112:	bf00      	nop
 8001114:	20000188 	.word	0x20000188

08001118 <rgb_i2c_delay>:
 8001118:	bf00      	nop
 800111a:	4770      	bx	lr

0800111c <RGBSetLowSDA>:
 800111c:	b513      	push	{r0, r1, r4, lr}
 800111e:	2301      	movs	r3, #1
 8001120:	2203      	movs	r2, #3
 8001122:	24f0      	movs	r4, #240	; 0xf0
 8001124:	f88d 3004 	strb.w	r3, [sp, #4]
 8001128:	f88d 3006 	strb.w	r3, [sp, #6]
 800112c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001130:	2300      	movs	r3, #0
 8001132:	4669      	mov	r1, sp
 8001134:	f88d 2005 	strb.w	r2, [sp, #5]
 8001138:	f88d 3007 	strb.w	r3, [sp, #7]
 800113c:	9400      	str	r4, [sp, #0]
 800113e:	f001 f908 	bl	8002352 <GPIO_Init>
 8001142:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001146:	851c      	strh	r4, [r3, #40]	; 0x28
 8001148:	f7ff ffe6 	bl	8001118 <rgb_i2c_delay>
 800114c:	b002      	add	sp, #8
 800114e:	bd10      	pop	{r4, pc}

08001150 <RGBSetHighSDA>:
 8001150:	b513      	push	{r0, r1, r4, lr}
 8001152:	2300      	movs	r3, #0
 8001154:	2203      	movs	r2, #3
 8001156:	24f0      	movs	r4, #240	; 0xf0
 8001158:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800115c:	4669      	mov	r1, sp
 800115e:	f88d 3004 	strb.w	r3, [sp, #4]
 8001162:	f88d 2005 	strb.w	r2, [sp, #5]
 8001166:	f88d 3007 	strb.w	r3, [sp, #7]
 800116a:	9400      	str	r4, [sp, #0]
 800116c:	f001 f8f1 	bl	8002352 <GPIO_Init>
 8001170:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001174:	619c      	str	r4, [r3, #24]
 8001176:	f7ff ffcf 	bl	8001118 <rgb_i2c_delay>
 800117a:	b002      	add	sp, #8
 800117c:	bd10      	pop	{r4, pc}
	...

08001180 <RGBSetLowSCL>:
 8001180:	4b02      	ldr	r3, [pc, #8]	; (800118c <RGBSetLowSCL+0xc>)
 8001182:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8001186:	851a      	strh	r2, [r3, #40]	; 0x28
 8001188:	f7ff bfc6 	b.w	8001118 <rgb_i2c_delay>
 800118c:	48000800 	.word	0x48000800

08001190 <RGBSetHighSCL>:
 8001190:	4b02      	ldr	r3, [pc, #8]	; (800119c <RGBSetHighSCL+0xc>)
 8001192:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8001196:	619a      	str	r2, [r3, #24]
 8001198:	f7ff bfbe 	b.w	8001118 <rgb_i2c_delay>
 800119c:	48000800 	.word	0x48000800

080011a0 <rgb_i2c_init>:
 80011a0:	b573      	push	{r0, r1, r4, r5, r6, lr}
 80011a2:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 80011a6:	2400      	movs	r4, #0
 80011a8:	9300      	str	r3, [sp, #0]
 80011aa:	2603      	movs	r6, #3
 80011ac:	2301      	movs	r3, #1
 80011ae:	4669      	mov	r1, sp
 80011b0:	4812      	ldr	r0, [pc, #72]	; (80011fc <rgb_i2c_init+0x5c>)
 80011b2:	f88d 3004 	strb.w	r3, [sp, #4]
 80011b6:	25f0      	movs	r5, #240	; 0xf0
 80011b8:	f88d 6005 	strb.w	r6, [sp, #5]
 80011bc:	f88d 4006 	strb.w	r4, [sp, #6]
 80011c0:	f88d 4007 	strb.w	r4, [sp, #7]
 80011c4:	f001 f8c5 	bl	8002352 <GPIO_Init>
 80011c8:	4669      	mov	r1, sp
 80011ca:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80011ce:	9500      	str	r5, [sp, #0]
 80011d0:	f88d 4004 	strb.w	r4, [sp, #4]
 80011d4:	f88d 6005 	strb.w	r6, [sp, #5]
 80011d8:	f88d 4007 	strb.w	r4, [sp, #7]
 80011dc:	f001 f8b9 	bl	8002352 <GPIO_Init>
 80011e0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80011e4:	4629      	mov	r1, r5
 80011e6:	f001 f8fa 	bl	80023de <GPIO_SetBits>
 80011ea:	f7ff ffd1 	bl	8001190 <RGBSetHighSCL>
 80011ee:	f7ff ff95 	bl	800111c <RGBSetLowSDA>
 80011f2:	f7ff ffad 	bl	8001150 <RGBSetHighSDA>
 80011f6:	b002      	add	sp, #8
 80011f8:	bd70      	pop	{r4, r5, r6, pc}
 80011fa:	bf00      	nop
 80011fc:	48000800 	.word	0x48000800

08001200 <rgb_i2cStart>:
 8001200:	b508      	push	{r3, lr}
 8001202:	f7ff ffc5 	bl	8001190 <RGBSetHighSCL>
 8001206:	f7ff ffa3 	bl	8001150 <RGBSetHighSDA>
 800120a:	f7ff ffc1 	bl	8001190 <RGBSetHighSCL>
 800120e:	f7ff ff85 	bl	800111c <RGBSetLowSDA>
 8001212:	f7ff ffb5 	bl	8001180 <RGBSetLowSCL>
 8001216:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800121a:	f7ff bf99 	b.w	8001150 <RGBSetHighSDA>

0800121e <rgb_i2cStop>:
 800121e:	b508      	push	{r3, lr}
 8001220:	f7ff ffae 	bl	8001180 <RGBSetLowSCL>
 8001224:	f7ff ff7a 	bl	800111c <RGBSetLowSDA>
 8001228:	f7ff ffb2 	bl	8001190 <RGBSetHighSCL>
 800122c:	f7ff ff76 	bl	800111c <RGBSetLowSDA>
 8001230:	f7ff ffae 	bl	8001190 <RGBSetHighSCL>
 8001234:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001238:	f7ff bf8a 	b.w	8001150 <RGBSetHighSDA>

0800123c <rgb_i2cWrite>:
 800123c:	b538      	push	{r3, r4, r5, lr}
 800123e:	4604      	mov	r4, r0
 8001240:	2508      	movs	r5, #8
 8001242:	f7ff ff9d 	bl	8001180 <RGBSetLowSCL>
 8001246:	0623      	lsls	r3, r4, #24
 8001248:	d502      	bpl.n	8001250 <rgb_i2cWrite+0x14>
 800124a:	f7ff ff81 	bl	8001150 <RGBSetHighSDA>
 800124e:	e001      	b.n	8001254 <rgb_i2cWrite+0x18>
 8001250:	f7ff ff64 	bl	800111c <RGBSetLowSDA>
 8001254:	3d01      	subs	r5, #1
 8001256:	f7ff ff9b 	bl	8001190 <RGBSetHighSCL>
 800125a:	0064      	lsls	r4, r4, #1
 800125c:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001260:	b2e4      	uxtb	r4, r4
 8001262:	d1ee      	bne.n	8001242 <rgb_i2cWrite+0x6>
 8001264:	f7ff ff8c 	bl	8001180 <RGBSetLowSCL>
 8001268:	f7ff ff72 	bl	8001150 <RGBSetHighSDA>
 800126c:	f7ff ff90 	bl	8001190 <RGBSetHighSCL>
 8001270:	f7ff ff86 	bl	8001180 <RGBSetLowSCL>
 8001274:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8001278:	f7ff bf4e 	b.w	8001118 <rgb_i2c_delay>

0800127c <rgb_i2cRead>:
 800127c:	2300      	movs	r3, #0
 800127e:	b570      	push	{r4, r5, r6, lr}
 8001280:	700b      	strb	r3, [r1, #0]
 8001282:	704b      	strb	r3, [r1, #1]
 8001284:	708b      	strb	r3, [r1, #2]
 8001286:	70cb      	strb	r3, [r1, #3]
 8001288:	4606      	mov	r6, r0
 800128a:	460c      	mov	r4, r1
 800128c:	f7ff ff78 	bl	8001180 <RGBSetLowSCL>
 8001290:	f7ff ff5e 	bl	8001150 <RGBSetHighSDA>
 8001294:	2508      	movs	r5, #8
 8001296:	2300      	movs	r3, #0
 8001298:	5ce2      	ldrb	r2, [r4, r3]
 800129a:	0052      	lsls	r2, r2, #1
 800129c:	54e2      	strb	r2, [r4, r3]
 800129e:	3301      	adds	r3, #1
 80012a0:	2b04      	cmp	r3, #4
 80012a2:	d1f9      	bne.n	8001298 <rgb_i2cRead+0x1c>
 80012a4:	f7ff ff74 	bl	8001190 <RGBSetHighSCL>
 80012a8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80012ac:	8a1b      	ldrh	r3, [r3, #16]
 80012ae:	b29b      	uxth	r3, r3
 80012b0:	06da      	lsls	r2, r3, #27
 80012b2:	d503      	bpl.n	80012bc <rgb_i2cRead+0x40>
 80012b4:	7822      	ldrb	r2, [r4, #0]
 80012b6:	f042 0201 	orr.w	r2, r2, #1
 80012ba:	7022      	strb	r2, [r4, #0]
 80012bc:	0698      	lsls	r0, r3, #26
 80012be:	d503      	bpl.n	80012c8 <rgb_i2cRead+0x4c>
 80012c0:	7862      	ldrb	r2, [r4, #1]
 80012c2:	f042 0201 	orr.w	r2, r2, #1
 80012c6:	7062      	strb	r2, [r4, #1]
 80012c8:	0659      	lsls	r1, r3, #25
 80012ca:	d503      	bpl.n	80012d4 <rgb_i2cRead+0x58>
 80012cc:	78a2      	ldrb	r2, [r4, #2]
 80012ce:	f042 0201 	orr.w	r2, r2, #1
 80012d2:	70a2      	strb	r2, [r4, #2]
 80012d4:	061a      	lsls	r2, r3, #24
 80012d6:	d503      	bpl.n	80012e0 <rgb_i2cRead+0x64>
 80012d8:	78e3      	ldrb	r3, [r4, #3]
 80012da:	f043 0301 	orr.w	r3, r3, #1
 80012de:	70e3      	strb	r3, [r4, #3]
 80012e0:	f7ff ff4e 	bl	8001180 <RGBSetLowSCL>
 80012e4:	3d01      	subs	r5, #1
 80012e6:	d1d6      	bne.n	8001296 <rgb_i2cRead+0x1a>
 80012e8:	b10e      	cbz	r6, 80012ee <rgb_i2cRead+0x72>
 80012ea:	f7ff ff17 	bl	800111c <RGBSetLowSDA>
 80012ee:	f7ff ff4f 	bl	8001190 <RGBSetHighSCL>
 80012f2:	f7ff ff45 	bl	8001180 <RGBSetLowSCL>
 80012f6:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80012fa:	f7ff bf0d 	b.w	8001118 <rgb_i2c_delay>

080012fe <rgb_i2c_write_reg>:
 80012fe:	b570      	push	{r4, r5, r6, lr}
 8001300:	4605      	mov	r5, r0
 8001302:	460c      	mov	r4, r1
 8001304:	4616      	mov	r6, r2
 8001306:	f7ff ff7b 	bl	8001200 <rgb_i2cStart>
 800130a:	4628      	mov	r0, r5
 800130c:	f7ff ff96 	bl	800123c <rgb_i2cWrite>
 8001310:	4620      	mov	r0, r4
 8001312:	f7ff ff93 	bl	800123c <rgb_i2cWrite>
 8001316:	4630      	mov	r0, r6
 8001318:	f7ff ff90 	bl	800123c <rgb_i2cWrite>
 800131c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001320:	f7ff bf7d 	b.w	800121e <rgb_i2cStop>

08001324 <rgb_i2c_read_reg>:
 8001324:	b570      	push	{r4, r5, r6, lr}
 8001326:	4604      	mov	r4, r0
 8001328:	460d      	mov	r5, r1
 800132a:	4616      	mov	r6, r2
 800132c:	f7ff ff68 	bl	8001200 <rgb_i2cStart>
 8001330:	4620      	mov	r0, r4
 8001332:	f7ff ff83 	bl	800123c <rgb_i2cWrite>
 8001336:	4628      	mov	r0, r5
 8001338:	f7ff ff80 	bl	800123c <rgb_i2cWrite>
 800133c:	f7ff ff60 	bl	8001200 <rgb_i2cStart>
 8001340:	f044 0001 	orr.w	r0, r4, #1
 8001344:	f7ff ff7a 	bl	800123c <rgb_i2cWrite>
 8001348:	4631      	mov	r1, r6
 800134a:	2000      	movs	r0, #0
 800134c:	f7ff ff96 	bl	800127c <rgb_i2cRead>
 8001350:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001354:	f7ff bf63 	b.w	800121e <rgb_i2cStop>

08001358 <device_sleep>:
 8001358:	4b01      	ldr	r3, [pc, #4]	; (8001360 <device_sleep+0x8>)
 800135a:	22ff      	movs	r2, #255	; 0xff
 800135c:	701a      	strb	r2, [r3, #0]
 800135e:	4770      	bx	lr
 8001360:	20000030 	.word	0x20000030

08001364 <device_wake_up>:
 8001364:	4b01      	ldr	r3, [pc, #4]	; (800136c <device_wake_up+0x8>)
 8001366:	2200      	movs	r2, #0
 8001368:	701a      	strb	r2, [r3, #0]
 800136a:	4770      	bx	lr
 800136c:	20000030 	.word	0x20000030

08001370 <device_i2c_thread>:
 8001370:	b538      	push	{r3, r4, r5, lr}
 8001372:	2000      	movs	r0, #0
 8001374:	210a      	movs	r1, #10
 8001376:	f000 fc5b 	bl	8001c30 <event_timer_set_period>
 800137a:	2501      	movs	r5, #1
 800137c:	2400      	movs	r4, #0
 800137e:	2c01      	cmp	r4, #1
 8001380:	d017      	beq.n	80013b2 <device_i2c_thread+0x42>
 8001382:	d30f      	bcc.n	80013a4 <device_i2c_thread+0x34>
 8001384:	2c02      	cmp	r4, #2
 8001386:	d1fa      	bne.n	800137e <device_i2c_thread+0xe>
 8001388:	f7ff fb20 	bl	80009cc <lsm9ds0_uninit>
 800138c:	f7ff faa2 	bl	80008d4 <motors_uninit>
 8001390:	2064      	movs	r0, #100	; 0x64
 8001392:	f000 fc3d 	bl	8001c10 <timer_delay_ms>
 8001396:	4b0d      	ldr	r3, [pc, #52]	; (80013cc <device_i2c_thread+0x5c>)
 8001398:	781c      	ldrb	r4, [r3, #0]
 800139a:	2c00      	cmp	r4, #0
 800139c:	bf14      	ite	ne
 800139e:	2402      	movne	r4, #2
 80013a0:	2400      	moveq	r4, #0
 80013a2:	e7ec      	b.n	800137e <device_i2c_thread+0xe>
 80013a4:	f7ff fb06 	bl	80009b4 <motors_init>
 80013a8:	4628      	mov	r0, r5
 80013aa:	f7ff fbe9 	bl	8000b80 <lsm9ds0_init>
 80013ae:	2500      	movs	r5, #0
 80013b0:	2401      	movs	r4, #1
 80013b2:	2000      	movs	r0, #0
 80013b4:	f000 fc52 	bl	8001c5c <event_timer_wait>
 80013b8:	f7ff fb1a 	bl	80009f0 <lsm9ds0_read>
 80013bc:	f7ff fa98 	bl	80008f0 <motors_update>
 80013c0:	4b02      	ldr	r3, [pc, #8]	; (80013cc <device_i2c_thread+0x5c>)
 80013c2:	781b      	ldrb	r3, [r3, #0]
 80013c4:	2b00      	cmp	r3, #0
 80013c6:	bf18      	it	ne
 80013c8:	2402      	movne	r4, #2
 80013ca:	e7d8      	b.n	800137e <device_i2c_thread+0xe>
 80013cc:	20000030 	.word	0x20000030

080013d0 <device_rgb_sensors_thread>:
 80013d0:	b510      	push	{r4, lr}
 80013d2:	2001      	movs	r0, #1
 80013d4:	210a      	movs	r1, #10
 80013d6:	f000 fc2b 	bl	8001c30 <event_timer_set_period>
 80013da:	2400      	movs	r4, #0
 80013dc:	2001      	movs	r0, #1
 80013de:	f000 fc3d 	bl	8001c5c <event_timer_wait>
 80013e2:	f7ff fc2f 	bl	8000c44 <rgb_sensor_read>
 80013e6:	2c01      	cmp	r4, #1
 80013e8:	d01a      	beq.n	8001420 <device_rgb_sensors_thread+0x50>
 80013ea:	d30d      	bcc.n	8001408 <device_rgb_sensors_thread+0x38>
 80013ec:	2c02      	cmp	r4, #2
 80013ee:	d1f5      	bne.n	80013dc <device_rgb_sensors_thread+0xc>
 80013f0:	f7ff fc1c 	bl	8000c2c <rgb_sensor_uninit>
 80013f4:	2064      	movs	r0, #100	; 0x64
 80013f6:	f000 fc0b 	bl	8001c10 <timer_delay_ms>
 80013fa:	4b0f      	ldr	r3, [pc, #60]	; (8001438 <device_rgb_sensors_thread+0x68>)
 80013fc:	781c      	ldrb	r4, [r3, #0]
 80013fe:	2c00      	cmp	r4, #0
 8001400:	bf14      	ite	ne
 8001402:	2402      	movne	r4, #2
 8001404:	2400      	moveq	r4, #0
 8001406:	e7e9      	b.n	80013dc <device_rgb_sensors_thread+0xc>
 8001408:	f7ff fd06 	bl	8000e18 <rgb_sensor_init>
 800140c:	4604      	mov	r4, r0
 800140e:	b128      	cbz	r0, 800141c <device_rgb_sensors_thread+0x4c>
 8001410:	f7ff fc0c 	bl	8000c2c <rgb_sensor_uninit>
 8001414:	2001      	movs	r0, #1
 8001416:	4621      	mov	r1, r4
 8001418:	f000 f856 	bl	80014c8 <abort_error_>
 800141c:	2401      	movs	r4, #1
 800141e:	e7dd      	b.n	80013dc <device_rgb_sensors_thread+0xc>
 8001420:	4620      	mov	r0, r4
 8001422:	f000 fc1b 	bl	8001c5c <event_timer_wait>
 8001426:	f7ff fc0d 	bl	8000c44 <rgb_sensor_read>
 800142a:	4b03      	ldr	r3, [pc, #12]	; (8001438 <device_rgb_sensors_thread+0x68>)
 800142c:	781b      	ldrb	r3, [r3, #0]
 800142e:	2b00      	cmp	r3, #0
 8001430:	d0f4      	beq.n	800141c <device_rgb_sensors_thread+0x4c>
 8001432:	2402      	movs	r4, #2
 8001434:	e7d2      	b.n	80013dc <device_rgb_sensors_thread+0xc>
 8001436:	bf00      	nop
 8001438:	20000030 	.word	0x20000030

0800143c <device_wifi_thread>:
 800143c:	b570      	push	{r4, r5, r6, lr}
 800143e:	4b1f      	ldr	r3, [pc, #124]	; (80014bc <device_wifi_thread+0x80>)
 8001440:	b0a6      	sub	sp, #152	; 0x98
 8001442:	ac02      	add	r4, sp, #8
 8001444:	f103 0210 	add.w	r2, r3, #16
 8001448:	4626      	mov	r6, r4
 800144a:	6818      	ldr	r0, [r3, #0]
 800144c:	6859      	ldr	r1, [r3, #4]
 800144e:	4625      	mov	r5, r4
 8001450:	c503      	stmia	r5!, {r0, r1}
 8001452:	3308      	adds	r3, #8
 8001454:	4293      	cmp	r3, r2
 8001456:	462c      	mov	r4, r5
 8001458:	d1f7      	bne.n	800144a <device_wifi_thread+0xe>
 800145a:	4630      	mov	r0, r6
 800145c:	f7fe ffc0 	bl	80003e0 <strlen_>
 8001460:	2100      	movs	r1, #0
 8001462:	4605      	mov	r5, r0
 8001464:	2901      	cmp	r1, #1
 8001466:	d01c      	beq.n	80014a2 <device_wifi_thread+0x66>
 8001468:	d30d      	bcc.n	8001486 <device_wifi_thread+0x4a>
 800146a:	2900      	cmp	r1, #0
 800146c:	d0fa      	beq.n	8001464 <device_wifi_thread+0x28>
 800146e:	f7ff f97d 	bl	800076c <esp8266_uninit>
 8001472:	2064      	movs	r0, #100	; 0x64
 8001474:	f000 fbcc 	bl	8001c10 <timer_delay_ms>
 8001478:	4b11      	ldr	r3, [pc, #68]	; (80014c0 <device_wifi_thread+0x84>)
 800147a:	7819      	ldrb	r1, [r3, #0]
 800147c:	2900      	cmp	r1, #0
 800147e:	bf14      	ite	ne
 8001480:	2102      	movne	r1, #2
 8001482:	2100      	moveq	r1, #0
 8001484:	e7ee      	b.n	8001464 <device_wifi_thread+0x28>
 8001486:	2001      	movs	r0, #1
 8001488:	f000 ffc8 	bl	800241c <led_on>
 800148c:	2000      	movs	r0, #0
 800148e:	f7ff f921 	bl	80006d4 <esp8266_init>
 8001492:	4604      	mov	r4, r0
 8001494:	b128      	cbz	r0, 80014a2 <device_wifi_thread+0x66>
 8001496:	f7ff f969 	bl	800076c <esp8266_uninit>
 800149a:	2003      	movs	r0, #3
 800149c:	4621      	mov	r1, r4
 800149e:	f000 f813 	bl	80014c8 <abort_error_>
 80014a2:	ab06      	add	r3, sp, #24
 80014a4:	9300      	str	r3, [sp, #0]
 80014a6:	2380      	movs	r3, #128	; 0x80
 80014a8:	9301      	str	r3, [sp, #4]
 80014aa:	f240 71da 	movw	r1, #2010	; 0x7da
 80014ae:	4632      	mov	r2, r6
 80014b0:	462b      	mov	r3, r5
 80014b2:	4804      	ldr	r0, [pc, #16]	; (80014c4 <device_wifi_thread+0x88>)
 80014b4:	f7ff f986 	bl	80007c4 <esp8266_connect>
 80014b8:	e7f3      	b.n	80014a2 <device_wifi_thread+0x66>
 80014ba:	bf00      	nop
 80014bc:	080026c4 	.word	0x080026c4
 80014c0:	20000030 	.word	0x20000030
 80014c4:	080026b8 	.word	0x080026b8

080014c8 <abort_error_>:
 80014c8:	b570      	push	{r4, r5, r6, lr}
 80014ca:	4605      	mov	r5, r0
 80014cc:	460e      	mov	r6, r1
 80014ce:	480d      	ldr	r0, [pc, #52]	; (8001504 <abort_error_+0x3c>)
 80014d0:	4629      	mov	r1, r5
 80014d2:	4632      	mov	r2, r6
 80014d4:	f7ff f806 	bl	80004e4 <printf_>
 80014d8:	2408      	movs	r4, #8
 80014da:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80014de:	f000 ff9d 	bl	800241c <led_on>
 80014e2:	201e      	movs	r0, #30
 80014e4:	f000 fb94 	bl	8001c10 <timer_delay_ms>
 80014e8:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80014ec:	f000 ffac 	bl	8002448 <led_off>
 80014f0:	2046      	movs	r0, #70	; 0x46
 80014f2:	f000 fb8d 	bl	8001c10 <timer_delay_ms>
 80014f6:	3c01      	subs	r4, #1
 80014f8:	d1ef      	bne.n	80014da <abort_error_+0x12>
 80014fa:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80014fe:	f000 fb87 	bl	8001c10 <timer_delay_ms>
 8001502:	e7e4      	b.n	80014ce <abort_error_+0x6>
 8001504:	080026d4 	.word	0x080026d4

08001508 <sensor_test>:
 8001508:	b538      	push	{r3, r4, r5, lr}
 800150a:	4c31      	ldr	r4, [pc, #196]	; (80015d0 <sensor_test+0xc8>)
 800150c:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001510:	f000 ff84 	bl	800241c <led_on>
 8001514:	482f      	ldr	r0, [pc, #188]	; (80015d4 <sensor_test+0xcc>)
 8001516:	f7fe ffe5 	bl	80004e4 <printf_>
 800151a:	89a1      	ldrh	r1, [r4, #12]
 800151c:	89e2      	ldrh	r2, [r4, #14]
 800151e:	8a23      	ldrh	r3, [r4, #16]
 8001520:	482d      	ldr	r0, [pc, #180]	; (80015d8 <sensor_test+0xd0>)
 8001522:	b209      	sxth	r1, r1
 8001524:	b212      	sxth	r2, r2
 8001526:	b21b      	sxth	r3, r3
 8001528:	f7fe ffdc 	bl	80004e4 <printf_>
 800152c:	88e1      	ldrh	r1, [r4, #6]
 800152e:	8922      	ldrh	r2, [r4, #8]
 8001530:	8963      	ldrh	r3, [r4, #10]
 8001532:	4829      	ldr	r0, [pc, #164]	; (80015d8 <sensor_test+0xd0>)
 8001534:	b209      	sxth	r1, r1
 8001536:	b212      	sxth	r2, r2
 8001538:	b21b      	sxth	r3, r3
 800153a:	f7fe ffd3 	bl	80004e4 <printf_>
 800153e:	8821      	ldrh	r1, [r4, #0]
 8001540:	8862      	ldrh	r2, [r4, #2]
 8001542:	88a3      	ldrh	r3, [r4, #4]
 8001544:	4825      	ldr	r0, [pc, #148]	; (80015dc <sensor_test+0xd4>)
 8001546:	b209      	sxth	r1, r1
 8001548:	b212      	sxth	r2, r2
 800154a:	b21b      	sxth	r3, r3
 800154c:	f7fe ffca 	bl	80004e4 <printf_>
 8001550:	4823      	ldr	r0, [pc, #140]	; (80015e0 <sensor_test+0xd8>)
 8001552:	f7fe ffc7 	bl	80004e4 <printf_>
 8001556:	4823      	ldr	r0, [pc, #140]	; (80015e4 <sensor_test+0xdc>)
 8001558:	f7fe ffc4 	bl	80004e4 <printf_>
 800155c:	4822      	ldr	r0, [pc, #136]	; (80015e8 <sensor_test+0xe0>)
 800155e:	f7fe ffc1 	bl	80004e4 <printf_>
 8001562:	2400      	movs	r4, #0
 8001564:	f104 0334 	add.w	r3, r4, #52	; 0x34
 8001568:	4d20      	ldr	r5, [pc, #128]	; (80015ec <sensor_test+0xe4>)
 800156a:	4821      	ldr	r0, [pc, #132]	; (80015f0 <sensor_test+0xe8>)
 800156c:	f835 1013 	ldrh.w	r1, [r5, r3, lsl #1]
 8001570:	3401      	adds	r4, #1
 8001572:	b209      	sxth	r1, r1
 8001574:	f7fe ffb6 	bl	80004e4 <printf_>
 8001578:	2c04      	cmp	r4, #4
 800157a:	d1f3      	bne.n	8001564 <sensor_test+0x5c>
 800157c:	481d      	ldr	r0, [pc, #116]	; (80015f4 <sensor_test+0xec>)
 800157e:	f7fe ffb1 	bl	80004e4 <printf_>
 8001582:	2400      	movs	r4, #0
 8001584:	f104 0338 	add.w	r3, r4, #56	; 0x38
 8001588:	4819      	ldr	r0, [pc, #100]	; (80015f0 <sensor_test+0xe8>)
 800158a:	f835 1013 	ldrh.w	r1, [r5, r3, lsl #1]
 800158e:	3401      	adds	r4, #1
 8001590:	b209      	sxth	r1, r1
 8001592:	f7fe ffa7 	bl	80004e4 <printf_>
 8001596:	2c04      	cmp	r4, #4
 8001598:	d1f4      	bne.n	8001584 <sensor_test+0x7c>
 800159a:	4817      	ldr	r0, [pc, #92]	; (80015f8 <sensor_test+0xf0>)
 800159c:	f7fe ffa2 	bl	80004e4 <printf_>
 80015a0:	2400      	movs	r4, #0
 80015a2:	f104 033c 	add.w	r3, r4, #60	; 0x3c
 80015a6:	4812      	ldr	r0, [pc, #72]	; (80015f0 <sensor_test+0xe8>)
 80015a8:	f835 1013 	ldrh.w	r1, [r5, r3, lsl #1]
 80015ac:	3401      	adds	r4, #1
 80015ae:	b209      	sxth	r1, r1
 80015b0:	f7fe ff98 	bl	80004e4 <printf_>
 80015b4:	2c04      	cmp	r4, #4
 80015b6:	d1f4      	bne.n	80015a2 <sensor_test+0x9a>
 80015b8:	4810      	ldr	r0, [pc, #64]	; (80015fc <sensor_test+0xf4>)
 80015ba:	f7fe ff93 	bl	80004e4 <printf_>
 80015be:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80015c2:	f000 ff41 	bl	8002448 <led_off>
 80015c6:	f44f 7096 	mov.w	r0, #300	; 0x12c
 80015ca:	f000 fb21 	bl	8001c10 <timer_delay_ms>
 80015ce:	e79c      	b.n	800150a <sensor_test+0x2>
 80015d0:	20000168 	.word	0x20000168
 80015d4:	080026e6 	.word	0x080026e6
 80015d8:	080026f1 	.word	0x080026f1
 80015dc:	080026fd 	.word	0x080026fd
 80015e0:	0800272a 	.word	0x0800272a
 80015e4:	08002706 	.word	0x08002706
 80015e8:	08002716 	.word	0x08002716
 80015ec:	20000188 	.word	0x20000188
 80015f0:	0800271b 	.word	0x0800271b
 80015f4:	0800271f 	.word	0x0800271f
 80015f8:	08002724 	.word	0x08002724
 80015fc:	08002729 	.word	0x08002729

08001600 <main_thread>:
 8001600:	b508      	push	{r3, lr}
 8001602:	4822      	ldr	r0, [pc, #136]	; (800168c <main_thread+0x8c>)
 8001604:	f7fe ff6e 	bl	80004e4 <printf_>
 8001608:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 800160c:	f000 fb00 	bl	8001c10 <timer_delay_ms>
 8001610:	f7ff fea8 	bl	8001364 <device_wake_up>
 8001614:	491e      	ldr	r1, [pc, #120]	; (8001690 <main_thread+0x90>)
 8001616:	481f      	ldr	r0, [pc, #124]	; (8001694 <main_thread+0x94>)
 8001618:	f44f 7200 	mov.w	r2, #512	; 0x200
 800161c:	2306      	movs	r3, #6
 800161e:	f7fe fe35 	bl	800028c <create_thread>
 8001622:	491d      	ldr	r1, [pc, #116]	; (8001698 <main_thread+0x98>)
 8001624:	481d      	ldr	r0, [pc, #116]	; (800169c <main_thread+0x9c>)
 8001626:	f44f 7200 	mov.w	r2, #512	; 0x200
 800162a:	2306      	movs	r3, #6
 800162c:	f7fe fe2e 	bl	800028c <create_thread>
 8001630:	491b      	ldr	r1, [pc, #108]	; (80016a0 <main_thread+0xa0>)
 8001632:	481c      	ldr	r0, [pc, #112]	; (80016a4 <main_thread+0xa4>)
 8001634:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001638:	2306      	movs	r3, #6
 800163a:	f7fe fe27 	bl	800028c <create_thread>
 800163e:	20c8      	movs	r0, #200	; 0xc8
 8001640:	f000 fae6 	bl	8001c10 <timer_delay_ms>
 8001644:	f7ff fcf4 	bl	8001030 <rgb_set_background>
 8001648:	f000 ff72 	bl	8002530 <get_key>
 800164c:	b980      	cbnz	r0, 8001670 <main_thread+0x70>
 800164e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001652:	f000 fee3 	bl	800241c <led_on>
 8001656:	2064      	movs	r0, #100	; 0x64
 8001658:	f000 fada 	bl	8001c10 <timer_delay_ms>
 800165c:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001660:	f000 fef2 	bl	8002448 <led_off>
 8001664:	20c8      	movs	r0, #200	; 0xc8
 8001666:	f000 fad3 	bl	8001c10 <timer_delay_ms>
 800166a:	f7ff fe75 	bl	8001358 <device_sleep>
 800166e:	e7eb      	b.n	8001648 <main_thread+0x48>
 8001670:	f7ff fe78 	bl	8001364 <device_wake_up>
 8001674:	20c8      	movs	r0, #200	; 0xc8
 8001676:	f000 facb 	bl	8001c10 <timer_delay_ms>
 800167a:	f7ff ff45 	bl	8001508 <sensor_test>
 800167e:	f000 ff57 	bl	8002530 <get_key>
 8001682:	2800      	cmp	r0, #0
 8001684:	d1e0      	bne.n	8001648 <main_thread+0x48>
 8001686:	f7ff fc21 	bl	8000ecc <rgb_get_line_position>
 800168a:	e7f8      	b.n	800167e <main_thread+0x7e>
 800168c:	08002736 	.word	0x08002736
 8001690:	20000828 	.word	0x20000828
 8001694:	080013d1 	.word	0x080013d1
 8001698:	20000628 	.word	0x20000628
 800169c:	08001371 	.word	0x08001371
 80016a0:	20000a28 	.word	0x20000a28
 80016a4:	0800143d 	.word	0x0800143d

080016a8 <main>:
 80016a8:	b508      	push	{r3, lr}
 80016aa:	f000 fe45 	bl	8002338 <lib_low_level_init>
 80016ae:	f7fe ff93 	bl	80005d8 <lib_os_init>
 80016b2:	4905      	ldr	r1, [pc, #20]	; (80016c8 <main+0x20>)
 80016b4:	4805      	ldr	r0, [pc, #20]	; (80016cc <main+0x24>)
 80016b6:	f44f 7200 	mov.w	r2, #512	; 0x200
 80016ba:	2306      	movs	r3, #6
 80016bc:	f7fe fde6 	bl	800028c <create_thread>
 80016c0:	f7fe fdde 	bl	8000280 <kernel_start>
 80016c4:	2000      	movs	r0, #0
 80016c6:	bd08      	pop	{r3, pc}
 80016c8:	20000c28 	.word	0x20000c28
 80016cc:	08001601 	.word	0x08001601

080016d0 <RCC_GetClocksFreq>:
 80016d0:	4ba5      	ldr	r3, [pc, #660]	; (8001968 <RCC_GetClocksFreq+0x298>)
 80016d2:	685a      	ldr	r2, [r3, #4]
 80016d4:	f002 020c 	and.w	r2, r2, #12
 80016d8:	2a04      	cmp	r2, #4
 80016da:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 80016de:	d005      	beq.n	80016ec <RCC_GetClocksFreq+0x1c>
 80016e0:	2a08      	cmp	r2, #8
 80016e2:	d006      	beq.n	80016f2 <RCC_GetClocksFreq+0x22>
 80016e4:	4ba1      	ldr	r3, [pc, #644]	; (800196c <RCC_GetClocksFreq+0x29c>)
 80016e6:	6003      	str	r3, [r0, #0]
 80016e8:	b9ba      	cbnz	r2, 800171a <RCC_GetClocksFreq+0x4a>
 80016ea:	e017      	b.n	800171c <RCC_GetClocksFreq+0x4c>
 80016ec:	4b9f      	ldr	r3, [pc, #636]	; (800196c <RCC_GetClocksFreq+0x29c>)
 80016ee:	6003      	str	r3, [r0, #0]
 80016f0:	e013      	b.n	800171a <RCC_GetClocksFreq+0x4a>
 80016f2:	6859      	ldr	r1, [r3, #4]
 80016f4:	685c      	ldr	r4, [r3, #4]
 80016f6:	f3c1 4183 	ubfx	r1, r1, #18, #4
 80016fa:	03e2      	lsls	r2, r4, #15
 80016fc:	f101 0102 	add.w	r1, r1, #2
 8001700:	d401      	bmi.n	8001706 <RCC_GetClocksFreq+0x36>
 8001702:	4a9b      	ldr	r2, [pc, #620]	; (8001970 <RCC_GetClocksFreq+0x2a0>)
 8001704:	e006      	b.n	8001714 <RCC_GetClocksFreq+0x44>
 8001706:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001708:	4b98      	ldr	r3, [pc, #608]	; (800196c <RCC_GetClocksFreq+0x29c>)
 800170a:	f002 020f 	and.w	r2, r2, #15
 800170e:	3201      	adds	r2, #1
 8001710:	fbb3 f2f2 	udiv	r2, r3, r2
 8001714:	434a      	muls	r2, r1
 8001716:	6002      	str	r2, [r0, #0]
 8001718:	e000      	b.n	800171c <RCC_GetClocksFreq+0x4c>
 800171a:	2200      	movs	r2, #0
 800171c:	4f92      	ldr	r7, [pc, #584]	; (8001968 <RCC_GetClocksFreq+0x298>)
 800171e:	4d95      	ldr	r5, [pc, #596]	; (8001974 <RCC_GetClocksFreq+0x2a4>)
 8001720:	687b      	ldr	r3, [r7, #4]
 8001722:	f8df 8254 	ldr.w	r8, [pc, #596]	; 8001978 <RCC_GetClocksFreq+0x2a8>
 8001726:	f3c3 1303 	ubfx	r3, r3, #4, #4
 800172a:	5cec      	ldrb	r4, [r5, r3]
 800172c:	6803      	ldr	r3, [r0, #0]
 800172e:	b2e4      	uxtb	r4, r4
 8001730:	fa23 f104 	lsr.w	r1, r3, r4
 8001734:	6041      	str	r1, [r0, #4]
 8001736:	687e      	ldr	r6, [r7, #4]
 8001738:	f3c6 2602 	ubfx	r6, r6, #8, #3
 800173c:	5dae      	ldrb	r6, [r5, r6]
 800173e:	fa21 f606 	lsr.w	r6, r1, r6
 8001742:	6086      	str	r6, [r0, #8]
 8001744:	f8d7 c004 	ldr.w	ip, [r7, #4]
 8001748:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 800174c:	f815 500c 	ldrb.w	r5, [r5, ip]
 8001750:	b2ed      	uxtb	r5, r5
 8001752:	40e9      	lsrs	r1, r5
 8001754:	60c1      	str	r1, [r0, #12]
 8001756:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 800175a:	f3c9 1904 	ubfx	r9, r9, #4, #5
 800175e:	f009 0c0f 	and.w	ip, r9, #15
 8001762:	f019 0f10 	tst.w	r9, #16
 8001766:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 800176a:	fa1f fc8c 	uxth.w	ip, ip
 800176e:	d007      	beq.n	8001780 <RCC_GetClocksFreq+0xb0>
 8001770:	f1bc 0f00 	cmp.w	ip, #0
 8001774:	d004      	beq.n	8001780 <RCC_GetClocksFreq+0xb0>
 8001776:	fbb2 fcfc 	udiv	ip, r2, ip
 800177a:	f8c0 c010 	str.w	ip, [r0, #16]
 800177e:	e000      	b.n	8001782 <RCC_GetClocksFreq+0xb2>
 8001780:	6103      	str	r3, [r0, #16]
 8001782:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 8001784:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 8001788:	f00c 070f 	and.w	r7, ip, #15
 800178c:	f01c 0f10 	tst.w	ip, #16
 8001790:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 8001794:	b2bf      	uxth	r7, r7
 8001796:	d004      	beq.n	80017a2 <RCC_GetClocksFreq+0xd2>
 8001798:	b11f      	cbz	r7, 80017a2 <RCC_GetClocksFreq+0xd2>
 800179a:	fbb2 f7f7 	udiv	r7, r2, r7
 800179e:	6147      	str	r7, [r0, #20]
 80017a0:	e000      	b.n	80017a4 <RCC_GetClocksFreq+0xd4>
 80017a2:	6143      	str	r3, [r0, #20]
 80017a4:	4f70      	ldr	r7, [pc, #448]	; (8001968 <RCC_GetClocksFreq+0x298>)
 80017a6:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80017aa:	f01c 0f10 	tst.w	ip, #16
 80017ae:	bf0a      	itet	eq
 80017b0:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 800196c <RCC_GetClocksFreq+0x29c>
 80017b4:	6183      	strne	r3, [r0, #24]
 80017b6:	f8c0 c018 	streq.w	ip, [r0, #24]
 80017ba:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80017bc:	06bf      	lsls	r7, r7, #26
 80017be:	bf56      	itet	pl
 80017c0:	4f6a      	ldrpl	r7, [pc, #424]	; (800196c <RCC_GetClocksFreq+0x29c>)
 80017c2:	61c3      	strmi	r3, [r0, #28]
 80017c4:	61c7      	strpl	r7, [r0, #28]
 80017c6:	4f68      	ldr	r7, [pc, #416]	; (8001968 <RCC_GetClocksFreq+0x298>)
 80017c8:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80017cc:	f01c 0f40 	tst.w	ip, #64	; 0x40
 80017d0:	bf0a      	itet	eq
 80017d2:	f8df c198 	ldreq.w	ip, [pc, #408]	; 800196c <RCC_GetClocksFreq+0x29c>
 80017d6:	6203      	strne	r3, [r0, #32]
 80017d8:	f8c0 c020 	streq.w	ip, [r0, #32]
 80017dc:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80017de:	05ff      	lsls	r7, r7, #23
 80017e0:	d506      	bpl.n	80017f0 <RCC_GetClocksFreq+0x120>
 80017e2:	4293      	cmp	r3, r2
 80017e4:	d104      	bne.n	80017f0 <RCC_GetClocksFreq+0x120>
 80017e6:	42a5      	cmp	r5, r4
 80017e8:	d102      	bne.n	80017f0 <RCC_GetClocksFreq+0x120>
 80017ea:	005f      	lsls	r7, r3, #1
 80017ec:	6247      	str	r7, [r0, #36]	; 0x24
 80017ee:	e000      	b.n	80017f2 <RCC_GetClocksFreq+0x122>
 80017f0:	6241      	str	r1, [r0, #36]	; 0x24
 80017f2:	4f5d      	ldr	r7, [pc, #372]	; (8001968 <RCC_GetClocksFreq+0x298>)
 80017f4:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80017f8:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 80017fc:	d008      	beq.n	8001810 <RCC_GetClocksFreq+0x140>
 80017fe:	4293      	cmp	r3, r2
 8001800:	d106      	bne.n	8001810 <RCC_GetClocksFreq+0x140>
 8001802:	42a5      	cmp	r5, r4
 8001804:	d104      	bne.n	8001810 <RCC_GetClocksFreq+0x140>
 8001806:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 800180a:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 800180e:	e000      	b.n	8001812 <RCC_GetClocksFreq+0x142>
 8001810:	6281      	str	r1, [r0, #40]	; 0x28
 8001812:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001814:	05bf      	lsls	r7, r7, #22
 8001816:	d506      	bpl.n	8001826 <RCC_GetClocksFreq+0x156>
 8001818:	4293      	cmp	r3, r2
 800181a:	d104      	bne.n	8001826 <RCC_GetClocksFreq+0x156>
 800181c:	42a5      	cmp	r5, r4
 800181e:	d102      	bne.n	8001826 <RCC_GetClocksFreq+0x156>
 8001820:	005f      	lsls	r7, r3, #1
 8001822:	62c7      	str	r7, [r0, #44]	; 0x2c
 8001824:	e000      	b.n	8001828 <RCC_GetClocksFreq+0x158>
 8001826:	62c1      	str	r1, [r0, #44]	; 0x2c
 8001828:	4f4f      	ldr	r7, [pc, #316]	; (8001968 <RCC_GetClocksFreq+0x298>)
 800182a:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800182e:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 8001832:	d008      	beq.n	8001846 <RCC_GetClocksFreq+0x176>
 8001834:	4293      	cmp	r3, r2
 8001836:	d106      	bne.n	8001846 <RCC_GetClocksFreq+0x176>
 8001838:	42a5      	cmp	r5, r4
 800183a:	d104      	bne.n	8001846 <RCC_GetClocksFreq+0x176>
 800183c:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001840:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8001844:	e000      	b.n	8001848 <RCC_GetClocksFreq+0x178>
 8001846:	64c1      	str	r1, [r0, #76]	; 0x4c
 8001848:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 800184a:	053f      	lsls	r7, r7, #20
 800184c:	d506      	bpl.n	800185c <RCC_GetClocksFreq+0x18c>
 800184e:	4293      	cmp	r3, r2
 8001850:	d104      	bne.n	800185c <RCC_GetClocksFreq+0x18c>
 8001852:	42a5      	cmp	r5, r4
 8001854:	d102      	bne.n	800185c <RCC_GetClocksFreq+0x18c>
 8001856:	005f      	lsls	r7, r3, #1
 8001858:	6507      	str	r7, [r0, #80]	; 0x50
 800185a:	e000      	b.n	800185e <RCC_GetClocksFreq+0x18e>
 800185c:	6501      	str	r1, [r0, #80]	; 0x50
 800185e:	4f42      	ldr	r7, [pc, #264]	; (8001968 <RCC_GetClocksFreq+0x298>)
 8001860:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001864:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 8001868:	d008      	beq.n	800187c <RCC_GetClocksFreq+0x1ac>
 800186a:	4293      	cmp	r3, r2
 800186c:	d106      	bne.n	800187c <RCC_GetClocksFreq+0x1ac>
 800186e:	42a5      	cmp	r5, r4
 8001870:	d104      	bne.n	800187c <RCC_GetClocksFreq+0x1ac>
 8001872:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8001876:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 800187a:	e000      	b.n	800187e <RCC_GetClocksFreq+0x1ae>
 800187c:	6501      	str	r1, [r0, #80]	; 0x50
 800187e:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001880:	043f      	lsls	r7, r7, #16
 8001882:	d506      	bpl.n	8001892 <RCC_GetClocksFreq+0x1c2>
 8001884:	4293      	cmp	r3, r2
 8001886:	d104      	bne.n	8001892 <RCC_GetClocksFreq+0x1c2>
 8001888:	42a5      	cmp	r5, r4
 800188a:	d102      	bne.n	8001892 <RCC_GetClocksFreq+0x1c2>
 800188c:	005a      	lsls	r2, r3, #1
 800188e:	6582      	str	r2, [r0, #88]	; 0x58
 8001890:	e000      	b.n	8001894 <RCC_GetClocksFreq+0x1c4>
 8001892:	6581      	str	r1, [r0, #88]	; 0x58
 8001894:	4a34      	ldr	r2, [pc, #208]	; (8001968 <RCC_GetClocksFreq+0x298>)
 8001896:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8001898:	07a4      	lsls	r4, r4, #30
 800189a:	d014      	beq.n	80018c6 <RCC_GetClocksFreq+0x1f6>
 800189c:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800189e:	f001 0103 	and.w	r1, r1, #3
 80018a2:	2901      	cmp	r1, #1
 80018a4:	d101      	bne.n	80018aa <RCC_GetClocksFreq+0x1da>
 80018a6:	6383      	str	r3, [r0, #56]	; 0x38
 80018a8:	e00e      	b.n	80018c8 <RCC_GetClocksFreq+0x1f8>
 80018aa:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80018ac:	f001 0103 	and.w	r1, r1, #3
 80018b0:	2902      	cmp	r1, #2
 80018b2:	d102      	bne.n	80018ba <RCC_GetClocksFreq+0x1ea>
 80018b4:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80018b8:	e005      	b.n	80018c6 <RCC_GetClocksFreq+0x1f6>
 80018ba:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80018bc:	f001 0103 	and.w	r1, r1, #3
 80018c0:	2903      	cmp	r1, #3
 80018c2:	d101      	bne.n	80018c8 <RCC_GetClocksFreq+0x1f8>
 80018c4:	4929      	ldr	r1, [pc, #164]	; (800196c <RCC_GetClocksFreq+0x29c>)
 80018c6:	6381      	str	r1, [r0, #56]	; 0x38
 80018c8:	6b12      	ldr	r2, [r2, #48]	; 0x30
 80018ca:	4927      	ldr	r1, [pc, #156]	; (8001968 <RCC_GetClocksFreq+0x298>)
 80018cc:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 80018d0:	d101      	bne.n	80018d6 <RCC_GetClocksFreq+0x206>
 80018d2:	63c6      	str	r6, [r0, #60]	; 0x3c
 80018d4:	e018      	b.n	8001908 <RCC_GetClocksFreq+0x238>
 80018d6:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80018d8:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 80018dc:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 80018e0:	d101      	bne.n	80018e6 <RCC_GetClocksFreq+0x216>
 80018e2:	63c3      	str	r3, [r0, #60]	; 0x3c
 80018e4:	e010      	b.n	8001908 <RCC_GetClocksFreq+0x238>
 80018e6:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80018e8:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 80018ec:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 80018f0:	d102      	bne.n	80018f8 <RCC_GetClocksFreq+0x228>
 80018f2:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80018f6:	e006      	b.n	8001906 <RCC_GetClocksFreq+0x236>
 80018f8:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80018fa:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 80018fe:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 8001902:	d101      	bne.n	8001908 <RCC_GetClocksFreq+0x238>
 8001904:	4a19      	ldr	r2, [pc, #100]	; (800196c <RCC_GetClocksFreq+0x29c>)
 8001906:	63c2      	str	r2, [r0, #60]	; 0x3c
 8001908:	4a17      	ldr	r2, [pc, #92]	; (8001968 <RCC_GetClocksFreq+0x298>)
 800190a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800190c:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8001910:	d101      	bne.n	8001916 <RCC_GetClocksFreq+0x246>
 8001912:	6406      	str	r6, [r0, #64]	; 0x40
 8001914:	e018      	b.n	8001948 <RCC_GetClocksFreq+0x278>
 8001916:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001918:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 800191c:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8001920:	d101      	bne.n	8001926 <RCC_GetClocksFreq+0x256>
 8001922:	6403      	str	r3, [r0, #64]	; 0x40
 8001924:	e010      	b.n	8001948 <RCC_GetClocksFreq+0x278>
 8001926:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001928:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 800192c:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 8001930:	d102      	bne.n	8001938 <RCC_GetClocksFreq+0x268>
 8001932:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001936:	e006      	b.n	8001946 <RCC_GetClocksFreq+0x276>
 8001938:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800193a:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 800193e:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 8001942:	d101      	bne.n	8001948 <RCC_GetClocksFreq+0x278>
 8001944:	4909      	ldr	r1, [pc, #36]	; (800196c <RCC_GetClocksFreq+0x29c>)
 8001946:	6401      	str	r1, [r0, #64]	; 0x40
 8001948:	6b12      	ldr	r2, [r2, #48]	; 0x30
 800194a:	4907      	ldr	r1, [pc, #28]	; (8001968 <RCC_GetClocksFreq+0x298>)
 800194c:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 8001950:	d101      	bne.n	8001956 <RCC_GetClocksFreq+0x286>
 8001952:	6446      	str	r6, [r0, #68]	; 0x44
 8001954:	e023      	b.n	800199e <RCC_GetClocksFreq+0x2ce>
 8001956:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001958:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 800195c:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 8001960:	d10c      	bne.n	800197c <RCC_GetClocksFreq+0x2ac>
 8001962:	6443      	str	r3, [r0, #68]	; 0x44
 8001964:	e01b      	b.n	800199e <RCC_GetClocksFreq+0x2ce>
 8001966:	bf00      	nop
 8001968:	40021000 	.word	0x40021000
 800196c:	007a1200 	.word	0x007a1200
 8001970:	003d0900 	.word	0x003d0900
 8001974:	20000020 	.word	0x20000020
 8001978:	20000000 	.word	0x20000000
 800197c:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800197e:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001982:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 8001986:	d102      	bne.n	800198e <RCC_GetClocksFreq+0x2be>
 8001988:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800198c:	e006      	b.n	800199c <RCC_GetClocksFreq+0x2cc>
 800198e:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001990:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001994:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 8001998:	d101      	bne.n	800199e <RCC_GetClocksFreq+0x2ce>
 800199a:	4a11      	ldr	r2, [pc, #68]	; (80019e0 <RCC_GetClocksFreq+0x310>)
 800199c:	6442      	str	r2, [r0, #68]	; 0x44
 800199e:	4a11      	ldr	r2, [pc, #68]	; (80019e4 <RCC_GetClocksFreq+0x314>)
 80019a0:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80019a2:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 80019a6:	d102      	bne.n	80019ae <RCC_GetClocksFreq+0x2de>
 80019a8:	6486      	str	r6, [r0, #72]	; 0x48
 80019aa:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80019ae:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80019b0:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 80019b4:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 80019b8:	d00f      	beq.n	80019da <RCC_GetClocksFreq+0x30a>
 80019ba:	6b13      	ldr	r3, [r2, #48]	; 0x30
 80019bc:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80019c0:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 80019c4:	d102      	bne.n	80019cc <RCC_GetClocksFreq+0x2fc>
 80019c6:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80019ca:	e006      	b.n	80019da <RCC_GetClocksFreq+0x30a>
 80019cc:	6b13      	ldr	r3, [r2, #48]	; 0x30
 80019ce:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80019d2:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 80019d6:	d101      	bne.n	80019dc <RCC_GetClocksFreq+0x30c>
 80019d8:	4b01      	ldr	r3, [pc, #4]	; (80019e0 <RCC_GetClocksFreq+0x310>)
 80019da:	6483      	str	r3, [r0, #72]	; 0x48
 80019dc:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80019e0:	007a1200 	.word	0x007a1200
 80019e4:	40021000 	.word	0x40021000

080019e8 <RCC_AHBPeriphClockCmd>:
 80019e8:	bf00      	nop
 80019ea:	bf00      	nop
 80019ec:	4b04      	ldr	r3, [pc, #16]	; (8001a00 <RCC_AHBPeriphClockCmd+0x18>)
 80019ee:	695a      	ldr	r2, [r3, #20]
 80019f0:	b109      	cbz	r1, 80019f6 <RCC_AHBPeriphClockCmd+0xe>
 80019f2:	4310      	orrs	r0, r2
 80019f4:	e001      	b.n	80019fa <RCC_AHBPeriphClockCmd+0x12>
 80019f6:	ea22 0000 	bic.w	r0, r2, r0
 80019fa:	6158      	str	r0, [r3, #20]
 80019fc:	4770      	bx	lr
 80019fe:	bf00      	nop
 8001a00:	40021000 	.word	0x40021000

08001a04 <RCC_APB2PeriphClockCmd>:
 8001a04:	bf00      	nop
 8001a06:	bf00      	nop
 8001a08:	4b04      	ldr	r3, [pc, #16]	; (8001a1c <RCC_APB2PeriphClockCmd+0x18>)
 8001a0a:	699a      	ldr	r2, [r3, #24]
 8001a0c:	b109      	cbz	r1, 8001a12 <RCC_APB2PeriphClockCmd+0xe>
 8001a0e:	4310      	orrs	r0, r2
 8001a10:	e001      	b.n	8001a16 <RCC_APB2PeriphClockCmd+0x12>
 8001a12:	ea22 0000 	bic.w	r0, r2, r0
 8001a16:	6198      	str	r0, [r3, #24]
 8001a18:	4770      	bx	lr
 8001a1a:	bf00      	nop
 8001a1c:	40021000 	.word	0x40021000

08001a20 <RCC_APB1PeriphClockCmd>:
 8001a20:	bf00      	nop
 8001a22:	bf00      	nop
 8001a24:	4b04      	ldr	r3, [pc, #16]	; (8001a38 <RCC_APB1PeriphClockCmd+0x18>)
 8001a26:	69da      	ldr	r2, [r3, #28]
 8001a28:	b109      	cbz	r1, 8001a2e <RCC_APB1PeriphClockCmd+0xe>
 8001a2a:	4310      	orrs	r0, r2
 8001a2c:	e001      	b.n	8001a32 <RCC_APB1PeriphClockCmd+0x12>
 8001a2e:	ea22 0000 	bic.w	r0, r2, r0
 8001a32:	61d8      	str	r0, [r3, #28]
 8001a34:	4770      	bx	lr
 8001a36:	bf00      	nop
 8001a38:	40021000 	.word	0x40021000

08001a3c <TIM_TimeBaseInit>:
 8001a3c:	bf00      	nop
 8001a3e:	bf00      	nop
 8001a40:	bf00      	nop
 8001a42:	4a24      	ldr	r2, [pc, #144]	; (8001ad4 <TIM_TimeBaseInit+0x98>)
 8001a44:	8803      	ldrh	r3, [r0, #0]
 8001a46:	4290      	cmp	r0, r2
 8001a48:	b29b      	uxth	r3, r3
 8001a4a:	d012      	beq.n	8001a72 <TIM_TimeBaseInit+0x36>
 8001a4c:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8001a50:	4290      	cmp	r0, r2
 8001a52:	d00e      	beq.n	8001a72 <TIM_TimeBaseInit+0x36>
 8001a54:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001a58:	d00b      	beq.n	8001a72 <TIM_TimeBaseInit+0x36>
 8001a5a:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 8001a5e:	4290      	cmp	r0, r2
 8001a60:	d007      	beq.n	8001a72 <TIM_TimeBaseInit+0x36>
 8001a62:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a66:	4290      	cmp	r0, r2
 8001a68:	d003      	beq.n	8001a72 <TIM_TimeBaseInit+0x36>
 8001a6a:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 8001a6e:	4290      	cmp	r0, r2
 8001a70:	d103      	bne.n	8001a7a <TIM_TimeBaseInit+0x3e>
 8001a72:	884a      	ldrh	r2, [r1, #2]
 8001a74:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001a78:	4313      	orrs	r3, r2
 8001a7a:	4a17      	ldr	r2, [pc, #92]	; (8001ad8 <TIM_TimeBaseInit+0x9c>)
 8001a7c:	4290      	cmp	r0, r2
 8001a7e:	d008      	beq.n	8001a92 <TIM_TimeBaseInit+0x56>
 8001a80:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a84:	4290      	cmp	r0, r2
 8001a86:	d004      	beq.n	8001a92 <TIM_TimeBaseInit+0x56>
 8001a88:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001a8c:	890a      	ldrh	r2, [r1, #8]
 8001a8e:	b29b      	uxth	r3, r3
 8001a90:	4313      	orrs	r3, r2
 8001a92:	8003      	strh	r3, [r0, #0]
 8001a94:	684b      	ldr	r3, [r1, #4]
 8001a96:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001a98:	880b      	ldrh	r3, [r1, #0]
 8001a9a:	8503      	strh	r3, [r0, #40]	; 0x28
 8001a9c:	4b0d      	ldr	r3, [pc, #52]	; (8001ad4 <TIM_TimeBaseInit+0x98>)
 8001a9e:	4298      	cmp	r0, r3
 8001aa0:	d013      	beq.n	8001aca <TIM_TimeBaseInit+0x8e>
 8001aa2:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001aa6:	4298      	cmp	r0, r3
 8001aa8:	d00f      	beq.n	8001aca <TIM_TimeBaseInit+0x8e>
 8001aaa:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 8001aae:	4298      	cmp	r0, r3
 8001ab0:	d00b      	beq.n	8001aca <TIM_TimeBaseInit+0x8e>
 8001ab2:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001ab6:	4298      	cmp	r0, r3
 8001ab8:	d007      	beq.n	8001aca <TIM_TimeBaseInit+0x8e>
 8001aba:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001abe:	4298      	cmp	r0, r3
 8001ac0:	d003      	beq.n	8001aca <TIM_TimeBaseInit+0x8e>
 8001ac2:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001ac6:	4298      	cmp	r0, r3
 8001ac8:	d101      	bne.n	8001ace <TIM_TimeBaseInit+0x92>
 8001aca:	894b      	ldrh	r3, [r1, #10]
 8001acc:	8603      	strh	r3, [r0, #48]	; 0x30
 8001ace:	2301      	movs	r3, #1
 8001ad0:	6143      	str	r3, [r0, #20]
 8001ad2:	4770      	bx	lr
 8001ad4:	40012c00 	.word	0x40012c00
 8001ad8:	40001000 	.word	0x40001000

08001adc <TIM_Cmd>:
 8001adc:	bf00      	nop
 8001ade:	bf00      	nop
 8001ae0:	8803      	ldrh	r3, [r0, #0]
 8001ae2:	b119      	cbz	r1, 8001aec <TIM_Cmd+0x10>
 8001ae4:	b29b      	uxth	r3, r3
 8001ae6:	f043 0301 	orr.w	r3, r3, #1
 8001aea:	e003      	b.n	8001af4 <TIM_Cmd+0x18>
 8001aec:	f023 0301 	bic.w	r3, r3, #1
 8001af0:	041b      	lsls	r3, r3, #16
 8001af2:	0c1b      	lsrs	r3, r3, #16
 8001af4:	8003      	strh	r3, [r0, #0]
 8001af6:	4770      	bx	lr

08001af8 <TIM_ClearITPendingBit>:
 8001af8:	bf00      	nop
 8001afa:	43c9      	mvns	r1, r1
 8001afc:	b289      	uxth	r1, r1
 8001afe:	6101      	str	r1, [r0, #16]
 8001b00:	4770      	bx	lr
	...

08001b04 <timer_init>:
 8001b04:	b530      	push	{r4, r5, lr}
 8001b06:	2300      	movs	r3, #0
 8001b08:	b085      	sub	sp, #20
 8001b0a:	491f      	ldr	r1, [pc, #124]	; (8001b88 <timer_init+0x84>)
 8001b0c:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001b10:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001b14:	491d      	ldr	r1, [pc, #116]	; (8001b8c <timer_init+0x88>)
 8001b16:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001b1a:	4a1d      	ldr	r2, [pc, #116]	; (8001b90 <timer_init+0x8c>)
 8001b1c:	2400      	movs	r4, #0
 8001b1e:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8001b22:	3301      	adds	r3, #1
 8001b24:	2b04      	cmp	r3, #4
 8001b26:	4625      	mov	r5, r4
 8001b28:	d1ef      	bne.n	8001b0a <timer_init+0x6>
 8001b2a:	4b1a      	ldr	r3, [pc, #104]	; (8001b94 <timer_init+0x90>)
 8001b2c:	2002      	movs	r0, #2
 8001b2e:	2101      	movs	r1, #1
 8001b30:	601c      	str	r4, [r3, #0]
 8001b32:	f7ff ff75 	bl	8001a20 <RCC_APB1PeriphClockCmd>
 8001b36:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001b3a:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001b3e:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001b42:	4c15      	ldr	r4, [pc, #84]	; (8001b98 <timer_init+0x94>)
 8001b44:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001b48:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001b4c:	4620      	mov	r0, r4
 8001b4e:	2331      	movs	r3, #49	; 0x31
 8001b50:	a901      	add	r1, sp, #4
 8001b52:	9302      	str	r3, [sp, #8]
 8001b54:	f7ff ff72 	bl	8001a3c <TIM_TimeBaseInit>
 8001b58:	4620      	mov	r0, r4
 8001b5a:	2101      	movs	r1, #1
 8001b5c:	f7ff ffbe 	bl	8001adc <TIM_Cmd>
 8001b60:	68e3      	ldr	r3, [r4, #12]
 8001b62:	f043 0301 	orr.w	r3, r3, #1
 8001b66:	60e3      	str	r3, [r4, #12]
 8001b68:	231d      	movs	r3, #29
 8001b6a:	f88d 3000 	strb.w	r3, [sp]
 8001b6e:	4668      	mov	r0, sp
 8001b70:	2301      	movs	r3, #1
 8001b72:	f88d 5001 	strb.w	r5, [sp, #1]
 8001b76:	f88d 3002 	strb.w	r3, [sp, #2]
 8001b7a:	f88d 3003 	strb.w	r3, [sp, #3]
 8001b7e:	f000 fba3 	bl	80022c8 <NVIC_Init>
 8001b82:	b005      	add	sp, #20
 8001b84:	bd30      	pop	{r4, r5, pc}
 8001b86:	bf00      	nop
 8001b88:	20000e3c 	.word	0x20000e3c
 8001b8c:	20000e30 	.word	0x20000e30
 8001b90:	20000e28 	.word	0x20000e28
 8001b94:	20000e38 	.word	0x20000e38
 8001b98:	40000400 	.word	0x40000400

08001b9c <TIM3_IRQHandler>:
 8001b9c:	2300      	movs	r3, #0
 8001b9e:	4a10      	ldr	r2, [pc, #64]	; (8001be0 <TIM3_IRQHandler+0x44>)
 8001ba0:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001ba4:	b289      	uxth	r1, r1
 8001ba6:	b129      	cbz	r1, 8001bb4 <TIM3_IRQHandler+0x18>
 8001ba8:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001bac:	b289      	uxth	r1, r1
 8001bae:	3901      	subs	r1, #1
 8001bb0:	b289      	uxth	r1, r1
 8001bb2:	e007      	b.n	8001bc4 <TIM3_IRQHandler+0x28>
 8001bb4:	490b      	ldr	r1, [pc, #44]	; (8001be4 <TIM3_IRQHandler+0x48>)
 8001bb6:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001bba:	b289      	uxth	r1, r1
 8001bbc:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001bc0:	4a09      	ldr	r2, [pc, #36]	; (8001be8 <TIM3_IRQHandler+0x4c>)
 8001bc2:	2101      	movs	r1, #1
 8001bc4:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001bc8:	3301      	adds	r3, #1
 8001bca:	2b04      	cmp	r3, #4
 8001bcc:	d1e7      	bne.n	8001b9e <TIM3_IRQHandler+0x2>
 8001bce:	4b07      	ldr	r3, [pc, #28]	; (8001bec <TIM3_IRQHandler+0x50>)
 8001bd0:	4807      	ldr	r0, [pc, #28]	; (8001bf0 <TIM3_IRQHandler+0x54>)
 8001bd2:	681a      	ldr	r2, [r3, #0]
 8001bd4:	2101      	movs	r1, #1
 8001bd6:	3201      	adds	r2, #1
 8001bd8:	601a      	str	r2, [r3, #0]
 8001bda:	f7ff bf8d 	b.w	8001af8 <TIM_ClearITPendingBit>
 8001bde:	bf00      	nop
 8001be0:	20000e3c 	.word	0x20000e3c
 8001be4:	20000e30 	.word	0x20000e30
 8001be8:	20000e28 	.word	0x20000e28
 8001bec:	20000e38 	.word	0x20000e38
 8001bf0:	40000400 	.word	0x40000400

08001bf4 <timer_get_time>:
 8001bf4:	b082      	sub	sp, #8
 8001bf6:	b672      	cpsid	i
 8001bf8:	4b04      	ldr	r3, [pc, #16]	; (8001c0c <timer_get_time+0x18>)
 8001bfa:	681b      	ldr	r3, [r3, #0]
 8001bfc:	9301      	str	r3, [sp, #4]
 8001bfe:	b662      	cpsie	i
 8001c00:	9801      	ldr	r0, [sp, #4]
 8001c02:	230a      	movs	r3, #10
 8001c04:	fbb0 f0f3 	udiv	r0, r0, r3
 8001c08:	b002      	add	sp, #8
 8001c0a:	4770      	bx	lr
 8001c0c:	20000e38 	.word	0x20000e38

08001c10 <timer_delay_ms>:
 8001c10:	b513      	push	{r0, r1, r4, lr}
 8001c12:	4604      	mov	r4, r0
 8001c14:	f7ff ffee 	bl	8001bf4 <timer_get_time>
 8001c18:	4420      	add	r0, r4
 8001c1a:	9001      	str	r0, [sp, #4]
 8001c1c:	9c01      	ldr	r4, [sp, #4]
 8001c1e:	f7ff ffe9 	bl	8001bf4 <timer_get_time>
 8001c22:	4284      	cmp	r4, r0
 8001c24:	d902      	bls.n	8001c2c <timer_delay_ms+0x1c>
 8001c26:	f000 fb4b 	bl	80022c0 <sleep>
 8001c2a:	e7f7      	b.n	8001c1c <timer_delay_ms+0xc>
 8001c2c:	b002      	add	sp, #8
 8001c2e:	bd10      	pop	{r4, pc}

08001c30 <event_timer_set_period>:
 8001c30:	b672      	cpsid	i
 8001c32:	230a      	movs	r3, #10
 8001c34:	4359      	muls	r1, r3
 8001c36:	4b06      	ldr	r3, [pc, #24]	; (8001c50 <event_timer_set_period+0x20>)
 8001c38:	b289      	uxth	r1, r1
 8001c3a:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001c3e:	4b05      	ldr	r3, [pc, #20]	; (8001c54 <event_timer_set_period+0x24>)
 8001c40:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001c44:	4b04      	ldr	r3, [pc, #16]	; (8001c58 <event_timer_set_period+0x28>)
 8001c46:	2200      	movs	r2, #0
 8001c48:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 8001c4c:	b662      	cpsie	i
 8001c4e:	4770      	bx	lr
 8001c50:	20000e3c 	.word	0x20000e3c
 8001c54:	20000e30 	.word	0x20000e30
 8001c58:	20000e28 	.word	0x20000e28

08001c5c <event_timer_wait>:
 8001c5c:	b510      	push	{r4, lr}
 8001c5e:	4604      	mov	r4, r0
 8001c60:	4b06      	ldr	r3, [pc, #24]	; (8001c7c <event_timer_wait+0x20>)
 8001c62:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 8001c66:	b292      	uxth	r2, r2
 8001c68:	b912      	cbnz	r2, 8001c70 <event_timer_wait+0x14>
 8001c6a:	f000 fb29 	bl	80022c0 <sleep>
 8001c6e:	e7f7      	b.n	8001c60 <event_timer_wait+0x4>
 8001c70:	b672      	cpsid	i
 8001c72:	2200      	movs	r2, #0
 8001c74:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 8001c78:	b662      	cpsie	i
 8001c7a:	bd10      	pop	{r4, pc}
 8001c7c:	20000e28 	.word	0x20000e28

08001c80 <USART_Init>:
 8001c80:	b530      	push	{r4, r5, lr}
 8001c82:	4604      	mov	r4, r0
 8001c84:	b099      	sub	sp, #100	; 0x64
 8001c86:	460d      	mov	r5, r1
 8001c88:	bf00      	nop
 8001c8a:	bf00      	nop
 8001c8c:	bf00      	nop
 8001c8e:	bf00      	nop
 8001c90:	bf00      	nop
 8001c92:	bf00      	nop
 8001c94:	bf00      	nop
 8001c96:	6803      	ldr	r3, [r0, #0]
 8001c98:	f023 0301 	bic.w	r3, r3, #1
 8001c9c:	6003      	str	r3, [r0, #0]
 8001c9e:	6842      	ldr	r2, [r0, #4]
 8001ca0:	688b      	ldr	r3, [r1, #8]
 8001ca2:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 8001ca6:	4313      	orrs	r3, r2
 8001ca8:	6043      	str	r3, [r0, #4]
 8001caa:	686a      	ldr	r2, [r5, #4]
 8001cac:	68eb      	ldr	r3, [r5, #12]
 8001cae:	6801      	ldr	r1, [r0, #0]
 8001cb0:	431a      	orrs	r2, r3
 8001cb2:	692b      	ldr	r3, [r5, #16]
 8001cb4:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 8001cb8:	f021 010c 	bic.w	r1, r1, #12
 8001cbc:	4313      	orrs	r3, r2
 8001cbe:	430b      	orrs	r3, r1
 8001cc0:	6003      	str	r3, [r0, #0]
 8001cc2:	6882      	ldr	r2, [r0, #8]
 8001cc4:	696b      	ldr	r3, [r5, #20]
 8001cc6:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 8001cca:	4313      	orrs	r3, r2
 8001ccc:	6083      	str	r3, [r0, #8]
 8001cce:	a801      	add	r0, sp, #4
 8001cd0:	f7ff fcfe 	bl	80016d0 <RCC_GetClocksFreq>
 8001cd4:	4b17      	ldr	r3, [pc, #92]	; (8001d34 <USART_Init+0xb4>)
 8001cd6:	429c      	cmp	r4, r3
 8001cd8:	d101      	bne.n	8001cde <USART_Init+0x5e>
 8001cda:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 8001cdc:	e00e      	b.n	8001cfc <USART_Init+0x7c>
 8001cde:	4b16      	ldr	r3, [pc, #88]	; (8001d38 <USART_Init+0xb8>)
 8001ce0:	429c      	cmp	r4, r3
 8001ce2:	d101      	bne.n	8001ce8 <USART_Init+0x68>
 8001ce4:	9a10      	ldr	r2, [sp, #64]	; 0x40
 8001ce6:	e009      	b.n	8001cfc <USART_Init+0x7c>
 8001ce8:	4b14      	ldr	r3, [pc, #80]	; (8001d3c <USART_Init+0xbc>)
 8001cea:	429c      	cmp	r4, r3
 8001cec:	d101      	bne.n	8001cf2 <USART_Init+0x72>
 8001cee:	9a11      	ldr	r2, [sp, #68]	; 0x44
 8001cf0:	e004      	b.n	8001cfc <USART_Init+0x7c>
 8001cf2:	4b13      	ldr	r3, [pc, #76]	; (8001d40 <USART_Init+0xc0>)
 8001cf4:	429c      	cmp	r4, r3
 8001cf6:	bf0c      	ite	eq
 8001cf8:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 8001cfa:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 8001cfc:	6823      	ldr	r3, [r4, #0]
 8001cfe:	6829      	ldr	r1, [r5, #0]
 8001d00:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 8001d04:	bf18      	it	ne
 8001d06:	0052      	lslne	r2, r2, #1
 8001d08:	fbb2 f3f1 	udiv	r3, r2, r1
 8001d0c:	fb01 2213 	mls	r2, r1, r3, r2
 8001d10:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 8001d14:	6822      	ldr	r2, [r4, #0]
 8001d16:	bf28      	it	cs
 8001d18:	3301      	addcs	r3, #1
 8001d1a:	0412      	lsls	r2, r2, #16
 8001d1c:	d506      	bpl.n	8001d2c <USART_Init+0xac>
 8001d1e:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 8001d22:	f3c3 0142 	ubfx	r1, r3, #1, #3
 8001d26:	401a      	ands	r2, r3
 8001d28:	ea41 0302 	orr.w	r3, r1, r2
 8001d2c:	b29b      	uxth	r3, r3
 8001d2e:	81a3      	strh	r3, [r4, #12]
 8001d30:	b019      	add	sp, #100	; 0x64
 8001d32:	bd30      	pop	{r4, r5, pc}
 8001d34:	40013800 	.word	0x40013800
 8001d38:	40004400 	.word	0x40004400
 8001d3c:	40004800 	.word	0x40004800
 8001d40:	40004c00 	.word	0x40004c00

08001d44 <USART_Cmd>:
 8001d44:	bf00      	nop
 8001d46:	bf00      	nop
 8001d48:	6803      	ldr	r3, [r0, #0]
 8001d4a:	b111      	cbz	r1, 8001d52 <USART_Cmd+0xe>
 8001d4c:	f043 0301 	orr.w	r3, r3, #1
 8001d50:	e001      	b.n	8001d56 <USART_Cmd+0x12>
 8001d52:	f023 0301 	bic.w	r3, r3, #1
 8001d56:	6003      	str	r3, [r0, #0]
 8001d58:	4770      	bx	lr

08001d5a <USART_ReceiveData>:
 8001d5a:	bf00      	nop
 8001d5c:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8001d5e:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8001d62:	4770      	bx	lr

08001d64 <USART_ITConfig>:
 8001d64:	b510      	push	{r4, lr}
 8001d66:	bf00      	nop
 8001d68:	bf00      	nop
 8001d6a:	bf00      	nop
 8001d6c:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8001d70:	2401      	movs	r4, #1
 8001d72:	b2c9      	uxtb	r1, r1
 8001d74:	2b02      	cmp	r3, #2
 8001d76:	fa04 f101 	lsl.w	r1, r4, r1
 8001d7a:	d101      	bne.n	8001d80 <USART_ITConfig+0x1c>
 8001d7c:	3004      	adds	r0, #4
 8001d7e:	e002      	b.n	8001d86 <USART_ITConfig+0x22>
 8001d80:	2b03      	cmp	r3, #3
 8001d82:	bf08      	it	eq
 8001d84:	3008      	addeq	r0, #8
 8001d86:	6803      	ldr	r3, [r0, #0]
 8001d88:	b10a      	cbz	r2, 8001d8e <USART_ITConfig+0x2a>
 8001d8a:	4319      	orrs	r1, r3
 8001d8c:	e001      	b.n	8001d92 <USART_ITConfig+0x2e>
 8001d8e:	ea23 0101 	bic.w	r1, r3, r1
 8001d92:	6001      	str	r1, [r0, #0]
 8001d94:	bd10      	pop	{r4, pc}

08001d96 <USART_GetITStatus>:
 8001d96:	b510      	push	{r4, lr}
 8001d98:	bf00      	nop
 8001d9a:	bf00      	nop
 8001d9c:	2401      	movs	r4, #1
 8001d9e:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8001da2:	b2cb      	uxtb	r3, r1
 8001da4:	42a2      	cmp	r2, r4
 8001da6:	fa04 f303 	lsl.w	r3, r4, r3
 8001daa:	d101      	bne.n	8001db0 <USART_GetITStatus+0x1a>
 8001dac:	6802      	ldr	r2, [r0, #0]
 8001dae:	e003      	b.n	8001db8 <USART_GetITStatus+0x22>
 8001db0:	2a02      	cmp	r2, #2
 8001db2:	bf0c      	ite	eq
 8001db4:	6842      	ldreq	r2, [r0, #4]
 8001db6:	6882      	ldrne	r2, [r0, #8]
 8001db8:	4013      	ands	r3, r2
 8001dba:	69c2      	ldr	r2, [r0, #28]
 8001dbc:	b143      	cbz	r3, 8001dd0 <USART_GetITStatus+0x3a>
 8001dbe:	2301      	movs	r3, #1
 8001dc0:	0c09      	lsrs	r1, r1, #16
 8001dc2:	fa03 f101 	lsl.w	r1, r3, r1
 8001dc6:	4211      	tst	r1, r2
 8001dc8:	bf0c      	ite	eq
 8001dca:	2000      	moveq	r0, #0
 8001dcc:	2001      	movne	r0, #1
 8001dce:	bd10      	pop	{r4, pc}
 8001dd0:	4618      	mov	r0, r3
 8001dd2:	bd10      	pop	{r4, pc}

08001dd4 <USART_ClearITPendingBit>:
 8001dd4:	bf00      	nop
 8001dd6:	bf00      	nop
 8001dd8:	2301      	movs	r3, #1
 8001dda:	0c09      	lsrs	r1, r1, #16
 8001ddc:	fa03 f101 	lsl.w	r1, r3, r1
 8001de0:	6201      	str	r1, [r0, #32]
 8001de2:	4770      	bx	lr

08001de4 <uart_write>:
 8001de4:	4b03      	ldr	r3, [pc, #12]	; (8001df4 <uart_write+0x10>)
 8001de6:	69da      	ldr	r2, [r3, #28]
 8001de8:	0612      	lsls	r2, r2, #24
 8001dea:	d401      	bmi.n	8001df0 <uart_write+0xc>
 8001dec:	bf00      	nop
 8001dee:	e7f9      	b.n	8001de4 <uart_write>
 8001df0:	8518      	strh	r0, [r3, #40]	; 0x28
 8001df2:	4770      	bx	lr
 8001df4:	40013800 	.word	0x40013800

08001df8 <uart_is_char>:
 8001df8:	4b0a      	ldr	r3, [pc, #40]	; (8001e24 <uart_is_char+0x2c>)
 8001dfa:	4a0b      	ldr	r2, [pc, #44]	; (8001e28 <uart_is_char+0x30>)
 8001dfc:	6819      	ldr	r1, [r3, #0]
 8001dfe:	6812      	ldr	r2, [r2, #0]
 8001e00:	4291      	cmp	r1, r2
 8001e02:	d00c      	beq.n	8001e1e <uart_is_char+0x26>
 8001e04:	681a      	ldr	r2, [r3, #0]
 8001e06:	4909      	ldr	r1, [pc, #36]	; (8001e2c <uart_is_char+0x34>)
 8001e08:	5c88      	ldrb	r0, [r1, r2]
 8001e0a:	681a      	ldr	r2, [r3, #0]
 8001e0c:	3201      	adds	r2, #1
 8001e0e:	601a      	str	r2, [r3, #0]
 8001e10:	681a      	ldr	r2, [r3, #0]
 8001e12:	2a0f      	cmp	r2, #15
 8001e14:	b2c0      	uxtb	r0, r0
 8001e16:	d904      	bls.n	8001e22 <uart_is_char+0x2a>
 8001e18:	2200      	movs	r2, #0
 8001e1a:	601a      	str	r2, [r3, #0]
 8001e1c:	4770      	bx	lr
 8001e1e:	f64f 70ff 	movw	r0, #65535	; 0xffff
 8001e22:	4770      	bx	lr
 8001e24:	20000e58 	.word	0x20000e58
 8001e28:	20000e54 	.word	0x20000e54
 8001e2c:	20000e44 	.word	0x20000e44

08001e30 <uart_read>:
 8001e30:	b508      	push	{r3, lr}
 8001e32:	f7ff ffe1 	bl	8001df8 <uart_is_char>
 8001e36:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8001e3a:	4298      	cmp	r0, r3
 8001e3c:	d101      	bne.n	8001e42 <uart_read+0x12>
 8001e3e:	bf00      	nop
 8001e40:	e7f7      	b.n	8001e32 <uart_read+0x2>
 8001e42:	b2c0      	uxtb	r0, r0
 8001e44:	bd08      	pop	{r3, pc}
	...

08001e48 <uart_init>:
 8001e48:	b530      	push	{r4, r5, lr}
 8001e4a:	4b2c      	ldr	r3, [pc, #176]	; (8001efc <uart_init+0xb4>)
 8001e4c:	4d2c      	ldr	r5, [pc, #176]	; (8001f00 <uart_init+0xb8>)
 8001e4e:	2400      	movs	r4, #0
 8001e50:	601c      	str	r4, [r3, #0]
 8001e52:	4b2c      	ldr	r3, [pc, #176]	; (8001f04 <uart_init+0xbc>)
 8001e54:	b08b      	sub	sp, #44	; 0x2c
 8001e56:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001e5a:	2101      	movs	r1, #1
 8001e5c:	601c      	str	r4, [r3, #0]
 8001e5e:	f7ff fdc3 	bl	80019e8 <RCC_AHBPeriphClockCmd>
 8001e62:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001e66:	2101      	movs	r1, #1
 8001e68:	f7ff fdcc 	bl	8001a04 <RCC_APB2PeriphClockCmd>
 8001e6c:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001e70:	9302      	str	r3, [sp, #8]
 8001e72:	2302      	movs	r3, #2
 8001e74:	f88d 300c 	strb.w	r3, [sp, #12]
 8001e78:	a902      	add	r1, sp, #8
 8001e7a:	2303      	movs	r3, #3
 8001e7c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001e80:	f88d 300d 	strb.w	r3, [sp, #13]
 8001e84:	f88d 400e 	strb.w	r4, [sp, #14]
 8001e88:	f88d 400f 	strb.w	r4, [sp, #15]
 8001e8c:	f000 fa61 	bl	8002352 <GPIO_Init>
 8001e90:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001e94:	2109      	movs	r1, #9
 8001e96:	2207      	movs	r2, #7
 8001e98:	f000 faa9 	bl	80023ee <GPIO_PinAFConfig>
 8001e9c:	2207      	movs	r2, #7
 8001e9e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001ea2:	210a      	movs	r1, #10
 8001ea4:	f000 faa3 	bl	80023ee <GPIO_PinAFConfig>
 8001ea8:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001eac:	9304      	str	r3, [sp, #16]
 8001eae:	4628      	mov	r0, r5
 8001eb0:	230c      	movs	r3, #12
 8001eb2:	a904      	add	r1, sp, #16
 8001eb4:	9308      	str	r3, [sp, #32]
 8001eb6:	9405      	str	r4, [sp, #20]
 8001eb8:	9406      	str	r4, [sp, #24]
 8001eba:	9407      	str	r4, [sp, #28]
 8001ebc:	9409      	str	r4, [sp, #36]	; 0x24
 8001ebe:	f7ff fedf 	bl	8001c80 <USART_Init>
 8001ec2:	4628      	mov	r0, r5
 8001ec4:	2101      	movs	r1, #1
 8001ec6:	f7ff ff3d 	bl	8001d44 <USART_Cmd>
 8001eca:	2201      	movs	r2, #1
 8001ecc:	4628      	mov	r0, r5
 8001ece:	490e      	ldr	r1, [pc, #56]	; (8001f08 <uart_init+0xc0>)
 8001ed0:	f7ff ff48 	bl	8001d64 <USART_ITConfig>
 8001ed4:	2325      	movs	r3, #37	; 0x25
 8001ed6:	f88d 4005 	strb.w	r4, [sp, #5]
 8001eda:	f88d 4006 	strb.w	r4, [sp, #6]
 8001ede:	a801      	add	r0, sp, #4
 8001ee0:	2401      	movs	r4, #1
 8001ee2:	f88d 3004 	strb.w	r3, [sp, #4]
 8001ee6:	f88d 4007 	strb.w	r4, [sp, #7]
 8001eea:	f000 f9ed 	bl	80022c8 <NVIC_Init>
 8001eee:	4628      	mov	r0, r5
 8001ef0:	4621      	mov	r1, r4
 8001ef2:	f7ff ff27 	bl	8001d44 <USART_Cmd>
 8001ef6:	b00b      	add	sp, #44	; 0x2c
 8001ef8:	bd30      	pop	{r4, r5, pc}
 8001efa:	bf00      	nop
 8001efc:	20000e54 	.word	0x20000e54
 8001f00:	40013800 	.word	0x40013800
 8001f04:	20000e58 	.word	0x20000e58
 8001f08:	00050105 	.word	0x00050105

08001f0c <USART1_IRQHandler>:
 8001f0c:	b508      	push	{r3, lr}
 8001f0e:	480d      	ldr	r0, [pc, #52]	; (8001f44 <USART1_IRQHandler+0x38>)
 8001f10:	490d      	ldr	r1, [pc, #52]	; (8001f48 <USART1_IRQHandler+0x3c>)
 8001f12:	f7ff ff40 	bl	8001d96 <USART_GetITStatus>
 8001f16:	b178      	cbz	r0, 8001f38 <USART1_IRQHandler+0x2c>
 8001f18:	480a      	ldr	r0, [pc, #40]	; (8001f44 <USART1_IRQHandler+0x38>)
 8001f1a:	f7ff ff1e 	bl	8001d5a <USART_ReceiveData>
 8001f1e:	4b0b      	ldr	r3, [pc, #44]	; (8001f4c <USART1_IRQHandler+0x40>)
 8001f20:	490b      	ldr	r1, [pc, #44]	; (8001f50 <USART1_IRQHandler+0x44>)
 8001f22:	681a      	ldr	r2, [r3, #0]
 8001f24:	b2c0      	uxtb	r0, r0
 8001f26:	5488      	strb	r0, [r1, r2]
 8001f28:	681a      	ldr	r2, [r3, #0]
 8001f2a:	3201      	adds	r2, #1
 8001f2c:	601a      	str	r2, [r3, #0]
 8001f2e:	681a      	ldr	r2, [r3, #0]
 8001f30:	2a0f      	cmp	r2, #15
 8001f32:	bf84      	itt	hi
 8001f34:	2200      	movhi	r2, #0
 8001f36:	601a      	strhi	r2, [r3, #0]
 8001f38:	4802      	ldr	r0, [pc, #8]	; (8001f44 <USART1_IRQHandler+0x38>)
 8001f3a:	4903      	ldr	r1, [pc, #12]	; (8001f48 <USART1_IRQHandler+0x3c>)
 8001f3c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001f40:	f7ff bf48 	b.w	8001dd4 <USART_ClearITPendingBit>
 8001f44:	40013800 	.word	0x40013800
 8001f48:	00050105 	.word	0x00050105
 8001f4c:	20000e54 	.word	0x20000e54
 8001f50:	20000e44 	.word	0x20000e44

08001f54 <uart_clear_buffer>:
 8001f54:	b672      	cpsid	i
 8001f56:	2300      	movs	r3, #0
 8001f58:	4a03      	ldr	r2, [pc, #12]	; (8001f68 <uart_clear_buffer+0x14>)
 8001f5a:	2100      	movs	r1, #0
 8001f5c:	54d1      	strb	r1, [r2, r3]
 8001f5e:	3301      	adds	r3, #1
 8001f60:	2b10      	cmp	r3, #16
 8001f62:	d1f9      	bne.n	8001f58 <uart_clear_buffer+0x4>
 8001f64:	b662      	cpsie	i
 8001f66:	4770      	bx	lr
 8001f68:	20000e44 	.word	0x20000e44

08001f6c <i2c_delay>:
 8001f6c:	230b      	movs	r3, #11
 8001f6e:	3b01      	subs	r3, #1
 8001f70:	d001      	beq.n	8001f76 <i2c_delay+0xa>
 8001f72:	bf00      	nop
 8001f74:	e7fb      	b.n	8001f6e <i2c_delay+0x2>
 8001f76:	4770      	bx	lr

08001f78 <SetLowSDA>:
 8001f78:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001f7a:	4d0d      	ldr	r5, [pc, #52]	; (8001fb0 <SetLowSDA+0x38>)
 8001f7c:	2301      	movs	r3, #1
 8001f7e:	2203      	movs	r2, #3
 8001f80:	2480      	movs	r4, #128	; 0x80
 8001f82:	f88d 3004 	strb.w	r3, [sp, #4]
 8001f86:	f88d 3006 	strb.w	r3, [sp, #6]
 8001f8a:	4628      	mov	r0, r5
 8001f8c:	2300      	movs	r3, #0
 8001f8e:	4669      	mov	r1, sp
 8001f90:	f88d 2005 	strb.w	r2, [sp, #5]
 8001f94:	f88d 3007 	strb.w	r3, [sp, #7]
 8001f98:	9400      	str	r4, [sp, #0]
 8001f9a:	f000 f9da 	bl	8002352 <GPIO_Init>
 8001f9e:	4628      	mov	r0, r5
 8001fa0:	4621      	mov	r1, r4
 8001fa2:	f000 fa20 	bl	80023e6 <GPIO_ResetBits>
 8001fa6:	f7ff ffe1 	bl	8001f6c <i2c_delay>
 8001faa:	b003      	add	sp, #12
 8001fac:	bd30      	pop	{r4, r5, pc}
 8001fae:	bf00      	nop
 8001fb0:	48000400 	.word	0x48000400

08001fb4 <SetHighSDA>:
 8001fb4:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001fb6:	4d0d      	ldr	r5, [pc, #52]	; (8001fec <SetHighSDA+0x38>)
 8001fb8:	2203      	movs	r2, #3
 8001fba:	2300      	movs	r3, #0
 8001fbc:	2480      	movs	r4, #128	; 0x80
 8001fbe:	f88d 2005 	strb.w	r2, [sp, #5]
 8001fc2:	4628      	mov	r0, r5
 8001fc4:	2201      	movs	r2, #1
 8001fc6:	4669      	mov	r1, sp
 8001fc8:	f88d 3004 	strb.w	r3, [sp, #4]
 8001fcc:	f88d 2006 	strb.w	r2, [sp, #6]
 8001fd0:	f88d 3007 	strb.w	r3, [sp, #7]
 8001fd4:	9400      	str	r4, [sp, #0]
 8001fd6:	f000 f9bc 	bl	8002352 <GPIO_Init>
 8001fda:	4628      	mov	r0, r5
 8001fdc:	4621      	mov	r1, r4
 8001fde:	f000 f9fe 	bl	80023de <GPIO_SetBits>
 8001fe2:	f7ff ffc3 	bl	8001f6c <i2c_delay>
 8001fe6:	b003      	add	sp, #12
 8001fe8:	bd30      	pop	{r4, r5, pc}
 8001fea:	bf00      	nop
 8001fec:	48000400 	.word	0x48000400

08001ff0 <SetLowSCL>:
 8001ff0:	b508      	push	{r3, lr}
 8001ff2:	4804      	ldr	r0, [pc, #16]	; (8002004 <SetLowSCL+0x14>)
 8001ff4:	2140      	movs	r1, #64	; 0x40
 8001ff6:	f000 f9f6 	bl	80023e6 <GPIO_ResetBits>
 8001ffa:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001ffe:	f7ff bfb5 	b.w	8001f6c <i2c_delay>
 8002002:	bf00      	nop
 8002004:	48000400 	.word	0x48000400

08002008 <SetHighSCL>:
 8002008:	b508      	push	{r3, lr}
 800200a:	4804      	ldr	r0, [pc, #16]	; (800201c <SetHighSCL+0x14>)
 800200c:	2140      	movs	r1, #64	; 0x40
 800200e:	f000 f9e6 	bl	80023de <GPIO_SetBits>
 8002012:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8002016:	f7ff bfa9 	b.w	8001f6c <i2c_delay>
 800201a:	bf00      	nop
 800201c:	48000400 	.word	0x48000400

08002020 <i2c_0_init>:
 8002020:	b507      	push	{r0, r1, r2, lr}
 8002022:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8002026:	2101      	movs	r1, #1
 8002028:	f7ff fcde 	bl	80019e8 <RCC_AHBPeriphClockCmd>
 800202c:	23c0      	movs	r3, #192	; 0xc0
 800202e:	9300      	str	r3, [sp, #0]
 8002030:	2301      	movs	r3, #1
 8002032:	2203      	movs	r2, #3
 8002034:	480a      	ldr	r0, [pc, #40]	; (8002060 <i2c_0_init+0x40>)
 8002036:	f88d 3004 	strb.w	r3, [sp, #4]
 800203a:	4669      	mov	r1, sp
 800203c:	f88d 3006 	strb.w	r3, [sp, #6]
 8002040:	2300      	movs	r3, #0
 8002042:	f88d 2005 	strb.w	r2, [sp, #5]
 8002046:	f88d 3007 	strb.w	r3, [sp, #7]
 800204a:	f000 f982 	bl	8002352 <GPIO_Init>
 800204e:	f7ff ffdb 	bl	8002008 <SetHighSCL>
 8002052:	f7ff ff91 	bl	8001f78 <SetLowSDA>
 8002056:	f7ff ffad 	bl	8001fb4 <SetHighSDA>
 800205a:	b003      	add	sp, #12
 800205c:	f85d fb04 	ldr.w	pc, [sp], #4
 8002060:	48000400 	.word	0x48000400

08002064 <i2cStart>:
 8002064:	b508      	push	{r3, lr}
 8002066:	f7ff ffcf 	bl	8002008 <SetHighSCL>
 800206a:	f7ff ffa3 	bl	8001fb4 <SetHighSDA>
 800206e:	f7ff ffcb 	bl	8002008 <SetHighSCL>
 8002072:	f7ff ff81 	bl	8001f78 <SetLowSDA>
 8002076:	f7ff ffbb 	bl	8001ff0 <SetLowSCL>
 800207a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800207e:	f7ff bf99 	b.w	8001fb4 <SetHighSDA>

08002082 <i2cStop>:
 8002082:	b508      	push	{r3, lr}
 8002084:	f7ff ffb4 	bl	8001ff0 <SetLowSCL>
 8002088:	f7ff ff76 	bl	8001f78 <SetLowSDA>
 800208c:	f7ff ffbc 	bl	8002008 <SetHighSCL>
 8002090:	f7ff ff72 	bl	8001f78 <SetLowSDA>
 8002094:	f7ff ffb8 	bl	8002008 <SetHighSCL>
 8002098:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800209c:	f7ff bf8a 	b.w	8001fb4 <SetHighSDA>

080020a0 <i2cWrite>:
 80020a0:	b538      	push	{r3, r4, r5, lr}
 80020a2:	4604      	mov	r4, r0
 80020a4:	2508      	movs	r5, #8
 80020a6:	f7ff ffa3 	bl	8001ff0 <SetLowSCL>
 80020aa:	0623      	lsls	r3, r4, #24
 80020ac:	d502      	bpl.n	80020b4 <i2cWrite+0x14>
 80020ae:	f7ff ff81 	bl	8001fb4 <SetHighSDA>
 80020b2:	e001      	b.n	80020b8 <i2cWrite+0x18>
 80020b4:	f7ff ff60 	bl	8001f78 <SetLowSDA>
 80020b8:	3d01      	subs	r5, #1
 80020ba:	f7ff ffa5 	bl	8002008 <SetHighSCL>
 80020be:	0064      	lsls	r4, r4, #1
 80020c0:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80020c4:	b2e4      	uxtb	r4, r4
 80020c6:	d1ee      	bne.n	80020a6 <i2cWrite+0x6>
 80020c8:	f7ff ff92 	bl	8001ff0 <SetLowSCL>
 80020cc:	f7ff ff72 	bl	8001fb4 <SetHighSDA>
 80020d0:	f7ff ff9a 	bl	8002008 <SetHighSCL>
 80020d4:	4b05      	ldr	r3, [pc, #20]	; (80020ec <i2cWrite+0x4c>)
 80020d6:	8a1c      	ldrh	r4, [r3, #16]
 80020d8:	b2a4      	uxth	r4, r4
 80020da:	f7ff ff89 	bl	8001ff0 <SetLowSCL>
 80020de:	f7ff ff45 	bl	8001f6c <i2c_delay>
 80020e2:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 80020e6:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 80020ea:	bd38      	pop	{r3, r4, r5, pc}
 80020ec:	48000400 	.word	0x48000400

080020f0 <i2cRead>:
 80020f0:	b570      	push	{r4, r5, r6, lr}
 80020f2:	4606      	mov	r6, r0
 80020f4:	f7ff ff7c 	bl	8001ff0 <SetLowSCL>
 80020f8:	f7ff ff5c 	bl	8001fb4 <SetHighSDA>
 80020fc:	2508      	movs	r5, #8
 80020fe:	2400      	movs	r4, #0
 8002100:	f7ff ff82 	bl	8002008 <SetHighSCL>
 8002104:	4b0d      	ldr	r3, [pc, #52]	; (800213c <i2cRead+0x4c>)
 8002106:	8a1b      	ldrh	r3, [r3, #16]
 8002108:	0064      	lsls	r4, r4, #1
 800210a:	061a      	lsls	r2, r3, #24
 800210c:	b2e4      	uxtb	r4, r4
 800210e:	bf48      	it	mi
 8002110:	3401      	addmi	r4, #1
 8002112:	f105 35ff 	add.w	r5, r5, #4294967295
 8002116:	bf48      	it	mi
 8002118:	b2e4      	uxtbmi	r4, r4
 800211a:	f7ff ff69 	bl	8001ff0 <SetLowSCL>
 800211e:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8002122:	d1ed      	bne.n	8002100 <i2cRead+0x10>
 8002124:	b10e      	cbz	r6, 800212a <i2cRead+0x3a>
 8002126:	f7ff ff27 	bl	8001f78 <SetLowSDA>
 800212a:	f7ff ff6d 	bl	8002008 <SetHighSCL>
 800212e:	f7ff ff5f 	bl	8001ff0 <SetLowSCL>
 8002132:	f7ff ff1b 	bl	8001f6c <i2c_delay>
 8002136:	4620      	mov	r0, r4
 8002138:	bd70      	pop	{r4, r5, r6, pc}
 800213a:	bf00      	nop
 800213c:	48000400 	.word	0x48000400

08002140 <i2c_write_reg>:
 8002140:	b570      	push	{r4, r5, r6, lr}
 8002142:	4605      	mov	r5, r0
 8002144:	460c      	mov	r4, r1
 8002146:	4616      	mov	r6, r2
 8002148:	f7ff ff8c 	bl	8002064 <i2cStart>
 800214c:	4628      	mov	r0, r5
 800214e:	f7ff ffa7 	bl	80020a0 <i2cWrite>
 8002152:	4620      	mov	r0, r4
 8002154:	f7ff ffa4 	bl	80020a0 <i2cWrite>
 8002158:	4630      	mov	r0, r6
 800215a:	f7ff ffa1 	bl	80020a0 <i2cWrite>
 800215e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8002162:	f7ff bf8e 	b.w	8002082 <i2cStop>

08002166 <i2c_read_reg>:
 8002166:	b538      	push	{r3, r4, r5, lr}
 8002168:	4604      	mov	r4, r0
 800216a:	460d      	mov	r5, r1
 800216c:	f7ff ff7a 	bl	8002064 <i2cStart>
 8002170:	4620      	mov	r0, r4
 8002172:	f7ff ff95 	bl	80020a0 <i2cWrite>
 8002176:	4628      	mov	r0, r5
 8002178:	f7ff ff92 	bl	80020a0 <i2cWrite>
 800217c:	f7ff ff72 	bl	8002064 <i2cStart>
 8002180:	f044 0001 	orr.w	r0, r4, #1
 8002184:	f7ff ff8c 	bl	80020a0 <i2cWrite>
 8002188:	2000      	movs	r0, #0
 800218a:	f7ff ffb1 	bl	80020f0 <i2cRead>
 800218e:	4604      	mov	r4, r0
 8002190:	f7ff ff77 	bl	8002082 <i2cStop>
 8002194:	4620      	mov	r0, r4
 8002196:	bd38      	pop	{r3, r4, r5, pc}

08002198 <SystemInit>:
 8002198:	4b3b      	ldr	r3, [pc, #236]	; (8002288 <SystemInit+0xf0>)
 800219a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800219e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80021a2:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80021a6:	4b39      	ldr	r3, [pc, #228]	; (800228c <SystemInit+0xf4>)
 80021a8:	681a      	ldr	r2, [r3, #0]
 80021aa:	f042 0201 	orr.w	r2, r2, #1
 80021ae:	601a      	str	r2, [r3, #0]
 80021b0:	6859      	ldr	r1, [r3, #4]
 80021b2:	4a37      	ldr	r2, [pc, #220]	; (8002290 <SystemInit+0xf8>)
 80021b4:	400a      	ands	r2, r1
 80021b6:	605a      	str	r2, [r3, #4]
 80021b8:	681a      	ldr	r2, [r3, #0]
 80021ba:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 80021be:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 80021c2:	601a      	str	r2, [r3, #0]
 80021c4:	681a      	ldr	r2, [r3, #0]
 80021c6:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 80021ca:	601a      	str	r2, [r3, #0]
 80021cc:	685a      	ldr	r2, [r3, #4]
 80021ce:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 80021d2:	605a      	str	r2, [r3, #4]
 80021d4:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80021d6:	f022 020f 	bic.w	r2, r2, #15
 80021da:	62da      	str	r2, [r3, #44]	; 0x2c
 80021dc:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80021de:	4a2d      	ldr	r2, [pc, #180]	; (8002294 <SystemInit+0xfc>)
 80021e0:	b082      	sub	sp, #8
 80021e2:	400a      	ands	r2, r1
 80021e4:	631a      	str	r2, [r3, #48]	; 0x30
 80021e6:	2200      	movs	r2, #0
 80021e8:	609a      	str	r2, [r3, #8]
 80021ea:	9200      	str	r2, [sp, #0]
 80021ec:	9201      	str	r2, [sp, #4]
 80021ee:	681a      	ldr	r2, [r3, #0]
 80021f0:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 80021f4:	601a      	str	r2, [r3, #0]
 80021f6:	4b25      	ldr	r3, [pc, #148]	; (800228c <SystemInit+0xf4>)
 80021f8:	681a      	ldr	r2, [r3, #0]
 80021fa:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 80021fe:	9201      	str	r2, [sp, #4]
 8002200:	9a00      	ldr	r2, [sp, #0]
 8002202:	3201      	adds	r2, #1
 8002204:	9200      	str	r2, [sp, #0]
 8002206:	9a01      	ldr	r2, [sp, #4]
 8002208:	b91a      	cbnz	r2, 8002212 <SystemInit+0x7a>
 800220a:	9a00      	ldr	r2, [sp, #0]
 800220c:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8002210:	d1f1      	bne.n	80021f6 <SystemInit+0x5e>
 8002212:	681b      	ldr	r3, [r3, #0]
 8002214:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8002218:	bf18      	it	ne
 800221a:	2301      	movne	r3, #1
 800221c:	9301      	str	r3, [sp, #4]
 800221e:	9b01      	ldr	r3, [sp, #4]
 8002220:	2b01      	cmp	r3, #1
 8002222:	d005      	beq.n	8002230 <SystemInit+0x98>
 8002224:	4b18      	ldr	r3, [pc, #96]	; (8002288 <SystemInit+0xf0>)
 8002226:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 800222a:	609a      	str	r2, [r3, #8]
 800222c:	b002      	add	sp, #8
 800222e:	4770      	bx	lr
 8002230:	4b19      	ldr	r3, [pc, #100]	; (8002298 <SystemInit+0x100>)
 8002232:	2212      	movs	r2, #18
 8002234:	601a      	str	r2, [r3, #0]
 8002236:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 800223a:	685a      	ldr	r2, [r3, #4]
 800223c:	605a      	str	r2, [r3, #4]
 800223e:	685a      	ldr	r2, [r3, #4]
 8002240:	605a      	str	r2, [r3, #4]
 8002242:	685a      	ldr	r2, [r3, #4]
 8002244:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8002248:	605a      	str	r2, [r3, #4]
 800224a:	685a      	ldr	r2, [r3, #4]
 800224c:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8002250:	605a      	str	r2, [r3, #4]
 8002252:	685a      	ldr	r2, [r3, #4]
 8002254:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8002258:	605a      	str	r2, [r3, #4]
 800225a:	681a      	ldr	r2, [r3, #0]
 800225c:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8002260:	601a      	str	r2, [r3, #0]
 8002262:	6819      	ldr	r1, [r3, #0]
 8002264:	4a09      	ldr	r2, [pc, #36]	; (800228c <SystemInit+0xf4>)
 8002266:	0189      	lsls	r1, r1, #6
 8002268:	d5fb      	bpl.n	8002262 <SystemInit+0xca>
 800226a:	6853      	ldr	r3, [r2, #4]
 800226c:	f023 0303 	bic.w	r3, r3, #3
 8002270:	6053      	str	r3, [r2, #4]
 8002272:	6853      	ldr	r3, [r2, #4]
 8002274:	f043 0302 	orr.w	r3, r3, #2
 8002278:	6053      	str	r3, [r2, #4]
 800227a:	4b04      	ldr	r3, [pc, #16]	; (800228c <SystemInit+0xf4>)
 800227c:	685b      	ldr	r3, [r3, #4]
 800227e:	f003 030c 	and.w	r3, r3, #12
 8002282:	2b08      	cmp	r3, #8
 8002284:	d1f9      	bne.n	800227a <SystemInit+0xe2>
 8002286:	e7cd      	b.n	8002224 <SystemInit+0x8c>
 8002288:	e000ed00 	.word	0xe000ed00
 800228c:	40021000 	.word	0x40021000
 8002290:	f87fc00c 	.word	0xf87fc00c
 8002294:	ff00fccc 	.word	0xff00fccc
 8002298:	40022000 	.word	0x40022000

0800229c <sys_tick_init>:
 800229c:	4b05      	ldr	r3, [pc, #20]	; (80022b4 <sys_tick_init+0x18>)
 800229e:	4a06      	ldr	r2, [pc, #24]	; (80022b8 <sys_tick_init+0x1c>)
 80022a0:	605a      	str	r2, [r3, #4]
 80022a2:	4a06      	ldr	r2, [pc, #24]	; (80022bc <sys_tick_init+0x20>)
 80022a4:	21f0      	movs	r1, #240	; 0xf0
 80022a6:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 80022aa:	2200      	movs	r2, #0
 80022ac:	609a      	str	r2, [r3, #8]
 80022ae:	2207      	movs	r2, #7
 80022b0:	601a      	str	r2, [r3, #0]
 80022b2:	4770      	bx	lr
 80022b4:	e000e010 	.word	0xe000e010
 80022b8:	00029040 	.word	0x00029040
 80022bc:	e000ed00 	.word	0xe000ed00

080022c0 <sleep>:
 80022c0:	bf30      	wfi
 80022c2:	4770      	bx	lr

080022c4 <sytem_clock_init>:
 80022c4:	f7ff bf68 	b.w	8002198 <SystemInit>

080022c8 <NVIC_Init>:
 80022c8:	b510      	push	{r4, lr}
 80022ca:	bf00      	nop
 80022cc:	bf00      	nop
 80022ce:	bf00      	nop
 80022d0:	78c2      	ldrb	r2, [r0, #3]
 80022d2:	7803      	ldrb	r3, [r0, #0]
 80022d4:	b30a      	cbz	r2, 800231a <NVIC_Init+0x52>
 80022d6:	4a16      	ldr	r2, [pc, #88]	; (8002330 <NVIC_Init+0x68>)
 80022d8:	7844      	ldrb	r4, [r0, #1]
 80022da:	68d2      	ldr	r2, [r2, #12]
 80022dc:	43d2      	mvns	r2, r2
 80022de:	f3c2 2202 	ubfx	r2, r2, #8, #3
 80022e2:	f1c2 0104 	rsb	r1, r2, #4
 80022e6:	b2c9      	uxtb	r1, r1
 80022e8:	fa04 f101 	lsl.w	r1, r4, r1
 80022ec:	240f      	movs	r4, #15
 80022ee:	fa44 f202 	asr.w	r2, r4, r2
 80022f2:	7884      	ldrb	r4, [r0, #2]
 80022f4:	b2c9      	uxtb	r1, r1
 80022f6:	4022      	ands	r2, r4
 80022f8:	430a      	orrs	r2, r1
 80022fa:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 80022fe:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8002302:	0112      	lsls	r2, r2, #4
 8002304:	b2d2      	uxtb	r2, r2
 8002306:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 800230a:	7803      	ldrb	r3, [r0, #0]
 800230c:	2201      	movs	r2, #1
 800230e:	0959      	lsrs	r1, r3, #5
 8002310:	f003 031f 	and.w	r3, r3, #31
 8002314:	fa02 f303 	lsl.w	r3, r2, r3
 8002318:	e006      	b.n	8002328 <NVIC_Init+0x60>
 800231a:	0959      	lsrs	r1, r3, #5
 800231c:	2201      	movs	r2, #1
 800231e:	f003 031f 	and.w	r3, r3, #31
 8002322:	fa02 f303 	lsl.w	r3, r2, r3
 8002326:	3120      	adds	r1, #32
 8002328:	4a02      	ldr	r2, [pc, #8]	; (8002334 <NVIC_Init+0x6c>)
 800232a:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 800232e:	bd10      	pop	{r4, pc}
 8002330:	e000ed00 	.word	0xe000ed00
 8002334:	e000e100 	.word	0xe000e100

08002338 <lib_low_level_init>:
 8002338:	b508      	push	{r3, lr}
 800233a:	f7ff ffc3 	bl	80022c4 <sytem_clock_init>
 800233e:	f000 f899 	bl	8002474 <gpio_init>
 8002342:	f7ff fd81 	bl	8001e48 <uart_init>
 8002346:	f7ff fbdd 	bl	8001b04 <timer_init>
 800234a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800234e:	f7ff be67 	b.w	8002020 <i2c_0_init>

08002352 <GPIO_Init>:
 8002352:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002354:	bf00      	nop
 8002356:	bf00      	nop
 8002358:	bf00      	nop
 800235a:	bf00      	nop
 800235c:	2300      	movs	r3, #0
 800235e:	680e      	ldr	r6, [r1, #0]
 8002360:	461a      	mov	r2, r3
 8002362:	2501      	movs	r5, #1
 8002364:	4095      	lsls	r5, r2
 8002366:	ea05 0406 	and.w	r4, r5, r6
 800236a:	42ac      	cmp	r4, r5
 800236c:	d131      	bne.n	80023d2 <GPIO_Init+0x80>
 800236e:	790d      	ldrb	r5, [r1, #4]
 8002370:	1e6f      	subs	r7, r5, #1
 8002372:	b2ff      	uxtb	r7, r7
 8002374:	2f01      	cmp	r7, #1
 8002376:	d81c      	bhi.n	80023b2 <GPIO_Init+0x60>
 8002378:	bf00      	nop
 800237a:	f04f 0c03 	mov.w	ip, #3
 800237e:	6887      	ldr	r7, [r0, #8]
 8002380:	fa0c fc03 	lsl.w	ip, ip, r3
 8002384:	ea27 070c 	bic.w	r7, r7, ip
 8002388:	6087      	str	r7, [r0, #8]
 800238a:	f891 c005 	ldrb.w	ip, [r1, #5]
 800238e:	6887      	ldr	r7, [r0, #8]
 8002390:	fa0c fc03 	lsl.w	ip, ip, r3
 8002394:	ea4c 0707 	orr.w	r7, ip, r7
 8002398:	6087      	str	r7, [r0, #8]
 800239a:	bf00      	nop
 800239c:	8887      	ldrh	r7, [r0, #4]
 800239e:	b2bf      	uxth	r7, r7
 80023a0:	ea27 0404 	bic.w	r4, r7, r4
 80023a4:	8084      	strh	r4, [r0, #4]
 80023a6:	798c      	ldrb	r4, [r1, #6]
 80023a8:	8887      	ldrh	r7, [r0, #4]
 80023aa:	4094      	lsls	r4, r2
 80023ac:	433c      	orrs	r4, r7
 80023ae:	b2a4      	uxth	r4, r4
 80023b0:	8084      	strh	r4, [r0, #4]
 80023b2:	2403      	movs	r4, #3
 80023b4:	6807      	ldr	r7, [r0, #0]
 80023b6:	409c      	lsls	r4, r3
 80023b8:	43e4      	mvns	r4, r4
 80023ba:	4027      	ands	r7, r4
 80023bc:	6007      	str	r7, [r0, #0]
 80023be:	6807      	ldr	r7, [r0, #0]
 80023c0:	409d      	lsls	r5, r3
 80023c2:	433d      	orrs	r5, r7
 80023c4:	6005      	str	r5, [r0, #0]
 80023c6:	68c5      	ldr	r5, [r0, #12]
 80023c8:	402c      	ands	r4, r5
 80023ca:	79cd      	ldrb	r5, [r1, #7]
 80023cc:	409d      	lsls	r5, r3
 80023ce:	432c      	orrs	r4, r5
 80023d0:	60c4      	str	r4, [r0, #12]
 80023d2:	3201      	adds	r2, #1
 80023d4:	2a10      	cmp	r2, #16
 80023d6:	f103 0302 	add.w	r3, r3, #2
 80023da:	d1c2      	bne.n	8002362 <GPIO_Init+0x10>
 80023dc:	bdf0      	pop	{r4, r5, r6, r7, pc}

080023de <GPIO_SetBits>:
 80023de:	bf00      	nop
 80023e0:	bf00      	nop
 80023e2:	6181      	str	r1, [r0, #24]
 80023e4:	4770      	bx	lr

080023e6 <GPIO_ResetBits>:
 80023e6:	bf00      	nop
 80023e8:	bf00      	nop
 80023ea:	8501      	strh	r1, [r0, #40]	; 0x28
 80023ec:	4770      	bx	lr

080023ee <GPIO_PinAFConfig>:
 80023ee:	b510      	push	{r4, lr}
 80023f0:	bf00      	nop
 80023f2:	bf00      	nop
 80023f4:	bf00      	nop
 80023f6:	f001 0307 	and.w	r3, r1, #7
 80023fa:	08c9      	lsrs	r1, r1, #3
 80023fc:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8002400:	009b      	lsls	r3, r3, #2
 8002402:	6a04      	ldr	r4, [r0, #32]
 8002404:	210f      	movs	r1, #15
 8002406:	4099      	lsls	r1, r3
 8002408:	ea24 0101 	bic.w	r1, r4, r1
 800240c:	6201      	str	r1, [r0, #32]
 800240e:	6a01      	ldr	r1, [r0, #32]
 8002410:	fa02 f303 	lsl.w	r3, r2, r3
 8002414:	430b      	orrs	r3, r1
 8002416:	6203      	str	r3, [r0, #32]
 8002418:	bd10      	pop	{r4, pc}
	...

0800241c <led_on>:
 800241c:	0401      	lsls	r1, r0, #16
 800241e:	d503      	bpl.n	8002428 <led_on+0xc>
 8002420:	4b08      	ldr	r3, [pc, #32]	; (8002444 <led_on+0x28>)
 8002422:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8002426:	619a      	str	r2, [r3, #24]
 8002428:	0702      	lsls	r2, r0, #28
 800242a:	d503      	bpl.n	8002434 <led_on+0x18>
 800242c:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002430:	2208      	movs	r2, #8
 8002432:	851a      	strh	r2, [r3, #40]	; 0x28
 8002434:	07c3      	lsls	r3, r0, #31
 8002436:	d503      	bpl.n	8002440 <led_on+0x24>
 8002438:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800243c:	2201      	movs	r2, #1
 800243e:	619a      	str	r2, [r3, #24]
 8002440:	4770      	bx	lr
 8002442:	bf00      	nop
 8002444:	48000400 	.word	0x48000400

08002448 <led_off>:
 8002448:	0402      	lsls	r2, r0, #16
 800244a:	d503      	bpl.n	8002454 <led_off+0xc>
 800244c:	4b08      	ldr	r3, [pc, #32]	; (8002470 <led_off+0x28>)
 800244e:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8002452:	851a      	strh	r2, [r3, #40]	; 0x28
 8002454:	0703      	lsls	r3, r0, #28
 8002456:	d503      	bpl.n	8002460 <led_off+0x18>
 8002458:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 800245c:	2208      	movs	r2, #8
 800245e:	619a      	str	r2, [r3, #24]
 8002460:	07c0      	lsls	r0, r0, #31
 8002462:	d503      	bpl.n	800246c <led_off+0x24>
 8002464:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8002468:	2201      	movs	r2, #1
 800246a:	851a      	strh	r2, [r3, #40]	; 0x28
 800246c:	4770      	bx	lr
 800246e:	bf00      	nop
 8002470:	48000400 	.word	0x48000400

08002474 <gpio_init>:
 8002474:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 8002478:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 800247c:	2101      	movs	r1, #1
 800247e:	f7ff fab3 	bl	80019e8 <RCC_AHBPeriphClockCmd>
 8002482:	f8df 90a8 	ldr.w	r9, [pc, #168]	; 800252c <gpio_init+0xb8>
 8002486:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 800248a:	2101      	movs	r1, #1
 800248c:	f7ff faac 	bl	80019e8 <RCC_AHBPeriphClockCmd>
 8002490:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 8002494:	2101      	movs	r1, #1
 8002496:	f7ff faa7 	bl	80019e8 <RCC_AHBPeriphClockCmd>
 800249a:	2400      	movs	r4, #0
 800249c:	2501      	movs	r5, #1
 800249e:	2603      	movs	r6, #3
 80024a0:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 80024a4:	4648      	mov	r0, r9
 80024a6:	4669      	mov	r1, sp
 80024a8:	2708      	movs	r7, #8
 80024aa:	f8cd 8000 	str.w	r8, [sp]
 80024ae:	f88d 5004 	strb.w	r5, [sp, #4]
 80024b2:	f88d 4006 	strb.w	r4, [sp, #6]
 80024b6:	f88d 6005 	strb.w	r6, [sp, #5]
 80024ba:	f88d 4007 	strb.w	r4, [sp, #7]
 80024be:	f7ff ff48 	bl	8002352 <GPIO_Init>
 80024c2:	4669      	mov	r1, sp
 80024c4:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80024c8:	9700      	str	r7, [sp, #0]
 80024ca:	f88d 5004 	strb.w	r5, [sp, #4]
 80024ce:	f88d 4006 	strb.w	r4, [sp, #6]
 80024d2:	f88d 6005 	strb.w	r6, [sp, #5]
 80024d6:	f88d 4007 	strb.w	r4, [sp, #7]
 80024da:	f7ff ff3a 	bl	8002352 <GPIO_Init>
 80024de:	4669      	mov	r1, sp
 80024e0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80024e4:	9500      	str	r5, [sp, #0]
 80024e6:	f88d 5004 	strb.w	r5, [sp, #4]
 80024ea:	f88d 4006 	strb.w	r4, [sp, #6]
 80024ee:	f88d 6005 	strb.w	r6, [sp, #5]
 80024f2:	f88d 4007 	strb.w	r4, [sp, #7]
 80024f6:	f7ff ff2c 	bl	8002352 <GPIO_Init>
 80024fa:	f44f 7300 	mov.w	r3, #512	; 0x200
 80024fe:	4669      	mov	r1, sp
 8002500:	4648      	mov	r0, r9
 8002502:	9300      	str	r3, [sp, #0]
 8002504:	f88d 4004 	strb.w	r4, [sp, #4]
 8002508:	f88d 6005 	strb.w	r6, [sp, #5]
 800250c:	f88d 4007 	strb.w	r4, [sp, #7]
 8002510:	f7ff ff1f 	bl	8002352 <GPIO_Init>
 8002514:	4640      	mov	r0, r8
 8002516:	f7ff ff81 	bl	800241c <led_on>
 800251a:	4638      	mov	r0, r7
 800251c:	f7ff ff94 	bl	8002448 <led_off>
 8002520:	4628      	mov	r0, r5
 8002522:	f7ff ff91 	bl	8002448 <led_off>
 8002526:	b003      	add	sp, #12
 8002528:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800252c:	48000400 	.word	0x48000400

08002530 <get_key>:
 8002530:	4b02      	ldr	r3, [pc, #8]	; (800253c <get_key+0xc>)
 8002532:	8a18      	ldrh	r0, [r3, #16]
 8002534:	43c0      	mvns	r0, r0
 8002536:	f400 7000 	and.w	r0, r0, #512	; 0x200
 800253a:	4770      	bx	lr
 800253c:	48000400 	.word	0x48000400

08002540 <Default_Handler>:
 8002540:	4668      	mov	r0, sp
 8002542:	f020 0107 	bic.w	r1, r0, #7
 8002546:	468d      	mov	sp, r1
 8002548:	bf00      	nop
 800254a:	e7fd      	b.n	8002548 <Default_Handler+0x8>

0800254c <HardFault_Handler>:
 800254c:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8002550:	f7ff ff64 	bl	800241c <led_on>
 8002554:	4b06      	ldr	r3, [pc, #24]	; (8002570 <HardFault_Handler+0x24>)
 8002556:	3b01      	subs	r3, #1
 8002558:	d001      	beq.n	800255e <HardFault_Handler+0x12>
 800255a:	bf00      	nop
 800255c:	e7fb      	b.n	8002556 <HardFault_Handler+0xa>
 800255e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8002562:	f7ff ff71 	bl	8002448 <led_off>
 8002566:	4b02      	ldr	r3, [pc, #8]	; (8002570 <HardFault_Handler+0x24>)
 8002568:	3b01      	subs	r3, #1
 800256a:	d0ef      	beq.n	800254c <HardFault_Handler>
 800256c:	bf00      	nop
 800256e:	e7fb      	b.n	8002568 <HardFault_Handler+0x1c>
 8002570:	00989681 	.word	0x00989681

08002574 <_reset_init>:
 8002574:	4a0e      	ldr	r2, [pc, #56]	; (80025b0 <_reset_init+0x3c>)
 8002576:	480f      	ldr	r0, [pc, #60]	; (80025b4 <_reset_init+0x40>)
 8002578:	1a80      	subs	r0, r0, r2
 800257a:	1080      	asrs	r0, r0, #2
 800257c:	2300      	movs	r3, #0
 800257e:	4283      	cmp	r3, r0
 8002580:	d006      	beq.n	8002590 <_reset_init+0x1c>
 8002582:	490d      	ldr	r1, [pc, #52]	; (80025b8 <_reset_init+0x44>)
 8002584:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8002588:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 800258c:	3301      	adds	r3, #1
 800258e:	e7f6      	b.n	800257e <_reset_init+0xa>
 8002590:	4b0a      	ldr	r3, [pc, #40]	; (80025bc <_reset_init+0x48>)
 8002592:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8002596:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800259a:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800259e:	f503 730c 	add.w	r3, r3, #560	; 0x230
 80025a2:	685a      	ldr	r2, [r3, #4]
 80025a4:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 80025a8:	605a      	str	r2, [r3, #4]
 80025aa:	f7ff b87d 	b.w	80016a8 <main>
 80025ae:	bf00      	nop
 80025b0:	20000000 	.word	0x20000000
 80025b4:	20000030 	.word	0x20000030
 80025b8:	08002778 	.word	0x08002778
 80025bc:	e000ed00 	.word	0xe000ed00

080025c0 <_init>:
 80025c0:	e1a0c00d 	mov	ip, sp
 80025c4:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80025c8:	e24cb004 	sub	fp, ip, #4
 80025cc:	e24bd028 	sub	sp, fp, #40	; 0x28
 80025d0:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80025d4:	e12fff1e 	bx	lr

080025d8 <_fini>:
 80025d8:	e1a0c00d 	mov	ip, sp
 80025dc:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80025e0:	e24cb004 	sub	fp, ip, #4
 80025e4:	e24bd028 	sub	sp, fp, #40	; 0x28
 80025e8:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80025ec:	e12fff1e 	bx	lr
 80025f0:	69647473 	.word	0x69647473
 80025f4:	6e69206f 	.word	0x6e69206f
 80025f8:	64207469 	.word	0x64207469
 80025fc:	0a656e6f 	.word	0x0a656e6f
 8002600:	00          	.byte	0x00
 8002601:	41          	.byte	0x41
 8002602:	2b54      	.short	0x2b54
 8002604:	4d504943 	.word	0x4d504943
 8002608:	313d5855 	.word	0x313d5855
 800260c:	41000a0d 	.word	0x41000a0d
 8002610:	49432b54 	.word	0x49432b54
 8002614:	58554d50 	.word	0x58554d50
 8002618:	0a0d303d 	.word	0x0a0d303d
 800261c:	2b544100 	.word	0x2b544100
 8002620:	4f4d5743 	.word	0x4f4d5743
 8002624:	313d4544 	.word	0x313d4544
 8002628:	41000a0d 	.word	0x41000a0d
 800262c:	57432b54 	.word	0x57432b54
 8002630:	3d50414a 	.word	0x3d50414a
 8002634:	69640022 	.word	0x69640022
 8002638:	6e6f6373 	.word	0x6e6f6373
 800263c:	7463656e 	.word	0x7463656e
 8002640:	76006465 	.word	0x76006465
 8002644:	68797265 	.word	0x68797265
 8002648:	00647261 	.word	0x00647261
 800264c:	000a0d22 	.word	0x000a0d22
 8002650:	432b5441 	.word	0x432b5441
 8002654:	45535049 	.word	0x45535049
 8002658:	52455652 	.word	0x52455652
 800265c:	382c313d 	.word	0x382c313d
 8002660:	000a0d30 	.word	0x000a0d30
 8002664:	432b5441 	.word	0x432b5441
 8002668:	54535049 	.word	0x54535049
 800266c:	3d545241 	.word	0x3d545241
 8002670:	50435422 	.word	0x50435422
 8002674:	00222c22 	.word	0x00222c22
 8002678:	41002c22 	.word	0x41002c22
 800267c:	49432b54 	.word	0x49432b54
 8002680:	4e455350 	.word	0x4e455350
 8002684:	3e003d44 	.word	0x3e003d44
 8002688:	2b544100 	.word	0x2b544100
 800268c:	43504943 	.word	0x43504943
 8002690:	45534f4c 	.word	0x45534f4c
 8002694:	53000a0d 	.word	0x53000a0d
 8002698:	20444e45 	.word	0x20444e45
 800269c:	2b004b4f 	.word	0x2b004b4f
 80026a0:	2c445049 	.word	0x2c445049
 80026a4:	00000000 	.word	0x00000000
 80026a8:	00000020 	.word	0x00000020
 80026ac:	00000040 	.word	0x00000040
 80026b0:	00000060 	.word	0x00000060
 80026b4:	00000080 	.word	0x00000080
 80026b8:	2e323931 	.word	0x2e323931
 80026bc:	2e383631 	.word	0x2e383631
 80026c0:	00322e32 	.word	0x00322e32
 80026c4:	38707365 	.word	0x38707365
 80026c8:	20363632 	.word	0x20363632
 80026cc:	7373656d 	.word	0x7373656d
 80026d0:	00656761 	.word	0x00656761
 80026d4:	6f727265 	.word	0x6f727265
 80026d8:	6f632072 	.word	0x6f632072
 80026dc:	25206564 	.word	0x25206564
 80026e0:	75253a75 	.word	0x75253a75
 80026e4:	000a      	.short	0x000a
 80026e6:	534c      	.short	0x534c
 80026e8:	5344394d 	.word	0x5344394d
 80026ec:	203a2030 	.word	0x203a2030
 80026f0:	20692500 	.word	0x20692500
 80026f4:	25206925 	.word	0x25206925
 80026f8:	202c2069 	.word	0x202c2069
 80026fc:	20692500 	.word	0x20692500
 8002700:	25206925 	.word	0x25206925
 8002704:	520a0069 	.word	0x520a0069
 8002708:	73204247 	.word	0x73204247
 800270c:	61667275 	.word	0x61667275
 8002710:	3a206563 	.word	0x3a206563
 8002714:	520a0020 	.word	0x520a0020
 8002718:	2500203a 	.word	0x2500203a
 800271c:	0a002069 	.word	0x0a002069
 8002720:	00203a47 	.word	0x00203a47
 8002724:	203a420a 	.word	0x203a420a
 8002728:	000a0a00 	.word	0x000a0a00
 800272c:	25206925 	.word	0x25206925
 8002730:	69252069 	.word	0x69252069
 8002734:	000a      	.short	0x000a
 8002736:	770a      	.short	0x770a
 8002738:	6f636c65 	.word	0x6f636c65
 800273c:	7420656d 	.word	0x7420656d
 8002740:	7553206f 	.word	0x7553206f
 8002744:	6168757a 	.word	0x6168757a
 8002748:	5e20534f 	.word	0x5e20534f
 800274c:	32205e5f 	.word	0x32205e5f
 8002750:	362e302e 	.word	0x362e302e
 8002754:	4955420a 	.word	0x4955420a
 8002758:	4120444c 	.word	0x4120444c
 800275c:	20207270 	.word	0x20207270
 8002760:	30322036 	.word	0x30322036
 8002764:	31203631 	.word	0x31203631
 8002768:	33313a33 	.word	0x33313a33
 800276c:	0a32313a 	.word	0x0a32313a
 8002770:	00000000 	.word	0x00000000

08002774 <__EH_FRAME_BEGIN__>:
 8002774:	00000000                                ....
