
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
  8e:	80013597          	auipc	a1,0x80013
  92:	b7258593          	addi	a1,a1,-1166 # 80012c00 <__ctr0_io_space_begin+0x80012e00>
  96:	80017617          	auipc	a2,0x80017
  9a:	6e260613          	addi	a2,a2,1762 # 80017778 <__ctr0_io_space_begin+0x80017978>

0000009e <__crt0_clear_bss_loop>:
  9e:	00c5d663          	bge	a1,a2,aa <__crt0_clear_bss_loop_end>
  a2:	00058023          	sb	zero,0(a1)
  a6:	0585                	addi	a1,a1,1
  a8:	bfdd                	j	9e <__crt0_clear_bss_loop>

000000aa <__crt0_clear_bss_loop_end>:
  aa:	00001597          	auipc	a1,0x1
  ae:	b6258593          	addi	a1,a1,-1182 # c0c <__crt0_copy_data_src_begin>
  b2:	80000617          	auipc	a2,0x80000
  b6:	f4e60613          	addi	a2,a2,-178 # 80000000 <__ctr0_io_space_begin+0x80000200>
  ba:	80013697          	auipc	a3,0x80013
  be:	b4668693          	addi	a3,a3,-1210 # 80012c00 <__ctr0_io_space_begin+0x80012e00>

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
 12c:	7179                	addi	sp,sp,-48
 12e:	d606                	sw	ra,44(sp)
 130:	d226                	sw	s1,36(sp)
 132:	ce4e                	sw	s3,28(sp)
 134:	cc52                	sw	s4,24(sp)
 136:	ca56                	sw	s5,20(sp)
 138:	c85a                	sw	s6,16(sp)
 13a:	c462                	sw	s8,8(sp)
 13c:	c266                	sw	s9,4(sp)
 13e:	6995                	lui	s3,0x5
 140:	d422                	sw	s0,40(sp)
 142:	d04a                	sw	s2,32(sp)
 144:	c65e                	sw	s7,12(sp)
 146:	29bd                	jal	5c4 <neorv32_rte_setup>
 148:	b0098513          	addi	a0,s3,-1280 # 4b00 <__crt0_copy_data_src_begin+0x3ef4>
 14c:	4601                	li	a2,0
 14e:	4581                	li	a1,0
 150:	2b55                	jal	704 <neorv32_uart0_setup>
 152:	4501                	li	a0,0
 154:	80000ab7          	lui	s5,0x80000
 158:	80013b37          	lui	s6,0x80013
 15c:	80013a37          	lui	s4,0x80013
 160:	2951                	jal	5f4 <neorv32_rte_check_isa>
 162:	4481                	li	s1,0
 164:	000a8a93          	mv	s5,s5
 168:	c00b0b13          	addi	s6,s6,-1024 # 80012c00 <__ctr0_io_space_begin+0x80012e00>
 16c:	c04a0a13          	addi	s4,s4,-1020 # 80012c04 <__ctr0_io_space_begin+0x80012e04>
 170:	6c05                	lui	s8,0x1
 172:	0a000c93          	li	s9,160
 176:	b0098993          	addi	s3,s3,-1280
 17a:	0001                	nop
 17c:	00249413          	slli	s0,s1,0x2
 180:	0442                	slli	s0,s0,0x10
 182:	8041                	srli	s0,s0,0x10
 184:	4901                	li	s2,0
 186:	01448bb3          	add	s7,s1,s4
 18a:	0001                	nop
 18c:	008a87b3          	add	a5,s5,s0
 190:	1407c703          	lbu	a4,320(a5)
 194:	0017c583          	lbu	a1,1(a5)
 198:	0409                	addi	s0,s0,2
 19a:	8b8c0513          	addi	a0,s8,-1864 # 8b8 <__etext>
 19e:	95ba                	add	a1,a1,a4
 1a0:	0007c703          	lbu	a4,0(a5)
 1a4:	1417c783          	lbu	a5,321(a5)
 1a8:	0442                	slli	s0,s0,0x10
 1aa:	95ba                	add	a1,a1,a4
 1ac:	95be                	add	a1,a1,a5
 1ae:	05c2                	slli	a1,a1,0x10
 1b0:	81c1                	srli	a1,a1,0x10
 1b2:	8189                	srli	a1,a1,0x2
 1b4:	012b87b3          	add	a5,s7,s2
 1b8:	00b78023          	sb	a1,0(a5)
 1bc:	0905                	addi	s2,s2,1
 1be:	00bb1023          	sh	a1,0(s6)
 1c2:	8041                	srli	s0,s0,0x10
 1c4:	23c5                	jal	7a4 <neorv32_uart0_printf>
 1c6:	fd9913e3          	bne	s2,s9,18c <main+0x60>
 1ca:	0a048493          	addi	s1,s1,160
 1ce:	fb3497e3          	bne	s1,s3,17c <main+0x50>
 1d2:	50b2                	lw	ra,44(sp)
 1d4:	5422                	lw	s0,40(sp)
 1d6:	5492                	lw	s1,36(sp)
 1d8:	5902                	lw	s2,32(sp)
 1da:	49f2                	lw	s3,28(sp)
 1dc:	4a62                	lw	s4,24(sp)
 1de:	4ad2                	lw	s5,20(sp)
 1e0:	4b42                	lw	s6,16(sp)
 1e2:	4bb2                	lw	s7,12(sp)
 1e4:	4c22                	lw	s8,8(sp)
 1e6:	4c92                	lw	s9,4(sp)
 1e8:	4501                	li	a0,0
 1ea:	6145                	addi	sp,sp,48
 1ec:	8082                	ret
 1ee:	0000                	unimp

