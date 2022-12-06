
.\.pio\build\ATtiny3227\firmware.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 3c 00 	jmp	0x78	; 0x78 <__ctors_end>
   4:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
   8:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
   c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  10:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  14:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  18:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  1c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  20:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  24:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  28:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  2c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  30:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  34:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  38:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  3c:	0c 94 4f 03 	jmp	0x69e	; 0x69e <__vector_15>
  40:	0c 94 73 03 	jmp	0x6e6	; 0x6e6 <__vector_16>
  44:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  48:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  4c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  50:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  54:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  58:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  5c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  60:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  64:	0c 94 27 03 	jmp	0x64e	; 0x64e <__vector_25>
  68:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  6c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  70:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  74:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>

00000078 <__ctors_end>:
  78:	11 24       	eor	r1, r1
  7a:	1f be       	out	0x3f, r1	; 63
  7c:	cf ef       	ldi	r28, 0xFF	; 255
  7e:	cd bf       	out	0x3d, r28	; 61
  80:	df e3       	ldi	r29, 0x3F	; 63
  82:	de bf       	out	0x3e, r29	; 62

00000084 <_Z15_initThreeStuffv>:
  84:	80 91 40 00 	lds	r24, 0x0040	; 0x800040 <I2C0_fsmStateTable+0x7f750e>
  88:	80 93 40 00 	sts	0x0040, r24	; 0x800040 <I2C0_fsmStateTable+0x7f750e>
  8c:	81 11       	cpse	r24, r1
  8e:	05 c0       	rjmp	.+10     	; 0x9a <_Z15_initThreeStuffv+0x16>
  90:	98 ed       	ldi	r25, 0xD8	; 216
  92:	21 e0       	ldi	r18, 0x01	; 1
  94:	94 bf       	out	0x34, r25	; 52
  96:	20 93 41 00 	sts	0x0041, r18	; 0x800041 <I2C0_fsmStateTable+0x7f750f>
  9a:	8c bb       	out	0x1c, r24	; 28

0000009c <__do_clear_bss>:
  9c:	26 e3       	ldi	r18, 0x36	; 54
  9e:	a0 e0       	ldi	r26, 0x00	; 0
  a0:	b4 e3       	ldi	r27, 0x34	; 52
  a2:	01 c0       	rjmp	.+2      	; 0xa6 <.do_clear_bss_start>

000000a4 <.do_clear_bss_loop>:
  a4:	1d 92       	st	X+, r1

000000a6 <.do_clear_bss_start>:
  a6:	a4 33       	cpi	r26, 0x34	; 52
  a8:	b2 07       	cpc	r27, r18
  aa:	e1 f7       	brne	.-8      	; 0xa4 <.do_clear_bss_loop>
  ac:	0e 94 d3 03 	call	0x7a6	; 0x7a6 <main>
  b0:	0c 94 97 05 	jmp	0xb2e	; 0xb2e <_exit>

000000b4 <__bad_interrupt>:
  b4:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

000000b8 <I2C0_RETURN_STOP>:
  b8:	81 e0       	ldi	r24, 0x01	; 1
  ba:	90 e0       	ldi	r25, 0x00	; 0
  bc:	08 95       	ret

000000be <I2C0_RETURN_RESET>:
  be:	85 e0       	ldi	r24, 0x05	; 5
  c0:	90 e0       	ldi	r25, 0x00	; 0
  c2:	08 95       	ret

000000c4 <I2C0_SetRestartWriteCallback>:
  c4:	83 e0       	ldi	r24, 0x03	; 3
  c6:	90 e0       	ldi	r25, 0x00	; 0
  c8:	08 95       	ret

000000ca <I2C0_MasterSendNack>:
  ca:	e0 ea       	ldi	r30, 0xA0	; 160
  cc:	f8 e0       	ldi	r31, 0x08	; 8
  ce:	84 81       	ldd	r24, Z+4	; 0x04
  d0:	84 60       	ori	r24, 0x04	; 4
  d2:	84 83       	std	Z+4, r24	; 0x04
  d4:	08 95       	ret

000000d6 <I2C0_MasterResetBus>:
  d6:	e0 ea       	ldi	r30, 0xA0	; 160
  d8:	f8 e0       	ldi	r31, 0x08	; 8
  da:	84 81       	ldd	r24, Z+4	; 0x04
  dc:	88 60       	ori	r24, 0x08	; 8
  de:	84 83       	std	Z+4, r24	; 0x04
  e0:	85 81       	ldd	r24, Z+5	; 0x05
  e2:	81 60       	ori	r24, 0x01	; 1
  e4:	85 83       	std	Z+5, r24	; 0x05
  e6:	08 95       	ret

000000e8 <I2C0_MasterClearIrq>:
  e8:	e0 ea       	ldi	r30, 0xA0	; 160
  ea:	f8 e0       	ldi	r31, 0x08	; 8
  ec:	85 81       	ldd	r24, Z+5	; 0x05
  ee:	80 6c       	ori	r24, 0xC0	; 192
  f0:	85 83       	std	Z+5, r24	; 0x05
  f2:	08 95       	ret

000000f4 <I2C0_Open.part.1>:
  f4:	ea e0       	ldi	r30, 0x0A	; 10
  f6:	f6 e3       	ldi	r31, 0x36	; 54
  f8:	84 8f       	std	Z+28, r24	; 0x1c
  fa:	af e2       	ldi	r26, 0x2F	; 47
  fc:	b6 e3       	ldi	r27, 0x36	; 54
  fe:	8c 91       	ld	r24, X
 100:	88 7f       	andi	r24, 0xF8	; 248
 102:	2e e0       	ldi	r18, 0x0E	; 14
 104:	30 e0       	ldi	r19, 0x00	; 0
 106:	21 a3       	std	Z+33, r18	; 0x21
 108:	32 a3       	std	Z+34, r19	; 0x22
 10a:	24 ef       	ldi	r18, 0xF4	; 244
 10c:	31 e0       	ldi	r19, 0x01	; 1
 10e:	22 8f       	std	Z+26, r18	; 0x1a
 110:	33 8f       	std	Z+27, r19	; 0x1b
 112:	84 60       	ori	r24, 0x04	; 4
 114:	88 60       	ori	r24, 0x08	; 8
 116:	8c 93       	st	X, r24
 118:	8c e5       	ldi	r24, 0x5C	; 92
 11a:	90 e0       	ldi	r25, 0x00	; 0
 11c:	80 83       	st	Z, r24
 11e:	91 83       	std	Z+1, r25	; 0x01
 120:	14 86       	std	Z+12, r1	; 0x0c
 122:	15 86       	std	Z+13, r1	; 0x0d
 124:	82 83       	std	Z+2, r24	; 0x02
 126:	93 83       	std	Z+3, r25	; 0x03
 128:	16 86       	std	Z+14, r1	; 0x0e
 12a:	17 86       	std	Z+15, r1	; 0x0f
 12c:	84 83       	std	Z+4, r24	; 0x04
 12e:	95 83       	std	Z+5, r25	; 0x05
 130:	10 8a       	std	Z+16, r1	; 0x10
 132:	11 8a       	std	Z+17, r1	; 0x11
 134:	86 83       	std	Z+6, r24	; 0x06
 136:	97 83       	std	Z+7, r25	; 0x07
 138:	12 8a       	std	Z+18, r1	; 0x12
 13a:	13 8a       	std	Z+19, r1	; 0x13
 13c:	8f e5       	ldi	r24, 0x5F	; 95
 13e:	90 e0       	ldi	r25, 0x00	; 0
 140:	80 87       	std	Z+8, r24	; 0x08
 142:	91 87       	std	Z+9, r25	; 0x09
 144:	14 8a       	std	Z+20, r1	; 0x14
 146:	15 8a       	std	Z+21, r1	; 0x15
 148:	0e 94 6b 00 	call	0xd6	; 0xd6 <I2C0_MasterResetBus>
 14c:	0e 94 74 00 	call	0xe8	; 0xe8 <I2C0_MasterClearIrq>
 150:	e0 ea       	ldi	r30, 0xA0	; 160
 152:	f8 e0       	ldi	r31, 0x08	; 8
 154:	83 81       	ldd	r24, Z+3	; 0x03
 156:	80 6c       	ori	r24, 0xC0	; 192
 158:	83 83       	std	Z+3, r24	; 0x03
 15a:	90 e0       	ldi	r25, 0x00	; 0
 15c:	80 e0       	ldi	r24, 0x00	; 0
 15e:	08 95       	ret

00000160 <I2C0_MasterIsr>:
 160:	0e 94 74 00 	call	0xe8	; 0xe8 <I2C0_MasterClearIrq>
 164:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 168:	80 ff       	sbrs	r24, 0
 16a:	0a c0       	rjmp	.+20     	; 0x180 <I2C0_MasterIsr+0x20>
 16c:	80 91 a5 08 	lds	r24, 0x08A5	; 0x8008a5 <I2C0_fsmStateTable+0x7f7d73>
 170:	84 ff       	sbrs	r24, 4
 172:	06 c0       	rjmp	.+12     	; 0x180 <I2C0_MasterIsr+0x20>
 174:	8f e0       	ldi	r24, 0x0F	; 15
 176:	90 e0       	ldi	r25, 0x00	; 0
 178:	80 93 2b 36 	sts	0x362B, r24	; 0x80362b <I2C0_status+0x21>
 17c:	90 93 2c 36 	sts	0x362C, r25	; 0x80362c <I2C0_status+0x22>
 180:	80 91 a5 08 	lds	r24, 0x08A5	; 0x8008a5 <I2C0_fsmStateTable+0x7f7d73>
 184:	83 ff       	sbrs	r24, 3
 186:	06 c0       	rjmp	.+12     	; 0x194 <I2C0_MasterIsr+0x34>
 188:	80 e1       	ldi	r24, 0x10	; 16
 18a:	90 e0       	ldi	r25, 0x00	; 0
 18c:	80 93 2b 36 	sts	0x362B, r24	; 0x80362b <I2C0_status+0x21>
 190:	90 93 2c 36 	sts	0x362C, r25	; 0x80362c <I2C0_status+0x22>
 194:	80 91 a5 08 	lds	r24, 0x08A5	; 0x8008a5 <I2C0_fsmStateTable+0x7f7d73>
 198:	82 ff       	sbrs	r24, 2
 19a:	06 c0       	rjmp	.+12     	; 0x1a8 <I2C0_MasterIsr+0x48>
 19c:	81 e1       	ldi	r24, 0x11	; 17
 19e:	90 e0       	ldi	r25, 0x00	; 0
 1a0:	80 93 2b 36 	sts	0x362B, r24	; 0x80362b <I2C0_status+0x21>
 1a4:	90 93 2c 36 	sts	0x362C, r25	; 0x80362c <I2C0_status+0x22>
 1a8:	e0 91 2b 36 	lds	r30, 0x362B	; 0x80362b <I2C0_status+0x21>
 1ac:	f0 91 2c 36 	lds	r31, 0x362C	; 0x80362c <I2C0_status+0x22>
 1b0:	ee 0f       	add	r30, r30
 1b2:	ff 1f       	adc	r31, r31
 1b4:	ee 5c       	subi	r30, 0xCE	; 206
 1b6:	f4 47       	sbci	r31, 0x74	; 116
 1b8:	01 90       	ld	r0, Z+
 1ba:	f0 81       	ld	r31, Z
 1bc:	e0 2d       	mov	r30, r0
 1be:	09 95       	icall
 1c0:	80 93 2b 36 	sts	0x362B, r24	; 0x80362b <I2C0_status+0x21>
 1c4:	90 93 2c 36 	sts	0x362C, r25	; 0x80362c <I2C0_status+0x22>
 1c8:	08 95       	ret

