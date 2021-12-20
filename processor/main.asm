
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000037          	lui	zero,0x0

00000004 <__crt0_pointer_init>:
   4:	80020117          	auipc	sp,0x80020
   8:	ff810113          	addi	sp,sp,-8 # 8001fffc <__ctr0_io_space_begin+0x800201fc>
   c:	80000197          	auipc	gp,0x80000
  10:	7f418193          	addi	gp,gp,2036 # 80000800 <__ctr0_io_space_begin+0x80000a00>

00000014 <__crt0_cpu_csr_init>:
  14:	00000517          	auipc	a0,0x0
  18:	0e050513          	addi	a0,a0,224 # f4 <__crt0_dummy_trap_handler>
  1c:	30551073          	csrw	mtvec,a0
  20:	34151073          	csrw	mepc,a0
  24:	30001073          	csrw	mstatus,zero
  28:	30401073          	csrw	mie,zero
  2c:	30601073          	csrw	mcounteren,zero
  30:	55e9                	li	a1,-6
  32:	32059073          	csrw	mcountinhibit,a1
  36:	b0001073          	csrw	mcycle,zero
  3a:	b8001073          	csrw	mcycleh,zero
  3e:	b0201073          	csrw	minstret,zero
  42:	b8201073          	csrw	minstreth,zero

00000046 <__crt0_reg_file_clear>:
  46:	4081                	li	ra,0
  48:	4201                	li	tp,0
  4a:	4281                	li	t0,0
  4c:	4301                	li	t1,0
  4e:	4381                	li	t2,0
  50:	4701                	li	a4,0
  52:	4781                	li	a5,0
  54:	4801                	li	a6,0
  56:	4881                	li	a7,0
  58:	4901                	li	s2,0
  5a:	4981                	li	s3,0
  5c:	4a01                	li	s4,0
  5e:	4a81                	li	s5,0
  60:	4b01                	li	s6,0
  62:	4b81                	li	s7,0
  64:	4c01                	li	s8,0
  66:	4c81                	li	s9,0
  68:	4d01                	li	s10,0
  6a:	4d81                	li	s11,0
  6c:	4e01                	li	t3,0
  6e:	4e81                	li	t4,0
  70:	4f01                	li	t5,0
  72:	4f81                	li	t6,0

00000074 <__crt0_reset_io>:
  74:	00000417          	auipc	s0,0x0
  78:	d8c40413          	addi	s0,s0,-628 # fffffe00 <__ctr0_io_space_begin+0x0>
  7c:	00000497          	auipc	s1,0x0
  80:	f8448493          	addi	s1,s1,-124 # 0 <_start>

00000084 <__crt0_reset_io_loop>:
  84:	00042023          	sw	zero,0(s0)
  88:	0411                	addi	s0,s0,4
  8a:	fe941de3          	bne	s0,s1,84 <__crt0_reset_io_loop>

0000008e <__crt0_clear_bss>:
  8e:	80000597          	auipc	a1,0x80000
  92:	f7258593          	addi	a1,a1,-142 # 80000000 <__ctr0_io_space_begin+0x80000200>
  96:	80005617          	auipc	a2,0x80005
  9a:	ae260613          	addi	a2,a2,-1310 # 80004b78 <__ctr0_io_space_begin+0x80004d78>

0000009e <__crt0_clear_bss_loop>:
  9e:	00c5d663          	bge	a1,a2,aa <__crt0_clear_bss_loop_end>
  a2:	00058023          	sb	zero,0(a1)
  a6:	0585                	addi	a1,a1,1
  a8:	bfdd                	j	9e <__crt0_clear_bss_loop>

000000aa <__crt0_clear_bss_loop_end>:
  aa:	00013597          	auipc	a1,0x13
  ae:	7be58593          	addi	a1,a1,1982 # 13868 <__crt0_copy_data_src_begin>
  b2:	80000617          	auipc	a2,0x80000
  b6:	f4e60613          	addi	a2,a2,-178 # 80000000 <__ctr0_io_space_begin+0x80000200>
  ba:	80000697          	auipc	a3,0x80000
  be:	f4668693          	addi	a3,a3,-186 # 80000000 <__ctr0_io_space_begin+0x80000200>

000000c2 <__crt0_copy_data_loop>:
  c2:	00d65963          	bge	a2,a3,d4 <__crt0_copy_data_loop_end>
  c6:	00058703          	lb	a4,0(a1)
  ca:	00e60023          	sb	a4,0(a2)
  ce:	0585                	addi	a1,a1,1
  d0:	0605                	addi	a2,a2,1
  d2:	bfc5                	j	c2 <__crt0_copy_data_loop>

000000d4 <__crt0_copy_data_loop_end>:
  d4:	4501                	li	a0,0
  d6:	4581                	li	a1,0
  d8:	054000ef          	jal	ra,12c <main>

000000dc <__crt0_main_aftermath>:
  dc:	34051073          	csrw	mscratch,a0
  e0:	00000093          	li	ra,0
  e4:	00008363          	beqz	ra,ea <__crt0_main_aftermath_end>
  e8:	9082                	jalr	ra

000000ea <__crt0_main_aftermath_end>:
  ea:	30047073          	csrci	mstatus,8

000000ee <__crt0_main_aftermath_end_loop>:
  ee:	10500073          	wfi
  f2:	bff5                	j	ee <__crt0_main_aftermath_end_loop>

000000f4 <__crt0_dummy_trap_handler>:
  f4:	1161                	addi	sp,sp,-8
  f6:	c022                	sw	s0,0(sp)
  f8:	c226                	sw	s1,4(sp)
  fa:	34202473          	csrr	s0,mcause
  fe:	02044263          	bltz	s0,122 <__crt0_dummy_trap_handler_irq>
 102:	34102473          	csrr	s0,mepc

00000106 <__crt0_dummy_trap_handler_exc_c_check>:
 106:	00041483          	lh	s1,0(s0)
 10a:	888d                	andi	s1,s1,3
 10c:	0409                	addi	s0,s0,2
 10e:	34141073          	csrw	mepc,s0
 112:	440d                	li	s0,3
 114:	00941763          	bne	s0,s1,122 <__crt0_dummy_trap_handler_irq>