000001f0 <__neorv32_rte_core>:
 1f0:	7139                	addi	sp,sp,-64
 1f2:	de06                	sw	ra,60(sp)
 1f4:	dc16                	sw	t0,56(sp)
 1f6:	da1a                	sw	t1,52(sp)
 1f8:	d81e                	sw	t2,48(sp)
 1fa:	d62a                	sw	a0,44(sp)
 1fc:	d42e                	sw	a1,40(sp)
 1fe:	d232                	sw	a2,36(sp)
 200:	d036                	sw	a3,32(sp)
 202:	ce3a                	sw	a4,28(sp)
 204:	cc3e                	sw	a5,24(sp)
 206:	ca42                	sw	a6,20(sp)
 208:	c846                	sw	a7,16(sp)
 20a:	c672                	sw	t3,12(sp)
 20c:	c476                	sw	t4,8(sp)
 20e:	c27a                	sw	t5,4(sp)
 210:	c07e                	sw	t6,0(sp)
 212:	34102773          	csrr	a4,mepc
 216:	34071073          	csrw	mscratch,a4
 21a:	342027f3          	csrr	a5,mcause
 21e:	0207cf63          	bltz	a5,25c <__neorv32_rte_core+0x6c>
 222:	00071683          	lh	a3,0(a4)
 226:	458d                	li	a1,3
 228:	8a8d                	andi	a3,a3,3
 22a:	00270613          	addi	a2,a4,2
 22e:	00b69563          	bne	a3,a1,238 <__neorv32_rte_core+0x48>
 232:	00470613          	addi	a2,a4,4
 236:	0001                	nop
 238:	34161073          	csrw	mepc,a2
 23c:	472d                	li	a4,11
 23e:	00f77763          	bgeu	a4,a5,24c <__neorv32_rte_core+0x5c>
 242:	0001                	nop
 244:	44000793          	li	a5,1088
 248:	a835                	j	284 <__neorv32_rte_core+0x94>
 24a:	0001                	nop
 24c:	6705                	lui	a4,0x1
 24e:	078a                	slli	a5,a5,0x2
 250:	8bc70713          	addi	a4,a4,-1860 # 8bc <__etext+0x4>
 254:	97ba                	add	a5,a5,a4
 256:	439c                	lw	a5,0(a5)
 258:	8782                	jr	a5
 25a:	0001                	nop
 25c:	80000737          	lui	a4,0x80000
 260:	ffd74713          	xori	a4,a4,-3
 264:	97ba                	add	a5,a5,a4
 266:	4771                	li	a4,28
 268:	fcf76ee3          	bltu	a4,a5,244 <__neorv32_rte_core+0x54>
 26c:	6705                	lui	a4,0x1
 26e:	078a                	slli	a5,a5,0x2
 270:	8ec70713          	addi	a4,a4,-1812 # 8ec <__etext+0x34>
 274:	97ba                	add	a5,a5,a4
 276:	439c                	lw	a5,0(a5)
 278:	8782                	jr	a5
 27a:	0001                	nop
 27c:	800177b7          	lui	a5,0x80017
 280:	7047a783          	lw	a5,1796(a5) # 80017704 <__ctr0_io_space_begin+0x80017904>
 284:	9782                	jalr	a5
 286:	50f2                	lw	ra,60(sp)
 288:	52e2                	lw	t0,56(sp)
 28a:	5352                	lw	t1,52(sp)
 28c:	53c2                	lw	t2,48(sp)
 28e:	5532                	lw	a0,44(sp)
 290:	55a2                	lw	a1,40(sp)
 292:	5612                	lw	a2,36(sp)
 294:	5682                	lw	a3,32(sp)
 296:	4772                	lw	a4,28(sp)
 298:	47e2                	lw	a5,24(sp)
 29a:	4852                	lw	a6,20(sp)
 29c:	48c2                	lw	a7,16(sp)
 29e:	4e32                	lw	t3,12(sp)
 2a0:	4ea2                	lw	t4,8(sp)
 2a2:	4f12                	lw	t5,4(sp)
 2a4:	4f82                	lw	t6,0(sp)
 2a6:	6121                	addi	sp,sp,64
 2a8:	30200073          	mret
 2ac:	800177b7          	lui	a5,0x80017
 2b0:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 2b4:	43dc                	lw	a5,4(a5)
 2b6:	b7f9                	j	284 <__neorv32_rte_core+0x94>
 2b8:	800177b7          	lui	a5,0x80017
 2bc:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 2c0:	479c                	lw	a5,8(a5)
 2c2:	b7c9                	j	284 <__neorv32_rte_core+0x94>
 2c4:	800177b7          	lui	a5,0x80017
 2c8:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 2cc:	47dc                	lw	a5,12(a5)
 2ce:	bf5d                	j	284 <__neorv32_rte_core+0x94>
 2d0:	800177b7          	lui	a5,0x80017
 2d4:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 2d8:	4b9c                	lw	a5,16(a5)
 2da:	b76d                	j	284 <__neorv32_rte_core+0x94>
 2dc:	800177b7          	lui	a5,0x80017
 2e0:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 2e4:	4bdc                	lw	a5,20(a5)
 2e6:	bf79                	j	284 <__neorv32_rte_core+0x94>
 2e8:	800177b7          	lui	a5,0x80017
 2ec:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 2f0:	4f9c                	lw	a5,24(a5)
 2f2:	bf49                	j	284 <__neorv32_rte_core+0x94>
 2f4:	800177b7          	lui	a5,0x80017
 2f8:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 2fc:	4fdc                	lw	a5,28(a5)
 2fe:	b759                	j	284 <__neorv32_rte_core+0x94>
 300:	800177b7          	lui	a5,0x80017
 304:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 308:	539c                	lw	a5,32(a5)
 30a:	bfad                	j	284 <__neorv32_rte_core+0x94>
 30c:	800177b7          	lui	a5,0x80017
 310:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 314:	53dc                	lw	a5,36(a5)
 316:	b7bd                	j	284 <__neorv32_rte_core+0x94>
 318:	800177b7          	lui	a5,0x80017
 31c:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 320:	579c                	lw	a5,40(a5)
 322:	b78d                	j	284 <__neorv32_rte_core+0x94>
 324:	800177b7          	lui	a5,0x80017
 328:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 32c:	57dc                	lw	a5,44(a5)
 32e:	bf99                	j	284 <__neorv32_rte_core+0x94>
 330:	800177b7          	lui	a5,0x80017
 334:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 338:	5b9c                	lw	a5,48(a5)
 33a:	b7a9                	j	284 <__neorv32_rte_core+0x94>
 33c:	800177b7          	lui	a5,0x80017
 340:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 344:	5bdc                	lw	a5,52(a5)
 346:	bf3d                	j	284 <__neorv32_rte_core+0x94>
 348:	800177b7          	lui	a5,0x80017
 34c:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 350:	5f9c                	lw	a5,56(a5)
 352:	bf0d                	j	284 <__neorv32_rte_core+0x94>
 354:	800177b7          	lui	a5,0x80017
 358:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 35c:	5fdc                	lw	a5,60(a5)
 35e:	b71d                	j	284 <__neorv32_rte_core+0x94>
 360:	800177b7          	lui	a5,0x80017
 364:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 368:	43bc                	lw	a5,64(a5)
 36a:	bf29                	j	284 <__neorv32_rte_core+0x94>
 36c:	800177b7          	lui	a5,0x80017
 370:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 374:	43fc                	lw	a5,68(a5)
 376:	b739                	j	284 <__neorv32_rte_core+0x94>
 378:	800177b7          	lui	a5,0x80017
 37c:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 380:	47bc                	lw	a5,72(a5)
 382:	b709                	j	284 <__neorv32_rte_core+0x94>
 384:	800177b7          	lui	a5,0x80017
 388:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 38c:	47fc                	lw	a5,76(a5)
 38e:	bddd                	j	284 <__neorv32_rte_core+0x94>
 390:	800177b7          	lui	a5,0x80017
 394:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 398:	4bbc                	lw	a5,80(a5)
 39a:	b5ed                	j	284 <__neorv32_rte_core+0x94>
 39c:	800177b7          	lui	a5,0x80017
 3a0:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 3a4:	4bfc                	lw	a5,84(a5)
 3a6:	bdf9                	j	284 <__neorv32_rte_core+0x94>
 3a8:	800177b7          	lui	a5,0x80017
 3ac:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 3b0:	4fbc                	lw	a5,88(a5)
 3b2:	bdc9                	j	284 <__neorv32_rte_core+0x94>
 3b4:	800177b7          	lui	a5,0x80017
 3b8:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 3bc:	4ffc                	lw	a5,92(a5)
 3be:	b5d9                	j	284 <__neorv32_rte_core+0x94>
 3c0:	800177b7          	lui	a5,0x80017
 3c4:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 3c8:	53bc                	lw	a5,96(a5)
 3ca:	bd6d                	j	284 <__neorv32_rte_core+0x94>
 3cc:	800177b7          	lui	a5,0x80017
 3d0:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 3d4:	53fc                	lw	a5,100(a5)
 3d6:	b57d                	j	284 <__neorv32_rte_core+0x94>
 3d8:	800177b7          	lui	a5,0x80017
 3dc:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 3e0:	57bc                	lw	a5,104(a5)
 3e2:	b54d                	j	284 <__neorv32_rte_core+0x94>
 3e4:	800177b7          	lui	a5,0x80017
 3e8:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 3ec:	57fc                	lw	a5,108(a5)
 3ee:	bd59                	j	284 <__neorv32_rte_core+0x94>
 3f0:	800177b7          	lui	a5,0x80017
 3f4:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 3f8:	5bbc                	lw	a5,112(a5)
 3fa:	b569                	j	284 <__neorv32_rte_core+0x94>