000001ca <I2C0_DO_BUS_ERROR>:
 1ca:	0e 94 6b 00 	call	0xd6	; 0xd6 <I2C0_MasterResetBus>
 1ce:	ef e2       	ldi	r30, 0x2F	; 47
 1d0:	f6 e3       	ldi	r31, 0x36	; 54
 1d2:	80 81       	ld	r24, Z
 1d4:	8d 7f       	andi	r24, 0xFD	; 253
 1d6:	80 83       	st	Z, r24
 1d8:	82 e0       	ldi	r24, 0x02	; 2
 1da:	90 e0       	ldi	r25, 0x00	; 0
 1dc:	80 93 2d 36 	sts	0x362D, r24	; 0x80362d <I2C0_status+0x23>
 1e0:	90 93 2e 36 	sts	0x362E, r25	; 0x80362e <I2C0_status+0x24>
 1e4:	8e e0       	ldi	r24, 0x0E	; 14
 1e6:	90 e0       	ldi	r25, 0x00	; 0
 1e8:	08 95       	ret

000001ea <I2C0_DO_RX_NACK_RESTART>:
 1ea:	0e 94 65 00 	call	0xca	; 0xca <I2C0_MasterSendNack>
 1ee:	88 e0       	ldi	r24, 0x08	; 8
 1f0:	90 e0       	ldi	r25, 0x00	; 0
 1f2:	08 95       	ret

000001f4 <I2C0_DO_RX_NACK_STOP>:
 1f4:	0e 94 65 00 	call	0xca	; 0xca <I2C0_MasterSendNack>
 1f8:	e0 ea       	ldi	r30, 0xA0	; 160
 1fa:	f8 e0       	ldi	r31, 0x08	; 8
 1fc:	84 81       	ldd	r24, Z+4	; 0x04
 1fe:	83 60       	ori	r24, 0x03	; 3
 200:	84 83       	std	Z+4, r24	; 0x04
 202:	ef e2       	ldi	r30, 0x2F	; 47
 204:	f6 e3       	ldi	r31, 0x36	; 54
 206:	80 81       	ld	r24, Z
 208:	8d 7f       	andi	r24, 0xFD	; 253
 20a:	80 83       	st	Z, r24
 20c:	10 92 2d 36 	sts	0x362D, r1	; 0x80362d <I2C0_status+0x23>
 210:	10 92 2e 36 	sts	0x362E, r1	; 0x80362e <I2C0_status+0x24>
 214:	90 e0       	ldi	r25, 0x00	; 0
 216:	80 e0       	ldi	r24, 0x00	; 0
 218:	08 95       	ret

0000021a <I2C0_DO_RX>:
 21a:	cf 93       	push	r28
 21c:	df 93       	push	r29
 21e:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 222:	8e 7f       	andi	r24, 0xFE	; 254
 224:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 228:	c0 91 29 36 	lds	r28, 0x3629	; 0x803629 <I2C0_status+0x1f>
 22c:	d0 91 2a 36 	lds	r29, 0x362A	; 0x80362a <I2C0_status+0x20>
 230:	c1 30       	cpi	r28, 0x01	; 1
 232:	d1 05       	cpc	r29, r1
 234:	01 f5       	brne	.+64     	; 0x276 <I2C0_DO_RX+0x5c>
 236:	0e 94 65 00 	call	0xca	; 0xca <I2C0_MasterSendNack>
 23a:	21 97       	sbiw	r28, 0x01	; 1
 23c:	c0 93 29 36 	sts	0x3629, r28	; 0x803629 <I2C0_status+0x1f>
 240:	d0 93 2a 36 	sts	0x362A, r29	; 0x80362a <I2C0_status+0x20>
 244:	e0 91 27 36 	lds	r30, 0x3627	; 0x803627 <I2C0_status+0x1d>
 248:	f0 91 28 36 	lds	r31, 0x3628	; 0x803628 <I2C0_status+0x1e>
 24c:	cf 01       	movw	r24, r30
 24e:	01 96       	adiw	r24, 0x01	; 1
 250:	20 91 a8 08 	lds	r18, 0x08A8	; 0x8008a8 <I2C0_fsmStateTable+0x7f7d76>
 254:	20 83       	st	Z, r18
 256:	80 93 27 36 	sts	0x3627, r24	; 0x803627 <I2C0_status+0x1d>
 25a:	90 93 28 36 	sts	0x3628, r25	; 0x803628 <I2C0_status+0x1e>
 25e:	cd 2b       	or	r28, r29
 260:	81 f0       	breq	.+32     	; 0x282 <I2C0_DO_RX+0x68>
 262:	80 91 a4 08 	lds	r24, 0x08A4	; 0x8008a4 <I2C0_fsmStateTable+0x7f7d72>
 266:	82 60       	ori	r24, 0x02	; 2
 268:	80 93 a4 08 	sts	0x08A4, r24	; 0x8008a4 <I2C0_fsmStateTable+0x7f7d72>
 26c:	84 e0       	ldi	r24, 0x04	; 4
 26e:	90 e0       	ldi	r25, 0x00	; 0
 270:	df 91       	pop	r29
 272:	cf 91       	pop	r28
 274:	08 95       	ret
 276:	80 91 a4 08 	lds	r24, 0x08A4	; 0x8008a4 <I2C0_fsmStateTable+0x7f7d72>
 27a:	8b 7f       	andi	r24, 0xFB	; 251
 27c:	80 93 a4 08 	sts	0x08A4, r24	; 0x8008a4 <I2C0_fsmStateTable+0x7f7d72>
 280:	dc cf       	rjmp	.-72     	; 0x23a <I2C0_DO_RX+0x20>
 282:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 286:	88 60       	ori	r24, 0x08	; 8
 288:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 28c:	e0 91 0a 36 	lds	r30, 0x360A	; 0x80360a <I2C0_status>
 290:	f0 91 0b 36 	lds	r31, 0x360B	; 0x80360b <I2C0_status+0x1>
 294:	80 91 16 36 	lds	r24, 0x3616	; 0x803616 <I2C0_status+0xc>
 298:	90 91 17 36 	lds	r25, 0x3617	; 0x803617 <I2C0_status+0xd>
 29c:	09 95       	icall
 29e:	02 97       	sbiw	r24, 0x02	; 2
 2a0:	02 97       	sbiw	r24, 0x02	; 2
 2a2:	28 f4       	brcc	.+10     	; 0x2ae <I2C0_DO_RX+0x94>
 2a4:	0e 94 65 00 	call	0xca	; 0xca <I2C0_MasterSendNack>
 2a8:	88 e0       	ldi	r24, 0x08	; 8
 2aa:	90 e0       	ldi	r25, 0x00	; 0
 2ac:	e1 cf       	rjmp	.-62     	; 0x270 <I2C0_DO_RX+0x56>
 2ae:	df 91       	pop	r29
 2b0:	cf 91       	pop	r28
 2b2:	0c 94 fa 00 	jmp	0x1f4	; 0x1f4 <I2C0_DO_RX_NACK_STOP>

000002b6 <I2C0_DO_TX_ACK>:
 2b6:	e0 ea       	ldi	r30, 0xA0	; 160
 2b8:	f8 e0       	ldi	r31, 0x08	; 8
 2ba:	84 81       	ldd	r24, Z+4	; 0x04
 2bc:	8b 7f       	andi	r24, 0xFB	; 251
 2be:	84 83       	std	Z+4, r24	; 0x04
 2c0:	83 e0       	ldi	r24, 0x03	; 3
 2c2:	90 e0       	ldi	r25, 0x00	; 0
 2c4:	08 95       	ret

000002c6 <I2C0_DO_RX_ACK>:
 2c6:	e0 ea       	ldi	r30, 0xA0	; 160
 2c8:	f8 e0       	ldi	r31, 0x08	; 8
 2ca:	84 81       	ldd	r24, Z+4	; 0x04
 2cc:	8b 7f       	andi	r24, 0xFB	; 251
 2ce:	84 83       	std	Z+4, r24	; 0x04
 2d0:	84 e0       	ldi	r24, 0x04	; 4
 2d2:	90 e0       	ldi	r25, 0x00	; 0
 2d4:	08 95       	ret

000002d6 <I2C0_DO_SEND_ADR_WRITE>:
 2d6:	ef e2       	ldi	r30, 0x2F	; 47
 2d8:	f6 e3       	ldi	r31, 0x36	; 54
 2da:	80 81       	ld	r24, Z
 2dc:	81 60       	ori	r24, 0x01	; 1
 2de:	80 83       	st	Z, r24
 2e0:	80 91 26 36 	lds	r24, 0x3626	; 0x803626 <I2C0_status+0x1c>
 2e4:	88 0f       	add	r24, r24
 2e6:	80 93 a7 08 	sts	0x08A7, r24	; 0x8008a7 <I2C0_fsmStateTable+0x7f7d75>
 2ea:	83 e0       	ldi	r24, 0x03	; 3
 2ec:	90 e0       	ldi	r25, 0x00	; 0
 2ee:	08 95       	ret

