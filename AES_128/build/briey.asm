
build/briey.elf:     file format elf32-littleriscv


Disassembly of section .vector:

80000000 <crtStart>:
.global crtStart
.global main
.global irqCallback

crtStart:
  j crtInit
80000000:	0b00006f          	j	800000b0 <crtInit>
  nop
80000004:	00000013          	nop
  nop
80000008:	00000013          	nop
  nop
8000000c:	00000013          	nop
  nop
80000010:	00000013          	nop
  nop
80000014:	00000013          	nop
  nop
80000018:	00000013          	nop
  nop
8000001c:	00000013          	nop

80000020 <trap_entry>:

.global  trap_entry
trap_entry:
  sw x1,  - 1*4(sp)
80000020:	fe112e23          	sw	ra,-4(sp)
  sw x5,  - 2*4(sp)
80000024:	fe512c23          	sw	t0,-8(sp)
  sw x6,  - 3*4(sp)
80000028:	fe612a23          	sw	t1,-12(sp)
  sw x7,  - 4*4(sp)
8000002c:	fe712823          	sw	t2,-16(sp)
  sw x10, - 5*4(sp)
80000030:	fea12623          	sw	a0,-20(sp)
  sw x11, - 6*4(sp)
80000034:	feb12423          	sw	a1,-24(sp)
  sw x12, - 7*4(sp)
80000038:	fec12223          	sw	a2,-28(sp)
  sw x13, - 8*4(sp)
8000003c:	fed12023          	sw	a3,-32(sp)
  sw x14, - 9*4(sp)
80000040:	fce12e23          	sw	a4,-36(sp)
  sw x15, -10*4(sp)
80000044:	fcf12c23          	sw	a5,-40(sp)
  sw x16, -11*4(sp)
80000048:	fd012a23          	sw	a6,-44(sp)
  sw x17, -12*4(sp)
8000004c:	fd112823          	sw	a7,-48(sp)
  sw x28, -13*4(sp)
80000050:	fdc12623          	sw	t3,-52(sp)
  sw x29, -14*4(sp)
80000054:	fdd12423          	sw	t4,-56(sp)
  sw x30, -15*4(sp)
80000058:	fde12223          	sw	t5,-60(sp)
  sw x31, -16*4(sp)
8000005c:	fdf12023          	sw	t6,-64(sp)
  addi sp,sp,-16*4
80000060:	fc010113          	addi	sp,sp,-64
  call irqCallback
80000064:	29c000ef          	jal	ra,80000300 <irqCallback>
  lw x1 , 15*4(sp)
80000068:	03c12083          	lw	ra,60(sp)
  lw x5,  14*4(sp)
8000006c:	03812283          	lw	t0,56(sp)
  lw x6,  13*4(sp)
80000070:	03412303          	lw	t1,52(sp)
  lw x7,  12*4(sp)
80000074:	03012383          	lw	t2,48(sp)
  lw x10, 11*4(sp)
80000078:	02c12503          	lw	a0,44(sp)
  lw x11, 10*4(sp)
8000007c:	02812583          	lw	a1,40(sp)
  lw x12,  9*4(sp)
80000080:	02412603          	lw	a2,36(sp)
  lw x13,  8*4(sp)
80000084:	02012683          	lw	a3,32(sp)
  lw x14,  7*4(sp)
80000088:	01c12703          	lw	a4,28(sp)
  lw x15,  6*4(sp)
8000008c:	01812783          	lw	a5,24(sp)
  lw x16,  5*4(sp)
80000090:	01412803          	lw	a6,20(sp)
  lw x17,  4*4(sp)
80000094:	01012883          	lw	a7,16(sp)
  lw x28,  3*4(sp)
80000098:	00c12e03          	lw	t3,12(sp)
  lw x29,  2*4(sp)
8000009c:	00812e83          	lw	t4,8(sp)
  lw x30,  1*4(sp)
800000a0:	00412f03          	lw	t5,4(sp)
  lw x31,  0*4(sp)
800000a4:	00012f83          	lw	t6,0(sp)
  addi sp,sp,16*4
800000a8:	04010113          	addi	sp,sp,64
  mret
800000ac:	30200073          	mret

800000b0 <crtInit>:


crtInit:
  .option push
  .option norelax
  la gp, __global_pointer$
800000b0:	00002197          	auipc	gp,0x2
800000b4:	be018193          	addi	gp,gp,-1056 # 80001c90 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000b8:	01018113          	addi	sp,gp,16 # 80001ca0 <_stack_start>

800000bc <bss_init>:

bss_init:
  la a0, _bss_start
800000bc:	00001517          	auipc	a0,0x1
800000c0:	3d450513          	addi	a0,a0,980 # 80001490 <trap_induced_ebreak.0>
  la a1, _bss_end
800000c4:	81018593          	addi	a1,gp,-2032 # 800014a0 <_bss_end>

800000c8 <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
800000c8:	00b50863          	beq	a0,a1,800000d8 <bss_done>
  sw zero,0(a0)
800000cc:	00052023          	sw	zero,0(a0)
  add a0,a0,4
800000d0:	00450513          	addi	a0,a0,4
  j bss_loop
800000d4:	ff5ff06f          	j	800000c8 <bss_loop>

800000d8 <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000d8:	00001517          	auipc	a0,0x1
800000dc:	3b850513          	addi	a0,a0,952 # 80001490 <trap_induced_ebreak.0>
  addi sp,sp,-4
800000e0:	ffc10113          	addi	sp,sp,-4

800000e4 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000e4:	00001597          	auipc	a1,0x1
800000e8:	3ac58593          	addi	a1,a1,940 # 80001490 <trap_induced_ebreak.0>
  beq a0,a1,ctors_done
800000ec:	00b50e63          	beq	a0,a1,80000108 <ctors_done>
  lw a3,0(a0)
800000f0:	00052683          	lw	a3,0(a0)
  add a0,a0,4
800000f4:	00450513          	addi	a0,a0,4
  sw a0,0(sp)
800000f8:	00a12023          	sw	a0,0(sp)
  jalr  a3
800000fc:	000680e7          	jalr	a3
  lw a0,0(sp)
80000100:	00012503          	lw	a0,0(sp)
  j ctors_loop
80000104:	fe1ff06f          	j	800000e4 <ctors_loop>

80000108 <ctors_done>:
ctors_done:
  addi sp,sp,4
80000108:	00410113          	addi	sp,sp,4
  //li a0, 0x880     //880 enable timer + external interrupts
  //csrw mie,a0
  //li a0, 0x1808     //1808 enable interrupts
  //csrw mstatus,a0

  call main
8000010c:	0e8010ef          	jal	ra,800011f4 <main>

80000110 <infinitLoop>:
infinitLoop:
  j infinitLoop
80000110:	0000006f          	j	80000110 <infinitLoop>

Disassembly of section .memory:

80000114 <uart_applyConfig.constprop.0>:
	while(uart_writeAvailability(reg) == 0);
	reg->DATA = data;
}

static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
	reg->CLOCK_DIVIDER = config->clockDivider;
80000114:	f00107b7          	lui	a5,0xf0010
80000118:	01400713          	li	a4,20
8000011c:	00e7a423          	sw	a4,8(a5) # f0010008 <_stack_start+0x7000e368>
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
80000120:	00700713          	li	a4,7
80000124:	00e7a623          	sw	a4,12(a5)
}
80000128:	00008067          	ret

8000012c <uart_readOccupancy.constprop.0>:
	return reg->STATUS >> 24;
8000012c:	f00107b7          	lui	a5,0xf0010
80000130:	0047a503          	lw	a0,4(a5) # f0010004 <_stack_start+0x7000e364>
}
80000134:	01855513          	srli	a0,a0,0x18
80000138:	00008067          	ret

8000013c <uart_read.constprop.0>:

static char uart_read(Uart_Reg *reg){
8000013c:	ff010113          	addi	sp,sp,-16
80000140:	00112623          	sw	ra,12(sp)
	while(uart_readOccupancy(reg) == 0);
80000144:	fe9ff0ef          	jal	ra,8000012c <uart_readOccupancy.constprop.0>
80000148:	fe050ee3          	beqz	a0,80000144 <uart_read.constprop.0+0x8>
	return reg->DATA;
8000014c:	f00107b7          	lui	a5,0xf0010
80000150:	0007a503          	lw	a0,0(a5) # f0010000 <_stack_start+0x7000e360>
}
80000154:	00c12083          	lw	ra,12(sp)
80000158:	0ff57513          	zext.b	a0,a0
8000015c:	01010113          	addi	sp,sp,16
80000160:	00008067          	ret

80000164 <uart_writeAvailability.constprop.0>:
	return (reg->STATUS >> 16) & 0xFF;
80000164:	f00107b7          	lui	a5,0xf0010
80000168:	0047a503          	lw	a0,4(a5) # f0010004 <_stack_start+0x7000e364>
8000016c:	01055513          	srli	a0,a0,0x10
}
80000170:	0ff57513          	zext.b	a0,a0
80000174:	00008067          	ret

80000178 <uart_write.constprop.0>:
static void uart_write(Uart_Reg *reg, uint32_t data){
80000178:	ff010113          	addi	sp,sp,-16
8000017c:	00812423          	sw	s0,8(sp)
80000180:	00112623          	sw	ra,12(sp)
80000184:	00050413          	mv	s0,a0
	while(uart_writeAvailability(reg) == 0);
80000188:	fddff0ef          	jal	ra,80000164 <uart_writeAvailability.constprop.0>
8000018c:	fe050ee3          	beqz	a0,80000188 <uart_write.constprop.0+0x10>
	reg->DATA = data;
80000190:	f00107b7          	lui	a5,0xf0010
}
80000194:	00c12083          	lw	ra,12(sp)
	reg->DATA = data;
80000198:	0087a023          	sw	s0,0(a5) # f0010000 <_stack_start+0x7000e360>
}
8000019c:	00812403          	lw	s0,8(sp)
800001a0:	01010113          	addi	sp,sp,16
800001a4:	00008067          	ret