000003fc <__neorv32_rte_print_hex_word>:
 3fc:	1101                	addi	sp,sp,-32
 3fe:	c84a                	sw	s2,16(sp)
 400:	892a                	mv	s2,a0
 402:	6505                	lui	a0,0x1
 404:	ca26                	sw	s1,20(sp)
 406:	96050513          	addi	a0,a0,-1696 # 960 <__etext+0xa8>
 40a:	6485                	lui	s1,0x1
 40c:	cc22                	sw	s0,24(sp)
 40e:	c64e                	sw	s3,12(sp)
 410:	ce06                	sw	ra,28(sp)
 412:	4471                	li	s0,28
 414:	2eb1                	jal	770 <neorv32_uart0_print>
 416:	bdc48493          	addi	s1,s1,-1060 # bdc <hex_symbols.0>
 41a:	59f1                	li	s3,-4
 41c:	008957b3          	srl	a5,s2,s0
 420:	8bbd                	andi	a5,a5,15
 422:	97a6                	add	a5,a5,s1
 424:	0007c503          	lbu	a0,0(a5)
 428:	1471                	addi	s0,s0,-4
 42a:	2e0d                	jal	75c <neorv32_uart0_putc>
 42c:	ff3418e3          	bne	s0,s3,41c <__neorv32_rte_print_hex_word+0x20>
 430:	40f2                	lw	ra,28(sp)
 432:	4462                	lw	s0,24(sp)
 434:	44d2                	lw	s1,20(sp)
 436:	4942                	lw	s2,16(sp)
 438:	49b2                	lw	s3,12(sp)
 43a:	6105                	addi	sp,sp,32
 43c:	8082                	ret
 43e:	0000                	unimp