000002f0 <I2C0_DO_SEND_ADR_READ>:
 2f0:	ef e2       	ldi	r30, 0x2F	; 47
 2f2:	f6 e3       	ldi	r31, 0x36	; 54
 2f4:	80 81       	ld	r24, Z
 2f6:	81 60       	ori	r24, 0x01	; 1
 2f8:	80 83       	st	Z, r24
 2fa:	80 91 26 36 	lds	r24, 0x3626	; 0x803626 <I2C0_status+0x1c>
 2fe:	88 0f       	add	r24, r24
 300:	81 60       	ori	r24, 0x01	; 1
 302:	80 93 a7 08 	sts	0x08A7, r24	; 0x8008a7 <I2C0_fsmStateTable+0x7f7d75>
 306:	84 e0       	ldi	r24, 0x04	; 4
 308:	90 e0       	ldi	r25, 0x00	; 0
 30a:	08 95       	ret

0000030c <I2C0_DO_SEND_STOP>:
 30c:	e0 ea       	ldi	r30, 0xA0	; 160
 30e:	f8 e0       	ldi	r31, 0x08	; 8
 310:	84 81       	ldd	r24, Z+4	; 0x04
 312:	83 60       	ori	r24, 0x03	; 3
 314:	84 83       	std	Z+4, r24	; 0x04
 316:	ef e2       	ldi	r30, 0x2F	; 47
 318:	f6 e3       	ldi	r31, 0x36	; 54
 31a:	80 81       	ld	r24, Z
 31c:	8d 7f       	andi	r24, 0xFD	; 253
 31e:	80 83       	st	Z, r24
 320:	10 92 2d 36 	sts	0x362D, r1	; 0x80362d <I2C0_status+0x23>
 324:	10 92 2e 36 	sts	0x362E, r1	; 0x80362e <I2C0_status+0x24>
 328:	90 e0       	ldi	r25, 0x00	; 0
 32a:	80 e0       	ldi	r24, 0x00	; 0
 32c:	08 95       	ret

0000032e <I2C0_DO_TX>:
 32e:	80 91 a5 08 	lds	r24, 0x08A5	; 0x8008a5 <I2C0_fsmStateTable+0x7f7d73>
 332:	84 ff       	sbrs	r24, 4
 334:	14 c0       	rjmp	.+40     	; 0x35e <I2C0_DO_TX+0x30>
 336:	e0 91 10 36 	lds	r30, 0x3610	; 0x803610 <I2C0_status+0x6>
 33a:	f0 91 11 36 	lds	r31, 0x3611	; 0x803611 <I2C0_status+0x7>
 33e:	80 91 1c 36 	lds	r24, 0x361C	; 0x80361c <I2C0_status+0x12>
 342:	90 91 1d 36 	lds	r25, 0x361D	; 0x80361d <I2C0_status+0x13>
 346:	09 95       	icall
 348:	82 30       	cpi	r24, 0x02	; 2
 34a:	91 05       	cpc	r25, r1
 34c:	21 f0       	breq	.+8      	; 0x356 <I2C0_DO_TX+0x28>
 34e:	03 97       	sbiw	r24, 0x03	; 3
 350:	21 f0       	breq	.+8      	; 0x35a <I2C0_DO_TX+0x2c>
 352:	0c 94 86 01 	jmp	0x30c	; 0x30c <I2C0_DO_SEND_STOP>
 356:	0c 94 78 01 	jmp	0x2f0	; 0x2f0 <I2C0_DO_SEND_ADR_READ>
 35a:	0c 94 6b 01 	jmp	0x2d6	; 0x2d6 <I2C0_DO_SEND_ADR_WRITE>
 35e:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 362:	8e 7f       	andi	r24, 0xFE	; 254
 364:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 368:	e0 91 27 36 	lds	r30, 0x3627	; 0x803627 <I2C0_status+0x1d>
 36c:	f0 91 28 36 	lds	r31, 0x3628	; 0x803628 <I2C0_status+0x1e>
 370:	cf 01       	movw	r24, r30
 372:	01 96       	adiw	r24, 0x01	; 1
 374:	80 93 27 36 	sts	0x3627, r24	; 0x803627 <I2C0_status+0x1d>
 378:	90 93 28 36 	sts	0x3628, r25	; 0x803628 <I2C0_status+0x1e>
 37c:	80 81       	ld	r24, Z
 37e:	80 93 a8 08 	sts	0x08A8, r24	; 0x8008a8 <I2C0_fsmStateTable+0x7f7d76>
 382:	80 91 29 36 	lds	r24, 0x3629	; 0x803629 <I2C0_status+0x1f>
 386:	90 91 2a 36 	lds	r25, 0x362A	; 0x80362a <I2C0_status+0x20>
 38a:	01 97       	sbiw	r24, 0x01	; 1
 38c:	80 93 29 36 	sts	0x3629, r24	; 0x803629 <I2C0_status+0x1f>
 390:	90 93 2a 36 	sts	0x362A, r25	; 0x80362a <I2C0_status+0x20>
 394:	89 2b       	or	r24, r25
 396:	19 f4       	brne	.+6      	; 0x39e <I2C0_DO_TX+0x70>
 398:	85 e0       	ldi	r24, 0x05	; 5
 39a:	90 e0       	ldi	r25, 0x00	; 0
 39c:	08 95       	ret
 39e:	83 e0       	ldi	r24, 0x03	; 3
 3a0:	90 e0       	ldi	r25, 0x00	; 0
 3a2:	08 95       	ret

000003a4 <I2C0_DO_TX_EMPTY>:
 3a4:	80 91 a5 08 	lds	r24, 0x08A5	; 0x8008a5 <I2C0_fsmStateTable+0x7f7d73>
 3a8:	84 ff       	sbrs	r24, 4
 3aa:	10 c0       	rjmp	.+32     	; 0x3cc <I2C0_DO_TX_EMPTY+0x28>
 3ac:	e0 91 10 36 	lds	r30, 0x3610	; 0x803610 <I2C0_status+0x6>
 3b0:	f0 91 11 36 	lds	r31, 0x3611	; 0x803611 <I2C0_status+0x7>
 3b4:	80 91 1c 36 	lds	r24, 0x361C	; 0x80361c <I2C0_status+0x12>
 3b8:	90 91 1d 36 	lds	r25, 0x361D	; 0x80361d <I2C0_status+0x13>
 3bc:	09 95       	icall
 3be:	82 30       	cpi	r24, 0x02	; 2
 3c0:	91 05       	cpc	r25, r1
 3c2:	d1 f0       	breq	.+52     	; 0x3f8 <I2C0_DO_TX_EMPTY+0x54>
 3c4:	03 97       	sbiw	r24, 0x03	; 3
 3c6:	d1 f0       	breq	.+52     	; 0x3fc <I2C0_DO_TX_EMPTY+0x58>
 3c8:	0c 94 86 01 	jmp	0x30c	; 0x30c <I2C0_DO_SEND_STOP>
 3cc:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 3d0:	88 60       	ori	r24, 0x08	; 8
 3d2:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 3d6:	e0 91 0a 36 	lds	r30, 0x360A	; 0x80360a <I2C0_status>
 3da:	f0 91 0b 36 	lds	r31, 0x360B	; 0x80360b <I2C0_status+0x1>
 3de:	80 91 16 36 	lds	r24, 0x3616	; 0x803616 <I2C0_status+0xc>
 3e2:	90 91 17 36 	lds	r25, 0x3617	; 0x803617 <I2C0_status+0xd>
 3e6:	09 95       	icall
 3e8:	83 30       	cpi	r24, 0x03	; 3
 3ea:	91 05       	cpc	r25, r1
 3ec:	39 f0       	breq	.+14     	; 0x3fc <I2C0_DO_TX_EMPTY+0x58>
 3ee:	84 30       	cpi	r24, 0x04	; 4
 3f0:	91 05       	cpc	r25, r1
 3f2:	31 f0       	breq	.+12     	; 0x400 <__LOCK_REGION_LENGTH__>
 3f4:	02 97       	sbiw	r24, 0x02	; 2
 3f6:	41 f7       	brne	.-48     	; 0x3c8 <I2C0_DO_TX_EMPTY+0x24>
 3f8:	0c 94 78 01 	jmp	0x2f0	; 0x2f0 <I2C0_DO_SEND_ADR_READ>
 3fc:	0c 94 6b 01 	jmp	0x2d6	; 0x2d6 <I2C0_DO_SEND_ADR_WRITE>
 400:	0c 94 97 01 	jmp	0x32e	; 0x32e <I2C0_DO_TX>

00000404 <I2C0_DO_ADDRESS_NACK>:
 404:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 408:	8e 7f       	andi	r24, 0xFE	; 254
 40a:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 40e:	82 e0       	ldi	r24, 0x02	; 2
 410:	90 e0       	ldi	r25, 0x00	; 0
 412:	80 93 2d 36 	sts	0x362D, r24	; 0x80362d <I2C0_status+0x23>
 416:	90 93 2e 36 	sts	0x362E, r25	; 0x80362e <I2C0_status+0x24>
 41a:	e0 91 0e 36 	lds	r30, 0x360E	; 0x80360e <I2C0_status+0x4>
 41e:	f0 91 0f 36 	lds	r31, 0x360F	; 0x80360f <I2C0_status+0x5>
 422:	80 91 1a 36 	lds	r24, 0x361A	; 0x80361a <I2C0_status+0x10>
 426:	90 91 1b 36 	lds	r25, 0x361B	; 0x80361b <I2C0_status+0x11>
 42a:	09 95       	icall
 42c:	82 30       	cpi	r24, 0x02	; 2
 42e:	91 05       	cpc	r25, r1
 430:	21 f0       	breq	.+8      	; 0x43a <I2C0_DO_ADDRESS_NACK+0x36>
 432:	03 97       	sbiw	r24, 0x03	; 3
 434:	21 f0       	breq	.+8      	; 0x43e <I2C0_DO_ADDRESS_NACK+0x3a>
 436:	0c 94 86 01 	jmp	0x30c	; 0x30c <I2C0_DO_SEND_STOP>
 43a:	0c 94 78 01 	jmp	0x2f0	; 0x2f0 <I2C0_DO_SEND_ADR_READ>
 43e:	0c 94 6b 01 	jmp	0x2d6	; 0x2d6 <I2C0_DO_SEND_ADR_WRITE>

00000442 <I2C0_DO_SEND_RESTART>:
 442:	0c 94 78 01 	jmp	0x2f0	; 0x2f0 <I2C0_DO_SEND_ADR_READ>

00000446 <I2C0_DO_SEND_RESTART_WRITE>:
 446:	0c 94 6b 01 	jmp	0x2d6	; 0x2d6 <I2C0_DO_SEND_ADR_WRITE>

