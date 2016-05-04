
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
 80001a0:	20000098 	.word	0x20000098
 80001a4:	20000050 	.word	0x20000050

080001a8 <null_thread>:
 80001a8:	b508      	push	{r3, lr}
 80001aa:	f002 f8c1 	bl	8002330 <sleep>
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
 800020c:	20000050 	.word	0x20000050
 8000210:	20000098 	.word	0x20000098

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
 8000254:	20000098 	.word	0x20000098
 8000258:	20000050 	.word	0x20000050

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
 800027c:	20000098 	.word	0x20000098

08000280 <kernel_start>:
 8000280:	b508      	push	{r3, lr}
 8000282:	f002 f843 	bl	800230c <sys_tick_init>
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
 80002f8:	20000050 	.word	0x20000050
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
 8000334:	20000050 	.word	0x20000050
 8000338:	20000098 	.word	0x20000098
 800033c:	080001a9 	.word	0x080001a9
 8000340:	2000009c 	.word	0x2000009c

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
 8000384:	20000050 	.word	0x20000050

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
 80003a8:	20000050 	.word	0x20000050

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
 80003d8:	2000011c 	.word	0x2000011c
 80003dc:	20000134 	.word	0x20000134

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
 80003fe:	f001 fd29 	bl	8001e54 <uart_write>
 8000402:	4620      	mov	r0, r4
 8000404:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000408:	f000 b915 	b.w	8000636 <mutex_unlock>
 800040c:	20000174 	.word	0x20000174

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
 8000434:	20000180 	.word	0x20000180

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
 8000584:	2000017c 	.word	0x2000017c

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
 80005c4:	20000174 	.word	0x20000174
 80005c8:	20000178 	.word	0x20000178
 80005cc:	20000180 	.word	0x20000180
 80005d0:	2000017c 	.word	0x2000017c
 80005d4:	08002670 	.word	0x08002670

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
 8000652:	f001 fbff 	bl	8001e54 <uart_write>
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
 8000690:	f001 fae8 	bl	8001c64 <timer_get_time>
 8000694:	4405      	add	r5, r0
 8000696:	f001 fc95 	bl	8001fc4 <uart_clear_buffer>
 800069a:	2400      	movs	r4, #0
 800069c:	f001 fbe4 	bl	8001e68 <uart_is_char>
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
 80006b8:	f001 fc84 	bl	8001fc4 <uart_clear_buffer>
 80006bc:	2001      	movs	r0, #1
 80006be:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80006c0:	2400      	movs	r4, #0
 80006c2:	f001 facf 	bl	8001c64 <timer_get_time>
 80006c6:	42a8      	cmp	r0, r5
 80006c8:	d3e8      	bcc.n	800069c <esp8266_find_stream+0x14>
 80006ca:	f001 fc7b 	bl	8001fc4 <uart_clear_buffer>
 80006ce:	2000      	movs	r0, #0
 80006d0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