00000440 <__neorv32_rte_debug_exc_handler>:
 440:	1141                	addi	sp,sp,-16
 442:	c606                	sw	ra,12(sp)
 444:	c422                	sw	s0,8(sp)
 446:	c226                	sw	s1,4(sp)
 448:	2c45                	jal	6f8 <neorv32_uart0_available>
 44a:	14050563          	beqz	a0,594 <__neorv32_rte_debug_exc_handler+0x154>
 44e:	6505                	lui	a0,0x1
 450:	96450513          	addi	a0,a0,-1692 # 964 <__etext+0xac>
 454:	2e31                	jal	770 <neorv32_uart0_print>
 456:	34202473          	csrr	s0,mcause
 45a:	4725                	li	a4,9
 45c:	00f47793          	andi	a5,s0,15
 460:	03078493          	addi	s1,a5,48
 464:	00f77463          	bgeu	a4,a5,46c <__neorv32_rte_debug_exc_handler+0x2c>
 468:	05778493          	addi	s1,a5,87
 46c:	47ad                	li	a5,11
 46e:	0087eb63          	bltu	a5,s0,484 <__neorv32_rte_debug_exc_handler+0x44>
 472:	6705                	lui	a4,0x1
 474:	00241793          	slli	a5,s0,0x2
 478:	b2470713          	addi	a4,a4,-1244 # b24 <__etext+0x26c>
 47c:	97ba                	add	a5,a5,a4
 47e:	439c                	lw	a5,0(a5)
 480:	8782                	jr	a5
 482:	0001                	nop
 484:	800007b7          	lui	a5,0x80000
 488:	00b78713          	addi	a4,a5,11 # 8000000b <__ctr0_io_space_begin+0x8000020b>
 48c:	0ee40863          	beq	s0,a4,57c <__neorv32_rte_debug_exc_handler+0x13c>
 490:	02876263          	bltu	a4,s0,4b4 <__neorv32_rte_debug_exc_handler+0x74>
 494:	00378713          	addi	a4,a5,3
 498:	0ce40a63          	beq	s0,a4,56c <__neorv32_rte_debug_exc_handler+0x12c>
 49c:	079d                	addi	a5,a5,7
 49e:	0cf40b63          	beq	s0,a5,574 <__neorv32_rte_debug_exc_handler+0x134>
 4a2:	0001                	nop
 4a4:	6505                	lui	a0,0x1
 4a6:	ac450513          	addi	a0,a0,-1340 # ac4 <__etext+0x20c>
 4aa:	24d9                	jal	770 <neorv32_uart0_print>
 4ac:	8522                	mv	a0,s0
 4ae:	37b9                	jal	3fc <__neorv32_rte_print_hex_word>
 4b0:	a831                	j	4cc <__neorv32_rte_debug_exc_handler+0x8c>
 4b2:	0001                	nop
 4b4:	ff07c793          	xori	a5,a5,-16
 4b8:	97a2                	add	a5,a5,s0
 4ba:	473d                	li	a4,15
 4bc:	fef764e3          	bltu	a4,a5,4a4 <__neorv32_rte_debug_exc_handler+0x64>
 4c0:	6505                	lui	a0,0x1
 4c2:	ab450513          	addi	a0,a0,-1356 # ab4 <__etext+0x1fc>
 4c6:	246d                	jal	770 <neorv32_uart0_print>
 4c8:	8526                	mv	a0,s1
 4ca:	2c49                	jal	75c <neorv32_uart0_putc>
 4cc:	9875                	andi	s0,s0,-3
 4ce:	4795                	li	a5,5
 4d0:	04f40463          	beq	s0,a5,518 <__neorv32_rte_debug_exc_handler+0xd8>
 4d4:	6505                	lui	a0,0x1
 4d6:	b0850513          	addi	a0,a0,-1272 # b08 <__etext+0x250>
 4da:	2c59                	jal	770 <neorv32_uart0_print>
 4dc:	34002573          	csrr	a0,mscratch
 4e0:	3f31                	jal	3fc <__neorv32_rte_print_hex_word>
 4e2:	6505                	lui	a0,0x1
 4e4:	b1050513          	addi	a0,a0,-1264 # b10 <__etext+0x258>
 4e8:	2461                	jal	770 <neorv32_uart0_print>
 4ea:	34302573          	csrr	a0,mtval
 4ee:	3739                	jal	3fc <__neorv32_rte_print_hex_word>
 4f0:	4422                	lw	s0,8(sp)
 4f2:	40b2                	lw	ra,12(sp)
 4f4:	4492                	lw	s1,4(sp)
 4f6:	6505                	lui	a0,0x1
 4f8:	b1c50513          	addi	a0,a0,-1252 # b1c <__etext+0x264>
 4fc:	0141                	addi	sp,sp,16
 4fe:	ac8d                	j	770 <neorv32_uart0_print>
 500:	6505                	lui	a0,0x1
 502:	96c50513          	addi	a0,a0,-1684 # 96c <__etext+0xb4>
 506:	0001                	nop
 508:	24a5                	jal	770 <neorv32_uart0_print>
 50a:	b7e9                	j	4d4 <__neorv32_rte_debug_exc_handler+0x94>
 50c:	6505                	lui	a0,0x1
 50e:	98c50513          	addi	a0,a0,-1652 # 98c <__etext+0xd4>
 512:	0001                	nop
 514:	2cb1                	jal	770 <neorv32_uart0_print>
 516:	0001                	nop
 518:	f7c02783          	lw	a5,-132(zero) # ffffff7c <__ctr0_io_space_begin+0x17c>
 51c:	0607d863          	bgez	a5,58c <__neorv32_rte_debug_exc_handler+0x14c>
 520:	8b85                	andi	a5,a5,1
 522:	c3ad                	beqz	a5,584 <__neorv32_rte_debug_exc_handler+0x144>
 524:	6505                	lui	a0,0x1
 526:	adc50513          	addi	a0,a0,-1316 # adc <__etext+0x224>
 52a:	bff9                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 52c:	6505                	lui	a0,0x1
 52e:	9a850513          	addi	a0,a0,-1624 # 9a8 <__etext+0xf0>
 532:	bfd9                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 534:	6505                	lui	a0,0x1
 536:	9bc50513          	addi	a0,a0,-1604 # 9bc <__etext+0x104>
 53a:	b7f9                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 53c:	6505                	lui	a0,0x1
 53e:	9c850513          	addi	a0,a0,-1592 # 9c8 <__etext+0x110>
 542:	b7d9                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 544:	6505                	lui	a0,0x1
 546:	9e050513          	addi	a0,a0,-1568 # 9e0 <__etext+0x128>
 54a:	b7e9                	j	514 <__neorv32_rte_debug_exc_handler+0xd4>
 54c:	6505                	lui	a0,0x1
 54e:	9f450513          	addi	a0,a0,-1548 # 9f4 <__etext+0x13c>
 552:	bf5d                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 554:	6505                	lui	a0,0x1
 556:	a1050513          	addi	a0,a0,-1520 # a10 <__etext+0x158>
 55a:	bf6d                	j	514 <__neorv32_rte_debug_exc_handler+0xd4>
 55c:	6505                	lui	a0,0x1
 55e:	a2450513          	addi	a0,a0,-1500 # a24 <__etext+0x16c>
 562:	b75d                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 564:	6505                	lui	a0,0x1
 566:	a4450513          	addi	a0,a0,-1468 # a44 <__etext+0x18c>
 56a:	bf79                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 56c:	6505                	lui	a0,0x1
 56e:	a6450513          	addi	a0,a0,-1436 # a64 <__etext+0x1ac>
 572:	bf59                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 574:	6505                	lui	a0,0x1
 576:	a8050513          	addi	a0,a0,-1408 # a80 <__etext+0x1c8>
 57a:	b779                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 57c:	6505                	lui	a0,0x1
 57e:	a9850513          	addi	a0,a0,-1384 # a98 <__etext+0x1e0>
 582:	b759                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 584:	6505                	lui	a0,0x1
 586:	aec50513          	addi	a0,a0,-1300 # aec <__etext+0x234>
 58a:	bfbd                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 58c:	6505                	lui	a0,0x1
 58e:	afc50513          	addi	a0,a0,-1284 # afc <__etext+0x244>
 592:	bf9d                	j	508 <__neorv32_rte_debug_exc_handler+0xc8>
 594:	40b2                	lw	ra,12(sp)
 596:	4422                	lw	s0,8(sp)
 598:	4492                	lw	s1,4(sp)
 59a:	0141                	addi	sp,sp,16
 59c:	8082                	ret
 59e:	0000                	unimp