0000044a <I2C0_DO_SEND_RESTART_READ>:
 44a:	0c 94 78 01 	jmp	0x2f0	; 0x2f0 <I2C0_DO_SEND_ADR_READ>

0000044e <I2C0_DO_IDLE>:
 44e:	ef e2       	ldi	r30, 0x2F	; 47
 450:	f6 e3       	ldi	r31, 0x36	; 54
 452:	80 81       	ld	r24, Z
 454:	8d 7f       	andi	r24, 0xFD	; 253
 456:	80 83       	st	Z, r24
 458:	10 92 2d 36 	sts	0x362D, r1	; 0x80362d <I2C0_status+0x23>
 45c:	10 92 2e 36 	sts	0x362E, r1	; 0x80362e <I2C0_status+0x24>
 460:	90 e0       	ldi	r25, 0x00	; 0
 462:	80 e0       	ldi	r24, 0x00	; 0
 464:	08 95       	ret

00000466 <I2C0_DO_RESET>:
 466:	0e 94 6b 00 	call	0xd6	; 0xd6 <I2C0_MasterResetBus>
 46a:	ef e2       	ldi	r30, 0x2F	; 47
 46c:	f6 e3       	ldi	r31, 0x36	; 54
 46e:	80 81       	ld	r24, Z
 470:	8d 7f       	andi	r24, 0xFD	; 253
 472:	80 83       	st	Z, r24
 474:	10 92 2d 36 	sts	0x362D, r1	; 0x80362d <I2C0_status+0x23>
 478:	10 92 2e 36 	sts	0x362E, r1	; 0x80362e <I2C0_status+0x24>
 47c:	8e e0       	ldi	r24, 0x0E	; 14
 47e:	90 e0       	ldi	r25, 0x00	; 0
 480:	08 95       	ret

00000482 <I2C0_DO_BUS_COLLISION>:
 482:	0e 94 74 00 	call	0xe8	; 0xe8 <I2C0_MasterClearIrq>
 486:	82 e0       	ldi	r24, 0x02	; 2
 488:	90 e0       	ldi	r25, 0x00	; 0
 48a:	80 93 2d 36 	sts	0x362D, r24	; 0x80362d <I2C0_status+0x23>
 48e:	90 93 2e 36 	sts	0x362E, r25	; 0x80362e <I2C0_status+0x24>
 492:	e0 91 0c 36 	lds	r30, 0x360C	; 0x80360c <I2C0_status+0x2>
 496:	f0 91 0d 36 	lds	r31, 0x360D	; 0x80360d <I2C0_status+0x3>
 49a:	80 91 18 36 	lds	r24, 0x3618	; 0x803618 <I2C0_status+0xe>
 49e:	90 91 19 36 	lds	r25, 0x3619	; 0x803619 <I2C0_status+0xf>
 4a2:	09 95       	icall
 4a4:	82 30       	cpi	r24, 0x02	; 2
 4a6:	91 05       	cpc	r25, r1
 4a8:	21 f0       	breq	.+8      	; 0x4b2 <I2C0_DO_BUS_COLLISION+0x30>
 4aa:	03 97       	sbiw	r24, 0x03	; 3
 4ac:	21 f0       	breq	.+8      	; 0x4b6 <I2C0_DO_BUS_COLLISION+0x34>
 4ae:	0c 94 33 02 	jmp	0x466	; 0x466 <I2C0_DO_RESET>
 4b2:	0c 94 78 01 	jmp	0x2f0	; 0x2f0 <I2C0_DO_SEND_ADR_READ>
 4b6:	0c 94 6b 01 	jmp	0x2d6	; 0x2d6 <I2C0_DO_SEND_ADR_WRITE>

000004ba <I2C0_Close>:
 4ba:	80 91 a5 08 	lds	r24, 0x08A5	; 0x8008a5 <I2C0_fsmStateTable+0x7f7d73>
 4be:	82 ff       	sbrs	r24, 2
 4c0:	0b c0       	rjmp	.+22     	; 0x4d8 <I2C0_Close+0x1e>
 4c2:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 4c6:	8d 7f       	andi	r24, 0xFD	; 253
 4c8:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 4cc:	82 e0       	ldi	r24, 0x02	; 2
 4ce:	90 e0       	ldi	r25, 0x00	; 0
 4d0:	80 93 2d 36 	sts	0x362D, r24	; 0x80362d <I2C0_status+0x23>
 4d4:	90 93 2e 36 	sts	0x362E, r25	; 0x80362e <I2C0_status+0x24>
 4d8:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 4dc:	81 fd       	sbrc	r24, 1
 4de:	12 c0       	rjmp	.+36     	; 0x504 <I2C0_Close+0x4a>
 4e0:	8b 7f       	andi	r24, 0xFB	; 251
 4e2:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 4e6:	8f ef       	ldi	r24, 0xFF	; 255
 4e8:	80 93 26 36 	sts	0x3626, r24	; 0x803626 <I2C0_status+0x1c>
 4ec:	0e 94 74 00 	call	0xe8	; 0xe8 <I2C0_MasterClearIrq>
 4f0:	80 91 a3 08 	lds	r24, 0x08A3	; 0x8008a3 <I2C0_fsmStateTable+0x7f7d71>
 4f4:	8f 73       	andi	r24, 0x3F	; 63
 4f6:	80 93 a3 08 	sts	0x08A3, r24	; 0x8008a3 <I2C0_fsmStateTable+0x7f7d71>
 4fa:	80 91 2d 36 	lds	r24, 0x362D	; 0x80362d <I2C0_status+0x23>
 4fe:	90 91 2e 36 	lds	r25, 0x362E	; 0x80362e <I2C0_status+0x24>
 502:	08 95       	ret
 504:	81 e0       	ldi	r24, 0x01	; 1
 506:	90 e0       	ldi	r25, 0x00	; 0
 508:	08 95       	ret

0000050a <i2c_writeNBytes>:
 50a:	ff 92       	push	r15
 50c:	0f 93       	push	r16
 50e:	1f 93       	push	r17
 510:	cf 93       	push	r28
 512:	df 93       	push	r29
 514:	f8 2e       	mov	r15, r24
 516:	8b 01       	movw	r16, r22
 518:	ea 01       	movw	r28, r20
 51a:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 51e:	82 fd       	sbrc	r24, 2
 520:	05 c0       	rjmp	.+10     	; 0x52c <i2c_writeNBytes+0x22>
 522:	8f 2d       	mov	r24, r15
 524:	0e 94 7a 00 	call	0xf4	; 0xf4 <I2C0_Open.part.1>
 528:	89 2b       	or	r24, r25
 52a:	b9 f3       	breq	.-18     	; 0x51a <i2c_writeNBytes+0x10>
 52c:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 530:	83 ff       	sbrs	r24, 3
 532:	0b c0       	rjmp	.+22     	; 0x54a <i2c_writeNBytes+0x40>
 534:	00 93 27 36 	sts	0x3627, r16	; 0x803627 <I2C0_status+0x1d>
 538:	10 93 28 36 	sts	0x3628, r17	; 0x803628 <I2C0_status+0x1e>
 53c:	c0 93 29 36 	sts	0x3629, r28	; 0x803629 <I2C0_status+0x1f>
 540:	d0 93 2a 36 	sts	0x362A, r29	; 0x80362a <I2C0_status+0x20>
 544:	87 7f       	andi	r24, 0xF7	; 247
 546:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 54a:	82 e6       	ldi	r24, 0x62	; 98
 54c:	90 e0       	ldi	r25, 0x00	; 0
 54e:	80 93 0e 36 	sts	0x360E, r24	; 0x80360e <I2C0_status+0x4>
 552:	90 93 0f 36 	sts	0x360F, r25	; 0x80360f <I2C0_status+0x5>
 556:	10 92 1a 36 	sts	0x361A, r1	; 0x80361a <I2C0_status+0x10>
 55a:	10 92 1b 36 	sts	0x361B, r1	; 0x80361b <I2C0_status+0x11>
 55e:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 562:	81 fd       	sbrc	r24, 1
 564:	0b c0       	rjmp	.+22     	; 0x57c <i2c_writeNBytes+0x72>
 566:	82 60       	ori	r24, 0x02	; 2
 568:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 56c:	82 e0       	ldi	r24, 0x02	; 2
 56e:	90 e0       	ldi	r25, 0x00	; 0
 570:	80 93 2b 36 	sts	0x362B, r24	; 0x80362b <I2C0_status+0x21>
 574:	90 93 2c 36 	sts	0x362C, r25	; 0x80362c <I2C0_status+0x22>
 578:	0e 94 b0 00 	call	0x160	; 0x160 <I2C0_MasterIsr>
 57c:	0e 94 5d 02 	call	0x4ba	; 0x4ba <I2C0_Close>
 580:	01 97       	sbiw	r24, 0x01	; 1
 582:	e1 f3       	breq	.-8      	; 0x57c <i2c_writeNBytes+0x72>
 584:	df 91       	pop	r29
 586:	cf 91       	pop	r28
 588:	1f 91       	pop	r17
 58a:	0f 91       	pop	r16
 58c:	ff 90       	pop	r15
 58e:	08 95       	ret