00000118 <__crt0_dummy_trap_handler_exc_uncrompressed>:
 118:	34102473          	csrr	s0,mepc
 11c:	0409                	addi	s0,s0,2
 11e:	34141073          	csrw	mepc,s0

00000122 <__crt0_dummy_trap_handler_irq>:
 122:	4402                	lw	s0,0(sp)
 124:	4492                	lw	s1,4(sp)
 126:	0121                	addi	sp,sp,8
 128:	30200073          	mret

0000012c <main>:
 12c:	1101                	addi	sp,sp,-32
 12e:	ce06                	sw	ra,28(sp)
 130:	cc22                	sw	s0,24(sp)
 132:	ca26                	sw	s1,20(sp)
 134:	c84a                	sw	s2,16(sp)
 136:	6415                	lui	s0,0x5
 138:	c64e                	sw	s3,12(sp)
 13a:	217d                	jal	5e8 <neorv32_rte_setup>
 13c:	4601                	li	a2,0
 13e:	4581                	li	a1,0
 140:	b0040513          	addi	a0,s0,-1280 # 4b00 <image_in+0x41e8>
 144:	23d5                	jal	728 <neorv32_uart0_setup>
 146:	4501                	li	a0,0
 148:	29c1                	jal	618 <neorv32_rte_check_isa>
 14a:	6505                	lui	a0,0x1
 14c:	8dc50513          	addi	a0,a0,-1828 # 8dc <__etext>
 150:	2591                	jal	794 <neorv32_uart0_print>
 152:	204d                	jal	1f4 <neorv32_cpu_get_cycle>
 154:	6685                	lui	a3,0x1
 156:	800004b7          	lui	s1,0x80000
 15a:	892a                	mv	s2,a0
 15c:	91868693          	addi	a3,a3,-1768 # 918 <image_in>
 160:	4601                	li	a2,0
 162:	00448493          	addi	s1,s1,4 # 80000004 <__ctr0_io_space_begin+0x80000204>
 166:	0a000513          	li	a0,160
 16a:	b0040413          	addi	s0,s0,-1280
 16e:	0001                	nop
 170:	8736                	mv	a4,a3
 172:	4801                	li	a6,0
 174:	009605b3          	add	a1,a2,s1
 178:	00174883          	lbu	a7,1(a4)
 17c:	00074783          	lbu	a5,0(a4)
 180:	0709                	addi	a4,a4,2
 182:	97c6                	add	a5,a5,a7
 184:	13e74883          	lbu	a7,318(a4)
 188:	97c6                	add	a5,a5,a7
 18a:	13f74883          	lbu	a7,319(a4)
 18e:	97c6                	add	a5,a5,a7
 190:	07c2                	slli	a5,a5,0x10
 192:	83c1                	srli	a5,a5,0x10
 194:	010588b3          	add	a7,a1,a6
 198:	8389                	srli	a5,a5,0x2
 19a:	00f88023          	sb	a5,0(a7)
 19e:	0805                	addi	a6,a6,1
 1a0:	fca81ce3          	bne	a6,a0,178 <main+0x4c>
 1a4:	0a060613          	addi	a2,a2,160
 1a8:	28068693          	addi	a3,a3,640
 1ac:	fc8612e3          	bne	a2,s0,170 <main+0x44>
 1b0:	80000737          	lui	a4,0x80000
 1b4:	00f71023          	sh	a5,0(a4) # 80000000 <__ctr0_io_space_begin+0x80000200>
 1b8:	2835                	jal	1f4 <neorv32_cpu_get_cycle>
 1ba:	412505b3          	sub	a1,a0,s2
 1be:	6505                	lui	a0,0x1
 1c0:	8f050513          	addi	a0,a0,-1808 # 8f0 <__etext+0x14>
 1c4:	6915                	lui	s2,0x5
 1c6:	2509                	jal	7c8 <neorv32_uart0_printf>
 1c8:	6411                	lui	s0,0x4
 1ca:	6985                	lui	s3,0x1
 1cc:	b0090913          	addi	s2,s2,-1280 # 4b00 <image_in+0x41e8>
 1d0:	008487b3          	add	a5,s1,s0
 1d4:	0007c583          	lbu	a1,0(a5)
 1d8:	91498513          	addi	a0,s3,-1772 # 914 <__etext+0x38>
 1dc:	0405                	addi	s0,s0,1
 1de:	23ed                	jal	7c8 <neorv32_uart0_printf>
 1e0:	ff2418e3          	bne	s0,s2,1d0 <main+0xa4>
 1e4:	40f2                	lw	ra,28(sp)
 1e6:	4462                	lw	s0,24(sp)
 1e8:	44d2                	lw	s1,20(sp)
 1ea:	4942                	lw	s2,16(sp)
 1ec:	49b2                	lw	s3,12(sp)
 1ee:	4501                	li	a0,0
 1f0:	6105                	addi	sp,sp,32
 1f2:	8082                	ret

000001f4 <neorv32_cpu_get_cycle>:
 1f4:	1141                	addi	sp,sp,-16
 1f6:	0001                	nop
 1f8:	c80026f3          	rdcycleh	a3
 1fc:	c0002773          	rdcycle	a4
 200:	c80027f3          	rdcycleh	a5
 204:	fed79ae3          	bne	a5,a3,1f8 <neorv32_cpu_get_cycle+0x4>
 208:	c03a                	sw	a4,0(sp)
 20a:	c23e                	sw	a5,4(sp)
 20c:	4502                	lw	a0,0(sp)
 20e:	4592                	lw	a1,4(sp)
 210:	0141                	addi	sp,sp,16
 212:	8082                	ret