800001a8 <uart_put_hex8.constprop.0>:
    } else {
        print("FAILURE!\n");
	return(1);
    }
}
static void uart_put_hex8(Uart_Reg *reg, uint8_t hex) {
800001a8:	ff010113          	addi	sp,sp,-16
800001ac:	00812423          	sw	s0,8(sp)
  int num_nibbles = sizeof(hex) * 2;
  for (int nibble_idx = num_nibbles - 1; nibble_idx >= 0; nibble_idx--) {
    char nibble = (hex >> (nibble_idx * 4)) & 0xf;
800001b0:	00455793          	srli	a5,a0,0x4
800001b4:	40455693          	srai	a3,a0,0x4
static void uart_put_hex8(Uart_Reg *reg, uint8_t hex) {
800001b8:	00112623          	sw	ra,12(sp)
    uart_write(UART, (nibble < 0xa) ? ('0' + nibble) : ('a' + nibble - 0xa));
800001bc:	00900713          	li	a4,9
static void uart_put_hex8(Uart_Reg *reg, uint8_t hex) {
800001c0:	00050413          	mv	s0,a0
    uart_write(UART, (nibble < 0xa) ? ('0' + nibble) : ('a' + nibble - 0xa));
800001c4:	05778513          	addi	a0,a5,87
800001c8:	00d74463          	blt	a4,a3,800001d0 <uart_put_hex8.constprop.0+0x28>
800001cc:	03078513          	addi	a0,a5,48
800001d0:	fa9ff0ef          	jal	ra,80000178 <uart_write.constprop.0>
    char nibble = (hex >> (nibble_idx * 4)) & 0xf;
800001d4:	00f47413          	andi	s0,s0,15
    uart_write(UART, (nibble < 0xa) ? ('0' + nibble) : ('a' + nibble - 0xa));
800001d8:	00900793          	li	a5,9
800001dc:	03040513          	addi	a0,s0,48
800001e0:	0087f463          	bgeu	a5,s0,800001e8 <uart_put_hex8.constprop.0+0x40>
800001e4:	05740513          	addi	a0,s0,87
  }
}
800001e8:	00812403          	lw	s0,8(sp)
800001ec:	00c12083          	lw	ra,12(sp)
800001f0:	01010113          	addi	sp,sp,16
    uart_write(UART, (nibble < 0xa) ? ('0' + nibble) : ('a' + nibble - 0xa));
800001f4:	f85ff06f          	j	80000178 <uart_write.constprop.0>

800001f8 <phex>:
{
800001f8:	ff010113          	addi	sp,sp,-16
800001fc:	00812423          	sw	s0,8(sp)
80000200:	00912223          	sw	s1,4(sp)
80000204:	00112623          	sw	ra,12(sp)
80000208:	00050413          	mv	s0,a0
8000020c:	01050493          	addi	s1,a0,16
    	uart_put_hex8(UART, str[i]);
80000210:	00044503          	lbu	a0,0(s0)
    for (i = 0; i < len; ++i) {
80000214:	00140413          	addi	s0,s0,1
    	uart_put_hex8(UART, str[i]);
80000218:	f91ff0ef          	jal	ra,800001a8 <uart_put_hex8.constprop.0>
    for (i = 0; i < len; ++i) {
8000021c:	fe941ae3          	bne	s0,s1,80000210 <phex+0x18>
}
80000220:	00c12083          	lw	ra,12(sp)
80000224:	00812403          	lw	s0,8(sp)
80000228:	00412483          	lw	s1,4(sp)
8000022c:	01010113          	addi	sp,sp,16
80000230:	00008067          	ret

80000234 <test_encrypt_ecb_scan>:
    // Example of more verbose verification

    uint8_t i;

    // 128bit key
    uint8_t key[16] = { 0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c };
80000234:	800017b7          	lui	a5,0x80001
80000238:	26478793          	addi	a5,a5,612 # 80001264 <_stack_start+0xfffff5c4>
8000023c:	0007a603          	lw	a2,0(a5)
80000240:	0047a683          	lw	a3,4(a5)
80000244:	0087a703          	lw	a4,8(a5)
80000248:	00c7a783          	lw	a5,12(a5)
{
8000024c:	f2010113          	addi	sp,sp,-224
80000250:	0c812c23          	sw	s0,216(sp)
80000254:	0c912a23          	sw	s1,212(sp)
80000258:	0c112e23          	sw	ra,220(sp)
    uint8_t key[16] = { 0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c };
8000025c:	00c12023          	sw	a2,0(sp)
80000260:	00d12223          	sw	a3,4(sp)
80000264:	00e12423          	sw	a4,8(sp)
80000268:	00f12623          	sw	a5,12(sp)
    uint8_t plain_text[16];

    // print text to encrypt, key and IV
    // print("ECB encrypt scan:\r\n");
    // scan for input plaintext from uart
    for (i = (uint8_t) 0; i < (uint8_t) 16; i++)
8000026c:	01010413          	addi	s0,sp,16
80000270:	02010493          	addi	s1,sp,32
        {
            plain_text[i] = uart_read(UART);
80000274:	ec9ff0ef          	jal	ra,8000013c <uart_read.constprop.0>
80000278:	00a40023          	sb	a0,0(s0)
    for (i = (uint8_t) 0; i < (uint8_t) 16; i++)
8000027c:	00140413          	addi	s0,s0,1
80000280:	fe849ae3          	bne	s1,s0,80000274 <test_encrypt_ecb_scan+0x40>
            // uart_put_hex8(UART,plain_text[i]);
        }

    // print("plain text:\r\n");
    phex(plain_text);
80000284:	01010513          	addi	a0,sp,16
80000288:	f71ff0ef          	jal	ra,800001f8 <phex>

    // print("key:\r\n");
    phex(key);
8000028c:	00010513          	mv	a0,sp
80000290:	f69ff0ef          	jal	ra,800001f8 <phex>

    // print the resulting cipher as 4 x 16 byte strings
    struct AES_ctx ctx;
    AES_init_ctx(&ctx, key);
80000294:	00010593          	mv	a1,sp
80000298:	00048513          	mv	a0,s1
8000029c:	60d000ef          	jal	ra,800010a8 <AES_init_ctx>
    AES_ECB_encrypt(&ctx, plain_text);
800002a0:	01010593          	addi	a1,sp,16
800002a4:	00048513          	mv	a0,s1
800002a8:	605000ef          	jal	ra,800010ac <AES_ECB_encrypt>
    phex(plain_text);
800002ac:	01010513          	addi	a0,sp,16
800002b0:	f49ff0ef          	jal	ra,800001f8 <phex>
}
800002b4:	0dc12083          	lw	ra,220(sp)
800002b8:	0d812403          	lw	s0,216(sp)
800002bc:	0d412483          	lw	s1,212(sp)
800002c0:	0e010113          	addi	sp,sp,224
800002c4:	00008067          	ret

800002c8 <print>:
void print(char *str){
800002c8:	ff010113          	addi	sp,sp,-16
800002cc:	00812423          	sw	s0,8(sp)
800002d0:	00112623          	sw	ra,12(sp)
800002d4:	00050413          	mv	s0,a0
	while(*str){
800002d8:	00054503          	lbu	a0,0(a0)
800002dc:	00050a63          	beqz	a0,800002f0 <print+0x28>
		uart_write(UART,*(str++));
800002e0:	00140413          	addi	s0,s0,1
800002e4:	e95ff0ef          	jal	ra,80000178 <uart_write.constprop.0>
	while(*str){
800002e8:	00044503          	lbu	a0,0(s0)
800002ec:	fe051ae3          	bnez	a0,800002e0 <print+0x18>
}
800002f0:	00c12083          	lw	ra,12(sp)
800002f4:	00812403          	lw	s0,8(sp)
800002f8:	01010113          	addi	sp,sp,16
800002fc:	00008067          	ret

80000300 <irqCallback>:
    int mepc    = csr_read(mepc);       // Address of trap
80000300:	341025f3          	csrr	a1,mepc
    int mtval   = csr_read(mtval);      // Instruction value of trap
80000304:	34302673          	csrr	a2,mtval
    int mcause  = csr_read(mcause);     // Reason for the trap
80000308:	342026f3          	csrr	a3,mcause
    if (!trap_induced_ebreak){
8000030c:	800017b7          	lui	a5,0x80001
80000310:	4907a703          	lw	a4,1168(a5) # 80001490 <_stack_start+0xfffff7f0>
80000314:	02071263          	bnez	a4,80000338 <irqCallback+0x38>
        exception_addr  = mepc;
80000318:	80b1a623          	sw	a1,-2036(gp) # 8000149c <exception_addr>
        exception_instr = mtval;
8000031c:	80001737          	lui	a4,0x80001
80000320:	48c72c23          	sw	a2,1176(a4) # 80001498 <_stack_start+0xfffff7f8>
        exception_cause = mcause;
80000324:	80001737          	lui	a4,0x80001
80000328:	48d72a23          	sw	a3,1172(a4) # 80001494 <_stack_start+0xfffff7f4>
        trap_induced_ebreak = 1;
8000032c:	00100713          	li	a4,1
80000330:	48e7a823          	sw	a4,1168(a5)
        asm volatile (
80000334:	00100073          	ebreak
    while(1)
80000338:	0000006f          	j	80000338 <irqCallback+0x38>

8000033c <clock>:
	return TIMER_A->VALUE;
8000033c:	f00207b7          	lui	a5,0xf0020
80000340:	0487a503          	lw	a0,72(a5) # f0020048 <_stack_start+0x7001e3a8>
}
80000344:	00008067          	ret

80000348 <memcpy1>:

#define unlikely(X) __builtin_expect (!!(X), 0)
extern int memcmp1(const void* s1, const void* s2, size_t n);
void *
memcpy1(void *__restrict aa, const void *__restrict bb, size_t n)
{
80000348:	fe010113          	addi	sp,sp,-32

  char *a = (char *)aa;
  const char *b = (const char *)bb;
  char *end = a + n;
  uintptr_t msk = sizeof (long) - 1;
  if (unlikely ((((uintptr_t)a & msk) != ((uintptr_t)b & msk))
8000034c:	00b547b3          	xor	a5,a0,a1
{
80000350:	00812c23          	sw	s0,24(sp)
80000354:	01212823          	sw	s2,16(sp)
80000358:	01312623          	sw	s3,12(sp)
8000035c:	00112e23          	sw	ra,28(sp)
80000360:	00912a23          	sw	s1,20(sp)
  if (unlikely ((((uintptr_t)a & msk) != ((uintptr_t)b & msk))
80000364:	0037f793          	andi	a5,a5,3
{
80000368:	00050993          	mv	s3,a0
8000036c:	00058413          	mv	s0,a1
  char *end = a + n;
80000370:	00c50933          	add	s2,a0,a2
  if (unlikely ((((uintptr_t)a & msk) != ((uintptr_t)b & msk))
80000374:	10079063          	bnez	a5,80000474 <memcpy1+0x12c>
80000378:	00300793          	li	a5,3
8000037c:	0ec7fc63          	bgeu	a5,a2,80000474 <memcpy1+0x12c>
	while (a < end)
	  BODY (a, b, char);
      return aa;
    }

  if (unlikely (((uintptr_t)a & msk) != 0))
80000380:	00357713          	andi	a4,a0,3
80000384:	00050793          	mv	a5,a0
80000388:	06071063          	bnez	a4,800003e8 <memcpy1+0xa0>
    while ((uintptr_t)a & msk)
      BODY (a, b, char);

  long *la = (long *)a;
  const long *lb = (const long *)b;
  long *lend = (long *)((uintptr_t)end & ~msk);
8000038c:	ffc97713          	andi	a4,s2,-4

  if (unlikely (la < (lend - 8)))
80000390:	fe070693          	addi	a3,a4,-32
80000394:	08d7e463          	bltu	a5,a3,8000041c <memcpy1+0xd4>
	  *la++ = b7;
	  *la++ = b8;
	}
    }

  while (la < lend)
80000398:	02e7f663          	bgeu	a5,a4,800003c4 <memcpy1+0x7c>
    BODY (la, lb, long);
8000039c:	fff70493          	addi	s1,a4,-1
800003a0:	40f484b3          	sub	s1,s1,a5
800003a4:	ffc4f493          	andi	s1,s1,-4
800003a8:	00448493          	addi	s1,s1,4
800003ac:	00040593          	mv	a1,s0
800003b0:	00078513          	mv	a0,a5
800003b4:	00048613          	mv	a2,s1
800003b8:	515000ef          	jal	ra,800010cc <memcpy>
800003bc:	009507b3          	add	a5,a0,s1
800003c0:	00940433          	add	s0,s0,s1

  a = (char *)la;
  b = (const char *)lb;
  if (unlikely (a < end))
800003c4:	0b27ec63          	bltu	a5,s2,8000047c <memcpy1+0x134>
    goto small;
  return aa;
}
800003c8:	01c12083          	lw	ra,28(sp)
800003cc:	01812403          	lw	s0,24(sp)
800003d0:	01412483          	lw	s1,20(sp)
800003d4:	01012903          	lw	s2,16(sp)
800003d8:	00098513          	mv	a0,s3
800003dc:	00c12983          	lw	s3,12(sp)
800003e0:	02010113          	addi	sp,sp,32
800003e4:	00008067          	ret
      BODY (a, b, char);
800003e8:	00044683          	lbu	a3,0(s0)
800003ec:	00178793          	addi	a5,a5,1
    while ((uintptr_t)a & msk)
800003f0:	0037f713          	andi	a4,a5,3
      BODY (a, b, char);
800003f4:	fed78fa3          	sb	a3,-1(a5)
800003f8:	00140413          	addi	s0,s0,1
    while ((uintptr_t)a & msk)
800003fc:	f80708e3          	beqz	a4,8000038c <memcpy1+0x44>
      BODY (a, b, char);
80000400:	00044683          	lbu	a3,0(s0)
80000404:	00178793          	addi	a5,a5,1
    while ((uintptr_t)a & msk)
80000408:	0037f713          	andi	a4,a5,3
      BODY (a, b, char);
8000040c:	fed78fa3          	sb	a3,-1(a5)
80000410:	00140413          	addi	s0,s0,1
    while ((uintptr_t)a & msk)
80000414:	fc071ae3          	bnez	a4,800003e8 <memcpy1+0xa0>
80000418:	f75ff06f          	j	8000038c <memcpy1+0x44>
	  long b0 = *lb++;
8000041c:	00042f03          	lw	t5,0(s0)
80000420:	00442e83          	lw	t4,4(s0)
80000424:	00842e03          	lw	t3,8(s0)
80000428:	00c42303          	lw	t1,12(s0)
8000042c:	01042883          	lw	a7,16(s0)
80000430:	01442803          	lw	a6,20(s0)
80000434:	01842503          	lw	a0,24(s0)
80000438:	01c42583          	lw	a1,28(s0)
8000043c:	02042603          	lw	a2,32(s0)
	  long b8 = *lb++;
80000440:	02478793          	addi	a5,a5,36
	  *la++ = b0;
80000444:	fde7ae23          	sw	t5,-36(a5)
80000448:	ffd7a023          	sw	t4,-32(a5)
8000044c:	ffc7a223          	sw	t3,-28(a5)
80000450:	fe67a423          	sw	t1,-24(a5)
80000454:	ff17a623          	sw	a7,-20(a5)
80000458:	ff07a823          	sw	a6,-16(a5)
8000045c:	fea7aa23          	sw	a0,-12(a5)
80000460:	feb7ac23          	sw	a1,-8(a5)
80000464:	fec7ae23          	sw	a2,-4(a5)
80000468:	02440413          	addi	s0,s0,36
      while (la < (lend - 8))
8000046c:	fad7e8e3          	bltu	a5,a3,8000041c <memcpy1+0xd4>
80000470:	f29ff06f          	j	80000398 <memcpy1+0x50>
      if (__builtin_expect (a < end, 1))
80000474:	00098793          	mv	a5,s3
80000478:	f529f8e3          	bgeu	s3,s2,800003c8 <memcpy1+0x80>
	  BODY (a, b, char);
8000047c:	00178713          	addi	a4,a5,1
80000480:	00100613          	li	a2,1
80000484:	02e97863          	bgeu	s2,a4,800004b4 <memcpy1+0x16c>
80000488:	00040593          	mv	a1,s0
8000048c:	00078513          	mv	a0,a5
80000490:	43d000ef          	jal	ra,800010cc <memcpy>
}
80000494:	01c12083          	lw	ra,28(sp)
80000498:	01812403          	lw	s0,24(sp)
8000049c:	01412483          	lw	s1,20(sp)
800004a0:	01012903          	lw	s2,16(sp)
800004a4:	00098513          	mv	a0,s3
800004a8:	00c12983          	lw	s3,12(sp)
800004ac:	02010113          	addi	sp,sp,32
800004b0:	00008067          	ret
	  BODY (a, b, char);
800004b4:	40f90633          	sub	a2,s2,a5
800004b8:	00040593          	mv	a1,s0
800004bc:	00078513          	mv	a0,a5
800004c0:	40d000ef          	jal	ra,800010cc <memcpy>
800004c4:	fd1ff06f          	j	80000494 <memcpy1+0x14c>

800004c8 <memcmp1>:
int memcmp1(const void* s1, const void* s2, size_t n)
{
  if ((((uintptr_t)s1 | (uintptr_t)s2) & (sizeof(uintptr_t)-1)) == 0) {
800004c8:	00b567b3          	or	a5,a0,a1
800004cc:	0037f793          	andi	a5,a5,3
800004d0:	02079e63          	bnez	a5,8000050c <memcmp1+0x44>
    const uintptr_t* u1 = s1;
    const uintptr_t* u2 = s2;
    const uintptr_t* end = u1 + (n / sizeof(uintptr_t));
800004d4:	ffc67813          	andi	a6,a2,-4
800004d8:	01050833          	add	a6,a0,a6
    while (u1 < end) {
800004dc:	03057863          	bgeu	a0,a6,8000050c <memcmp1+0x44>
800004e0:	00050793          	mv	a5,a0
800004e4:	0100006f          	j	800004f4 <memcmp1+0x2c>
      if (*u1 != *u2)
        break;
      u1++;
800004e8:	00478793          	addi	a5,a5,4
      u2++;
800004ec:	00458593          	addi	a1,a1,4
    while (u1 < end) {
800004f0:	0107f863          	bgeu	a5,a6,80000500 <memcmp1+0x38>
      if (*u1 != *u2)
800004f4:	0007a683          	lw	a3,0(a5)
800004f8:	0005a703          	lw	a4,0(a1)
800004fc:	fee686e3          	beq	a3,a4,800004e8 <memcmp1+0x20>
    }
    n -= (const void*)u1 - s1;
80000500:	40a78533          	sub	a0,a5,a0
80000504:	40a60633          	sub	a2,a2,a0
      u1++;
80000508:	00078513          	mv	a0,a5
    s1 = u1;
    s2 = u2;
8000050c:	00c58633          	add	a2,a1,a2
80000510:	0140006f          	j	80000524 <memcmp1+0x5c>
  }

  while (n--) {
    unsigned char c1 = *(const unsigned char*)s1++;
    unsigned char c2 = *(const unsigned char*)s2++;
80000514:	0005c703          	lbu	a4,0(a1)
    unsigned char c1 = *(const unsigned char*)s1++;
80000518:	fff54783          	lbu	a5,-1(a0)
    unsigned char c2 = *(const unsigned char*)s2++;
8000051c:	00158593          	addi	a1,a1,1
    if (c1 != c2)
80000520:	00e79a63          	bne	a5,a4,80000534 <memcmp1+0x6c>
    unsigned char c1 = *(const unsigned char*)s1++;
80000524:	00150513          	addi	a0,a0,1
  while (n--) {
80000528:	fec596e3          	bne	a1,a2,80000514 <memcmp1+0x4c>
      return c1 - c2;
  }

  return 0;
8000052c:	00000513          	li	a0,0
}
80000530:	00008067          	ret
      return c1 - c2;
80000534:	40e78533          	sub	a0,a5,a4
80000538:	00008067          	ret

8000053c <KeyExpansion>:
{
  unsigned i, j, k;
  uint8_t tempa[4]; // Used for the column/row operations
  
  // The first round key is the key itself.
  for (i = 0; i < Nk; ++i)
8000053c:	00350793          	addi	a5,a0,3
{
80000540:	fd010113          	addi	sp,sp,-48
80000544:	40b787b3          	sub	a5,a5,a1
80000548:	02812623          	sw	s0,44(sp)
8000054c:	02912423          	sw	s1,40(sp)
80000550:	03212223          	sw	s2,36(sp)
80000554:	03312023          	sw	s3,32(sp)
80000558:	01412e23          	sw	s4,28(sp)
8000055c:	01512c23          	sw	s5,24(sp)
80000560:	01612a23          	sw	s6,20(sp)
80000564:	01712823          	sw	s7,16(sp)
80000568:	01812623          	sw	s8,12(sp)
8000056c:	01912423          	sw	s9,8(sp)
80000570:	01a12223          	sw	s10,4(sp)
80000574:	0077b793          	sltiu	a5,a5,7
80000578:	18079263          	bnez	a5,800006fc <KeyExpansion+0x1c0>
8000057c:	00b567b3          	or	a5,a0,a1
80000580:	0037f793          	andi	a5,a5,3
80000584:	16079c63          	bnez	a5,800006fc <KeyExpansion+0x1c0>
  {
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
80000588:	0005a783          	lw	a5,0(a1)
8000058c:	00f52023          	sw	a5,0(a0)
80000590:	0045a783          	lw	a5,4(a1)
80000594:	00f52223          	sw	a5,4(a0)
80000598:	0085a783          	lw	a5,8(a1)
8000059c:	00f52423          	sw	a5,8(a0)
800005a0:	00c5a783          	lw	a5,12(a1)
800005a4:	00f52623          	sw	a5,12(a0)
      // applies the S-box to each of the four bytes to produce an output word.

      // Function Subword()
      {
        tempa[0] = getSBoxValue(tempa[0]);
        tempa[1] = getSBoxValue(tempa[1]);
800005a8:	80001637          	lui	a2,0x80001
800005ac:	00354a83          	lbu	s5,3(a0)
800005b0:	00754983          	lbu	s3,7(a0)
800005b4:	00b54903          	lbu	s2,11(a0)
800005b8:	00f54e03          	lbu	t3,15(a0)
800005bc:	00254b03          	lbu	s6,2(a0)
800005c0:	00654483          	lbu	s1,6(a0)
800005c4:	00a54403          	lbu	s0,10(a0)
800005c8:	00e54303          	lbu	t1,14(a0)
800005cc:	00154383          	lbu	t2,1(a0)
800005d0:	00554283          	lbu	t0,5(a0)
800005d4:	00954f83          	lbu	t6,9(a0)
800005d8:	00d54883          	lbu	a7,13(a0)
800005dc:	00054b83          	lbu	s7,0(a0)
800005e0:	00454f03          	lbu	t5,4(a0)
800005e4:	00854e83          	lbu	t4,8(a0)
800005e8:	00c54803          	lbu	a6,12(a0)
  for (i = Nk; i < Nb * (Nr + 1); ++i)
800005ec:	00400593          	li	a1,4
800005f0:	01050513          	addi	a0,a0,16
        tempa[1] = getSBoxValue(tempa[1]);
800005f4:	28460613          	addi	a2,a2,644 # 80001284 <_stack_start+0xfffff5e4>
  for (i = Nk; i < Nb * (Nr + 1); ++i)
800005f8:	02c00a13          	li	s4,44
800005fc:	0980006f          	j	80000694 <KeyExpansion+0x158>
        tempa[2] = getSBoxValue(tempa[2]);
        tempa[3] = getSBoxValue(tempa[3]);
      }

      tempa[0] = tempa[0] ^ Rcon[i/Nk];
80000600:	100d4783          	lbu	a5,256(s10)
80000604:	000ccc83          	lbu	s9,0(s9)
        tempa[1] = getSBoxValue(tempa[1]);
80000608:	000c4c03          	lbu	s8,0(s8)
        tempa[2] = getSBoxValue(tempa[2]);
8000060c:	0006c683          	lbu	a3,0(a3)
        tempa[3] = getSBoxValue(tempa[3]);
80000610:	00074703          	lbu	a4,0(a4)
      tempa[0] = tempa[0] ^ Rcon[i/Nk];
80000614:	0197c7b3          	xor	a5,a5,s9
        tempa[3] = getSBoxValue(tempa[3]);
      }
    }
#endif
    j = i * 4; k=(i - Nk) * 4;
    RoundKey[j + 0] = RoundKey[k + 0] ^ tempa[0];
80000618:	0177c7b3          	xor	a5,a5,s7
    RoundKey[j + 1] = RoundKey[k + 1] ^ tempa[1];
8000061c:	007c4c33          	xor	s8,s8,t2
    RoundKey[j + 2] = RoundKey[k + 2] ^ tempa[2];
80000620:	00db46b3          	xor	a3,s6,a3
    RoundKey[j + 3] = RoundKey[k + 3] ^ tempa[3];
80000624:	01574733          	xor	a4,a4,s5
    RoundKey[j + 0] = RoundKey[k + 0] ^ tempa[0];
80000628:	0ff7f793          	zext.b	a5,a5
    RoundKey[j + 1] = RoundKey[k + 1] ^ tempa[1];
8000062c:	0ffc7c13          	zext.b	s8,s8
    RoundKey[j + 2] = RoundKey[k + 2] ^ tempa[2];
80000630:	0ff6f693          	zext.b	a3,a3
    RoundKey[j + 3] = RoundKey[k + 3] ^ tempa[3];
80000634:	0ff77713          	zext.b	a4,a4
    RoundKey[j + 0] = RoundKey[k + 0] ^ tempa[0];
80000638:	00f50023          	sb	a5,0(a0)
    RoundKey[j + 1] = RoundKey[k + 1] ^ tempa[1];
8000063c:	018500a3          	sb	s8,1(a0)
    RoundKey[j + 2] = RoundKey[k + 2] ^ tempa[2];
80000640:	00d50123          	sb	a3,2(a0)
    RoundKey[j + 3] = RoundKey[k + 3] ^ tempa[3];
80000644:	00e501a3          	sb	a4,3(a0)
  for (i = Nk; i < Nb * (Nr + 1); ++i)
80000648:	00158593          	addi	a1,a1,1
8000064c:	00098a93          	mv	s5,s3
80000650:	00048b13          	mv	s6,s1
80000654:	00090993          	mv	s3,s2
80000658:	00040493          	mv	s1,s0
8000065c:	00028393          	mv	t2,t0
80000660:	000f0b93          	mv	s7,t5
80000664:	000f8293          	mv	t0,t6
80000668:	000e8f13          	mv	t5,t4
8000066c:	000e0913          	mv	s2,t3
80000670:	00030413          	mv	s0,t1
80000674:	00088f93          	mv	t6,a7
80000678:	00080e93          	mv	t4,a6
8000067c:	00450513          	addi	a0,a0,4
80000680:	05458463          	beq	a1,s4,800006c8 <KeyExpansion+0x18c>
80000684:	00078813          	mv	a6,a5
80000688:	000c0893          	mv	a7,s8
8000068c:	00068313          	mv	t1,a3
80000690:	00070e13          	mv	t3,a4
      tempa[0] = tempa[0] ^ Rcon[i/Nk];
80000694:	0025d793          	srli	a5,a1,0x2
80000698:	00f60d33          	add	s10,a2,a5
    if (i % Nk == 0)
8000069c:	0035f793          	andi	a5,a1,3
        tempa[0] = getSBoxValue(tempa[0]);
800006a0:	01160cb3          	add	s9,a2,a7
        tempa[1] = getSBoxValue(tempa[1]);
800006a4:	00660c33          	add	s8,a2,t1
        tempa[2] = getSBoxValue(tempa[2]);
800006a8:	01c606b3          	add	a3,a2,t3
        tempa[3] = getSBoxValue(tempa[3]);
800006ac:	01060733          	add	a4,a2,a6
    if (i % Nk == 0)
800006b0:	f40788e3          	beqz	a5,80000600 <KeyExpansion+0xc4>
      tempa[3]=RoundKey[k + 3];
800006b4:	000e0713          	mv	a4,t3
      tempa[2]=RoundKey[k + 2];
800006b8:	00030693          	mv	a3,t1
      tempa[1]=RoundKey[k + 1];
800006bc:	00088c13          	mv	s8,a7
      tempa[0]=RoundKey[k + 0];
800006c0:	00080793          	mv	a5,a6
800006c4:	f55ff06f          	j	80000618 <KeyExpansion+0xdc>
  }
}
800006c8:	02c12403          	lw	s0,44(sp)
800006cc:	02812483          	lw	s1,40(sp)
800006d0:	02412903          	lw	s2,36(sp)
800006d4:	02012983          	lw	s3,32(sp)
800006d8:	01c12a03          	lw	s4,28(sp)
800006dc:	01812a83          	lw	s5,24(sp)
800006e0:	01412b03          	lw	s6,20(sp)
800006e4:	01012b83          	lw	s7,16(sp)
800006e8:	00c12c03          	lw	s8,12(sp)
800006ec:	00812c83          	lw	s9,8(sp)
800006f0:	00412d03          	lw	s10,4(sp)
800006f4:	03010113          	addi	sp,sp,48
800006f8:	00008067          	ret
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
800006fc:	0005c783          	lbu	a5,0(a1)
80000700:	00f50023          	sb	a5,0(a0)
    RoundKey[(i * 4) + 1] = Key[(i * 4) + 1];
80000704:	0015c783          	lbu	a5,1(a1)
80000708:	00f500a3          	sb	a5,1(a0)
    RoundKey[(i * 4) + 2] = Key[(i * 4) + 2];
8000070c:	0025c783          	lbu	a5,2(a1)
80000710:	00f50123          	sb	a5,2(a0)
    RoundKey[(i * 4) + 3] = Key[(i * 4) + 3];
80000714:	0035c783          	lbu	a5,3(a1)
80000718:	00f501a3          	sb	a5,3(a0)
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
8000071c:	0045c783          	lbu	a5,4(a1)
80000720:	00f50223          	sb	a5,4(a0)
    RoundKey[(i * 4) + 1] = Key[(i * 4) + 1];
80000724:	0055c783          	lbu	a5,5(a1)
80000728:	00f502a3          	sb	a5,5(a0)
    RoundKey[(i * 4) + 2] = Key[(i * 4) + 2];
8000072c:	0065c783          	lbu	a5,6(a1)
80000730:	00f50323          	sb	a5,6(a0)
    RoundKey[(i * 4) + 3] = Key[(i * 4) + 3];
80000734:	0075c783          	lbu	a5,7(a1)
80000738:	00f503a3          	sb	a5,7(a0)
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
8000073c:	0085c783          	lbu	a5,8(a1)
80000740:	00f50423          	sb	a5,8(a0)
    RoundKey[(i * 4) + 1] = Key[(i * 4) + 1];
80000744:	0095c783          	lbu	a5,9(a1)
80000748:	00f504a3          	sb	a5,9(a0)
    RoundKey[(i * 4) + 2] = Key[(i * 4) + 2];
8000074c:	00a5c783          	lbu	a5,10(a1)
80000750:	00f50523          	sb	a5,10(a0)
    RoundKey[(i * 4) + 3] = Key[(i * 4) + 3];
80000754:	00b5c783          	lbu	a5,11(a1)
80000758:	00f505a3          	sb	a5,11(a0)
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
8000075c:	00c5c783          	lbu	a5,12(a1)
80000760:	00f50623          	sb	a5,12(a0)
    RoundKey[(i * 4) + 1] = Key[(i * 4) + 1];
80000764:	00d5c783          	lbu	a5,13(a1)
80000768:	00f506a3          	sb	a5,13(a0)
    RoundKey[(i * 4) + 2] = Key[(i * 4) + 2];
8000076c:	00e5c783          	lbu	a5,14(a1)
80000770:	00f50723          	sb	a5,14(a0)
    RoundKey[(i * 4) + 3] = Key[(i * 4) + 3];
80000774:	00f5c783          	lbu	a5,15(a1)
80000778:	00f507a3          	sb	a5,15(a0)
  for (i = 0; i < Nk; ++i)
8000077c:	e2dff06f          	j	800005a8 <KeyExpansion+0x6c>

80000780 <AddRoundKey>:
// This function adds the round key to state.
// The round key is added to the state by an XOR function.
static void AddRoundKey(uint8_t round, state_t* state, const uint8_t* RoundKey)
{
	uint8_t tmp;
	tmp = round * Nb * 4;
80000780:	00451513          	slli	a0,a0,0x4
80000784:	0ff57513          	zext.b	a0,a0
	(*state)[0][0] ^= RoundKey[tmp + 0];
80000788:	00a60633          	add	a2,a2,a0
8000078c:	00064783          	lbu	a5,0(a2)
80000790:	0005c703          	lbu	a4,0(a1)
	(*state)[1][0] ^= RoundKey[tmp + Nb + 0];
80000794:	0045c503          	lbu	a0,4(a1)
	(*state)[2][0] ^= RoundKey[tmp + 2 * Nb + 0];
80000798:	0085c683          	lbu	a3,8(a1)
	(*state)[0][0] ^= RoundKey[tmp + 0];
8000079c:	00e7c7b3          	xor	a5,a5,a4
800007a0:	00f58023          	sb	a5,0(a1)
	(*state)[1][0] ^= RoundKey[tmp + Nb + 0];
800007a4:	00464783          	lbu	a5,4(a2)
	(*state)[3][0] ^= RoundKey[tmp + 3 * Nb + 0];
800007a8:	00c5c703          	lbu	a4,12(a1)
	(*state)[0][1] ^= RoundKey[tmp + 1];
800007ac:	0015ce03          	lbu	t3,1(a1)
	(*state)[1][0] ^= RoundKey[tmp + Nb + 0];
800007b0:	00a7c7b3          	xor	a5,a5,a0
800007b4:	00f58223          	sb	a5,4(a1)
	(*state)[2][0] ^= RoundKey[tmp + 2 * Nb + 0];
800007b8:	00864783          	lbu	a5,8(a2)
	(*state)[2][1] ^= RoundKey[tmp + 2 * Nb + 1];
800007bc:	0095c303          	lbu	t1,9(a1)
	(*state)[3][1] ^= RoundKey[tmp + 3 * Nb + 1];
800007c0:	00d5c883          	lbu	a7,13(a1)
	(*state)[2][0] ^= RoundKey[tmp + 2 * Nb + 0];
800007c4:	00d7c7b3          	xor	a5,a5,a3
800007c8:	00f58423          	sb	a5,8(a1)
	(*state)[3][0] ^= RoundKey[tmp + 3 * Nb + 0];
800007cc:	00c64783          	lbu	a5,12(a2)
	(*state)[0][2] ^= RoundKey[tmp + 2];
800007d0:	0025c803          	lbu	a6,2(a1)
	(*state)[1][2] ^= RoundKey[tmp + Nb + 2];
800007d4:	0065c503          	lbu	a0,6(a1)
	(*state)[3][0] ^= RoundKey[tmp + 3 * Nb + 0];
800007d8:	00e7c7b3          	xor	a5,a5,a4
800007dc:	00f58623          	sb	a5,12(a1)
	(*state)[0][1] ^= RoundKey[tmp + 1];
800007e0:	00164783          	lbu	a5,1(a2)
	(*state)[2][2] ^= RoundKey[tmp + 2 * Nb + 2];
800007e4:	00a5c683          	lbu	a3,10(a1)
	(*state)[3][2] ^= RoundKey[tmp + 3 * Nb + 2];
800007e8:	00e5c703          	lbu	a4,14(a1)
	(*state)[0][1] ^= RoundKey[tmp + 1];
800007ec:	01c7c7b3          	xor	a5,a5,t3
800007f0:	00f580a3          	sb	a5,1(a1)
	(*state)[2][1] ^= RoundKey[tmp + 2 * Nb + 1];
800007f4:	00964783          	lbu	a5,9(a2)
800007f8:	0067c7b3          	xor	a5,a5,t1
800007fc:	00f584a3          	sb	a5,9(a1)
	(*state)[3][1] ^= RoundKey[tmp + 3 * Nb + 1];
80000800:	00d64783          	lbu	a5,13(a2)
80000804:	0117c7b3          	xor	a5,a5,a7
80000808:	00f586a3          	sb	a5,13(a1)
	(*state)[0][2] ^= RoundKey[tmp + 2];
8000080c:	00264783          	lbu	a5,2(a2)
80000810:	0107c7b3          	xor	a5,a5,a6
80000814:	00f58123          	sb	a5,2(a1)
	(*state)[1][2] ^= RoundKey[tmp + Nb + 2];
80000818:	00664783          	lbu	a5,6(a2)
8000081c:	00a7c7b3          	xor	a5,a5,a0
80000820:	00f58323          	sb	a5,6(a1)
	(*state)[2][2] ^= RoundKey[tmp + 2 * Nb + 2];
80000824:	00a64783          	lbu	a5,10(a2)
80000828:	00d7c7b3          	xor	a5,a5,a3
8000082c:	00f58523          	sb	a5,10(a1)
	(*state)[3][2] ^= RoundKey[tmp + 3 * Nb + 2];
80000830:	00e64783          	lbu	a5,14(a2)
80000834:	00e7c7b3          	xor	a5,a5,a4
80000838:	00f58723          	sb	a5,14(a1)
	(*state)[0][3] ^= RoundKey[tmp + 3];
8000083c:	00364783          	lbu	a5,3(a2)
80000840:	0035c703          	lbu	a4,3(a1)
	(*state)[1][3] ^= RoundKey[tmp + Nb + 3];
80000844:	0075c803          	lbu	a6,7(a1)
	(*state)[2][3] ^= RoundKey[tmp + 2 * Nb + 3];
80000848:	00b5c503          	lbu	a0,11(a1)
	(*state)[0][3] ^= RoundKey[tmp + 3];
8000084c:	00e7c7b3          	xor	a5,a5,a4
80000850:	00f581a3          	sb	a5,3(a1)
	(*state)[1][3] ^= RoundKey[tmp + Nb + 3];
80000854:	00764783          	lbu	a5,7(a2)
	(*state)[3][3] ^= RoundKey[tmp + 3 * Nb + 3];
80000858:	00f5c683          	lbu	a3,15(a1)
	(*state)[1][1] ^= RoundKey[tmp + Nb + 1];
8000085c:	0055c703          	lbu	a4,5(a1)
	(*state)[1][3] ^= RoundKey[tmp + Nb + 3];
80000860:	0107c7b3          	xor	a5,a5,a6
80000864:	00f583a3          	sb	a5,7(a1)
	(*state)[2][3] ^= RoundKey[tmp + 2 * Nb + 3];
80000868:	00b64783          	lbu	a5,11(a2)
8000086c:	00a7c7b3          	xor	a5,a5,a0
80000870:	00f585a3          	sb	a5,11(a1)
	(*state)[3][3] ^= RoundKey[tmp + 3 * Nb + 3];
80000874:	00f64783          	lbu	a5,15(a2)
80000878:	00d7c7b3          	xor	a5,a5,a3
8000087c:	00f587a3          	sb	a5,15(a1)
	(*state)[1][1] ^= RoundKey[tmp + Nb + 1];
80000880:	00564783          	lbu	a5,5(a2)
80000884:	00e7c7b3          	xor	a5,a5,a4
80000888:	00f582a3          	sb	a5,5(a1)
}
8000088c:	00008067          	ret

80000890 <SubBytes>:
  uint8_t i, j;
  for (i = 0; i < 4; ++i)
  {
    for (j = 0; j < 4; ++j)
    {
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
80000890:	00054f83          	lbu	t6,0(a0)
80000894:	00454f03          	lbu	t5,4(a0)
80000898:	00854e83          	lbu	t4,8(a0)
8000089c:	00c54e03          	lbu	t3,12(a0)
800008a0:	00154303          	lbu	t1,1(a0)
800008a4:	00554883          	lbu	a7,5(a0)
800008a8:	00954803          	lbu	a6,9(a0)
800008ac:	00d54583          	lbu	a1,13(a0)
800008b0:	00254603          	lbu	a2,2(a0)
800008b4:	00654683          	lbu	a3,6(a0)
800008b8:	00a54703          	lbu	a4,10(a0)
800008bc:	800017b7          	lui	a5,0x80001
800008c0:	28478793          	addi	a5,a5,644 # 80001284 <_stack_start+0xfffff5e4>
800008c4:	01f78fb3          	add	t6,a5,t6
800008c8:	01e78f33          	add	t5,a5,t5
800008cc:	01d78eb3          	add	t4,a5,t4
800008d0:	01c78e33          	add	t3,a5,t3
800008d4:	00678333          	add	t1,a5,t1
800008d8:	011788b3          	add	a7,a5,a7
800008dc:	01078833          	add	a6,a5,a6
800008e0:	00b785b3          	add	a1,a5,a1
800008e4:	00c78633          	add	a2,a5,a2
800008e8:	00d786b3          	add	a3,a5,a3
800008ec:	00084803          	lbu	a6,0(a6)
800008f0:	0005c583          	lbu	a1,0(a1)
800008f4:	00064603          	lbu	a2,0(a2)
800008f8:	0006c683          	lbu	a3,0(a3)
800008fc:	000fcf83          	lbu	t6,0(t6)
80000900:	000f4f03          	lbu	t5,0(t5)
80000904:	000ece83          	lbu	t4,0(t4)
80000908:	000e4e03          	lbu	t3,0(t3)
8000090c:	00034303          	lbu	t1,0(t1)
80000910:	0008c883          	lbu	a7,0(a7)
80000914:	00e78733          	add	a4,a5,a4
80000918:	00074703          	lbu	a4,0(a4)
8000091c:	010504a3          	sb	a6,9(a0)
80000920:	00b506a3          	sb	a1,13(a0)
80000924:	00c50123          	sb	a2,2(a0)
80000928:	00d50323          	sb	a3,6(a0)
8000092c:	01f50023          	sb	t6,0(a0)
80000930:	01e50223          	sb	t5,4(a0)
80000934:	01d50423          	sb	t4,8(a0)
80000938:	01c50623          	sb	t3,12(a0)
8000093c:	006500a3          	sb	t1,1(a0)
80000940:	011502a3          	sb	a7,5(a0)
80000944:	00e50523          	sb	a4,10(a0)
80000948:	00e54583          	lbu	a1,14(a0)
8000094c:	00354603          	lbu	a2,3(a0)
80000950:	00754683          	lbu	a3,7(a0)
80000954:	00b54703          	lbu	a4,11(a0)
80000958:	00f54803          	lbu	a6,15(a0)
8000095c:	00b785b3          	add	a1,a5,a1
80000960:	00c78633          	add	a2,a5,a2
80000964:	00d786b3          	add	a3,a5,a3
80000968:	00e78733          	add	a4,a5,a4
8000096c:	010787b3          	add	a5,a5,a6
80000970:	0005c583          	lbu	a1,0(a1)
80000974:	00064603          	lbu	a2,0(a2)
80000978:	0006c683          	lbu	a3,0(a3)
8000097c:	00074703          	lbu	a4,0(a4)
80000980:	0007c783          	lbu	a5,0(a5)
80000984:	00b50723          	sb	a1,14(a0)
80000988:	00c501a3          	sb	a2,3(a0)
8000098c:	00d503a3          	sb	a3,7(a0)
80000990:	00e505a3          	sb	a4,11(a0)
80000994:	00f507a3          	sb	a5,15(a0)
    }
  }
}
80000998:	00008067          	ret

8000099c <ShiftRows>:
static void ShiftRows(state_t* state)
{
  uint8_t temp;

  // Rotate first row 1 columns to left  
  temp           = (*state)[0][1];
8000099c:	00154e03          	lbu	t3,1(a0)
  (*state)[0][1] = (*state)[1][1];
800009a0:	00554f83          	lbu	t6,5(a0)
  (*state)[1][1] = (*state)[2][1];
800009a4:	00954f03          	lbu	t5,9(a0)
  (*state)[2][1] = (*state)[3][1];
800009a8:	00d54e83          	lbu	t4,13(a0)
  (*state)[3][1] = temp;

  // Rotate second row 2 columns to left  
  temp           = (*state)[0][2];
800009ac:	00254883          	lbu	a7,2(a0)
  (*state)[0][2] = (*state)[2][2];
800009b0:	00a54303          	lbu	t1,10(a0)
  (*state)[2][2] = temp;

  temp           = (*state)[1][2];
800009b4:	00654583          	lbu	a1,6(a0)
  (*state)[1][2] = (*state)[3][2];
800009b8:	00e54803          	lbu	a6,14(a0)
  (*state)[3][2] = temp;

  // Rotate third row 3 columns to left
  temp           = (*state)[0][3];
800009bc:	00354783          	lbu	a5,3(a0)
  (*state)[0][3] = (*state)[3][3];
800009c0:	00f54603          	lbu	a2,15(a0)
  (*state)[3][3] = (*state)[2][3];
800009c4:	00b54683          	lbu	a3,11(a0)
  (*state)[2][3] = (*state)[1][3];
800009c8:	00754703          	lbu	a4,7(a0)
  (*state)[0][1] = (*state)[1][1];
800009cc:	01f500a3          	sb	t6,1(a0)
  (*state)[1][1] = (*state)[2][1];
800009d0:	01e502a3          	sb	t5,5(a0)
  (*state)[2][1] = (*state)[3][1];
800009d4:	01d504a3          	sb	t4,9(a0)
  (*state)[3][1] = temp;
800009d8:	01c506a3          	sb	t3,13(a0)
  (*state)[0][2] = (*state)[2][2];
800009dc:	00650123          	sb	t1,2(a0)
  (*state)[2][2] = temp;
800009e0:	01150523          	sb	a7,10(a0)
  (*state)[1][2] = (*state)[3][2];
800009e4:	01050323          	sb	a6,6(a0)
  (*state)[3][2] = temp;
800009e8:	00b50723          	sb	a1,14(a0)
  (*state)[0][3] = (*state)[3][3];
800009ec:	00c501a3          	sb	a2,3(a0)
  (*state)[3][3] = (*state)[2][3];
800009f0:	00d507a3          	sb	a3,15(a0)
  (*state)[2][3] = (*state)[1][3];
800009f4:	00e505a3          	sb	a4,11(a0)
  (*state)[1][3] = temp;
800009f8:	00f503a3          	sb	a5,7(a0)
}
800009fc:	00008067          	ret

80000a00 <xtime>:

static uint8_t xtime(uint8_t x)
{
  return ((x<<1) ^ (((x>>7) & 1) * 0x1b));
80000a00:	00755713          	srli	a4,a0,0x7
80000a04:	00371793          	slli	a5,a4,0x3
80000a08:	40e787b3          	sub	a5,a5,a4
80000a0c:	00279793          	slli	a5,a5,0x2
80000a10:	40e787b3          	sub	a5,a5,a4
80000a14:	00151513          	slli	a0,a0,0x1
80000a18:	00a7c533          	xor	a0,a5,a0
}
80000a1c:	0ff57513          	zext.b	a0,a0
80000a20:	00008067          	ret

80000a24 <MixColumns>:

// MixColumns function mixes the columns of the state matrix
static void MixColumns(state_t* state)
{
80000a24:	fe010113          	addi	sp,sp,-32
80000a28:	00112e23          	sw	ra,28(sp)
80000a2c:	00812c23          	sw	s0,24(sp)
80000a30:	00912a23          	sw	s1,20(sp)
80000a34:	01612023          	sw	s6,0(sp)
80000a38:	01212823          	sw	s2,16(sp)
80000a3c:	01312623          	sw	s3,12(sp)
80000a40:	01412423          	sw	s4,8(sp)
80000a44:	01512223          	sw	s5,4(sp)
  uint8_t i;
  uint8_t Tmp, Tm, t;
  for (i = 0; i < 4; ++i)
  {  
    t   = (*state)[i][0];
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
80000a48:	00354a83          	lbu	s5,3(a0)
    t   = (*state)[i][0];
80000a4c:	00054a03          	lbu	s4,0(a0)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
80000a50:	00254903          	lbu	s2,2(a0)
80000a54:	00154983          	lbu	s3,1(a0)
{
80000a58:	00050413          	mv	s0,a0
80000a5c:	012acb33          	xor	s6,s5,s2
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
80000a60:	0149c533          	xor	a0,s3,s4
80000a64:	00ab44b3          	xor	s1,s6,a0
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
80000a68:	f99ff0ef          	jal	ra,80000a00 <xtime>
80000a6c:	0144c7b3          	xor	a5,s1,s4
80000a70:	00f54533          	xor	a0,a0,a5
80000a74:	00a40023          	sb	a0,0(s0)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
80000a78:	01394533          	xor	a0,s2,s3
80000a7c:	f85ff0ef          	jal	ra,80000a00 <xtime>
80000a80:	0134c9b3          	xor	s3,s1,s3
80000a84:	01354533          	xor	a0,a0,s3
80000a88:	00a400a3          	sb	a0,1(s0)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
80000a8c:	000b0513          	mv	a0,s6
80000a90:	f71ff0ef          	jal	ra,80000a00 <xtime>
80000a94:	0124c933          	xor	s2,s1,s2
80000a98:	01254533          	xor	a0,a0,s2
80000a9c:	00a40123          	sb	a0,2(s0)
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
80000aa0:	014ac533          	xor	a0,s5,s4
80000aa4:	f5dff0ef          	jal	ra,80000a00 <xtime>
    t   = (*state)[i][0];
80000aa8:	00444b03          	lbu	s6,4(s0)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
80000aac:	00544a03          	lbu	s4,5(s0)
80000ab0:	00644903          	lbu	s2,6(s0)
80000ab4:	00744983          	lbu	s3,7(s0)
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
80000ab8:	0154c4b3          	xor	s1,s1,s5
80000abc:	009547b3          	xor	a5,a0,s1
80000ac0:	00f401a3          	sb	a5,3(s0)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
80000ac4:	013944b3          	xor	s1,s2,s3
80000ac8:	014b4533          	xor	a0,s6,s4
80000acc:	00954ab3          	xor	s5,a0,s1
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
80000ad0:	f31ff0ef          	jal	ra,80000a00 <xtime>
80000ad4:	015b47b3          	xor	a5,s6,s5
80000ad8:	00f54533          	xor	a0,a0,a5
80000adc:	00a40223          	sb	a0,4(s0)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
80000ae0:	012a4533          	xor	a0,s4,s2
80000ae4:	f1dff0ef          	jal	ra,80000a00 <xtime>
80000ae8:	015a4a33          	xor	s4,s4,s5
80000aec:	01454533          	xor	a0,a0,s4
80000af0:	00a402a3          	sb	a0,5(s0)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
80000af4:	00048513          	mv	a0,s1
80000af8:	f09ff0ef          	jal	ra,80000a00 <xtime>
80000afc:	01594933          	xor	s2,s2,s5
80000b00:	01254533          	xor	a0,a0,s2
80000b04:	00a40323          	sb	a0,6(s0)
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
80000b08:	013b4533          	xor	a0,s6,s3
80000b0c:	ef5ff0ef          	jal	ra,80000a00 <xtime>
    t   = (*state)[i][0];
80000b10:	00844b03          	lbu	s6,8(s0)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
80000b14:	00944903          	lbu	s2,9(s0)
80000b18:	00a44483          	lbu	s1,10(s0)
80000b1c:	00b44a03          	lbu	s4,11(s0)
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
80000b20:	0159c9b3          	xor	s3,s3,s5
80000b24:	013547b3          	xor	a5,a0,s3
80000b28:	00f403a3          	sb	a5,7(s0)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
80000b2c:	0144c9b3          	xor	s3,s1,s4
80000b30:	012b4533          	xor	a0,s6,s2
80000b34:	01354ab3          	xor	s5,a0,s3
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
80000b38:	ec9ff0ef          	jal	ra,80000a00 <xtime>
80000b3c:	015b47b3          	xor	a5,s6,s5
80000b40:	00f54533          	xor	a0,a0,a5
80000b44:	00a40423          	sb	a0,8(s0)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
80000b48:	00994533          	xor	a0,s2,s1
80000b4c:	eb5ff0ef          	jal	ra,80000a00 <xtime>
80000b50:	01594933          	xor	s2,s2,s5
80000b54:	01254533          	xor	a0,a0,s2
80000b58:	00a404a3          	sb	a0,9(s0)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
80000b5c:	00098513          	mv	a0,s3
80000b60:	ea1ff0ef          	jal	ra,80000a00 <xtime>
80000b64:	0154c4b3          	xor	s1,s1,s5
80000b68:	00954533          	xor	a0,a0,s1
80000b6c:	00a40523          	sb	a0,10(s0)
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
80000b70:	014b4533          	xor	a0,s6,s4
80000b74:	e8dff0ef          	jal	ra,80000a00 <xtime>
    t   = (*state)[i][0];
80000b78:	00c44b03          	lbu	s6,12(s0)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
80000b7c:	00d44983          	lbu	s3,13(s0)
80000b80:	00e44903          	lbu	s2,14(s0)
80000b84:	00f44483          	lbu	s1,15(s0)
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
80000b88:	015a4a33          	xor	s4,s4,s5
80000b8c:	014547b3          	xor	a5,a0,s4
80000b90:	00994ab3          	xor	s5,s2,s1
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
80000b94:	0169c533          	xor	a0,s3,s6
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
80000b98:	00f405a3          	sb	a5,11(s0)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
80000b9c:	01554a33          	xor	s4,a0,s5
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
80000ba0:	e61ff0ef          	jal	ra,80000a00 <xtime>
80000ba4:	014b47b3          	xor	a5,s6,s4
80000ba8:	00f54533          	xor	a0,a0,a5
80000bac:	00a40623          	sb	a0,12(s0)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
80000bb0:	0129c533          	xor	a0,s3,s2
80000bb4:	e4dff0ef          	jal	ra,80000a00 <xtime>
80000bb8:	0149c9b3          	xor	s3,s3,s4
80000bbc:	01354533          	xor	a0,a0,s3
80000bc0:	00a406a3          	sb	a0,13(s0)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
80000bc4:	000a8513          	mv	a0,s5
80000bc8:	e39ff0ef          	jal	ra,80000a00 <xtime>
80000bcc:	01494933          	xor	s2,s2,s4
80000bd0:	01254533          	xor	a0,a0,s2
80000bd4:	00a40723          	sb	a0,14(s0)
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
80000bd8:	0164c533          	xor	a0,s1,s6
80000bdc:	e25ff0ef          	jal	ra,80000a00 <xtime>
80000be0:	0144c4b3          	xor	s1,s1,s4
80000be4:	00954533          	xor	a0,a0,s1
80000be8:	00a407a3          	sb	a0,15(s0)
  }
}
80000bec:	01c12083          	lw	ra,28(sp)
80000bf0:	01812403          	lw	s0,24(sp)
80000bf4:	01412483          	lw	s1,20(sp)
80000bf8:	01012903          	lw	s2,16(sp)
80000bfc:	00c12983          	lw	s3,12(sp)
80000c00:	00812a03          	lw	s4,8(sp)
80000c04:	00412a83          	lw	s5,4(sp)
80000c08:	00012b03          	lw	s6,0(sp)
80000c0c:	02010113          	addi	sp,sp,32
80000c10:	00008067          	ret

80000c14 <InvMixColumns>:
#if (defined(CBC) && CBC == 1) || (defined(ECB) && ECB == 1)
// MixColumns function mixes the columns of the state matrix.
// The method used to multiply may be difficult to understand for the inexperienced.
// Please use the references to gain more information.
static void InvMixColumns(state_t* state)
{
80000c14:	fa010113          	addi	sp,sp,-96
80000c18:	01050793          	addi	a5,a0,16
80000c1c:	05612023          	sw	s6,64(sp)
80000c20:	04112e23          	sw	ra,92(sp)
80000c24:	04812c23          	sw	s0,88(sp)
80000c28:	04912a23          	sw	s1,84(sp)
80000c2c:	05212823          	sw	s2,80(sp)
80000c30:	05312623          	sw	s3,76(sp)
80000c34:	05412423          	sw	s4,72(sp)
80000c38:	05512223          	sw	s5,68(sp)
80000c3c:	03712e23          	sw	s7,60(sp)
80000c40:	03812c23          	sw	s8,56(sp)
80000c44:	03912a23          	sw	s9,52(sp)
80000c48:	03a12823          	sw	s10,48(sp)
80000c4c:	03b12623          	sw	s11,44(sp)
80000c50:	00050b13          	mv	s6,a0
80000c54:	00f12e23          	sw	a5,28(sp)
  int i;
  uint8_t a, b, c, d;
  for (i = 0; i < 4; ++i)
  { 
    a = (*state)[i][0];
80000c58:	000b4d03          	lbu	s10,0(s6)
    b = (*state)[i][1];
80000c5c:	001b4c83          	lbu	s9,1(s6)
    c = (*state)[i][2];
80000c60:	002b4b83          	lbu	s7,2(s6)
    d = (*state)[i][3];

    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000c64:	000d0513          	mv	a0,s10
80000c68:	d99ff0ef          	jal	ra,80000a00 <xtime>
80000c6c:	00a12c23          	sw	a0,24(sp)
80000c70:	d91ff0ef          	jal	ra,80000a00 <xtime>
80000c74:	00050993          	mv	s3,a0
80000c78:	d89ff0ef          	jal	ra,80000a00 <xtime>
80000c7c:	00050713          	mv	a4,a0
80000c80:	000c8513          	mv	a0,s9
80000c84:	00e12a23          	sw	a4,20(sp)
80000c88:	d79ff0ef          	jal	ra,80000a00 <xtime>
80000c8c:	00a12823          	sw	a0,16(sp)
80000c90:	d71ff0ef          	jal	ra,80000a00 <xtime>
80000c94:	00050a93          	mv	s5,a0
80000c98:	d69ff0ef          	jal	ra,80000a00 <xtime>
80000c9c:	00050793          	mv	a5,a0
80000ca0:	000b8513          	mv	a0,s7
80000ca4:	00f12623          	sw	a5,12(sp)
    d = (*state)[i][3];
80000ca8:	003b4c03          	lbu	s8,3(s6)
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000cac:	d55ff0ef          	jal	ra,80000a00 <xtime>
80000cb0:	00050413          	mv	s0,a0
80000cb4:	d4dff0ef          	jal	ra,80000a00 <xtime>
80000cb8:	00050913          	mv	s2,a0
80000cbc:	d45ff0ef          	jal	ra,80000a00 <xtime>
80000cc0:	00050493          	mv	s1,a0
80000cc4:	000c0513          	mv	a0,s8
80000cc8:	d39ff0ef          	jal	ra,80000a00 <xtime>
80000ccc:	00050a13          	mv	s4,a0
80000cd0:	d31ff0ef          	jal	ra,80000a00 <xtime>
80000cd4:	00050d93          	mv	s11,a0
80000cd8:	d29ff0ef          	jal	ra,80000a00 <xtime>
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000cdc:	01412703          	lw	a4,20(sp)
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000ce0:	01812803          	lw	a6,24(sp)
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000ce4:	01012583          	lw	a1,16(sp)
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000ce8:	00c12783          	lw	a5,12(sp)
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000cec:	01384333          	xor	t1,a6,s3
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000cf0:	00b748b3          	xor	a7,a4,a1
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000cf4:	00e9c6b3          	xor	a3,s3,a4
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
80000cf8:	00e84833          	xor	a6,a6,a4
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000cfc:	011ac8b3          	xor	a7,s5,a7
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000d00:	00674733          	xor	a4,a4,t1
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000d04:	00d7c6b3          	xor	a3,a5,a3
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000d08:	00e5c5b3          	xor	a1,a1,a4
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000d0c:	0117c733          	xor	a4,a5,a7
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000d10:	00d446b3          	xor	a3,s0,a3
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
80000d14:	010acab3          	xor	s5,s5,a6
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000d18:	00e44433          	xor	s0,s0,a4
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
80000d1c:	0157cab3          	xor	s5,a5,s5
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000d20:	0084c433          	xor	s0,s1,s0
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000d24:	00b7c7b3          	xor	a5,a5,a1
80000d28:	00f94633          	xor	a2,s2,a5
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000d2c:	00d946b3          	xor	a3,s2,a3
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000d30:	008dc7b3          	xor	a5,s11,s0
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
80000d34:	0154cab3          	xor	s5,s1,s5
80000d38:	015a4ab3          	xor	s5,s4,s5
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000d3c:	00f547b3          	xor	a5,a0,a5
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000d40:	00d4c6b3          	xor	a3,s1,a3
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000d44:	00fd47b3          	xor	a5,s10,a5
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000d48:	00c4c733          	xor	a4,s1,a2
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000d4c:	00da4a33          	xor	s4,s4,a3
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
80000d50:	015dcdb3          	xor	s11,s11,s5
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000d54:	00e54733          	xor	a4,a0,a4
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000d58:	01454a33          	xor	s4,a0,s4
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000d5c:	00fbc7b3          	xor	a5,s7,a5
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
80000d60:	01b54533          	xor	a0,a0,s11
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000d64:	00fc47b3          	xor	a5,s8,a5
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000d68:	00ecc733          	xor	a4,s9,a4
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000d6c:	014d4a33          	xor	s4,s10,s4
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
80000d70:	00ad4d33          	xor	s10,s10,a0
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000d74:	00ebc733          	xor	a4,s7,a4
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000d78:	014cca33          	xor	s4,s9,s4
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
80000d7c:	00fb00a3          	sb	a5,1(s6)
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
80000d80:	01acccb3          	xor	s9,s9,s10
  for (i = 0; i < 4; ++i)
80000d84:	01c12783          	lw	a5,28(sp)
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000d88:	00ec4733          	xor	a4,s8,a4
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
80000d8c:	019bcbb3          	xor	s7,s7,s9
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000d90:	014c4c33          	xor	s8,s8,s4
    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
80000d94:	00eb0023          	sb	a4,0(s6)
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
80000d98:	018b0123          	sb	s8,2(s6)
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
80000d9c:	017b01a3          	sb	s7,3(s6)
  for (i = 0; i < 4; ++i)
80000da0:	004b0b13          	addi	s6,s6,4
80000da4:	eb679ae3          	bne	a5,s6,80000c58 <InvMixColumns+0x44>
  }
}
80000da8:	05c12083          	lw	ra,92(sp)
80000dac:	05812403          	lw	s0,88(sp)
80000db0:	05412483          	lw	s1,84(sp)
80000db4:	05012903          	lw	s2,80(sp)
80000db8:	04c12983          	lw	s3,76(sp)
80000dbc:	04812a03          	lw	s4,72(sp)
80000dc0:	04412a83          	lw	s5,68(sp)
80000dc4:	04012b03          	lw	s6,64(sp)
80000dc8:	03c12b83          	lw	s7,60(sp)
80000dcc:	03812c03          	lw	s8,56(sp)
80000dd0:	03412c83          	lw	s9,52(sp)
80000dd4:	03012d03          	lw	s10,48(sp)
80000dd8:	02c12d83          	lw	s11,44(sp)
80000ddc:	06010113          	addi	sp,sp,96
80000de0:	00008067          	ret

80000de4 <InvSubBytes>:
  uint8_t i, j;
  for (i = 0; i < 4; ++i)
  {
    for (j = 0; j < 4; ++j)
    {
      (*state)[j][i] = getSBoxInvert((*state)[j][i]);
80000de4:	00054f83          	lbu	t6,0(a0)
80000de8:	00454f03          	lbu	t5,4(a0)
80000dec:	00854e83          	lbu	t4,8(a0)
80000df0:	00c54e03          	lbu	t3,12(a0)
80000df4:	00154303          	lbu	t1,1(a0)
80000df8:	00554883          	lbu	a7,5(a0)
80000dfc:	00954803          	lbu	a6,9(a0)
80000e00:	00d54583          	lbu	a1,13(a0)
80000e04:	00254603          	lbu	a2,2(a0)
80000e08:	00654683          	lbu	a3,6(a0)
80000e0c:	00a54703          	lbu	a4,10(a0)
80000e10:	800017b7          	lui	a5,0x80001
80000e14:	28478793          	addi	a5,a5,644 # 80001284 <_stack_start+0xfffff5e4>
80000e18:	01f78fb3          	add	t6,a5,t6
80000e1c:	01e78f33          	add	t5,a5,t5
80000e20:	01d78eb3          	add	t4,a5,t4
80000e24:	01c78e33          	add	t3,a5,t3
80000e28:	00678333          	add	t1,a5,t1
80000e2c:	011788b3          	add	a7,a5,a7
80000e30:	01078833          	add	a6,a5,a6
80000e34:	00b785b3          	add	a1,a5,a1
80000e38:	00c78633          	add	a2,a5,a2
80000e3c:	00d786b3          	add	a3,a5,a3
80000e40:	10c84803          	lbu	a6,268(a6)
80000e44:	10c5c583          	lbu	a1,268(a1)
80000e48:	10c64603          	lbu	a2,268(a2)
80000e4c:	10c6c683          	lbu	a3,268(a3)
80000e50:	10cfcf83          	lbu	t6,268(t6)
80000e54:	10cf4f03          	lbu	t5,268(t5)
80000e58:	10cece83          	lbu	t4,268(t4)
80000e5c:	10ce4e03          	lbu	t3,268(t3)
80000e60:	10c34303          	lbu	t1,268(t1)
80000e64:	10c8c883          	lbu	a7,268(a7)
80000e68:	00e78733          	add	a4,a5,a4
80000e6c:	10c74703          	lbu	a4,268(a4)
80000e70:	010504a3          	sb	a6,9(a0)
80000e74:	00b506a3          	sb	a1,13(a0)
80000e78:	00c50123          	sb	a2,2(a0)
80000e7c:	00d50323          	sb	a3,6(a0)
80000e80:	01f50023          	sb	t6,0(a0)
80000e84:	01e50223          	sb	t5,4(a0)
80000e88:	01d50423          	sb	t4,8(a0)
80000e8c:	01c50623          	sb	t3,12(a0)
80000e90:	006500a3          	sb	t1,1(a0)
80000e94:	011502a3          	sb	a7,5(a0)
80000e98:	00e50523          	sb	a4,10(a0)
80000e9c:	00e54583          	lbu	a1,14(a0)
80000ea0:	00354603          	lbu	a2,3(a0)
80000ea4:	00754683          	lbu	a3,7(a0)
80000ea8:	00b54703          	lbu	a4,11(a0)
80000eac:	00f54803          	lbu	a6,15(a0)
80000eb0:	00b785b3          	add	a1,a5,a1
80000eb4:	00c78633          	add	a2,a5,a2
80000eb8:	00d786b3          	add	a3,a5,a3
80000ebc:	00e78733          	add	a4,a5,a4
80000ec0:	010787b3          	add	a5,a5,a6
80000ec4:	10c5c583          	lbu	a1,268(a1)
80000ec8:	10c64603          	lbu	a2,268(a2)
80000ecc:	10c6c683          	lbu	a3,268(a3)
80000ed0:	10c74703          	lbu	a4,268(a4)
80000ed4:	10c7c783          	lbu	a5,268(a5)
80000ed8:	00b50723          	sb	a1,14(a0)
80000edc:	00c501a3          	sb	a2,3(a0)
80000ee0:	00d503a3          	sb	a3,7(a0)
80000ee4:	00e505a3          	sb	a4,11(a0)
80000ee8:	00f507a3          	sb	a5,15(a0)
    }
  }
}
80000eec:	00008067          	ret

80000ef0 <InvShiftRows>:
static void InvShiftRows(state_t* state)
{
  uint8_t temp;

  // Rotate first row 1 columns to right  
  temp = (*state)[3][1];
80000ef0:	00d54e03          	lbu	t3,13(a0)
  (*state)[3][1] = (*state)[2][1];
80000ef4:	00954f83          	lbu	t6,9(a0)
  (*state)[2][1] = (*state)[1][1];
80000ef8:	00554f03          	lbu	t5,5(a0)
  (*state)[1][1] = (*state)[0][1];
80000efc:	00154e83          	lbu	t4,1(a0)
  (*state)[0][1] = temp;

  // Rotate second row 2 columns to right 
  temp = (*state)[0][2];
80000f00:	00254883          	lbu	a7,2(a0)
  (*state)[0][2] = (*state)[2][2];
80000f04:	00a54303          	lbu	t1,10(a0)
  (*state)[2][2] = temp;

  temp = (*state)[1][2];
80000f08:	00654583          	lbu	a1,6(a0)
  (*state)[1][2] = (*state)[3][2];
80000f0c:	00e54803          	lbu	a6,14(a0)
  (*state)[3][2] = temp;

  // Rotate third row 3 columns to right
  temp = (*state)[0][3];
80000f10:	00354783          	lbu	a5,3(a0)
  (*state)[0][3] = (*state)[1][3];
80000f14:	00754603          	lbu	a2,7(a0)
  (*state)[1][3] = (*state)[2][3];
80000f18:	00b54683          	lbu	a3,11(a0)
  (*state)[2][3] = (*state)[3][3];
80000f1c:	00f54703          	lbu	a4,15(a0)
  (*state)[3][1] = (*state)[2][1];
80000f20:	01f506a3          	sb	t6,13(a0)
  (*state)[2][1] = (*state)[1][1];
80000f24:	01e504a3          	sb	t5,9(a0)
  (*state)[1][1] = (*state)[0][1];
80000f28:	01d502a3          	sb	t4,5(a0)
  (*state)[0][1] = temp;
80000f2c:	01c500a3          	sb	t3,1(a0)
  (*state)[0][2] = (*state)[2][2];
80000f30:	00650123          	sb	t1,2(a0)
  (*state)[2][2] = temp;
80000f34:	01150523          	sb	a7,10(a0)
  (*state)[1][2] = (*state)[3][2];
80000f38:	01050323          	sb	a6,6(a0)
  (*state)[3][2] = temp;
80000f3c:	00b50723          	sb	a1,14(a0)
  (*state)[0][3] = (*state)[1][3];
80000f40:	00c501a3          	sb	a2,3(a0)
  (*state)[1][3] = (*state)[2][3];
80000f44:	00d503a3          	sb	a3,7(a0)
  (*state)[2][3] = (*state)[3][3];
80000f48:	00e505a3          	sb	a4,11(a0)
  (*state)[3][3] = temp;
80000f4c:	00f507a3          	sb	a5,15(a0)
}
80000f50:	00008067          	ret

80000f54 <Cipher>:
#endif // #if (defined(CBC) && CBC == 1) || (defined(ECB) && ECB == 1)

static void Cipher(state_t* state, const uint8_t* RoundKey)
{ // uncomment print.. and uart_state().. if needed
80000f54:	fe010113          	addi	sp,sp,-32
80000f58:	00812c23          	sw	s0,24(sp)
80000f5c:	00912a23          	sw	s1,20(sp)
80000f60:	01212823          	sw	s2,16(sp)
80000f64:	01312623          	sw	s3,12(sp)
80000f68:	00112e23          	sw	ra,28(sp)
  uint8_t round = 0;
  // Add the First round key to the state before starting the rounds.
//  print("\r\nStart state!\r\n");
//  uart_state(UART, state);
  GPIO_A_BASE->OUTPUT = 0x0001;
80000f6c:	f00007b7          	lui	a5,0xf0000
80000f70:	00100713          	li	a4,1
  
  AddRoundKey(0, state, RoundKey); 
80000f74:	00058613          	mv	a2,a1
{ // uncomment print.. and uart_state().. if needed
80000f78:	00050493          	mv	s1,a0
80000f7c:	00058913          	mv	s2,a1
  GPIO_A_BASE->OUTPUT = 0x0001;
80000f80:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6fffe364>
  AddRoundKey(0, state, RoundKey); 
80000f84:	00050593          	mv	a1,a0
80000f88:	00000513          	li	a0,0
80000f8c:	ff4ff0ef          	jal	ra,80000780 <AddRoundKey>
//  uart_state(UART, state);

  // There will be Nr rounds.
  // The first Nr-1 rounds are identical.
  // These Nr-1 rounds are executed in the loop below.
  for (round = 1; round < Nr; ++round)
80000f90:	00100413          	li	s0,1
80000f94:	00a00993          	li	s3,10
  {
	SubBytes(state);
80000f98:	00048513          	mv	a0,s1
80000f9c:	8f5ff0ef          	jal	ra,80000890 <SubBytes>
//	print("\r\nAfter subbyte!\r\n");
//	uart_state(UART, state);
    ShiftRows(state);
80000fa0:	00048513          	mv	a0,s1
80000fa4:	9f9ff0ef          	jal	ra,8000099c <ShiftRows>
//    print("\r\nAfter shiftrow!\r\n");
//    uart_state(UART, state);
    MixColumns(state);
80000fa8:	00048513          	mv	a0,s1
80000fac:	a79ff0ef          	jal	ra,80000a24 <MixColumns>
//    print("\r\nAfter mix column!\r\n");
//    uart_state(UART, state);
    AddRoundKey(round, state, RoundKey);
80000fb0:	00040513          	mv	a0,s0
  for (round = 1; round < Nr; ++round)
80000fb4:	00140413          	addi	s0,s0,1
    AddRoundKey(round, state, RoundKey);
80000fb8:	00090613          	mv	a2,s2
80000fbc:	00048593          	mv	a1,s1
  for (round = 1; round < Nr; ++round)
80000fc0:	0ff47413          	zext.b	s0,s0
    AddRoundKey(round, state, RoundKey);
80000fc4:	fbcff0ef          	jal	ra,80000780 <AddRoundKey>
  for (round = 1; round < Nr; ++round)
80000fc8:	fd3418e3          	bne	s0,s3,80000f98 <Cipher+0x44>
//    uart_state(UART, state);
  }
  
  // The last round is given below.
  // The MixColumns function is not here in the last round.
  SubBytes(state);
80000fcc:	00048513          	mv	a0,s1
80000fd0:	8c1ff0ef          	jal	ra,80000890 <SubBytes>
//  print("\r\nAfter subbyte!\r\n");
//  	uart_state(UART, state);
  ShiftRows(state);
80000fd4:	00048513          	mv	a0,s1
80000fd8:	9c5ff0ef          	jal	ra,8000099c <ShiftRows>
//  print("\r\nAfter shiftrow!\r\n");
//  	uart_state(UART, state);
  AddRoundKey(Nr, state, RoundKey);
80000fdc:	00090613          	mv	a2,s2
80000fe0:	00048593          	mv	a1,s1
80000fe4:	00a00513          	li	a0,10
80000fe8:	f98ff0ef          	jal	ra,80000780 <AddRoundKey>
//  print("\r\nAfter last add round key!\r\n");
//  	uart_state(UART, state);
  GPIO_A_BASE->OUTPUT = 0x0000;
}
80000fec:	01c12083          	lw	ra,28(sp)
80000ff0:	01812403          	lw	s0,24(sp)
  GPIO_A_BASE->OUTPUT = 0x0000;
80000ff4:	f00007b7          	lui	a5,0xf0000
80000ff8:	0007a223          	sw	zero,4(a5) # f0000004 <_stack_start+0x6fffe364>
}
80000ffc:	01412483          	lw	s1,20(sp)
80001000:	01012903          	lw	s2,16(sp)
80001004:	00c12983          	lw	s3,12(sp)
80001008:	02010113          	addi	sp,sp,32
8000100c:	00008067          	ret

80001010 <InvCipher>:


#if (defined(CBC) && CBC == 1) || (defined(ECB) && ECB == 1)
static void InvCipher(state_t* state, const uint8_t* RoundKey)
{
80001010:	ff010113          	addi	sp,sp,-16
80001014:	00912223          	sw	s1,4(sp)
80001018:	01212023          	sw	s2,0(sp)
  uint8_t round = 0;
//  UART0_REG(AES_REG_TRIGGER) = 1;
  // Add the First round key to the state before starting the rounds.
  AddRoundKey(Nr, state, RoundKey); 
8000101c:	00058613          	mv	a2,a1
{
80001020:	00050493          	mv	s1,a0
80001024:	00058913          	mv	s2,a1
  AddRoundKey(Nr, state, RoundKey); 
80001028:	00050593          	mv	a1,a0
8000102c:	00a00513          	li	a0,10
{
80001030:	00812423          	sw	s0,8(sp)
80001034:	00112623          	sw	ra,12(sp)

  // There will be Nr rounds.
  // The first Nr-1 rounds are identical.
  // These Nr-1 rounds are executed in the loop below.
  for (round = (Nr - 1); round > 0; --round)
80001038:	00900413          	li	s0,9
  AddRoundKey(Nr, state, RoundKey); 
8000103c:	f44ff0ef          	jal	ra,80000780 <AddRoundKey>
  {
    InvShiftRows(state);
80001040:	00048513          	mv	a0,s1
80001044:	eadff0ef          	jal	ra,80000ef0 <InvShiftRows>
    InvSubBytes(state);
80001048:	00048513          	mv	a0,s1
8000104c:	d99ff0ef          	jal	ra,80000de4 <InvSubBytes>
    AddRoundKey(round, state, RoundKey);
80001050:	00040513          	mv	a0,s0
80001054:	00090613          	mv	a2,s2
80001058:	00048593          	mv	a1,s1
8000105c:	f24ff0ef          	jal	ra,80000780 <AddRoundKey>
  for (round = (Nr - 1); round > 0; --round)
80001060:	fff40413          	addi	s0,s0,-1
    InvMixColumns(state);
80001064:	00048513          	mv	a0,s1
  for (round = (Nr - 1); round > 0; --round)
80001068:	0ff47413          	zext.b	s0,s0
    InvMixColumns(state);
8000106c:	ba9ff0ef          	jal	ra,80000c14 <InvMixColumns>
  for (round = (Nr - 1); round > 0; --round)
80001070:	fc0418e3          	bnez	s0,80001040 <InvCipher+0x30>
  }
  
  // The last round is given below.
  // The MixColumns function is not here in the last round.
  InvShiftRows(state);
80001074:	00048513          	mv	a0,s1
80001078:	e79ff0ef          	jal	ra,80000ef0 <InvShiftRows>
  InvSubBytes(state);
8000107c:	00048513          	mv	a0,s1
80001080:	d65ff0ef          	jal	ra,80000de4 <InvSubBytes>
  AddRoundKey(0, state, RoundKey);
//  UART0_REG(AES_REG_TRIGGER) = 0;
}
80001084:	00812403          	lw	s0,8(sp)
80001088:	00c12083          	lw	ra,12(sp)
  AddRoundKey(0, state, RoundKey);
8000108c:	00090613          	mv	a2,s2
80001090:	00048593          	mv	a1,s1
}
80001094:	00012903          	lw	s2,0(sp)
80001098:	00412483          	lw	s1,4(sp)
  AddRoundKey(0, state, RoundKey);
8000109c:	00000513          	li	a0,0
}
800010a0:	01010113          	addi	sp,sp,16
  AddRoundKey(0, state, RoundKey);
800010a4:	edcff06f          	j	80000780 <AddRoundKey>

800010a8 <AES_init_ctx>:
  KeyExpansion(ctx->RoundKey, key);
800010a8:	c94ff06f          	j	8000053c <KeyExpansion>

800010ac <AES_ECB_encrypt>:
#endif // #if (defined(CBC) && CBC == 1) || (defined(ECB) && ECB == 1)
#if defined(ECB) && (ECB == 1)


void AES_ECB_encrypt(const struct AES_ctx* ctx, uint8_t* buf)
{
800010ac:	00050793          	mv	a5,a0
  // The next function call encrypts the PlainText with the Key using AES algorithm.
  Cipher((state_t*)buf, ctx->RoundKey);
800010b0:	00058513          	mv	a0,a1
800010b4:	00078593          	mv	a1,a5
800010b8:	e9dff06f          	j	80000f54 <Cipher>

800010bc <AES_ECB_decrypt>:
}

void AES_ECB_decrypt(const struct AES_ctx* ctx, uint8_t* buf)
{
800010bc:	00050793          	mv	a5,a0
  // The next function call decrypts the PlainText with the Key using AES algorithm.
  InvCipher((state_t*)buf, ctx->RoundKey);
800010c0:	00058513          	mv	a0,a1
800010c4:	00078593          	mv	a1,a5
800010c8:	f49ff06f          	j	80001010 <InvCipher>

800010cc <memcpy>:
800010cc:	00b547b3          	xor	a5,a0,a1
800010d0:	0037f793          	andi	a5,a5,3
800010d4:	00c508b3          	add	a7,a0,a2
800010d8:	06079663          	bnez	a5,80001144 <memcpy+0x78>
800010dc:	00300793          	li	a5,3
800010e0:	06c7f263          	bgeu	a5,a2,80001144 <memcpy+0x78>
800010e4:	00357793          	andi	a5,a0,3
800010e8:	00050713          	mv	a4,a0
800010ec:	0c079a63          	bnez	a5,800011c0 <memcpy+0xf4>
800010f0:	ffc8f613          	andi	a2,a7,-4
800010f4:	40e606b3          	sub	a3,a2,a4
800010f8:	02000793          	li	a5,32
800010fc:	02000293          	li	t0,32
80001100:	06d7c263          	blt	a5,a3,80001164 <memcpy+0x98>
80001104:	00058693          	mv	a3,a1
80001108:	00070793          	mv	a5,a4
8000110c:	02c77863          	bgeu	a4,a2,8000113c <memcpy+0x70>
80001110:	0006a803          	lw	a6,0(a3)
80001114:	00478793          	addi	a5,a5,4
80001118:	00468693          	addi	a3,a3,4
8000111c:	ff07ae23          	sw	a6,-4(a5)
80001120:	fec7e8e3          	bltu	a5,a2,80001110 <memcpy+0x44>
80001124:	fff60793          	addi	a5,a2,-1
80001128:	40e787b3          	sub	a5,a5,a4
8000112c:	ffc7f793          	andi	a5,a5,-4
80001130:	00478793          	addi	a5,a5,4
80001134:	00f70733          	add	a4,a4,a5
80001138:	00f585b3          	add	a1,a1,a5
8000113c:	01176863          	bltu	a4,a7,8000114c <memcpy+0x80>
80001140:	00008067          	ret
80001144:	00050713          	mv	a4,a0
80001148:	ff157ce3          	bgeu	a0,a7,80001140 <memcpy+0x74>
8000114c:	0005c783          	lbu	a5,0(a1)
80001150:	00170713          	addi	a4,a4,1
80001154:	00158593          	addi	a1,a1,1
80001158:	fef70fa3          	sb	a5,-1(a4)
8000115c:	ff1768e3          	bltu	a4,a7,8000114c <memcpy+0x80>
80001160:	00008067          	ret
80001164:	0045a683          	lw	a3,4(a1)
80001168:	01c5a783          	lw	a5,28(a1)
8000116c:	0005af83          	lw	t6,0(a1)
80001170:	0085af03          	lw	t5,8(a1)
80001174:	00c5ae83          	lw	t4,12(a1)
80001178:	0105ae03          	lw	t3,16(a1)
8000117c:	0145a303          	lw	t1,20(a1)
80001180:	0185a803          	lw	a6,24(a1)
80001184:	00d72223          	sw	a3,4(a4)
80001188:	0205a683          	lw	a3,32(a1)
8000118c:	01f72023          	sw	t6,0(a4)
80001190:	01e72423          	sw	t5,8(a4)
80001194:	01d72623          	sw	t4,12(a4)
80001198:	01c72823          	sw	t3,16(a4)
8000119c:	00672a23          	sw	t1,20(a4)
800011a0:	01072c23          	sw	a6,24(a4)
800011a4:	00f72e23          	sw	a5,28(a4)
800011a8:	02470713          	addi	a4,a4,36
800011ac:	40e607b3          	sub	a5,a2,a4
800011b0:	fed72e23          	sw	a3,-4(a4)
800011b4:	02458593          	addi	a1,a1,36
800011b8:	faf2c6e3          	blt	t0,a5,80001164 <memcpy+0x98>
800011bc:	f49ff06f          	j	80001104 <memcpy+0x38>
800011c0:	0005c683          	lbu	a3,0(a1)
800011c4:	00170713          	addi	a4,a4,1
800011c8:	00377793          	andi	a5,a4,3
800011cc:	fed70fa3          	sb	a3,-1(a4)
800011d0:	00158593          	addi	a1,a1,1
800011d4:	f0078ee3          	beqz	a5,800010f0 <memcpy+0x24>
800011d8:	0005c683          	lbu	a3,0(a1)
800011dc:	00170713          	addi	a4,a4,1
800011e0:	00377793          	andi	a5,a4,3
800011e4:	fed70fa3          	sb	a3,-1(a4)
800011e8:	00158593          	addi	a1,a1,1
800011ec:	fc079ae3          	bnez	a5,800011c0 <memcpy+0xf4>
800011f0:	f01ff06f          	j	800010f0 <memcpy+0x24>

Disassembly of section .text.startup:

800011f4 <main>:
int main() {
800011f4:	fe010113          	addi	sp,sp,-32
800011f8:	00812c23          	sw	s0,24(sp)
    GPIO_A_BASE->OUTPUT_ENABLE = 0xFFFF;
800011fc:	00010437          	lui	s0,0x10
80001200:	f00007b7          	lui	a5,0xf0000
int main() {
80001204:	00112e23          	sw	ra,28(sp)
    GPIO_A_BASE->OUTPUT_ENABLE = 0xFFFF;
80001208:	fff40713          	addi	a4,s0,-1 # ffff <_stack_size+0xf7ff>
8000120c:	00e7a423          	sw	a4,8(a5) # f0000008 <_stack_start+0x6fffe368>
    GPIO_A_BASE->OUTPUT = 0x0000;
80001210:	0007a223          	sw	zero,4(a5)
	uart_applyConfig(UART,&uartConfig);
80001214:	00010513          	mv	a0,sp
80001218:	efdfe0ef          	jal	ra,80000114 <uart_applyConfig.constprop.0>
	TIMER_A->LIMIT = ~0;
8000121c:	f00207b7          	lui	a5,0xf0020
80001220:	fff00693          	li	a3,-1
	TIMER_A->CLEARS_TICKS = 0x00010001;
80001224:	00140413          	addi	s0,s0,1
	TIMER_A->LIMIT = ~0;
80001228:	04d7a223          	sw	a3,68(a5) # f0020044 <_stack_start+0x7001e3a4>
	TIMER_A->CLEARS_TICKS = 0x00010001;
8000122c:	0487a023          	sw	s0,64(a5)
80001230:	004c5437          	lui	s0,0x4c5
80001234:	b4040413          	addi	s0,s0,-1216 # 4c4b40 <_stack_size+0x4c4340>
	for (uint32_t i = 0; i < 5000000; i++) {
80001238:	fff40413          	addi	s0,s0,-1
        test_encrypt_ecb_scan();
8000123c:	ff9fe0ef          	jal	ra,80000234 <test_encrypt_ecb_scan>
	for (uint32_t i = 0; i < 5000000; i++) {
80001240:	fe041ce3          	bnez	s0,80001238 <main+0x44>
	print("Finish!\r\n");
80001244:	80001537          	lui	a0,0x80001
80001248:	27850513          	addi	a0,a0,632 # 80001278 <_stack_start+0xfffff5d8>
8000124c:	87cff0ef          	jal	ra,800002c8 <print>
}
80001250:	01c12083          	lw	ra,28(sp)
80001254:	01812403          	lw	s0,24(sp)
80001258:	00000513          	li	a0,0
8000125c:	02010113          	addi	sp,sp,32
80001260:	00008067          	ret