00000590 <PAC194x5x_Read>:
 590:	cf 92       	push	r12
 592:	df 92       	push	r13
 594:	ef 92       	push	r14
 596:	ff 92       	push	r15
 598:	0f 93       	push	r16
 59a:	1f 93       	push	r17
 59c:	cf 93       	push	r28
 59e:	df 93       	push	r29
 5a0:	7c 01       	movw	r14, r24
 5a2:	eb 01       	movw	r28, r22
 5a4:	8a 01       	movw	r16, r20
 5a6:	da 01       	movw	r26, r20
 5a8:	dc 90       	ld	r13, X
 5aa:	fc 01       	movw	r30, r24
 5ac:	82 a5       	ldd	r24, Z+42	; 0x2a
 5ae:	81 11       	cpse	r24, r1
 5b0:	d3 94       	inc	r13
 5b2:	d7 01       	movw	r26, r14
 5b4:	11 96       	adiw	r26, 0x01	; 1
 5b6:	cc 90       	ld	r12, X
 5b8:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 5bc:	82 fd       	sbrc	r24, 2
 5be:	05 c0       	rjmp	.+10     	; 0x5ca <PAC194x5x_Read+0x3a>
 5c0:	8c 2d       	mov	r24, r12
 5c2:	0e 94 7a 00 	call	0xf4	; 0xf4 <I2C0_Open.part.1>
 5c6:	89 2b       	or	r24, r25
 5c8:	b9 f3       	breq	.-18     	; 0x5b8 <PAC194x5x_Read+0x28>
 5ca:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 5ce:	83 ff       	sbrs	r24, 3
 5d0:	0d c0       	rjmp	.+26     	; 0x5ec <PAC194x5x_Read+0x5c>
 5d2:	c0 93 27 36 	sts	0x3627, r28	; 0x803627 <I2C0_status+0x1d>
 5d6:	d0 93 28 36 	sts	0x3628, r29	; 0x803628 <I2C0_status+0x1e>
 5da:	2d 2d       	mov	r18, r13
 5dc:	30 e0       	ldi	r19, 0x00	; 0
 5de:	20 93 29 36 	sts	0x3629, r18	; 0x803629 <I2C0_status+0x1f>
 5e2:	30 93 2a 36 	sts	0x362A, r19	; 0x80362a <I2C0_status+0x20>
 5e6:	87 7f       	andi	r24, 0xF7	; 247
 5e8:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 5ec:	80 91 2f 36 	lds	r24, 0x362F	; 0x80362f <I2C0_status+0x25>
 5f0:	81 fd       	sbrc	r24, 1
 5f2:	0b c0       	rjmp	.+22     	; 0x60a <PAC194x5x_Read+0x7a>
 5f4:	82 60       	ori	r24, 0x02	; 2
 5f6:	80 93 2f 36 	sts	0x362F, r24	; 0x80362f <I2C0_status+0x25>
 5fa:	81 e0       	ldi	r24, 0x01	; 1
 5fc:	90 e0       	ldi	r25, 0x00	; 0
 5fe:	80 93 2b 36 	sts	0x362B, r24	; 0x80362b <I2C0_status+0x21>
 602:	90 93 2c 36 	sts	0x362C, r25	; 0x80362c <I2C0_status+0x22>
 606:	0e 94 b0 00 	call	0x160	; 0x160 <I2C0_MasterIsr>
 60a:	0e 94 5d 02 	call	0x4ba	; 0x4ba <I2C0_Close>
 60e:	01 97       	sbiw	r24, 0x01	; 1
 610:	e1 f3       	breq	.-8      	; 0x60a <PAC194x5x_Read+0x7a>
 612:	f7 01       	movw	r30, r14
 614:	82 a5       	ldd	r24, Z+42	; 0x2a
 616:	88 23       	and	r24, r24
 618:	61 f0       	breq	.+24     	; 0x632 <PAC194x5x_Read+0xa2>
 61a:	28 81       	ld	r18, Y
 61c:	fe 01       	movw	r30, r28
 61e:	d8 01       	movw	r26, r16
 620:	3c 91       	ld	r19, X
 622:	cf 01       	movw	r24, r30
 624:	8c 1b       	sub	r24, r28
 626:	9d 0b       	sbc	r25, r29
 628:	38 17       	cp	r19, r24
 62a:	19 06       	cpc	r1, r25
 62c:	09 f0       	breq	.+2      	; 0x630 <PAC194x5x_Read+0xa0>
 62e:	64 f4       	brge	.+24     	; 0x648 <PAC194x5x_Read+0xb8>
 630:	2c 93       	st	X, r18
 632:	90 e0       	ldi	r25, 0x00	; 0
 634:	80 e0       	ldi	r24, 0x00	; 0
 636:	df 91       	pop	r29
 638:	cf 91       	pop	r28
 63a:	1f 91       	pop	r17
 63c:	0f 91       	pop	r16
 63e:	ff 90       	pop	r15
 640:	ef 90       	pop	r14
 642:	df 90       	pop	r13
 644:	cf 90       	pop	r12
 646:	08 95       	ret
 648:	81 81       	ldd	r24, Z+1	; 0x01
 64a:	81 93       	st	Z+, r24
 64c:	e8 cf       	rjmp	.-48     	; 0x61e <PAC194x5x_Read+0x8e>

0000064e <__vector_25>:
 64e:	1f 92       	push	r1
 650:	0f 92       	push	r0
 652:	0f b6       	in	r0, 0x3f	; 63
 654:	0f 92       	push	r0
 656:	11 24       	eor	r1, r1
 658:	8f 93       	push	r24
 65a:	9f 93       	push	r25
 65c:	af 93       	push	r26
 65e:	bf 93       	push	r27
 660:	80 91 30 36 	lds	r24, 0x3630	; 0x803630 <timer_millis>
 664:	90 91 31 36 	lds	r25, 0x3631	; 0x803631 <timer_millis+0x1>
 668:	a0 91 32 36 	lds	r26, 0x3632	; 0x803632 <timer_millis+0x2>
 66c:	b0 91 33 36 	lds	r27, 0x3633	; 0x803633 <timer_millis+0x3>
 670:	01 96       	adiw	r24, 0x01	; 1
 672:	a1 1d       	adc	r26, r1
 674:	b1 1d       	adc	r27, r1
 676:	80 93 30 36 	sts	0x3630, r24	; 0x803630 <timer_millis>
 67a:	90 93 31 36 	sts	0x3631, r25	; 0x803631 <timer_millis+0x1>
 67e:	a0 93 32 36 	sts	0x3632, r26	; 0x803632 <timer_millis+0x2>
 682:	b0 93 33 36 	sts	0x3633, r27	; 0x803633 <timer_millis+0x3>
 686:	81 e0       	ldi	r24, 0x01	; 1
 688:	80 93 96 0a 	sts	0x0A96, r24	; 0x800a96 <I2C0_fsmStateTable+0x7f7f64>
 68c:	bf 91       	pop	r27
 68e:	af 91       	pop	r26
 690:	9f 91       	pop	r25
 692:	8f 91       	pop	r24
 694:	0f 90       	pop	r0
 696:	0f be       	out	0x3f, r0	; 63
 698:	0f 90       	pop	r0
 69a:	1f 90       	pop	r1
 69c:	18 95       	reti

0000069e <__vector_15>:
 69e:	1f 92       	push	r1
 6a0:	0f 92       	push	r0
 6a2:	0f b6       	in	r0, 0x3f	; 63
 6a4:	0f 92       	push	r0
 6a6:	11 24       	eor	r1, r1
 6a8:	2f 93       	push	r18
 6aa:	3f 93       	push	r19
 6ac:	4f 93       	push	r20
 6ae:	5f 93       	push	r21
 6b0:	6f 93       	push	r22
 6b2:	7f 93       	push	r23
 6b4:	8f 93       	push	r24
 6b6:	9f 93       	push	r25
 6b8:	af 93       	push	r26
 6ba:	bf 93       	push	r27
 6bc:	ef 93       	push	r30
 6be:	ff 93       	push	r31
 6c0:	0e 94 b0 00 	call	0x160	; 0x160 <I2C0_MasterIsr>
 6c4:	ff 91       	pop	r31
 6c6:	ef 91       	pop	r30
 6c8:	bf 91       	pop	r27
 6ca:	af 91       	pop	r26
 6cc:	9f 91       	pop	r25
 6ce:	8f 91       	pop	r24
 6d0:	7f 91       	pop	r23
 6d2:	6f 91       	pop	r22
 6d4:	5f 91       	pop	r21
 6d6:	4f 91       	pop	r20
 6d8:	3f 91       	pop	r19
 6da:	2f 91       	pop	r18
 6dc:	0f 90       	pop	r0
 6de:	0f be       	out	0x3f, r0	; 63
 6e0:	0f 90       	pop	r0
 6e2:	1f 90       	pop	r1
 6e4:	18 95       	reti

000006e6 <__vector_16>:
 6e6:	1f 92       	push	r1
 6e8:	0f 92       	push	r0
 6ea:	0f b6       	in	r0, 0x3f	; 63
 6ec:	0f 92       	push	r0
 6ee:	11 24       	eor	r1, r1
 6f0:	0f 93       	push	r16
 6f2:	1f 93       	push	r17
 6f4:	2f 93       	push	r18
 6f6:	8f 93       	push	r24
 6f8:	9f 93       	push	r25
 6fa:	ef 93       	push	r30
 6fc:	ff 93       	push	r31
 6fe:	e0 91 06 36 	lds	r30, 0x3606	; 0x803606 <__DATA_REGION_ORIGIN__+0x206>
 702:	f0 91 07 36 	lds	r31, 0x3607	; 0x803607 <__DATA_REGION_ORIGIN__+0x207>
 706:	90 91 00 36 	lds	r25, 0x3600	; 0x803600 <__DATA_REGION_ORIGIN__+0x200>
 70a:	00 91 c4 08 	lds	r16, 0x08C4	; 0x8008c4 <I2C0_fsmStateTable+0x7f7d92>
 70e:	99 27       	eor	r25, r25
 710:	00 fd       	sbrc	r16, 0
 712:	01 c0       	rjmp	.+2      	; 0x716 <inactive>
 714:	00 83       	st	Z, r16

00000716 <inactive>:
 716:	08 95       	ret