00000214 <__neorv32_rte_core>:
 214:	7139                	addi	sp,sp,-64
 216:	de06                	sw	ra,60(sp)
 218:	dc16                	sw	t0,56(sp)
 21a:	da1a                	sw	t1,52(sp)
 21c:	d81e                	sw	t2,48(sp)
 21e:	d62a                	sw	a0,44(sp)
 220:	d42e                	sw	a1,40(sp)
 222:	d232                	sw	a2,36(sp)
 224:	d036                	sw	a3,32(sp)
 226:	ce3a                	sw	a4,28(sp)
 228:	cc3e                	sw	a5,24(sp)
 22a:	ca42                	sw	a6,20(sp)
 22c:	c846                	sw	a7,16(sp)
 22e:	c672                	sw	t3,12(sp)
 230:	c476                	sw	t4,8(sp)
 232:	c27a                	sw	t5,4(sp)
 234:	c07e                	sw	t6,0(sp)
 236:	34102773          	csrr	a4,mepc
 23a:	34071073          	csrw	mscratch,a4
 23e:	342027f3          	csrr	a5,mcause
 242:	0207cf63          	bltz	a5,280 <__neorv32_rte_core+0x6c>
 246:	00071683          	lh	a3,0(a4)
 24a:	458d                	li	a1,3
 24c:	8a8d                	andi	a3,a3,3
 24e:	00270613          	addi	a2,a4,2
 252:	00b69563          	bne	a3,a1,25c <__neorv32_rte_core+0x48>
 256:	00470613          	addi	a2,a4,4
 25a:	0001                	nop
 25c:	34161073          	csrw	mepc,a2
 260:	472d                	li	a4,11
 262:	00f77763          	bgeu	a4,a5,270 <__neorv32_rte_core+0x5c>
 266:	0001                	nop
 268:	46400793          	li	a5,1124
 26c:	a835                	j	2a8 <__neorv32_rte_core+0x94>
 26e:	0001                	nop
 270:	674d                	lui	a4,0x13
 272:	078a                	slli	a5,a5,0x2
 274:	51870713          	addi	a4,a4,1304 # 13518 <image_in+0x12c00>
 278:	97ba                	add	a5,a5,a4
 27a:	439c                	lw	a5,0(a5)
 27c:	8782                	jr	a5
 27e:	0001                	nop
 280:	80000737          	lui	a4,0x80000
 284:	ffd74713          	xori	a4,a4,-3
 288:	97ba                	add	a5,a5,a4
 28a:	4771                	li	a4,28
 28c:	fcf76ee3          	bltu	a4,a5,268 <__neorv32_rte_core+0x54>
 290:	674d                	lui	a4,0x13
 292:	078a                	slli	a5,a5,0x2
 294:	54870713          	addi	a4,a4,1352 # 13548 <image_in+0x12c30>
 298:	97ba                	add	a5,a5,a4
 29a:	439c                	lw	a5,0(a5)
 29c:	8782                	jr	a5
 29e:	0001                	nop
 2a0:	800057b7          	lui	a5,0x80005
 2a4:	b047a783          	lw	a5,-1276(a5) # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 2a8:	9782                	jalr	a5
 2aa:	50f2                	lw	ra,60(sp)
 2ac:	52e2                	lw	t0,56(sp)
 2ae:	5352                	lw	t1,52(sp)
 2b0:	53c2                	lw	t2,48(sp)
 2b2:	5532                	lw	a0,44(sp)
 2b4:	55a2                	lw	a1,40(sp)
 2b6:	5612                	lw	a2,36(sp)
 2b8:	5682                	lw	a3,32(sp)
 2ba:	4772                	lw	a4,28(sp)
 2bc:	47e2                	lw	a5,24(sp)
 2be:	4852                	lw	a6,20(sp)
 2c0:	48c2                	lw	a7,16(sp)
 2c2:	4e32                	lw	t3,12(sp)
 2c4:	4ea2                	lw	t4,8(sp)
 2c6:	4f12                	lw	t5,4(sp)
 2c8:	4f82                	lw	t6,0(sp)
 2ca:	6121                	addi	sp,sp,64
 2cc:	30200073          	mret
 2d0:	800057b7          	lui	a5,0x80005
 2d4:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 2d8:	43dc                	lw	a5,4(a5)
 2da:	b7f9                	j	2a8 <__neorv32_rte_core+0x94>
 2dc:	800057b7          	lui	a5,0x80005
 2e0:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 2e4:	479c                	lw	a5,8(a5)
 2e6:	b7c9                	j	2a8 <__neorv32_rte_core+0x94>
 2e8:	800057b7          	lui	a5,0x80005
 2ec:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 2f0:	47dc                	lw	a5,12(a5)
 2f2:	bf5d                	j	2a8 <__neorv32_rte_core+0x94>
 2f4:	800057b7          	lui	a5,0x80005
 2f8:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 2fc:	4b9c                	lw	a5,16(a5)
 2fe:	b76d                	j	2a8 <__neorv32_rte_core+0x94>
 300:	800057b7          	lui	a5,0x80005
 304:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 308:	4bdc                	lw	a5,20(a5)
 30a:	bf79                	j	2a8 <__neorv32_rte_core+0x94>
 30c:	800057b7          	lui	a5,0x80005
 310:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 314:	4f9c                	lw	a5,24(a5)
 316:	bf49                	j	2a8 <__neorv32_rte_core+0x94>
 318:	800057b7          	lui	a5,0x80005
 31c:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 320:	4fdc                	lw	a5,28(a5)
 322:	b759                	j	2a8 <__neorv32_rte_core+0x94>
 324:	800057b7          	lui	a5,0x80005
 328:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 32c:	539c                	lw	a5,32(a5)
 32e:	bfad                	j	2a8 <__neorv32_rte_core+0x94>
 330:	800057b7          	lui	a5,0x80005
 334:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 338:	53dc                	lw	a5,36(a5)
 33a:	b7bd                	j	2a8 <__neorv32_rte_core+0x94>
 33c:	800057b7          	lui	a5,0x80005
 340:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 344:	579c                	lw	a5,40(a5)
 346:	b78d                	j	2a8 <__neorv32_rte_core+0x94>
 348:	800057b7          	lui	a5,0x80005
 34c:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 350:	57dc                	lw	a5,44(a5)
 352:	bf99                	j	2a8 <__neorv32_rte_core+0x94>
 354:	800057b7          	lui	a5,0x80005
 358:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 35c:	5b9c                	lw	a5,48(a5)
 35e:	b7a9                	j	2a8 <__neorv32_rte_core+0x94>
 360:	800057b7          	lui	a5,0x80005
 364:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 368:	5bdc                	lw	a5,52(a5)
 36a:	bf3d                	j	2a8 <__neorv32_rte_core+0x94>
 36c:	800057b7          	lui	a5,0x80005
 370:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 374:	5f9c                	lw	a5,56(a5)
 376:	bf0d                	j	2a8 <__neorv32_rte_core+0x94>
 378:	800057b7          	lui	a5,0x80005
 37c:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 380:	5fdc                	lw	a5,60(a5)
 382:	b71d                	j	2a8 <__neorv32_rte_core+0x94>
 384:	800057b7          	lui	a5,0x80005
 388:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 38c:	43bc                	lw	a5,64(a5)
 38e:	bf29                	j	2a8 <__neorv32_rte_core+0x94>
 390:	800057b7          	lui	a5,0x80005
 394:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 398:	43fc                	lw	a5,68(a5)
 39a:	b739                	j	2a8 <__neorv32_rte_core+0x94>
 39c:	800057b7          	lui	a5,0x80005
 3a0:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 3a4:	47bc                	lw	a5,72(a5)
 3a6:	b709                	j	2a8 <__neorv32_rte_core+0x94>
 3a8:	800057b7          	lui	a5,0x80005
 3ac:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 3b0:	47fc                	lw	a5,76(a5)
 3b2:	bddd                	j	2a8 <__neorv32_rte_core+0x94>
 3b4:	800057b7          	lui	a5,0x80005
 3b8:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 3bc:	4bbc                	lw	a5,80(a5)
 3be:	b5ed                	j	2a8 <__neorv32_rte_core+0x94>
 3c0:	800057b7          	lui	a5,0x80005
 3c4:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 3c8:	4bfc                	lw	a5,84(a5)
 3ca:	bdf9                	j	2a8 <__neorv32_rte_core+0x94>
 3cc:	800057b7          	lui	a5,0x80005
 3d0:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 3d4:	4fbc                	lw	a5,88(a5)
 3d6:	bdc9                	j	2a8 <__neorv32_rte_core+0x94>
 3d8:	800057b7          	lui	a5,0x80005
 3dc:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 3e0:	4ffc                	lw	a5,92(a5)
 3e2:	b5d9                	j	2a8 <__neorv32_rte_core+0x94>
 3e4:	800057b7          	lui	a5,0x80005
 3e8:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 3ec:	53bc                	lw	a5,96(a5)
 3ee:	bd6d                	j	2a8 <__neorv32_rte_core+0x94>
 3f0:	800057b7          	lui	a5,0x80005
 3f4:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 3f8:	53fc                	lw	a5,100(a5)
 3fa:	b57d                	j	2a8 <__neorv32_rte_core+0x94>
 3fc:	800057b7          	lui	a5,0x80005
 400:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 404:	57bc                	lw	a5,104(a5)
 406:	b54d                	j	2a8 <__neorv32_rte_core+0x94>
 408:	800057b7          	lui	a5,0x80005
 40c:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 410:	57fc                	lw	a5,108(a5)
 412:	bd59                	j	2a8 <__neorv32_rte_core+0x94>
 414:	800057b7          	lui	a5,0x80005
 418:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 41c:	5bbc                	lw	a5,112(a5)
 41e:	b569                	j	2a8 <__neorv32_rte_core+0x94>