000005a0 <neorv32_rte_exception_uninstall>:
 5a0:	47fd                	li	a5,31
 5a2:	00a7ed63          	bltu	a5,a0,5bc <neorv32_rte_exception_uninstall+0x1c>
 5a6:	800177b7          	lui	a5,0x80017
 5aa:	050a                	slli	a0,a0,0x2
 5ac:	70478793          	addi	a5,a5,1796 # 80017704 <__ctr0_io_space_begin+0x80017904>
 5b0:	97aa                	add	a5,a5,a0
 5b2:	44000713          	li	a4,1088
 5b6:	c398                	sw	a4,0(a5)
 5b8:	4501                	li	a0,0
 5ba:	8082                	ret
 5bc:	4505                	li	a0,1
 5be:	8082                	ret
 5c0:	0000                	unimp
 5c2:	0000                	unimp

000005c4 <neorv32_rte_setup>:
 5c4:	1141                	addi	sp,sp,-16
 5c6:	c606                	sw	ra,12(sp)
 5c8:	c422                	sw	s0,8(sp)
 5ca:	c226                	sw	s1,4(sp)
 5cc:	1f000793          	li	a5,496
 5d0:	30579073          	csrw	mtvec,a5
 5d4:	4401                	li	s0,0
 5d6:	44f5                	li	s1,29
 5d8:	8522                	mv	a0,s0
 5da:	0405                	addi	s0,s0,1
 5dc:	0ff47413          	zext.b	s0,s0
 5e0:	37c1                	jal	5a0 <neorv32_rte_exception_uninstall>
 5e2:	fe941be3          	bne	s0,s1,5d8 <neorv32_rte_setup+0x14>
 5e6:	40b2                	lw	ra,12(sp)
 5e8:	4422                	lw	s0,8(sp)
 5ea:	f6002e23          	sw	zero,-132(zero) # ffffff7c <__ctr0_io_space_begin+0x17c>
 5ee:	4492                	lw	s1,4(sp)
 5f0:	0141                	addi	sp,sp,16
 5f2:	8082                	ret