00000718 <transfer_complete>:
 718:	08 95       	ret
 71a:	80 91 c4 08 	lds	r24, 0x08C4	; 0x8008c4 <I2C0_fsmStateTable+0x7f7d92>
 71e:	99 23       	and	r25, r25
 720:	e1 f0       	breq	.+56     	; 0x75a <transfer_complete+0x42>
 722:	20 91 c3 08 	lds	r18, 0x08C3	; 0x8008c3 <I2C0_fsmStateTable+0x7f7d91>
 726:	90 91 01 36 	lds	r25, 0x3601	; 0x803601 <__DATA_REGION_ORIGIN__+0x201>
 72a:	26 fd       	sbrc	r18, 6
 72c:	2a c0       	rjmp	.+84     	; 0x782 <transfer_complete+0x6a>
 72e:	20 81       	ld	r18, Z
 730:	20 93 c4 08 	sts	0x08C4, r18	; 0x8008c4 <I2C0_fsmStateTable+0x7f7d92>
 734:	91 11       	cpse	r25, r1
 736:	80 83       	st	Z, r24
 738:	80 91 06 36 	lds	r24, 0x3606	; 0x803606 <__DATA_REGION_ORIGIN__+0x206>
 73c:	8f 5f       	subi	r24, 0xFF	; 255
 73e:	80 93 06 36 	sts	0x3606, r24	; 0x803606 <__DATA_REGION_ORIGIN__+0x206>
 742:	ff 91       	pop	r31
 744:	ef 91       	pop	r30
 746:	9f 91       	pop	r25
 748:	8f 91       	pop	r24
 74a:	2f 91       	pop	r18
 74c:	1f 91       	pop	r17
 74e:	0f 91       	pop	r16
 750:	0f 90       	pop	r0
 752:	0f be       	out	0x3f, r0	; 63
 754:	0f 90       	pop	r0
 756:	1f 90       	pop	r1
 758:	18 95       	reti
 75a:	90 e0       	ldi	r25, 0x00	; 0
 75c:	87 fb       	bst	r24, 7
 75e:	22 27       	eor	r18, r18
 760:	20 f9       	bld	r18, 0
 762:	20 93 01 36 	sts	0x3601, r18	; 0x803601 <__DATA_REGION_ORIGIN__+0x201>
 766:	e0 91 04 36 	lds	r30, 0x3604	; 0x803604 <__DATA_REGION_ORIGIN__+0x204>
 76a:	f0 91 05 36 	lds	r31, 0x3605	; 0x803605 <__DATA_REGION_ORIGIN__+0x205>
 76e:	8e 2b       	or	r24, r30
 770:	9f 2b       	or	r25, r31
 772:	80 93 06 36 	sts	0x3606, r24	; 0x803606 <__DATA_REGION_ORIGIN__+0x206>
 776:	90 93 07 36 	sts	0x3607, r25	; 0x803607 <__DATA_REGION_ORIGIN__+0x207>
 77a:	80 81       	ld	r24, Z
 77c:	80 93 c4 08 	sts	0x08C4, r24	; 0x8008c4 <I2C0_fsmStateTable+0x7f7d92>
 780:	e0 cf       	rjmp	.-64     	; 0x742 <transfer_complete+0x2a>
 782:	80 91 c3 08 	lds	r24, 0x08C3	; 0x8008c3 <I2C0_fsmStateTable+0x7f7d91>
 786:	80 64       	ori	r24, 0x40	; 64
 788:	80 93 c3 08 	sts	0x08C3, r24	; 0x8008c3 <I2C0_fsmStateTable+0x7f7d91>
 78c:	10 92 00 36 	sts	0x3600, r1	; 0x803600 <__DATA_REGION_ORIGIN__+0x200>
 790:	81 e0       	ldi	r24, 0x01	; 1
 792:	80 93 02 36 	sts	0x3602, r24	; 0x803602 <__DATA_REGION_ORIGIN__+0x202>
 796:	91 11       	cpse	r25, r1
 798:	80 93 03 36 	sts	0x3603, r24	; 0x803603 <__DATA_REGION_ORIGIN__+0x203>
 79c:	e0 91 04 36 	lds	r30, 0x3604	; 0x803604 <__DATA_REGION_ORIGIN__+0x204>
 7a0:	f0 91 05 36 	lds	r31, 0x3605	; 0x803605 <__DATA_REGION_ORIGIN__+0x205>
 7a4:	ea cf       	rjmp	.-44     	; 0x77a <transfer_complete+0x62>