00000420 <__neorv32_rte_print_hex_word>:
 420:	1101                	addi	sp,sp,-32
 422:	c84a                	sw	s2,16(sp)
 424:	892a                	mv	s2,a0
 426:	654d                	lui	a0,0x13
 428:	ca26                	sw	s1,20(sp)
 42a:	5bc50513          	addi	a0,a0,1468 # 135bc <image_in+0x12ca4>
 42e:	64d1                	lui	s1,0x14
 430:	cc22                	sw	s0,24(sp)
 432:	c64e                	sw	s3,12(sp)
 434:	ce06                	sw	ra,28(sp)
 436:	4471                	li	s0,28
 438:	2eb1                	jal	794 <neorv32_uart0_print>
 43a:	83848493          	addi	s1,s1,-1992 # 13838 <hex_symbols.0>
 43e:	59f1                	li	s3,-4
 440:	008957b3          	srl	a5,s2,s0
 444:	8bbd                	andi	a5,a5,15
 446:	97a6                	add	a5,a5,s1
 448:	0007c503          	lbu	a0,0(a5)
 44c:	1471                	addi	s0,s0,-4
 44e:	2e0d                	jal	780 <neorv32_uart0_putc>
 450:	ff3418e3          	bne	s0,s3,440 <__neorv32_rte_print_hex_word+0x20>
 454:	40f2                	lw	ra,28(sp)
 456:	4462                	lw	s0,24(sp)
 458:	44d2                	lw	s1,20(sp)
 45a:	4942                	lw	s2,16(sp)
 45c:	49b2                	lw	s3,12(sp)
 45e:	6105                	addi	sp,sp,32
 460:	8082                	ret
 462:	0000                	unimp