080006d4 <esp8266_init>:
 80006d4:	4b1d      	ldr	r3, [pc, #116]	; (800074c <esp8266_init+0x78>)
 80006d6:	b510      	push	{r4, lr}
 80006d8:	2200      	movs	r2, #0
 80006da:	4604      	mov	r4, r0
 80006dc:	f640 30b8 	movw	r0, #3000	; 0xbb8
 80006e0:	601a      	str	r2, [r3, #0]
 80006e2:	f001 facd 	bl	8001c80 <timer_delay_ms>
 80006e6:	b10c      	cbz	r4, 80006ec <esp8266_init+0x18>
 80006e8:	4819      	ldr	r0, [pc, #100]	; (8000750 <esp8266_init+0x7c>)
 80006ea:	e000      	b.n	80006ee <esp8266_init+0x1a>
 80006ec:	4819      	ldr	r0, [pc, #100]	; (8000754 <esp8266_init+0x80>)
 80006ee:	f7ff ffab 	bl	8000648 <esp8266_send>
 80006f2:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80006f6:	f001 fac3 	bl	8001c80 <timer_delay_ms>
 80006fa:	4817      	ldr	r0, [pc, #92]	; (8000758 <esp8266_init+0x84>)
 80006fc:	f7ff ffa4 	bl	8000648 <esp8266_send>
 8000700:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000704:	f001 fabc 	bl	8001c80 <timer_delay_ms>
 8000708:	4814      	ldr	r0, [pc, #80]	; (800075c <esp8266_init+0x88>)
 800070a:	f7ff ff9d 	bl	8000648 <esp8266_send>
 800070e:	4814      	ldr	r0, [pc, #80]	; (8000760 <esp8266_init+0x8c>)
 8000710:	f7ff ff9a 	bl	8000648 <esp8266_send>
 8000714:	4813      	ldr	r0, [pc, #76]	; (8000764 <esp8266_init+0x90>)
 8000716:	f7ff ff97 	bl	8000648 <esp8266_send>
 800071a:	4813      	ldr	r0, [pc, #76]	; (8000768 <esp8266_init+0x94>)
 800071c:	f7ff ff94 	bl	8000648 <esp8266_send>
 8000720:	4812      	ldr	r0, [pc, #72]	; (800076c <esp8266_init+0x98>)
 8000722:	f7ff ff91 	bl	8000648 <esp8266_send>
 8000726:	4812      	ldr	r0, [pc, #72]	; (8000770 <esp8266_init+0x9c>)
 8000728:	2102      	movs	r1, #2
 800072a:	f644 6220 	movw	r2, #20000	; 0x4e20
 800072e:	f7ff ffab 	bl	8000688 <esp8266_find_stream>
 8000732:	b140      	cbz	r0, 8000746 <esp8266_init+0x72>
 8000734:	b12c      	cbz	r4, 8000742 <esp8266_init+0x6e>
 8000736:	480f      	ldr	r0, [pc, #60]	; (8000774 <esp8266_init+0xa0>)
 8000738:	f7ff ff86 	bl	8000648 <esp8266_send>
 800073c:	20c8      	movs	r0, #200	; 0xc8
 800073e:	f001 fa9f 	bl	8001c80 <timer_delay_ms>
 8000742:	2000      	movs	r0, #0
 8000744:	bd10      	pop	{r4, pc}
 8000746:	f06f 0001 	mvn.w	r0, #1
 800074a:	bd10      	pop	{r4, pc}
 800074c:	20000640 	.word	0x20000640
 8000750:	08002681 	.word	0x08002681
 8000754:	0800268f 	.word	0x0800268f
 8000758:	0800269d 	.word	0x0800269d
 800075c:	080026ab 	.word	0x080026ab
 8000760:	080026b6 	.word	0x080026b6
 8000764:	08002705 	.word	0x08002705
 8000768:	080026c0 	.word	0x080026c0
 800076c:	080026cf 	.word	0x080026cf
 8000770:	08002727 	.word	0x08002727
 8000774:	080026d3 	.word	0x080026d3

08000778 <esp8266_uninit>:
 8000778:	4770      	bx	lr

0800077a <esp8266_get_nonblocking>:
 800077a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800077c:	4606      	mov	r6, r0
 800077e:	460f      	mov	r7, r1
 8000780:	4615      	mov	r5, r2
 8000782:	2300      	movs	r3, #0
 8000784:	42bb      	cmp	r3, r7
 8000786:	f04f 0400 	mov.w	r4, #0
 800078a:	d002      	beq.n	8000792 <esp8266_get_nonblocking+0x18>
 800078c:	54f4      	strb	r4, [r6, r3]
 800078e:	3301      	adds	r3, #1
 8000790:	e7f8      	b.n	8000784 <esp8266_get_nonblocking+0xa>
 8000792:	f001 fa67 	bl	8001c64 <timer_get_time>
 8000796:	4405      	add	r5, r0
 8000798:	f001 fb66 	bl	8001e68 <uart_is_char>
 800079c:	f64f 73ff 	movw	r3, #65535	; 0xffff
 80007a0:	4298      	cmp	r0, r3
 80007a2:	bf1c      	itt	ne
 80007a4:	5530      	strbne	r0, [r6, r4]
 80007a6:	3401      	addne	r4, #1
 80007a8:	f001 fa5c 	bl	8001c64 <timer_get_time>
 80007ac:	42bc      	cmp	r4, r7
 80007ae:	d207      	bcs.n	80007c0 <esp8266_get_nonblocking+0x46>
 80007b0:	4285      	cmp	r5, r0
 80007b2:	d8f1      	bhi.n	8000798 <esp8266_get_nonblocking+0x1e>
 80007b4:	42a8      	cmp	r0, r5
 80007b6:	bf94      	ite	ls
 80007b8:	4620      	movls	r0, r4
 80007ba:	f04f 30ff 	movhi.w	r0, #4294967295
 80007be:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80007c0:	42a8      	cmp	r0, r5
 80007c2:	bf8c      	ite	hi
 80007c4:	f04f 30ff 	movhi.w	r0, #4294967295
 80007c8:	f06f 0001 	mvnls.w	r0, #1
 80007cc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

080007d0 <esp8266_connect>:
 80007d0:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 80007d4:	4e45      	ldr	r6, [pc, #276]	; (80008ec <esp8266_connect+0x11c>)
 80007d6:	461f      	mov	r7, r3
 80007d8:	6833      	ldr	r3, [r6, #0]
 80007da:	2b01      	cmp	r3, #1
 80007dc:	4680      	mov	r8, r0
 80007de:	4689      	mov	r9, r1
 80007e0:	4615      	mov	r5, r2
 80007e2:	4634      	mov	r4, r6
 80007e4:	d022      	beq.n	800082c <esp8266_connect+0x5c>
 80007e6:	4842      	ldr	r0, [pc, #264]	; (80008f0 <esp8266_connect+0x120>)
 80007e8:	f7ff ff2e 	bl	8000648 <esp8266_send>
 80007ec:	200a      	movs	r0, #10
 80007ee:	f001 fa47 	bl	8001c80 <timer_delay_ms>
 80007f2:	4840      	ldr	r0, [pc, #256]	; (80008f4 <esp8266_connect+0x124>)
 80007f4:	f7ff ff28 	bl	8000648 <esp8266_send>
 80007f8:	4640      	mov	r0, r8
 80007fa:	f7ff ff25 	bl	8000648 <esp8266_send>
 80007fe:	483e      	ldr	r0, [pc, #248]	; (80008f8 <esp8266_connect+0x128>)
 8000800:	f7ff ff22 	bl	8000648 <esp8266_send>
 8000804:	4648      	mov	r0, r9
 8000806:	f7ff ff28 	bl	800065a <esp8266_send_uint>
 800080a:	483c      	ldr	r0, [pc, #240]	; (80008fc <esp8266_connect+0x12c>)
 800080c:	f7ff ff1c 	bl	8000648 <esp8266_send>
 8000810:	483b      	ldr	r0, [pc, #236]	; (8000900 <esp8266_connect+0x130>)
 8000812:	2107      	movs	r1, #7
 8000814:	f44f 7261 	mov.w	r2, #900	; 0x384
 8000818:	f7ff ff36 	bl	8000688 <esp8266_find_stream>
 800081c:	b920      	cbnz	r0, 8000828 <esp8266_connect+0x58>
 800081e:	6030      	str	r0, [r6, #0]
 8000820:	f06f 0002 	mvn.w	r0, #2
 8000824:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000828:	2301      	movs	r3, #1
 800082a:	6033      	str	r3, [r6, #0]
 800082c:	4835      	ldr	r0, [pc, #212]	; (8000904 <esp8266_connect+0x134>)
 800082e:	f7ff ff0b 	bl	8000648 <esp8266_send>
 8000832:	4638      	mov	r0, r7
 8000834:	f7ff ff11 	bl	800065a <esp8266_send_uint>
 8000838:	4830      	ldr	r0, [pc, #192]	; (80008fc <esp8266_connect+0x12c>)
 800083a:	f7ff ff05 	bl	8000648 <esp8266_send>
 800083e:	4832      	ldr	r0, [pc, #200]	; (8000908 <esp8266_connect+0x138>)
 8000840:	2101      	movs	r1, #1
 8000842:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 8000846:	f7ff ff1f 	bl	8000688 <esp8266_find_stream>
 800084a:	4606      	mov	r6, r0
 800084c:	b108      	cbz	r0, 8000852 <esp8266_connect+0x82>
 800084e:	442f      	add	r7, r5
 8000850:	e00a      	b.n	8000868 <esp8266_connect+0x98>
 8000852:	4827      	ldr	r0, [pc, #156]	; (80008f0 <esp8266_connect+0x120>)
 8000854:	f7ff fef8 	bl	8000648 <esp8266_send>
 8000858:	200a      	movs	r0, #10
 800085a:	f001 fa11 	bl	8001c80 <timer_delay_ms>
 800085e:	6026      	str	r6, [r4, #0]
 8000860:	f06f 0003 	mvn.w	r0, #3
 8000864:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000868:	42bd      	cmp	r5, r7
 800086a:	d004      	beq.n	8000876 <esp8266_connect+0xa6>
 800086c:	f815 0b01 	ldrb.w	r0, [r5], #1
 8000870:	f001 faf0 	bl	8001e54 <uart_write>
 8000874:	e7f8      	b.n	8000868 <esp8266_connect+0x98>
 8000876:	4825      	ldr	r0, [pc, #148]	; (800090c <esp8266_connect+0x13c>)
 8000878:	2107      	movs	r1, #7
 800087a:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 800087e:	f7ff ff03 	bl	8000688 <esp8266_find_stream>
 8000882:	4605      	mov	r5, r0
 8000884:	b950      	cbnz	r0, 800089c <esp8266_connect+0xcc>
 8000886:	481a      	ldr	r0, [pc, #104]	; (80008f0 <esp8266_connect+0x120>)
 8000888:	f7ff fede 	bl	8000648 <esp8266_send>
 800088c:	200a      	movs	r0, #10
 800088e:	f001 f9f7 	bl	8001c80 <timer_delay_ms>
 8000892:	6025      	str	r5, [r4, #0]
 8000894:	f06f 0004 	mvn.w	r0, #4
 8000898:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 800089c:	481c      	ldr	r0, [pc, #112]	; (8000910 <esp8266_connect+0x140>)
 800089e:	2105      	movs	r1, #5
 80008a0:	f44f 7248 	mov.w	r2, #800	; 0x320
 80008a4:	f7ff fef0 	bl	8000688 <esp8266_find_stream>
 80008a8:	4605      	mov	r5, r0
 80008aa:	b108      	cbz	r0, 80008b0 <esp8266_connect+0xe0>
 80008ac:	2400      	movs	r4, #0
 80008ae:	e00a      	b.n	80008c6 <esp8266_connect+0xf6>
 80008b0:	480f      	ldr	r0, [pc, #60]	; (80008f0 <esp8266_connect+0x120>)
 80008b2:	f7ff fec9 	bl	8000648 <esp8266_send>
 80008b6:	200a      	movs	r0, #10
 80008b8:	f001 f9e2 	bl	8001c80 <timer_delay_ms>
 80008bc:	6025      	str	r5, [r4, #0]
 80008be:	f06f 0005 	mvn.w	r0, #5
 80008c2:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 80008c6:	f001 faeb 	bl	8001ea0 <uart_read>
 80008ca:	283a      	cmp	r0, #58	; 0x3a
 80008cc:	d004      	beq.n	80008d8 <esp8266_connect+0x108>
 80008ce:	230a      	movs	r3, #10
 80008d0:	fb03 0404 	mla	r4, r3, r4, r0
 80008d4:	3c30      	subs	r4, #48	; 0x30
 80008d6:	e7f6      	b.n	80008c6 <esp8266_connect+0xf6>
 80008d8:	9808      	ldr	r0, [sp, #32]
 80008da:	9909      	ldr	r1, [sp, #36]	; 0x24
 80008dc:	f44f 7248 	mov.w	r2, #800	; 0x320
 80008e0:	f7ff ff4b 	bl	800077a <esp8266_get_nonblocking>
 80008e4:	4620      	mov	r0, r4
 80008e6:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 80008ea:	bf00      	nop
 80008ec:	20000640 	.word	0x20000640
 80008f0:	080026e7 	.word	0x080026e7
 80008f4:	080026f5 	.word	0x080026f5
 80008f8:	08002709 	.word	0x08002709
 80008fc:	080026d0 	.word	0x080026d0
 8000900:	0800270c 	.word	0x0800270c
 8000904:	08002714 	.word	0x08002714
 8000908:	08002720 	.word	0x08002720
 800090c:	08002722 	.word	0x08002722
 8000910:	0800272a 	.word	0x0800272a

08000914 <motors_uninit>:
 8000914:	b508      	push	{r3, lr}
 8000916:	20c0      	movs	r0, #192	; 0xc0
 8000918:	2100      	movs	r1, #0
 800091a:	2218      	movs	r2, #24
 800091c:	f001 fc48 	bl	80021b0 <i2c_write_reg>
 8000920:	20c2      	movs	r0, #194	; 0xc2
 8000922:	2100      	movs	r1, #0
 8000924:	2218      	movs	r2, #24
 8000926:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800092a:	f001 bc41 	b.w	80021b0 <i2c_write_reg>
	...

08000930 <motors_update>:
 8000930:	4a2f      	ldr	r2, [pc, #188]	; (80009f0 <motors_update+0xc0>)
 8000932:	b538      	push	{r3, r4, r5, lr}
 8000934:	6813      	ldr	r3, [r2, #0]
 8000936:	6854      	ldr	r4, [r2, #4]
 8000938:	b2db      	uxtb	r3, r3
 800093a:	b25a      	sxtb	r2, r3
 800093c:	2a2c      	cmp	r2, #44	; 0x2c
 800093e:	b2e4      	uxtb	r4, r4
 8000940:	dc04      	bgt.n	800094c <motors_update+0x1c>
 8000942:	f112 0f2c 	cmn.w	r2, #44	; 0x2c
 8000946:	bfb8      	it	lt
 8000948:	23d4      	movlt	r3, #212	; 0xd4
 800094a:	e000      	b.n	800094e <motors_update+0x1e>
 800094c:	232c      	movs	r3, #44	; 0x2c
 800094e:	b262      	sxtb	r2, r4
 8000950:	2a2c      	cmp	r2, #44	; 0x2c
 8000952:	dc04      	bgt.n	800095e <motors_update+0x2e>
 8000954:	f112 0f2c 	cmn.w	r2, #44	; 0x2c
 8000958:	bfb8      	it	lt
 800095a:	24d4      	movlt	r4, #212	; 0xd4
 800095c:	e000      	b.n	8000960 <motors_update+0x30>
 800095e:	242c      	movs	r4, #44	; 0x2c
 8000960:	b1b3      	cbz	r3, 8000990 <motors_update+0x60>
 8000962:	b25a      	sxtb	r2, r3
 8000964:	2a00      	cmp	r2, #0
 8000966:	dd07      	ble.n	8000978 <motors_update+0x48>
 8000968:	2a05      	cmp	r2, #5
 800096a:	bfd8      	it	le
 800096c:	2306      	movle	r3, #6
 800096e:	b25d      	sxtb	r5, r3
 8000970:	00ad      	lsls	r5, r5, #2
 8000972:	f045 0502 	orr.w	r5, r5, #2
 8000976:	e009      	b.n	800098c <motors_update+0x5c>
 8000978:	425b      	negs	r3, r3
 800097a:	b2db      	uxtb	r3, r3
 800097c:	b25a      	sxtb	r2, r3
 800097e:	2a05      	cmp	r2, #5
 8000980:	bfd8      	it	le
 8000982:	2306      	movle	r3, #6
 8000984:	b25d      	sxtb	r5, r3
 8000986:	00ad      	lsls	r5, r5, #2
 8000988:	f045 0501 	orr.w	r5, r5, #1
 800098c:	b2ed      	uxtb	r5, r5
 800098e:	e000      	b.n	8000992 <motors_update+0x62>
 8000990:	251b      	movs	r5, #27
 8000992:	2100      	movs	r1, #0
 8000994:	460a      	mov	r2, r1
 8000996:	20c0      	movs	r0, #192	; 0xc0
 8000998:	f001 fc0a 	bl	80021b0 <i2c_write_reg>
 800099c:	20c0      	movs	r0, #192	; 0xc0
 800099e:	2100      	movs	r1, #0
 80009a0:	462a      	mov	r2, r5
 80009a2:	f001 fc05 	bl	80021b0 <i2c_write_reg>
 80009a6:	b1b4      	cbz	r4, 80009d6 <motors_update+0xa6>
 80009a8:	b263      	sxtb	r3, r4
 80009aa:	2b00      	cmp	r3, #0
 80009ac:	dd07      	ble.n	80009be <motors_update+0x8e>
 80009ae:	2b05      	cmp	r3, #5
 80009b0:	bfd8      	it	le
 80009b2:	2406      	movle	r4, #6
 80009b4:	b264      	sxtb	r4, r4
 80009b6:	00a4      	lsls	r4, r4, #2
 80009b8:	f044 0401 	orr.w	r4, r4, #1
 80009bc:	e009      	b.n	80009d2 <motors_update+0xa2>
 80009be:	4264      	negs	r4, r4
 80009c0:	b2e4      	uxtb	r4, r4
 80009c2:	b263      	sxtb	r3, r4
 80009c4:	2b05      	cmp	r3, #5
 80009c6:	bfd8      	it	le
 80009c8:	2406      	movle	r4, #6
 80009ca:	b264      	sxtb	r4, r4
 80009cc:	00a4      	lsls	r4, r4, #2
 80009ce:	f044 0402 	orr.w	r4, r4, #2
 80009d2:	b2e4      	uxtb	r4, r4
 80009d4:	e000      	b.n	80009d8 <motors_update+0xa8>
 80009d6:	241b      	movs	r4, #27
 80009d8:	2100      	movs	r1, #0
 80009da:	460a      	mov	r2, r1
 80009dc:	20c2      	movs	r0, #194	; 0xc2
 80009de:	f001 fbe7 	bl	80021b0 <i2c_write_reg>
 80009e2:	4622      	mov	r2, r4
 80009e4:	20c2      	movs	r0, #194	; 0xc2
 80009e6:	2100      	movs	r1, #0
 80009e8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80009ec:	f001 bbe0 	b.w	80021b0 <i2c_write_reg>
 80009f0:	20000224 	.word	0x20000224

080009f4 <motors_init>:
 80009f4:	b510      	push	{r4, lr}
 80009f6:	4b04      	ldr	r3, [pc, #16]	; (8000a08 <motors_init+0x14>)
 80009f8:	2400      	movs	r4, #0
 80009fa:	601c      	str	r4, [r3, #0]
 80009fc:	605c      	str	r4, [r3, #4]
 80009fe:	f7ff ff97 	bl	8000930 <motors_update>
 8000a02:	4620      	mov	r0, r4
 8000a04:	bd10      	pop	{r4, pc}
 8000a06:	bf00      	nop
 8000a08:	20000224 	.word	0x20000224

08000a0c <m_abs>:
 8000a0c:	ee07 0a90 	vmov	s15, r0
 8000a10:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 8000a14:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000a18:	bf48      	it	mi
 8000a1a:	eef1 7a67 	vnegmi.f32	s15, s15
 8000a1e:	ee17 0a90 	vmov	r0, s15
 8000a22:	4770      	bx	lr

08000a24 <m_min>:
 8000a24:	ee07 0a10 	vmov	s14, r0
 8000a28:	ee07 1a90 	vmov	s15, r1
 8000a2c:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8000a30:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000a34:	bf54      	ite	pl
 8000a36:	ee17 0a90 	vmovpl	r0, s15
 8000a3a:	ee17 0a10 	vmovmi	r0, s14
 8000a3e:	4770      	bx	lr

08000a40 <lsm9ds0_uninit>:
 8000a40:	b508      	push	{r3, lr}
 8000a42:	20d4      	movs	r0, #212	; 0xd4
 8000a44:	2120      	movs	r1, #32
 8000a46:	2200      	movs	r2, #0
 8000a48:	f001 fbb2 	bl	80021b0 <i2c_write_reg>
 8000a4c:	203c      	movs	r0, #60	; 0x3c
 8000a4e:	2120      	movs	r1, #32
 8000a50:	2200      	movs	r2, #0
 8000a52:	f001 fbad 	bl	80021b0 <i2c_write_reg>
 8000a56:	203c      	movs	r0, #60	; 0x3c
 8000a58:	2124      	movs	r1, #36	; 0x24
 8000a5a:	2200      	movs	r2, #0
 8000a5c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000a60:	f001 bba6 	b.w	80021b0 <i2c_write_reg>

08000a64 <lsm9ds0_read>:
 8000a64:	b538      	push	{r3, r4, r5, lr}
 8000a66:	2128      	movs	r1, #40	; 0x28
 8000a68:	20d4      	movs	r0, #212	; 0xd4
 8000a6a:	f001 fbb4 	bl	80021d6 <i2c_read_reg>
 8000a6e:	2129      	movs	r1, #41	; 0x29
 8000a70:	4604      	mov	r4, r0
 8000a72:	20d4      	movs	r0, #212	; 0xd4
 8000a74:	f001 fbaf 	bl	80021d6 <i2c_read_reg>
 8000a78:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
 8000a7c:	4c46      	ldr	r4, [pc, #280]	; (8000b98 <lsm9ds0_read+0x134>)
 8000a7e:	b280      	uxth	r0, r0
 8000a80:	81a0      	strh	r0, [r4, #12]
 8000a82:	89a2      	ldrh	r2, [r4, #12]
 8000a84:	8a63      	ldrh	r3, [r4, #18]
 8000a86:	b292      	uxth	r2, r2
 8000a88:	b29b      	uxth	r3, r3
 8000a8a:	1ad3      	subs	r3, r2, r3
 8000a8c:	b29b      	uxth	r3, r3
 8000a8e:	212a      	movs	r1, #42	; 0x2a
 8000a90:	20d4      	movs	r0, #212	; 0xd4
 8000a92:	8323      	strh	r3, [r4, #24]
 8000a94:	f001 fb9f 	bl	80021d6 <i2c_read_reg>
 8000a98:	212b      	movs	r1, #43	; 0x2b
 8000a9a:	4605      	mov	r5, r0
 8000a9c:	20d4      	movs	r0, #212	; 0xd4
 8000a9e:	f001 fb9a 	bl	80021d6 <i2c_read_reg>
 8000aa2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000aa6:	b285      	uxth	r5, r0
 8000aa8:	81e5      	strh	r5, [r4, #14]
 8000aaa:	89e2      	ldrh	r2, [r4, #14]
 8000aac:	8aa3      	ldrh	r3, [r4, #20]
 8000aae:	b292      	uxth	r2, r2
 8000ab0:	b29b      	uxth	r3, r3
 8000ab2:	1ad3      	subs	r3, r2, r3
 8000ab4:	b29b      	uxth	r3, r3
 8000ab6:	212c      	movs	r1, #44	; 0x2c
 8000ab8:	20d4      	movs	r0, #212	; 0xd4
 8000aba:	8363      	strh	r3, [r4, #26]
 8000abc:	f001 fb8b 	bl	80021d6 <i2c_read_reg>
 8000ac0:	212d      	movs	r1, #45	; 0x2d
 8000ac2:	4605      	mov	r5, r0
 8000ac4:	20d4      	movs	r0, #212	; 0xd4
 8000ac6:	f001 fb86 	bl	80021d6 <i2c_read_reg>
 8000aca:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000ace:	b285      	uxth	r5, r0
 8000ad0:	8225      	strh	r5, [r4, #16]
 8000ad2:	8a22      	ldrh	r2, [r4, #16]
 8000ad4:	8ae3      	ldrh	r3, [r4, #22]
 8000ad6:	b292      	uxth	r2, r2
 8000ad8:	b29b      	uxth	r3, r3
 8000ada:	1ad3      	subs	r3, r2, r3
 8000adc:	b29b      	uxth	r3, r3
 8000ade:	2108      	movs	r1, #8
 8000ae0:	203c      	movs	r0, #60	; 0x3c
 8000ae2:	83a3      	strh	r3, [r4, #28]
 8000ae4:	f001 fb77 	bl	80021d6 <i2c_read_reg>
 8000ae8:	2109      	movs	r1, #9
 8000aea:	4605      	mov	r5, r0
 8000aec:	203c      	movs	r0, #60	; 0x3c
 8000aee:	f001 fb72 	bl	80021d6 <i2c_read_reg>
 8000af2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000af6:	b285      	uxth	r5, r0
 8000af8:	210a      	movs	r1, #10
 8000afa:	203c      	movs	r0, #60	; 0x3c
 8000afc:	80e5      	strh	r5, [r4, #6]
 8000afe:	f001 fb6a 	bl	80021d6 <i2c_read_reg>
 8000b02:	210b      	movs	r1, #11
 8000b04:	4605      	mov	r5, r0
 8000b06:	203c      	movs	r0, #60	; 0x3c
 8000b08:	f001 fb65 	bl	80021d6 <i2c_read_reg>
 8000b0c:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b10:	b285      	uxth	r5, r0
 8000b12:	210c      	movs	r1, #12
 8000b14:	203c      	movs	r0, #60	; 0x3c
 8000b16:	8125      	strh	r5, [r4, #8]
 8000b18:	f001 fb5d 	bl	80021d6 <i2c_read_reg>
 8000b1c:	210d      	movs	r1, #13
 8000b1e:	4605      	mov	r5, r0
 8000b20:	203c      	movs	r0, #60	; 0x3c
 8000b22:	f001 fb58 	bl	80021d6 <i2c_read_reg>
 8000b26:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b2a:	b285      	uxth	r5, r0
 8000b2c:	2128      	movs	r1, #40	; 0x28
 8000b2e:	203c      	movs	r0, #60	; 0x3c
 8000b30:	8165      	strh	r5, [r4, #10]
 8000b32:	f001 fb50 	bl	80021d6 <i2c_read_reg>
 8000b36:	2129      	movs	r1, #41	; 0x29
 8000b38:	4605      	mov	r5, r0
 8000b3a:	203c      	movs	r0, #60	; 0x3c
 8000b3c:	f001 fb4b 	bl	80021d6 <i2c_read_reg>
 8000b40:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b44:	b285      	uxth	r5, r0
 8000b46:	212a      	movs	r1, #42	; 0x2a
 8000b48:	203c      	movs	r0, #60	; 0x3c
 8000b4a:	8025      	strh	r5, [r4, #0]
 8000b4c:	f001 fb43 	bl	80021d6 <i2c_read_reg>
 8000b50:	212b      	movs	r1, #43	; 0x2b
 8000b52:	4605      	mov	r5, r0
 8000b54:	203c      	movs	r0, #60	; 0x3c
 8000b56:	f001 fb3e 	bl	80021d6 <i2c_read_reg>
 8000b5a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b5e:	b285      	uxth	r5, r0
 8000b60:	212c      	movs	r1, #44	; 0x2c
 8000b62:	203c      	movs	r0, #60	; 0x3c
 8000b64:	8065      	strh	r5, [r4, #2]
 8000b66:	f001 fb36 	bl	80021d6 <i2c_read_reg>
 8000b6a:	212d      	movs	r1, #45	; 0x2d
 8000b6c:	4605      	mov	r5, r0
 8000b6e:	203c      	movs	r0, #60	; 0x3c
 8000b70:	f001 fb31 	bl	80021d6 <i2c_read_reg>
 8000b74:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b78:	b285      	uxth	r5, r0
 8000b7a:	2105      	movs	r1, #5
 8000b7c:	203c      	movs	r0, #60	; 0x3c
 8000b7e:	80a5      	strh	r5, [r4, #4]
 8000b80:	f001 fb29 	bl	80021d6 <i2c_read_reg>
 8000b84:	2106      	movs	r1, #6
 8000b86:	4605      	mov	r5, r0
 8000b88:	203c      	movs	r0, #60	; 0x3c
 8000b8a:	f001 fb24 	bl	80021d6 <i2c_read_reg>
 8000b8e:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000b92:	b285      	uxth	r5, r0
 8000b94:	83e5      	strh	r5, [r4, #30]
 8000b96:	bd38      	pop	{r3, r4, r5, pc}
 8000b98:	20000184 	.word	0x20000184

08000b9c <lsm9ds0_calibrate>:
 8000b9c:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000ba0:	2500      	movs	r5, #0
 8000ba2:	4681      	mov	r9, r0
 8000ba4:	462f      	mov	r7, r5
 8000ba6:	46a8      	mov	r8, r5
 8000ba8:	462c      	mov	r4, r5
 8000baa:	454c      	cmp	r4, r9
 8000bac:	4e10      	ldr	r6, [pc, #64]	; (8000bf0 <lsm9ds0_calibrate+0x54>)
 8000bae:	d00f      	beq.n	8000bd0 <lsm9ds0_calibrate+0x34>
 8000bb0:	f7ff ff58 	bl	8000a64 <lsm9ds0_read>
 8000bb4:	89b3      	ldrh	r3, [r6, #12]
 8000bb6:	fa08 f883 	sxtah	r8, r8, r3
 8000bba:	89f3      	ldrh	r3, [r6, #14]
 8000bbc:	fa07 f783 	sxtah	r7, r7, r3
 8000bc0:	8a33      	ldrh	r3, [r6, #16]
 8000bc2:	200a      	movs	r0, #10
 8000bc4:	fa05 f583 	sxtah	r5, r5, r3
 8000bc8:	3401      	adds	r4, #1
 8000bca:	f001 f859 	bl	8001c80 <timer_delay_ms>
 8000bce:	e7ec      	b.n	8000baa <lsm9ds0_calibrate+0xe>
 8000bd0:	fb98 f8f4 	sdiv	r8, r8, r4
 8000bd4:	fb97 f7f4 	sdiv	r7, r7, r4
 8000bd8:	fb95 f4f4 	sdiv	r4, r5, r4
 8000bdc:	fa1f f888 	uxth.w	r8, r8
 8000be0:	b2bf      	uxth	r7, r7
 8000be2:	b2a4      	uxth	r4, r4
 8000be4:	f8a6 8012 	strh.w	r8, [r6, #18]
 8000be8:	82b7      	strh	r7, [r6, #20]
 8000bea:	82f4      	strh	r4, [r6, #22]
 8000bec:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000bf0:	20000184 	.word	0x20000184

08000bf4 <lsm9ds0_init>:
 8000bf4:	4b29      	ldr	r3, [pc, #164]	; (8000c9c <lsm9ds0_init+0xa8>)
 8000bf6:	b570      	push	{r4, r5, r6, lr}
 8000bf8:	210f      	movs	r1, #15
 8000bfa:	2400      	movs	r4, #0
 8000bfc:	4606      	mov	r6, r0
 8000bfe:	20d4      	movs	r0, #212	; 0xd4
 8000c00:	801c      	strh	r4, [r3, #0]
 8000c02:	805c      	strh	r4, [r3, #2]
 8000c04:	809c      	strh	r4, [r3, #4]
 8000c06:	80dc      	strh	r4, [r3, #6]
 8000c08:	811c      	strh	r4, [r3, #8]
 8000c0a:	815c      	strh	r4, [r3, #10]
 8000c0c:	819c      	strh	r4, [r3, #12]
 8000c0e:	81dc      	strh	r4, [r3, #14]
 8000c10:	821c      	strh	r4, [r3, #16]
 8000c12:	831c      	strh	r4, [r3, #24]
 8000c14:	835c      	strh	r4, [r3, #26]
 8000c16:	839c      	strh	r4, [r3, #28]
 8000c18:	83dc      	strh	r4, [r3, #30]
 8000c1a:	f001 fadc 	bl	80021d6 <i2c_read_reg>
 8000c1e:	28d4      	cmp	r0, #212	; 0xd4
 8000c20:	4605      	mov	r5, r0
 8000c22:	d137      	bne.n	8000c94 <lsm9ds0_init+0xa0>
 8000c24:	203c      	movs	r0, #60	; 0x3c
 8000c26:	210f      	movs	r1, #15
 8000c28:	f001 fad5 	bl	80021d6 <i2c_read_reg>
 8000c2c:	2849      	cmp	r0, #73	; 0x49
 8000c2e:	d133      	bne.n	8000c98 <lsm9ds0_init+0xa4>
 8000c30:	4628      	mov	r0, r5
 8000c32:	2120      	movs	r1, #32
 8000c34:	22ff      	movs	r2, #255	; 0xff
 8000c36:	f001 fabb 	bl	80021b0 <i2c_write_reg>
 8000c3a:	4628      	mov	r0, r5
 8000c3c:	2123      	movs	r1, #35	; 0x23
 8000c3e:	2218      	movs	r2, #24
 8000c40:	f001 fab6 	bl	80021b0 <i2c_write_reg>
 8000c44:	203c      	movs	r0, #60	; 0x3c
 8000c46:	211f      	movs	r1, #31
 8000c48:	4622      	mov	r2, r4
 8000c4a:	f001 fab1 	bl	80021b0 <i2c_write_reg>
 8000c4e:	203c      	movs	r0, #60	; 0x3c
 8000c50:	2120      	movs	r1, #32
 8000c52:	2267      	movs	r2, #103	; 0x67
 8000c54:	f001 faac 	bl	80021b0 <i2c_write_reg>
 8000c58:	203c      	movs	r0, #60	; 0x3c
 8000c5a:	2121      	movs	r1, #33	; 0x21
 8000c5c:	4622      	mov	r2, r4
 8000c5e:	f001 faa7 	bl	80021b0 <i2c_write_reg>
 8000c62:	203c      	movs	r0, #60	; 0x3c
 8000c64:	2124      	movs	r1, #36	; 0x24
 8000c66:	22f4      	movs	r2, #244	; 0xf4
 8000c68:	f001 faa2 	bl	80021b0 <i2c_write_reg>
 8000c6c:	203c      	movs	r0, #60	; 0x3c
 8000c6e:	2125      	movs	r1, #37	; 0x25
 8000c70:	4622      	mov	r2, r4
 8000c72:	f001 fa9d 	bl	80021b0 <i2c_write_reg>
 8000c76:	203c      	movs	r0, #60	; 0x3c
 8000c78:	2126      	movs	r1, #38	; 0x26
 8000c7a:	2280      	movs	r2, #128	; 0x80
 8000c7c:	f001 fa98 	bl	80021b0 <i2c_write_reg>
 8000c80:	f7ff fef0 	bl	8000a64 <lsm9ds0_read>
 8000c84:	b116      	cbz	r6, 8000c8c <lsm9ds0_init+0x98>
 8000c86:	2064      	movs	r0, #100	; 0x64
 8000c88:	f7ff ff88 	bl	8000b9c <lsm9ds0_calibrate>
 8000c8c:	f7ff feea 	bl	8000a64 <lsm9ds0_read>
 8000c90:	2000      	movs	r0, #0
 8000c92:	bd70      	pop	{r4, r5, r6, pc}
 8000c94:	2001      	movs	r0, #1
 8000c96:	bd70      	pop	{r4, r5, r6, pc}
 8000c98:	2002      	movs	r0, #2
 8000c9a:	bd70      	pop	{r4, r5, r6, pc}
 8000c9c:	20000184 	.word	0x20000184

08000ca0 <rgb_sensor_uninit>:
 8000ca0:	b508      	push	{r3, lr}
 8000ca2:	2008      	movs	r0, #8
 8000ca4:	f001 fc08 	bl	80024b8 <led_off>
 8000ca8:	2072      	movs	r0, #114	; 0x72
 8000caa:	2180      	movs	r1, #128	; 0x80
 8000cac:	2200      	movs	r2, #0
 8000cae:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000cb2:	f000 bb5e 	b.w	8001372 <rgb_i2c_write_reg>
	...

08000cb8 <rgb_sensor_read>:
 8000cb8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000cba:	f000 fadb 	bl	8001274 <rgb_i2cStart>
 8000cbe:	2072      	movs	r0, #114	; 0x72
 8000cc0:	4d70      	ldr	r5, [pc, #448]	; (8000e84 <rgb_sensor_read+0x1cc>)
 8000cc2:	4c71      	ldr	r4, [pc, #452]	; (8000e88 <rgb_sensor_read+0x1d0>)
 8000cc4:	f000 faf4 	bl	80012b0 <rgb_i2cWrite>
 8000cc8:	20b4      	movs	r0, #180	; 0xb4
 8000cca:	f000 faf1 	bl	80012b0 <rgb_i2cWrite>
 8000cce:	f000 fad1 	bl	8001274 <rgb_i2cStart>
 8000cd2:	2073      	movs	r0, #115	; 0x73
 8000cd4:	f000 faec 	bl	80012b0 <rgb_i2cWrite>
 8000cd8:	2001      	movs	r0, #1
 8000cda:	4629      	mov	r1, r5
 8000cdc:	f000 fb08 	bl	80012f0 <rgb_i2cRead>
 8000ce0:	782b      	ldrb	r3, [r5, #0]
 8000ce2:	8323      	strh	r3, [r4, #24]
 8000ce4:	786b      	ldrb	r3, [r5, #1]
 8000ce6:	8363      	strh	r3, [r4, #26]
 8000ce8:	78ab      	ldrb	r3, [r5, #2]
 8000cea:	83a3      	strh	r3, [r4, #28]
 8000cec:	78eb      	ldrb	r3, [r5, #3]
 8000cee:	2001      	movs	r0, #1
 8000cf0:	4629      	mov	r1, r5
 8000cf2:	83e3      	strh	r3, [r4, #30]
 8000cf4:	f000 fafc 	bl	80012f0 <rgb_i2cRead>
 8000cf8:	2300      	movs	r3, #0
 8000cfa:	f103 020c 	add.w	r2, r3, #12
 8000cfe:	5ce8      	ldrb	r0, [r5, r3]
 8000d00:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d04:	4f60      	ldr	r7, [pc, #384]	; (8000e88 <rgb_sensor_read+0x1d0>)
 8000d06:	4e5f      	ldr	r6, [pc, #380]	; (8000e84 <rgb_sensor_read+0x1cc>)
 8000d08:	b289      	uxth	r1, r1
 8000d0a:	3301      	adds	r3, #1
 8000d0c:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d10:	2b04      	cmp	r3, #4
 8000d12:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d16:	d1f0      	bne.n	8000cfa <rgb_sensor_read+0x42>
 8000d18:	2001      	movs	r0, #1
 8000d1a:	4631      	mov	r1, r6
 8000d1c:	f000 fae8 	bl	80012f0 <rgb_i2cRead>
 8000d20:	7833      	ldrb	r3, [r6, #0]
 8000d22:	803b      	strh	r3, [r7, #0]
 8000d24:	7873      	ldrb	r3, [r6, #1]
 8000d26:	807b      	strh	r3, [r7, #2]
 8000d28:	78b3      	ldrb	r3, [r6, #2]
 8000d2a:	80bb      	strh	r3, [r7, #4]
 8000d2c:	78f3      	ldrb	r3, [r6, #3]
 8000d2e:	2001      	movs	r0, #1
 8000d30:	4631      	mov	r1, r6
 8000d32:	80fb      	strh	r3, [r7, #6]
 8000d34:	f000 fadc 	bl	80012f0 <rgb_i2cRead>
 8000d38:	2300      	movs	r3, #0
 8000d3a:	f834 2013 	ldrh.w	r2, [r4, r3, lsl #1]
 8000d3e:	5ce9      	ldrb	r1, [r5, r3]
 8000d40:	4f51      	ldr	r7, [pc, #324]	; (8000e88 <rgb_sensor_read+0x1d0>)
 8000d42:	4e50      	ldr	r6, [pc, #320]	; (8000e84 <rgb_sensor_read+0x1cc>)
 8000d44:	b292      	uxth	r2, r2
 8000d46:	ea42 2201 	orr.w	r2, r2, r1, lsl #8
 8000d4a:	f824 2013 	strh.w	r2, [r4, r3, lsl #1]
 8000d4e:	3301      	adds	r3, #1
 8000d50:	2b04      	cmp	r3, #4
 8000d52:	d1f2      	bne.n	8000d3a <rgb_sensor_read+0x82>
 8000d54:	2001      	movs	r0, #1
 8000d56:	4631      	mov	r1, r6
 8000d58:	f000 faca 	bl	80012f0 <rgb_i2cRead>
 8000d5c:	7833      	ldrb	r3, [r6, #0]
 8000d5e:	813b      	strh	r3, [r7, #8]
 8000d60:	7873      	ldrb	r3, [r6, #1]
 8000d62:	817b      	strh	r3, [r7, #10]
 8000d64:	78b3      	ldrb	r3, [r6, #2]
 8000d66:	81bb      	strh	r3, [r7, #12]
 8000d68:	78f3      	ldrb	r3, [r6, #3]
 8000d6a:	2001      	movs	r0, #1
 8000d6c:	4631      	mov	r1, r6
 8000d6e:	81fb      	strh	r3, [r7, #14]
 8000d70:	f000 fabe 	bl	80012f0 <rgb_i2cRead>
 8000d74:	2300      	movs	r3, #0
 8000d76:	1d1a      	adds	r2, r3, #4
 8000d78:	5ce8      	ldrb	r0, [r5, r3]
 8000d7a:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000d7e:	4f42      	ldr	r7, [pc, #264]	; (8000e88 <rgb_sensor_read+0x1d0>)
 8000d80:	4e40      	ldr	r6, [pc, #256]	; (8000e84 <rgb_sensor_read+0x1cc>)
 8000d82:	b289      	uxth	r1, r1
 8000d84:	3301      	adds	r3, #1
 8000d86:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000d8a:	2b04      	cmp	r3, #4
 8000d8c:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000d90:	d1f1      	bne.n	8000d76 <rgb_sensor_read+0xbe>
 8000d92:	2001      	movs	r0, #1
 8000d94:	4631      	mov	r1, r6
 8000d96:	f000 faab 	bl	80012f0 <rgb_i2cRead>
 8000d9a:	7833      	ldrb	r3, [r6, #0]
 8000d9c:	823b      	strh	r3, [r7, #16]
 8000d9e:	7873      	ldrb	r3, [r6, #1]
 8000da0:	827b      	strh	r3, [r7, #18]
 8000da2:	78b3      	ldrb	r3, [r6, #2]
 8000da4:	82bb      	strh	r3, [r7, #20]
 8000da6:	78f3      	ldrb	r3, [r6, #3]
 8000da8:	2001      	movs	r0, #1
 8000daa:	4631      	mov	r1, r6
 8000dac:	82fb      	strh	r3, [r7, #22]
 8000dae:	f000 fa9f 	bl	80012f0 <rgb_i2cRead>
 8000db2:	2300      	movs	r3, #0
 8000db4:	f103 0208 	add.w	r2, r3, #8
 8000db8:	5ce8      	ldrb	r0, [r5, r3]
 8000dba:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000dbe:	4f32      	ldr	r7, [pc, #200]	; (8000e88 <rgb_sensor_read+0x1d0>)
 8000dc0:	4e30      	ldr	r6, [pc, #192]	; (8000e84 <rgb_sensor_read+0x1cc>)
 8000dc2:	b289      	uxth	r1, r1
 8000dc4:	3301      	adds	r3, #1
 8000dc6:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000dca:	2b04      	cmp	r3, #4
 8000dcc:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000dd0:	d1f0      	bne.n	8000db4 <rgb_sensor_read+0xfc>
 8000dd2:	2001      	movs	r0, #1
 8000dd4:	4631      	mov	r1, r6
 8000dd6:	f000 fa8b 	bl	80012f0 <rgb_i2cRead>
 8000dda:	7833      	ldrb	r3, [r6, #0]
 8000ddc:	843b      	strh	r3, [r7, #32]
 8000dde:	7873      	ldrb	r3, [r6, #1]
 8000de0:	847b      	strh	r3, [r7, #34]	; 0x22
 8000de2:	78b3      	ldrb	r3, [r6, #2]
 8000de4:	84bb      	strh	r3, [r7, #36]	; 0x24
 8000de6:	78f3      	ldrb	r3, [r6, #3]
 8000de8:	2000      	movs	r0, #0
 8000dea:	4631      	mov	r1, r6
 8000dec:	84fb      	strh	r3, [r7, #38]	; 0x26
 8000dee:	f000 fa7f 	bl	80012f0 <rgb_i2cRead>
 8000df2:	2300      	movs	r3, #0
 8000df4:	f103 0210 	add.w	r2, r3, #16
 8000df8:	5ce8      	ldrb	r0, [r5, r3]
 8000dfa:	f834 1012 	ldrh.w	r1, [r4, r2, lsl #1]
 8000dfe:	3301      	adds	r3, #1
 8000e00:	b289      	uxth	r1, r1
 8000e02:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
 8000e06:	2b04      	cmp	r3, #4
 8000e08:	f824 1012 	strh.w	r1, [r4, r2, lsl #1]
 8000e0c:	d1f2      	bne.n	8000df4 <rgb_sensor_read+0x13c>
 8000e0e:	f000 fa40 	bl	8001292 <rgb_i2cStop>
 8000e12:	2300      	movs	r3, #0
 8000e14:	1d1d      	adds	r5, r3, #4
 8000e16:	f834 1013 	ldrh.w	r1, [r4, r3, lsl #1]
 8000e1a:	f834 2015 	ldrh.w	r2, [r4, r5, lsl #1]
 8000e1e:	f103 0008 	add.w	r0, r3, #8
 8000e22:	b212      	sxth	r2, r2
 8000e24:	fa02 f281 	sxtah	r2, r2, r1
 8000e28:	f834 1010 	ldrh.w	r1, [r4, r0, lsl #1]
 8000e2c:	f834 7013 	ldrh.w	r7, [r4, r3, lsl #1]
 8000e30:	fa02 f281 	sxtah	r2, r2, r1
 8000e34:	b2bf      	uxth	r7, r7
 8000e36:	2164      	movs	r1, #100	; 0x64
 8000e38:	fb17 f701 	smulbb	r7, r7, r1
 8000e3c:	f103 0634 	add.w	r6, r3, #52	; 0x34
 8000e40:	fb97 f7f2 	sdiv	r7, r7, r2
 8000e44:	b2bf      	uxth	r7, r7
 8000e46:	f824 7016 	strh.w	r7, [r4, r6, lsl #1]
 8000e4a:	f834 6015 	ldrh.w	r6, [r4, r5, lsl #1]
 8000e4e:	b2b6      	uxth	r6, r6
 8000e50:	fb16 f601 	smulbb	r6, r6, r1
 8000e54:	fb96 f6f2 	sdiv	r6, r6, r2
 8000e58:	f103 0538 	add.w	r5, r3, #56	; 0x38
 8000e5c:	b2b6      	uxth	r6, r6
 8000e5e:	f824 6015 	strh.w	r6, [r4, r5, lsl #1]
 8000e62:	f834 0010 	ldrh.w	r0, [r4, r0, lsl #1]
 8000e66:	b280      	uxth	r0, r0
 8000e68:	fb10 f101 	smulbb	r1, r0, r1
 8000e6c:	fb91 f2f2 	sdiv	r2, r1, r2
 8000e70:	f103 003c 	add.w	r0, r3, #60	; 0x3c
 8000e74:	3301      	adds	r3, #1
 8000e76:	b292      	uxth	r2, r2
 8000e78:	2b04      	cmp	r3, #4
 8000e7a:	f824 2010 	strh.w	r2, [r4, r0, lsl #1]
 8000e7e:	d1c9      	bne.n	8000e14 <rgb_sensor_read+0x15c>
 8000e80:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000e82:	bf00      	nop
 8000e84:	20000644 	.word	0x20000644
 8000e88:	200001a4 	.word	0x200001a4

08000e8c <rgb_sensor_init>:
 8000e8c:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000e8e:	2300      	movs	r3, #0
 8000e90:	4a2a      	ldr	r2, [pc, #168]	; (8000f3c <rgb_sensor_init+0xb0>)
 8000e92:	1d19      	adds	r1, r3, #4
 8000e94:	2400      	movs	r4, #0
 8000e96:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8000e9a:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000e9e:	f103 0108 	add.w	r1, r3, #8
 8000ea2:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000ea6:	f103 0110 	add.w	r1, r3, #16
 8000eaa:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000eae:	f103 010c 	add.w	r1, r3, #12
 8000eb2:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000eb6:	f103 0134 	add.w	r1, r3, #52	; 0x34
 8000eba:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000ebe:	f103 0138 	add.w	r1, r3, #56	; 0x38
 8000ec2:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000ec6:	f103 013c 	add.w	r1, r3, #60	; 0x3c
 8000eca:	3301      	adds	r3, #1
 8000ecc:	2b04      	cmp	r3, #4
 8000ece:	f822 4011 	strh.w	r4, [r2, r1, lsl #1]
 8000ed2:	d1dd      	bne.n	8000e90 <rgb_sensor_init+0x4>
 8000ed4:	2008      	movs	r0, #8
 8000ed6:	f001 fad9 	bl	800248c <led_on>
 8000eda:	f000 f99b 	bl	8001214 <rgb_i2c_init>
 8000ede:	2072      	movs	r0, #114	; 0x72
 8000ee0:	2181      	movs	r1, #129	; 0x81
 8000ee2:	22ff      	movs	r2, #255	; 0xff
 8000ee4:	f000 fa45 	bl	8001372 <rgb_i2c_write_reg>
 8000ee8:	2072      	movs	r0, #114	; 0x72
 8000eea:	2183      	movs	r1, #131	; 0x83
 8000eec:	22ff      	movs	r2, #255	; 0xff
 8000eee:	f000 fa40 	bl	8001372 <rgb_i2c_write_reg>
 8000ef2:	2072      	movs	r0, #114	; 0x72
 8000ef4:	218d      	movs	r1, #141	; 0x8d
 8000ef6:	4622      	mov	r2, r4
 8000ef8:	f000 fa3b 	bl	8001372 <rgb_i2c_write_reg>
 8000efc:	2072      	movs	r0, #114	; 0x72
 8000efe:	2180      	movs	r1, #128	; 0x80
 8000f00:	2203      	movs	r2, #3
 8000f02:	f000 fa36 	bl	8001372 <rgb_i2c_write_reg>
 8000f06:	ad01      	add	r5, sp, #4
 8000f08:	2072      	movs	r0, #114	; 0x72
 8000f0a:	218f      	movs	r1, #143	; 0x8f
 8000f0c:	2223      	movs	r2, #35	; 0x23
 8000f0e:	f000 fa30 	bl	8001372 <rgb_i2c_write_reg>
 8000f12:	f7ff fed1 	bl	8000cb8 <rgb_sensor_read>
 8000f16:	2072      	movs	r0, #114	; 0x72
 8000f18:	2192      	movs	r1, #146	; 0x92
 8000f1a:	462a      	mov	r2, r5
 8000f1c:	f000 fa3c 	bl	8001398 <rgb_i2c_read_reg>
 8000f20:	4620      	mov	r0, r4
 8000f22:	4623      	mov	r3, r4
 8000f24:	5cea      	ldrb	r2, [r5, r3]
 8000f26:	2a69      	cmp	r2, #105	; 0x69
 8000f28:	d002      	beq.n	8000f30 <rgb_sensor_init+0xa4>
 8000f2a:	2201      	movs	r2, #1
 8000f2c:	409a      	lsls	r2, r3
 8000f2e:	4310      	orrs	r0, r2
 8000f30:	3301      	adds	r3, #1
 8000f32:	2b04      	cmp	r3, #4
 8000f34:	d1f6      	bne.n	8000f24 <rgb_sensor_init+0x98>
 8000f36:	b003      	add	sp, #12
 8000f38:	bd30      	pop	{r4, r5, pc}
 8000f3a:	bf00      	nop
 8000f3c:	200001a4 	.word	0x200001a4

08000f40 <rgb_get_line_position>:
 8000f40:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
 8000f44:	4b54      	ldr	r3, [pc, #336]	; (8001098 <rgb_get_line_position+0x158>)
 8000f46:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
 8000f48:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
 8000f4c:	2100      	movs	r1, #0
 8000f4e:	466c      	mov	r4, sp
 8000f50:	460d      	mov	r5, r1
 8000f52:	460a      	mov	r2, r1
 8000f54:	4b51      	ldr	r3, [pc, #324]	; (800109c <rgb_get_line_position+0x15c>)
 8000f56:	f102 060c 	add.w	r6, r2, #12
 8000f5a:	f102 000a 	add.w	r0, r2, #10
 8000f5e:	f833 c016 	ldrh.w	ip, [r3, r6, lsl #1]
 8000f62:	f853 7020 	ldr.w	r7, [r3, r0, lsl #2]
 8000f66:	fa0f fc8c 	sxth.w	ip, ip
 8000f6a:	ebc7 0c0c 	rsb	ip, r7, ip
 8000f6e:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8000f72:	fb07 110c 	mla	r1, r7, ip, r1
 8000f76:	f833 7016 	ldrh.w	r7, [r3, r6, lsl #1]
 8000f7a:	f853 6020 	ldr.w	r6, [r3, r0, lsl #2]
 8000f7e:	3201      	adds	r2, #1
 8000f80:	b238      	sxth	r0, r7
 8000f82:	1b80      	subs	r0, r0, r6
 8000f84:	2a04      	cmp	r2, #4
 8000f86:	4405      	add	r5, r0
 8000f88:	d1e4      	bne.n	8000f54 <rgb_get_line_position+0x14>
 8000f8a:	4845      	ldr	r0, [pc, #276]	; (80010a0 <rgb_get_line_position+0x160>)
 8000f8c:	2200      	movs	r2, #0
 8000f8e:	2d14      	cmp	r5, #20
 8000f90:	7402      	strb	r2, [r0, #16]
 8000f92:	dd05      	ble.n	8000fa0 <rgb_get_line_position+0x60>
 8000f94:	fb91 f1f5 	sdiv	r1, r1, r5
 8000f98:	2201      	movs	r2, #1
 8000f9a:	3947      	subs	r1, #71	; 0x47
 8000f9c:	7402      	strb	r2, [r0, #16]
 8000f9e:	6001      	str	r1, [r0, #0]
 8000fa0:	2100      	movs	r1, #0
 8000fa2:	460d      	mov	r5, r1
 8000fa4:	460a      	mov	r2, r1
 8000fa6:	f102 060e 	add.w	r6, r2, #14
 8000faa:	f833 c012 	ldrh.w	ip, [r3, r2, lsl #1]
 8000fae:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000fb2:	fa0f fc8c 	sxth.w	ip, ip
 8000fb6:	ebc7 0c0c 	rsb	ip, r7, ip
 8000fba:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8000fbe:	fb07 110c 	mla	r1, r7, ip, r1
 8000fc2:	f833 c012 	ldrh.w	ip, [r3, r2, lsl #1]
 8000fc6:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8000fca:	3201      	adds	r2, #1
 8000fcc:	fa0f f68c 	sxth.w	r6, ip
 8000fd0:	1bf6      	subs	r6, r6, r7
 8000fd2:	2a04      	cmp	r2, #4
 8000fd4:	4435      	add	r5, r6
 8000fd6:	d1e6      	bne.n	8000fa6 <rgb_get_line_position+0x66>
 8000fd8:	2600      	movs	r6, #0
 8000fda:	2d28      	cmp	r5, #40	; 0x28
 8000fdc:	4a30      	ldr	r2, [pc, #192]	; (80010a0 <rgb_get_line_position+0x160>)
 8000fde:	7446      	strb	r6, [r0, #17]
 8000fe0:	dd05      	ble.n	8000fee <rgb_get_line_position+0xae>
 8000fe2:	fb91 f1f5 	sdiv	r1, r1, r5
 8000fe6:	2601      	movs	r6, #1
 8000fe8:	3947      	subs	r1, #71	; 0x47
 8000fea:	7456      	strb	r6, [r2, #17]
 8000fec:	6051      	str	r1, [r2, #4]
 8000fee:	2100      	movs	r1, #0
 8000ff0:	460d      	mov	r5, r1
 8000ff2:	460a      	mov	r2, r1
 8000ff4:	f102 0c04 	add.w	ip, r2, #4
 8000ff8:	f102 0612 	add.w	r6, r2, #18
 8000ffc:	f833 801c 	ldrh.w	r8, [r3, ip, lsl #1]
 8001000:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8001004:	f833 c01c 	ldrh.w	ip, [r3, ip, lsl #1]
 8001008:	fa0f f888 	sxth.w	r8, r8
 800100c:	ebc7 0808 	rsb	r8, r7, r8
 8001010:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8001014:	fb07 1108 	mla	r1, r7, r8, r1
 8001018:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 800101c:	3201      	adds	r2, #1
 800101e:	fa0f f68c 	sxth.w	r6, ip
 8001022:	1bf6      	subs	r6, r6, r7
 8001024:	2a04      	cmp	r2, #4
 8001026:	4435      	add	r5, r6
 8001028:	d1e4      	bne.n	8000ff4 <rgb_get_line_position+0xb4>
 800102a:	2600      	movs	r6, #0
 800102c:	2d0a      	cmp	r5, #10
 800102e:	4a1c      	ldr	r2, [pc, #112]	; (80010a0 <rgb_get_line_position+0x160>)
 8001030:	7486      	strb	r6, [r0, #18]
 8001032:	dd05      	ble.n	8001040 <rgb_get_line_position+0x100>
 8001034:	fb91 f1f5 	sdiv	r1, r1, r5
 8001038:	2601      	movs	r6, #1
 800103a:	3947      	subs	r1, #71	; 0x47
 800103c:	7496      	strb	r6, [r2, #18]
 800103e:	6091      	str	r1, [r2, #8]
 8001040:	2100      	movs	r1, #0
 8001042:	460d      	mov	r5, r1
 8001044:	460a      	mov	r2, r1
 8001046:	f102 0c08 	add.w	ip, r2, #8
 800104a:	f102 0616 	add.w	r6, r2, #22
 800104e:	f833 801c 	ldrh.w	r8, [r3, ip, lsl #1]
 8001052:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 8001056:	f833 c01c 	ldrh.w	ip, [r3, ip, lsl #1]
 800105a:	fa0f f888 	sxth.w	r8, r8
 800105e:	ebc7 0808 	rsb	r8, r7, r8
 8001062:	f854 7022 	ldr.w	r7, [r4, r2, lsl #2]
 8001066:	fb07 1108 	mla	r1, r7, r8, r1
 800106a:	f853 7026 	ldr.w	r7, [r3, r6, lsl #2]
 800106e:	3201      	adds	r2, #1
 8001070:	fa0f f68c 	sxth.w	r6, ip
 8001074:	1bf6      	subs	r6, r6, r7
 8001076:	2a04      	cmp	r2, #4
 8001078:	4435      	add	r5, r6
 800107a:	d1e4      	bne.n	8001046 <rgb_get_line_position+0x106>
 800107c:	2200      	movs	r2, #0
 800107e:	2d0a      	cmp	r5, #10
 8001080:	4b07      	ldr	r3, [pc, #28]	; (80010a0 <rgb_get_line_position+0x160>)
 8001082:	74c2      	strb	r2, [r0, #19]
 8001084:	dd05      	ble.n	8001092 <rgb_get_line_position+0x152>
 8001086:	fb91 f1f5 	sdiv	r1, r1, r5
 800108a:	2201      	movs	r2, #1
 800108c:	3947      	subs	r1, #71	; 0x47
 800108e:	74da      	strb	r2, [r3, #19]
 8001090:	60d9      	str	r1, [r3, #12]
 8001092:	b004      	add	sp, #16
 8001094:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001098:	08002730 	.word	0x08002730
 800109c:	200001a4 	.word	0x200001a4
 80010a0:	2000062c 	.word	0x2000062c

080010a4 <rgb_set_background>:
 80010a4:	b530      	push	{r4, r5, lr}
 80010a6:	2200      	movs	r2, #0
 80010a8:	4b37      	ldr	r3, [pc, #220]	; (8001188 <rgb_set_background+0xe4>)
 80010aa:	f102 000a 	add.w	r0, r2, #10
 80010ae:	2100      	movs	r1, #0
 80010b0:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 80010b4:	f102 000e 	add.w	r0, r2, #14
 80010b8:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 80010bc:	f102 0016 	add.w	r0, r2, #22
 80010c0:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 80010c4:	f102 0012 	add.w	r0, r2, #18
 80010c8:	3201      	adds	r2, #1
 80010ca:	2a04      	cmp	r2, #4
 80010cc:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 80010d0:	d1ea      	bne.n	80010a8 <rgb_set_background+0x4>
 80010d2:	2164      	movs	r1, #100	; 0x64
 80010d4:	2200      	movs	r2, #0
 80010d6:	f102 000a 	add.w	r0, r2, #10
 80010da:	f102 050c 	add.w	r5, r2, #12
 80010de:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 80010e2:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 80010e6:	fa04 f485 	sxtah	r4, r4, r5
 80010ea:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 80010ee:	f102 000e 	add.w	r0, r2, #14
 80010f2:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 80010f6:	f833 5012 	ldrh.w	r5, [r3, r2, lsl #1]
 80010fa:	fa04 f485 	sxtah	r4, r4, r5
 80010fe:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 8001102:	1d15      	adds	r5, r2, #4
 8001104:	f102 0016 	add.w	r0, r2, #22
 8001108:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 800110c:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 8001110:	fa04 f485 	sxtah	r4, r4, r5
 8001114:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 8001118:	f102 0508 	add.w	r5, r2, #8
 800111c:	f102 0012 	add.w	r0, r2, #18
 8001120:	3201      	adds	r2, #1
 8001122:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001126:	f833 5015 	ldrh.w	r5, [r3, r5, lsl #1]
 800112a:	2a04      	cmp	r2, #4
 800112c:	fa04 f485 	sxtah	r4, r4, r5
 8001130:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 8001134:	d1cf      	bne.n	80010d6 <rgb_set_background+0x32>
 8001136:	3901      	subs	r1, #1
 8001138:	d1cc      	bne.n	80010d4 <rgb_set_background+0x30>
 800113a:	460a      	mov	r2, r1
 800113c:	f102 000a 	add.w	r0, r2, #10
 8001140:	2164      	movs	r1, #100	; 0x64
 8001142:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001146:	fb94 f4f1 	sdiv	r4, r4, r1
 800114a:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 800114e:	f102 000e 	add.w	r0, r2, #14
 8001152:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001156:	fb94 f4f1 	sdiv	r4, r4, r1
 800115a:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 800115e:	f102 0016 	add.w	r0, r2, #22
 8001162:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001166:	fb94 f4f1 	sdiv	r4, r4, r1
 800116a:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
 800116e:	f102 0012 	add.w	r0, r2, #18
 8001172:	3201      	adds	r2, #1
 8001174:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
 8001178:	2a04      	cmp	r2, #4
 800117a:	fb94 f1f1 	sdiv	r1, r4, r1
 800117e:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
 8001182:	d1db      	bne.n	800113c <rgb_set_background+0x98>
 8001184:	bd30      	pop	{r4, r5, pc}
 8001186:	bf00      	nop
 8001188:	200001a4 	.word	0x200001a4

0800118c <rgb_i2c_delay>:
 800118c:	bf00      	nop
 800118e:	4770      	bx	lr

08001190 <RGBSetLowSDA>:
 8001190:	b513      	push	{r0, r1, r4, lr}
 8001192:	2301      	movs	r3, #1
 8001194:	2203      	movs	r2, #3
 8001196:	24f0      	movs	r4, #240	; 0xf0
 8001198:	f88d 3004 	strb.w	r3, [sp, #4]
 800119c:	f88d 3006 	strb.w	r3, [sp, #6]
 80011a0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80011a4:	2300      	movs	r3, #0
 80011a6:	4669      	mov	r1, sp
 80011a8:	f88d 2005 	strb.w	r2, [sp, #5]
 80011ac:	f88d 3007 	strb.w	r3, [sp, #7]
 80011b0:	9400      	str	r4, [sp, #0]
 80011b2:	f001 f906 	bl	80023c2 <GPIO_Init>
 80011b6:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80011ba:	851c      	strh	r4, [r3, #40]	; 0x28
 80011bc:	f7ff ffe6 	bl	800118c <rgb_i2c_delay>
 80011c0:	b002      	add	sp, #8
 80011c2:	bd10      	pop	{r4, pc}

080011c4 <RGBSetHighSDA>:
 80011c4:	b513      	push	{r0, r1, r4, lr}
 80011c6:	2300      	movs	r3, #0
 80011c8:	2203      	movs	r2, #3
 80011ca:	24f0      	movs	r4, #240	; 0xf0
 80011cc:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80011d0:	4669      	mov	r1, sp
 80011d2:	f88d 3004 	strb.w	r3, [sp, #4]
 80011d6:	f88d 2005 	strb.w	r2, [sp, #5]
 80011da:	f88d 3007 	strb.w	r3, [sp, #7]
 80011de:	9400      	str	r4, [sp, #0]
 80011e0:	f001 f8ef 	bl	80023c2 <GPIO_Init>
 80011e4:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80011e8:	619c      	str	r4, [r3, #24]
 80011ea:	f7ff ffcf 	bl	800118c <rgb_i2c_delay>
 80011ee:	b002      	add	sp, #8
 80011f0:	bd10      	pop	{r4, pc}
	...

080011f4 <RGBSetLowSCL>:
 80011f4:	4b02      	ldr	r3, [pc, #8]	; (8001200 <RGBSetLowSCL+0xc>)
 80011f6:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 80011fa:	851a      	strh	r2, [r3, #40]	; 0x28
 80011fc:	f7ff bfc6 	b.w	800118c <rgb_i2c_delay>
 8001200:	48000800 	.word	0x48000800

08001204 <RGBSetHighSCL>:
 8001204:	4b02      	ldr	r3, [pc, #8]	; (8001210 <RGBSetHighSCL+0xc>)
 8001206:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 800120a:	619a      	str	r2, [r3, #24]
 800120c:	f7ff bfbe 	b.w	800118c <rgb_i2c_delay>
 8001210:	48000800 	.word	0x48000800

08001214 <rgb_i2c_init>:
 8001214:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8001216:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 800121a:	2400      	movs	r4, #0
 800121c:	9300      	str	r3, [sp, #0]
 800121e:	2603      	movs	r6, #3
 8001220:	2301      	movs	r3, #1
 8001222:	4669      	mov	r1, sp
 8001224:	4812      	ldr	r0, [pc, #72]	; (8001270 <rgb_i2c_init+0x5c>)
 8001226:	f88d 3004 	strb.w	r3, [sp, #4]
 800122a:	25f0      	movs	r5, #240	; 0xf0
 800122c:	f88d 6005 	strb.w	r6, [sp, #5]
 8001230:	f88d 4006 	strb.w	r4, [sp, #6]
 8001234:	f88d 4007 	strb.w	r4, [sp, #7]
 8001238:	f001 f8c3 	bl	80023c2 <GPIO_Init>
 800123c:	4669      	mov	r1, sp
 800123e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001242:	9500      	str	r5, [sp, #0]
 8001244:	f88d 4004 	strb.w	r4, [sp, #4]
 8001248:	f88d 6005 	strb.w	r6, [sp, #5]
 800124c:	f88d 4007 	strb.w	r4, [sp, #7]
 8001250:	f001 f8b7 	bl	80023c2 <GPIO_Init>
 8001254:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001258:	4629      	mov	r1, r5
 800125a:	f001 f8f8 	bl	800244e <GPIO_SetBits>
 800125e:	f7ff ffd1 	bl	8001204 <RGBSetHighSCL>
 8001262:	f7ff ff95 	bl	8001190 <RGBSetLowSDA>
 8001266:	f7ff ffad 	bl	80011c4 <RGBSetHighSDA>
 800126a:	b002      	add	sp, #8
 800126c:	bd70      	pop	{r4, r5, r6, pc}
 800126e:	bf00      	nop
 8001270:	48000800 	.word	0x48000800

08001274 <rgb_i2cStart>:
 8001274:	b508      	push	{r3, lr}
 8001276:	f7ff ffc5 	bl	8001204 <RGBSetHighSCL>
 800127a:	f7ff ffa3 	bl	80011c4 <RGBSetHighSDA>
 800127e:	f7ff ffc1 	bl	8001204 <RGBSetHighSCL>
 8001282:	f7ff ff85 	bl	8001190 <RGBSetLowSDA>
 8001286:	f7ff ffb5 	bl	80011f4 <RGBSetLowSCL>
 800128a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800128e:	f7ff bf99 	b.w	80011c4 <RGBSetHighSDA>

08001292 <rgb_i2cStop>:
 8001292:	b508      	push	{r3, lr}
 8001294:	f7ff ffae 	bl	80011f4 <RGBSetLowSCL>
 8001298:	f7ff ff7a 	bl	8001190 <RGBSetLowSDA>
 800129c:	f7ff ffb2 	bl	8001204 <RGBSetHighSCL>
 80012a0:	f7ff ff76 	bl	8001190 <RGBSetLowSDA>
 80012a4:	f7ff ffae 	bl	8001204 <RGBSetHighSCL>
 80012a8:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80012ac:	f7ff bf8a 	b.w	80011c4 <RGBSetHighSDA>

080012b0 <rgb_i2cWrite>:
 80012b0:	b538      	push	{r3, r4, r5, lr}
 80012b2:	4604      	mov	r4, r0
 80012b4:	2508      	movs	r5, #8
 80012b6:	f7ff ff9d 	bl	80011f4 <RGBSetLowSCL>
 80012ba:	0623      	lsls	r3, r4, #24
 80012bc:	d502      	bpl.n	80012c4 <rgb_i2cWrite+0x14>
 80012be:	f7ff ff81 	bl	80011c4 <RGBSetHighSDA>
 80012c2:	e001      	b.n	80012c8 <rgb_i2cWrite+0x18>
 80012c4:	f7ff ff64 	bl	8001190 <RGBSetLowSDA>
 80012c8:	3d01      	subs	r5, #1
 80012ca:	f7ff ff9b 	bl	8001204 <RGBSetHighSCL>
 80012ce:	0064      	lsls	r4, r4, #1
 80012d0:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80012d4:	b2e4      	uxtb	r4, r4
 80012d6:	d1ee      	bne.n	80012b6 <rgb_i2cWrite+0x6>
 80012d8:	f7ff ff8c 	bl	80011f4 <RGBSetLowSCL>
 80012dc:	f7ff ff72 	bl	80011c4 <RGBSetHighSDA>
 80012e0:	f7ff ff90 	bl	8001204 <RGBSetHighSCL>
 80012e4:	f7ff ff86 	bl	80011f4 <RGBSetLowSCL>
 80012e8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80012ec:	f7ff bf4e 	b.w	800118c <rgb_i2c_delay>

080012f0 <rgb_i2cRead>:
 80012f0:	2300      	movs	r3, #0
 80012f2:	b570      	push	{r4, r5, r6, lr}
 80012f4:	700b      	strb	r3, [r1, #0]
 80012f6:	704b      	strb	r3, [r1, #1]
 80012f8:	708b      	strb	r3, [r1, #2]
 80012fa:	70cb      	strb	r3, [r1, #3]
 80012fc:	4606      	mov	r6, r0
 80012fe:	460c      	mov	r4, r1
 8001300:	f7ff ff78 	bl	80011f4 <RGBSetLowSCL>
 8001304:	f7ff ff5e 	bl	80011c4 <RGBSetHighSDA>
 8001308:	2508      	movs	r5, #8
 800130a:	2300      	movs	r3, #0
 800130c:	5ce2      	ldrb	r2, [r4, r3]
 800130e:	0052      	lsls	r2, r2, #1
 8001310:	54e2      	strb	r2, [r4, r3]
 8001312:	3301      	adds	r3, #1
 8001314:	2b04      	cmp	r3, #4
 8001316:	d1f9      	bne.n	800130c <rgb_i2cRead+0x1c>
 8001318:	f7ff ff74 	bl	8001204 <RGBSetHighSCL>
 800131c:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001320:	8a1b      	ldrh	r3, [r3, #16]
 8001322:	b29b      	uxth	r3, r3
 8001324:	06da      	lsls	r2, r3, #27
 8001326:	d503      	bpl.n	8001330 <rgb_i2cRead+0x40>
 8001328:	7822      	ldrb	r2, [r4, #0]
 800132a:	f042 0201 	orr.w	r2, r2, #1
 800132e:	7022      	strb	r2, [r4, #0]
 8001330:	0698      	lsls	r0, r3, #26
 8001332:	d503      	bpl.n	800133c <rgb_i2cRead+0x4c>
 8001334:	7862      	ldrb	r2, [r4, #1]
 8001336:	f042 0201 	orr.w	r2, r2, #1
 800133a:	7062      	strb	r2, [r4, #1]
 800133c:	0659      	lsls	r1, r3, #25
 800133e:	d503      	bpl.n	8001348 <rgb_i2cRead+0x58>
 8001340:	78a2      	ldrb	r2, [r4, #2]
 8001342:	f042 0201 	orr.w	r2, r2, #1
 8001346:	70a2      	strb	r2, [r4, #2]
 8001348:	061a      	lsls	r2, r3, #24
 800134a:	d503      	bpl.n	8001354 <rgb_i2cRead+0x64>
 800134c:	78e3      	ldrb	r3, [r4, #3]
 800134e:	f043 0301 	orr.w	r3, r3, #1
 8001352:	70e3      	strb	r3, [r4, #3]
 8001354:	f7ff ff4e 	bl	80011f4 <RGBSetLowSCL>
 8001358:	3d01      	subs	r5, #1
 800135a:	d1d6      	bne.n	800130a <rgb_i2cRead+0x1a>
 800135c:	b10e      	cbz	r6, 8001362 <rgb_i2cRead+0x72>
 800135e:	f7ff ff17 	bl	8001190 <RGBSetLowSDA>
 8001362:	f7ff ff4f 	bl	8001204 <RGBSetHighSCL>
 8001366:	f7ff ff45 	bl	80011f4 <RGBSetLowSCL>
 800136a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800136e:	f7ff bf0d 	b.w	800118c <rgb_i2c_delay>

08001372 <rgb_i2c_write_reg>:
 8001372:	b570      	push	{r4, r5, r6, lr}
 8001374:	4605      	mov	r5, r0
 8001376:	460c      	mov	r4, r1
 8001378:	4616      	mov	r6, r2
 800137a:	f7ff ff7b 	bl	8001274 <rgb_i2cStart>
 800137e:	4628      	mov	r0, r5
 8001380:	f7ff ff96 	bl	80012b0 <rgb_i2cWrite>
 8001384:	4620      	mov	r0, r4
 8001386:	f7ff ff93 	bl	80012b0 <rgb_i2cWrite>
 800138a:	4630      	mov	r0, r6
 800138c:	f7ff ff90 	bl	80012b0 <rgb_i2cWrite>
 8001390:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001394:	f7ff bf7d 	b.w	8001292 <rgb_i2cStop>

08001398 <rgb_i2c_read_reg>:
 8001398:	b570      	push	{r4, r5, r6, lr}
 800139a:	4604      	mov	r4, r0
 800139c:	460d      	mov	r5, r1
 800139e:	4616      	mov	r6, r2
 80013a0:	f7ff ff68 	bl	8001274 <rgb_i2cStart>
 80013a4:	4620      	mov	r0, r4
 80013a6:	f7ff ff83 	bl	80012b0 <rgb_i2cWrite>
 80013aa:	4628      	mov	r0, r5
 80013ac:	f7ff ff80 	bl	80012b0 <rgb_i2cWrite>
 80013b0:	f7ff ff60 	bl	8001274 <rgb_i2cStart>
 80013b4:	f044 0001 	orr.w	r0, r4, #1
 80013b8:	f7ff ff7a 	bl	80012b0 <rgb_i2cWrite>
 80013bc:	4631      	mov	r1, r6
 80013be:	2000      	movs	r0, #0
 80013c0:	f7ff ff96 	bl	80012f0 <rgb_i2cRead>
 80013c4:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80013c8:	f7ff bf63 	b.w	8001292 <rgb_i2cStop>

080013cc <device_sleep>:
 80013cc:	4b01      	ldr	r3, [pc, #4]	; (80013d4 <device_sleep+0x8>)
 80013ce:	22ff      	movs	r2, #255	; 0xff
 80013d0:	701a      	strb	r2, [r3, #0]
 80013d2:	4770      	bx	lr
 80013d4:	2000004c 	.word	0x2000004c

080013d8 <device_wake_up>:
 80013d8:	4b01      	ldr	r3, [pc, #4]	; (80013e0 <device_wake_up+0x8>)
 80013da:	2200      	movs	r2, #0
 80013dc:	701a      	strb	r2, [r3, #0]
 80013de:	4770      	bx	lr
 80013e0:	2000004c 	.word	0x2000004c

080013e4 <device_i2c_thread>:
 80013e4:	b538      	push	{r3, r4, r5, lr}
 80013e6:	2000      	movs	r0, #0
 80013e8:	210a      	movs	r1, #10
 80013ea:	f000 fc59 	bl	8001ca0 <event_timer_set_period>
 80013ee:	2501      	movs	r5, #1
 80013f0:	2400      	movs	r4, #0
 80013f2:	2c01      	cmp	r4, #1
 80013f4:	d017      	beq.n	8001426 <device_i2c_thread+0x42>
 80013f6:	d30f      	bcc.n	8001418 <device_i2c_thread+0x34>
 80013f8:	2c02      	cmp	r4, #2
 80013fa:	d1fa      	bne.n	80013f2 <device_i2c_thread+0xe>
 80013fc:	f7ff fb20 	bl	8000a40 <lsm9ds0_uninit>
 8001400:	f7ff fa88 	bl	8000914 <motors_uninit>
 8001404:	2064      	movs	r0, #100	; 0x64
 8001406:	f000 fc3b 	bl	8001c80 <timer_delay_ms>
 800140a:	4b0d      	ldr	r3, [pc, #52]	; (8001440 <device_i2c_thread+0x5c>)
 800140c:	781c      	ldrb	r4, [r3, #0]
 800140e:	2c00      	cmp	r4, #0
 8001410:	bf14      	ite	ne
 8001412:	2402      	movne	r4, #2
 8001414:	2400      	moveq	r4, #0
 8001416:	e7ec      	b.n	80013f2 <device_i2c_thread+0xe>
 8001418:	f7ff faec 	bl	80009f4 <motors_init>
 800141c:	4628      	mov	r0, r5
 800141e:	f7ff fbe9 	bl	8000bf4 <lsm9ds0_init>
 8001422:	2500      	movs	r5, #0
 8001424:	2401      	movs	r4, #1
 8001426:	2000      	movs	r0, #0
 8001428:	f000 fc50 	bl	8001ccc <event_timer_wait>
 800142c:	f7ff fb1a 	bl	8000a64 <lsm9ds0_read>
 8001430:	f7ff fa7e 	bl	8000930 <motors_update>
 8001434:	4b02      	ldr	r3, [pc, #8]	; (8001440 <device_i2c_thread+0x5c>)
 8001436:	781b      	ldrb	r3, [r3, #0]
 8001438:	2b00      	cmp	r3, #0
 800143a:	bf18      	it	ne
 800143c:	2402      	movne	r4, #2
 800143e:	e7d8      	b.n	80013f2 <device_i2c_thread+0xe>
 8001440:	2000004c 	.word	0x2000004c

08001444 <device_rgb_sensors_thread>:
 8001444:	b510      	push	{r4, lr}
 8001446:	2001      	movs	r0, #1
 8001448:	210a      	movs	r1, #10
 800144a:	f000 fc29 	bl	8001ca0 <event_timer_set_period>
 800144e:	2400      	movs	r4, #0
 8001450:	2001      	movs	r0, #1
 8001452:	f000 fc3b 	bl	8001ccc <event_timer_wait>
 8001456:	2c01      	cmp	r4, #1
 8001458:	d01a      	beq.n	8001490 <device_rgb_sensors_thread+0x4c>
 800145a:	d30d      	bcc.n	8001478 <device_rgb_sensors_thread+0x34>
 800145c:	2c02      	cmp	r4, #2
 800145e:	d1f7      	bne.n	8001450 <device_rgb_sensors_thread+0xc>
 8001460:	f7ff fc1e 	bl	8000ca0 <rgb_sensor_uninit>
 8001464:	2064      	movs	r0, #100	; 0x64
 8001466:	f000 fc0b 	bl	8001c80 <timer_delay_ms>
 800146a:	4b0d      	ldr	r3, [pc, #52]	; (80014a0 <device_rgb_sensors_thread+0x5c>)
 800146c:	781c      	ldrb	r4, [r3, #0]
 800146e:	2c00      	cmp	r4, #0
 8001470:	bf14      	ite	ne
 8001472:	2402      	movne	r4, #2
 8001474:	2400      	moveq	r4, #0
 8001476:	e7eb      	b.n	8001450 <device_rgb_sensors_thread+0xc>
 8001478:	f7ff fd08 	bl	8000e8c <rgb_sensor_init>
 800147c:	4604      	mov	r4, r0
 800147e:	b128      	cbz	r0, 800148c <device_rgb_sensors_thread+0x48>
 8001480:	f7ff fc0e 	bl	8000ca0 <rgb_sensor_uninit>
 8001484:	2001      	movs	r0, #1
 8001486:	4621      	mov	r1, r4
 8001488:	f000 f848 	bl	800151c <abort_error_>
 800148c:	2401      	movs	r4, #1
 800148e:	e7df      	b.n	8001450 <device_rgb_sensors_thread+0xc>
 8001490:	f7ff fc12 	bl	8000cb8 <rgb_sensor_read>
 8001494:	4b02      	ldr	r3, [pc, #8]	; (80014a0 <device_rgb_sensors_thread+0x5c>)
 8001496:	781b      	ldrb	r3, [r3, #0]
 8001498:	2b00      	cmp	r3, #0
 800149a:	d0f7      	beq.n	800148c <device_rgb_sensors_thread+0x48>
 800149c:	2402      	movs	r4, #2
 800149e:	e7d7      	b.n	8001450 <device_rgb_sensors_thread+0xc>
 80014a0:	2000004c 	.word	0x2000004c

080014a4 <device_wifi_thread>:
 80014a4:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80014a6:	4819      	ldr	r0, [pc, #100]	; (800150c <device_wifi_thread+0x68>)
 80014a8:	f7fe ff9a 	bl	80003e0 <strlen_>
 80014ac:	2200      	movs	r2, #0
 80014ae:	4605      	mov	r5, r0
 80014b0:	2a01      	cmp	r2, #1
 80014b2:	d01f      	beq.n	80014f4 <device_wifi_thread+0x50>
 80014b4:	d30d      	bcc.n	80014d2 <device_wifi_thread+0x2e>
 80014b6:	2a00      	cmp	r2, #0
 80014b8:	d0fa      	beq.n	80014b0 <device_wifi_thread+0xc>
 80014ba:	f7ff f95d 	bl	8000778 <esp8266_uninit>
 80014be:	2064      	movs	r0, #100	; 0x64
 80014c0:	f000 fbde 	bl	8001c80 <timer_delay_ms>
 80014c4:	4b12      	ldr	r3, [pc, #72]	; (8001510 <device_wifi_thread+0x6c>)
 80014c6:	781a      	ldrb	r2, [r3, #0]
 80014c8:	2a00      	cmp	r2, #0
 80014ca:	bf14      	ite	ne
 80014cc:	2202      	movne	r2, #2
 80014ce:	2200      	moveq	r2, #0
 80014d0:	e7ee      	b.n	80014b0 <device_wifi_thread+0xc>
 80014d2:	2001      	movs	r0, #1
 80014d4:	f000 ffda 	bl	800248c <led_on>
 80014d8:	2000      	movs	r0, #0
 80014da:	f7ff f8fb 	bl	80006d4 <esp8266_init>
 80014de:	4604      	mov	r4, r0
 80014e0:	b128      	cbz	r0, 80014ee <device_wifi_thread+0x4a>
 80014e2:	f7ff f949 	bl	8000778 <esp8266_uninit>
 80014e6:	2003      	movs	r0, #3
 80014e8:	4621      	mov	r1, r4
 80014ea:	f000 f817 	bl	800151c <abort_error_>
 80014ee:	2064      	movs	r0, #100	; 0x64
 80014f0:	f000 fbc6 	bl	8001c80 <timer_delay_ms>
 80014f4:	4b07      	ldr	r3, [pc, #28]	; (8001514 <device_wifi_thread+0x70>)
 80014f6:	4a05      	ldr	r2, [pc, #20]	; (800150c <device_wifi_thread+0x68>)
 80014f8:	9300      	str	r3, [sp, #0]
 80014fa:	2380      	movs	r3, #128	; 0x80
 80014fc:	9301      	str	r3, [sp, #4]
 80014fe:	f240 71da 	movw	r1, #2010	; 0x7da
 8001502:	462b      	mov	r3, r5
 8001504:	4804      	ldr	r0, [pc, #16]	; (8001518 <device_wifi_thread+0x74>)
 8001506:	f7ff f963 	bl	80007d0 <esp8266_connect>
 800150a:	e7f3      	b.n	80014f4 <device_wifi_thread+0x50>
 800150c:	20000000 	.word	0x20000000
 8001510:	2000004c 	.word	0x2000004c
 8001514:	20000848 	.word	0x20000848
 8001518:	08002740 	.word	0x08002740

0800151c <abort_error_>:
 800151c:	b570      	push	{r4, r5, r6, lr}
 800151e:	4605      	mov	r5, r0
 8001520:	460e      	mov	r6, r1
 8001522:	480d      	ldr	r0, [pc, #52]	; (8001558 <abort_error_+0x3c>)
 8001524:	4629      	mov	r1, r5
 8001526:	4632      	mov	r2, r6
 8001528:	f7fe ffdc 	bl	80004e4 <printf_>
 800152c:	2408      	movs	r4, #8
 800152e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001532:	f000 ffab 	bl	800248c <led_on>
 8001536:	201e      	movs	r0, #30
 8001538:	f000 fba2 	bl	8001c80 <timer_delay_ms>
 800153c:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001540:	f000 ffba 	bl	80024b8 <led_off>
 8001544:	2046      	movs	r0, #70	; 0x46
 8001546:	f000 fb9b 	bl	8001c80 <timer_delay_ms>
 800154a:	3c01      	subs	r4, #1
 800154c:	d1ef      	bne.n	800152e <abort_error_+0x12>
 800154e:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8001552:	f000 fb95 	bl	8001c80 <timer_delay_ms>
 8001556:	e7e4      	b.n	8001522 <abort_error_+0x6>
 8001558:	08002749 	.word	0x08002749

0800155c <line_follower_test>:
 800155c:	b510      	push	{r4, lr}
 800155e:	ed2d 8b06 	vpush	{d8-d10}
 8001562:	eddf 8a38 	vldr	s17, [pc, #224]	; 8001644 <line_follower_test+0xe8>
 8001566:	4604      	mov	r4, r0
 8001568:	eeb0 9a68 	vmov.f32	s18, s17
 800156c:	eef0 9a68 	vmov.f32	s19, s17
 8001570:	f7ff fce6 	bl	8000f40 <rgb_get_line_position>
 8001574:	2c03      	cmp	r4, #3
 8001576:	d81b      	bhi.n	80015b0 <line_follower_test+0x54>
 8001578:	e8df f004 	tbb	[pc, r4]
 800157c:	0e0a0602 	.word	0x0e0a0602
 8001580:	4b31      	ldr	r3, [pc, #196]	; (8001648 <line_follower_test+0xec>)
 8001582:	ed93 8a00 	vldr	s16, [r3]
 8001586:	e00a      	b.n	800159e <line_follower_test+0x42>
 8001588:	4b2f      	ldr	r3, [pc, #188]	; (8001648 <line_follower_test+0xec>)
 800158a:	ed93 8a01 	vldr	s16, [r3, #4]
 800158e:	e006      	b.n	800159e <line_follower_test+0x42>
 8001590:	4b2d      	ldr	r3, [pc, #180]	; (8001648 <line_follower_test+0xec>)
 8001592:	ed93 8a02 	vldr	s16, [r3, #8]
 8001596:	e002      	b.n	800159e <line_follower_test+0x42>
 8001598:	4b2b      	ldr	r3, [pc, #172]	; (8001648 <line_follower_test+0xec>)
 800159a:	ed93 8a03 	vldr	s16, [r3, #12]
 800159e:	eeb8 8ac8 	vcvt.f32.s32	s16, s16
 80015a2:	eddf 7a2a 	vldr	s15, [pc, #168]	; 800164c <line_follower_test+0xf0>
 80015a6:	ee88 8a27 	vdiv.f32	s16, s16, s15
 80015aa:	ee39 8ac8 	vsub.f32	s16, s19, s16
 80015ae:	e001      	b.n	80015b4 <line_follower_test+0x58>
 80015b0:	eeb0 8a68 	vmov.f32	s16, s17
 80015b4:	ed9f aa26 	vldr	s20, [pc, #152]	; 8001650 <line_follower_test+0xf4>
 80015b8:	eeb4 8aca 	vcmpe.f32	s16, s20
 80015bc:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80015c0:	dc09      	bgt.n	80015d6 <line_follower_test+0x7a>
 80015c2:	eddf 7a24 	vldr	s15, [pc, #144]	; 8001654 <line_follower_test+0xf8>
 80015c6:	eeb4 8a67 	vcmp.f32	s16, s15
 80015ca:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80015ce:	bf48      	it	mi
 80015d0:	eeb0 8a67 	vmovmi.f32	s16, s15
 80015d4:	e001      	b.n	80015da <line_follower_test+0x7e>
 80015d6:	eeb0 8a4a 	vmov.f32	s16, s20
 80015da:	eddf 7a1f 	vldr	s15, [pc, #124]	; 8001658 <line_follower_test+0xfc>
 80015de:	ee78 8a68 	vsub.f32	s17, s16, s17
 80015e2:	ee18 0a10 	vmov	r0, s16
 80015e6:	ee68 8aa7 	vmul.f32	s17, s17, s15
 80015ea:	eddf 7a1c 	vldr	s15, [pc, #112]	; 800165c <line_follower_test+0x100>
 80015ee:	ee48 8a27 	vmla.f32	s17, s16, s15
 80015f2:	f7ff fa0b 	bl	8000a0c <m_abs>
 80015f6:	ee07 0a90 	vmov	s15, r0
 80015fa:	ee3a aa67 	vsub.f32	s20, s20, s15
 80015fe:	eddf 7a18 	vldr	s15, [pc, #96]	; 8001660 <line_follower_test+0x104>
 8001602:	ee6a 7a27 	vmul.f32	s15, s20, s15
 8001606:	ee17 0a90 	vmov	r0, s15
 800160a:	eddf 7a16 	vldr	s15, [pc, #88]	; 8001664 <line_follower_test+0x108>
 800160e:	ee79 7a27 	vadd.f32	s15, s18, s15
 8001612:	ee17 1a90 	vmov	r1, s15
 8001616:	f7ff fa05 	bl	8000a24 <m_min>
 800161a:	ee09 0a10 	vmov	s18, r0
 800161e:	ee79 7a28 	vadd.f32	s15, s18, s17
 8001622:	ee79 8a68 	vsub.f32	s17, s18, s17
 8001626:	4b10      	ldr	r3, [pc, #64]	; (8001668 <line_follower_test+0x10c>)
 8001628:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 800162c:	eefd 8ae8 	vcvt.s32.f32	s17, s17
 8001630:	200a      	movs	r0, #10
 8001632:	edc3 7a00 	vstr	s15, [r3]
 8001636:	edc3 8a01 	vstr	s17, [r3, #4]
 800163a:	f000 fb21 	bl	8001c80 <timer_delay_ms>
 800163e:	eef0 8a48 	vmov.f32	s17, s16
 8001642:	e795      	b.n	8001570 <line_follower_test+0x14>
 8001644:	00000000 	.word	0x00000000
 8001648:	2000062c 	.word	0x2000062c
 800164c:	428c0000 	.word	0x428c0000
 8001650:	3f800000 	.word	0x3f800000
 8001654:	bf800000 	.word	0xbf800000
 8001658:	42c80000 	.word	0x42c80000
 800165c:	42200000 	.word	0x42200000
 8001660:	41a00000 	.word	0x41a00000
 8001664:	3e4ccccd 	.word	0x3e4ccccd
 8001668:	20000224 	.word	0x20000224

0800166c <main_thread>:
 800166c:	b508      	push	{r3, lr}
 800166e:	4823      	ldr	r0, [pc, #140]	; (80016fc <main_thread+0x90>)
 8001670:	f7fe ff38 	bl	80004e4 <printf_>
 8001674:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 8001678:	f000 fb02 	bl	8001c80 <timer_delay_ms>
 800167c:	f7ff feac 	bl	80013d8 <device_wake_up>
 8001680:	491f      	ldr	r1, [pc, #124]	; (8001700 <main_thread+0x94>)
 8001682:	4820      	ldr	r0, [pc, #128]	; (8001704 <main_thread+0x98>)
 8001684:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001688:	2306      	movs	r3, #6
 800168a:	f7fe fdff 	bl	800028c <create_thread>
 800168e:	491e      	ldr	r1, [pc, #120]	; (8001708 <main_thread+0x9c>)
 8001690:	481e      	ldr	r0, [pc, #120]	; (800170c <main_thread+0xa0>)
 8001692:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001696:	2306      	movs	r3, #6
 8001698:	f7fe fdf8 	bl	800028c <create_thread>
 800169c:	491c      	ldr	r1, [pc, #112]	; (8001710 <main_thread+0xa4>)
 800169e:	481d      	ldr	r0, [pc, #116]	; (8001714 <main_thread+0xa8>)
 80016a0:	f44f 7200 	mov.w	r2, #512	; 0x200
 80016a4:	2306      	movs	r3, #6
 80016a6:	f7fe fdf1 	bl	800028c <create_thread>
 80016aa:	20c8      	movs	r0, #200	; 0xc8
 80016ac:	f000 fae8 	bl	8001c80 <timer_delay_ms>
 80016b0:	f7ff fcf8 	bl	80010a4 <rgb_set_background>
 80016b4:	f000 ff7c 	bl	80025b0 <get_key>
 80016b8:	b980      	cbnz	r0, 80016dc <main_thread+0x70>
 80016ba:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80016be:	f000 fee5 	bl	800248c <led_on>
 80016c2:	2064      	movs	r0, #100	; 0x64
 80016c4:	f000 fadc 	bl	8001c80 <timer_delay_ms>
 80016c8:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80016cc:	f000 fef4 	bl	80024b8 <led_off>
 80016d0:	20c8      	movs	r0, #200	; 0xc8
 80016d2:	f000 fad5 	bl	8001c80 <timer_delay_ms>
 80016d6:	f7ff fe79 	bl	80013cc <device_sleep>
 80016da:	e7eb      	b.n	80016b4 <main_thread+0x48>
 80016dc:	f7ff fe7c 	bl	80013d8 <device_wake_up>
 80016e0:	20c8      	movs	r0, #200	; 0xc8
 80016e2:	f000 facd 	bl	8001c80 <timer_delay_ms>
 80016e6:	2001      	movs	r0, #1
 80016e8:	f7ff ff38 	bl	800155c <line_follower_test>
 80016ec:	f000 ff60 	bl	80025b0 <get_key>
 80016f0:	2800      	cmp	r0, #0
 80016f2:	d1df      	bne.n	80016b4 <main_thread+0x48>
 80016f4:	f7ff fc24 	bl	8000f40 <rgb_get_line_position>
 80016f8:	e7f8      	b.n	80016ec <main_thread+0x80>
 80016fa:	bf00      	nop
 80016fc:	0800275b 	.word	0x0800275b
 8001700:	200008c8 	.word	0x200008c8
 8001704:	08001445 	.word	0x08001445
 8001708:	20000648 	.word	0x20000648
 800170c:	080013e5 	.word	0x080013e5
 8001710:	20000ac8 	.word	0x20000ac8
 8001714:	080014a5 	.word	0x080014a5

08001718 <main>:
 8001718:	b508      	push	{r3, lr}
 800171a:	f000 fe45 	bl	80023a8 <lib_low_level_init>
 800171e:	f7fe ff5b 	bl	80005d8 <lib_os_init>
 8001722:	4905      	ldr	r1, [pc, #20]	; (8001738 <main+0x20>)
 8001724:	4805      	ldr	r0, [pc, #20]	; (800173c <main+0x24>)
 8001726:	f44f 7200 	mov.w	r2, #512	; 0x200
 800172a:	2306      	movs	r3, #6
 800172c:	f7fe fdae 	bl	800028c <create_thread>
 8001730:	f7fe fda6 	bl	8000280 <kernel_start>
 8001734:	2000      	movs	r0, #0
 8001736:	bd08      	pop	{r3, pc}
 8001738:	20000cc8 	.word	0x20000cc8
 800173c:	0800166d 	.word	0x0800166d

08001740 <RCC_GetClocksFreq>:
 8001740:	4ba5      	ldr	r3, [pc, #660]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 8001742:	685a      	ldr	r2, [r3, #4]
 8001744:	f002 020c 	and.w	r2, r2, #12
 8001748:	2a04      	cmp	r2, #4
 800174a:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 800174e:	d005      	beq.n	800175c <RCC_GetClocksFreq+0x1c>
 8001750:	2a08      	cmp	r2, #8
 8001752:	d006      	beq.n	8001762 <RCC_GetClocksFreq+0x22>
 8001754:	4ba1      	ldr	r3, [pc, #644]	; (80019dc <RCC_GetClocksFreq+0x29c>)
 8001756:	6003      	str	r3, [r0, #0]
 8001758:	b9ba      	cbnz	r2, 800178a <RCC_GetClocksFreq+0x4a>
 800175a:	e017      	b.n	800178c <RCC_GetClocksFreq+0x4c>
 800175c:	4b9f      	ldr	r3, [pc, #636]	; (80019dc <RCC_GetClocksFreq+0x29c>)
 800175e:	6003      	str	r3, [r0, #0]
 8001760:	e013      	b.n	800178a <RCC_GetClocksFreq+0x4a>
 8001762:	6859      	ldr	r1, [r3, #4]
 8001764:	685c      	ldr	r4, [r3, #4]
 8001766:	f3c1 4183 	ubfx	r1, r1, #18, #4
 800176a:	03e2      	lsls	r2, r4, #15
 800176c:	f101 0102 	add.w	r1, r1, #2
 8001770:	d401      	bmi.n	8001776 <RCC_GetClocksFreq+0x36>
 8001772:	4a9b      	ldr	r2, [pc, #620]	; (80019e0 <RCC_GetClocksFreq+0x2a0>)
 8001774:	e006      	b.n	8001784 <RCC_GetClocksFreq+0x44>
 8001776:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001778:	4b98      	ldr	r3, [pc, #608]	; (80019dc <RCC_GetClocksFreq+0x29c>)
 800177a:	f002 020f 	and.w	r2, r2, #15
 800177e:	3201      	adds	r2, #1
 8001780:	fbb3 f2f2 	udiv	r2, r3, r2
 8001784:	434a      	muls	r2, r1
 8001786:	6002      	str	r2, [r0, #0]
 8001788:	e000      	b.n	800178c <RCC_GetClocksFreq+0x4c>
 800178a:	2200      	movs	r2, #0
 800178c:	4f92      	ldr	r7, [pc, #584]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 800178e:	4d95      	ldr	r5, [pc, #596]	; (80019e4 <RCC_GetClocksFreq+0x2a4>)
 8001790:	687b      	ldr	r3, [r7, #4]
 8001792:	f8df 8254 	ldr.w	r8, [pc, #596]	; 80019e8 <RCC_GetClocksFreq+0x2a8>
 8001796:	f3c3 1303 	ubfx	r3, r3, #4, #4
 800179a:	5cec      	ldrb	r4, [r5, r3]
 800179c:	6803      	ldr	r3, [r0, #0]
 800179e:	b2e4      	uxtb	r4, r4
 80017a0:	fa23 f104 	lsr.w	r1, r3, r4
 80017a4:	6041      	str	r1, [r0, #4]
 80017a6:	687e      	ldr	r6, [r7, #4]
 80017a8:	f3c6 2602 	ubfx	r6, r6, #8, #3
 80017ac:	5dae      	ldrb	r6, [r5, r6]
 80017ae:	fa21 f606 	lsr.w	r6, r1, r6
 80017b2:	6086      	str	r6, [r0, #8]
 80017b4:	f8d7 c004 	ldr.w	ip, [r7, #4]
 80017b8:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 80017bc:	f815 500c 	ldrb.w	r5, [r5, ip]
 80017c0:	b2ed      	uxtb	r5, r5
 80017c2:	40e9      	lsrs	r1, r5
 80017c4:	60c1      	str	r1, [r0, #12]
 80017c6:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 80017ca:	f3c9 1904 	ubfx	r9, r9, #4, #5
 80017ce:	f009 0c0f 	and.w	ip, r9, #15
 80017d2:	f019 0f10 	tst.w	r9, #16
 80017d6:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 80017da:	fa1f fc8c 	uxth.w	ip, ip
 80017de:	d007      	beq.n	80017f0 <RCC_GetClocksFreq+0xb0>
 80017e0:	f1bc 0f00 	cmp.w	ip, #0
 80017e4:	d004      	beq.n	80017f0 <RCC_GetClocksFreq+0xb0>
 80017e6:	fbb2 fcfc 	udiv	ip, r2, ip
 80017ea:	f8c0 c010 	str.w	ip, [r0, #16]
 80017ee:	e000      	b.n	80017f2 <RCC_GetClocksFreq+0xb2>
 80017f0:	6103      	str	r3, [r0, #16]
 80017f2:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 80017f4:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 80017f8:	f00c 070f 	and.w	r7, ip, #15
 80017fc:	f01c 0f10 	tst.w	ip, #16
 8001800:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 8001804:	b2bf      	uxth	r7, r7
 8001806:	d004      	beq.n	8001812 <RCC_GetClocksFreq+0xd2>
 8001808:	b11f      	cbz	r7, 8001812 <RCC_GetClocksFreq+0xd2>
 800180a:	fbb2 f7f7 	udiv	r7, r2, r7
 800180e:	6147      	str	r7, [r0, #20]
 8001810:	e000      	b.n	8001814 <RCC_GetClocksFreq+0xd4>
 8001812:	6143      	str	r3, [r0, #20]
 8001814:	4f70      	ldr	r7, [pc, #448]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 8001816:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800181a:	f01c 0f10 	tst.w	ip, #16
 800181e:	bf0a      	itet	eq
 8001820:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 80019dc <RCC_GetClocksFreq+0x29c>
 8001824:	6183      	strne	r3, [r0, #24]
 8001826:	f8c0 c018 	streq.w	ip, [r0, #24]
 800182a:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 800182c:	06bf      	lsls	r7, r7, #26
 800182e:	bf56      	itet	pl
 8001830:	4f6a      	ldrpl	r7, [pc, #424]	; (80019dc <RCC_GetClocksFreq+0x29c>)
 8001832:	61c3      	strmi	r3, [r0, #28]
 8001834:	61c7      	strpl	r7, [r0, #28]
 8001836:	4f68      	ldr	r7, [pc, #416]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 8001838:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800183c:	f01c 0f40 	tst.w	ip, #64	; 0x40
 8001840:	bf0a      	itet	eq
 8001842:	f8df c198 	ldreq.w	ip, [pc, #408]	; 80019dc <RCC_GetClocksFreq+0x29c>
 8001846:	6203      	strne	r3, [r0, #32]
 8001848:	f8c0 c020 	streq.w	ip, [r0, #32]
 800184c:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 800184e:	05ff      	lsls	r7, r7, #23
 8001850:	d506      	bpl.n	8001860 <RCC_GetClocksFreq+0x120>
 8001852:	4293      	cmp	r3, r2
 8001854:	d104      	bne.n	8001860 <RCC_GetClocksFreq+0x120>
 8001856:	42a5      	cmp	r5, r4
 8001858:	d102      	bne.n	8001860 <RCC_GetClocksFreq+0x120>
 800185a:	005f      	lsls	r7, r3, #1
 800185c:	6247      	str	r7, [r0, #36]	; 0x24
 800185e:	e000      	b.n	8001862 <RCC_GetClocksFreq+0x122>
 8001860:	6241      	str	r1, [r0, #36]	; 0x24
 8001862:	4f5d      	ldr	r7, [pc, #372]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 8001864:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8001868:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 800186c:	d008      	beq.n	8001880 <RCC_GetClocksFreq+0x140>
 800186e:	4293      	cmp	r3, r2
 8001870:	d106      	bne.n	8001880 <RCC_GetClocksFreq+0x140>
 8001872:	42a5      	cmp	r5, r4
 8001874:	d104      	bne.n	8001880 <RCC_GetClocksFreq+0x140>
 8001876:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 800187a:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 800187e:	e000      	b.n	8001882 <RCC_GetClocksFreq+0x142>
 8001880:	6281      	str	r1, [r0, #40]	; 0x28
 8001882:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8001884:	05bf      	lsls	r7, r7, #22
 8001886:	d506      	bpl.n	8001896 <RCC_GetClocksFreq+0x156>
 8001888:	4293      	cmp	r3, r2
 800188a:	d104      	bne.n	8001896 <RCC_GetClocksFreq+0x156>
 800188c:	42a5      	cmp	r5, r4
 800188e:	d102      	bne.n	8001896 <RCC_GetClocksFreq+0x156>
 8001890:	005f      	lsls	r7, r3, #1
 8001892:	62c7      	str	r7, [r0, #44]	; 0x2c
 8001894:	e000      	b.n	8001898 <RCC_GetClocksFreq+0x158>
 8001896:	62c1      	str	r1, [r0, #44]	; 0x2c
 8001898:	4f4f      	ldr	r7, [pc, #316]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 800189a:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 800189e:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 80018a2:	d008      	beq.n	80018b6 <RCC_GetClocksFreq+0x176>
 80018a4:	4293      	cmp	r3, r2
 80018a6:	d106      	bne.n	80018b6 <RCC_GetClocksFreq+0x176>
 80018a8:	42a5      	cmp	r5, r4
 80018aa:	d104      	bne.n	80018b6 <RCC_GetClocksFreq+0x176>
 80018ac:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 80018b0:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 80018b4:	e000      	b.n	80018b8 <RCC_GetClocksFreq+0x178>
 80018b6:	64c1      	str	r1, [r0, #76]	; 0x4c
 80018b8:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80018ba:	053f      	lsls	r7, r7, #20
 80018bc:	d506      	bpl.n	80018cc <RCC_GetClocksFreq+0x18c>
 80018be:	4293      	cmp	r3, r2
 80018c0:	d104      	bne.n	80018cc <RCC_GetClocksFreq+0x18c>
 80018c2:	42a5      	cmp	r5, r4
 80018c4:	d102      	bne.n	80018cc <RCC_GetClocksFreq+0x18c>
 80018c6:	005f      	lsls	r7, r3, #1
 80018c8:	6507      	str	r7, [r0, #80]	; 0x50
 80018ca:	e000      	b.n	80018ce <RCC_GetClocksFreq+0x18e>
 80018cc:	6501      	str	r1, [r0, #80]	; 0x50
 80018ce:	4f42      	ldr	r7, [pc, #264]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 80018d0:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 80018d4:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 80018d8:	d008      	beq.n	80018ec <RCC_GetClocksFreq+0x1ac>
 80018da:	4293      	cmp	r3, r2
 80018dc:	d106      	bne.n	80018ec <RCC_GetClocksFreq+0x1ac>
 80018de:	42a5      	cmp	r5, r4
 80018e0:	d104      	bne.n	80018ec <RCC_GetClocksFreq+0x1ac>
 80018e2:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 80018e6:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 80018ea:	e000      	b.n	80018ee <RCC_GetClocksFreq+0x1ae>
 80018ec:	6501      	str	r1, [r0, #80]	; 0x50
 80018ee:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 80018f0:	043f      	lsls	r7, r7, #16
 80018f2:	d506      	bpl.n	8001902 <RCC_GetClocksFreq+0x1c2>
 80018f4:	4293      	cmp	r3, r2
 80018f6:	d104      	bne.n	8001902 <RCC_GetClocksFreq+0x1c2>
 80018f8:	42a5      	cmp	r5, r4
 80018fa:	d102      	bne.n	8001902 <RCC_GetClocksFreq+0x1c2>
 80018fc:	005a      	lsls	r2, r3, #1
 80018fe:	6582      	str	r2, [r0, #88]	; 0x58
 8001900:	e000      	b.n	8001904 <RCC_GetClocksFreq+0x1c4>
 8001902:	6581      	str	r1, [r0, #88]	; 0x58
 8001904:	4a34      	ldr	r2, [pc, #208]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 8001906:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8001908:	07a4      	lsls	r4, r4, #30
 800190a:	d014      	beq.n	8001936 <RCC_GetClocksFreq+0x1f6>
 800190c:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800190e:	f001 0103 	and.w	r1, r1, #3
 8001912:	2901      	cmp	r1, #1
 8001914:	d101      	bne.n	800191a <RCC_GetClocksFreq+0x1da>
 8001916:	6383      	str	r3, [r0, #56]	; 0x38
 8001918:	e00e      	b.n	8001938 <RCC_GetClocksFreq+0x1f8>
 800191a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800191c:	f001 0103 	and.w	r1, r1, #3
 8001920:	2902      	cmp	r1, #2
 8001922:	d102      	bne.n	800192a <RCC_GetClocksFreq+0x1ea>
 8001924:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001928:	e005      	b.n	8001936 <RCC_GetClocksFreq+0x1f6>
 800192a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800192c:	f001 0103 	and.w	r1, r1, #3
 8001930:	2903      	cmp	r1, #3
 8001932:	d101      	bne.n	8001938 <RCC_GetClocksFreq+0x1f8>
 8001934:	4929      	ldr	r1, [pc, #164]	; (80019dc <RCC_GetClocksFreq+0x29c>)
 8001936:	6381      	str	r1, [r0, #56]	; 0x38
 8001938:	6b12      	ldr	r2, [r2, #48]	; 0x30
 800193a:	4927      	ldr	r1, [pc, #156]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 800193c:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 8001940:	d101      	bne.n	8001946 <RCC_GetClocksFreq+0x206>
 8001942:	63c6      	str	r6, [r0, #60]	; 0x3c
 8001944:	e018      	b.n	8001978 <RCC_GetClocksFreq+0x238>
 8001946:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001948:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 800194c:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 8001950:	d101      	bne.n	8001956 <RCC_GetClocksFreq+0x216>
 8001952:	63c3      	str	r3, [r0, #60]	; 0x3c
 8001954:	e010      	b.n	8001978 <RCC_GetClocksFreq+0x238>
 8001956:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001958:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 800195c:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 8001960:	d102      	bne.n	8001968 <RCC_GetClocksFreq+0x228>
 8001962:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001966:	e006      	b.n	8001976 <RCC_GetClocksFreq+0x236>
 8001968:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 800196a:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 800196e:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 8001972:	d101      	bne.n	8001978 <RCC_GetClocksFreq+0x238>
 8001974:	4a19      	ldr	r2, [pc, #100]	; (80019dc <RCC_GetClocksFreq+0x29c>)
 8001976:	63c2      	str	r2, [r0, #60]	; 0x3c
 8001978:	4a17      	ldr	r2, [pc, #92]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 800197a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 800197c:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8001980:	d101      	bne.n	8001986 <RCC_GetClocksFreq+0x246>
 8001982:	6406      	str	r6, [r0, #64]	; 0x40
 8001984:	e018      	b.n	80019b8 <RCC_GetClocksFreq+0x278>
 8001986:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001988:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 800198c:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8001990:	d101      	bne.n	8001996 <RCC_GetClocksFreq+0x256>
 8001992:	6403      	str	r3, [r0, #64]	; 0x40
 8001994:	e010      	b.n	80019b8 <RCC_GetClocksFreq+0x278>
 8001996:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001998:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 800199c:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 80019a0:	d102      	bne.n	80019a8 <RCC_GetClocksFreq+0x268>
 80019a2:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80019a6:	e006      	b.n	80019b6 <RCC_GetClocksFreq+0x276>
 80019a8:	6b11      	ldr	r1, [r2, #48]	; 0x30
 80019aa:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 80019ae:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 80019b2:	d101      	bne.n	80019b8 <RCC_GetClocksFreq+0x278>
 80019b4:	4909      	ldr	r1, [pc, #36]	; (80019dc <RCC_GetClocksFreq+0x29c>)
 80019b6:	6401      	str	r1, [r0, #64]	; 0x40
 80019b8:	6b12      	ldr	r2, [r2, #48]	; 0x30
 80019ba:	4907      	ldr	r1, [pc, #28]	; (80019d8 <RCC_GetClocksFreq+0x298>)
 80019bc:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 80019c0:	d101      	bne.n	80019c6 <RCC_GetClocksFreq+0x286>
 80019c2:	6446      	str	r6, [r0, #68]	; 0x44
 80019c4:	e023      	b.n	8001a0e <RCC_GetClocksFreq+0x2ce>
 80019c6:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80019c8:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80019cc:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 80019d0:	d10c      	bne.n	80019ec <RCC_GetClocksFreq+0x2ac>
 80019d2:	6443      	str	r3, [r0, #68]	; 0x44
 80019d4:	e01b      	b.n	8001a0e <RCC_GetClocksFreq+0x2ce>
 80019d6:	bf00      	nop
 80019d8:	40021000 	.word	0x40021000
 80019dc:	007a1200 	.word	0x007a1200
 80019e0:	003d0900 	.word	0x003d0900
 80019e4:	2000003c 	.word	0x2000003c
 80019e8:	2000001c 	.word	0x2000001c
 80019ec:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 80019ee:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 80019f2:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 80019f6:	d102      	bne.n	80019fe <RCC_GetClocksFreq+0x2be>
 80019f8:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80019fc:	e006      	b.n	8001a0c <RCC_GetClocksFreq+0x2cc>
 80019fe:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001a00:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8001a04:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 8001a08:	d101      	bne.n	8001a0e <RCC_GetClocksFreq+0x2ce>
 8001a0a:	4a11      	ldr	r2, [pc, #68]	; (8001a50 <RCC_GetClocksFreq+0x310>)
 8001a0c:	6442      	str	r2, [r0, #68]	; 0x44
 8001a0e:	4a11      	ldr	r2, [pc, #68]	; (8001a54 <RCC_GetClocksFreq+0x314>)
 8001a10:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001a12:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 8001a16:	d102      	bne.n	8001a1e <RCC_GetClocksFreq+0x2de>
 8001a18:	6486      	str	r6, [r0, #72]	; 0x48
 8001a1a:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001a1e:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001a20:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 8001a24:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 8001a28:	d00f      	beq.n	8001a4a <RCC_GetClocksFreq+0x30a>
 8001a2a:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001a2c:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001a30:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 8001a34:	d102      	bne.n	8001a3c <RCC_GetClocksFreq+0x2fc>
 8001a36:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001a3a:	e006      	b.n	8001a4a <RCC_GetClocksFreq+0x30a>
 8001a3c:	6b13      	ldr	r3, [r2, #48]	; 0x30
 8001a3e:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001a42:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8001a46:	d101      	bne.n	8001a4c <RCC_GetClocksFreq+0x30c>
 8001a48:	4b01      	ldr	r3, [pc, #4]	; (8001a50 <RCC_GetClocksFreq+0x310>)
 8001a4a:	6483      	str	r3, [r0, #72]	; 0x48
 8001a4c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001a50:	007a1200 	.word	0x007a1200
 8001a54:	40021000 	.word	0x40021000

08001a58 <RCC_AHBPeriphClockCmd>:
 8001a58:	bf00      	nop
 8001a5a:	bf00      	nop
 8001a5c:	4b04      	ldr	r3, [pc, #16]	; (8001a70 <RCC_AHBPeriphClockCmd+0x18>)
 8001a5e:	695a      	ldr	r2, [r3, #20]
 8001a60:	b109      	cbz	r1, 8001a66 <RCC_AHBPeriphClockCmd+0xe>
 8001a62:	4310      	orrs	r0, r2
 8001a64:	e001      	b.n	8001a6a <RCC_AHBPeriphClockCmd+0x12>
 8001a66:	ea22 0000 	bic.w	r0, r2, r0
 8001a6a:	6158      	str	r0, [r3, #20]
 8001a6c:	4770      	bx	lr
 8001a6e:	bf00      	nop
 8001a70:	40021000 	.word	0x40021000

08001a74 <RCC_APB2PeriphClockCmd>:
 8001a74:	bf00      	nop
 8001a76:	bf00      	nop
 8001a78:	4b04      	ldr	r3, [pc, #16]	; (8001a8c <RCC_APB2PeriphClockCmd+0x18>)
 8001a7a:	699a      	ldr	r2, [r3, #24]
 8001a7c:	b109      	cbz	r1, 8001a82 <RCC_APB2PeriphClockCmd+0xe>
 8001a7e:	4310      	orrs	r0, r2
 8001a80:	e001      	b.n	8001a86 <RCC_APB2PeriphClockCmd+0x12>
 8001a82:	ea22 0000 	bic.w	r0, r2, r0
 8001a86:	6198      	str	r0, [r3, #24]
 8001a88:	4770      	bx	lr
 8001a8a:	bf00      	nop
 8001a8c:	40021000 	.word	0x40021000

08001a90 <RCC_APB1PeriphClockCmd>:
 8001a90:	bf00      	nop
 8001a92:	bf00      	nop
 8001a94:	4b04      	ldr	r3, [pc, #16]	; (8001aa8 <RCC_APB1PeriphClockCmd+0x18>)
 8001a96:	69da      	ldr	r2, [r3, #28]
 8001a98:	b109      	cbz	r1, 8001a9e <RCC_APB1PeriphClockCmd+0xe>
 8001a9a:	4310      	orrs	r0, r2
 8001a9c:	e001      	b.n	8001aa2 <RCC_APB1PeriphClockCmd+0x12>
 8001a9e:	ea22 0000 	bic.w	r0, r2, r0
 8001aa2:	61d8      	str	r0, [r3, #28]
 8001aa4:	4770      	bx	lr
 8001aa6:	bf00      	nop
 8001aa8:	40021000 	.word	0x40021000

08001aac <TIM_TimeBaseInit>:
 8001aac:	bf00      	nop
 8001aae:	bf00      	nop
 8001ab0:	bf00      	nop
 8001ab2:	4a24      	ldr	r2, [pc, #144]	; (8001b44 <TIM_TimeBaseInit+0x98>)
 8001ab4:	8803      	ldrh	r3, [r0, #0]
 8001ab6:	4290      	cmp	r0, r2
 8001ab8:	b29b      	uxth	r3, r3
 8001aba:	d012      	beq.n	8001ae2 <TIM_TimeBaseInit+0x36>
 8001abc:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8001ac0:	4290      	cmp	r0, r2
 8001ac2:	d00e      	beq.n	8001ae2 <TIM_TimeBaseInit+0x36>
 8001ac4:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001ac8:	d00b      	beq.n	8001ae2 <TIM_TimeBaseInit+0x36>
 8001aca:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 8001ace:	4290      	cmp	r0, r2
 8001ad0:	d007      	beq.n	8001ae2 <TIM_TimeBaseInit+0x36>
 8001ad2:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001ad6:	4290      	cmp	r0, r2
 8001ad8:	d003      	beq.n	8001ae2 <TIM_TimeBaseInit+0x36>
 8001ada:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 8001ade:	4290      	cmp	r0, r2
 8001ae0:	d103      	bne.n	8001aea <TIM_TimeBaseInit+0x3e>
 8001ae2:	884a      	ldrh	r2, [r1, #2]
 8001ae4:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001ae8:	4313      	orrs	r3, r2
 8001aea:	4a17      	ldr	r2, [pc, #92]	; (8001b48 <TIM_TimeBaseInit+0x9c>)
 8001aec:	4290      	cmp	r0, r2
 8001aee:	d008      	beq.n	8001b02 <TIM_TimeBaseInit+0x56>
 8001af0:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001af4:	4290      	cmp	r0, r2
 8001af6:	d004      	beq.n	8001b02 <TIM_TimeBaseInit+0x56>
 8001af8:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001afc:	890a      	ldrh	r2, [r1, #8]
 8001afe:	b29b      	uxth	r3, r3
 8001b00:	4313      	orrs	r3, r2
 8001b02:	8003      	strh	r3, [r0, #0]
 8001b04:	684b      	ldr	r3, [r1, #4]
 8001b06:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001b08:	880b      	ldrh	r3, [r1, #0]
 8001b0a:	8503      	strh	r3, [r0, #40]	; 0x28
 8001b0c:	4b0d      	ldr	r3, [pc, #52]	; (8001b44 <TIM_TimeBaseInit+0x98>)
 8001b0e:	4298      	cmp	r0, r3
 8001b10:	d013      	beq.n	8001b3a <TIM_TimeBaseInit+0x8e>
 8001b12:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001b16:	4298      	cmp	r0, r3
 8001b18:	d00f      	beq.n	8001b3a <TIM_TimeBaseInit+0x8e>
 8001b1a:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 8001b1e:	4298      	cmp	r0, r3
 8001b20:	d00b      	beq.n	8001b3a <TIM_TimeBaseInit+0x8e>
 8001b22:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001b26:	4298      	cmp	r0, r3
 8001b28:	d007      	beq.n	8001b3a <TIM_TimeBaseInit+0x8e>
 8001b2a:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001b2e:	4298      	cmp	r0, r3
 8001b30:	d003      	beq.n	8001b3a <TIM_TimeBaseInit+0x8e>
 8001b32:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001b36:	4298      	cmp	r0, r3
 8001b38:	d101      	bne.n	8001b3e <TIM_TimeBaseInit+0x92>
 8001b3a:	894b      	ldrh	r3, [r1, #10]
 8001b3c:	8603      	strh	r3, [r0, #48]	; 0x30
 8001b3e:	2301      	movs	r3, #1
 8001b40:	6143      	str	r3, [r0, #20]
 8001b42:	4770      	bx	lr
 8001b44:	40012c00 	.word	0x40012c00
 8001b48:	40001000 	.word	0x40001000

08001b4c <TIM_Cmd>:
 8001b4c:	bf00      	nop
 8001b4e:	bf00      	nop
 8001b50:	8803      	ldrh	r3, [r0, #0]
 8001b52:	b119      	cbz	r1, 8001b5c <TIM_Cmd+0x10>
 8001b54:	b29b      	uxth	r3, r3
 8001b56:	f043 0301 	orr.w	r3, r3, #1
 8001b5a:	e003      	b.n	8001b64 <TIM_Cmd+0x18>
 8001b5c:	f023 0301 	bic.w	r3, r3, #1
 8001b60:	041b      	lsls	r3, r3, #16
 8001b62:	0c1b      	lsrs	r3, r3, #16
 8001b64:	8003      	strh	r3, [r0, #0]
 8001b66:	4770      	bx	lr

08001b68 <TIM_ClearITPendingBit>:
 8001b68:	bf00      	nop
 8001b6a:	43c9      	mvns	r1, r1
 8001b6c:	b289      	uxth	r1, r1
 8001b6e:	6101      	str	r1, [r0, #16]
 8001b70:	4770      	bx	lr
	...

08001b74 <timer_init>:
 8001b74:	b530      	push	{r4, r5, lr}
 8001b76:	2300      	movs	r3, #0
 8001b78:	b085      	sub	sp, #20
 8001b7a:	491f      	ldr	r1, [pc, #124]	; (8001bf8 <timer_init+0x84>)
 8001b7c:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001b80:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001b84:	491d      	ldr	r1, [pc, #116]	; (8001bfc <timer_init+0x88>)
 8001b86:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001b8a:	4a1d      	ldr	r2, [pc, #116]	; (8001c00 <timer_init+0x8c>)
 8001b8c:	2400      	movs	r4, #0
 8001b8e:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8001b92:	3301      	adds	r3, #1
 8001b94:	2b04      	cmp	r3, #4
 8001b96:	4625      	mov	r5, r4
 8001b98:	d1ef      	bne.n	8001b7a <timer_init+0x6>
 8001b9a:	4b1a      	ldr	r3, [pc, #104]	; (8001c04 <timer_init+0x90>)
 8001b9c:	2002      	movs	r0, #2
 8001b9e:	2101      	movs	r1, #1
 8001ba0:	601c      	str	r4, [r3, #0]
 8001ba2:	f7ff ff75 	bl	8001a90 <RCC_APB1PeriphClockCmd>
 8001ba6:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001baa:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001bae:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001bb2:	4c15      	ldr	r4, [pc, #84]	; (8001c08 <timer_init+0x94>)
 8001bb4:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001bb8:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001bbc:	4620      	mov	r0, r4
 8001bbe:	2331      	movs	r3, #49	; 0x31
 8001bc0:	a901      	add	r1, sp, #4
 8001bc2:	9302      	str	r3, [sp, #8]
 8001bc4:	f7ff ff72 	bl	8001aac <TIM_TimeBaseInit>
 8001bc8:	4620      	mov	r0, r4
 8001bca:	2101      	movs	r1, #1
 8001bcc:	f7ff ffbe 	bl	8001b4c <TIM_Cmd>
 8001bd0:	68e3      	ldr	r3, [r4, #12]
 8001bd2:	f043 0301 	orr.w	r3, r3, #1
 8001bd6:	60e3      	str	r3, [r4, #12]
 8001bd8:	231d      	movs	r3, #29
 8001bda:	f88d 3000 	strb.w	r3, [sp]
 8001bde:	4668      	mov	r0, sp
 8001be0:	2301      	movs	r3, #1
 8001be2:	f88d 5001 	strb.w	r5, [sp, #1]
 8001be6:	f88d 3002 	strb.w	r3, [sp, #2]
 8001bea:	f88d 3003 	strb.w	r3, [sp, #3]
 8001bee:	f000 fba3 	bl	8002338 <NVIC_Init>
 8001bf2:	b005      	add	sp, #20
 8001bf4:	bd30      	pop	{r4, r5, pc}
 8001bf6:	bf00      	nop
 8001bf8:	20000edc 	.word	0x20000edc
 8001bfc:	20000ed0 	.word	0x20000ed0
 8001c00:	20000ec8 	.word	0x20000ec8
 8001c04:	20000ed8 	.word	0x20000ed8
 8001c08:	40000400 	.word	0x40000400

08001c0c <TIM3_IRQHandler>:
 8001c0c:	2300      	movs	r3, #0
 8001c0e:	4a10      	ldr	r2, [pc, #64]	; (8001c50 <TIM3_IRQHandler+0x44>)
 8001c10:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001c14:	b289      	uxth	r1, r1
 8001c16:	b129      	cbz	r1, 8001c24 <TIM3_IRQHandler+0x18>
 8001c18:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001c1c:	b289      	uxth	r1, r1
 8001c1e:	3901      	subs	r1, #1
 8001c20:	b289      	uxth	r1, r1
 8001c22:	e007      	b.n	8001c34 <TIM3_IRQHandler+0x28>
 8001c24:	490b      	ldr	r1, [pc, #44]	; (8001c54 <TIM3_IRQHandler+0x48>)
 8001c26:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001c2a:	b289      	uxth	r1, r1
 8001c2c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001c30:	4a09      	ldr	r2, [pc, #36]	; (8001c58 <TIM3_IRQHandler+0x4c>)
 8001c32:	2101      	movs	r1, #1
 8001c34:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001c38:	3301      	adds	r3, #1
 8001c3a:	2b04      	cmp	r3, #4
 8001c3c:	d1e7      	bne.n	8001c0e <TIM3_IRQHandler+0x2>
 8001c3e:	4b07      	ldr	r3, [pc, #28]	; (8001c5c <TIM3_IRQHandler+0x50>)
 8001c40:	4807      	ldr	r0, [pc, #28]	; (8001c60 <TIM3_IRQHandler+0x54>)
 8001c42:	681a      	ldr	r2, [r3, #0]
 8001c44:	2101      	movs	r1, #1
 8001c46:	3201      	adds	r2, #1
 8001c48:	601a      	str	r2, [r3, #0]
 8001c4a:	f7ff bf8d 	b.w	8001b68 <TIM_ClearITPendingBit>
 8001c4e:	bf00      	nop
 8001c50:	20000edc 	.word	0x20000edc
 8001c54:	20000ed0 	.word	0x20000ed0
 8001c58:	20000ec8 	.word	0x20000ec8
 8001c5c:	20000ed8 	.word	0x20000ed8
 8001c60:	40000400 	.word	0x40000400

08001c64 <timer_get_time>:
 8001c64:	b082      	sub	sp, #8
 8001c66:	b672      	cpsid	i
 8001c68:	4b04      	ldr	r3, [pc, #16]	; (8001c7c <timer_get_time+0x18>)
 8001c6a:	681b      	ldr	r3, [r3, #0]
 8001c6c:	9301      	str	r3, [sp, #4]
 8001c6e:	b662      	cpsie	i
 8001c70:	9801      	ldr	r0, [sp, #4]
 8001c72:	230a      	movs	r3, #10
 8001c74:	fbb0 f0f3 	udiv	r0, r0, r3
 8001c78:	b002      	add	sp, #8
 8001c7a:	4770      	bx	lr
 8001c7c:	20000ed8 	.word	0x20000ed8

08001c80 <timer_delay_ms>:
 8001c80:	b513      	push	{r0, r1, r4, lr}
 8001c82:	4604      	mov	r4, r0
 8001c84:	f7ff ffee 	bl	8001c64 <timer_get_time>
 8001c88:	4420      	add	r0, r4
 8001c8a:	9001      	str	r0, [sp, #4]
 8001c8c:	9c01      	ldr	r4, [sp, #4]
 8001c8e:	f7ff ffe9 	bl	8001c64 <timer_get_time>
 8001c92:	4284      	cmp	r4, r0
 8001c94:	d902      	bls.n	8001c9c <timer_delay_ms+0x1c>
 8001c96:	f000 fb4b 	bl	8002330 <sleep>
 8001c9a:	e7f7      	b.n	8001c8c <timer_delay_ms+0xc>
 8001c9c:	b002      	add	sp, #8
 8001c9e:	bd10      	pop	{r4, pc}

08001ca0 <event_timer_set_period>:
 8001ca0:	b672      	cpsid	i
 8001ca2:	230a      	movs	r3, #10
 8001ca4:	4359      	muls	r1, r3
 8001ca6:	4b06      	ldr	r3, [pc, #24]	; (8001cc0 <event_timer_set_period+0x20>)
 8001ca8:	b289      	uxth	r1, r1
 8001caa:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001cae:	4b05      	ldr	r3, [pc, #20]	; (8001cc4 <event_timer_set_period+0x24>)
 8001cb0:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001cb4:	4b04      	ldr	r3, [pc, #16]	; (8001cc8 <event_timer_set_period+0x28>)
 8001cb6:	2200      	movs	r2, #0
 8001cb8:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 8001cbc:	b662      	cpsie	i
 8001cbe:	4770      	bx	lr
 8001cc0:	20000edc 	.word	0x20000edc
 8001cc4:	20000ed0 	.word	0x20000ed0
 8001cc8:	20000ec8 	.word	0x20000ec8

08001ccc <event_timer_wait>:
 8001ccc:	b510      	push	{r4, lr}
 8001cce:	4604      	mov	r4, r0
 8001cd0:	4b06      	ldr	r3, [pc, #24]	; (8001cec <event_timer_wait+0x20>)
 8001cd2:	f833 2014 	ldrh.w	r2, [r3, r4, lsl #1]
 8001cd6:	b292      	uxth	r2, r2
 8001cd8:	b912      	cbnz	r2, 8001ce0 <event_timer_wait+0x14>
 8001cda:	f000 fb29 	bl	8002330 <sleep>
 8001cde:	e7f7      	b.n	8001cd0 <event_timer_wait+0x4>
 8001ce0:	b672      	cpsid	i
 8001ce2:	2200      	movs	r2, #0
 8001ce4:	f823 2014 	strh.w	r2, [r3, r4, lsl #1]
 8001ce8:	b662      	cpsie	i
 8001cea:	bd10      	pop	{r4, pc}
 8001cec:	20000ec8 	.word	0x20000ec8

08001cf0 <USART_Init>:
 8001cf0:	b530      	push	{r4, r5, lr}
 8001cf2:	4604      	mov	r4, r0
 8001cf4:	b099      	sub	sp, #100	; 0x64
 8001cf6:	460d      	mov	r5, r1
 8001cf8:	bf00      	nop
 8001cfa:	bf00      	nop
 8001cfc:	bf00      	nop
 8001cfe:	bf00      	nop
 8001d00:	bf00      	nop
 8001d02:	bf00      	nop
 8001d04:	bf00      	nop
 8001d06:	6803      	ldr	r3, [r0, #0]
 8001d08:	f023 0301 	bic.w	r3, r3, #1
 8001d0c:	6003      	str	r3, [r0, #0]
 8001d0e:	6842      	ldr	r2, [r0, #4]
 8001d10:	688b      	ldr	r3, [r1, #8]
 8001d12:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 8001d16:	4313      	orrs	r3, r2
 8001d18:	6043      	str	r3, [r0, #4]
 8001d1a:	686a      	ldr	r2, [r5, #4]
 8001d1c:	68eb      	ldr	r3, [r5, #12]
 8001d1e:	6801      	ldr	r1, [r0, #0]
 8001d20:	431a      	orrs	r2, r3
 8001d22:	692b      	ldr	r3, [r5, #16]
 8001d24:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 8001d28:	f021 010c 	bic.w	r1, r1, #12
 8001d2c:	4313      	orrs	r3, r2
 8001d2e:	430b      	orrs	r3, r1
 8001d30:	6003      	str	r3, [r0, #0]
 8001d32:	6882      	ldr	r2, [r0, #8]
 8001d34:	696b      	ldr	r3, [r5, #20]
 8001d36:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 8001d3a:	4313      	orrs	r3, r2
 8001d3c:	6083      	str	r3, [r0, #8]
 8001d3e:	a801      	add	r0, sp, #4
 8001d40:	f7ff fcfe 	bl	8001740 <RCC_GetClocksFreq>
 8001d44:	4b17      	ldr	r3, [pc, #92]	; (8001da4 <USART_Init+0xb4>)
 8001d46:	429c      	cmp	r4, r3
 8001d48:	d101      	bne.n	8001d4e <USART_Init+0x5e>
 8001d4a:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 8001d4c:	e00e      	b.n	8001d6c <USART_Init+0x7c>
 8001d4e:	4b16      	ldr	r3, [pc, #88]	; (8001da8 <USART_Init+0xb8>)
 8001d50:	429c      	cmp	r4, r3
 8001d52:	d101      	bne.n	8001d58 <USART_Init+0x68>
 8001d54:	9a10      	ldr	r2, [sp, #64]	; 0x40
 8001d56:	e009      	b.n	8001d6c <USART_Init+0x7c>
 8001d58:	4b14      	ldr	r3, [pc, #80]	; (8001dac <USART_Init+0xbc>)
 8001d5a:	429c      	cmp	r4, r3
 8001d5c:	d101      	bne.n	8001d62 <USART_Init+0x72>
 8001d5e:	9a11      	ldr	r2, [sp, #68]	; 0x44
 8001d60:	e004      	b.n	8001d6c <USART_Init+0x7c>
 8001d62:	4b13      	ldr	r3, [pc, #76]	; (8001db0 <USART_Init+0xc0>)
 8001d64:	429c      	cmp	r4, r3
 8001d66:	bf0c      	ite	eq
 8001d68:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 8001d6a:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 8001d6c:	6823      	ldr	r3, [r4, #0]
 8001d6e:	6829      	ldr	r1, [r5, #0]
 8001d70:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 8001d74:	bf18      	it	ne
 8001d76:	0052      	lslne	r2, r2, #1
 8001d78:	fbb2 f3f1 	udiv	r3, r2, r1
 8001d7c:	fb01 2213 	mls	r2, r1, r3, r2
 8001d80:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 8001d84:	6822      	ldr	r2, [r4, #0]
 8001d86:	bf28      	it	cs
 8001d88:	3301      	addcs	r3, #1
 8001d8a:	0412      	lsls	r2, r2, #16
 8001d8c:	d506      	bpl.n	8001d9c <USART_Init+0xac>
 8001d8e:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 8001d92:	f3c3 0142 	ubfx	r1, r3, #1, #3
 8001d96:	401a      	ands	r2, r3
 8001d98:	ea41 0302 	orr.w	r3, r1, r2
 8001d9c:	b29b      	uxth	r3, r3
 8001d9e:	81a3      	strh	r3, [r4, #12]
 8001da0:	b019      	add	sp, #100	; 0x64
 8001da2:	bd30      	pop	{r4, r5, pc}
 8001da4:	40013800 	.word	0x40013800
 8001da8:	40004400 	.word	0x40004400
 8001dac:	40004800 	.word	0x40004800
 8001db0:	40004c00 	.word	0x40004c00

08001db4 <USART_Cmd>:
 8001db4:	bf00      	nop
 8001db6:	bf00      	nop
 8001db8:	6803      	ldr	r3, [r0, #0]
 8001dba:	b111      	cbz	r1, 8001dc2 <USART_Cmd+0xe>
 8001dbc:	f043 0301 	orr.w	r3, r3, #1
 8001dc0:	e001      	b.n	8001dc6 <USART_Cmd+0x12>
 8001dc2:	f023 0301 	bic.w	r3, r3, #1
 8001dc6:	6003      	str	r3, [r0, #0]
 8001dc8:	4770      	bx	lr

08001dca <USART_ReceiveData>:
 8001dca:	bf00      	nop
 8001dcc:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8001dce:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8001dd2:	4770      	bx	lr

08001dd4 <USART_ITConfig>:
 8001dd4:	b510      	push	{r4, lr}
 8001dd6:	bf00      	nop
 8001dd8:	bf00      	nop
 8001dda:	bf00      	nop
 8001ddc:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8001de0:	2401      	movs	r4, #1
 8001de2:	b2c9      	uxtb	r1, r1
 8001de4:	2b02      	cmp	r3, #2
 8001de6:	fa04 f101 	lsl.w	r1, r4, r1
 8001dea:	d101      	bne.n	8001df0 <USART_ITConfig+0x1c>
 8001dec:	3004      	adds	r0, #4
 8001dee:	e002      	b.n	8001df6 <USART_ITConfig+0x22>
 8001df0:	2b03      	cmp	r3, #3
 8001df2:	bf08      	it	eq
 8001df4:	3008      	addeq	r0, #8
 8001df6:	6803      	ldr	r3, [r0, #0]
 8001df8:	b10a      	cbz	r2, 8001dfe <USART_ITConfig+0x2a>
 8001dfa:	4319      	orrs	r1, r3
 8001dfc:	e001      	b.n	8001e02 <USART_ITConfig+0x2e>
 8001dfe:	ea23 0101 	bic.w	r1, r3, r1
 8001e02:	6001      	str	r1, [r0, #0]
 8001e04:	bd10      	pop	{r4, pc}

08001e06 <USART_GetITStatus>:
 8001e06:	b510      	push	{r4, lr}
 8001e08:	bf00      	nop
 8001e0a:	bf00      	nop
 8001e0c:	2401      	movs	r4, #1
 8001e0e:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8001e12:	b2cb      	uxtb	r3, r1
 8001e14:	42a2      	cmp	r2, r4
 8001e16:	fa04 f303 	lsl.w	r3, r4, r3
 8001e1a:	d101      	bne.n	8001e20 <USART_GetITStatus+0x1a>
 8001e1c:	6802      	ldr	r2, [r0, #0]
 8001e1e:	e003      	b.n	8001e28 <USART_GetITStatus+0x22>
 8001e20:	2a02      	cmp	r2, #2
 8001e22:	bf0c      	ite	eq
 8001e24:	6842      	ldreq	r2, [r0, #4]
 8001e26:	6882      	ldrne	r2, [r0, #8]
 8001e28:	4013      	ands	r3, r2
 8001e2a:	69c2      	ldr	r2, [r0, #28]
 8001e2c:	b143      	cbz	r3, 8001e40 <USART_GetITStatus+0x3a>
 8001e2e:	2301      	movs	r3, #1
 8001e30:	0c09      	lsrs	r1, r1, #16
 8001e32:	fa03 f101 	lsl.w	r1, r3, r1
 8001e36:	4211      	tst	r1, r2
 8001e38:	bf0c      	ite	eq
 8001e3a:	2000      	moveq	r0, #0
 8001e3c:	2001      	movne	r0, #1
 8001e3e:	bd10      	pop	{r4, pc}
 8001e40:	4618      	mov	r0, r3
 8001e42:	bd10      	pop	{r4, pc}

08001e44 <USART_ClearITPendingBit>:
 8001e44:	bf00      	nop
 8001e46:	bf00      	nop
 8001e48:	2301      	movs	r3, #1
 8001e4a:	0c09      	lsrs	r1, r1, #16
 8001e4c:	fa03 f101 	lsl.w	r1, r3, r1
 8001e50:	6201      	str	r1, [r0, #32]
 8001e52:	4770      	bx	lr

08001e54 <uart_write>:
 8001e54:	4b03      	ldr	r3, [pc, #12]	; (8001e64 <uart_write+0x10>)
 8001e56:	69da      	ldr	r2, [r3, #28]
 8001e58:	0612      	lsls	r2, r2, #24
 8001e5a:	d401      	bmi.n	8001e60 <uart_write+0xc>
 8001e5c:	bf00      	nop
 8001e5e:	e7f9      	b.n	8001e54 <uart_write>
 8001e60:	8518      	strh	r0, [r3, #40]	; 0x28
 8001e62:	4770      	bx	lr
 8001e64:	40013800 	.word	0x40013800

08001e68 <uart_is_char>:
 8001e68:	4b0a      	ldr	r3, [pc, #40]	; (8001e94 <uart_is_char+0x2c>)
 8001e6a:	4a0b      	ldr	r2, [pc, #44]	; (8001e98 <uart_is_char+0x30>)
 8001e6c:	6819      	ldr	r1, [r3, #0]
 8001e6e:	6812      	ldr	r2, [r2, #0]
 8001e70:	4291      	cmp	r1, r2
 8001e72:	d00c      	beq.n	8001e8e <uart_is_char+0x26>
 8001e74:	681a      	ldr	r2, [r3, #0]
 8001e76:	4909      	ldr	r1, [pc, #36]	; (8001e9c <uart_is_char+0x34>)
 8001e78:	5c88      	ldrb	r0, [r1, r2]
 8001e7a:	681a      	ldr	r2, [r3, #0]
 8001e7c:	3201      	adds	r2, #1
 8001e7e:	601a      	str	r2, [r3, #0]
 8001e80:	681a      	ldr	r2, [r3, #0]
 8001e82:	2a0f      	cmp	r2, #15
 8001e84:	b2c0      	uxtb	r0, r0
 8001e86:	d904      	bls.n	8001e92 <uart_is_char+0x2a>
 8001e88:	2200      	movs	r2, #0
 8001e8a:	601a      	str	r2, [r3, #0]
 8001e8c:	4770      	bx	lr
 8001e8e:	f64f 70ff 	movw	r0, #65535	; 0xffff
 8001e92:	4770      	bx	lr
 8001e94:	20000ef8 	.word	0x20000ef8
 8001e98:	20000ef4 	.word	0x20000ef4
 8001e9c:	20000ee4 	.word	0x20000ee4

08001ea0 <uart_read>:
 8001ea0:	b508      	push	{r3, lr}
 8001ea2:	f7ff ffe1 	bl	8001e68 <uart_is_char>
 8001ea6:	f64f 73ff 	movw	r3, #65535	; 0xffff
 8001eaa:	4298      	cmp	r0, r3
 8001eac:	d101      	bne.n	8001eb2 <uart_read+0x12>
 8001eae:	bf00      	nop
 8001eb0:	e7f7      	b.n	8001ea2 <uart_read+0x2>
 8001eb2:	b2c0      	uxtb	r0, r0
 8001eb4:	bd08      	pop	{r3, pc}
	...

08001eb8 <uart_init>:
 8001eb8:	b530      	push	{r4, r5, lr}
 8001eba:	4b2c      	ldr	r3, [pc, #176]	; (8001f6c <uart_init+0xb4>)
 8001ebc:	4d2c      	ldr	r5, [pc, #176]	; (8001f70 <uart_init+0xb8>)
 8001ebe:	2400      	movs	r4, #0
 8001ec0:	601c      	str	r4, [r3, #0]
 8001ec2:	4b2c      	ldr	r3, [pc, #176]	; (8001f74 <uart_init+0xbc>)
 8001ec4:	b08b      	sub	sp, #44	; 0x2c
 8001ec6:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001eca:	2101      	movs	r1, #1
 8001ecc:	601c      	str	r4, [r3, #0]
 8001ece:	f7ff fdc3 	bl	8001a58 <RCC_AHBPeriphClockCmd>
 8001ed2:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001ed6:	2101      	movs	r1, #1
 8001ed8:	f7ff fdcc 	bl	8001a74 <RCC_APB2PeriphClockCmd>
 8001edc:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001ee0:	9302      	str	r3, [sp, #8]
 8001ee2:	2302      	movs	r3, #2
 8001ee4:	f88d 300c 	strb.w	r3, [sp, #12]
 8001ee8:	a902      	add	r1, sp, #8
 8001eea:	2303      	movs	r3, #3
 8001eec:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001ef0:	f88d 300d 	strb.w	r3, [sp, #13]
 8001ef4:	f88d 400e 	strb.w	r4, [sp, #14]
 8001ef8:	f88d 400f 	strb.w	r4, [sp, #15]
 8001efc:	f000 fa61 	bl	80023c2 <GPIO_Init>
 8001f00:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001f04:	2109      	movs	r1, #9
 8001f06:	2207      	movs	r2, #7
 8001f08:	f000 faa9 	bl	800245e <GPIO_PinAFConfig>
 8001f0c:	2207      	movs	r2, #7
 8001f0e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001f12:	210a      	movs	r1, #10
 8001f14:	f000 faa3 	bl	800245e <GPIO_PinAFConfig>
 8001f18:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001f1c:	9304      	str	r3, [sp, #16]
 8001f1e:	4628      	mov	r0, r5
 8001f20:	230c      	movs	r3, #12
 8001f22:	a904      	add	r1, sp, #16
 8001f24:	9308      	str	r3, [sp, #32]
 8001f26:	9405      	str	r4, [sp, #20]
 8001f28:	9406      	str	r4, [sp, #24]
 8001f2a:	9407      	str	r4, [sp, #28]
 8001f2c:	9409      	str	r4, [sp, #36]	; 0x24
 8001f2e:	f7ff fedf 	bl	8001cf0 <USART_Init>
 8001f32:	4628      	mov	r0, r5
 8001f34:	2101      	movs	r1, #1
 8001f36:	f7ff ff3d 	bl	8001db4 <USART_Cmd>
 8001f3a:	2201      	movs	r2, #1
 8001f3c:	4628      	mov	r0, r5
 8001f3e:	490e      	ldr	r1, [pc, #56]	; (8001f78 <uart_init+0xc0>)
 8001f40:	f7ff ff48 	bl	8001dd4 <USART_ITConfig>
 8001f44:	2325      	movs	r3, #37	; 0x25
 8001f46:	f88d 4005 	strb.w	r4, [sp, #5]
 8001f4a:	f88d 4006 	strb.w	r4, [sp, #6]
 8001f4e:	a801      	add	r0, sp, #4
 8001f50:	2401      	movs	r4, #1
 8001f52:	f88d 3004 	strb.w	r3, [sp, #4]
 8001f56:	f88d 4007 	strb.w	r4, [sp, #7]
 8001f5a:	f000 f9ed 	bl	8002338 <NVIC_Init>
 8001f5e:	4628      	mov	r0, r5
 8001f60:	4621      	mov	r1, r4
 8001f62:	f7ff ff27 	bl	8001db4 <USART_Cmd>
 8001f66:	b00b      	add	sp, #44	; 0x2c
 8001f68:	bd30      	pop	{r4, r5, pc}
 8001f6a:	bf00      	nop
 8001f6c:	20000ef4 	.word	0x20000ef4
 8001f70:	40013800 	.word	0x40013800
 8001f74:	20000ef8 	.word	0x20000ef8
 8001f78:	00050105 	.word	0x00050105

08001f7c <USART1_IRQHandler>:
 8001f7c:	b508      	push	{r3, lr}
 8001f7e:	480d      	ldr	r0, [pc, #52]	; (8001fb4 <USART1_IRQHandler+0x38>)
 8001f80:	490d      	ldr	r1, [pc, #52]	; (8001fb8 <USART1_IRQHandler+0x3c>)
 8001f82:	f7ff ff40 	bl	8001e06 <USART_GetITStatus>
 8001f86:	b178      	cbz	r0, 8001fa8 <USART1_IRQHandler+0x2c>
 8001f88:	480a      	ldr	r0, [pc, #40]	; (8001fb4 <USART1_IRQHandler+0x38>)
 8001f8a:	f7ff ff1e 	bl	8001dca <USART_ReceiveData>
 8001f8e:	4b0b      	ldr	r3, [pc, #44]	; (8001fbc <USART1_IRQHandler+0x40>)
 8001f90:	490b      	ldr	r1, [pc, #44]	; (8001fc0 <USART1_IRQHandler+0x44>)
 8001f92:	681a      	ldr	r2, [r3, #0]
 8001f94:	b2c0      	uxtb	r0, r0
 8001f96:	5488      	strb	r0, [r1, r2]
 8001f98:	681a      	ldr	r2, [r3, #0]
 8001f9a:	3201      	adds	r2, #1
 8001f9c:	601a      	str	r2, [r3, #0]
 8001f9e:	681a      	ldr	r2, [r3, #0]
 8001fa0:	2a0f      	cmp	r2, #15
 8001fa2:	bf84      	itt	hi
 8001fa4:	2200      	movhi	r2, #0
 8001fa6:	601a      	strhi	r2, [r3, #0]
 8001fa8:	4802      	ldr	r0, [pc, #8]	; (8001fb4 <USART1_IRQHandler+0x38>)
 8001faa:	4903      	ldr	r1, [pc, #12]	; (8001fb8 <USART1_IRQHandler+0x3c>)
 8001fac:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001fb0:	f7ff bf48 	b.w	8001e44 <USART_ClearITPendingBit>
 8001fb4:	40013800 	.word	0x40013800
 8001fb8:	00050105 	.word	0x00050105
 8001fbc:	20000ef4 	.word	0x20000ef4
 8001fc0:	20000ee4 	.word	0x20000ee4

08001fc4 <uart_clear_buffer>:
 8001fc4:	b672      	cpsid	i
 8001fc6:	2300      	movs	r3, #0
 8001fc8:	4a03      	ldr	r2, [pc, #12]	; (8001fd8 <uart_clear_buffer+0x14>)
 8001fca:	2100      	movs	r1, #0
 8001fcc:	54d1      	strb	r1, [r2, r3]
 8001fce:	3301      	adds	r3, #1
 8001fd0:	2b10      	cmp	r3, #16
 8001fd2:	d1f9      	bne.n	8001fc8 <uart_clear_buffer+0x4>
 8001fd4:	b662      	cpsie	i
 8001fd6:	4770      	bx	lr
 8001fd8:	20000ee4 	.word	0x20000ee4

08001fdc <i2c_delay>:
 8001fdc:	230b      	movs	r3, #11
 8001fde:	3b01      	subs	r3, #1
 8001fe0:	d001      	beq.n	8001fe6 <i2c_delay+0xa>
 8001fe2:	bf00      	nop
 8001fe4:	e7fb      	b.n	8001fde <i2c_delay+0x2>
 8001fe6:	4770      	bx	lr

08001fe8 <SetLowSDA>:
 8001fe8:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001fea:	4d0d      	ldr	r5, [pc, #52]	; (8002020 <SetLowSDA+0x38>)
 8001fec:	2301      	movs	r3, #1
 8001fee:	2203      	movs	r2, #3
 8001ff0:	2480      	movs	r4, #128	; 0x80
 8001ff2:	f88d 3004 	strb.w	r3, [sp, #4]
 8001ff6:	f88d 3006 	strb.w	r3, [sp, #6]
 8001ffa:	4628      	mov	r0, r5
 8001ffc:	2300      	movs	r3, #0
 8001ffe:	4669      	mov	r1, sp
 8002000:	f88d 2005 	strb.w	r2, [sp, #5]
 8002004:	f88d 3007 	strb.w	r3, [sp, #7]
 8002008:	9400      	str	r4, [sp, #0]
 800200a:	f000 f9da 	bl	80023c2 <GPIO_Init>
 800200e:	4628      	mov	r0, r5
 8002010:	4621      	mov	r1, r4
 8002012:	f000 fa20 	bl	8002456 <GPIO_ResetBits>
 8002016:	f7ff ffe1 	bl	8001fdc <i2c_delay>
 800201a:	b003      	add	sp, #12
 800201c:	bd30      	pop	{r4, r5, pc}
 800201e:	bf00      	nop
 8002020:	48000400 	.word	0x48000400

08002024 <SetHighSDA>:
 8002024:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8002026:	4d0d      	ldr	r5, [pc, #52]	; (800205c <SetHighSDA+0x38>)
 8002028:	2203      	movs	r2, #3
 800202a:	2300      	movs	r3, #0
 800202c:	2480      	movs	r4, #128	; 0x80
 800202e:	f88d 2005 	strb.w	r2, [sp, #5]
 8002032:	4628      	mov	r0, r5
 8002034:	2201      	movs	r2, #1
 8002036:	4669      	mov	r1, sp
 8002038:	f88d 3004 	strb.w	r3, [sp, #4]
 800203c:	f88d 2006 	strb.w	r2, [sp, #6]
 8002040:	f88d 3007 	strb.w	r3, [sp, #7]
 8002044:	9400      	str	r4, [sp, #0]
 8002046:	f000 f9bc 	bl	80023c2 <GPIO_Init>
 800204a:	4628      	mov	r0, r5
 800204c:	4621      	mov	r1, r4
 800204e:	f000 f9fe 	bl	800244e <GPIO_SetBits>
 8002052:	f7ff ffc3 	bl	8001fdc <i2c_delay>
 8002056:	b003      	add	sp, #12
 8002058:	bd30      	pop	{r4, r5, pc}
 800205a:	bf00      	nop
 800205c:	48000400 	.word	0x48000400

08002060 <SetLowSCL>:
 8002060:	b508      	push	{r3, lr}
 8002062:	4804      	ldr	r0, [pc, #16]	; (8002074 <SetLowSCL+0x14>)
 8002064:	2140      	movs	r1, #64	; 0x40
 8002066:	f000 f9f6 	bl	8002456 <GPIO_ResetBits>
 800206a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800206e:	f7ff bfb5 	b.w	8001fdc <i2c_delay>
 8002072:	bf00      	nop
 8002074:	48000400 	.word	0x48000400

08002078 <SetHighSCL>:
 8002078:	b508      	push	{r3, lr}
 800207a:	4804      	ldr	r0, [pc, #16]	; (800208c <SetHighSCL+0x14>)
 800207c:	2140      	movs	r1, #64	; 0x40
 800207e:	f000 f9e6 	bl	800244e <GPIO_SetBits>
 8002082:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8002086:	f7ff bfa9 	b.w	8001fdc <i2c_delay>
 800208a:	bf00      	nop
 800208c:	48000400 	.word	0x48000400

08002090 <i2c_0_init>:
 8002090:	b507      	push	{r0, r1, r2, lr}
 8002092:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8002096:	2101      	movs	r1, #1
 8002098:	f7ff fcde 	bl	8001a58 <RCC_AHBPeriphClockCmd>
 800209c:	23c0      	movs	r3, #192	; 0xc0
 800209e:	9300      	str	r3, [sp, #0]
 80020a0:	2301      	movs	r3, #1
 80020a2:	2203      	movs	r2, #3
 80020a4:	480a      	ldr	r0, [pc, #40]	; (80020d0 <i2c_0_init+0x40>)
 80020a6:	f88d 3004 	strb.w	r3, [sp, #4]
 80020aa:	4669      	mov	r1, sp
 80020ac:	f88d 3006 	strb.w	r3, [sp, #6]
 80020b0:	2300      	movs	r3, #0
 80020b2:	f88d 2005 	strb.w	r2, [sp, #5]
 80020b6:	f88d 3007 	strb.w	r3, [sp, #7]
 80020ba:	f000 f982 	bl	80023c2 <GPIO_Init>
 80020be:	f7ff ffdb 	bl	8002078 <SetHighSCL>
 80020c2:	f7ff ff91 	bl	8001fe8 <SetLowSDA>
 80020c6:	f7ff ffad 	bl	8002024 <SetHighSDA>
 80020ca:	b003      	add	sp, #12
 80020cc:	f85d fb04 	ldr.w	pc, [sp], #4
 80020d0:	48000400 	.word	0x48000400

080020d4 <i2cStart>:
 80020d4:	b508      	push	{r3, lr}
 80020d6:	f7ff ffcf 	bl	8002078 <SetHighSCL>
 80020da:	f7ff ffa3 	bl	8002024 <SetHighSDA>
 80020de:	f7ff ffcb 	bl	8002078 <SetHighSCL>
 80020e2:	f7ff ff81 	bl	8001fe8 <SetLowSDA>
 80020e6:	f7ff ffbb 	bl	8002060 <SetLowSCL>
 80020ea:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80020ee:	f7ff bf99 	b.w	8002024 <SetHighSDA>

080020f2 <i2cStop>:
 80020f2:	b508      	push	{r3, lr}
 80020f4:	f7ff ffb4 	bl	8002060 <SetLowSCL>
 80020f8:	f7ff ff76 	bl	8001fe8 <SetLowSDA>
 80020fc:	f7ff ffbc 	bl	8002078 <SetHighSCL>
 8002100:	f7ff ff72 	bl	8001fe8 <SetLowSDA>
 8002104:	f7ff ffb8 	bl	8002078 <SetHighSCL>
 8002108:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800210c:	f7ff bf8a 	b.w	8002024 <SetHighSDA>

08002110 <i2cWrite>:
 8002110:	b538      	push	{r3, r4, r5, lr}
 8002112:	4604      	mov	r4, r0
 8002114:	2508      	movs	r5, #8
 8002116:	f7ff ffa3 	bl	8002060 <SetLowSCL>
 800211a:	0623      	lsls	r3, r4, #24
 800211c:	d502      	bpl.n	8002124 <i2cWrite+0x14>
 800211e:	f7ff ff81 	bl	8002024 <SetHighSDA>
 8002122:	e001      	b.n	8002128 <i2cWrite+0x18>
 8002124:	f7ff ff60 	bl	8001fe8 <SetLowSDA>
 8002128:	3d01      	subs	r5, #1
 800212a:	f7ff ffa5 	bl	8002078 <SetHighSCL>
 800212e:	0064      	lsls	r4, r4, #1
 8002130:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8002134:	b2e4      	uxtb	r4, r4
 8002136:	d1ee      	bne.n	8002116 <i2cWrite+0x6>
 8002138:	f7ff ff92 	bl	8002060 <SetLowSCL>
 800213c:	f7ff ff72 	bl	8002024 <SetHighSDA>
 8002140:	f7ff ff9a 	bl	8002078 <SetHighSCL>
 8002144:	4b05      	ldr	r3, [pc, #20]	; (800215c <i2cWrite+0x4c>)
 8002146:	8a1c      	ldrh	r4, [r3, #16]
 8002148:	b2a4      	uxth	r4, r4
 800214a:	f7ff ff89 	bl	8002060 <SetLowSCL>
 800214e:	f7ff ff45 	bl	8001fdc <i2c_delay>
 8002152:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 8002156:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 800215a:	bd38      	pop	{r3, r4, r5, pc}
 800215c:	48000400 	.word	0x48000400

08002160 <i2cRead>:
 8002160:	b570      	push	{r4, r5, r6, lr}
 8002162:	4606      	mov	r6, r0
 8002164:	f7ff ff7c 	bl	8002060 <SetLowSCL>
 8002168:	f7ff ff5c 	bl	8002024 <SetHighSDA>
 800216c:	2508      	movs	r5, #8
 800216e:	2400      	movs	r4, #0
 8002170:	f7ff ff82 	bl	8002078 <SetHighSCL>
 8002174:	4b0d      	ldr	r3, [pc, #52]	; (80021ac <i2cRead+0x4c>)
 8002176:	8a1b      	ldrh	r3, [r3, #16]
 8002178:	0064      	lsls	r4, r4, #1
 800217a:	061a      	lsls	r2, r3, #24
 800217c:	b2e4      	uxtb	r4, r4
 800217e:	bf48      	it	mi
 8002180:	3401      	addmi	r4, #1
 8002182:	f105 35ff 	add.w	r5, r5, #4294967295
 8002186:	bf48      	it	mi
 8002188:	b2e4      	uxtbmi	r4, r4
 800218a:	f7ff ff69 	bl	8002060 <SetLowSCL>
 800218e:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8002192:	d1ed      	bne.n	8002170 <i2cRead+0x10>
 8002194:	b10e      	cbz	r6, 800219a <i2cRead+0x3a>
 8002196:	f7ff ff27 	bl	8001fe8 <SetLowSDA>
 800219a:	f7ff ff6d 	bl	8002078 <SetHighSCL>
 800219e:	f7ff ff5f 	bl	8002060 <SetLowSCL>
 80021a2:	f7ff ff1b 	bl	8001fdc <i2c_delay>
 80021a6:	4620      	mov	r0, r4
 80021a8:	bd70      	pop	{r4, r5, r6, pc}
 80021aa:	bf00      	nop
 80021ac:	48000400 	.word	0x48000400

080021b0 <i2c_write_reg>:
 80021b0:	b570      	push	{r4, r5, r6, lr}
 80021b2:	4605      	mov	r5, r0
 80021b4:	460c      	mov	r4, r1
 80021b6:	4616      	mov	r6, r2
 80021b8:	f7ff ff8c 	bl	80020d4 <i2cStart>
 80021bc:	4628      	mov	r0, r5
 80021be:	f7ff ffa7 	bl	8002110 <i2cWrite>
 80021c2:	4620      	mov	r0, r4
 80021c4:	f7ff ffa4 	bl	8002110 <i2cWrite>
 80021c8:	4630      	mov	r0, r6
 80021ca:	f7ff ffa1 	bl	8002110 <i2cWrite>
 80021ce:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80021d2:	f7ff bf8e 	b.w	80020f2 <i2cStop>

080021d6 <i2c_read_reg>:
 80021d6:	b538      	push	{r3, r4, r5, lr}
 80021d8:	4604      	mov	r4, r0
 80021da:	460d      	mov	r5, r1
 80021dc:	f7ff ff7a 	bl	80020d4 <i2cStart>
 80021e0:	4620      	mov	r0, r4
 80021e2:	f7ff ff95 	bl	8002110 <i2cWrite>
 80021e6:	4628      	mov	r0, r5
 80021e8:	f7ff ff92 	bl	8002110 <i2cWrite>
 80021ec:	f7ff ff72 	bl	80020d4 <i2cStart>
 80021f0:	f044 0001 	orr.w	r0, r4, #1
 80021f4:	f7ff ff8c 	bl	8002110 <i2cWrite>
 80021f8:	2000      	movs	r0, #0
 80021fa:	f7ff ffb1 	bl	8002160 <i2cRead>
 80021fe:	4604      	mov	r4, r0
 8002200:	f7ff ff77 	bl	80020f2 <i2cStop>
 8002204:	4620      	mov	r0, r4
 8002206:	bd38      	pop	{r3, r4, r5, pc}

08002208 <SystemInit>:
 8002208:	4b3b      	ldr	r3, [pc, #236]	; (80022f8 <SystemInit+0xf0>)
 800220a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800220e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8002212:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8002216:	4b39      	ldr	r3, [pc, #228]	; (80022fc <SystemInit+0xf4>)
 8002218:	681a      	ldr	r2, [r3, #0]
 800221a:	f042 0201 	orr.w	r2, r2, #1
 800221e:	601a      	str	r2, [r3, #0]
 8002220:	6859      	ldr	r1, [r3, #4]
 8002222:	4a37      	ldr	r2, [pc, #220]	; (8002300 <SystemInit+0xf8>)
 8002224:	400a      	ands	r2, r1
 8002226:	605a      	str	r2, [r3, #4]
 8002228:	681a      	ldr	r2, [r3, #0]
 800222a:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 800222e:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8002232:	601a      	str	r2, [r3, #0]
 8002234:	681a      	ldr	r2, [r3, #0]
 8002236:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 800223a:	601a      	str	r2, [r3, #0]
 800223c:	685a      	ldr	r2, [r3, #4]
 800223e:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8002242:	605a      	str	r2, [r3, #4]
 8002244:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8002246:	f022 020f 	bic.w	r2, r2, #15
 800224a:	62da      	str	r2, [r3, #44]	; 0x2c
 800224c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800224e:	4a2d      	ldr	r2, [pc, #180]	; (8002304 <SystemInit+0xfc>)
 8002250:	b082      	sub	sp, #8
 8002252:	400a      	ands	r2, r1
 8002254:	631a      	str	r2, [r3, #48]	; 0x30
 8002256:	2200      	movs	r2, #0
 8002258:	609a      	str	r2, [r3, #8]
 800225a:	9200      	str	r2, [sp, #0]
 800225c:	9201      	str	r2, [sp, #4]
 800225e:	681a      	ldr	r2, [r3, #0]
 8002260:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8002264:	601a      	str	r2, [r3, #0]
 8002266:	4b25      	ldr	r3, [pc, #148]	; (80022fc <SystemInit+0xf4>)
 8002268:	681a      	ldr	r2, [r3, #0]
 800226a:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 800226e:	9201      	str	r2, [sp, #4]
 8002270:	9a00      	ldr	r2, [sp, #0]
 8002272:	3201      	adds	r2, #1
 8002274:	9200      	str	r2, [sp, #0]
 8002276:	9a01      	ldr	r2, [sp, #4]
 8002278:	b91a      	cbnz	r2, 8002282 <SystemInit+0x7a>
 800227a:	9a00      	ldr	r2, [sp, #0]
 800227c:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8002280:	d1f1      	bne.n	8002266 <SystemInit+0x5e>
 8002282:	681b      	ldr	r3, [r3, #0]
 8002284:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8002288:	bf18      	it	ne
 800228a:	2301      	movne	r3, #1
 800228c:	9301      	str	r3, [sp, #4]
 800228e:	9b01      	ldr	r3, [sp, #4]
 8002290:	2b01      	cmp	r3, #1
 8002292:	d005      	beq.n	80022a0 <SystemInit+0x98>
 8002294:	4b18      	ldr	r3, [pc, #96]	; (80022f8 <SystemInit+0xf0>)
 8002296:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 800229a:	609a      	str	r2, [r3, #8]
 800229c:	b002      	add	sp, #8
 800229e:	4770      	bx	lr
 80022a0:	4b19      	ldr	r3, [pc, #100]	; (8002308 <SystemInit+0x100>)
 80022a2:	2212      	movs	r2, #18
 80022a4:	601a      	str	r2, [r3, #0]
 80022a6:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 80022aa:	685a      	ldr	r2, [r3, #4]
 80022ac:	605a      	str	r2, [r3, #4]
 80022ae:	685a      	ldr	r2, [r3, #4]
 80022b0:	605a      	str	r2, [r3, #4]
 80022b2:	685a      	ldr	r2, [r3, #4]
 80022b4:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 80022b8:	605a      	str	r2, [r3, #4]
 80022ba:	685a      	ldr	r2, [r3, #4]
 80022bc:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 80022c0:	605a      	str	r2, [r3, #4]
 80022c2:	685a      	ldr	r2, [r3, #4]
 80022c4:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 80022c8:	605a      	str	r2, [r3, #4]
 80022ca:	681a      	ldr	r2, [r3, #0]
 80022cc:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 80022d0:	601a      	str	r2, [r3, #0]
 80022d2:	6819      	ldr	r1, [r3, #0]
 80022d4:	4a09      	ldr	r2, [pc, #36]	; (80022fc <SystemInit+0xf4>)
 80022d6:	0189      	lsls	r1, r1, #6
 80022d8:	d5fb      	bpl.n	80022d2 <SystemInit+0xca>
 80022da:	6853      	ldr	r3, [r2, #4]
 80022dc:	f023 0303 	bic.w	r3, r3, #3
 80022e0:	6053      	str	r3, [r2, #4]
 80022e2:	6853      	ldr	r3, [r2, #4]
 80022e4:	f043 0302 	orr.w	r3, r3, #2
 80022e8:	6053      	str	r3, [r2, #4]
 80022ea:	4b04      	ldr	r3, [pc, #16]	; (80022fc <SystemInit+0xf4>)
 80022ec:	685b      	ldr	r3, [r3, #4]
 80022ee:	f003 030c 	and.w	r3, r3, #12
 80022f2:	2b08      	cmp	r3, #8
 80022f4:	d1f9      	bne.n	80022ea <SystemInit+0xe2>
 80022f6:	e7cd      	b.n	8002294 <SystemInit+0x8c>
 80022f8:	e000ed00 	.word	0xe000ed00
 80022fc:	40021000 	.word	0x40021000
 8002300:	f87fc00c 	.word	0xf87fc00c
 8002304:	ff00fccc 	.word	0xff00fccc
 8002308:	40022000 	.word	0x40022000

0800230c <sys_tick_init>:
 800230c:	4b05      	ldr	r3, [pc, #20]	; (8002324 <sys_tick_init+0x18>)
 800230e:	4a06      	ldr	r2, [pc, #24]	; (8002328 <sys_tick_init+0x1c>)
 8002310:	605a      	str	r2, [r3, #4]
 8002312:	4a06      	ldr	r2, [pc, #24]	; (800232c <sys_tick_init+0x20>)
 8002314:	21f0      	movs	r1, #240	; 0xf0
 8002316:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 800231a:	2200      	movs	r2, #0
 800231c:	609a      	str	r2, [r3, #8]
 800231e:	2207      	movs	r2, #7
 8002320:	601a      	str	r2, [r3, #0]
 8002322:	4770      	bx	lr
 8002324:	e000e010 	.word	0xe000e010
 8002328:	00029040 	.word	0x00029040
 800232c:	e000ed00 	.word	0xe000ed00

08002330 <sleep>:
 8002330:	bf30      	wfi
 8002332:	4770      	bx	lr

08002334 <sytem_clock_init>:
 8002334:	f7ff bf68 	b.w	8002208 <SystemInit>

08002338 <NVIC_Init>:
 8002338:	b510      	push	{r4, lr}
 800233a:	bf00      	nop
 800233c:	bf00      	nop
 800233e:	bf00      	nop
 8002340:	78c2      	ldrb	r2, [r0, #3]
 8002342:	7803      	ldrb	r3, [r0, #0]
 8002344:	b30a      	cbz	r2, 800238a <NVIC_Init+0x52>
 8002346:	4a16      	ldr	r2, [pc, #88]	; (80023a0 <NVIC_Init+0x68>)
 8002348:	7844      	ldrb	r4, [r0, #1]
 800234a:	68d2      	ldr	r2, [r2, #12]
 800234c:	43d2      	mvns	r2, r2
 800234e:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8002352:	f1c2 0104 	rsb	r1, r2, #4
 8002356:	b2c9      	uxtb	r1, r1
 8002358:	fa04 f101 	lsl.w	r1, r4, r1
 800235c:	240f      	movs	r4, #15
 800235e:	fa44 f202 	asr.w	r2, r4, r2
 8002362:	7884      	ldrb	r4, [r0, #2]
 8002364:	b2c9      	uxtb	r1, r1
 8002366:	4022      	ands	r2, r4
 8002368:	430a      	orrs	r2, r1
 800236a:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 800236e:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8002372:	0112      	lsls	r2, r2, #4
 8002374:	b2d2      	uxtb	r2, r2
 8002376:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 800237a:	7803      	ldrb	r3, [r0, #0]
 800237c:	2201      	movs	r2, #1
 800237e:	0959      	lsrs	r1, r3, #5
 8002380:	f003 031f 	and.w	r3, r3, #31
 8002384:	fa02 f303 	lsl.w	r3, r2, r3
 8002388:	e006      	b.n	8002398 <NVIC_Init+0x60>
 800238a:	0959      	lsrs	r1, r3, #5
 800238c:	2201      	movs	r2, #1
 800238e:	f003 031f 	and.w	r3, r3, #31
 8002392:	fa02 f303 	lsl.w	r3, r2, r3
 8002396:	3120      	adds	r1, #32
 8002398:	4a02      	ldr	r2, [pc, #8]	; (80023a4 <NVIC_Init+0x6c>)
 800239a:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 800239e:	bd10      	pop	{r4, pc}
 80023a0:	e000ed00 	.word	0xe000ed00
 80023a4:	e000e100 	.word	0xe000e100

080023a8 <lib_low_level_init>:
 80023a8:	b508      	push	{r3, lr}
 80023aa:	f7ff ffc3 	bl	8002334 <sytem_clock_init>
 80023ae:	f000 f899 	bl	80024e4 <gpio_init>
 80023b2:	f7ff fd81 	bl	8001eb8 <uart_init>
 80023b6:	f7ff fbdd 	bl	8001b74 <timer_init>
 80023ba:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80023be:	f7ff be67 	b.w	8002090 <i2c_0_init>

080023c2 <GPIO_Init>:
 80023c2:	b5f0      	push	{r4, r5, r6, r7, lr}
 80023c4:	bf00      	nop
 80023c6:	bf00      	nop
 80023c8:	bf00      	nop
 80023ca:	bf00      	nop
 80023cc:	2300      	movs	r3, #0
 80023ce:	680e      	ldr	r6, [r1, #0]
 80023d0:	461a      	mov	r2, r3
 80023d2:	2501      	movs	r5, #1
 80023d4:	4095      	lsls	r5, r2
 80023d6:	ea05 0406 	and.w	r4, r5, r6
 80023da:	42ac      	cmp	r4, r5
 80023dc:	d131      	bne.n	8002442 <GPIO_Init+0x80>
 80023de:	790d      	ldrb	r5, [r1, #4]
 80023e0:	1e6f      	subs	r7, r5, #1
 80023e2:	b2ff      	uxtb	r7, r7
 80023e4:	2f01      	cmp	r7, #1
 80023e6:	d81c      	bhi.n	8002422 <GPIO_Init+0x60>
 80023e8:	bf00      	nop
 80023ea:	f04f 0c03 	mov.w	ip, #3
 80023ee:	6887      	ldr	r7, [r0, #8]
 80023f0:	fa0c fc03 	lsl.w	ip, ip, r3
 80023f4:	ea27 070c 	bic.w	r7, r7, ip
 80023f8:	6087      	str	r7, [r0, #8]
 80023fa:	f891 c005 	ldrb.w	ip, [r1, #5]
 80023fe:	6887      	ldr	r7, [r0, #8]
 8002400:	fa0c fc03 	lsl.w	ip, ip, r3
 8002404:	ea4c 0707 	orr.w	r7, ip, r7
 8002408:	6087      	str	r7, [r0, #8]
 800240a:	bf00      	nop
 800240c:	8887      	ldrh	r7, [r0, #4]
 800240e:	b2bf      	uxth	r7, r7
 8002410:	ea27 0404 	bic.w	r4, r7, r4
 8002414:	8084      	strh	r4, [r0, #4]
 8002416:	798c      	ldrb	r4, [r1, #6]
 8002418:	8887      	ldrh	r7, [r0, #4]
 800241a:	4094      	lsls	r4, r2
 800241c:	433c      	orrs	r4, r7
 800241e:	b2a4      	uxth	r4, r4
 8002420:	8084      	strh	r4, [r0, #4]
 8002422:	2403      	movs	r4, #3
 8002424:	6807      	ldr	r7, [r0, #0]
 8002426:	409c      	lsls	r4, r3
 8002428:	43e4      	mvns	r4, r4
 800242a:	4027      	ands	r7, r4
 800242c:	6007      	str	r7, [r0, #0]
 800242e:	6807      	ldr	r7, [r0, #0]
 8002430:	409d      	lsls	r5, r3
 8002432:	433d      	orrs	r5, r7
 8002434:	6005      	str	r5, [r0, #0]
 8002436:	68c5      	ldr	r5, [r0, #12]
 8002438:	402c      	ands	r4, r5
 800243a:	79cd      	ldrb	r5, [r1, #7]
 800243c:	409d      	lsls	r5, r3
 800243e:	432c      	orrs	r4, r5
 8002440:	60c4      	str	r4, [r0, #12]
 8002442:	3201      	adds	r2, #1
 8002444:	2a10      	cmp	r2, #16
 8002446:	f103 0302 	add.w	r3, r3, #2
 800244a:	d1c2      	bne.n	80023d2 <GPIO_Init+0x10>
 800244c:	bdf0      	pop	{r4, r5, r6, r7, pc}

0800244e <GPIO_SetBits>:
 800244e:	bf00      	nop
 8002450:	bf00      	nop
 8002452:	6181      	str	r1, [r0, #24]
 8002454:	4770      	bx	lr

08002456 <GPIO_ResetBits>:
 8002456:	bf00      	nop
 8002458:	bf00      	nop
 800245a:	8501      	strh	r1, [r0, #40]	; 0x28
 800245c:	4770      	bx	lr

0800245e <GPIO_PinAFConfig>:
 800245e:	b510      	push	{r4, lr}
 8002460:	bf00      	nop
 8002462:	bf00      	nop
 8002464:	bf00      	nop
 8002466:	f001 0307 	and.w	r3, r1, #7
 800246a:	08c9      	lsrs	r1, r1, #3
 800246c:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8002470:	009b      	lsls	r3, r3, #2
 8002472:	6a04      	ldr	r4, [r0, #32]
 8002474:	210f      	movs	r1, #15
 8002476:	4099      	lsls	r1, r3
 8002478:	ea24 0101 	bic.w	r1, r4, r1
 800247c:	6201      	str	r1, [r0, #32]
 800247e:	6a01      	ldr	r1, [r0, #32]
 8002480:	fa02 f303 	lsl.w	r3, r2, r3
 8002484:	430b      	orrs	r3, r1
 8002486:	6203      	str	r3, [r0, #32]
 8002488:	bd10      	pop	{r4, pc}
	...

0800248c <led_on>:
 800248c:	0401      	lsls	r1, r0, #16
 800248e:	d503      	bpl.n	8002498 <led_on+0xc>
 8002490:	4b08      	ldr	r3, [pc, #32]	; (80024b4 <led_on+0x28>)
 8002492:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8002496:	619a      	str	r2, [r3, #24]
 8002498:	0702      	lsls	r2, r0, #28
 800249a:	d503      	bpl.n	80024a4 <led_on+0x18>
 800249c:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80024a0:	2208      	movs	r2, #8
 80024a2:	851a      	strh	r2, [r3, #40]	; 0x28
 80024a4:	07c3      	lsls	r3, r0, #31
 80024a6:	d503      	bpl.n	80024b0 <led_on+0x24>
 80024a8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80024ac:	2201      	movs	r2, #1
 80024ae:	619a      	str	r2, [r3, #24]
 80024b0:	4770      	bx	lr
 80024b2:	bf00      	nop
 80024b4:	48000400 	.word	0x48000400

080024b8 <led_off>:
 80024b8:	0402      	lsls	r2, r0, #16
 80024ba:	d503      	bpl.n	80024c4 <led_off+0xc>
 80024bc:	4b08      	ldr	r3, [pc, #32]	; (80024e0 <led_off+0x28>)
 80024be:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80024c2:	851a      	strh	r2, [r3, #40]	; 0x28
 80024c4:	0703      	lsls	r3, r0, #28
 80024c6:	d503      	bpl.n	80024d0 <led_off+0x18>
 80024c8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80024cc:	2208      	movs	r2, #8
 80024ce:	619a      	str	r2, [r3, #24]
 80024d0:	07c0      	lsls	r0, r0, #31
 80024d2:	d503      	bpl.n	80024dc <led_off+0x24>
 80024d4:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80024d8:	2201      	movs	r2, #1
 80024da:	851a      	strh	r2, [r3, #40]	; 0x28
 80024dc:	4770      	bx	lr
 80024de:	bf00      	nop
 80024e0:	48000400 	.word	0x48000400

080024e4 <gpio_init>:
 80024e4:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
 80024e8:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80024ec:	2101      	movs	r1, #1
 80024ee:	f7ff fab3 	bl	8001a58 <RCC_AHBPeriphClockCmd>
 80024f2:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 80024f6:	2101      	movs	r1, #1
 80024f8:	f7ff faae 	bl	8001a58 <RCC_AHBPeriphClockCmd>
 80024fc:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 8002500:	2101      	movs	r1, #1
 8002502:	f7ff faa9 	bl	8001a58 <RCC_AHBPeriphClockCmd>
 8002506:	2400      	movs	r4, #0
 8002508:	2501      	movs	r5, #1
 800250a:	2603      	movs	r6, #3
 800250c:	f44f 4800 	mov.w	r8, #32768	; 0x8000
 8002510:	4826      	ldr	r0, [pc, #152]	; (80025ac <gpio_init+0xc8>)
 8002512:	f8cd 8000 	str.w	r8, [sp]
 8002516:	4669      	mov	r1, sp
 8002518:	2708      	movs	r7, #8
 800251a:	f88d 5004 	strb.w	r5, [sp, #4]
 800251e:	f88d 4006 	strb.w	r4, [sp, #6]
 8002522:	f88d 6005 	strb.w	r6, [sp, #5]
 8002526:	f88d 4007 	strb.w	r4, [sp, #7]
 800252a:	f7ff ff4a 	bl	80023c2 <GPIO_Init>
 800252e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8002532:	4669      	mov	r1, sp
 8002534:	9700      	str	r7, [sp, #0]
 8002536:	f88d 5004 	strb.w	r5, [sp, #4]
 800253a:	f88d 4006 	strb.w	r4, [sp, #6]
 800253e:	f88d 6005 	strb.w	r6, [sp, #5]
 8002542:	f88d 4007 	strb.w	r4, [sp, #7]
 8002546:	f7ff ff3c 	bl	80023c2 <GPIO_Init>
 800254a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800254e:	4669      	mov	r1, sp
 8002550:	9500      	str	r5, [sp, #0]
 8002552:	f88d 5004 	strb.w	r5, [sp, #4]
 8002556:	f88d 4006 	strb.w	r4, [sp, #6]
 800255a:	f88d 6005 	strb.w	r6, [sp, #5]
 800255e:	f88d 4007 	strb.w	r4, [sp, #7]
 8002562:	f7ff ff2e 	bl	80023c2 <GPIO_Init>
 8002566:	f44f 7300 	mov.w	r3, #512	; 0x200
 800256a:	4669      	mov	r1, sp
 800256c:	480f      	ldr	r0, [pc, #60]	; (80025ac <gpio_init+0xc8>)
 800256e:	9300      	str	r3, [sp, #0]
 8002570:	f88d 4004 	strb.w	r4, [sp, #4]
 8002574:	f88d 6005 	strb.w	r6, [sp, #5]
 8002578:	f88d 4007 	strb.w	r4, [sp, #7]
 800257c:	f7ff ff21 	bl	80023c2 <GPIO_Init>
 8002580:	4640      	mov	r0, r8
 8002582:	f7ff ff83 	bl	800248c <led_on>
 8002586:	4638      	mov	r0, r7
 8002588:	f7ff ff96 	bl	80024b8 <led_off>
 800258c:	4628      	mov	r0, r5
 800258e:	f7ff ff93 	bl	80024b8 <led_off>
 8002592:	f242 7311 	movw	r3, #10001	; 0x2711
 8002596:	3b01      	subs	r3, #1
 8002598:	d001      	beq.n	800259e <gpio_init+0xba>
 800259a:	bf00      	nop
 800259c:	e7fb      	b.n	8002596 <gpio_init+0xb2>
 800259e:	2001      	movs	r0, #1
 80025a0:	f7ff ff74 	bl	800248c <led_on>
 80025a4:	b002      	add	sp, #8
 80025a6:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80025aa:	bf00      	nop
 80025ac:	48000400 	.word	0x48000400

080025b0 <get_key>:
 80025b0:	4b02      	ldr	r3, [pc, #8]	; (80025bc <get_key+0xc>)
 80025b2:	8a18      	ldrh	r0, [r3, #16]
 80025b4:	43c0      	mvns	r0, r0
 80025b6:	f400 7000 	and.w	r0, r0, #512	; 0x200
 80025ba:	4770      	bx	lr
 80025bc:	48000400 	.word	0x48000400

080025c0 <Default_Handler>:
 80025c0:	4668      	mov	r0, sp
 80025c2:	f020 0107 	bic.w	r1, r0, #7
 80025c6:	468d      	mov	sp, r1
 80025c8:	bf00      	nop
 80025ca:	e7fd      	b.n	80025c8 <Default_Handler+0x8>

080025cc <HardFault_Handler>:
 80025cc:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80025d0:	f7ff ff5c 	bl	800248c <led_on>
 80025d4:	4b06      	ldr	r3, [pc, #24]	; (80025f0 <HardFault_Handler+0x24>)
 80025d6:	3b01      	subs	r3, #1
 80025d8:	d001      	beq.n	80025de <HardFault_Handler+0x12>
 80025da:	bf00      	nop
 80025dc:	e7fb      	b.n	80025d6 <HardFault_Handler+0xa>
 80025de:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80025e2:	f7ff ff69 	bl	80024b8 <led_off>
 80025e6:	4b02      	ldr	r3, [pc, #8]	; (80025f0 <HardFault_Handler+0x24>)
 80025e8:	3b01      	subs	r3, #1
 80025ea:	d0ef      	beq.n	80025cc <HardFault_Handler>
 80025ec:	bf00      	nop
 80025ee:	e7fb      	b.n	80025e8 <HardFault_Handler+0x1c>
 80025f0:	00989681 	.word	0x00989681

080025f4 <_reset_init>:
 80025f4:	4a0e      	ldr	r2, [pc, #56]	; (8002630 <_reset_init+0x3c>)
 80025f6:	480f      	ldr	r0, [pc, #60]	; (8002634 <_reset_init+0x40>)
 80025f8:	1a80      	subs	r0, r0, r2
 80025fa:	1080      	asrs	r0, r0, #2
 80025fc:	2300      	movs	r3, #0
 80025fe:	4283      	cmp	r3, r0
 8002600:	d006      	beq.n	8002610 <_reset_init+0x1c>
 8002602:	490d      	ldr	r1, [pc, #52]	; (8002638 <_reset_init+0x44>)
 8002604:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8002608:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 800260c:	3301      	adds	r3, #1
 800260e:	e7f6      	b.n	80025fe <_reset_init+0xa>
 8002610:	4b0a      	ldr	r3, [pc, #40]	; (800263c <_reset_init+0x48>)
 8002612:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8002616:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800261a:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800261e:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8002622:	685a      	ldr	r2, [r3, #4]
 8002624:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8002628:	605a      	str	r2, [r3, #4]
 800262a:	f7ff b875 	b.w	8001718 <main>
 800262e:	bf00      	nop
 8002630:	20000000 	.word	0x20000000
 8002634:	2000004c 	.word	0x2000004c
 8002638:	0800279c 	.word	0x0800279c
 800263c:	e000ed00 	.word	0xe000ed00

08002640 <_init>:
 8002640:	e1a0c00d 	mov	ip, sp
 8002644:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8002648:	e24cb004 	sub	fp, ip, #4
 800264c:	e24bd028 	sub	sp, fp, #40	; 0x28
 8002650:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8002654:	e12fff1e 	bx	lr

08002658 <_fini>:
 8002658:	e1a0c00d 	mov	ip, sp
 800265c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8002660:	e24cb004 	sub	fp, ip, #4
 8002664:	e24bd028 	sub	sp, fp, #40	; 0x28
 8002668:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 800266c:	e12fff1e 	bx	lr
 8002670:	69647473 	.word	0x69647473
 8002674:	6e69206f 	.word	0x6e69206f
 8002678:	64207469 	.word	0x64207469
 800267c:	0a656e6f 	.word	0x0a656e6f
 8002680:	00          	.byte	0x00
 8002681:	41          	.byte	0x41
 8002682:	2b54      	.short	0x2b54
 8002684:	4d504943 	.word	0x4d504943
 8002688:	313d5855 	.word	0x313d5855
 800268c:	41000a0d 	.word	0x41000a0d
 8002690:	49432b54 	.word	0x49432b54
 8002694:	58554d50 	.word	0x58554d50
 8002698:	0a0d303d 	.word	0x0a0d303d
 800269c:	2b544100 	.word	0x2b544100
 80026a0:	4f4d5743 	.word	0x4f4d5743
 80026a4:	313d4544 	.word	0x313d4544
 80026a8:	41000a0d 	.word	0x41000a0d
 80026ac:	57432b54 	.word	0x57432b54
 80026b0:	3d50414a 	.word	0x3d50414a
 80026b4:	454e0022 	.word	0x454e0022
 80026b8:	41454754 	.word	0x41454754
 80026bc:	00333852 	.word	0x00333852
 80026c0:	6f6c656d 	.word	0x6f6c656d
 80026c4:	68636964 	.word	0x68636964
 80026c8:	356c6c69 	.word	0x356c6c69
 80026cc:	22003634 	.word	0x22003634
 80026d0:	41000a0d 	.word	0x41000a0d
 80026d4:	49432b54 	.word	0x49432b54
 80026d8:	52455350 	.word	0x52455350
 80026dc:	3d524556 	.word	0x3d524556
 80026e0:	30382c31 	.word	0x30382c31
 80026e4:	41000a0d 	.word	0x41000a0d
 80026e8:	49432b54 	.word	0x49432b54
 80026ec:	4f4c4350 	.word	0x4f4c4350
 80026f0:	0a0d4553 	.word	0x0a0d4553
 80026f4:	2b544100 	.word	0x2b544100
 80026f8:	53504943 	.word	0x53504943
 80026fc:	54524154 	.word	0x54524154
 8002700:	4354223d 	.word	0x4354223d
 8002704:	222c2250 	.word	0x222c2250
 8002708:	002c2200 	.word	0x002c2200
 800270c:	4e4e4f43 	.word	0x4e4e4f43
 8002710:	00544345 	.word	0x00544345
 8002714:	432b5441 	.word	0x432b5441
 8002718:	45535049 	.word	0x45535049
 800271c:	003d444e 	.word	0x003d444e
 8002720:	4553003e 	.word	0x4553003e
 8002724:	4f20444e 	.word	0x4f20444e
 8002728:	492b004b 	.word	0x492b004b
 800272c:	002c4450 	.word	0x002c4450
 8002730:	00000020 	.word	0x00000020
 8002734:	00000040 	.word	0x00000040
 8002738:	00000060 	.word	0x00000060
 800273c:	00000080 	.word	0x00000080
 8002740:	302e3031 	.word	0x302e3031
 8002744:	342e302e 	.word	0x342e302e
 8002748:	00          	.byte	0x00
 8002749:	65          	.byte	0x65
 800274a:	7272      	.short	0x7272
 800274c:	6320726f 	.word	0x6320726f
 8002750:	2065646f 	.word	0x2065646f
 8002754:	253a7525 	.word	0x253a7525
 8002758:	0a75      	.short	0x0a75
 800275a:	00          	.byte	0x00
 800275b:	0a          	.byte	0x0a
 800275c:	636c6577 	.word	0x636c6577
 8002760:	20656d6f 	.word	0x20656d6f
 8002764:	53206f74 	.word	0x53206f74
 8002768:	68757a75 	.word	0x68757a75
 800276c:	20534f61 	.word	0x20534f61
 8002770:	205e5f5e 	.word	0x205e5f5e
 8002774:	2e302e32 	.word	0x2e302e32
 8002778:	55420a36 	.word	0x55420a36
 800277c:	20444c49 	.word	0x20444c49
 8002780:	2079614d 	.word	0x2079614d
 8002784:	32203320 	.word	0x32203320
 8002788:	20363130 	.word	0x20363130
 800278c:	313a3331 	.word	0x313a3331
 8002790:	31333a34 	.word	0x31333a34
 8002794:	0000000a 	.word	0x0000000a

08002798 <__EH_FRAME_BEGIN__>:
 8002798:	00000000                                ....