000005f4 <neorv32_rte_check_isa>:
 5f4:	30102673          	csrr	a2,misa
 5f8:	400015b7          	lui	a1,0x40001
 5fc:	10558593          	addi	a1,a1,261 # 40001105 <__crt0_copy_data_src_begin+0x400004f9>
 600:	00b677b3          	and	a5,a2,a1
 604:	02b78863          	beq	a5,a1,634 <neorv32_rte_check_isa+0x40>
 608:	c501                	beqz	a0,610 <neorv32_rte_check_isa+0x1c>
 60a:	4505                	li	a0,1
 60c:	8082                	ret
 60e:	0001                	nop
 610:	1101                	addi	sp,sp,-32
 612:	c632                	sw	a2,12(sp)
 614:	ce06                	sw	ra,28(sp)
 616:	20cd                	jal	6f8 <neorv32_uart0_available>
 618:	400017b7          	lui	a5,0x40001
 61c:	4632                	lw	a2,12(sp)
 61e:	10578593          	addi	a1,a5,261 # 40001105 <__crt0_copy_data_src_begin+0x400004f9>
 622:	c509                	beqz	a0,62c <neorv32_rte_check_isa+0x38>
 624:	6505                	lui	a0,0x1
 626:	b5450513          	addi	a0,a0,-1196 # b54 <__etext+0x29c>
 62a:	2aad                	jal	7a4 <neorv32_uart0_printf>
 62c:	40f2                	lw	ra,28(sp)
 62e:	4505                	li	a0,1
 630:	6105                	addi	sp,sp,32
 632:	8082                	ret
 634:	4501                	li	a0,0
 636:	8082                	ret
 638:	0000                	unimp
 63a:	0000                	unimp

0000063c <__neorv32_uart_itoa>:
 63c:	1141                	addi	sp,sp,-16
 63e:	6805                	lui	a6,0x1
 640:	00058523          	sb	zero,10(a1)
 644:	4781                	li	a5,0
 646:	0054                	addi	a3,sp,4
 648:	bec80813          	addi	a6,a6,-1044 # bec <numbers.1>
 64c:	4729                	li	a4,10
 64e:	0001                	nop
 650:	02e57633          	remu	a2,a0,a4
 654:	00f688b3          	add	a7,a3,a5
 658:	0785                	addi	a5,a5,1
 65a:	9642                	add	a2,a2,a6
 65c:	00064603          	lbu	a2,0(a2)
 660:	02e55533          	divu	a0,a0,a4
 664:	00c88023          	sb	a2,0(a7)
 668:	fee794e3          	bne	a5,a4,650 <__neorv32_uart_itoa+0x14>
 66c:	8636                	mv	a2,a3
 66e:	4725                	li	a4,9
 670:	03000513          	li	a0,48
 674:	00964803          	lbu	a6,9(a2)
 678:	87ba                	mv	a5,a4
 67a:	177d                	addi	a4,a4,-1
 67c:	0742                	slli	a4,a4,0x10
 67e:	8341                	srli	a4,a4,0x10
 680:	00a81863          	bne	a6,a0,690 <__neorv32_uart_itoa+0x54>
 684:	000604a3          	sb	zero,9(a2)
 688:	167d                	addi	a2,a2,-1
 68a:	f76d                	bnez	a4,674 <__neorv32_uart_itoa+0x38>
 68c:	4781                	li	a5,0
 68e:	0001                	nop
 690:	97b6                	add	a5,a5,a3
 692:	4701                	li	a4,0
 694:	0007c603          	lbu	a2,0(a5)
 698:	ca11                	beqz	a2,6ac <__neorv32_uart_itoa+0x70>
 69a:	00170513          	addi	a0,a4,1
 69e:	972e                	add	a4,a4,a1
 6a0:	00c70023          	sb	a2,0(a4)
 6a4:	01051713          	slli	a4,a0,0x10
 6a8:	8341                	srli	a4,a4,0x10
 6aa:	0001                	nop
 6ac:	fff78613          	addi	a2,a5,-1
 6b0:	00f69863          	bne	a3,a5,6c0 <__neorv32_uart_itoa+0x84>
 6b4:	95ba                	add	a1,a1,a4
 6b6:	00058023          	sb	zero,0(a1)
 6ba:	0141                	addi	sp,sp,16
 6bc:	8082                	ret
 6be:	0001                	nop
 6c0:	87b2                	mv	a5,a2
 6c2:	bfc9                	j	694 <__neorv32_uart_itoa+0x58>
 6c4:	0000                	unimp
 6c6:	0000                	unimp