00000464 <__neorv32_rte_debug_exc_handler>:
 464:	1141                	addi	sp,sp,-16
 466:	c606                	sw	ra,12(sp)
 468:	c422                	sw	s0,8(sp)
 46a:	c226                	sw	s1,4(sp)
 46c:	2c45                	jal	71c <neorv32_uart0_available>
 46e:	14050563          	beqz	a0,5b8 <__neorv32_rte_debug_exc_handler+0x154>
 472:	654d                	lui	a0,0x13
 474:	5c050513          	addi	a0,a0,1472 # 135c0 <image_in+0x12ca8>
 478:	2e31                	jal	794 <neorv32_uart0_print>
 47a:	34202473          	csrr	s0,mcause
 47e:	4725                	li	a4,9
 480:	00f47793          	andi	a5,s0,15
 484:	03078493          	addi	s1,a5,48
 488:	00f77463          	bgeu	a4,a5,490 <__neorv32_rte_debug_exc_handler+0x2c>
 48c:	05778493          	addi	s1,a5,87
 490:	47ad                	li	a5,11
 492:	0087eb63          	bltu	a5,s0,4a8 <__neorv32_rte_debug_exc_handler+0x44>
 496:	674d                	lui	a4,0x13
 498:	00241793          	slli	a5,s0,0x2
 49c:	78070713          	addi	a4,a4,1920 # 13780 <image_in+0x12e68>
 4a0:	97ba                	add	a5,a5,a4
 4a2:	439c                	lw	a5,0(a5)
 4a4:	8782                	jr	a5
 4a6:	0001                	nop
 4a8:	800007b7          	lui	a5,0x80000
 4ac:	00b78713          	addi	a4,a5,11 # 8000000b <__ctr0_io_space_begin+0x8000020b>
 4b0:	0ee40863          	beq	s0,a4,5a0 <__neorv32_rte_debug_exc_handler+0x13c>
 4b4:	02876263          	bltu	a4,s0,4d8 <__neorv32_rte_debug_exc_handler+0x74>
 4b8:	00378713          	addi	a4,a5,3
 4bc:	0ce40a63          	beq	s0,a4,590 <__neorv32_rte_debug_exc_handler+0x12c>
 4c0:	079d                	addi	a5,a5,7
 4c2:	0cf40b63          	beq	s0,a5,598 <__neorv32_rte_debug_exc_handler+0x134>
 4c6:	0001                	nop
 4c8:	654d                	lui	a0,0x13
 4ca:	72050513          	addi	a0,a0,1824 # 13720 <image_in+0x12e08>
 4ce:	24d9                	jal	794 <neorv32_uart0_print>
 4d0:	8522                	mv	a0,s0
 4d2:	37b9                	jal	420 <__neorv32_rte_print_hex_word>
 4d4:	a831                	j	4f0 <__neorv32_rte_debug_exc_handler+0x8c>
 4d6:	0001                	nop
 4d8:	ff07c793          	xori	a5,a5,-16
 4dc:	97a2                	add	a5,a5,s0
 4de:	473d                	li	a4,15
 4e0:	fef764e3          	bltu	a4,a5,4c8 <__neorv32_rte_debug_exc_handler+0x64>
 4e4:	654d                	lui	a0,0x13
 4e6:	71050513          	addi	a0,a0,1808 # 13710 <image_in+0x12df8>
 4ea:	246d                	jal	794 <neorv32_uart0_print>
 4ec:	8526                	mv	a0,s1
 4ee:	2c49                	jal	780 <neorv32_uart0_putc>
 4f0:	9875                	andi	s0,s0,-3
 4f2:	4795                	li	a5,5
 4f4:	04f40463          	beq	s0,a5,53c <__neorv32_rte_debug_exc_handler+0xd8>
 4f8:	654d                	lui	a0,0x13
 4fa:	76450513          	addi	a0,a0,1892 # 13764 <image_in+0x12e4c>
 4fe:	2c59                	jal	794 <neorv32_uart0_print>
 500:	34002573          	csrr	a0,mscratch
 504:	3f31                	jal	420 <__neorv32_rte_print_hex_word>
 506:	654d                	lui	a0,0x13
 508:	76c50513          	addi	a0,a0,1900 # 1376c <image_in+0x12e54>
 50c:	2461                	jal	794 <neorv32_uart0_print>
 50e:	34302573          	csrr	a0,mtval
 512:	3739                	jal	420 <__neorv32_rte_print_hex_word>
 514:	4422                	lw	s0,8(sp)
 516:	40b2                	lw	ra,12(sp)
 518:	4492                	lw	s1,4(sp)
 51a:	654d                	lui	a0,0x13
 51c:	77850513          	addi	a0,a0,1912 # 13778 <image_in+0x12e60>
 520:	0141                	addi	sp,sp,16
 522:	ac8d                	j	794 <neorv32_uart0_print>
 524:	654d                	lui	a0,0x13
 526:	5c850513          	addi	a0,a0,1480 # 135c8 <image_in+0x12cb0>
 52a:	0001                	nop
 52c:	24a5                	jal	794 <neorv32_uart0_print>
 52e:	b7e9                	j	4f8 <__neorv32_rte_debug_exc_handler+0x94>
 530:	654d                	lui	a0,0x13
 532:	5e850513          	addi	a0,a0,1512 # 135e8 <image_in+0x12cd0>
 536:	0001                	nop
 538:	2cb1                	jal	794 <neorv32_uart0_print>
 53a:	0001                	nop
 53c:	f7c02783          	lw	a5,-132(zero) # ffffff7c <__ctr0_io_space_begin+0x17c>
 540:	0607d863          	bgez	a5,5b0 <__neorv32_rte_debug_exc_handler+0x14c>
 544:	8b85                	andi	a5,a5,1
 546:	c3ad                	beqz	a5,5a8 <__neorv32_rte_debug_exc_handler+0x144>
 548:	654d                	lui	a0,0x13
 54a:	73850513          	addi	a0,a0,1848 # 13738 <image_in+0x12e20>
 54e:	bff9                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 550:	654d                	lui	a0,0x13
 552:	60450513          	addi	a0,a0,1540 # 13604 <image_in+0x12cec>
 556:	bfd9                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 558:	654d                	lui	a0,0x13
 55a:	61850513          	addi	a0,a0,1560 # 13618 <image_in+0x12d00>
 55e:	b7f9                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 560:	654d                	lui	a0,0x13
 562:	62450513          	addi	a0,a0,1572 # 13624 <image_in+0x12d0c>
 566:	b7d9                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 568:	654d                	lui	a0,0x13
 56a:	63c50513          	addi	a0,a0,1596 # 1363c <image_in+0x12d24>
 56e:	b7e9                	j	538 <__neorv32_rte_debug_exc_handler+0xd4>
 570:	654d                	lui	a0,0x13
 572:	65050513          	addi	a0,a0,1616 # 13650 <image_in+0x12d38>
 576:	bf5d                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 578:	654d                	lui	a0,0x13
 57a:	66c50513          	addi	a0,a0,1644 # 1366c <image_in+0x12d54>
 57e:	bf6d                	j	538 <__neorv32_rte_debug_exc_handler+0xd4>
 580:	654d                	lui	a0,0x13
 582:	68050513          	addi	a0,a0,1664 # 13680 <image_in+0x12d68>
 586:	b75d                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 588:	654d                	lui	a0,0x13
 58a:	6a050513          	addi	a0,a0,1696 # 136a0 <image_in+0x12d88>
 58e:	bf79                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 590:	654d                	lui	a0,0x13
 592:	6c050513          	addi	a0,a0,1728 # 136c0 <image_in+0x12da8>
 596:	bf59                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 598:	654d                	lui	a0,0x13
 59a:	6dc50513          	addi	a0,a0,1756 # 136dc <image_in+0x12dc4>
 59e:	b779                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 5a0:	654d                	lui	a0,0x13
 5a2:	6f450513          	addi	a0,a0,1780 # 136f4 <image_in+0x12ddc>
 5a6:	b759                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 5a8:	654d                	lui	a0,0x13
 5aa:	74850513          	addi	a0,a0,1864 # 13748 <image_in+0x12e30>
 5ae:	bfbd                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 5b0:	654d                	lui	a0,0x13
 5b2:	75850513          	addi	a0,a0,1880 # 13758 <image_in+0x12e40>
 5b6:	bf9d                	j	52c <__neorv32_rte_debug_exc_handler+0xc8>
 5b8:	40b2                	lw	ra,12(sp)
 5ba:	4422                	lw	s0,8(sp)
 5bc:	4492                	lw	s1,4(sp)
 5be:	0141                	addi	sp,sp,16
 5c0:	8082                	ret
 5c2:	0000                	unimp

