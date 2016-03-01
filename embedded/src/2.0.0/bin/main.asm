
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
 80001aa:	f001 ff45 	bl	8002038 <sleep>
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
 8000282:	f001 fec7 	bl	8002014 <sys_tick_init>
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
 80003fe:	f001 fbb1 	bl	8001b64 <uart_write>
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
 80005d4:	08002368 	.word	0x08002368

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
 8000652:	f001 fa87 	bl	8001b64 <uart_write>
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
 8000690:	f001 f970 	bl	8001974 <timer_get_time>
 8000694:	4405      	add	r5, r0
 8000696:	f001 fb1d 	bl	8001cd4 <uart_clear_buffer>
 800069a:	2400      	movs	r4, #0
 800069c:	f001 fa6c 	bl	8001b78 <uart_is_char>
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
 80006b8:	f001 fb0c 	bl	8001cd4 <uart_clear_buffer>
 80006bc:	2001      	movs	r0, #1
 80006be:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80006c0:	2400      	movs	r4, #0
 80006c2:	f001 f957 	bl	8001974 <timer_get_time>
 80006c6:	42a8      	cmp	r0, r5
 80006c8:	d3e8      	bcc.n	800069c <esp8266_find_stream+0x14>
 80006ca:	f001 fb03 	bl	8001cd4 <uart_clear_buffer>
 80006ce:	2000      	movs	r0, #0
 80006d0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