000006c8 <__neorv32_uart_tohex>:
 6c8:	6605                	lui	a2,0x1
 6ca:	00758693          	addi	a3,a1,7
 6ce:	4701                	li	a4,0
 6d0:	bf860613          	addi	a2,a2,-1032 # bf8 <symbols.0>
 6d4:	02000813          	li	a6,32
 6d8:	00e557b3          	srl	a5,a0,a4
 6dc:	8bbd                	andi	a5,a5,15
 6de:	97b2                	add	a5,a5,a2
 6e0:	0007c783          	lbu	a5,0(a5)
 6e4:	0711                	addi	a4,a4,4
 6e6:	16fd                	addi	a3,a3,-1
 6e8:	00f680a3          	sb	a5,1(a3)
 6ec:	ff0716e3          	bne	a4,a6,6d8 <__neorv32_uart_tohex+0x10>
 6f0:	00058423          	sb	zero,8(a1)
 6f4:	8082                	ret
 6f6:	0000                	unimp

000006f8 <neorv32_uart0_available>:
 6f8:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 6fc:	8149                	srli	a0,a0,0x12
 6fe:	8905                	andi	a0,a0,1
 700:	8082                	ret
 702:	0000                	unimp

00000704 <neorv32_uart0_setup>:
 704:	fa002023          	sw	zero,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 708:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 70c:	0506                	slli	a0,a0,0x1
 70e:	6685                	lui	a3,0x1
 710:	02a7d7b3          	divu	a5,a5,a0
 714:	4701                	li	a4,0
 716:	16f9                	addi	a3,a3,-2
 718:	07c2                	slli	a5,a5,0x10
 71a:	83c1                	srli	a5,a5,0x10
 71c:	02f6e263          	bltu	a3,a5,740 <neorv32_uart0_setup+0x3c>
 720:	8a0d                	andi	a2,a2,3
 722:	898d                	andi	a1,a1,3
 724:	17fd                	addi	a5,a5,-1
 726:	0652                	slli	a2,a2,0x14
 728:	8fd1                	or	a5,a5,a2
 72a:	05da                	slli	a1,a1,0x16
 72c:	0762                	slli	a4,a4,0x18
 72e:	8fcd                	or	a5,a5,a1
 730:	8fd9                	or	a5,a5,a4
 732:	10001737          	lui	a4,0x10001
 736:	8fd9                	or	a5,a5,a4
 738:	faf02023          	sw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 73c:	8082                	ret
 73e:	0001                	nop
 740:	ffe70513          	addi	a0,a4,-2 # 10000ffe <__crt0_copy_data_src_begin+0x100003f2>
 744:	0fd57513          	andi	a0,a0,253
 748:	e511                	bnez	a0,754 <neorv32_uart0_setup+0x50>
 74a:	838d                	srli	a5,a5,0x3
 74c:	0705                	addi	a4,a4,1
 74e:	0ff77713          	zext.b	a4,a4
 752:	b7e9                	j	71c <neorv32_uart0_setup+0x18>
 754:	8385                	srli	a5,a5,0x1
 756:	bfdd                	j	74c <neorv32_uart0_setup+0x48>
 758:	0000                	unimp
 75a:	0000                	unimp

0000075c <neorv32_uart0_putc>:
 75c:	000406b7          	lui	a3,0x40
 760:	fa000713          	li	a4,-96
 764:	431c                	lw	a5,0(a4)
 766:	8ff5                	and	a5,a5,a3
 768:	ffe5                	bnez	a5,760 <neorv32_uart0_putc+0x4>
 76a:	c348                	sw	a0,4(a4)
 76c:	8082                	ret
 76e:	0000                	unimp

00000770 <neorv32_uart0_print>:
 770:	1141                	addi	sp,sp,-16
 772:	c422                	sw	s0,8(sp)
 774:	c04a                	sw	s2,0(sp)
 776:	c606                	sw	ra,12(sp)
 778:	c226                	sw	s1,4(sp)
 77a:	842a                	mv	s0,a0
 77c:	4929                	li	s2,10
 77e:	0001                	nop
 780:	00044483          	lbu	s1,0(s0)
 784:	0405                	addi	s0,s0,1
 786:	e499                	bnez	s1,794 <neorv32_uart0_print+0x24>
 788:	40b2                	lw	ra,12(sp)
 78a:	4422                	lw	s0,8(sp)
 78c:	4492                	lw	s1,4(sp)
 78e:	4902                	lw	s2,0(sp)
 790:	0141                	addi	sp,sp,16
 792:	8082                	ret
 794:	01249463          	bne	s1,s2,79c <neorv32_uart0_print+0x2c>
 798:	4535                	li	a0,13
 79a:	37c9                	jal	75c <neorv32_uart0_putc>
 79c:	8526                	mv	a0,s1
 79e:	3f7d                	jal	75c <neorv32_uart0_putc>
 7a0:	b7c5                	j	780 <neorv32_uart0_print+0x10>
 7a2:	0000                	unimp