000005c4 <neorv32_rte_exception_uninstall>:
 5c4:	47fd                	li	a5,31
 5c6:	00a7ed63          	bltu	a5,a0,5e0 <neorv32_rte_exception_uninstall+0x1c>
 5ca:	800057b7          	lui	a5,0x80005
 5ce:	050a                	slli	a0,a0,0x2
 5d0:	b0478793          	addi	a5,a5,-1276 # 80004b04 <__ctr0_io_space_begin+0x80004d04>
 5d4:	97aa                	add	a5,a5,a0
 5d6:	46400713          	li	a4,1124
 5da:	c398                	sw	a4,0(a5)
 5dc:	4501                	li	a0,0
 5de:	8082                	ret
 5e0:	4505                	li	a0,1
 5e2:	8082                	ret
 5e4:	0000                	unimp
 5e6:	0000                	unimp

000005e8 <neorv32_rte_setup>:
 5e8:	1141                	addi	sp,sp,-16
 5ea:	c606                	sw	ra,12(sp)
 5ec:	c422                	sw	s0,8(sp)
 5ee:	c226                	sw	s1,4(sp)
 5f0:	21400793          	li	a5,532
 5f4:	30579073          	csrw	mtvec,a5
 5f8:	4401                	li	s0,0
 5fa:	44f5                	li	s1,29
 5fc:	8522                	mv	a0,s0
 5fe:	0405                	addi	s0,s0,1
 600:	0ff47413          	zext.b	s0,s0
 604:	37c1                	jal	5c4 <neorv32_rte_exception_uninstall>
 606:	fe941be3          	bne	s0,s1,5fc <neorv32_rte_setup+0x14>
 60a:	40b2                	lw	ra,12(sp)
 60c:	4422                	lw	s0,8(sp)
 60e:	f6002e23          	sw	zero,-132(zero) # ffffff7c <__ctr0_io_space_begin+0x17c>
 612:	4492                	lw	s1,4(sp)
 614:	0141                	addi	sp,sp,16
 616:	8082                	ret

00000618 <neorv32_rte_check_isa>:
 618:	30102673          	csrr	a2,misa
 61c:	400015b7          	lui	a1,0x40001
 620:	10558593          	addi	a1,a1,261 # 40001105 <__crt0_copy_data_src_begin+0x3ffed89d>
 624:	00b677b3          	and	a5,a2,a1
 628:	02b78863          	beq	a5,a1,658 <neorv32_rte_check_isa+0x40>
 62c:	c501                	beqz	a0,634 <neorv32_rte_check_isa+0x1c>
 62e:	4505                	li	a0,1
 630:	8082                	ret
 632:	0001                	nop
 634:	1101                	addi	sp,sp,-32
 636:	c632                	sw	a2,12(sp)
 638:	ce06                	sw	ra,28(sp)
 63a:	20cd                	jal	71c <neorv32_uart0_available>
 63c:	400017b7          	lui	a5,0x40001
 640:	4632                	lw	a2,12(sp)
 642:	10578593          	addi	a1,a5,261 # 40001105 <__crt0_copy_data_src_begin+0x3ffed89d>
 646:	c509                	beqz	a0,650 <neorv32_rte_check_isa+0x38>
 648:	654d                	lui	a0,0x13
 64a:	7b050513          	addi	a0,a0,1968 # 137b0 <image_in+0x12e98>
 64e:	2aad                	jal	7c8 <neorv32_uart0_printf>
 650:	40f2                	lw	ra,28(sp)
 652:	4505                	li	a0,1
 654:	6105                	addi	sp,sp,32
 656:	8082                	ret
 658:	4501                	li	a0,0
 65a:	8082                	ret
 65c:	0000                	unimp
 65e:	0000                	unimp

00000660 <__neorv32_uart_itoa>:
 660:	1141                	addi	sp,sp,-16
 662:	6851                	lui	a6,0x14
 664:	00058523          	sb	zero,10(a1)
 668:	4781                	li	a5,0
 66a:	0054                	addi	a3,sp,4
 66c:	84880813          	addi	a6,a6,-1976 # 13848 <numbers.1>
 670:	4729                	li	a4,10
 672:	0001                	nop
 674:	02e57633          	remu	a2,a0,a4
 678:	00f688b3          	add	a7,a3,a5
 67c:	0785                	addi	a5,a5,1
 67e:	9642                	add	a2,a2,a6
 680:	00064603          	lbu	a2,0(a2)
 684:	02e55533          	divu	a0,a0,a4
 688:	00c88023          	sb	a2,0(a7)
 68c:	fee794e3          	bne	a5,a4,674 <__neorv32_uart_itoa+0x14>
 690:	8636                	mv	a2,a3
 692:	4725                	li	a4,9
 694:	03000513          	li	a0,48
 698:	00964803          	lbu	a6,9(a2)
 69c:	87ba                	mv	a5,a4
 69e:	177d                	addi	a4,a4,-1
 6a0:	0742                	slli	a4,a4,0x10
 6a2:	8341                	srli	a4,a4,0x10
 6a4:	00a81863          	bne	a6,a0,6b4 <__neorv32_uart_itoa+0x54>
 6a8:	000604a3          	sb	zero,9(a2)
 6ac:	167d                	addi	a2,a2,-1
 6ae:	f76d                	bnez	a4,698 <__neorv32_uart_itoa+0x38>
 6b0:	4781                	li	a5,0
 6b2:	0001                	nop
 6b4:	97b6                	add	a5,a5,a3
 6b6:	4701                	li	a4,0
 6b8:	0007c603          	lbu	a2,0(a5)
 6bc:	ca11                	beqz	a2,6d0 <__neorv32_uart_itoa+0x70>
 6be:	00170513          	addi	a0,a4,1
 6c2:	972e                	add	a4,a4,a1
 6c4:	00c70023          	sb	a2,0(a4)
 6c8:	01051713          	slli	a4,a0,0x10
 6cc:	8341                	srli	a4,a4,0x10
 6ce:	0001                	nop
 6d0:	fff78613          	addi	a2,a5,-1
 6d4:	00f69863          	bne	a3,a5,6e4 <__neorv32_uart_itoa+0x84>
 6d8:	95ba                	add	a1,a1,a4
 6da:	00058023          	sb	zero,0(a1)
 6de:	0141                	addi	sp,sp,16
 6e0:	8082                	ret
 6e2:	0001                	nop
 6e4:	87b2                	mv	a5,a2
 6e6:	bfc9                	j	6b8 <__neorv32_uart_itoa+0x58>
 6e8:	0000                	unimp
 6ea:	0000                	unimp