000007a6 <main>:
 7a6:	cf 93       	push	r28
 7a8:	df 93       	push	r29
 7aa:	cd b7       	in	r28, 0x3d	; 61
 7ac:	de b7       	in	r29, 0x3e	; 62
 7ae:	28 97       	sbiw	r28, 0x08	; 8
 7b0:	cd bf       	out	0x3d, r28	; 61
 7b2:	de bf       	out	0x3e, r29	; 62
 7b4:	88 ed       	ldi	r24, 0xD8	; 216
 7b6:	90 e0       	ldi	r25, 0x00	; 0
 7b8:	84 bf       	out	0x34, r24	; 52
 7ba:	90 93 61 00 	sts	0x0061, r25	; 0x800061 <I2C0_fsmStateTable+0x7f752f>
 7be:	83 e0       	ldi	r24, 0x03	; 3
 7c0:	80 93 01 06 	sts	0x0601, r24	; 0x800601 <I2C0_fsmStateTable+0x7f7acf>
 7c4:	9f e0       	ldi	r25, 0x0F	; 15
 7c6:	90 93 08 06 	sts	0x0608, r25	; 0x800608 <I2C0_fsmStateTable+0x7f7ad6>
 7ca:	91 e2       	ldi	r25, 0x21	; 33
 7cc:	90 93 00 06 	sts	0x0600, r25	; 0x800600 <I2C0_fsmStateTable+0x7f7ace>
 7d0:	90 ea       	ldi	r25, 0xA0	; 160
 7d2:	90 93 02 06 	sts	0x0602, r25	; 0x800602 <I2C0_fsmStateTable+0x7f7ad0>
 7d6:	9a e0       	ldi	r25, 0x0A	; 10
 7d8:	90 93 0b 06 	sts	0x060B, r25	; 0x80060b <I2C0_fsmStateTable+0x7f7ad9>
 7dc:	91 e0       	ldi	r25, 0x01	; 1
 7de:	90 93 03 0a 	sts	0x0A03, r25	; 0x800a03 <I2C0_fsmStateTable+0x7f7ed1>
 7e2:	2e ef       	ldi	r18, 0xFE	; 254
 7e4:	20 93 26 0a 	sts	0x0A26, r18	; 0x800a26 <I2C0_fsmStateTable+0x7f7ef4>
 7e8:	20 93 27 0a 	sts	0x0A27, r18	; 0x800a27 <I2C0_fsmStateTable+0x7f7ef5>
 7ec:	2b e0       	ldi	r18, 0x0B	; 11
 7ee:	20 93 00 0a 	sts	0x0A00, r18	; 0x800a00 <I2C0_fsmStateTable+0x7f7ece>
 7f2:	2f e0       	ldi	r18, 0x0F	; 15
 7f4:	37 e2       	ldi	r19, 0x27	; 39
 7f6:	20 93 9c 0a 	sts	0x0A9C, r18	; 0x800a9c <I2C0_fsmStateTable+0x7f7f6a>
 7fa:	30 93 9d 0a 	sts	0x0A9D, r19	; 0x800a9d <I2C0_fsmStateTable+0x7f7f6b>
 7fe:	90 93 95 0a 	sts	0x0A95, r25	; 0x800a95 <I2C0_fsmStateTable+0x7f7f63>
 802:	10 92 91 0a 	sts	0x0A91, r1	; 0x800a91 <I2C0_fsmStateTable+0x7f7f5f>
 806:	80 93 90 0a 	sts	0x0A90, r24	; 0x800a90 <I2C0_fsmStateTable+0x7f7f5e>
 80a:	78 94       	sei
 80c:	78 94       	sei
 80e:	89 e6       	ldi	r24, 0x69	; 105
 810:	81 b9       	out	0x01, r24	; 1
 812:	10 b8       	out	0x00, r1	; 0
 814:	1a bc       	out	0x2a, r1	; 42
 816:	10 92 5b 00 	sts	0x005B, r1	; 0x80005b <I2C0_fsmStateTable+0x7f7529>
 81a:	10 92 5d 00 	sts	0x005D, r1	; 0x80005d <I2C0_fsmStateTable+0x7f752b>
 81e:	10 92 5c 00 	sts	0x005C, r1	; 0x80005c <I2C0_fsmStateTable+0x7f752a>
 822:	10 92 5e 00 	sts	0x005E, r1	; 0x80005e <I2C0_fsmStateTable+0x7f752c>
 826:	10 92 4f 00 	sts	0x004F, r1	; 0x80004f <I2C0_fsmStateTable+0x7f751d>
 82a:	10 92 50 00 	sts	0x0050, r1	; 0x800050 <I2C0_fsmStateTable+0x7f751e>
 82e:	10 92 51 00 	sts	0x0051, r1	; 0x800051 <I2C0_fsmStateTable+0x7f751f>
 832:	10 92 52 00 	sts	0x0052, r1	; 0x800052 <I2C0_fsmStateTable+0x7f7520>
 836:	a1 e0       	ldi	r26, 0x01	; 1
 838:	b0 e0       	ldi	r27, 0x00	; 0
 83a:	90 e0       	ldi	r25, 0x00	; 0
 83c:	80 e0       	ldi	r24, 0x00	; 0
 83e:	40 e0       	ldi	r20, 0x00	; 0
 840:	50 e0       	ldi	r21, 0x00	; 0
 842:	60 e8       	ldi	r22, 0x80	; 128
 844:	7f e3       	ldi	r23, 0x3F	; 63
 846:	0d 91       	ld	r16, X+
 848:	1d 91       	ld	r17, X+
 84a:	2d 91       	ld	r18, X+
 84c:	3d 91       	ld	r19, X+
 84e:	fc 01       	movw	r30, r24
 850:	ee 0f       	add	r30, r30
 852:	ff 1f       	adc	r31, r31
 854:	ee 0f       	add	r30, r30
 856:	ff 1f       	adc	r31, r31
 858:	02 8f       	std	Z+26, r16	; 0x1a
 85a:	13 8f       	std	Z+27, r17	; 0x1b
 85c:	24 8f       	std	Z+28, r18	; 0x1c
 85e:	35 8f       	std	Z+29, r19	; 0x1d
 860:	42 87       	std	Z+10, r20	; 0x0a
 862:	53 87       	std	Z+11, r21	; 0x0b
 864:	64 87       	std	Z+12, r22	; 0x0c
 866:	75 87       	std	Z+13, r23	; 0x0d
 868:	01 96       	adiw	r24, 0x01	; 1
 86a:	84 30       	cpi	r24, 0x04	; 4
 86c:	91 05       	cpc	r25, r1
 86e:	59 f7       	brne	.-42     	; 0x846 <main+0xa0>
 870:	ff 24       	eor	r15, r15
 872:	f3 94       	inc	r15
 874:	fd 82       	std	Y+5, r15	; 0x05
 876:	8d ef       	ldi	r24, 0xFD	; 253
 878:	88 87       	std	Y+8, r24	; 0x08
 87a:	41 e0       	ldi	r20, 0x01	; 1
 87c:	50 e0       	ldi	r21, 0x00	; 0
 87e:	be 01       	movw	r22, r28
 880:	68 5f       	subi	r22, 0xF8	; 248
 882:	7f 4f       	sbci	r23, 0xFF	; 255
 884:	89 e6       	ldi	r24, 0x69	; 105
 886:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 88a:	8e 01       	movw	r16, r28
 88c:	0b 5f       	subi	r16, 0xFB	; 251
 88e:	1f 4f       	sbci	r17, 0xFF	; 255
 890:	a8 01       	movw	r20, r16
 892:	be 01       	movw	r22, r28
 894:	6f 5f       	subi	r22, 0xFF	; 255
 896:	7f 4f       	sbci	r23, 0xFF	; 255
 898:	90 e0       	ldi	r25, 0x00	; 0
 89a:	80 e0       	ldi	r24, 0x00	; 0
 89c:	0e 94 c8 02 	call	0x590	; 0x590 <PAC194x5x_Read>
 8a0:	89 2b       	or	r24, r25
 8a2:	09 f0       	breq	.+2      	; 0x8a6 <main+0x100>
 8a4:	3d c1       	rjmp	.+634    	; 0xb20 <main+0x37a>
 8a6:	89 81       	ldd	r24, Y+1	; 0x01
 8a8:	80 93 53 00 	sts	0x0053, r24	; 0x800053 <I2C0_fsmStateTable+0x7f7521>
 8ac:	8e ef       	ldi	r24, 0xFE	; 254
 8ae:	88 87       	std	Y+8, r24	; 0x08
 8b0:	41 e0       	ldi	r20, 0x01	; 1
 8b2:	50 e0       	ldi	r21, 0x00	; 0
 8b4:	be 01       	movw	r22, r28
 8b6:	68 5f       	subi	r22, 0xF8	; 248
 8b8:	7f 4f       	sbci	r23, 0xFF	; 255
 8ba:	81 b1       	in	r24, 0x01	; 1
 8bc:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 8c0:	a8 01       	movw	r20, r16
 8c2:	be 01       	movw	r22, r28
 8c4:	6f 5f       	subi	r22, 0xFF	; 255
 8c6:	7f 4f       	sbci	r23, 0xFF	; 255
 8c8:	90 e0       	ldi	r25, 0x00	; 0
 8ca:	80 e0       	ldi	r24, 0x00	; 0
 8cc:	0e 94 c8 02 	call	0x590	; 0x590 <PAC194x5x_Read>
 8d0:	89 2b       	or	r24, r25
 8d2:	09 f0       	breq	.+2      	; 0x8d6 <main+0x130>
 8d4:	25 c1       	rjmp	.+586    	; 0xb20 <main+0x37a>
 8d6:	89 81       	ldd	r24, Y+1	; 0x01
 8d8:	80 93 54 00 	sts	0x0054, r24	; 0x800054 <I2C0_fsmStateTable+0x7f7522>
 8dc:	8f ef       	ldi	r24, 0xFF	; 255
 8de:	88 87       	std	Y+8, r24	; 0x08
 8e0:	41 e0       	ldi	r20, 0x01	; 1
 8e2:	50 e0       	ldi	r21, 0x00	; 0
 8e4:	be 01       	movw	r22, r28
 8e6:	68 5f       	subi	r22, 0xF8	; 248
 8e8:	7f 4f       	sbci	r23, 0xFF	; 255
 8ea:	81 b1       	in	r24, 0x01	; 1
 8ec:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 8f0:	a8 01       	movw	r20, r16
 8f2:	be 01       	movw	r22, r28
 8f4:	6f 5f       	subi	r22, 0xFF	; 255
 8f6:	7f 4f       	sbci	r23, 0xFF	; 255
 8f8:	90 e0       	ldi	r25, 0x00	; 0
 8fa:	80 e0       	ldi	r24, 0x00	; 0
 8fc:	0e 94 c8 02 	call	0x590	; 0x590 <PAC194x5x_Read>
 900:	89 2b       	or	r24, r25
 902:	09 f0       	breq	.+2      	; 0x906 <main+0x160>
 904:	0d c1       	rjmp	.+538    	; 0xb20 <main+0x37a>
 906:	89 81       	ldd	r24, Y+1	; 0x01
 908:	80 93 55 00 	sts	0x0055, r24	; 0x800055 <I2C0_fsmStateTable+0x7f7523>
 90c:	f0 92 5b 00 	sts	0x005B, r15	; 0x80005b <I2C0_fsmStateTable+0x7f7529>
 910:	84 e6       	ldi	r24, 0x64	; 100
 912:	90 e0       	ldi	r25, 0x00	; 0
 914:	86 b9       	out	0x06, r24	; 6
 916:	97 b9       	out	0x07, r25	; 7
 918:	e0 91 53 00 	lds	r30, 0x0053	; 0x800053 <I2C0_fsmStateTable+0x7f7521>
 91c:	e8 56       	subi	r30, 0x68	; 104
 91e:	e6 31       	cpi	r30, 0x16	; 22
 920:	08 f0       	brcs	.+2      	; 0x924 <main+0x17e>
 922:	a1 c0       	rjmp	.+322    	; 0xa66 <main+0x2c0>
 924:	f0 e0       	ldi	r31, 0x00	; 0
 926:	e9 56       	subi	r30, 0x69	; 105
 928:	fb 4f       	sbci	r31, 0xFB	; 251
 92a:	0c 94 91 05 	jmp	0xb22	; 0xb22 <__tablejump2__>
 92e:	ad 04       	cpc	r10, r13
 930:	34 05       	cpc	r19, r4
 932:	36 05       	cpc	r19, r6
 934:	38 05       	cpc	r19, r8
 936:	3a 05       	cpc	r19, r10
 938:	4e 05       	cpc	r20, r14
 93a:	33 05       	cpc	r19, r3
 93c:	33 05       	cpc	r19, r3
 93e:	33 05       	cpc	r19, r3
 940:	33 05       	cpc	r19, r3
 942:	33 05       	cpc	r19, r3
 944:	33 05       	cpc	r19, r3
 946:	33 05       	cpc	r19, r3
 948:	33 05       	cpc	r19, r3
 94a:	33 05       	cpc	r19, r3
 94c:	33 05       	cpc	r19, r3
 94e:	6b 05       	cpc	r22, r11
 950:	75 05       	cpc	r23, r5
 952:	77 05       	cpc	r23, r7
 954:	79 05       	cpc	r23, r9
 956:	7b 05       	cpc	r23, r11
 958:	85 05       	cpc	r24, r5
 95a:	81 e0       	ldi	r24, 0x01	; 1
 95c:	82 b9       	out	0x02, r24	; 2
 95e:	13 b8       	out	0x03, r1	; 3
 960:	88 e2       	ldi	r24, 0x28	; 40
 962:	93 e2       	ldi	r25, 0x23	; 35
 964:	84 b9       	out	0x04, r24	; 4
 966:	95 b9       	out	0x05, r25	; 5
 968:	84 e8       	ldi	r24, 0x84	; 132
 96a:	93 e0       	ldi	r25, 0x03	; 3
 96c:	88 b9       	out	0x08, r24	; 8
 96e:	99 b9       	out	0x09, r25	; 9
 970:	81 e0       	ldi	r24, 0x01	; 1
 972:	89 83       	std	Y+1, r24	; 0x01
 974:	80 e0       	ldi	r24, 0x00	; 0
 976:	8f 7e       	andi	r24, 0xEF	; 239
 978:	8f 7d       	andi	r24, 0xDF	; 223
 97a:	8f 7b       	andi	r24, 0xBF	; 191
 97c:	8f 77       	andi	r24, 0x7F	; 127
 97e:	97 e0       	ldi	r25, 0x07	; 7
 980:	9a 83       	std	Y+2, r25	; 0x02
 982:	8b 83       	std	Y+3, r24	; 0x03
 984:	43 e0       	ldi	r20, 0x03	; 3
 986:	50 e0       	ldi	r21, 0x00	; 0
 988:	be 01       	movw	r22, r28
 98a:	6f 5f       	subi	r22, 0xFF	; 255
 98c:	7f 4f       	sbci	r23, 0xFF	; 255
 98e:	81 b1       	in	r24, 0x01	; 1
 990:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 994:	10 92 5c 00 	sts	0x005C, r1	; 0x80005c <I2C0_fsmStateTable+0x7f752a>
 998:	8c e1       	ldi	r24, 0x1C	; 28
 99a:	89 83       	std	Y+1, r24	; 0x01
 99c:	80 e1       	ldi	r24, 0x10	; 16
 99e:	8a 83       	std	Y+2, r24	; 0x02
 9a0:	42 e0       	ldi	r20, 0x02	; 2
 9a2:	50 e0       	ldi	r21, 0x00	; 0
 9a4:	be 01       	movw	r22, r28
 9a6:	6f 5f       	subi	r22, 0xFF	; 255
 9a8:	7f 4f       	sbci	r23, 0xFF	; 255
 9aa:	81 b1       	in	r24, 0x01	; 1
 9ac:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 9b0:	1a bc       	out	0x2a, r1	; 42
 9b2:	8d e1       	ldi	r24, 0x1D	; 29
 9b4:	89 83       	std	Y+1, r24	; 0x01
 9b6:	1a 82       	std	Y+2, r1	; 0x02
 9b8:	1b 82       	std	Y+3, r1	; 0x03
 9ba:	43 e0       	ldi	r20, 0x03	; 3
 9bc:	50 e0       	ldi	r21, 0x00	; 0
 9be:	be 01       	movw	r22, r28
 9c0:	6f 5f       	subi	r22, 0xFF	; 255
 9c2:	7f 4f       	sbci	r23, 0xFF	; 255
 9c4:	81 b1       	in	r24, 0x01	; 1
 9c6:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 9ca:	10 92 5d 00 	sts	0x005D, r1	; 0x80005d <I2C0_fsmStateTable+0x7f752b>
 9ce:	80 e0       	ldi	r24, 0x00	; 0
 9d0:	8d 7f       	andi	r24, 0xFD	; 253
 9d2:	8b 7f       	andi	r24, 0xFB	; 251
 9d4:	87 7f       	andi	r24, 0xF7	; 247
 9d6:	8f 7e       	andi	r24, 0xEF	; 239
 9d8:	90 e2       	ldi	r25, 0x20	; 32
 9da:	99 83       	std	Y+1, r25	; 0x01
 9dc:	8a 83       	std	Y+2, r24	; 0x02
 9de:	42 e0       	ldi	r20, 0x02	; 2
 9e0:	50 e0       	ldi	r21, 0x00	; 0
 9e2:	be 01       	movw	r22, r28
 9e4:	6f 5f       	subi	r22, 0xFF	; 255
 9e6:	7f 4f       	sbci	r23, 0xFF	; 255
 9e8:	81 b1       	in	r24, 0x01	; 1
 9ea:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 9ee:	85 e2       	ldi	r24, 0x25	; 37
 9f0:	89 83       	std	Y+1, r24	; 0x01
 9f2:	1a 82       	std	Y+2, r1	; 0x02
 9f4:	42 e0       	ldi	r20, 0x02	; 2
 9f6:	50 e0       	ldi	r21, 0x00	; 0
 9f8:	be 01       	movw	r22, r28
 9fa:	6f 5f       	subi	r22, 0xFF	; 255
 9fc:	7f 4f       	sbci	r23, 0xFF	; 255
 9fe:	81 b1       	in	r24, 0x01	; 1
 a00:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 a04:	10 92 5e 00 	sts	0x005E, r1	; 0x80005e <I2C0_fsmStateTable+0x7f752c>
 a08:	89 e2       	ldi	r24, 0x29	; 41
 a0a:	89 83       	std	Y+1, r24	; 0x01
 a0c:	85 e5       	ldi	r24, 0x55	; 85
 a0e:	8a 83       	std	Y+2, r24	; 0x02
 a10:	80 e4       	ldi	r24, 0x40	; 64
 a12:	8b 83       	std	Y+3, r24	; 0x03
 a14:	43 e0       	ldi	r20, 0x03	; 3
 a16:	50 e0       	ldi	r21, 0x00	; 0
 a18:	be 01       	movw	r22, r28
 a1a:	6f 5f       	subi	r22, 0xFF	; 255
 a1c:	7f 4f       	sbci	r23, 0xFF	; 255
 a1e:	81 b1       	in	r24, 0x01	; 1
 a20:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 a24:	83 e0       	ldi	r24, 0x03	; 3
 a26:	f8 01       	movw	r30, r16
 a28:	11 92       	st	Z+, r1
 a2a:	8a 95       	dec	r24
 a2c:	e9 f7       	brne	.-6      	; 0xa28 <main+0x282>
 a2e:	89 e4       	ldi	r24, 0x49	; 73
 a30:	89 83       	std	Y+1, r24	; 0x01
 a32:	1a 82       	std	Y+2, r1	; 0x02
 a34:	1b 82       	std	Y+3, r1	; 0x03
 a36:	1c 82       	std	Y+4, r1	; 0x04
 a38:	44 e0       	ldi	r20, 0x04	; 4
 a3a:	50 e0       	ldi	r21, 0x00	; 0
 a3c:	be 01       	movw	r22, r28
 a3e:	6f 5f       	subi	r22, 0xFF	; 255
 a40:	7f 4f       	sbci	r23, 0xFF	; 255
 a42:	81 b1       	in	r24, 0x01	; 1
 a44:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 a48:	10 92 5d 00 	sts	0x005D, r1	; 0x80005d <I2C0_fsmStateTable+0x7f752b>
 a4c:	10 92 5c 00 	sts	0x005C, r1	; 0x80005c <I2C0_fsmStateTable+0x7f752a>
 a50:	10 92 5e 00 	sts	0x005E, r1	; 0x80005e <I2C0_fsmStateTable+0x7f752c>
 a54:	19 82       	std	Y+1, r1	; 0x01
 a56:	41 e0       	ldi	r20, 0x01	; 1
 a58:	50 e0       	ldi	r21, 0x00	; 0
 a5a:	be 01       	movw	r22, r28
 a5c:	6f 5f       	subi	r22, 0xFF	; 255
 a5e:	7f 4f       	sbci	r23, 0xFF	; 255
 a60:	81 b1       	in	r24, 0x01	; 1
 a62:	0e 94 85 02 	call	0x50a	; 0x50a <i2c_writeNBytes>
 a66:	ff cf       	rjmp	.-2      	; 0xa66 <main+0x2c0>
 a68:	82 e0       	ldi	r24, 0x02	; 2
 a6a:	78 cf       	rjmp	.-272    	; 0x95c <main+0x1b6>
 a6c:	83 e0       	ldi	r24, 0x03	; 3
 a6e:	76 cf       	rjmp	.-276    	; 0x95c <main+0x1b6>
 a70:	84 e0       	ldi	r24, 0x04	; 4
 a72:	74 cf       	rjmp	.-280    	; 0x95c <main+0x1b6>
 a74:	81 e0       	ldi	r24, 0x01	; 1
 a76:	82 b9       	out	0x02, r24	; 2
 a78:	83 b9       	out	0x03, r24	; 3
 a7a:	88 e2       	ldi	r24, 0x28	; 40
 a7c:	93 e2       	ldi	r25, 0x23	; 35
 a7e:	84 b9       	out	0x04, r24	; 4
 a80:	95 b9       	out	0x05, r25	; 5
 a82:	84 e8       	ldi	r24, 0x84	; 132
 a84:	93 e0       	ldi	r25, 0x03	; 3
 a86:	88 b9       	out	0x08, r24	; 8
 a88:	99 b9       	out	0x09, r25	; 9
 a8a:	81 b1       	in	r24, 0x01	; 1
 a8c:	92 b1       	in	r25, 0x02	; 2
 a8e:	a3 b1       	in	r26, 0x03	; 3
 a90:	b4 b1       	in	r27, 0x04	; 4
 a92:	8a b9       	out	0x0a, r24	; 10
 a94:	9b b9       	out	0x0b, r25	; 11
 a96:	ac b9       	out	0x0c, r26	; 12
 a98:	bd b9       	out	0x0d, r27	; 13
 a9a:	6a cf       	rjmp	.-300    	; 0x970 <main+0x1ca>
 a9c:	82 e0       	ldi	r24, 0x02	; 2
 a9e:	82 b9       	out	0x02, r24	; 2
 aa0:	81 e0       	ldi	r24, 0x01	; 1
 aa2:	83 b9       	out	0x03, r24	; 3
 aa4:	88 e2       	ldi	r24, 0x28	; 40
 aa6:	93 e2       	ldi	r25, 0x23	; 35
 aa8:	84 b9       	out	0x04, r24	; 4
 aaa:	95 b9       	out	0x05, r25	; 5
 aac:	84 e8       	ldi	r24, 0x84	; 132
 aae:	93 e0       	ldi	r25, 0x03	; 3
 ab0:	88 b9       	out	0x08, r24	; 8
 ab2:	99 b9       	out	0x09, r25	; 9
 ab4:	81 b1       	in	r24, 0x01	; 1
 ab6:	92 b1       	in	r25, 0x02	; 2
 ab8:	a3 b1       	in	r26, 0x03	; 3
 aba:	b4 b1       	in	r27, 0x04	; 4
 abc:	8a b9       	out	0x0a, r24	; 10
 abe:	9b b9       	out	0x0b, r25	; 11
 ac0:	ac b9       	out	0x0c, r26	; 12
 ac2:	bd b9       	out	0x0d, r27	; 13
 ac4:	85 b1       	in	r24, 0x05	; 5
 ac6:	96 b1       	in	r25, 0x06	; 6
 ac8:	a7 b1       	in	r26, 0x07	; 7
 aca:	b8 b1       	in	r27, 0x08	; 8
 acc:	8e b9       	out	0x0e, r24	; 14
 ace:	9f b9       	out	0x0f, r25	; 15
 ad0:	a0 bb       	out	0x10, r26	; 16
 ad2:	b1 bb       	out	0x11, r27	; 17
 ad4:	4d cf       	rjmp	.-358    	; 0x970 <main+0x1ca>
 ad6:	81 e0       	ldi	r24, 0x01	; 1
 ad8:	82 b9       	out	0x02, r24	; 2
 ada:	13 b8       	out	0x03, r1	; 3
 adc:	80 e0       	ldi	r24, 0x00	; 0
 ade:	9d e7       	ldi	r25, 0x7D	; 125
 ae0:	84 b9       	out	0x04, r24	; 4
 ae2:	95 b9       	out	0x05, r25	; 5
 ae4:	80 e8       	ldi	r24, 0x80	; 128
 ae6:	9c e0       	ldi	r25, 0x0C	; 12
 ae8:	41 cf       	rjmp	.-382    	; 0x96c <main+0x1c6>
 aea:	82 e0       	ldi	r24, 0x02	; 2
 aec:	f5 cf       	rjmp	.-22     	; 0xad8 <main+0x332>
 aee:	83 e0       	ldi	r24, 0x03	; 3
 af0:	f3 cf       	rjmp	.-26     	; 0xad8 <main+0x332>
 af2:	84 e0       	ldi	r24, 0x04	; 4
 af4:	f1 cf       	rjmp	.-30     	; 0xad8 <main+0x332>
 af6:	81 e0       	ldi	r24, 0x01	; 1
 af8:	82 b9       	out	0x02, r24	; 2
 afa:	83 b9       	out	0x03, r24	; 3
 afc:	80 e0       	ldi	r24, 0x00	; 0
 afe:	9d e7       	ldi	r25, 0x7D	; 125
 b00:	84 b9       	out	0x04, r24	; 4
 b02:	95 b9       	out	0x05, r25	; 5
 b04:	80 e8       	ldi	r24, 0x80	; 128
 b06:	9c e0       	ldi	r25, 0x0C	; 12
 b08:	be cf       	rjmp	.-132    	; 0xa86 <main+0x2e0>
 b0a:	82 e0       	ldi	r24, 0x02	; 2
 b0c:	82 b9       	out	0x02, r24	; 2
 b0e:	81 e0       	ldi	r24, 0x01	; 1
 b10:	83 b9       	out	0x03, r24	; 3
 b12:	80 e0       	ldi	r24, 0x00	; 0
 b14:	9d e7       	ldi	r25, 0x7D	; 125
 b16:	84 b9       	out	0x04, r24	; 4
 b18:	95 b9       	out	0x05, r25	; 5
 b1a:	80 e8       	ldi	r24, 0x80	; 128
 b1c:	9c e0       	ldi	r25, 0x0C	; 12
 b1e:	c8 cf       	rjmp	.-112    	; 0xab0 <main+0x30a>
 b20:	a2 cf       	rjmp	.-188    	; 0xa66 <main+0x2c0>

00000b22 <__tablejump2__>:
 b22:	ee 0f       	add	r30, r30
 b24:	ff 1f       	adc	r31, r31
 b26:	05 90       	lpm	r0, Z+
 b28:	f4 91       	lpm	r31, Z
 b2a:	e0 2d       	mov	r30, r0
 b2c:	09 94       	ijmp

00000b2e <_exit>:
 b2e:	f8 94       	cli

00000b30 <__stop_program>:
 b30:	ff cf       	rjmp	.-2      	; 0xb30 <__stop_program>