080006d4 <esp8266_init>:
 80006d4:	b510      	push	{r4, lr}
 80006d6:	4604      	mov	r4, r0
 80006d8:	f640 30b8 	movw	r0, #3000	; 0xbb8
 80006dc:	f001 f958 	bl	8001990 <timer_delay_ms>
 80006e0:	b10c      	cbz	r4, 80006e6 <esp8266_init+0x12>
 80006e2:	4818      	ldr	r0, [pc, #96]	; (8000744 <esp8266_init+0x70>)
 80006e4:	e000      	b.n	80006e8 <esp8266_init+0x14>
 80006e6:	4818      	ldr	r0, [pc, #96]	; (8000748 <esp8266_init+0x74>)
 80006e8:	f7ff ffae 	bl	8000648 <esp8266_send>
 80006ec:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006f0:	f001 f94e 	bl	8001990 <timer_delay_ms>
 80006f4:	4815      	ldr	r0, [pc, #84]	; (800074c <esp8266_init+0x78>)
 80006f6:	f7ff ffa7 	bl	8000648 <esp8266_send>
 80006fa:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006fe:	f001 f947 	bl	8001990 <timer_delay_ms>
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
 8000738:	f001 f92a 	bl	8001990 <timer_delay_ms>
 800073c:	2000      	movs	r0, #0
 800073e:	bd10      	pop	{r4, pc}
 8000740:	2002      	movs	r0, #2
 8000742:	bd10      	pop	{r4, pc}
 8000744:	08002379 	.word	0x08002379
 8000748:	08002387 	.word	0x08002387
 800074c:	08002395 	.word	0x08002395
 8000750:	080023a3 	.word	0x080023a3
 8000754:	080023ae 	.word	0x080023ae
 8000758:	080023ec 	.word	0x080023ec
 800075c:	080023bb 	.word	0x080023bb
 8000760:	080023c4 	.word	0x080023c4
 8000764:	08002414 	.word	0x08002414
 8000768:	080023c8 	.word	0x080023c8

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
 8000786:	f001 f8f5 	bl	8001974 <timer_get_time>
 800078a:	4405      	add	r5, r0
 800078c:	f001 f9f4 	bl	8001b78 <uart_is_char>
 8000790:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8000794:	4298      	cmp	r0, r3
 8000796:	bf1c      	itt	ne
 8000798:	5530      	strbne	r0, [r6, r4]
 800079a:	3401      	addne	r4, #1
 800079c:	f001 f8ea 	bl	8001974 <timer_get_time>
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
 8000828:	f001 f8b2 	bl	8001990 <timer_delay_ms>
 800082c:	2004      	movs	r0, #4
 800082e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000830:	42ac      	cmp	r4, r5
 8000832:	d004      	beq.n	800083e <esp8266_connect+0x7a>
 8000834:	f814 0b01 	ldrb.w	r0, [r4], #1
 8000838:	f001 f994 	bl	8001b64 <uart_write>
 800083c:	e7f8      	b.n	8000830 <esp8266_connect+0x6c>
 800083e:	4823      	ldr	r0, [pc, #140]	; (80008cc <esp8266_connect+0x108>)
 8000840:	2107      	movs	r1, #7
 8000842:	2264      	movs	r2, #100	; 0x64
 8000844:	f7ff ff20 	bl	8000688 <esp8266_find_stream>
 8000848:	b938      	cbnz	r0, 800085a <esp8266_connect+0x96>
 800084a:	481f      	ldr	r0, [pc, #124]	; (80008c8 <esp8266_connect+0x104>)
 800084c:	f7ff fefc 	bl	8000648 <esp8266_send>
 8000850:	2064      	movs	r0, #100	; 0x64
 8000852:	f001 f89d 	bl	8001990 <timer_delay_ms>
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
 8000872:	f001 f88d 	bl	8001990 <timer_delay_ms>
 8000876:	2006      	movs	r0, #6
 8000878:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800087a:	f001 f999 	bl	8001bb0 <uart_read>
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
 80008a0:	f001 f876 	bl	8001990 <timer_delay_ms>
 80008a4:	f504 707a 	add.w	r0, r4, #1000	; 0x3e8
 80008a8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008aa:	2003      	movs	r0, #3
 80008ac:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80008ae:	bf00      	nop
 80008b0:	080023dc 	.word	0x080023dc
 80008b4:	080023f0 	.word	0x080023f0
 80008b8:	080023c5 	.word	0x080023c5
 80008bc:	08002414 	.word	0x08002414
 80008c0:	080023f3 	.word	0x080023f3
 80008c4:	080023ff 	.word	0x080023ff
 80008c8:	08002401 	.word	0x08002401
 80008cc:	0800240f 	.word	0x0800240f
 80008d0:	08002417 	.word	0x08002417

080008d4 <motors_uninit>:
 80008d4:	b508      	push	{r3, lr}
 80008d6:	20c0      	movs	r0, #192	; 0xc0
 80008d8:	2100      	movs	r1, #0
 80008da:	2218      	movs	r2, #24
 80008dc:	f001 faec 	bl	8001eb8 <i2c_write_reg>
 80008e0:	20c2      	movs	r0, #194	; 0xc2
 80008e2:	2100      	movs	r1, #0
 80008e4:	2218      	movs	r2, #24
 80008e6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80008ea:	f001 bae5 	b.w	8001eb8 <i2c_write_reg>
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
 8000958:	f001 faae 	bl	8001eb8 <i2c_write_reg>
 800095c:	20c0      	movs	r0, #192	; 0xc0
 800095e:	2100      	movs	r1, #0
 8000960:	462a      	mov	r2, r5
 8000962:	f001 faa9 	bl	8001eb8 <i2c_write_reg>
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
 800099e:	f001 fa8b 	bl	8001eb8 <i2c_write_reg>
 80009a2:	4622      	mov	r2, r4
 80009a4:	20c2      	movs	r0, #194	; 0xc2
 80009a6:	2100      	movs	r1, #0
 80009a8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80009ac:	f001 ba84 	b.w	8001eb8 <i2c_write_reg>
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
 80009d4:	f001 fa70 	bl	8001eb8 <i2c_write_reg>
 80009d8:	203c      	movs	r0, #60	; 0x3c
 80009da:	2120      	movs	r1, #32
 80009dc:	2200      	movs	r2, #0
 80009de:	f001 fa6b 	bl	8001eb8 <i2c_write_reg>
 80009e2:	203c      	movs	r0, #60	; 0x3c
 80009e4:	2124      	movs	r1, #36	; 0x24
 80009e6:	2200      	movs	r2, #0
 80009e8:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80009ec:	f001 ba64 	b.w	8001eb8 <i2c_write_reg>

080009f0 <lsm9ds0_read>:
 80009f0:	b538      	push	{r3, r4, r5, lr}
 80009f2:	2128      	movs	r1, #40	; 0x28
 80009f4:	20d4      	movs	r0, #212	; 0xd4
 80009f6:	f001 fa72 	bl	8001ede <i2c_read_reg>
 80009fa:	2129      	movs	r1, #41	; 0x29
 80009fc:	4604      	mov	r4, r0
 80009fe:	20d4      	movs	r0, #212	; 0xd4
 8000a00:	f001 fa6d 	bl	8001ede <i2c_read_reg>
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
 8000a20:	f001 fa5d 	bl	8001ede <i2c_read_reg>
 8000a24:	212b      	movs	r1, #43	; 0x2b
 8000a26:	4605      	mov	r5, r0
 8000a28:	20d4      	movs	r0, #212	; 0xd4
 8000a2a:	f001 fa58 	bl	8001ede <i2c_read_reg>
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
 8000a48:	f001 fa49 	bl	8001ede <i2c_read_reg>
 8000a4c:	212d      	movs	r1, #45	; 0x2d
 8000a4e:	4605      	mov	r5, r0
 8000a50:	20d4      	movs	r0, #212	; 0xd4
 8000a52:	f001 fa44 	bl	8001ede <i2c_read_reg>
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
 8000a70:	f001 fa35 	bl	8001ede <i2c_read_reg>
 8000a74:	2109      	movs	r1, #9
 8000a76:	4605      	mov	r5, r0
 8000a78:	203c      	movs	r0, #60	; 0x3c
 8000a7a:	f001 fa30 	bl	8001ede <i2c_read_reg>
 8000a7e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000a82:	b285      	uxth	r5, r0
 8000a84:	210a      	movs	r1, #10
 8000a86:	203c      	movs	r0, #60	; 0x3c
 8000a88:	80e5      	strh	r5, [r4, #6]
 8000a8a:	f001 fa28 	bl	8001ede <i2c_read_reg>
 8000a8e:	210b      	movs	r1, #11
 8000a90:	4605      	mov	r5, r0
 8000a92:	203c      	movs	r0, #60	; 0x3c
 8000a94:	f001 fa23 	bl	8001ede <i2c_read_reg>
 8000a98:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000a9c:	b285      	uxth	r5, r0
 8000a9e:	210c      	movs	r1, #12
 8000aa0:	203c      	movs	r0, #60	; 0x3c
 8000aa2:	8125      	strh	r5, [r4, #8]
 8000aa4:	f001 fa1b 	bl	8001ede <i2c_read_reg>
 8000aa8:	210d      	movs	r1, #13
 8000aaa:	4605      	mov	r5, r0
 8000aac:	203c      	movs	r0, #60	; 0x3c
 8000aae:	f001 fa16 	bl	8001ede <i2c_read_reg>
 8000ab2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ab6:	b285      	uxth	r5, r0
 8000ab8:	2128      	movs	r1, #40	; 0x28
 8000aba:	203c      	movs	r0, #60	; 0x3c
 8000abc:	8165      	strh	r5, [r4, #10]
 8000abe:	f001 fa0e 	bl	8001ede <i2c_read_reg>
 8000ac2:	2129      	movs	r1, #41	; 0x29
 8000ac4:	4605      	mov	r5, r0
 8000ac6:	203c      	movs	r0, #60	; 0x3c
 8000ac8:	f001 fa09 	bl	8001ede <i2c_read_reg>
 8000acc:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ad0:	b285      	uxth	r5, r0
 8000ad2:	212a      	movs	r1, #42	; 0x2a
 8000ad4:	203c      	movs	r0, #60	; 0x3c
 8000ad6:	8025      	strh	r5, [r4, #0]
 8000ad8:	f001 fa01 	bl	8001ede <i2c_read_reg>
 8000adc:	212b      	movs	r1, #43	; 0x2b
 8000ade:	4605      	mov	r5, r0
 8000ae0:	203c      	movs	r0, #60	; 0x3c
 8000ae2:	f001 f9fc 	bl	8001ede <i2c_read_reg>
 8000ae6:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000aea:	b285      	uxth	r5, r0
 8000aec:	212c      	movs	r1, #44	; 0x2c
 8000aee:	203c      	movs	r0, #60	; 0x3c
 8000af0:	8065      	strh	r5, [r4, #2]
 8000af2:	f001 f9f4 	bl	8001ede <i2c_read_reg>
 8000af6:	212d      	movs	r1, #45	; 0x2d
 8000af8:	4605      	mov	r5, r0
 8000afa:	203c      	movs	r0, #60	; 0x3c
 8000afc:	f001 f9ef 	bl	8001ede <i2c_read_reg>
 8000b00:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b04:	b285      	uxth	r5, r0
 8000b06:	2105      	movs	r1, #5
 8000b08:	203c      	movs	r0, #60	; 0x3c
 8000b0a:	80a5      	strh	r5, [r4, #4]
 8000b0c:	f001 f9e7 	bl	8001ede <i2c_read_reg>
 8000b10:	2106      	movs	r1, #6
 8000b12:	4605      	mov	r5, r0
 8000b14:	203c      	movs	r0, #60	; 0x3c
 8000b16:	f001 f9e2 	bl	8001ede <i2c_read_reg>
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
 8000b56:	f000 ff1b 	bl	8001990 <timer_delay_ms>
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
 8000ba6:	f001 f99a 	bl	8001ede <i2c_read_reg>
 8000baa:	28d4      	cmp	r0, #212	; 0xd4
 8000bac:	4605      	mov	r5, r0
 8000bae:	d137      	bne.n	8000c20 <lsm9ds0_init+0xa0>
 8000bb0:	203c      	movs	r0, #60	; 0x3c
 8000bb2:	210f      	movs	r1, #15
 8000bb4:	f001 f993 	bl	8001ede <i2c_read_reg>
 8000bb8:	2849      	cmp	r0, #73	; 0x49
 8000bba:	d133      	bne.n	8000c24 <lsm9ds0_init+0xa4>
 8000bbc:	4628      	mov	r0, r5
 8000bbe:	2120      	movs	r1, #32
 8000bc0:	22ff      	movs	r2, #255	; 0xff
 8000bc2:	f001 f979 	bl	8001eb8 <i2c_write_reg>
 8000bc6:	4628      	mov	r0, r5
 8000bc8:	2123      	movs	r1, #35	; 0x23
 8000bca:	2218      	movs	r2, #24
 8000bcc:	f001 f974 	bl	8001eb8 <i2c_write_reg>
 8000bd0:	203c      	movs	r0, #60	; 0x3c
 8000bd2:	211f      	movs	r1, #31
 8000bd4:	4622      	mov	r2, r4
 8000bd6:	f001 f96f 	bl	8001eb8 <i2c_write_reg>
 8000bda:	203c      	movs	r0, #60	; 0x3c
 8000bdc:	2120      	movs	r1, #32
 8000bde:	2267      	movs	r2, #103	; 0x67
 8000be0:	f001 f96a 	bl	8001eb8 <i2c_write_reg>
 8000be4:	203c      	movs	r0, #60	; 0x3c
 8000be6:	2121      	movs	r1, #33	; 0x21
 8000be8:	4622      	mov	r2, r4
 8000bea:	f001 f965 	bl	8001eb8 <i2c_write_reg>
 8000bee:	203c      	movs	r0, #60	; 0x3c
 8000bf0:	2124      	movs	r1, #36	; 0x24
 8000bf2:	22f4      	movs	r2, #244	; 0xf4
 8000bf4:	f001 f960 	bl	8001eb8 <i2c_write_reg>
 8000bf8:	203c      	movs	r0, #60	; 0x3c
 8000bfa:	2125      	movs	r1, #37	; 0x25
 8000bfc:	4622      	mov	r2, r4
 8000bfe:	f001 f95b 	bl	8001eb8 <i2c_write_reg>
 8000c02:	203c      	movs	r0, #60	; 0x3c
 8000c04:	2126      	movs	r1, #38	; 0x26
 8000c06:	2280      	movs	r2, #128	; 0x80
 8000c08:	f001 f956 	bl	8001eb8 <i2c_write_reg>
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
 8000c30:	f001 fac6 	bl	80021c0 <led_off>
 8000c34:	2072      	movs	r0, #114	; 0x72
 8000c36:	2180      	movs	r1, #128	; 0x80
 8000c38:	2200      	movs	r2, #0
 8000c3a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000c3e:	f000 b9f6 	b.w	800102e <rgb_i2c_write_reg>
	...

08000c44 <rgb_sensor_read>:
 8000c44:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000c46:	f000 f973 	bl	8000f30 <rgb_i2cStart>
 8000c4a:	2072      	movs	r0, #114	; 0x72
 8000c4c:	4d55      	ldr	r5, [pc, #340]	; (8000da4 <rgb_sensor_read+0x160>)
 8000c4e:	4c56      	ldr	r4, [pc, #344]	; (8000da8 <rgb_sensor_read+0x164>)
 8000c50:	f000 f98c 	bl	8000f6c <rgb_i2cWrite>
 8000c54:	20b4      	movs	r0, #180	; 0xb4
 8000c56:	f000 f989 	bl	8000f6c <rgb_i2cWrite>
 8000c5a:	f000 f969 	bl	8000f30 <rgb_i2cStart>
 8000c5e:	2073      	movs	r0, #115	; 0x73
 8000c60:	f000 f984 	bl	8000f6c <rgb_i2cWrite>
 8000c64:	2001      	movs	r0, #1
 8000c66:	4629      	mov	r1, r5
 8000c68:	f000 f9a0 	bl	8000fac <rgb_i2cRead>
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
 8000c80:	f000 f994 	bl	8000fac <rgb_i2cRead>
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
 8000ca8:	f000 f980 	bl	8000fac <rgb_i2cRead>
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
 8000cc0:	f000 f974 	bl	8000fac <rgb_i2cRead>
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
 8000ce4:	f000 f962 	bl	8000fac <rgb_i2cRead>
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
 8000cfc:	f000 f956 	bl	8000fac <rgb_i2cRead>
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
 8000d22:	f000 f943 	bl	8000fac <rgb_i2cRead>
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
 8000d3a:	f000 f937 	bl	8000fac <rgb_i2cRead>
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
 8000d62:	f000 f923 	bl	8000fac <rgb_i2cRead>
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
 8000d7a:	f000 f917 	bl	8000fac <rgb_i2cRead>
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
 8000d9e:	f000 b8d6 	b.w	8000f4e <rgb_i2cStop>
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
 8000dde:	f001 f9d9 	bl	8002194 <led_on>
 8000de2:	f000 f875 	bl	8000ed0 <rgb_i2c_init>
 8000de6:	2072      	movs	r0, #114	; 0x72
 8000de8:	2181      	movs	r1, #129	; 0x81
 8000dea:	22ff      	movs	r2, #255	; 0xff
 8000dec:	f000 f91f 	bl	800102e <rgb_i2c_write_reg>
 8000df0:	2072      	movs	r0, #114	; 0x72
 8000df2:	2183      	movs	r1, #131	; 0x83
 8000df4:	22ff      	movs	r2, #255	; 0xff
 8000df6:	f000 f91a 	bl	800102e <rgb_i2c_write_reg>
 8000dfa:	2072      	movs	r0, #114	; 0x72
 8000dfc:	218d      	movs	r1, #141	; 0x8d
 8000dfe:	4622      	mov	r2, r4
 8000e00:	f000 f915 	bl	800102e <rgb_i2c_write_reg>
 8000e04:	2072      	movs	r0, #114	; 0x72
 8000e06:	2180      	movs	r1, #128	; 0x80
 8000e08:	2203      	movs	r2, #3
 8000e0a:	f000 f910 	bl	800102e <rgb_i2c_write_reg>
 8000e0e:	ad01      	add	r5, sp, #4
 8000e10:	2072      	movs	r0, #114	; 0x72
 8000e12:	218f      	movs	r1, #143	; 0x8f
 8000e14:	2223      	movs	r2, #35	; 0x23
 8000e16:	f000 f90a 	bl	800102e <rgb_i2c_write_reg>
 8000e1a:	f7ff ff13 	bl	8000c44 <rgb_sensor_read>
 8000e1e:	2072      	movs	r0, #114	; 0x72
 8000e20:	2192      	movs	r1, #146	; 0x92
 8000e22:	462a      	mov	r2, r5
 8000e24:	f000 f916 	bl	8001054 <rgb_i2c_read_reg>
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

08000e48 <rgb_i2c_delay>:
 8000e48:	bf00      	nop
 8000e4a:	4770      	bx	lr

08000e4c <RGBSetLowSDA>:
 8000e4c:	b513      	push	{r0, r1, r4, lr}
 8000e4e:	2301      	movs	r3, #1
 8000e50:	2203      	movs	r2, #3
 8000e52:	24f0      	movs	r4, #240	; 0xf0
 8000e54:	f88d 3004 	strb.w	r3, [sp, #4]
 8000e58:	f88d 3006 	strb.w	r3, [sp, #6]
 8000e5c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000e60:	2300      	movs	r3, #0
 8000e62:	4669      	mov	r1, sp
 8000e64:	f88d 2005 	strb.w	r2, [sp, #5]
 8000e68:	f88d 3007 	strb.w	r3, [sp, #7]
 8000e6c:	9400      	str	r4, [sp, #0]
 8000e6e:	f001 f92c 	bl	80020ca <GPIO_Init>
 8000e72:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000e76:	851c      	strh	r4, [r3, #40]	; 0x28
 8000e78:	f7ff ffe6 	bl	8000e48 <rgb_i2c_delay>
 8000e7c:	b002      	add	sp, #8
 8000e7e:	bd10      	pop	{r4, pc}

08000e80 <RGBSetHighSDA>:
 8000e80:	b513      	push	{r0, r1, r4, lr}
 8000e82:	2300      	movs	r3, #0
 8000e84:	2203      	movs	r2, #3
 8000e86:	24f0      	movs	r4, #240	; 0xf0
 8000e88:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000e8c:	4669      	mov	r1, sp
 8000e8e:	f88d 3004 	strb.w	r3, [sp, #4]
 8000e92:	f88d 2005 	strb.w	r2, [sp, #5]
 8000e96:	f88d 3007 	strb.w	r3, [sp, #7]
 8000e9a:	9400      	str	r4, [sp, #0]
 8000e9c:	f001 f915 	bl	80020ca <GPIO_Init>
 8000ea0:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000ea4:	619c      	str	r4, [r3, #24]
 8000ea6:	f7ff ffcf 	bl	8000e48 <rgb_i2c_delay>
 8000eaa:	b002      	add	sp, #8
 8000eac:	bd10      	pop	{r4, pc}
	...

08000eb0 <RGBSetLowSCL>:
 8000eb0:	4b02      	ldr	r3, [pc, #8]	; (8000ebc <RGBSetLowSCL+0xc>)
 8000eb2:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8000eb6:	851a      	strh	r2, [r3, #40]	; 0x28
 8000eb8:	f7ff bfc6 	b.w	8000e48 <rgb_i2c_delay>
 8000ebc:	48000800 	.word	0x48000800

08000ec0 <RGBSetHighSCL>:
 8000ec0:	4b02      	ldr	r3, [pc, #8]	; (8000ecc <RGBSetHighSCL+0xc>)
 8000ec2:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 8000ec6:	619a      	str	r2, [r3, #24]
 8000ec8:	f7ff bfbe 	b.w	8000e48 <rgb_i2c_delay>
 8000ecc:	48000800 	.word	0x48000800

08000ed0 <rgb_i2c_init>:
 8000ed0:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8000ed2:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000ed6:	2400      	movs	r4, #0
 8000ed8:	9300      	str	r3, [sp, #0]
 8000eda:	2603      	movs	r6, #3
 8000edc:	2301      	movs	r3, #1
 8000ede:	4669      	mov	r1, sp
 8000ee0:	4812      	ldr	r0, [pc, #72]	; (8000f2c <rgb_i2c_init+0x5c>)
 8000ee2:	f88d 3004 	strb.w	r3, [sp, #4]
 8000ee6:	25f0      	movs	r5, #240	; 0xf0
 8000ee8:	f88d 6005 	strb.w	r6, [sp, #5]
 8000eec:	f88d 4006 	strb.w	r4, [sp, #6]
 8000ef0:	f88d 4007 	strb.w	r4, [sp, #7]
 8000ef4:	f001 f8e9 	bl	80020ca <GPIO_Init>
 8000ef8:	4669      	mov	r1, sp
 8000efa:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000efe:	9500      	str	r5, [sp, #0]
 8000f00:	f88d 4004 	strb.w	r4, [sp, #4]
 8000f04:	f88d 6005 	strb.w	r6, [sp, #5]
 8000f08:	f88d 4007 	strb.w	r4, [sp, #7]
 8000f0c:	f001 f8dd 	bl	80020ca <GPIO_Init>
 8000f10:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000f14:	4629      	mov	r1, r5
 8000f16:	f001 f91e 	bl	8002156 <GPIO_SetBits>
 8000f1a:	f7ff ffd1 	bl	8000ec0 <RGBSetHighSCL>
 8000f1e:	f7ff ff95 	bl	8000e4c <RGBSetLowSDA>
 8000f22:	f7ff ffad 	bl	8000e80 <RGBSetHighSDA>
 8000f26:	b002      	add	sp, #8
 8000f28:	bd70      	pop	{r4, r5, r6, pc}
 8000f2a:	bf00      	nop
 8000f2c:	48000800 	.word	0x48000800

08000f30 <rgb_i2cStart>:
 8000f30:	b508      	push	{r3, lr}
 8000f32:	f7ff ffc5 	bl	8000ec0 <RGBSetHighSCL>
 8000f36:	f7ff ffa3 	bl	8000e80 <RGBSetHighSDA>
 8000f3a:	f7ff ffc1 	bl	8000ec0 <RGBSetHighSCL>
 8000f3e:	f7ff ff85 	bl	8000e4c <RGBSetLowSDA>
 8000f42:	f7ff ffb5 	bl	8000eb0 <RGBSetLowSCL>
 8000f46:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000f4a:	f7ff bf99 	b.w	8000e80 <RGBSetHighSDA>

08000f4e <rgb_i2cStop>:
 8000f4e:	b508      	push	{r3, lr}
 8000f50:	f7ff ffae 	bl	8000eb0 <RGBSetLowSCL>
 8000f54:	f7ff ff7a 	bl	8000e4c <RGBSetLowSDA>
 8000f58:	f7ff ffb2 	bl	8000ec0 <RGBSetHighSCL>
 8000f5c:	f7ff ff76 	bl	8000e4c <RGBSetLowSDA>
 8000f60:	f7ff ffae 	bl	8000ec0 <RGBSetHighSCL>
 8000f64:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000f68:	f7ff bf8a 	b.w	8000e80 <RGBSetHighSDA>

08000f6c <rgb_i2cWrite>:
 8000f6c:	b538      	push	{r3, r4, r5, lr}
 8000f6e:	4604      	mov	r4, r0
 8000f70:	2508      	movs	r5, #8
 8000f72:	f7ff ff9d 	bl	8000eb0 <RGBSetLowSCL>
 8000f76:	0623      	lsls	r3, r4, #24
 8000f78:	d502      	bpl.n	8000f80 <rgb_i2cWrite+0x14>
 8000f7a:	f7ff ff81 	bl	8000e80 <RGBSetHighSDA>
 8000f7e:	e001      	b.n	8000f84 <rgb_i2cWrite+0x18>
 8000f80:	f7ff ff64 	bl	8000e4c <RGBSetLowSDA>
 8000f84:	3d01      	subs	r5, #1
 8000f86:	f7ff ff9b 	bl	8000ec0 <RGBSetHighSCL>
 8000f8a:	0064      	lsls	r4, r4, #1
 8000f8c:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8000f90:	b2e4      	uxtb	r4, r4
 8000f92:	d1ee      	bne.n	8000f72 <rgb_i2cWrite+0x6>
 8000f94:	f7ff ff8c 	bl	8000eb0 <RGBSetLowSCL>
 8000f98:	f7ff ff72 	bl	8000e80 <RGBSetHighSDA>
 8000f9c:	f7ff ff90 	bl	8000ec0 <RGBSetHighSCL>
 8000fa0:	f7ff ff86 	bl	8000eb0 <RGBSetLowSCL>
 8000fa4:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000fa8:	f7ff bf4e 	b.w	8000e48 <rgb_i2c_delay>

08000fac <rgb_i2cRead>:
 8000fac:	2300      	movs	r3, #0
 8000fae:	b570      	push	{r4, r5, r6, lr}
 8000fb0:	700b      	strb	r3, [r1, #0]
 8000fb2:	704b      	strb	r3, [r1, #1]
 8000fb4:	708b      	strb	r3, [r1, #2]
 8000fb6:	70cb      	strb	r3, [r1, #3]
 8000fb8:	4606      	mov	r6, r0
 8000fba:	460c      	mov	r4, r1
 8000fbc:	f7ff ff78 	bl	8000eb0 <RGBSetLowSCL>
 8000fc0:	f7ff ff5e 	bl	8000e80 <RGBSetHighSDA>
 8000fc4:	2508      	movs	r5, #8
 8000fc6:	2300      	movs	r3, #0
 8000fc8:	5ce2      	ldrb	r2, [r4, r3]
 8000fca:	0052      	lsls	r2, r2, #1
 8000fcc:	54e2      	strb	r2, [r4, r3]
 8000fce:	3301      	adds	r3, #1
 8000fd0:	2b04      	cmp	r3, #4
 8000fd2:	d1f9      	bne.n	8000fc8 <rgb_i2cRead+0x1c>
 8000fd4:	f7ff ff74 	bl	8000ec0 <RGBSetHighSCL>
 8000fd8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000fdc:	8a1b      	ldrh	r3, [r3, #16]
 8000fde:	b29b      	uxth	r3, r3
 8000fe0:	06da      	lsls	r2, r3, #27
 8000fe2:	d503      	bpl.n	8000fec <rgb_i2cRead+0x40>
 8000fe4:	7822      	ldrb	r2, [r4, #0]
 8000fe6:	f042 0201 	orr.w	r2, r2, #1
 8000fea:	7022      	strb	r2, [r4, #0]
 8000fec:	0698      	lsls	r0, r3, #26
 8000fee:	d503      	bpl.n	8000ff8 <rgb_i2cRead+0x4c>
 8000ff0:	7862      	ldrb	r2, [r4, #1]
 8000ff2:	f042 0201 	orr.w	r2, r2, #1
 8000ff6:	7062      	strb	r2, [r4, #1]
 8000ff8:	0659      	lsls	r1, r3, #25
 8000ffa:	d503      	bpl.n	8001004 <rgb_i2cRead+0x58>
 8000ffc:	78a2      	ldrb	r2, [r4, #2]
 8000ffe:	f042 0201 	orr.w	r2, r2, #1
 8001002:	70a2      	strb	r2, [r4, #2]
 8001004:	061a      	lsls	r2, r3, #24
 8001006:	d503      	bpl.n	8001010 <rgb_i2cRead+0x64>
 8001008:	78e3      	ldrb	r3, [r4, #3]
 800100a:	f043 0301 	orr.w	r3, r3, #1
 800100e:	70e3      	strb	r3, [r4, #3]
 8001010:	f7ff ff4e 	bl	8000eb0 <RGBSetLowSCL>
 8001014:	3d01      	subs	r5, #1
 8001016:	d1d6      	bne.n	8000fc6 <rgb_i2cRead+0x1a>
 8001018:	b10e      	cbz	r6, 800101e <rgb_i2cRead+0x72>
 800101a:	f7ff ff17 	bl	8000e4c <RGBSetLowSDA>
 800101e:	f7ff ff4f 	bl	8000ec0 <RGBSetHighSCL>
 8001022:	f7ff ff45 	bl	8000eb0 <RGBSetLowSCL>
 8001026:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800102a:	f7ff bf0d 	b.w	8000e48 <rgb_i2c_delay>

0800102e <rgb_i2c_write_reg>:
 800102e:	b570      	push	{r4, r5, r6, lr}
 8001030:	4605      	mov	r5, r0
 8001032:	460c      	mov	r4, r1
 8001034:	4616      	mov	r6, r2
 8001036:	f7ff ff7b 	bl	8000f30 <rgb_i2cStart>
 800103a:	4628      	mov	r0, r5
 800103c:	f7ff ff96 	bl	8000f6c <rgb_i2cWrite>
 8001040:	4620      	mov	r0, r4
 8001042:	f7ff ff93 	bl	8000f6c <rgb_i2cWrite>
 8001046:	4630      	mov	r0, r6
 8001048:	f7ff ff90 	bl	8000f6c <rgb_i2cWrite>
 800104c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001050:	f7ff bf7d 	b.w	8000f4e <rgb_i2cStop>

08001054 <rgb_i2c_read_reg>:
 8001054:	b570      	push	{r4, r5, r6, lr}
 8001056:	4604      	mov	r4, r0
 8001058:	460d      	mov	r5, r1
 800105a:	4616      	mov	r6, r2
 800105c:	f7ff ff68 	bl	8000f30 <rgb_i2cStart>
 8001060:	4620      	mov	r0, r4
 8001062:	f7ff ff83 	bl	8000f6c <rgb_i2cWrite>
 8001066:	4628      	mov	r0, r5
 8001068:	f7ff ff80 	bl	8000f6c <rgb_i2cWrite>
 800106c:	f7ff ff60 	bl	8000f30 <rgb_i2cStart>
 8001070:	f044 0001 	orr.w	r0, r4, #1
 8001074:	f7ff ff7a 	bl	8000f6c <rgb_i2cWrite>
 8001078:	4631      	mov	r1, r6
 800107a:	2000      	movs	r0, #0
 800107c:	f7ff ff96 	bl	8000fac <rgb_i2cRead>
 8001080:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001084:	f7ff bf63 	b.w	8000f4e <rgb_i2cStop>

08001088 <device_sleep>:
 8001088:	4b01      	ldr	r3, [pc, #4]	; (8001090 <device_sleep+0x8>)
 800108a:	22ff      	movs	r2, #255	; 0xff
 800108c:	701a      	strb	r2, [r3, #0]
 800108e:	4770      	bx	lr
 8001090:	20000030 	.word	0x20000030

08001094 <device_wake_up>:
 8001094:	4b01      	ldr	r3, [pc, #4]	; (800109c <device_wake_up+0x8>)
 8001096:	2200      	movs	r2, #0
 8001098:	701a      	strb	r2, [r3, #0]
 800109a:	4770      	bx	lr
 800109c:	20000030 	.word	0x20000030

080010a0 <device_i2c_thread>:
 80010a0:	b538      	push	{r3, r4, r5, lr}
 80010a2:	2000      	movs	r0, #0
 80010a4:	210a      	movs	r1, #10
 80010a6:	f000 fc83 	bl	80019b0 <event_timer_set_period>
 80010aa:	2501      	movs	r5, #1
 80010ac:	2400      	movs	r4, #0
 80010ae:	2c01      	cmp	r4, #1
 80010b0:	d021      	beq.n	80010f6 <device_i2c_thread+0x56>
 80010b2:	d30f      	bcc.n	80010d4 <device_i2c_thread+0x34>
 80010b4:	2c02      	cmp	r4, #2
 80010b6:	d1fa      	bne.n	80010ae <device_i2c_thread+0xe>
 80010b8:	f7ff fc88 	bl	80009cc <lsm9ds0_uninit>
 80010bc:	f7ff fc0a 	bl	80008d4 <motors_uninit>
 80010c0:	2064      	movs	r0, #100	; 0x64
 80010c2:	f000 fc65 	bl	8001990 <timer_delay_ms>
 80010c6:	4b12      	ldr	r3, [pc, #72]	; (8001110 <device_i2c_thread+0x70>)
 80010c8:	781c      	ldrb	r4, [r3, #0]
 80010ca:	2c00      	cmp	r4, #0
 80010cc:	bf14      	ite	ne
 80010ce:	2402      	movne	r4, #2
 80010d0:	2400      	moveq	r4, #0
 80010d2:	e7ec      	b.n	80010ae <device_i2c_thread+0xe>
 80010d4:	f7ff fc6e 	bl	80009b4 <motors_init>
 80010d8:	4628      	mov	r0, r5
 80010da:	f7ff fd51 	bl	8000b80 <lsm9ds0_init>
 80010de:	4605      	mov	r5, r0
 80010e0:	b140      	cbz	r0, 80010f4 <device_i2c_thread+0x54>
 80010e2:	f7ff fc73 	bl	80009cc <lsm9ds0_uninit>
 80010e6:	f7ff fbf5 	bl	80008d4 <motors_uninit>
 80010ea:	4629      	mov	r1, r5
 80010ec:	2002      	movs	r0, #2
 80010ee:	f000 f88d 	bl	800120c <abort_error_>
 80010f2:	2500      	movs	r5, #0
 80010f4:	2401      	movs	r4, #1
 80010f6:	2000      	movs	r0, #0
 80010f8:	f000 fc70 	bl	80019dc <event_timer_wait>
 80010fc:	f7ff fc78 	bl	80009f0 <lsm9ds0_read>
 8001100:	f7ff fbf6 	bl	80008f0 <motors_update>
 8001104:	4b02      	ldr	r3, [pc, #8]	; (8001110 <device_i2c_thread+0x70>)
 8001106:	781b      	ldrb	r3, [r3, #0]
 8001108:	2b00      	cmp	r3, #0
 800110a:	bf18      	it	ne
 800110c:	2402      	movne	r4, #2
 800110e:	e7ce      	b.n	80010ae <device_i2c_thread+0xe>
 8001110:	20000030 	.word	0x20000030

08001114 <device_rgb_sensors_thread>:
 8001114:	b510      	push	{r4, lr}
 8001116:	2001      	movs	r0, #1
 8001118:	210a      	movs	r1, #10
 800111a:	f000 fc49 	bl	80019b0 <event_timer_set_period>
 800111e:	2400      	movs	r4, #0
 8001120:	2001      	movs	r0, #1
 8001122:	f000 fc5b 	bl	80019dc <event_timer_wait>
 8001126:	f7ff fd8d 	bl	8000c44 <rgb_sensor_read>
 800112a:	2c01      	cmp	r4, #1
 800112c:	d01a      	beq.n	8001164 <device_rgb_sensors_thread+0x50>
 800112e:	d30d      	bcc.n	800114c <device_rgb_sensors_thread+0x38>
 8001130:	2c02      	cmp	r4, #2
 8001132:	d1f5      	bne.n	8001120 <device_rgb_sensors_thread+0xc>
 8001134:	f7ff fd7a 	bl	8000c2c <rgb_sensor_uninit>
 8001138:	2064      	movs	r0, #100	; 0x64
 800113a:	f000 fc29 	bl	8001990 <timer_delay_ms>
 800113e:	4b0f      	ldr	r3, [pc, #60]	; (800117c <device_rgb_sensors_thread+0x68>)
 8001140:	781c      	ldrb	r4, [r3, #0]
 8001142:	2c00      	cmp	r4, #0
 8001144:	bf14      	ite	ne
 8001146:	2402      	movne	r4, #2
 8001148:	2400      	moveq	r4, #0
 800114a:	e7e9      	b.n	8001120 <device_rgb_sensors_thread+0xc>
 800114c:	f7ff fe2e 	bl	8000dac <rgb_sensor_init>
 8001150:	4604      	mov	r4, r0
 8001152:	b128      	cbz	r0, 8001160 <device_rgb_sensors_thread+0x4c>
 8001154:	f7ff fd6a 	bl	8000c2c <rgb_sensor_uninit>
 8001158:	2001      	movs	r0, #1
 800115a:	4621      	mov	r1, r4
 800115c:	f000 f856 	bl	800120c <abort_error_>
 8001160:	2401      	movs	r4, #1
 8001162:	e7dd      	b.n	8001120 <device_rgb_sensors_thread+0xc>
 8001164:	4620      	mov	r0, r4
 8001166:	f000 fc39 	bl	80019dc <event_timer_wait>
 800116a:	f7ff fd6b 	bl	8000c44 <rgb_sensor_read>
 800116e:	4b03      	ldr	r3, [pc, #12]	; (800117c <device_rgb_sensors_thread+0x68>)
 8001170:	781b      	ldrb	r3, [r3, #0]
 8001172:	2b00      	cmp	r3, #0
 8001174:	d0f4      	beq.n	8001160 <device_rgb_sensors_thread+0x4c>
 8001176:	2402      	movs	r4, #2
 8001178:	e7d2      	b.n	8001120 <device_rgb_sensors_thread+0xc>
 800117a:	bf00      	nop
 800117c:	20000030 	.word	0x20000030

08001180 <device_wifi_thread>:
 8001180:	b570      	push	{r4, r5, r6, lr}
 8001182:	4b1f      	ldr	r3, [pc, #124]	; (8001200 <device_wifi_thread+0x80>)
 8001184:	b0a6      	sub	sp, #152	; 0x98
 8001186:	ac02      	add	r4, sp, #8
 8001188:	f103 0210 	add.w	r2, r3, #16
 800118c:	4626      	mov	r6, r4
 800118e:	6818      	ldr	r0, [r3, #0]
 8001190:	6859      	ldr	r1, [r3, #4]
 8001192:	4625      	mov	r5, r4
 8001194:	c503      	stmia	r5!, {r0, r1}
 8001196:	3308      	adds	r3, #8
 8001198:	4293      	cmp	r3, r2
 800119a:	462c      	mov	r4, r5
 800119c:	d1f7      	bne.n	800118e <device_wifi_thread+0xe>
 800119e:	4630      	mov	r0, r6
 80011a0:	f7ff f91e 	bl	80003e0 <strlen_>
 80011a4:	2100      	movs	r1, #0
 80011a6:	4605      	mov	r5, r0
 80011a8:	2901      	cmp	r1, #1
 80011aa:	d01c      	beq.n	80011e6 <device_wifi_thread+0x66>
 80011ac:	d30d      	bcc.n	80011ca <device_wifi_thread+0x4a>
 80011ae:	2900      	cmp	r1, #0
 80011b0:	d0fa      	beq.n	80011a8 <device_wifi_thread+0x28>
 80011b2:	f7ff fadb 	bl	800076c <esp8266_uninit>
 80011b6:	2064      	movs	r0, #100	; 0x64
 80011b8:	f000 fbea 	bl	8001990 <timer_delay_ms>
 80011bc:	4b11      	ldr	r3, [pc, #68]	; (8001204 <device_wifi_thread+0x84>)
 80011be:	7819      	ldrb	r1, [r3, #0]
 80011c0:	2900      	cmp	r1, #0
 80011c2:	bf14      	ite	ne
 80011c4:	2102      	movne	r1, #2
 80011c6:	2100      	moveq	r1, #0
 80011c8:	e7ee      	b.n	80011a8 <device_wifi_thread+0x28>
 80011ca:	2001      	movs	r0, #1
 80011cc:	f000 ffe2 	bl	8002194 <led_on>
 80011d0:	2000      	movs	r0, #0
 80011d2:	f7ff fa7f 	bl	80006d4 <esp8266_init>
 80011d6:	4604      	mov	r4, r0
 80011d8:	b128      	cbz	r0, 80011e6 <device_wifi_thread+0x66>
 80011da:	f7ff fac7 	bl	800076c <esp8266_uninit>
 80011de:	2003      	movs	r0, #3
 80011e0:	4621      	mov	r1, r4
 80011e2:	f000 f813 	bl	800120c <abort_error_>
 80011e6:	ab06      	add	r3, sp, #24
 80011e8:	9300      	str	r3, [sp, #0]
 80011ea:	2380      	movs	r3, #128	; 0x80
 80011ec:	9301      	str	r3, [sp, #4]
 80011ee:	f240 71da 	movw	r1, #2010	; 0x7da
 80011f2:	4632      	mov	r2, r6
 80011f4:	462b      	mov	r3, r5
 80011f6:	4804      	ldr	r0, [pc, #16]	; (8001208 <device_wifi_thread+0x88>)
 80011f8:	f7ff fae4 	bl	80007c4 <esp8266_connect>
 80011fc:	e7f3      	b.n	80011e6 <device_wifi_thread+0x66>
 80011fe:	bf00      	nop
 8001200:	08002429 	.word	0x08002429
 8001204:	20000030 	.word	0x20000030
 8001208:	0800241d 	.word	0x0800241d

0800120c <abort_error_>:
 800120c:	b570      	push	{r4, r5, r6, lr}
 800120e:	4605      	mov	r5, r0
 8001210:	460e      	mov	r6, r1
 8001212:	480d      	ldr	r0, [pc, #52]	; (8001248 <abort_error_+0x3c>)
 8001214:	4629      	mov	r1, r5
 8001216:	4632      	mov	r2, r6
 8001218:	f7ff f964 	bl	80004e4 <printf_>
 800121c:	2408      	movs	r4, #8
 800121e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001222:	f000 ffb7 	bl	8002194 <led_on>
 8001226:	201e      	movs	r0, #30
 8001228:	f000 fbb2 	bl	8001990 <timer_delay_ms>
 800122c:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001230:	f000 ffc6 	bl	80021c0 <led_off>
 8001234:	2046      	movs	r0, #70	; 0x46
 8001236:	f000 fbab 	bl	8001990 <timer_delay_ms>
 800123a:	3c01      	subs	r4, #1
 800123c:	d1ef      	bne.n	800121e <abort_error_+0x12>
 800123e:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8001242:	f000 fba5 	bl	8001990 <timer_delay_ms>
 8001246:	e7e4      	b.n	8001212 <abort_error_+0x6>
 8001248:	08002439 	.word	0x08002439

0800124c <go_forward_test>:
 800124c:	b508      	push	{r3, lr}
 800124e:	4807      	ldr	r0, [pc, #28]	; (800126c <go_forward_test+0x20>)
 8001250:	212c      	movs	r1, #44	; 0x2c
 8001252:	2200      	movs	r2, #0
 8001254:	f000 f858 	bl	8001308 <go_forward>
 8001258:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 800125c:	f06f 012b 	mvn.w	r1, #43	; 0x2b
 8001260:	2200      	movs	r2, #0
 8001262:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001266:	f000 b84f 	b.w	8001308 <go_forward>
 800126a:	bf00      	nop
 800126c:	000f4240 	.word	0x000f4240

08001270 <main_thread>:
 8001270:	b508      	push	{r3, lr}
 8001272:	481e      	ldr	r0, [pc, #120]	; (80012ec <main_thread+0x7c>)
 8001274:	f7ff f936 	bl	80004e4 <printf_>
 8001278:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 800127c:	f000 fb88 	bl	8001990 <timer_delay_ms>
 8001280:	f7ff ff08 	bl	8001094 <device_wake_up>
 8001284:	491a      	ldr	r1, [pc, #104]	; (80012f0 <main_thread+0x80>)
 8001286:	481b      	ldr	r0, [pc, #108]	; (80012f4 <main_thread+0x84>)
 8001288:	f44f 7200 	mov.w	r2, #512	; 0x200
 800128c:	2306      	movs	r3, #6
 800128e:	f7fe fffd 	bl	800028c <create_thread>
 8001292:	4919      	ldr	r1, [pc, #100]	; (80012f8 <main_thread+0x88>)
 8001294:	4819      	ldr	r0, [pc, #100]	; (80012fc <main_thread+0x8c>)
 8001296:	f44f 7200 	mov.w	r2, #512	; 0x200
 800129a:	2306      	movs	r3, #6
 800129c:	f7fe fff6 	bl	800028c <create_thread>
 80012a0:	4817      	ldr	r0, [pc, #92]	; (8001300 <main_thread+0x90>)
 80012a2:	4918      	ldr	r1, [pc, #96]	; (8001304 <main_thread+0x94>)
 80012a4:	f44f 7200 	mov.w	r2, #512	; 0x200
 80012a8:	2306      	movs	r3, #6
 80012aa:	f7fe ffef 	bl	800028c <create_thread>
 80012ae:	20c8      	movs	r0, #200	; 0xc8
 80012b0:	f000 fb6e 	bl	8001990 <timer_delay_ms>
 80012b4:	f000 fff8 	bl	80022a8 <get_key>
 80012b8:	b980      	cbnz	r0, 80012dc <main_thread+0x6c>
 80012ba:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80012be:	f000 ff69 	bl	8002194 <led_on>
 80012c2:	2064      	movs	r0, #100	; 0x64
 80012c4:	f000 fb64 	bl	8001990 <timer_delay_ms>
 80012c8:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80012cc:	f000 ff78 	bl	80021c0 <led_off>
 80012d0:	20c8      	movs	r0, #200	; 0xc8
 80012d2:	f000 fb5d 	bl	8001990 <timer_delay_ms>
 80012d6:	f7ff fed7 	bl	8001088 <device_sleep>
 80012da:	e7eb      	b.n	80012b4 <main_thread+0x44>
 80012dc:	f7ff feda 	bl	8001094 <device_wake_up>
 80012e0:	20c8      	movs	r0, #200	; 0xc8
 80012e2:	f000 fb55 	bl	8001990 <timer_delay_ms>
 80012e6:	f7ff ffb1 	bl	800124c <go_forward_test>
 80012ea:	e7e3      	b.n	80012b4 <main_thread+0x44>
 80012ec:	0800244b 	.word	0x0800244b
 80012f0:	200007bc 	.word	0x200007bc
 80012f4:	08001115 	.word	0x08001115
 80012f8:	200005bc 	.word	0x200005bc
 80012fc:	080010a1 	.word	0x080010a1
 8001300:	08001181 	.word	0x08001181
 8001304:	200009bc 	.word	0x200009bc

08001308 <go_forward>:
 8001308:	b570      	push	{r4, r5, r6, lr}
 800130a:	ed2d 8b06 	vpush	{d8-d10}
 800130e:	4606      	mov	r6, r0
 8001310:	460d      	mov	r5, r1
 8001312:	4614      	mov	r4, r2
 8001314:	f000 fb2e 	bl	8001974 <timer_get_time>
 8001318:	ed9f 8a3a 	vldr	s16, [pc, #232]	; 8001404 <go_forward+0xfc>
 800131c:	eddf 7a3a 	vldr	s15, [pc, #232]	; 8001408 <go_forward+0x100>
 8001320:	ed9f aa3a 	vldr	s20, [pc, #232]	; 800140c <go_forward+0x104>
 8001324:	2d00      	cmp	r5, #0
 8001326:	4406      	add	r6, r0
 8001328:	bfc8      	it	gt
 800132a:	eeb0 aa67 	vmovgt.f32	s20, s15
 800132e:	eef0 8a48 	vmov.f32	s17, s16
 8001332:	eef0 9a48 	vmov.f32	s19, s16
 8001336:	eef0 aa48 	vmov.f32	s21, s16
 800133a:	f000 fb1b 	bl	8001974 <timer_get_time>
 800133e:	42b0      	cmp	r0, r6
 8001340:	d251      	bcs.n	80013e6 <go_forward+0xde>
 8001342:	2000      	movs	r0, #0
 8001344:	f000 fb4a 	bl	80019dc <event_timer_wait>
 8001348:	4b31      	ldr	r3, [pc, #196]	; (8001410 <go_forward+0x108>)
 800134a:	8b9b      	ldrh	r3, [r3, #28]
 800134c:	b21b      	sxth	r3, r3
 800134e:	ee06 3a90 	vmov	s13, r3
 8001352:	eeb8 7ae6 	vcvt.f32.s32	s14, s13
 8001356:	eddf 6a2f 	vldr	s13, [pc, #188]	; 8001414 <go_forward+0x10c>
 800135a:	eddf 7a2f 	vldr	s15, [pc, #188]	; 8001418 <go_forward+0x110>
 800135e:	ee27 7a26 	vmul.f32	s14, s14, s13
 8001362:	eeb0 6a66 	vmov.f32	s12, s13
 8001366:	ee47 8a27 	vmla.f32	s17, s14, s15
 800136a:	ed9f 7a2c 	vldr	s14, [pc, #176]	; 800141c <go_forward+0x114>
 800136e:	ee3a 9ae8 	vsub.f32	s18, s21, s17
 8001372:	ee79 7a69 	vsub.f32	s15, s18, s19
 8001376:	ee49 7a07 	vmla.f32	s15, s18, s14
 800137a:	ed9f 7a23 	vldr	s14, [pc, #140]	; 8001408 <go_forward+0x100>
 800137e:	eef4 7ac7 	vcmpe.f32	s15, s14
 8001382:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001386:	dc09      	bgt.n	800139c <go_forward+0x94>
 8001388:	eddf 6a20 	vldr	s13, [pc, #128]	; 800140c <go_forward+0x104>
 800138c:	eef4 7a66 	vcmp.f32	s15, s13
 8001390:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8001394:	bf48      	it	mi
 8001396:	eef0 7a66 	vmovmi.f32	s15, s13
 800139a:	e001      	b.n	80013a0 <go_forward+0x98>
 800139c:	eef0 7a47 	vmov.f32	s15, s14
 80013a0:	ee06 5a90 	vmov	s13, r5
 80013a4:	eeb4 8ac7 	vcmpe.f32	s16, s14
 80013a8:	eeb8 7ae6 	vcvt.f32.s32	s14, s13
 80013ac:	eddf 6a1c 	vldr	s13, [pc, #112]	; 8001420 <go_forward+0x118>
 80013b0:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80013b4:	ee67 7aa6 	vmul.f32	s15, s15, s13
 80013b8:	bf48      	it	mi
 80013ba:	ee38 8a06 	vaddmi.f32	s16, s16, s12
 80013be:	ee67 7a8a 	vmul.f32	s15, s15, s20
 80013c2:	ee27 7a08 	vmul.f32	s14, s14, s16
 80013c6:	4b17      	ldr	r3, [pc, #92]	; (8001424 <go_forward+0x11c>)
 80013c8:	ee77 6a27 	vadd.f32	s13, s14, s15
 80013cc:	ee77 7a67 	vsub.f32	s15, s14, s15
 80013d0:	eefd 6ae6 	vcvt.s32.f32	s13, s13
 80013d4:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 80013d8:	edc3 6a00 	vstr	s13, [r3]
 80013dc:	edc3 7a01 	vstr	s15, [r3, #4]
 80013e0:	b164      	cbz	r4, 80013fc <go_forward+0xf4>
 80013e2:	47a0      	blx	r4
 80013e4:	b950      	cbnz	r0, 80013fc <go_forward+0xf4>
 80013e6:	ecbd 8b06 	vpop	{d8-d10}
 80013ea:	4b0e      	ldr	r3, [pc, #56]	; (8001424 <go_forward+0x11c>)
 80013ec:	2200      	movs	r2, #0
 80013ee:	2064      	movs	r0, #100	; 0x64
 80013f0:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80013f4:	601a      	str	r2, [r3, #0]
 80013f6:	605a      	str	r2, [r3, #4]
 80013f8:	f000 baca 	b.w	8001990 <timer_delay_ms>
 80013fc:	eef0 9a49 	vmov.f32	s19, s18
 8001400:	e79b      	b.n	800133a <go_forward+0x32>
 8001402:	bf00      	nop
 8001404:	00000000 	.word	0x00000000
 8001408:	3f800000 	.word	0x3f800000
 800140c:	bf800000 	.word	0xbf800000
 8001410:	20000168 	.word	0x20000168
 8001414:	3c23d70a 	.word	0x3c23d70a
 8001418:	399d4952 	.word	0x399d4952
 800141c:	3f000000 	.word	0x3f000000
 8001420:	42300000 	.word	0x42300000
 8001424:	200001b0 	.word	0x200001b0

08001428 <main>:
 8001428:	b508      	push	{r3, lr}
 800142a:	f000 fe41 	bl	80020b0 <lib_low_level_init>
 800142e:	f7ff f8d3 	bl	80005d8 <lib_os_init>
 8001432:	4905      	ldr	r1, [pc, #20]	; (8001448 <main+0x20>)
 8001434:	4805      	ldr	r0, [pc, #20]	; (800144c <main+0x24>)
 8001436:	f44f 7200 	mov.w	r2, #512	; 0x200
 800143a:	2306      	movs	r3, #6
 800143c:	f7fe ff26 	bl	800028c <create_thread>
 8001440:	f7fe ff1e 	bl	8000280 <kernel_start>
 8001444:	2000      	movs	r0, #0
 8001446:	bd08      	pop	{r3, pc}
 8001448:	20000bbc 	.word	0x20000bbc
 800144c:	08001271 	.word	0x08001271

08001450 <RCC_GetClocksFreq>:
 8001450:	4ba5      	ldr	r3, [pc, #660]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 8001452:	685a      	ldr	r2, [r3, #4]
 8001454:	f002 020c 	and.w	r2, r2, #12
 8001458:	2a04      	cmp	r2, #4
 800145a:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 800145e:	d005      	beq.n	800146c <RCC_GetClocksFreq+0x1c>
 8001460:	2a08      	cmp	r2, #8
 8001462:	d006      	beq.n	8001472 <RCC_GetClocksFreq+0x22>
 8001464:	4ba1      	ldr	r3, [pc, #644]	; (80016ec <RCC_GetClocksFreq+0x29c>)
 8001466:	6003      	str	r3, [r0, #0]
 8001468:	b9ba      	cbnz	r2, 800149a <RCC_GetClocksFreq+0x4a>
 800146a:	e017      	b.n	800149c <RCC_GetClocksFreq+0x4c>
 800146c:	4b9f      	ldr	r3, [pc, #636]	; (80016ec <RCC_GetClocksFreq+0x29c>)
 800146e:	6003      	str	r3, [r0, #0]
 8001470:	e013      	b.n	800149a <RCC_GetClocksFreq+0x4a>
 8001472:	6859      	ldr	r1, [r3, #4]
 8001474:	685c      	ldr	r4, [r3, #4]
 8001476:	f3c1 4183 	ubfx	r1, r1, #18, #4
 800147a:	03e2      	lsls	r2, r4, #15
 800147c:	f101 0102 	add.w	r1, r1, #2
 8001480:	d401      	bmi.n	8001486 <RCC_GetClocksFreq+0x36>
 8001482:	4a9b      	ldr	r2, [pc, #620]	; (80016f0 <RCC_GetClocksFreq+0x2a0>)
 8001484:	e006      	b.n	8001494 <RCC_GetClocksFreq+0x44>
 8001486:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001488:	4b98      	ldr	r3, [pc, #608]	; (80016ec <RCC_GetClocksFreq+0x29c>)
 800148a:	f002 020f 	and.w	r2, r2, #15
 800148e:	3201      	adds	r2, #1
 8001490:	fbb3 f2f2 	udiv	r2, r3, r2
 8001494:	434a      	muls	r2, r1
 8001496:	6002      	str	r2, [r0, #0]
 8001498:	e000      	b.n	800149c <RCC_GetClocksFreq+0x4c>
 800149a:	2200      	movs	r2, #0
 800149c:	4f92      	ldr	r7, [pc, #584]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 800149e:	4d95      	ldr	r5, [pc, #596]	; (80016f4 <RCC_GetClocksFreq+0x2a4>)
 80014a0:	687b      	ldr	r3, [r7, #4]
 80014a2:	f8df 8254 	ldr.w	r8, [pc, #596]	; 80016f8 <RCC_GetClocksFreq+0x2a8>
 80014a6:	f3c3 1303 	ubfx	r3, r3, #4, #4
 80014aa:	5cec      	ldrb	r4, [r5, r3]
 80014ac:	6803      	ldr	r3, [r0, #0]
 80014ae:	b2e4      	uxtb	r4, r4
 80014b0:	fa23 f104 	lsr.w	r1, r3, r4
 80014b4:	6041      	str	r1, [r0, #4]
 80014b6:	687e      	ldr	r6, [r7, #4]
 80014b8:	f3c6 2602 	ubfx	r6, r6, #8, #3
 80014bc:	5dae      	ldrb	r6, [r5, r6]
 80014be:	fa21 f606 	lsr.w	r6, r1, r6
 80014c2:	6086      	str	r6, [r0, #8]
 80014c4:	f8d7 c004 	ldr.w	ip, [r7, #4]
 80014c8:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 80014cc:	f815 500c 	ldrb.w	r5, [r5, ip]
 80014d0:	b2ed      	uxtb	r5, r5
 80014d2:	40e9      	lsrs	r1, r5
 80014d4:	60c1      	str	r1, [r0, #12]
 80014d6:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 80014da:	f3c9 1904 	ubfx	r9, r9, #4, #5
 80014de:	f009 0c0f 	and.w	ip, r9, #15
 80014e2:	f019 0f10 	tst.w	r9, #16
 80014e6:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 80014ea:	fa1f fc8c 	uxth.w	ip, ip
 80014ee:	d007      	beq.n	8001500 <RCC_GetClocksFreq+0xb0>
 80014f0:	f1bc 0f00 	cmp.w	ip, #0
 80014f4:	d004      	beq.n	8001500 <RCC_GetClocksFreq+0xb0>
 80014f6:	fbb2 fcfc 	udiv	ip, r2, ip
 80014fa:	f8c0 c010 	str.w	ip, [r0, #16]
 80014fe:	e000      	b.n	8001502 <RCC_GetClocksFreq+0xb2>
 8001500:	6103      	str	r3, [r0, #16]
 8001502:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 8001504:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 8001508:	f00c 070f 	and.w	r7, ip, #15
 800150c:	f01c 0f10 	tst.w	ip, #16
 8001510:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 8001514:	b2bf      	uxth	r7, r7
 8001516:	d004      	beq.n	8001522 <RCC_GetClocksFreq+0xd2>
 8001518:	b11f      	cbz	r7, 8001522 <RCC_GetClocksFreq+0xd2>
 800151a:	fbb2 f7f7 	udiv	r7, r2, r7
 800151e:	6147      	str	r7, [r0, #20]
 8001520:	e000      	b.n	8001524 <RCC_GetClocksFreq+0xd4>
 8001522:	6143      	str	r3, [r0, #20]
 8001524:	4f70      	ldr	r7, [pc, #448]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 8001526:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800152a:	f01c 0f10 	tst.w	ip, #16
 800152e:	bf0a      	itet	eq
 8001530:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 80016ec <RCC_GetClocksFreq+0x29c>
 8001534:	6183      	strne	r3, [r0, #24]
 8001536:	f8c0 c018 	streq.w	ip, [r0, #24]
 800153a:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 800153c:	06bf      	lsls	r7, r7, #26
 800153e:	bf56      	itet	pl
 8001540:	4f6a      	ldrpl	r7, [pc, #424]	; (80016ec <RCC_GetClocksFreq+0x29c>)
 8001542:	61c3      	strmi	r3, [r0, #28]
 8001544:	61c7      	strpl	r7, [r0, #28]
 8001546:	4f68      	ldr	r7, [pc, #416]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 8001548:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800154c:	f01c 0f40 	tst.w	ip, #64	; 0x40
 8001550:	bf0a      	itet	eq
 8001552:	f8df c198 	ldreq.w	ip, [pc, #408]	; 80016ec <RCC_GetClocksFreq+0x29c>
 8001556:	6203      	strne	r3, [r0, #32]
 8001558:	f8c0 c020 	streq.w	ip, [r0, #32]
 800155c:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 800155e:	05ff      	lsls	r7, r7, #23
 8001560:	d506      	bpl.n	8001570 <RCC_GetClocksFreq+0x120>
 8001562:	4293      	cmp	r3, r2
 8001564:	d104      	bne.n	8001570 <RCC_GetClocksFreq+0x120>
 8001566:	42a5      	cmp	r5, r4
 8001568:	d102      	bne.n	8001570 <RCC_GetClocksFreq+0x120>
 800156a:	005f      	lsls	r7, r3, #1
 800156c:	6247      	str	r7, [r0, #36]	; 0x24
 800156e:	e000      	b.n	8001572 <RCC_GetClocksFreq+0x122>
 8001570:	6241      	str	r1, [r0, #36]	; 0x24
 8001572:	4f5d      	ldr	r7, [pc, #372]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 8001574:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001578:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 800157c:	d008      	beq.n	8001590 <RCC_GetClocksFreq+0x140>
 800157e:	4293      	cmp	r3, r2
 8001580:	d106      	bne.n	8001590 <RCC_GetClocksFreq+0x140>
 8001582:	42a5      	cmp	r5, r4
 8001584:	d104      	bne.n	8001590 <RCC_GetClocksFreq+0x140>
 8001586:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 800158a:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 800158e:	e000      	b.n	8001592 <RCC_GetClocksFreq+0x142>
 8001590:	6281      	str	r1, [r0, #40]	; 0x28
 8001592:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001594:	05bf      	lsls	r7, r7, #22
 8001596:	d506      	bpl.n	80015a6 <RCC_GetClocksFreq+0x156>
 8001598:	4293      	cmp	r3, r2
 800159a:	d104      	bne.n	80015a6 <RCC_GetClocksFreq+0x156>
 800159c:	42a5      	cmp	r5, r4
 800159e:	d102      	bne.n	80015a6 <RCC_GetClocksFreq+0x156>
 80015a0:	005f      	lsls	r7, r3, #1
 80015a2:	62c7      	str	r7, [r0, #44]	; 0x2c
 80015a4:	e000      	b.n	80015a8 <RCC_GetClocksFreq+0x158>
 80015a6:	62c1      	str	r1, [r0, #44]	; 0x2c
 80015a8:	4f4f      	ldr	r7, [pc, #316]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 80015aa:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80015ae:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 80015b2:	d008      	beq.n	80015c6 <RCC_GetClocksFreq+0x176>
 80015b4:	4293      	cmp	r3, r2
 80015b6:	d106      	bne.n	80015c6 <RCC_GetClocksFreq+0x176>
 80015b8:	42a5      	cmp	r5, r4
 80015ba:	d104      	bne.n	80015c6 <RCC_GetClocksFreq+0x176>
 80015bc:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 80015c0:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 80015c4:	e000      	b.n	80015c8 <RCC_GetClocksFreq+0x178>
 80015c6:	64c1      	str	r1, [r0, #76]	; 0x4c
 80015c8:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80015ca:	053f      	lsls	r7, r7, #20
 80015cc:	d506      	bpl.n	80015dc <RCC_GetClocksFreq+0x18c>
 80015ce:	4293      	cmp	r3, r2
 80015d0:	d104      	bne.n	80015dc <RCC_GetClocksFreq+0x18c>
 80015d2:	42a5      	cmp	r5, r4
 80015d4:	d102      	bne.n	80015dc <RCC_GetClocksFreq+0x18c>
 80015d6:	005f      	lsls	r7, r3, #1
 80015d8:	6507      	str	r7, [r0, #80]	; 0x50
 80015da:	e000      	b.n	80015de <RCC_GetClocksFreq+0x18e>
 80015dc:	6501      	str	r1, [r0, #80]	; 0x50
 80015de:	4f42      	ldr	r7, [pc, #264]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 80015e0:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80015e4:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 80015e8:	d008      	beq.n	80015fc <RCC_GetClocksFreq+0x1ac>
 80015ea:	4293      	cmp	r3, r2
 80015ec:	d106      	bne.n	80015fc <RCC_GetClocksFreq+0x1ac>
 80015ee:	42a5      	cmp	r5, r4
 80015f0:	d104      	bne.n	80015fc <RCC_GetClocksFreq+0x1ac>
 80015f2:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 80015f6:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 80015fa:	e000      	b.n	80015fe <RCC_GetClocksFreq+0x1ae>
 80015fc:	6501      	str	r1, [r0, #80]	; 0x50
 80015fe:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001600:	043f      	lsls	r7, r7, #16
 8001602:	d506      	bpl.n	8001612 <RCC_GetClocksFreq+0x1c2>
 8001604:	4293      	cmp	r3, r2
 8001606:	d104      	bne.n	8001612 <RCC_GetClocksFreq+0x1c2>
 8001608:	42a5      	cmp	r5, r4
 800160a:	d102      	bne.n	8001612 <RCC_GetClocksFreq+0x1c2>
 800160c:	005a      	lsls	r2, r3, #1
 800160e:	6582      	str	r2, [r0, #88]	; 0x58
 8001610:	e000      	b.n	8001614 <RCC_GetClocksFreq+0x1c4>
 8001612:	6581      	str	r1, [r0, #88]	; 0x58
 8001614:	4a34      	ldr	r2, [pc, #208]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 8001616:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8001618:	07a4      	lsls	r4, r4, #30
 800161a:	d014      	beq.n	8001646 <RCC_GetClocksFreq+0x1f6>
 800161c:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800161e:	f001 0103 	and.w	r1, r1, #3
 8001622:	2901      	cmp	r1, #1
 8001624:	d101      	bne.n	800162a <RCC_GetClocksFreq+0x1da>
 8001626:	6383      	str	r3, [r0, #56]	; 0x38
 8001628:	e00e      	b.n	8001648 <RCC_GetClocksFreq+0x1f8>
 800162a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800162c:	f001 0103 	and.w	r1, r1, #3
 8001630:	2902      	cmp	r1, #2
 8001632:	d102      	bne.n	800163a <RCC_GetClocksFreq+0x1ea>
 8001634:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001638:	e005      	b.n	8001646 <RCC_GetClocksFreq+0x1f6>
 800163a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800163c:	f001 0103 	and.w	r1, r1, #3
 8001640:	2903      	cmp	r1, #3
 8001642:	d101      	bne.n	8001648 <RCC_GetClocksFreq+0x1f8>
 8001644:	4929      	ldr	r1, [pc, #164]	; (80016ec <RCC_GetClocksFreq+0x29c>)
 8001646:	6381      	str	r1, [r0, #56]	; 0x38
 8001648:	6b12      	ldr	r2, [r2, #48]	; 0x30
 800164a:	4927      	ldr	r1, [pc, #156]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 800164c:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 8001650:	d101      	bne.n	8001656 <RCC_GetClocksFreq+0x206>
 8001652:	63c6      	str	r6, [r0, #60]	; 0x3c
 8001654:	e018      	b.n	8001688 <RCC_GetClocksFreq+0x238>
 8001656:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001658:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 800165c:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 8001660:	d101      	bne.n	8001666 <RCC_GetClocksFreq+0x216>
 8001662:	63c3      	str	r3, [r0, #60]	; 0x3c
 8001664:	e010      	b.n	8001688 <RCC_GetClocksFreq+0x238>
 8001666:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001668:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 800166c:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 8001670:	d102      	bne.n	8001678 <RCC_GetClocksFreq+0x228>
 8001672:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001676:	e006      	b.n	8001686 <RCC_GetClocksFreq+0x236>
 8001678:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800167a:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 800167e:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 8001682:	d101      	bne.n	8001688 <RCC_GetClocksFreq+0x238>
 8001684:	4a19      	ldr	r2, [pc, #100]	; (80016ec <RCC_GetClocksFreq+0x29c>)
 8001686:	63c2      	str	r2, [r0, #60]	; 0x3c
 8001688:	4a17      	ldr	r2, [pc, #92]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 800168a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800168c:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8001690:	d101      	bne.n	8001696 <RCC_GetClocksFreq+0x246>
 8001692:	6406      	str	r6, [r0, #64]	; 0x40
 8001694:	e018      	b.n	80016c8 <RCC_GetClocksFreq+0x278>
 8001696:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001698:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 800169c:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 80016a0:	d101      	bne.n	80016a6 <RCC_GetClocksFreq+0x256>
 80016a2:	6403      	str	r3, [r0, #64]	; 0x40
 80016a4:	e010      	b.n	80016c8 <RCC_GetClocksFreq+0x278>
 80016a6:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80016a8:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 80016ac:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 80016b0:	d102      	bne.n	80016b8 <RCC_GetClocksFreq+0x268>
 80016b2:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80016b6:	e006      	b.n	80016c6 <RCC_GetClocksFreq+0x276>
 80016b8:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80016ba:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 80016be:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 80016c2:	d101      	bne.n	80016c8 <RCC_GetClocksFreq+0x278>
 80016c4:	4909      	ldr	r1, [pc, #36]	; (80016ec <RCC_GetClocksFreq+0x29c>)
 80016c6:	6401      	str	r1, [r0, #64]	; 0x40
 80016c8:	6b12      	ldr	r2, [r2, #48]	; 0x30
 80016ca:	4907      	ldr	r1, [pc, #28]	; (80016e8 <RCC_GetClocksFreq+0x298>)
 80016cc:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 80016d0:	d101      	bne.n	80016d6 <RCC_GetClocksFreq+0x286>
 80016d2:	6446      	str	r6, [r0, #68]	; 0x44
 80016d4:	e023      	b.n	800171e <RCC_GetClocksFreq+0x2ce>
 80016d6:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80016d8:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80016dc:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 80016e0:	d10c      	bne.n	80016fc <RCC_GetClocksFreq+0x2ac>
 80016e2:	6443      	str	r3, [r0, #68]	; 0x44
 80016e4:	e01b      	b.n	800171e <RCC_GetClocksFreq+0x2ce>
 80016e6:	bf00      	nop
 80016e8:	40021000 	.word	0x40021000
 80016ec:	007a1200 	.word	0x007a1200
 80016f0:	003d0900 	.word	0x003d0900
 80016f4:	20000020 	.word	0x20000020
 80016f8:	20000000 	.word	0x20000000
 80016fc:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80016fe:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001702:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 8001706:	d102      	bne.n	800170e <RCC_GetClocksFreq+0x2be>
 8001708:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800170c:	e006      	b.n	800171c <RCC_GetClocksFreq+0x2cc>
 800170e:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001710:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001714:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 8001718:	d101      	bne.n	800171e <RCC_GetClocksFreq+0x2ce>
 800171a:	4a11      	ldr	r2, [pc, #68]	; (8001760 <RCC_GetClocksFreq+0x310>)
 800171c:	6442      	str	r2, [r0, #68]	; 0x44
 800171e:	4a11      	ldr	r2, [pc, #68]	; (8001764 <RCC_GetClocksFreq+0x314>)
 8001720:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001722:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 8001726:	d102      	bne.n	800172e <RCC_GetClocksFreq+0x2de>
 8001728:	6486      	str	r6, [r0, #72]	; 0x48
 800172a:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800172e:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001730:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 8001734:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 8001738:	d00f      	beq.n	800175a <RCC_GetClocksFreq+0x30a>
 800173a:	6b13      	ldr	r3, [r2, #48]	; 0x30
 800173c:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001740:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 8001744:	d102      	bne.n	800174c <RCC_GetClocksFreq+0x2fc>
 8001746:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 800174a:	e006      	b.n	800175a <RCC_GetClocksFreq+0x30a>
 800174c:	6b13      	ldr	r3, [r2, #48]	; 0x30
 800174e:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001752:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8001756:	d101      	bne.n	800175c <RCC_GetClocksFreq+0x30c>
 8001758:	4b01      	ldr	r3, [pc, #4]	; (8001760 <RCC_GetClocksFreq+0x310>)
 800175a:	6483      	str	r3, [r0, #72]	; 0x48
 800175c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001760:	007a1200 	.word	0x007a1200
 8001764:	40021000 	.word	0x40021000

08001768 <RCC_AHBPeriphClockCmd>:
 8001768:	bf00      	nop
 800176a:	bf00      	nop
 800176c:	4b04      	ldr	r3, [pc, #16]	; (8001780 <RCC_AHBPeriphClockCmd+0x18>)
 800176e:	695a      	ldr	r2, [r3, #20]
 8001770:	b109      	cbz	r1, 8001776 <RCC_AHBPeriphClockCmd+0xe>
 8001772:	4310      	orrs	r0, r2
 8001774:	e001      	b.n	800177a <RCC_AHBPeriphClockCmd+0x12>
 8001776:	ea22 0000 	bic.w	r0, r2, r0
 800177a:	6158      	str	r0, [r3, #20]
 800177c:	4770      	bx	lr
 800177e:	bf00      	nop
 8001780:	40021000 	.word	0x40021000

08001784 <RCC_APB2PeriphClockCmd>:
 8001784:	bf00      	nop
 8001786:	bf00      	nop
 8001788:	4b04      	ldr	r3, [pc, #16]	; (800179c <RCC_APB2PeriphClockCmd+0x18>)
 800178a:	699a      	ldr	r2, [r3, #24]
 800178c:	b109      	cbz	r1, 8001792 <RCC_APB2PeriphClockCmd+0xe>
 800178e:	4310      	orrs	r0, r2
 8001790:	e001      	b.n	8001796 <RCC_APB2PeriphClockCmd+0x12>
 8001792:	ea22 0000 	bic.w	r0, r2, r0
 8001796:	6198      	str	r0, [r3, #24]
 8001798:	4770      	bx	lr
 800179a:	bf00      	nop
 800179c:	40021000 	.word	0x40021000

080017a0 <RCC_APB1PeriphClockCmd>:
 80017a0:	bf00      	nop
 80017a2:	bf00      	nop
 80017a4:	4b04      	ldr	r3, [pc, #16]	; (80017b8 <RCC_APB1PeriphClockCmd+0x18>)
 80017a6:	69da      	ldr	r2, [r3, #28]
 80017a8:	b109      	cbz	r1, 80017ae <RCC_APB1PeriphClockCmd+0xe>
 80017aa:	4310      	orrs	r0, r2
 80017ac:	e001      	b.n	80017b2 <RCC_APB1PeriphClockCmd+0x12>
 80017ae:	ea22 0000 	bic.w	r0, r2, r0
 80017b2:	61d8      	str	r0, [r3, #28]
 80017b4:	4770      	bx	lr
 80017b6:	bf00      	nop
 80017b8:	40021000 	.word	0x40021000

080017bc <TIM_TimeBaseInit>:
 80017bc:	bf00      	nop
 80017be:	bf00      	nop
 80017c0:	bf00      	nop
 80017c2:	4a24      	ldr	r2, [pc, #144]	; (8001854 <TIM_TimeBaseInit+0x98>)
 80017c4:	8803      	ldrh	r3, [r0, #0]
 80017c6:	4290      	cmp	r0, r2
 80017c8:	b29b      	uxth	r3, r3
 80017ca:	d012      	beq.n	80017f2 <TIM_TimeBaseInit+0x36>
 80017cc:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 80017d0:	4290      	cmp	r0, r2
 80017d2:	d00e      	beq.n	80017f2 <TIM_TimeBaseInit+0x36>
 80017d4:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 80017d8:	d00b      	beq.n	80017f2 <TIM_TimeBaseInit+0x36>
 80017da:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 80017de:	4290      	cmp	r0, r2
 80017e0:	d007      	beq.n	80017f2 <TIM_TimeBaseInit+0x36>
 80017e2:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80017e6:	4290      	cmp	r0, r2
 80017e8:	d003      	beq.n	80017f2 <TIM_TimeBaseInit+0x36>
 80017ea:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 80017ee:	4290      	cmp	r0, r2
 80017f0:	d103      	bne.n	80017fa <TIM_TimeBaseInit+0x3e>
 80017f2:	884a      	ldrh	r2, [r1, #2]
 80017f4:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 80017f8:	4313      	orrs	r3, r2
 80017fa:	4a17      	ldr	r2, [pc, #92]	; (8001858 <TIM_TimeBaseInit+0x9c>)
 80017fc:	4290      	cmp	r0, r2
 80017fe:	d008      	beq.n	8001812 <TIM_TimeBaseInit+0x56>
 8001800:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001804:	4290      	cmp	r0, r2
 8001806:	d004      	beq.n	8001812 <TIM_TimeBaseInit+0x56>
 8001808:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 800180c:	890a      	ldrh	r2, [r1, #8]
 800180e:	b29b      	uxth	r3, r3
 8001810:	4313      	orrs	r3, r2
 8001812:	8003      	strh	r3, [r0, #0]
 8001814:	684b      	ldr	r3, [r1, #4]
 8001816:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001818:	880b      	ldrh	r3, [r1, #0]
 800181a:	8503      	strh	r3, [r0, #40]	; 0x28
 800181c:	4b0d      	ldr	r3, [pc, #52]	; (8001854 <TIM_TimeBaseInit+0x98>)
 800181e:	4298      	cmp	r0, r3
 8001820:	d013      	beq.n	800184a <TIM_TimeBaseInit+0x8e>
 8001822:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001826:	4298      	cmp	r0, r3
 8001828:	d00f      	beq.n	800184a <TIM_TimeBaseInit+0x8e>
 800182a:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 800182e:	4298      	cmp	r0, r3
 8001830:	d00b      	beq.n	800184a <TIM_TimeBaseInit+0x8e>
 8001832:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001836:	4298      	cmp	r0, r3
 8001838:	d007      	beq.n	800184a <TIM_TimeBaseInit+0x8e>
 800183a:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 800183e:	4298      	cmp	r0, r3
 8001840:	d003      	beq.n	800184a <TIM_TimeBaseInit+0x8e>
 8001842:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001846:	4298      	cmp	r0, r3
 8001848:	d101      	bne.n	800184e <TIM_TimeBaseInit+0x92>
 800184a:	894b      	ldrh	r3, [r1, #10]
 800184c:	8603      	strh	r3, [r0, #48]	; 0x30
 800184e:	2301      	movs	r3, #1
 8001850:	6143      	str	r3, [r0, #20]
 8001852:	4770      	bx	lr
 8001854:	40012c00 	.word	0x40012c00
 8001858:	40001000 	.word	0x40001000

0800185c <TIM_Cmd>:
 800185c:	bf00      	nop
 800185e:	bf00      	nop
 8001860:	8803      	ldrh	r3, [r0, #0]
 8001862:	b119      	cbz	r1, 800186c <TIM_Cmd+0x10>
 8001864:	b29b      	uxth	r3, r3
 8001866:	f043 0301 	orr.w	r3, r3, #1
 800186a:	e003      	b.n	8001874 <TIM_Cmd+0x18>
 800186c:	f023 0301 	bic.w	r3, r3, #1
 8001870:	041b      	lsls	r3, r3, #16
 8001872:	0c1b      	lsrs	r3, r3, #16
 8001874:	8003      	strh	r3, [r0, #0]
 8001876:	4770      	bx	lr

08001878 <TIM_ClearITPendingBit>:
 8001878:	bf00      	nop
 800187a:	43c9      	mvns	r1, r1
 800187c:	b289      	uxth	r1, r1
 800187e:	6101      	str	r1, [r0, #16]
 8001880:	4770      	bx	lr
	...

08001884 <timer_init>:
 8001884:	b530      	push	{r4, r5, lr}
 8001886:	2300      	movs	r3, #0
 8001888:	b085      	sub	sp, #20
 800188a:	491f      	ldr	r1, [pc, #124]	; (8001908 <timer_init+0x84>)
 800188c:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001890:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001894:	491d      	ldr	r1, [pc, #116]	; (800190c <timer_init+0x88>)
 8001896:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 800189a:	4a1d      	ldr	r2, [pc, #116]	; (8001910 <timer_init+0x8c>)
 800189c:	2400      	movs	r4, #0
 800189e:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 80018a2:	3301      	adds	r3, #1
 80018a4:	2b04      	cmp	r3, #4
 80018a6:	4625      	mov	r5, r4
 80018a8:	d1ef      	bne.n	800188a <timer_init+0x6>
 80018aa:	4b1a      	ldr	r3, [pc, #104]	; (8001914 <timer_init+0x90>)
 80018ac:	2002      	movs	r0, #2
 80018ae:	2101      	movs	r1, #1
 80018b0:	601c      	str	r4, [r3, #0]
 80018b2:	f7ff ff75 	bl	80017a0 <RCC_APB1PeriphClockCmd>
 80018b6:	f8ad 4006 	strh.w	r4, [sp, #6]
 80018ba:	f8ad 400c 	strh.w	r4, [sp, #12]
 80018be:	f8ad 400e 	strh.w	r4, [sp, #14]
 80018c2:	4c15      	ldr	r4, [pc, #84]	; (8001918 <timer_init+0x94>)
 80018c4:	f44f 738c 	mov.w	r3, #280	; 0x118
 80018c8:	f8ad 3004 	strh.w	r3, [sp, #4]
 80018cc:	4620      	mov	r0, r4
 80018ce:	2331      	movs	r3, #49	; 0x31
 80018d0:	a901      	add	r1, sp, #4
 80018d2:	9302      	str	r3, [sp, #8]
 80018d4:	f7ff ff72 	bl	80017bc <TIM_TimeBaseInit>
 80018d8:	4620      	mov	r0, r4
 80018da:	2101      	movs	r1, #1
 80018dc:	f7ff ffbe 	bl	800185c <TIM_Cmd>
 80018e0:	68e3      	ldr	r3, [r4, #12]
 80018e2:	f043 0301 	orr.w	r3, r3, #1
 80018e6:	60e3      	str	r3, [r4, #12]
 80018e8:	231d      	movs	r3, #29
 80018ea:	f88d 3000 	strb.w	r3, [sp]
 80018ee:	4668      	mov	r0, sp
 80018f0:	2301      	movs	r3, #1
 80018f2:	f88d 5001 	strb.w	r5, [sp, #1]
 80018f6:	f88d 3002 	strb.w	r3, [sp, #2]
 80018fa:	f88d 3003 	strb.w	r3, [sp, #3]
 80018fe:	f000 fb9f 	bl	8002040 <NVIC_Init>
 8001902:	b005      	add	sp, #20
 8001904:	bd30      	pop	{r4, r5, pc}
 8001906:	bf00      	nop
 8001908:	20000dd0 	.word	0x20000dd0
 800190c:	20000dc4 	.word	0x20000dc4
 8001910:	20000dbc 	.word	0x20000dbc
 8001914:	20000dcc 	.word	0x20000dcc
 8001918:	40000400 	.word	0x40000400

0800191c <TIM3_IRQHandler>:
 800191c:	2300      	movs	r3, #0
 800191e:	4a10      	ldr	r2, [pc, #64]	; (8001960 <TIM3_IRQHandler+0x44>)
 8001920:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001924:	b289      	uxth	r1, r1
 8001926:	b129      	cbz	r1, 8001934 <TIM3_IRQHandler+0x18>
 8001928:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 800192c:	b289      	uxth	r1, r1
 800192e:	3901      	subs	r1, #1
 8001930:	b289      	uxth	r1, r1
 8001932:	e007      	b.n	8001944 <TIM3_IRQHandler+0x28>
 8001934:	490b      	ldr	r1, [pc, #44]	; (8001964 <TIM3_IRQHandler+0x48>)
 8001936:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 800193a:	b289      	uxth	r1, r1
 800193c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001940:	4a09      	ldr	r2, [pc, #36]	; (8001968 <TIM3_IRQHandler+0x4c>)
 8001942:	2101      	movs	r1, #1
 8001944:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001948:	3301      	adds	r3, #1
 800194a:	2b04      	cmp	r3, #4
 800194c:	d1e7      	bne.n	800191e <TIM3_IRQHandler+0x2>
 800194e:	4b07      	ldr	r3, [pc, #28]	; (800196c <TIM3_IRQHandler+0x50>)
 8001950:	4807      	ldr	r0, [pc, #28]	; (8001970 <TIM3_IRQHandler+0x54>)
 8001952:	681a      	ldr	r2, [r3, #0]
 8001954:	2101      	movs	r1, #1
 8001956:	3201      	adds	r2, #1
 8001958:	601a      	str	r2, [r3, #0]
 800195a:	f7ff bf8d 	b.w	8001878 <TIM_ClearITPendingBit>
 800195e:	bf00      	nop
 8001960:	20000dd0 	.word	0x20000dd0
 8001964:	20000dc4 	.word	0x20000dc4
 8001968:	20000dbc 	.word	0x20000dbc
 800196c:	20000dcc 	.word	0x20000dcc
 8001970:	40000400 	.word	0x40000400

08001974 <timer_get_time>:
 8001974:	b082      	sub	sp, #8
 8001976:	b672      	cpsid	i
 8001978:	4b04      	ldr	r3, [pc, #16]	; (800198c <timer_get_time+0x18>)
 800197a:	681b      	ldr	r3, [r3, #0]
 800197c:	9301      	str	r3, [sp, #4]
 800197e:	b662      	cpsie	i
 8001980:	9801      	ldr	r0, [sp, #4]
 8001982:	230a      	movs	r3, #10
 8001984:	fbb0 f0f3 	udiv	r0, r0, r3
 8001988:	b002      	add	sp, #8
 800198a:	4770      	bx	lr
 800198c:	20000dcc 	.word	0x20000dcc

08001990 <timer_delay_ms>:
 8001990:	b513      	push	{r0, r1, r4, lr}
 8001992:	4604      	mov	r4, r0
 8001994:	f7ff ffee 	bl	8001974 <timer_get_time>
 8001998:	4420      	add	r0, r4
 800199a:	9001      	str	r0, [sp, #4]
 800199c:	9c01      	ldr	r4, [sp, #4]
 800199e:	f7ff ffe9 	bl	8001974 <timer_get_time>
 80019a2:	4284      	cmp	r4, r0
 80019a4:	d902      	bls.n	80019ac <timer_delay_ms+0x1c>
 80019a6:	f000 fb47 	bl	8002038 <sleep>
 80019aa:	e7f7      	b.n	800199c <timer_delay_ms+0xc>
 80019ac:	b002      	add	sp, #8
 80019ae:	bd10      	pop	{r4, pc}

080019b0 <event_timer_set_period>:
 80019b0:	b672      	cpsid	i
 80019b2:	230a      	movs	r3, #10
 80019b4:	4359      	muls	r1, r3
 80019b6:	4b06      	ldr	r3, [pc, #24]	; (80019d0 <event_timer_set_period+0x20>)
 80019b8:	b289      	uxth	r1, r1
 80019ba:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 80019be:	4b05      	ldr	r3, [pc, #20]	; (80019d4 <event_timer_set_period+0x24>)
 80019c0:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 80019c4:	4b04      	ldr	r3, [pc, #16]	; (80019d8 <event_timer_set_period+0x28>)
 80019c6:	2200      	movs	r2, #0
 80019c8:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 80019cc:	b662      	cpsie	i
 80019ce:	4770      	bx	lr
 80019d0:	20000dd0 	.word	0x20000dd0
 80019d4:	20000dc4 	.word	0x20000dc4
 80019d8:	20000dbc 	.word	0x20000dbc

080019dc <event_timer_wait>:
 80019dc:	b510      	push	{r4, lr}
 80019de:	4604      	mov	r4, r0
 80019e0:	4b06      	ldr	r3, [pc, #24]	; (80019fc <event_timer_wait+0x20>)
 80019e2:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 80019e6:	b292      	uxth	r2, r2
 80019e8:	b912      	cbnz	r2, 80019f0 <event_timer_wait+0x14>
 80019ea:	f000 fb25 	bl	8002038 <sleep>
 80019ee:	e7f7      	b.n	80019e0 <event_timer_wait+0x4>
 80019f0:	b672      	cpsid	i
 80019f2:	2200      	movs	r2, #0
 80019f4:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 80019f8:	b662      	cpsie	i
 80019fa:	bd10      	pop	{r4, pc}
 80019fc:	20000dbc 	.word	0x20000dbc

08001a00 <USART_Init>:
 8001a00:	b530      	push	{r4, r5, lr}
 8001a02:	4604      	mov	r4, r0
 8001a04:	b099      	sub	sp, #100	; 0x64
 8001a06:	460d      	mov	r5, r1
 8001a08:	bf00      	nop
 8001a0a:	bf00      	nop
 8001a0c:	bf00      	nop
 8001a0e:	bf00      	nop
 8001a10:	bf00      	nop
 8001a12:	bf00      	nop
 8001a14:	bf00      	nop
 8001a16:	6803      	ldr	r3, [r0, #0]
 8001a18:	f023 0301 	bic.w	r3, r3, #1
 8001a1c:	6003      	str	r3, [r0, #0]
 8001a1e:	6842      	ldr	r2, [r0, #4]
 8001a20:	688b      	ldr	r3, [r1, #8]
 8001a22:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 8001a26:	4313      	orrs	r3, r2
 8001a28:	6043      	str	r3, [r0, #4]
 8001a2a:	686a      	ldr	r2, [r5, #4]
 8001a2c:	68eb      	ldr	r3, [r5, #12]
 8001a2e:	6801      	ldr	r1, [r0, #0]
 8001a30:	431a      	orrs	r2, r3
 8001a32:	692b      	ldr	r3, [r5, #16]
 8001a34:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 8001a38:	f021 010c 	bic.w	r1, r1, #12
 8001a3c:	4313      	orrs	r3, r2
 8001a3e:	430b      	orrs	r3, r1
 8001a40:	6003      	str	r3, [r0, #0]
 8001a42:	6882      	ldr	r2, [r0, #8]
 8001a44:	696b      	ldr	r3, [r5, #20]
 8001a46:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 8001a4a:	4313      	orrs	r3, r2
 8001a4c:	6083      	str	r3, [r0, #8]
 8001a4e:	a801      	add	r0, sp, #4
 8001a50:	f7ff fcfe 	bl	8001450 <RCC_GetClocksFreq>
 8001a54:	4b17      	ldr	r3, [pc, #92]	; (8001ab4 <USART_Init+0xb4>)
 8001a56:	429c      	cmp	r4, r3
 8001a58:	d101      	bne.n	8001a5e <USART_Init+0x5e>
 8001a5a:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 8001a5c:	e00e      	b.n	8001a7c <USART_Init+0x7c>
 8001a5e:	4b16      	ldr	r3, [pc, #88]	; (8001ab8 <USART_Init+0xb8>)
 8001a60:	429c      	cmp	r4, r3
 8001a62:	d101      	bne.n	8001a68 <USART_Init+0x68>
 8001a64:	9a10      	ldr	r2, [sp, #64]	; 0x40
 8001a66:	e009      	b.n	8001a7c <USART_Init+0x7c>
 8001a68:	4b14      	ldr	r3, [pc, #80]	; (8001abc <USART_Init+0xbc>)
 8001a6a:	429c      	cmp	r4, r3
 8001a6c:	d101      	bne.n	8001a72 <USART_Init+0x72>
 8001a6e:	9a11      	ldr	r2, [sp, #68]	; 0x44
 8001a70:	e004      	b.n	8001a7c <USART_Init+0x7c>
 8001a72:	4b13      	ldr	r3, [pc, #76]	; (8001ac0 <USART_Init+0xc0>)
 8001a74:	429c      	cmp	r4, r3
 8001a76:	bf0c      	ite	eq
 8001a78:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 8001a7a:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 8001a7c:	6823      	ldr	r3, [r4, #0]
 8001a7e:	6829      	ldr	r1, [r5, #0]
 8001a80:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 8001a84:	bf18      	it	ne
 8001a86:	0052      	lslne	r2, r2, #1
 8001a88:	fbb2 f3f1 	udiv	r3, r2, r1
 8001a8c:	fb01 2213 	mls	r2, r1, r3, r2
 8001a90:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 8001a94:	6822      	ldr	r2, [r4, #0]
 8001a96:	bf28      	it	cs
 8001a98:	3301      	addcs	r3, #1
 8001a9a:	0412      	lsls	r2, r2, #16
 8001a9c:	d506      	bpl.n	8001aac <USART_Init+0xac>
 8001a9e:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 8001aa2:	f3c3 0142 	ubfx	r1, r3, #1, #3
 8001aa6:	401a      	ands	r2, r3
 8001aa8:	ea41 0302 	orr.w	r3, r1, r2
 8001aac:	b29b      	uxth	r3, r3
 8001aae:	81a3      	strh	r3, [r4, #12]
 8001ab0:	b019      	add	sp, #100	; 0x64
 8001ab2:	bd30      	pop	{r4, r5, pc}
 8001ab4:	40013800 	.word	0x40013800
 8001ab8:	40004400 	.word	0x40004400
 8001abc:	40004800 	.word	0x40004800
 8001ac0:	40004c00 	.word	0x40004c00

08001ac4 <USART_Cmd>:
 8001ac4:	bf00      	nop
 8001ac6:	bf00      	nop
 8001ac8:	6803      	ldr	r3, [r0, #0]
 8001aca:	b111      	cbz	r1, 8001ad2 <USART_Cmd+0xe>
 8001acc:	f043 0301 	orr.w	r3, r3, #1
 8001ad0:	e001      	b.n	8001ad6 <USART_Cmd+0x12>
 8001ad2:	f023 0301 	bic.w	r3, r3, #1
 8001ad6:	6003      	str	r3, [r0, #0]
 8001ad8:	4770      	bx	lr

08001ada <USART_ReceiveData>:
 8001ada:	bf00      	nop
 8001adc:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8001ade:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8001ae2:	4770      	bx	lr

08001ae4 <USART_ITConfig>:
 8001ae4:	b510      	push	{r4, lr}
 8001ae6:	bf00      	nop
 8001ae8:	bf00      	nop
 8001aea:	bf00      	nop
 8001aec:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8001af0:	2401      	movs	r4, #1
 8001af2:	b2c9      	uxtb	r1, r1
 8001af4:	2b02      	cmp	r3, #2
 8001af6:	fa04 f101 	lsl.w	r1, r4, r1
 8001afa:	d101      	bne.n	8001b00 <USART_ITConfig+0x1c>
 8001afc:	3004      	adds	r0, #4
 8001afe:	e002      	b.n	8001b06 <USART_ITConfig+0x22>
 8001b00:	2b03      	cmp	r3, #3
 8001b02:	bf08      	it	eq
 8001b04:	3008      	addeq	r0, #8
 8001b06:	6803      	ldr	r3, [r0, #0]
 8001b08:	b10a      	cbz	r2, 8001b0e <USART_ITConfig+0x2a>
 8001b0a:	4319      	orrs	r1, r3
 8001b0c:	e001      	b.n	8001b12 <USART_ITConfig+0x2e>
 8001b0e:	ea23 0101 	bic.w	r1, r3, r1
 8001b12:	6001      	str	r1, [r0, #0]
 8001b14:	bd10      	pop	{r4, pc}

08001b16 <USART_GetITStatus>:
 8001b16:	b510      	push	{r4, lr}
 8001b18:	bf00      	nop
 8001b1a:	bf00      	nop
 8001b1c:	2401      	movs	r4, #1
 8001b1e:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8001b22:	b2cb      	uxtb	r3, r1
 8001b24:	42a2      	cmp	r2, r4
 8001b26:	fa04 f303 	lsl.w	r3, r4, r3
 8001b2a:	d101      	bne.n	8001b30 <USART_GetITStatus+0x1a>
 8001b2c:	6802      	ldr	r2, [r0, #0]
 8001b2e:	e003      	b.n	8001b38 <USART_GetITStatus+0x22>
 8001b30:	2a02      	cmp	r2, #2
 8001b32:	bf0c      	ite	eq
 8001b34:	6842      	ldreq	r2, [r0, #4]
 8001b36:	6882      	ldrne	r2, [r0, #8]
 8001b38:	4013      	ands	r3, r2
 8001b3a:	69c2      	ldr	r2, [r0, #28]
 8001b3c:	b143      	cbz	r3, 8001b50 <USART_GetITStatus+0x3a>
 8001b3e:	2301      	movs	r3, #1
 8001b40:	0c09      	lsrs	r1, r1, #16
 8001b42:	fa03 f101 	lsl.w	r1, r3, r1
 8001b46:	4211      	tst	r1, r2
 8001b48:	bf0c      	ite	eq
 8001b4a:	2000      	moveq	r0, #0
 8001b4c:	2001      	movne	r0, #1
 8001b4e:	bd10      	pop	{r4, pc}
 8001b50:	4618      	mov	r0, r3
 8001b52:	bd10      	pop	{r4, pc}

08001b54 <USART_ClearITPendingBit>:
 8001b54:	bf00      	nop
 8001b56:	bf00      	nop
 8001b58:	2301      	movs	r3, #1
 8001b5a:	0c09      	lsrs	r1, r1, #16
 8001b5c:	fa03 f101 	lsl.w	r1, r3, r1
 8001b60:	6201      	str	r1, [r0, #32]
 8001b62:	4770      	bx	lr

08001b64 <uart_write>:
 8001b64:	4b03      	ldr	r3, [pc, #12]	; (8001b74 <uart_write+0x10>)
 8001b66:	69da      	ldr	r2, [r3, #28]
 8001b68:	0612      	lsls	r2, r2, #24
 8001b6a:	d401      	bmi.n	8001b70 <uart_write+0xc>
 8001b6c:	bf00      	nop
 8001b6e:	e7f9      	b.n	8001b64 <uart_write>
 8001b70:	8518      	strh	r0, [r3, #40]	; 0x28
 8001b72:	4770      	bx	lr
 8001b74:	40013800 	.word	0x40013800

08001b78 <uart_is_char>:
 8001b78:	4b0a      	ldr	r3, [pc, #40]	; (8001ba4 <uart_is_char+0x2c>)
 8001b7a:	4a0b      	ldr	r2, [pc, #44]	; (8001ba8 <uart_is_char+0x30>)
 8001b7c:	6819      	ldr	r1, [r3, #0]
 8001b7e:	6812      	ldr	r2, [r2, #0]
 8001b80:	4291      	cmp	r1, r2
 8001b82:	d00c      	beq.n	8001b9e <uart_is_char+0x26>
 8001b84:	681a      	ldr	r2, [r3, #0]
 8001b86:	4909      	ldr	r1, [pc, #36]	; (8001bac <uart_is_char+0x34>)
 8001b88:	5c88      	ldrb	r0, [r1, r2]
 8001b8a:	681a      	ldr	r2, [r3, #0]
 8001b8c:	3201      	adds	r2, #1
 8001b8e:	601a      	str	r2, [r3, #0]
 8001b90:	681a      	ldr	r2, [r3, #0]
 8001b92:	2a0f      	cmp	r2, #15
 8001b94:	b2c0      	uxtb	r0, r0
 8001b96:	d904      	bls.n	8001ba2 <uart_is_char+0x2a>
 8001b98:	2200      	movs	r2, #0
 8001b9a:	601a      	str	r2, [r3, #0]
 8001b9c:	4770      	bx	lr
 8001b9e:	f64f 70ff 	movw	r0, #65535	; 0xffff
 8001ba2:	4770      	bx	lr
 8001ba4:	20000dec 	.word	0x20000dec
 8001ba8:	20000de8 	.word	0x20000de8
 8001bac:	20000dd8 	.word	0x20000dd8

08001bb0 <uart_read>:
 8001bb0:	b508      	push	{r3, lr}
 8001bb2:	f7ff ffe1 	bl	8001b78 <uart_is_char>
 8001bb6:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8001bba:	4298      	cmp	r0, r3
 8001bbc:	d101      	bne.n	8001bc2 <uart_read+0x12>
 8001bbe:	bf00      	nop
 8001bc0:	e7f7      	b.n	8001bb2 <uart_read+0x2>
 8001bc2:	b2c0      	uxtb	r0, r0
 8001bc4:	bd08      	pop	{r3, pc}
	...

08001bc8 <uart_init>:
 8001bc8:	b530      	push	{r4, r5, lr}
 8001bca:	4b2c      	ldr	r3, [pc, #176]	; (8001c7c <uart_init+0xb4>)
 8001bcc:	4d2c      	ldr	r5, [pc, #176]	; (8001c80 <uart_init+0xb8>)
 8001bce:	2400      	movs	r4, #0
 8001bd0:	601c      	str	r4, [r3, #0]
 8001bd2:	4b2c      	ldr	r3, [pc, #176]	; (8001c84 <uart_init+0xbc>)
 8001bd4:	b08b      	sub	sp, #44	; 0x2c
 8001bd6:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001bda:	2101      	movs	r1, #1
 8001bdc:	601c      	str	r4, [r3, #0]
 8001bde:	f7ff fdc3 	bl	8001768 <RCC_AHBPeriphClockCmd>
 8001be2:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001be6:	2101      	movs	r1, #1
 8001be8:	f7ff fdcc 	bl	8001784 <RCC_APB2PeriphClockCmd>
 8001bec:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001bf0:	9302      	str	r3, [sp, #8]
 8001bf2:	2302      	movs	r3, #2
 8001bf4:	f88d 300c 	strb.w	r3, [sp, #12]
 8001bf8:	a902      	add	r1, sp, #8
 8001bfa:	2303      	movs	r3, #3
 8001bfc:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001c00:	f88d 300d 	strb.w	r3, [sp, #13]
 8001c04:	f88d 400e 	strb.w	r4, [sp, #14]
 8001c08:	f88d 400f 	strb.w	r4, [sp, #15]
 8001c0c:	f000 fa5d 	bl	80020ca <GPIO_Init>
 8001c10:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001c14:	2109      	movs	r1, #9
 8001c16:	2207      	movs	r2, #7
 8001c18:	f000 faa5 	bl	8002166 <GPIO_PinAFConfig>
 8001c1c:	2207      	movs	r2, #7
 8001c1e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001c22:	210a      	movs	r1, #10
 8001c24:	f000 fa9f 	bl	8002166 <GPIO_PinAFConfig>
 8001c28:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001c2c:	9304      	str	r3, [sp, #16]
 8001c2e:	4628      	mov	r0, r5
 8001c30:	230c      	movs	r3, #12
 8001c32:	a904      	add	r1, sp, #16
 8001c34:	9308      	str	r3, [sp, #32]
 8001c36:	9405      	str	r4, [sp, #20]
 8001c38:	9406      	str	r4, [sp, #24]
 8001c3a:	9407      	str	r4, [sp, #28]
 8001c3c:	9409      	str	r4, [sp, #36]	; 0x24
 8001c3e:	f7ff fedf 	bl	8001a00 <USART_Init>
 8001c42:	4628      	mov	r0, r5
 8001c44:	2101      	movs	r1, #1
 8001c46:	f7ff ff3d 	bl	8001ac4 <USART_Cmd>
 8001c4a:	2201      	movs	r2, #1
 8001c4c:	4628      	mov	r0, r5
 8001c4e:	490e      	ldr	r1, [pc, #56]	; (8001c88 <uart_init+0xc0>)
 8001c50:	f7ff ff48 	bl	8001ae4 <USART_ITConfig>
 8001c54:	2325      	movs	r3, #37	; 0x25
 8001c56:	f88d 4005 	strb.w	r4, [sp, #5]
 8001c5a:	f88d 4006 	strb.w	r4, [sp, #6]
 8001c5e:	a801      	add	r0, sp, #4
 8001c60:	2401      	movs	r4, #1
 8001c62:	f88d 3004 	strb.w	r3, [sp, #4]
 8001c66:	f88d 4007 	strb.w	r4, [sp, #7]
 8001c6a:	f000 f9e9 	bl	8002040 <NVIC_Init>
 8001c6e:	4628      	mov	r0, r5
 8001c70:	4621      	mov	r1, r4
 8001c72:	f7ff ff27 	bl	8001ac4 <USART_Cmd>
 8001c76:	b00b      	add	sp, #44	; 0x2c
 8001c78:	bd30      	pop	{r4, r5, pc}
 8001c7a:	bf00      	nop
 8001c7c:	20000de8 	.word	0x20000de8
 8001c80:	40013800 	.word	0x40013800
 8001c84:	20000dec 	.word	0x20000dec
 8001c88:	00050105 	.word	0x00050105

08001c8c <USART1_IRQHandler>:
 8001c8c:	b508      	push	{r3, lr}
 8001c8e:	480d      	ldr	r0, [pc, #52]	; (8001cc4 <USART1_IRQHandler+0x38>)
 8001c90:	490d      	ldr	r1, [pc, #52]	; (8001cc8 <USART1_IRQHandler+0x3c>)
 8001c92:	f7ff ff40 	bl	8001b16 <USART_GetITStatus>
 8001c96:	b178      	cbz	r0, 8001cb8 <USART1_IRQHandler+0x2c>
 8001c98:	480a      	ldr	r0, [pc, #40]	; (8001cc4 <USART1_IRQHandler+0x38>)
 8001c9a:	f7ff ff1e 	bl	8001ada <USART_ReceiveData>
 8001c9e:	4b0b      	ldr	r3, [pc, #44]	; (8001ccc <USART1_IRQHandler+0x40>)
 8001ca0:	490b      	ldr	r1, [pc, #44]	; (8001cd0 <USART1_IRQHandler+0x44>)
 8001ca2:	681a      	ldr	r2, [r3, #0]
 8001ca4:	b2c0      	uxtb	r0, r0
 8001ca6:	5488      	strb	r0, [r1, r2]
 8001ca8:	681a      	ldr	r2, [r3, #0]
 8001caa:	3201      	adds	r2, #1
 8001cac:	601a      	str	r2, [r3, #0]
 8001cae:	681a      	ldr	r2, [r3, #0]
 8001cb0:	2a0f      	cmp	r2, #15
 8001cb2:	bf84      	itt	hi
 8001cb4:	2200      	movhi	r2, #0
 8001cb6:	601a      	strhi	r2, [r3, #0]
 8001cb8:	4802      	ldr	r0, [pc, #8]	; (8001cc4 <USART1_IRQHandler+0x38>)
 8001cba:	4903      	ldr	r1, [pc, #12]	; (8001cc8 <USART1_IRQHandler+0x3c>)
 8001cbc:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001cc0:	f7ff bf48 	b.w	8001b54 <USART_ClearITPendingBit>
 8001cc4:	40013800 	.word	0x40013800
 8001cc8:	00050105 	.word	0x00050105
 8001ccc:	20000de8 	.word	0x20000de8
 8001cd0:	20000dd8 	.word	0x20000dd8

08001cd4 <uart_clear_buffer>:
 8001cd4:	b672      	cpsid	i
 8001cd6:	2300      	movs	r3, #0
 8001cd8:	4a03      	ldr	r2, [pc, #12]	; (8001ce8 <uart_clear_buffer+0x14>)
 8001cda:	2100      	movs	r1, #0
 8001cdc:	54d1      	strb	r1, [r2, r3]
 8001cde:	3301      	adds	r3, #1
 8001ce0:	2b10      	cmp	r3, #16
 8001ce2:	d1f9      	bne.n	8001cd8 <uart_clear_buffer+0x4>
 8001ce4:	b662      	cpsie	i
 8001ce6:	4770      	bx	lr
 8001ce8:	20000dd8 	.word	0x20000dd8

08001cec <i2c_delay>:
 8001cec:	bf00      	nop
 8001cee:	4770      	bx	lr

08001cf0 <SetLowSDA>:
 8001cf0:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001cf2:	4d0d      	ldr	r5, [pc, #52]	; (8001d28 <SetLowSDA+0x38>)
 8001cf4:	2301      	movs	r3, #1
 8001cf6:	2203      	movs	r2, #3
 8001cf8:	2480      	movs	r4, #128	; 0x80
 8001cfa:	f88d 3004 	strb.w	r3, [sp, #4]
 8001cfe:	f88d 3006 	strb.w	r3, [sp, #6]
 8001d02:	4628      	mov	r0, r5
 8001d04:	2300      	movs	r3, #0
 8001d06:	4669      	mov	r1, sp
 8001d08:	f88d 2005 	strb.w	r2, [sp, #5]
 8001d0c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001d10:	9400      	str	r4, [sp, #0]
 8001d12:	f000 f9da 	bl	80020ca <GPIO_Init>
 8001d16:	4628      	mov	r0, r5
 8001d18:	4621      	mov	r1, r4
 8001d1a:	f000 fa20 	bl	800215e <GPIO_ResetBits>
 8001d1e:	f7ff ffe5 	bl	8001cec <i2c_delay>
 8001d22:	b003      	add	sp, #12
 8001d24:	bd30      	pop	{r4, r5, pc}
 8001d26:	bf00      	nop
 8001d28:	48000400 	.word	0x48000400

08001d2c <SetHighSDA>:
 8001d2c:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001d2e:	4d0d      	ldr	r5, [pc, #52]	; (8001d64 <SetHighSDA+0x38>)
 8001d30:	2203      	movs	r2, #3
 8001d32:	2300      	movs	r3, #0
 8001d34:	2480      	movs	r4, #128	; 0x80
 8001d36:	f88d 2005 	strb.w	r2, [sp, #5]
 8001d3a:	4628      	mov	r0, r5
 8001d3c:	2201      	movs	r2, #1
 8001d3e:	4669      	mov	r1, sp
 8001d40:	f88d 3004 	strb.w	r3, [sp, #4]
 8001d44:	f88d 2006 	strb.w	r2, [sp, #6]
 8001d48:	f88d 3007 	strb.w	r3, [sp, #7]
 8001d4c:	9400      	str	r4, [sp, #0]
 8001d4e:	f000 f9bc 	bl	80020ca <GPIO_Init>
 8001d52:	4628      	mov	r0, r5
 8001d54:	4621      	mov	r1, r4
 8001d56:	f000 f9fe 	bl	8002156 <GPIO_SetBits>
 8001d5a:	f7ff ffc7 	bl	8001cec <i2c_delay>
 8001d5e:	b003      	add	sp, #12
 8001d60:	bd30      	pop	{r4, r5, pc}
 8001d62:	bf00      	nop
 8001d64:	48000400 	.word	0x48000400

08001d68 <SetLowSCL>:
 8001d68:	b508      	push	{r3, lr}
 8001d6a:	4804      	ldr	r0, [pc, #16]	; (8001d7c <SetLowSCL+0x14>)
 8001d6c:	2140      	movs	r1, #64	; 0x40
 8001d6e:	f000 f9f6 	bl	800215e <GPIO_ResetBits>
 8001d72:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001d76:	f7ff bfb9 	b.w	8001cec <i2c_delay>
 8001d7a:	bf00      	nop
 8001d7c:	48000400 	.word	0x48000400

08001d80 <SetHighSCL>:
 8001d80:	b508      	push	{r3, lr}
 8001d82:	4804      	ldr	r0, [pc, #16]	; (8001d94 <SetHighSCL+0x14>)
 8001d84:	2140      	movs	r1, #64	; 0x40
 8001d86:	f000 f9e6 	bl	8002156 <GPIO_SetBits>
 8001d8a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001d8e:	f7ff bfad 	b.w	8001cec <i2c_delay>
 8001d92:	bf00      	nop
 8001d94:	48000400 	.word	0x48000400

08001d98 <i2c_0_init>:
 8001d98:	b507      	push	{r0, r1, r2, lr}
 8001d9a:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001d9e:	2101      	movs	r1, #1
 8001da0:	f7ff fce2 	bl	8001768 <RCC_AHBPeriphClockCmd>
 8001da4:	23c0      	movs	r3, #192	; 0xc0
 8001da6:	9300      	str	r3, [sp, #0]
 8001da8:	2301      	movs	r3, #1
 8001daa:	2203      	movs	r2, #3
 8001dac:	480a      	ldr	r0, [pc, #40]	; (8001dd8 <i2c_0_init+0x40>)
 8001dae:	f88d 3004 	strb.w	r3, [sp, #4]
 8001db2:	4669      	mov	r1, sp
 8001db4:	f88d 3006 	strb.w	r3, [sp, #6]
 8001db8:	2300      	movs	r3, #0
 8001dba:	f88d 2005 	strb.w	r2, [sp, #5]
 8001dbe:	f88d 3007 	strb.w	r3, [sp, #7]
 8001dc2:	f000 f982 	bl	80020ca <GPIO_Init>
 8001dc6:	f7ff ffdb 	bl	8001d80 <SetHighSCL>
 8001dca:	f7ff ff91 	bl	8001cf0 <SetLowSDA>
 8001dce:	f7ff ffad 	bl	8001d2c <SetHighSDA>
 8001dd2:	b003      	add	sp, #12
 8001dd4:	f85d fb04 	ldr.w	pc, [sp], #4
 8001dd8:	48000400 	.word	0x48000400

08001ddc <i2cStart>:
 8001ddc:	b508      	push	{r3, lr}
 8001dde:	f7ff ffcf 	bl	8001d80 <SetHighSCL>
 8001de2:	f7ff ffa3 	bl	8001d2c <SetHighSDA>
 8001de6:	f7ff ffcb 	bl	8001d80 <SetHighSCL>
 8001dea:	f7ff ff81 	bl	8001cf0 <SetLowSDA>
 8001dee:	f7ff ffbb 	bl	8001d68 <SetLowSCL>
 8001df2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001df6:	f7ff bf99 	b.w	8001d2c <SetHighSDA>

08001dfa <i2cStop>:
 8001dfa:	b508      	push	{r3, lr}
 8001dfc:	f7ff ffb4 	bl	8001d68 <SetLowSCL>
 8001e00:	f7ff ff76 	bl	8001cf0 <SetLowSDA>
 8001e04:	f7ff ffbc 	bl	8001d80 <SetHighSCL>
 8001e08:	f7ff ff72 	bl	8001cf0 <SetLowSDA>
 8001e0c:	f7ff ffb8 	bl	8001d80 <SetHighSCL>
 8001e10:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001e14:	f7ff bf8a 	b.w	8001d2c <SetHighSDA>

08001e18 <i2cWrite>:
 8001e18:	b538      	push	{r3, r4, r5, lr}
 8001e1a:	4604      	mov	r4, r0
 8001e1c:	2508      	movs	r5, #8
 8001e1e:	f7ff ffa3 	bl	8001d68 <SetLowSCL>
 8001e22:	0623      	lsls	r3, r4, #24
 8001e24:	d502      	bpl.n	8001e2c <i2cWrite+0x14>
 8001e26:	f7ff ff81 	bl	8001d2c <SetHighSDA>
 8001e2a:	e001      	b.n	8001e30 <i2cWrite+0x18>
 8001e2c:	f7ff ff60 	bl	8001cf0 <SetLowSDA>
 8001e30:	3d01      	subs	r5, #1
 8001e32:	f7ff ffa5 	bl	8001d80 <SetHighSCL>
 8001e36:	0064      	lsls	r4, r4, #1
 8001e38:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001e3c:	b2e4      	uxtb	r4, r4
 8001e3e:	d1ee      	bne.n	8001e1e <i2cWrite+0x6>
 8001e40:	f7ff ff92 	bl	8001d68 <SetLowSCL>
 8001e44:	f7ff ff72 	bl	8001d2c <SetHighSDA>
 8001e48:	f7ff ff9a 	bl	8001d80 <SetHighSCL>
 8001e4c:	4b05      	ldr	r3, [pc, #20]	; (8001e64 <i2cWrite+0x4c>)
 8001e4e:	8a1c      	ldrh	r4, [r3, #16]
 8001e50:	b2a4      	uxth	r4, r4
 8001e52:	f7ff ff89 	bl	8001d68 <SetLowSCL>
 8001e56:	f7ff ff49 	bl	8001cec <i2c_delay>
 8001e5a:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 8001e5e:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 8001e62:	bd38      	pop	{r3, r4, r5, pc}
 8001e64:	48000400 	.word	0x48000400

08001e68 <i2cRead>:
 8001e68:	b570      	push	{r4, r5, r6, lr}
 8001e6a:	4606      	mov	r6, r0
 8001e6c:	f7ff ff7c 	bl	8001d68 <SetLowSCL>
 8001e70:	f7ff ff5c 	bl	8001d2c <SetHighSDA>
 8001e74:	2508      	movs	r5, #8
 8001e76:	2400      	movs	r4, #0
 8001e78:	f7ff ff82 	bl	8001d80 <SetHighSCL>
 8001e7c:	4b0d      	ldr	r3, [pc, #52]	; (8001eb4 <i2cRead+0x4c>)
 8001e7e:	8a1b      	ldrh	r3, [r3, #16]
 8001e80:	0064      	lsls	r4, r4, #1
 8001e82:	061a      	lsls	r2, r3, #24
 8001e84:	b2e4      	uxtb	r4, r4
 8001e86:	bf48      	it	mi
 8001e88:	3401      	addmi	r4, #1
 8001e8a:	f105 35ff 	add.w	r5, r5, #4294967295
 8001e8e:	bf48      	it	mi
 8001e90:	b2e4      	uxtbmi	r4, r4
 8001e92:	f7ff ff69 	bl	8001d68 <SetLowSCL>
 8001e96:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001e9a:	d1ed      	bne.n	8001e78 <i2cRead+0x10>
 8001e9c:	b10e      	cbz	r6, 8001ea2 <i2cRead+0x3a>
 8001e9e:	f7ff ff27 	bl	8001cf0 <SetLowSDA>
 8001ea2:	f7ff ff6d 	bl	8001d80 <SetHighSCL>
 8001ea6:	f7ff ff5f 	bl	8001d68 <SetLowSCL>
 8001eaa:	f7ff ff1f 	bl	8001cec <i2c_delay>
 8001eae:	4620      	mov	r0, r4
 8001eb0:	bd70      	pop	{r4, r5, r6, pc}
 8001eb2:	bf00      	nop
 8001eb4:	48000400 	.word	0x48000400

08001eb8 <i2c_write_reg>:
 8001eb8:	b570      	push	{r4, r5, r6, lr}
 8001eba:	4605      	mov	r5, r0
 8001ebc:	460c      	mov	r4, r1
 8001ebe:	4616      	mov	r6, r2
 8001ec0:	f7ff ff8c 	bl	8001ddc <i2cStart>
 8001ec4:	4628      	mov	r0, r5
 8001ec6:	f7ff ffa7 	bl	8001e18 <i2cWrite>
 8001eca:	4620      	mov	r0, r4
 8001ecc:	f7ff ffa4 	bl	8001e18 <i2cWrite>
 8001ed0:	4630      	mov	r0, r6
 8001ed2:	f7ff ffa1 	bl	8001e18 <i2cWrite>
 8001ed6:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001eda:	f7ff bf8e 	b.w	8001dfa <i2cStop>

08001ede <i2c_read_reg>:
 8001ede:	b538      	push	{r3, r4, r5, lr}
 8001ee0:	4604      	mov	r4, r0
 8001ee2:	460d      	mov	r5, r1
 8001ee4:	f7ff ff7a 	bl	8001ddc <i2cStart>
 8001ee8:	4620      	mov	r0, r4
 8001eea:	f7ff ff95 	bl	8001e18 <i2cWrite>
 8001eee:	4628      	mov	r0, r5
 8001ef0:	f7ff ff92 	bl	8001e18 <i2cWrite>
 8001ef4:	f7ff ff72 	bl	8001ddc <i2cStart>
 8001ef8:	f044 0001 	orr.w	r0, r4, #1
 8001efc:	f7ff ff8c 	bl	8001e18 <i2cWrite>
 8001f00:	2000      	movs	r0, #0
 8001f02:	f7ff ffb1 	bl	8001e68 <i2cRead>
 8001f06:	4604      	mov	r4, r0
 8001f08:	f7ff ff77 	bl	8001dfa <i2cStop>
 8001f0c:	4620      	mov	r0, r4
 8001f0e:	bd38      	pop	{r3, r4, r5, pc}

08001f10 <SystemInit>:
 8001f10:	4b3b      	ldr	r3, [pc, #236]	; (8002000 <SystemInit+0xf0>)
 8001f12:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001f16:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001f1a:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001f1e:	4b39      	ldr	r3, [pc, #228]	; (8002004 <SystemInit+0xf4>)
 8001f20:	681a      	ldr	r2, [r3, #0]
 8001f22:	f042 0201 	orr.w	r2, r2, #1
 8001f26:	601a      	str	r2, [r3, #0]
 8001f28:	6859      	ldr	r1, [r3, #4]
 8001f2a:	4a37      	ldr	r2, [pc, #220]	; (8002008 <SystemInit+0xf8>)
 8001f2c:	400a      	ands	r2, r1
 8001f2e:	605a      	str	r2, [r3, #4]
 8001f30:	681a      	ldr	r2, [r3, #0]
 8001f32:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 8001f36:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8001f3a:	601a      	str	r2, [r3, #0]
 8001f3c:	681a      	ldr	r2, [r3, #0]
 8001f3e:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 8001f42:	601a      	str	r2, [r3, #0]
 8001f44:	685a      	ldr	r2, [r3, #4]
 8001f46:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8001f4a:	605a      	str	r2, [r3, #4]
 8001f4c:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001f4e:	f022 020f 	bic.w	r2, r2, #15
 8001f52:	62da      	str	r2, [r3, #44]	; 0x2c
 8001f54:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8001f56:	4a2d      	ldr	r2, [pc, #180]	; (800200c <SystemInit+0xfc>)
 8001f58:	b082      	sub	sp, #8
 8001f5a:	400a      	ands	r2, r1
 8001f5c:	631a      	str	r2, [r3, #48]	; 0x30
 8001f5e:	2200      	movs	r2, #0
 8001f60:	609a      	str	r2, [r3, #8]
 8001f62:	9200      	str	r2, [sp, #0]
 8001f64:	9201      	str	r2, [sp, #4]
 8001f66:	681a      	ldr	r2, [r3, #0]
 8001f68:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001f6c:	601a      	str	r2, [r3, #0]
 8001f6e:	4b25      	ldr	r3, [pc, #148]	; (8002004 <SystemInit+0xf4>)
 8001f70:	681a      	ldr	r2, [r3, #0]
 8001f72:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8001f76:	9201      	str	r2, [sp, #4]
 8001f78:	9a00      	ldr	r2, [sp, #0]
 8001f7a:	3201      	adds	r2, #1
 8001f7c:	9200      	str	r2, [sp, #0]
 8001f7e:	9a01      	ldr	r2, [sp, #4]
 8001f80:	b91a      	cbnz	r2, 8001f8a <SystemInit+0x7a>
 8001f82:	9a00      	ldr	r2, [sp, #0]
 8001f84:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8001f88:	d1f1      	bne.n	8001f6e <SystemInit+0x5e>
 8001f8a:	681b      	ldr	r3, [r3, #0]
 8001f8c:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8001f90:	bf18      	it	ne
 8001f92:	2301      	movne	r3, #1
 8001f94:	9301      	str	r3, [sp, #4]
 8001f96:	9b01      	ldr	r3, [sp, #4]
 8001f98:	2b01      	cmp	r3, #1
 8001f9a:	d005      	beq.n	8001fa8 <SystemInit+0x98>
 8001f9c:	4b18      	ldr	r3, [pc, #96]	; (8002000 <SystemInit+0xf0>)
 8001f9e:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8001fa2:	609a      	str	r2, [r3, #8]
 8001fa4:	b002      	add	sp, #8
 8001fa6:	4770      	bx	lr
 8001fa8:	4b19      	ldr	r3, [pc, #100]	; (8002010 <SystemInit+0x100>)
 8001faa:	2212      	movs	r2, #18
 8001fac:	601a      	str	r2, [r3, #0]
 8001fae:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 8001fb2:	685a      	ldr	r2, [r3, #4]
 8001fb4:	605a      	str	r2, [r3, #4]
 8001fb6:	685a      	ldr	r2, [r3, #4]
 8001fb8:	605a      	str	r2, [r3, #4]
 8001fba:	685a      	ldr	r2, [r3, #4]
 8001fbc:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8001fc0:	605a      	str	r2, [r3, #4]
 8001fc2:	685a      	ldr	r2, [r3, #4]
 8001fc4:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8001fc8:	605a      	str	r2, [r3, #4]
 8001fca:	685a      	ldr	r2, [r3, #4]
 8001fcc:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8001fd0:	605a      	str	r2, [r3, #4]
 8001fd2:	681a      	ldr	r2, [r3, #0]
 8001fd4:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8001fd8:	601a      	str	r2, [r3, #0]
 8001fda:	6819      	ldr	r1, [r3, #0]
 8001fdc:	4a09      	ldr	r2, [pc, #36]	; (8002004 <SystemInit+0xf4>)
 8001fde:	0189      	lsls	r1, r1, #6
 8001fe0:	d5fb      	bpl.n	8001fda <SystemInit+0xca>
 8001fe2:	6853      	ldr	r3, [r2, #4]
 8001fe4:	f023 0303 	bic.w	r3, r3, #3
 8001fe8:	6053      	str	r3, [r2, #4]
 8001fea:	6853      	ldr	r3, [r2, #4]
 8001fec:	f043 0302 	orr.w	r3, r3, #2
 8001ff0:	6053      	str	r3, [r2, #4]
 8001ff2:	4b04      	ldr	r3, [pc, #16]	; (8002004 <SystemInit+0xf4>)
 8001ff4:	685b      	ldr	r3, [r3, #4]
 8001ff6:	f003 030c 	and.w	r3, r3, #12
 8001ffa:	2b08      	cmp	r3, #8
 8001ffc:	d1f9      	bne.n	8001ff2 <SystemInit+0xe2>
 8001ffe:	e7cd      	b.n	8001f9c <SystemInit+0x8c>
 8002000:	e000ed00 	.word	0xe000ed00
 8002004:	40021000 	.word	0x40021000
 8002008:	f87fc00c 	.word	0xf87fc00c
 800200c:	ff00fccc 	.word	0xff00fccc
 8002010:	40022000 	.word	0x40022000

08002014 <sys_tick_init>:
 8002014:	4b05      	ldr	r3, [pc, #20]	; (800202c <sys_tick_init+0x18>)
 8002016:	4a06      	ldr	r2, [pc, #24]	; (8002030 <sys_tick_init+0x1c>)
 8002018:	605a      	str	r2, [r3, #4]
 800201a:	4a06      	ldr	r2, [pc, #24]	; (8002034 <sys_tick_init+0x20>)
 800201c:	21f0      	movs	r1, #240	; 0xf0
 800201e:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8002022:	2200      	movs	r2, #0
 8002024:	609a      	str	r2, [r3, #8]
 8002026:	2207      	movs	r2, #7
 8002028:	601a      	str	r2, [r3, #0]
 800202a:	4770      	bx	lr
 800202c:	e000e010 	.word	0xe000e010
 8002030:	00029040 	.word	0x00029040
 8002034:	e000ed00 	.word	0xe000ed00

08002038 <sleep>:
 8002038:	bf30      	wfi
 800203a:	4770      	bx	lr

0800203c <sytem_clock_init>:
 800203c:	f7ff bf68 	b.w	8001f10 <SystemInit>

08002040 <NVIC_Init>:
 8002040:	b510      	push	{r4, lr}
 8002042:	bf00      	nop
 8002044:	bf00      	nop
 8002046:	bf00      	nop
 8002048:	78c2      	ldrb	r2, [r0, #3]
 800204a:	7803      	ldrb	r3, [r0, #0]
 800204c:	b30a      	cbz	r2, 8002092 <NVIC_Init+0x52>
 800204e:	4a16      	ldr	r2, [pc, #88]	; (80020a8 <NVIC_Init+0x68>)
 8002050:	7844      	ldrb	r4, [r0, #1]
 8002052:	68d2      	ldr	r2, [r2, #12]
 8002054:	43d2      	mvns	r2, r2
 8002056:	f3c2 2202 	ubfx	r2, r2, #8, #3
 800205a:	f1c2 0104 	rsb	r1, r2, #4
 800205e:	b2c9      	uxtb	r1, r1
 8002060:	fa04 f101 	lsl.w	r1, r4, r1
 8002064:	240f      	movs	r4, #15
 8002066:	fa44 f202 	asr.w	r2, r4, r2
 800206a:	7884      	ldrb	r4, [r0, #2]
 800206c:	b2c9      	uxtb	r1, r1
 800206e:	4022      	ands	r2, r4
 8002070:	430a      	orrs	r2, r1
 8002072:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8002076:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 800207a:	0112      	lsls	r2, r2, #4
 800207c:	b2d2      	uxtb	r2, r2
 800207e:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8002082:	7803      	ldrb	r3, [r0, #0]
 8002084:	2201      	movs	r2, #1
 8002086:	0959      	lsrs	r1, r3, #5
 8002088:	f003 031f 	and.w	r3, r3, #31
 800208c:	fa02 f303 	lsl.w	r3, r2, r3
 8002090:	e006      	b.n	80020a0 <NVIC_Init+0x60>
 8002092:	0959      	lsrs	r1, r3, #5
 8002094:	2201      	movs	r2, #1
 8002096:	f003 031f 	and.w	r3, r3, #31
 800209a:	fa02 f303 	lsl.w	r3, r2, r3
 800209e:	3120      	adds	r1, #32
 80020a0:	4a02      	ldr	r2, [pc, #8]	; (80020ac <NVIC_Init+0x6c>)
 80020a2:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 80020a6:	bd10      	pop	{r4, pc}
 80020a8:	e000ed00 	.word	0xe000ed00
 80020ac:	e000e100 	.word	0xe000e100

080020b0 <lib_low_level_init>:
 80020b0:	b508      	push	{r3, lr}
 80020b2:	f7ff ffc3 	bl	800203c <sytem_clock_init>
 80020b6:	f000 f899 	bl	80021ec <gpio_init>
 80020ba:	f7ff fd85 	bl	8001bc8 <uart_init>
 80020be:	f7ff fbe1 	bl	8001884 <timer_init>
 80020c2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80020c6:	f7ff be67 	b.w	8001d98 <i2c_0_init>

080020ca <GPIO_Init>:
 80020ca:	b5f0      	push	{r4, r5, r6, r7, lr}
 80020cc:	bf00      	nop
 80020ce:	bf00      	nop
 80020d0:	bf00      	nop
 80020d2:	bf00      	nop
 80020d4:	2300      	movs	r3, #0
 80020d6:	680e      	ldr	r6, [r1, #0]
 80020d8:	461a      	mov	r2, r3
 80020da:	2501      	movs	r5, #1
 80020dc:	4095      	lsls	r5, r2
 80020de:	ea05 0406 	and.w	r4, r5, r6
 80020e2:	42ac      	cmp	r4, r5
 80020e4:	d131      	bne.n	800214a <GPIO_Init+0x80>
 80020e6:	790d      	ldrb	r5, [r1, #4]
 80020e8:	1e6f      	subs	r7, r5, #1
 80020ea:	b2ff      	uxtb	r7, r7
 80020ec:	2f01      	cmp	r7, #1
 80020ee:	d81c      	bhi.n	800212a <GPIO_Init+0x60>
 80020f0:	bf00      	nop
 80020f2:	f04f 0c03 	mov.w	ip, #3
 80020f6:	6887      	ldr	r7, [r0, #8]
 80020f8:	fa0c fc03 	lsl.w	ip, ip, r3
 80020fc:	ea27 070c 	bic.w	r7, r7, ip
 8002100:	6087      	str	r7, [r0, #8]
 8002102:	f891 c005 	ldrb.w	ip, [r1, #5]
 8002106:	6887      	ldr	r7, [r0, #8]
 8002108:	fa0c fc03 	lsl.w	ip, ip, r3
 800210c:	ea4c 0707 	orr.w	r7, ip, r7
 8002110:	6087      	str	r7, [r0, #8]
 8002112:	bf00      	nop
 8002114:	8887      	ldrh	r7, [r0, #4]
 8002116:	b2bf      	uxth	r7, r7
 8002118:	ea27 0404 	bic.w	r4, r7, r4
 800211c:	8084      	strh	r4, [r0, #4]
 800211e:	798c      	ldrb	r4, [r1, #6]
 8002120:	8887      	ldrh	r7, [r0, #4]
 8002122:	4094      	lsls	r4, r2
 8002124:	433c      	orrs	r4, r7
 8002126:	b2a4      	uxth	r4, r4
 8002128:	8084      	strh	r4, [r0, #4]
 800212a:	2403      	movs	r4, #3
 800212c:	6807      	ldr	r7, [r0, #0]
 800212e:	409c      	lsls	r4, r3
 8002130:	43e4      	mvns	r4, r4
 8002132:	4027      	ands	r7, r4
 8002134:	6007      	str	r7, [r0, #0]
 8002136:	6807      	ldr	r7, [r0, #0]
 8002138:	409d      	lsls	r5, r3
 800213a:	433d      	orrs	r5, r7
 800213c:	6005      	str	r5, [r0, #0]
 800213e:	68c5      	ldr	r5, [r0, #12]
 8002140:	402c      	ands	r4, r5
 8002142:	79cd      	ldrb	r5, [r1, #7]
 8002144:	409d      	lsls	r5, r3
 8002146:	432c      	orrs	r4, r5
 8002148:	60c4      	str	r4, [r0, #12]
 800214a:	3201      	adds	r2, #1
 800214c:	2a10      	cmp	r2, #16
 800214e:	f103 0302 	add.w	r3, r3, #2
 8002152:	d1c2      	bne.n	80020da <GPIO_Init+0x10>
 8002154:	bdf0      	pop	{r4, r5, r6, r7, pc}

08002156 <GPIO_SetBits>:
 8002156:	bf00      	nop
 8002158:	bf00      	nop
 800215a:	6181      	str	r1, [r0, #24]
 800215c:	4770      	bx	lr

0800215e <GPIO_ResetBits>:
 800215e:	bf00      	nop
 8002160:	bf00      	nop
 8002162:	8501      	strh	r1, [r0, #40]	; 0x28
 8002164:	4770      	bx	lr

08002166 <GPIO_PinAFConfig>:
 8002166:	b510      	push	{r4, lr}
 8002168:	bf00      	nop
 800216a:	bf00      	nop
 800216c:	bf00      	nop
 800216e:	f001 0307 	and.w	r3, r1, #7
 8002172:	08c9      	lsrs	r1, r1, #3
 8002174:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8002178:	009b      	lsls	r3, r3, #2
 800217a:	6a04      	ldr	r4, [r0, #32]
 800217c:	210f      	movs	r1, #15
 800217e:	4099      	lsls	r1, r3
 8002180:	ea24 0101 	bic.w	r1, r4, r1
 8002184:	6201      	str	r1, [r0, #32]
 8002186:	6a01      	ldr	r1, [r0, #32]
 8002188:	fa02 f303 	lsl.w	r3, r2, r3
 800218c:	430b      	orrs	r3, r1
 800218e:	6203      	str	r3, [r0, #32]
 8002190:	bd10      	pop	{r4, pc}
	...

08002194 <led_on>:
 8002194:	0401      	lsls	r1, r0, #16
 8002196:	d503      	bpl.n	80021a0 <led_on+0xc>
 8002198:	4b08      	ldr	r3, [pc, #32]	; (80021bc <led_on+0x28>)
 800219a:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800219e:	619a      	str	r2, [r3, #24]
 80021a0:	0702      	lsls	r2, r0, #28
 80021a2:	d503      	bpl.n	80021ac <led_on+0x18>
 80021a4:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80021a8:	2208      	movs	r2, #8
 80021aa:	851a      	strh	r2, [r3, #40]	; 0x28
 80021ac:	07c3      	lsls	r3, r0, #31
 80021ae:	d503      	bpl.n	80021b8 <led_on+0x24>
 80021b0:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80021b4:	2201      	movs	r2, #1
 80021b6:	619a      	str	r2, [r3, #24]
 80021b8:	4770      	bx	lr
 80021ba:	bf00      	nop
 80021bc:	48000400 	.word	0x48000400

080021c0 <led_off>:
 80021c0:	0402      	lsls	r2, r0, #16
 80021c2:	d503      	bpl.n	80021cc <led_off+0xc>
 80021c4:	4b08      	ldr	r3, [pc, #32]	; (80021e8 <led_off+0x28>)
 80021c6:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80021ca:	851a      	strh	r2, [r3, #40]	; 0x28
 80021cc:	0703      	lsls	r3, r0, #28
 80021ce:	d503      	bpl.n	80021d8 <led_off+0x18>
 80021d0:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80021d4:	2208      	movs	r2, #8
 80021d6:	619a      	str	r2, [r3, #24]
 80021d8:	07c0      	lsls	r0, r0, #31
 80021da:	d503      	bpl.n	80021e4 <led_off+0x24>
 80021dc:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80021e0:	2201      	movs	r2, #1
 80021e2:	851a      	strh	r2, [r3, #40]	; 0x28
 80021e4:	4770      	bx	lr
 80021e6:	bf00      	nop
 80021e8:	48000400 	.word	0x48000400

080021ec <gpio_init>:
 80021ec:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 80021f0:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80021f4:	2101      	movs	r1, #1
 80021f6:	f7ff fab7 	bl	8001768 <RCC_AHBPeriphClockCmd>
 80021fa:	f8df 90a8 	ldr.w	r9, [pc, #168]	; 80022a4 <gpio_init+0xb8>
 80021fe:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8002202:	2101      	movs	r1, #1
 8002204:	f7ff fab0 	bl	8001768 <RCC_AHBPeriphClockCmd>
 8002208:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 800220c:	2101      	movs	r1, #1
 800220e:	f7ff faab 	bl	8001768 <RCC_AHBPeriphClockCmd>
 8002212:	2400      	movs	r4, #0
 8002214:	2501      	movs	r5, #1
 8002216:	2603      	movs	r6, #3
 8002218:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 800221c:	4648      	mov	r0, r9
 800221e:	4669      	mov	r1, sp
 8002220:	2708      	movs	r7, #8
 8002222:	f8cd 8000 	str.w	r8, [sp]
 8002226:	f88d 5004 	strb.w	r5, [sp, #4]
 800222a:	f88d 4006 	strb.w	r4, [sp, #6]
 800222e:	f88d 6005 	strb.w	r6, [sp, #5]
 8002232:	f88d 4007 	strb.w	r4, [sp, #7]
 8002236:	f7ff ff48 	bl	80020ca <GPIO_Init>
 800223a:	4669      	mov	r1, sp
 800223c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8002240:	9700      	str	r7, [sp, #0]
 8002242:	f88d 5004 	strb.w	r5, [sp, #4]
 8002246:	f88d 4006 	strb.w	r4, [sp, #6]
 800224a:	f88d 6005 	strb.w	r6, [sp, #5]
 800224e:	f88d 4007 	strb.w	r4, [sp, #7]
 8002252:	f7ff ff3a 	bl	80020ca <GPIO_Init>
 8002256:	4669      	mov	r1, sp
 8002258:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800225c:	9500      	str	r5, [sp, #0]
 800225e:	f88d 5004 	strb.w	r5, [sp, #4]
 8002262:	f88d 4006 	strb.w	r4, [sp, #6]
 8002266:	f88d 6005 	strb.w	r6, [sp, #5]
 800226a:	f88d 4007 	strb.w	r4, [sp, #7]
 800226e:	f7ff ff2c 	bl	80020ca <GPIO_Init>
 8002272:	f44f 7300 	mov.w	r3, #512	; 0x200
 8002276:	4669      	mov	r1, sp
 8002278:	4648      	mov	r0, r9
 800227a:	9300      	str	r3, [sp, #0]
 800227c:	f88d 4004 	strb.w	r4, [sp, #4]
 8002280:	f88d 6005 	strb.w	r6, [sp, #5]
 8002284:	f88d 4007 	strb.w	r4, [sp, #7]
 8002288:	f7ff ff1f 	bl	80020ca <GPIO_Init>
 800228c:	4640      	mov	r0, r8
 800228e:	f7ff ff81 	bl	8002194 <led_on>
 8002292:	4638      	mov	r0, r7
 8002294:	f7ff ff94 	bl	80021c0 <led_off>
 8002298:	4628      	mov	r0, r5
 800229a:	f7ff ff91 	bl	80021c0 <led_off>
 800229e:	b003      	add	sp, #12
 80022a0:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80022a4:	48000400 	.word	0x48000400

080022a8 <get_key>:
 80022a8:	4b02      	ldr	r3, [pc, #8]	; (80022b4 <get_key+0xc>)
 80022aa:	8a18      	ldrh	r0, [r3, #16]
 80022ac:	43c0      	mvns	r0, r0
 80022ae:	f400 7000 	and.w	r0, r0, #512	; 0x200
 80022b2:	4770      	bx	lr
 80022b4:	48000400 	.word	0x48000400

080022b8 <Default_Handler>:
 80022b8:	4668      	mov	r0, sp
 80022ba:	f020 0107 	bic.w	r1, r0, #7
 80022be:	468d      	mov	sp, r1
 80022c0:	bf00      	nop
 80022c2:	e7fd      	b.n	80022c0 <Default_Handler+0x8>

080022c4 <HardFault_Handler>:
 80022c4:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80022c8:	f7ff ff64 	bl	8002194 <led_on>
 80022cc:	4b06      	ldr	r3, [pc, #24]	; (80022e8 <HardFault_Handler+0x24>)
 80022ce:	3b01      	subs	r3, #1
 80022d0:	d001      	beq.n	80022d6 <HardFault_Handler+0x12>
 80022d2:	bf00      	nop
 80022d4:	e7fb      	b.n	80022ce <HardFault_Handler+0xa>
 80022d6:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80022da:	f7ff ff71 	bl	80021c0 <led_off>
 80022de:	4b02      	ldr	r3, [pc, #8]	; (80022e8 <HardFault_Handler+0x24>)
 80022e0:	3b01      	subs	r3, #1
 80022e2:	d0ef      	beq.n	80022c4 <HardFault_Handler>
 80022e4:	bf00      	nop
 80022e6:	e7fb      	b.n	80022e0 <HardFault_Handler+0x1c>
 80022e8:	00989681 	.word	0x00989681

080022ec <_reset_init>:
 80022ec:	4a0e      	ldr	r2, [pc, #56]	; (8002328 <_reset_init+0x3c>)
 80022ee:	480f      	ldr	r0, [pc, #60]	; (800232c <_reset_init+0x40>)
 80022f0:	1a80      	subs	r0, r0, r2
 80022f2:	1080      	asrs	r0, r0, #2
 80022f4:	2300      	movs	r3, #0
 80022f6:	4283      	cmp	r3, r0
 80022f8:	d006      	beq.n	8002308 <_reset_init+0x1c>
 80022fa:	490d      	ldr	r1, [pc, #52]	; (8002330 <_reset_init+0x44>)
 80022fc:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8002300:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8002304:	3301      	adds	r3, #1
 8002306:	e7f6      	b.n	80022f6 <_reset_init+0xa>
 8002308:	4b0a      	ldr	r3, [pc, #40]	; (8002334 <_reset_init+0x48>)
 800230a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800230e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8002312:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8002316:	f503 730c 	add.w	r3, r3, #560	; 0x230
 800231a:	685a      	ldr	r2, [r3, #4]
 800231c:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8002320:	605a      	str	r2, [r3, #4]
 8002322:	f7ff b881 	b.w	8001428 <main>
 8002326:	bf00      	nop
 8002328:	20000000 	.word	0x20000000
 800232c:	20000030 	.word	0x20000030
 8002330:	0800248c 	.word	0x0800248c
 8002334:	e000ed00 	.word	0xe000ed00

08002338 <_init>:
 8002338:	e1a0c00d 	mov	ip, sp
 800233c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8002340:	e24cb004 	sub	fp, ip, #4
 8002344:	e24bd028 	sub	sp, fp, #40	; 0x28
 8002348:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 800234c:	e12fff1e 	bx	lr

08002350 <_fini>:
 8002350:	e1a0c00d 	mov	ip, sp
 8002354:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8002358:	e24cb004 	sub	fp, ip, #4
 800235c:	e24bd028 	sub	sp, fp, #40	; 0x28
 8002360:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8002364:	e12fff1e 	bx	lr
 8002368:	69647473 	.word	0x69647473
 800236c:	6e69206f 	.word	0x6e69206f
 8002370:	64207469 	.word	0x64207469
 8002374:	0a656e6f 	.word	0x0a656e6f
 8002378:	00          	.byte	0x00
 8002379:	41          	.byte	0x41
 800237a:	2b54      	.short	0x2b54
 800237c:	4d504943 	.word	0x4d504943
 8002380:	313d5855 	.word	0x313d5855
 8002384:	41000a0d 	.word	0x41000a0d
 8002388:	49432b54 	.word	0x49432b54
 800238c:	58554d50 	.word	0x58554d50
 8002390:	0a0d303d 	.word	0x0a0d303d
 8002394:	2b544100 	.word	0x2b544100
 8002398:	4f4d5743 	.word	0x4f4d5743
 800239c:	313d4544 	.word	0x313d4544
 80023a0:	41000a0d 	.word	0x41000a0d
 80023a4:	57432b54 	.word	0x57432b54
 80023a8:	3d50414a 	.word	0x3d50414a
 80023ac:	69640022 	.word	0x69640022
 80023b0:	6e6f6373 	.word	0x6e6f6373
 80023b4:	7463656e 	.word	0x7463656e
 80023b8:	76006465 	.word	0x76006465
 80023bc:	68797265 	.word	0x68797265
 80023c0:	00647261 	.word	0x00647261
 80023c4:	000a0d22 	.word	0x000a0d22
 80023c8:	432b5441 	.word	0x432b5441
 80023cc:	45535049 	.word	0x45535049
 80023d0:	52455652 	.word	0x52455652
 80023d4:	382c313d 	.word	0x382c313d
 80023d8:	000a0d30 	.word	0x000a0d30
 80023dc:	432b5441 	.word	0x432b5441
 80023e0:	54535049 	.word	0x54535049
 80023e4:	3d545241 	.word	0x3d545241
 80023e8:	50435422 	.word	0x50435422
 80023ec:	00222c22 	.word	0x00222c22
 80023f0:	41002c22 	.word	0x41002c22
 80023f4:	49432b54 	.word	0x49432b54
 80023f8:	4e455350 	.word	0x4e455350
 80023fc:	3e003d44 	.word	0x3e003d44
 8002400:	2b544100 	.word	0x2b544100
 8002404:	43504943 	.word	0x43504943
 8002408:	45534f4c 	.word	0x45534f4c
 800240c:	53000a0d 	.word	0x53000a0d
 8002410:	20444e45 	.word	0x20444e45
 8002414:	2b004b4f 	.word	0x2b004b4f
 8002418:	2c445049 	.word	0x2c445049
 800241c:	00          	.byte	0x00
 800241d:	31          	.byte	0x31
 800241e:	3239      	.short	0x3239
 8002420:	3836312e 	.word	0x3836312e
 8002424:	322e322e 	.word	0x322e322e
 8002428:	70736500 	.word	0x70736500
 800242c:	36363238 	.word	0x36363238
 8002430:	73656d20 	.word	0x73656d20
 8002434:	65676173 	.word	0x65676173
 8002438:	00          	.byte	0x00
 8002439:	65          	.byte	0x65
 800243a:	7272      	.short	0x7272
 800243c:	6320726f 	.word	0x6320726f
 8002440:	2065646f 	.word	0x2065646f
 8002444:	253a7525 	.word	0x253a7525
 8002448:	0a75      	.short	0x0a75
 800244a:	00          	.byte	0x00
 800244b:	0a          	.byte	0x0a
 800244c:	636c6577 	.word	0x636c6577
 8002450:	20656d6f 	.word	0x20656d6f
 8002454:	53206f74 	.word	0x53206f74
 8002458:	68757a75 	.word	0x68757a75
 800245c:	20534f61 	.word	0x20534f61
 8002460:	205e5f5e 	.word	0x205e5f5e
 8002464:	2e302e32 	.word	0x2e302e32
 8002468:	55420a36 	.word	0x55420a36
 800246c:	20444c49 	.word	0x20444c49
 8002470:	2072614d 	.word	0x2072614d
 8002474:	32203120 	.word	0x32203120
 8002478:	20363130 	.word	0x20363130
 800247c:	303a3431 	.word	0x303a3431
 8002480:	39333a37 	.word	0x39333a37
 8002484:	0000000a 	.word	0x0000000a

08002488 <__EH_FRAME_BEGIN__>:
 8002488:	00000000                                ....