000006ec <__neorv32_uart_tohex>:
 6ec:	6651                	lui	a2,0x14
 6ee:	00758693          	addi	a3,a1,7
 6f2:	4701                	li	a4,0
 6f4:	85460613          	addi	a2,a2,-1964 # 13854 <symbols.0>
 6f8:	02000813          	li	a6,32
 6fc:	00e557b3          	srl	a5,a0,a4
 700:	8bbd                	andi	a5,a5,15
 702:	97b2                	add	a5,a5,a2
 704:	0007c783          	lbu	a5,0(a5)
 708:	0711                	addi	a4,a4,4
 70a:	16fd                	addi	a3,a3,-1
 70c:	00f680a3          	sb	a5,1(a3)
 710:	ff0716e3          	bne	a4,a6,6fc <__neorv32_uart_tohex+0x10>
 714:	00058423          	sb	zero,8(a1)
 718:	8082                	ret
 71a:	0000                	unimp

0000071c <neorv32_uart0_available>:
 71c:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 720:	8149                	srli	a0,a0,0x12
 722:	8905                	andi	a0,a0,1
 724:	8082                	ret
 726:	0000                	unimp

00000728 <neorv32_uart0_setup>:
 728:	fa002023          	sw	zero,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 72c:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 730:	0506                	slli	a0,a0,0x1
 732:	6685                	lui	a3,0x1
 734:	02a7d7b3          	divu	a5,a5,a0
 738:	4701                	li	a4,0
 73a:	16f9                	addi	a3,a3,-2
 73c:	07c2                	slli	a5,a5,0x10
 73e:	83c1                	srli	a5,a5,0x10
 740:	02f6e263          	bltu	a3,a5,764 <neorv32_uart0_setup+0x3c>
 744:	8a0d                	andi	a2,a2,3
 746:	898d                	andi	a1,a1,3
 748:	17fd                	addi	a5,a5,-1
 74a:	0652                	slli	a2,a2,0x14
 74c:	8fd1                	or	a5,a5,a2
 74e:	05da                	slli	a1,a1,0x16
 750:	0762                	slli	a4,a4,0x18
 752:	8fcd                	or	a5,a5,a1
 754:	8fd9                	or	a5,a5,a4
 756:	10001737          	lui	a4,0x10001
 75a:	8fd9                	or	a5,a5,a4
 75c:	faf02023          	sw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 760:	8082                	ret
 762:	0001                	nop
 764:	ffe70513          	addi	a0,a4,-2 # 10000ffe <__crt0_copy_data_src_begin+0xffed796>
 768:	0fd57513          	andi	a0,a0,253
 76c:	e511                	bnez	a0,778 <neorv32_uart0_setup+0x50>
 76e:	838d                	srli	a5,a5,0x3
 770:	0705                	addi	a4,a4,1
 772:	0ff77713          	zext.b	a4,a4
 776:	b7e9                	j	740 <neorv32_uart0_setup+0x18>
 778:	8385                	srli	a5,a5,0x1
 77a:	bfdd                	j	770 <neorv32_uart0_setup+0x48>
 77c:	0000                	unimp
 77e:	0000                	unimp

00000780 <neorv32_uart0_putc>:
 780:	000406b7          	lui	a3,0x40
 784:	fa000713          	li	a4,-96
 788:	431c                	lw	a5,0(a4)
 78a:	8ff5                	and	a5,a5,a3
 78c:	ffe5                	bnez	a5,784 <neorv32_uart0_putc+0x4>
 78e:	c348                	sw	a0,4(a4)
 790:	8082                	ret
 792:	0000                	unimp

00000794 <neorv32_uart0_print>:
 794:	1141                	addi	sp,sp,-16
 796:	c422                	sw	s0,8(sp)
 798:	c04a                	sw	s2,0(sp)
 79a:	c606                	sw	ra,12(sp)
 79c:	c226                	sw	s1,4(sp)
 79e:	842a                	mv	s0,a0
 7a0:	4929                	li	s2,10
 7a2:	0001                	nop
 7a4:	00044483          	lbu	s1,0(s0) # 4000 <image_in+0x36e8>
 7a8:	0405                	addi	s0,s0,1
 7aa:	e499                	bnez	s1,7b8 <neorv32_uart0_print+0x24>
 7ac:	40b2                	lw	ra,12(sp)
 7ae:	4422                	lw	s0,8(sp)
 7b0:	4492                	lw	s1,4(sp)
 7b2:	4902                	lw	s2,0(sp)
 7b4:	0141                	addi	sp,sp,16
 7b6:	8082                	ret
 7b8:	01249463          	bne	s1,s2,7c0 <neorv32_uart0_print+0x2c>
 7bc:	4535                	li	a0,13
 7be:	37c9                	jal	780 <neorv32_uart0_putc>
 7c0:	8526                	mv	a0,s1
 7c2:	3f7d                	jal	780 <neorv32_uart0_putc>
 7c4:	b7c5                	j	7a4 <neorv32_uart0_print+0x10>
 7c6:	0000                	unimp