000007a4 <neorv32_uart0_printf>:
 7a4:	711d                	addi	sp,sp,-96
 7a6:	cabe                	sw	a5,84(sp)
 7a8:	00dc                	addi	a5,sp,68
 7aa:	dc22                	sw	s0,56(sp)
 7ac:	d84a                	sw	s2,48(sp)
 7ae:	d452                	sw	s4,40(sp)
 7b0:	d256                	sw	s5,36(sp)
 7b2:	d05a                	sw	s6,32(sp)
 7b4:	ce5e                	sw	s7,28(sp)
 7b6:	cc62                	sw	s8,24(sp)
 7b8:	ca66                	sw	s9,20(sp)
 7ba:	de06                	sw	ra,60(sp)
 7bc:	da26                	sw	s1,52(sp)
 7be:	d64e                	sw	s3,44(sp)
 7c0:	842a                	mv	s0,a0
 7c2:	c2ae                	sw	a1,68(sp)
 7c4:	c4b2                	sw	a2,72(sp)
 7c6:	c6b6                	sw	a3,76(sp)
 7c8:	c8ba                	sw	a4,80(sp)
 7ca:	ccc2                	sw	a6,88(sp)
 7cc:	cec6                	sw	a7,92(sp)
 7ce:	c03e                	sw	a5,0(sp)
 7d0:	02500a13          	li	s4,37
 7d4:	4aa9                	li	s5,10
 7d6:	07300913          	li	s2,115
 7da:	07500b13          	li	s6,117
 7de:	07800b93          	li	s7,120
 7e2:	06300c13          	li	s8,99
 7e6:	06900c93          	li	s9,105
 7ea:	0001                	nop
 7ec:	00044483          	lbu	s1,0(s0)
 7f0:	ec91                	bnez	s1,80c <neorv32_uart0_printf+0x68>
 7f2:	50f2                	lw	ra,60(sp)
 7f4:	5462                	lw	s0,56(sp)
 7f6:	54d2                	lw	s1,52(sp)
 7f8:	5942                	lw	s2,48(sp)
 7fa:	59b2                	lw	s3,44(sp)
 7fc:	5a22                	lw	s4,40(sp)
 7fe:	5a92                	lw	s5,36(sp)
 800:	5b02                	lw	s6,32(sp)
 802:	4bf2                	lw	s7,28(sp)
 804:	4c62                	lw	s8,24(sp)
 806:	4cd2                	lw	s9,20(sp)
 808:	6125                	addi	sp,sp,96
 80a:	8082                	ret
 80c:	09449c63          	bne	s1,s4,8a4 <neorv32_uart0_printf+0x100>
 810:	00240993          	addi	s3,s0,2
 814:	00144403          	lbu	s0,1(s0)
 818:	03240a63          	beq	s0,s2,84c <neorv32_uart0_printf+0xa8>
 81c:	00896c63          	bltu	s2,s0,834 <neorv32_uart0_printf+0x90>
 820:	05840063          	beq	s0,s8,860 <neorv32_uart0_printf+0xbc>
 824:	05940663          	beq	s0,s9,870 <neorv32_uart0_printf+0xcc>
 828:	02500513          	li	a0,37
 82c:	3f05                	jal	75c <neorv32_uart0_putc>
 82e:	8522                	mv	a0,s0
 830:	a835                	j	86c <neorv32_uart0_printf+0xc8>
 832:	0001                	nop
 834:	07640063          	beq	s0,s6,894 <neorv32_uart0_printf+0xf0>
 838:	ff7418e3          	bne	s0,s7,828 <neorv32_uart0_printf+0x84>
 83c:	4782                	lw	a5,0(sp)
 83e:	004c                	addi	a1,sp,4
 840:	4388                	lw	a0,0(a5)
 842:	00478713          	addi	a4,a5,4
 846:	c03a                	sw	a4,0(sp)
 848:	3541                	jal	6c8 <__neorv32_uart_tohex>
 84a:	a099                	j	890 <neorv32_uart0_printf+0xec>
 84c:	4782                	lw	a5,0(sp)
 84e:	4388                	lw	a0,0(a5)
 850:	00478713          	addi	a4,a5,4
 854:	c03a                	sw	a4,0(sp)
 856:	0001                	nop
 858:	3f21                	jal	770 <neorv32_uart0_print>
 85a:	0001                	nop
 85c:	844e                	mv	s0,s3
 85e:	b779                	j	7ec <neorv32_uart0_printf+0x48>
 860:	4782                	lw	a5,0(sp)
 862:	0007c503          	lbu	a0,0(a5)
 866:	00478713          	addi	a4,a5,4
 86a:	c03a                	sw	a4,0(sp)
 86c:	3dc5                	jal	75c <neorv32_uart0_putc>
 86e:	b7fd                	j	85c <neorv32_uart0_printf+0xb8>
 870:	4782                	lw	a5,0(sp)
 872:	4380                	lw	s0,0(a5)
 874:	00478713          	addi	a4,a5,4
 878:	c03a                	sw	a4,0(sp)
 87a:	00045763          	bgez	s0,888 <neorv32_uart0_printf+0xe4>
 87e:	02d00513          	li	a0,45
 882:	40800433          	neg	s0,s0
 886:	3dd9                	jal	75c <neorv32_uart0_putc>
 888:	004c                	addi	a1,sp,4
 88a:	8522                	mv	a0,s0
 88c:	3b45                	jal	63c <__neorv32_uart_itoa>
 88e:	0001                	nop
 890:	0048                	addi	a0,sp,4
 892:	b7d9                	j	858 <neorv32_uart0_printf+0xb4>
 894:	4782                	lw	a5,0(sp)
 896:	004c                	addi	a1,sp,4
 898:	00478713          	addi	a4,a5,4
 89c:	4388                	lw	a0,0(a5)
 89e:	c03a                	sw	a4,0(sp)
 8a0:	b7f5                	j	88c <neorv32_uart0_printf+0xe8>
 8a2:	0001                	nop
 8a4:	01549463          	bne	s1,s5,8ac <neorv32_uart0_printf+0x108>
 8a8:	4535                	li	a0,13
 8aa:	3d4d                	jal	75c <neorv32_uart0_putc>
 8ac:	00140993          	addi	s3,s0,1
 8b0:	8526                	mv	a0,s1
 8b2:	bf6d                	j	86c <neorv32_uart0_printf+0xc8>
 8b4:	0000                	unimp
 8b6:	0000                	unimp