000007c8 <neorv32_uart0_printf>:
 7c8:	711d                	addi	sp,sp,-96
 7ca:	cabe                	sw	a5,84(sp)
 7cc:	00dc                	addi	a5,sp,68
 7ce:	dc22                	sw	s0,56(sp)
 7d0:	d84a                	sw	s2,48(sp)
 7d2:	d452                	sw	s4,40(sp)
 7d4:	d256                	sw	s5,36(sp)
 7d6:	d05a                	sw	s6,32(sp)
 7d8:	ce5e                	sw	s7,28(sp)
 7da:	cc62                	sw	s8,24(sp)
 7dc:	ca66                	sw	s9,20(sp)
 7de:	de06                	sw	ra,60(sp)
 7e0:	da26                	sw	s1,52(sp)
 7e2:	d64e                	sw	s3,44(sp)
 7e4:	842a                	mv	s0,a0
 7e6:	c2ae                	sw	a1,68(sp)
 7e8:	c4b2                	sw	a2,72(sp)
 7ea:	c6b6                	sw	a3,76(sp)
 7ec:	c8ba                	sw	a4,80(sp)
 7ee:	ccc2                	sw	a6,88(sp)
 7f0:	cec6                	sw	a7,92(sp)
 7f2:	c03e                	sw	a5,0(sp)
 7f4:	02500a13          	li	s4,37
 7f8:	4aa9                	li	s5,10
 7fa:	07300913          	li	s2,115
 7fe:	07500b13          	li	s6,117
 802:	07800b93          	li	s7,120
 806:	06300c13          	li	s8,99
 80a:	06900c93          	li	s9,105
 80e:	0001                	nop
 810:	00044483          	lbu	s1,0(s0)
 814:	ec91                	bnez	s1,830 <neorv32_uart0_printf+0x68>
 816:	50f2                	lw	ra,60(sp)
 818:	5462                	lw	s0,56(sp)
 81a:	54d2                	lw	s1,52(sp)
 81c:	5942                	lw	s2,48(sp)
 81e:	59b2                	lw	s3,44(sp)
 820:	5a22                	lw	s4,40(sp)
 822:	5a92                	lw	s5,36(sp)
 824:	5b02                	lw	s6,32(sp)
 826:	4bf2                	lw	s7,28(sp)
 828:	4c62                	lw	s8,24(sp)
 82a:	4cd2                	lw	s9,20(sp)
 82c:	6125                	addi	sp,sp,96
 82e:	8082                	ret
 830:	09449c63          	bne	s1,s4,8c8 <neorv32_uart0_printf+0x100>
 834:	00240993          	addi	s3,s0,2
 838:	00144403          	lbu	s0,1(s0)
 83c:	03240a63          	beq	s0,s2,870 <neorv32_uart0_printf+0xa8>
 840:	00896c63          	bltu	s2,s0,858 <neorv32_uart0_printf+0x90>
 844:	05840063          	beq	s0,s8,884 <neorv32_uart0_printf+0xbc>
 848:	05940663          	beq	s0,s9,894 <neorv32_uart0_printf+0xcc>
 84c:	02500513          	li	a0,37
 850:	3f05                	jal	780 <neorv32_uart0_putc>
 852:	8522                	mv	a0,s0
 854:	a835                	j	890 <neorv32_uart0_printf+0xc8>
 856:	0001                	nop
 858:	07640063          	beq	s0,s6,8b8 <neorv32_uart0_printf+0xf0>
 85c:	ff7418e3          	bne	s0,s7,84c <neorv32_uart0_printf+0x84>
 860:	4782                	lw	a5,0(sp)
 862:	004c                	addi	a1,sp,4
 864:	4388                	lw	a0,0(a5)
 866:	00478713          	addi	a4,a5,4
 86a:	c03a                	sw	a4,0(sp)
 86c:	3541                	jal	6ec <__neorv32_uart_tohex>
 86e:	a099                	j	8b4 <neorv32_uart0_printf+0xec>
 870:	4782                	lw	a5,0(sp)
 872:	4388                	lw	a0,0(a5)
 874:	00478713          	addi	a4,a5,4
 878:	c03a                	sw	a4,0(sp)
 87a:	0001                	nop
 87c:	3f21                	jal	794 <neorv32_uart0_print>
 87e:	0001                	nop
 880:	844e                	mv	s0,s3
 882:	b779                	j	810 <neorv32_uart0_printf+0x48>
 884:	4782                	lw	a5,0(sp)
 886:	0007c503          	lbu	a0,0(a5)
 88a:	00478713          	addi	a4,a5,4
 88e:	c03a                	sw	a4,0(sp)
 890:	3dc5                	jal	780 <neorv32_uart0_putc>
 892:	b7fd                	j	880 <neorv32_uart0_printf+0xb8>
 894:	4782                	lw	a5,0(sp)
 896:	4380                	lw	s0,0(a5)
 898:	00478713          	addi	a4,a5,4
 89c:	c03a                	sw	a4,0(sp)
 89e:	00045763          	bgez	s0,8ac <neorv32_uart0_printf+0xe4>
 8a2:	02d00513          	li	a0,45
 8a6:	40800433          	neg	s0,s0
 8aa:	3dd9                	jal	780 <neorv32_uart0_putc>
 8ac:	004c                	addi	a1,sp,4
 8ae:	8522                	mv	a0,s0
 8b0:	3b45                	jal	660 <__neorv32_uart_itoa>
 8b2:	0001                	nop
 8b4:	0048                	addi	a0,sp,4
 8b6:	b7d9                	j	87c <neorv32_uart0_printf+0xb4>
 8b8:	4782                	lw	a5,0(sp)
 8ba:	004c                	addi	a1,sp,4
 8bc:	00478713          	addi	a4,a5,4
 8c0:	4388                	lw	a0,0(a5)
 8c2:	c03a                	sw	a4,0(sp)
 8c4:	b7f5                	j	8b0 <neorv32_uart0_printf+0xe8>
 8c6:	0001                	nop
 8c8:	01549463          	bne	s1,s5,8d0 <neorv32_uart0_printf+0x108>
 8cc:	4535                	li	a0,13
 8ce:	3d4d                	jal	780 <neorv32_uart0_putc>
 8d0:	00140993          	addi	s3,s0,1
 8d4:	8526                	mv	a0,s1
 8d6:	bf6d                	j	890 <neorv32_uart0_printf+0xc8>
 8d8:	0000                	unimp
 8da:	0000                	unimp
