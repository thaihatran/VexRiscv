
build/briey.elf:     file format elf32-littleriscv


Disassembly of section .vector:

80000000 <crtStart>:
.global crtStart
.global main
.global irqCallback

crtStart:
  j crtInit
80000000:	0b40006f          	j	800000b4 <crtInit>
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
80000064:	c0000097          	auipc	ra,0xc0000
80000068:	2e4080e7          	jalr	740(ra) # 40000348 <irqCallback>
  lw x1 , 15*4(sp)
8000006c:	03c12083          	lw	ra,60(sp)
  lw x5,  14*4(sp)
80000070:	03812283          	lw	t0,56(sp)
  lw x6,  13*4(sp)
80000074:	03412303          	lw	t1,52(sp)
  lw x7,  12*4(sp)
80000078:	03012383          	lw	t2,48(sp)
  lw x10, 11*4(sp)
8000007c:	02c12503          	lw	a0,44(sp)
  lw x11, 10*4(sp)
80000080:	02812583          	lw	a1,40(sp)
  lw x12,  9*4(sp)
80000084:	02412603          	lw	a2,36(sp)
  lw x13,  8*4(sp)
80000088:	02012683          	lw	a3,32(sp)
  lw x14,  7*4(sp)
8000008c:	01c12703          	lw	a4,28(sp)
  lw x15,  6*4(sp)
80000090:	01812783          	lw	a5,24(sp)
  lw x16,  5*4(sp)
80000094:	01412803          	lw	a6,20(sp)
  lw x17,  4*4(sp)
80000098:	01012883          	lw	a7,16(sp)
  lw x28,  3*4(sp)
8000009c:	00c12e03          	lw	t3,12(sp)
  lw x29,  2*4(sp)
800000a0:	00812e83          	lw	t4,8(sp)
  lw x30,  1*4(sp)
800000a4:	00412f03          	lw	t5,4(sp)
  lw x31,  0*4(sp)
800000a8:	00012f83          	lw	t6,0(sp)
  addi sp,sp,16*4
800000ac:	04010113          	addi	sp,sp,64
  mret
800000b0:	30200073          	mret

800000b4 <crtInit>:


crtInit:
  .option push
  .option norelax
  la gp, __global_pointer$
800000b4:	c0003197          	auipc	gp,0xc0003
800000b8:	16418193          	addi	gp,gp,356 # 40003218 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0003517          	auipc	a0,0xc0003
800000c8:	95450513          	addi	a0,a0,-1708 # 40002a18 <_bss_end>
  la a1, _bss_end
800000cc:	c0003597          	auipc	a1,0xc0003
800000d0:	94c58593          	addi	a1,a1,-1716 # 40002a18 <_bss_end>

800000d4 <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
800000d4:	00b50863          	beq	a0,a1,800000e4 <bss_done>
  sw zero,0(a0)
800000d8:	00052023          	sw	zero,0(a0)
  add a0,a0,4
800000dc:	00450513          	addi	a0,a0,4
  j bss_loop
800000e0:	ff5ff06f          	j	800000d4 <bss_loop>

800000e4 <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000e4:	c0003517          	auipc	a0,0xc0003
800000e8:	93450513          	addi	a0,a0,-1740 # 40002a18 <_bss_end>
  addi sp,sp,-4
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000f0:	c0003597          	auipc	a1,0xc0003
800000f4:	92858593          	addi	a1,a1,-1752 # 40002a18 <_bss_end>
  beq a0,a1,ctors_done
800000f8:	00b50e63          	beq	a0,a1,80000114 <ctors_done>
  lw a3,0(a0)
800000fc:	00052683          	lw	a3,0(a0)
  add a0,a0,4
80000100:	00450513          	addi	a0,a0,4
  sw a0,0(sp)
80000104:	00a12023          	sw	a0,0(sp)
  jalr  a3
80000108:	000680e7          	jalr	a3
  lw a0,0(sp)
8000010c:	00012503          	lw	a0,0(sp)
  j ctors_loop
80000110:	fe1ff06f          	j	800000f0 <ctors_loop>

80000114 <ctors_done>:
ctors_done:
  addi sp,sp,4
80000114:	00410113          	addi	sp,sp,4


  li a0, 0x880     //880 enable timer + external interrupts
80000118:	00001537          	lui	a0,0x1
8000011c:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x80>
  csrw mie,a0
80000120:	30451073          	csrw	mie,a0
  li a0, 0x1808     //1808 enable interrupts
80000124:	00002537          	lui	a0,0x2
80000128:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1008>
  csrw mstatus,a0
8000012c:	30051073          	csrw	mstatus,a0

  call main
80000130:	c0000097          	auipc	ra,0xc0000
80000134:	1ac080e7          	jalr	428(ra) # 400002dc <main>

80000138 <infinitLoop>:
infinitLoop:
  j infinitLoop
80000138:	0000006f          	j	80000138 <infinitLoop>

Disassembly of section .memory:

40000000 <timer_init>:
  volatile uint32_t CLEARS_TICKS;
  volatile uint32_t LIMIT;
  volatile uint32_t VALUE;
} Timer_Reg;

static void timer_init(Timer_Reg *reg){
40000000:	fe010113          	addi	sp,sp,-32
40000004:	00812e23          	sw	s0,28(sp)
40000008:	02010413          	addi	s0,sp,32
4000000c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000010:	fec42783          	lw	a5,-20(s0)
40000014:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000018:	fec42783          	lw	a5,-20(s0)
4000001c:	0007a423          	sw	zero,8(a5)
}
40000020:	00000013          	nop
40000024:	01c12403          	lw	s0,28(sp)
40000028:	02010113          	addi	sp,sp,32
4000002c:	00008067          	ret

40000030 <prescaler_init>:
typedef struct
{
  volatile uint32_t LIMIT;
} Prescaler_Reg;

static void prescaler_init(Prescaler_Reg* reg){
40000030:	fe010113          	addi	sp,sp,-32
40000034:	00812e23          	sw	s0,28(sp)
40000038:	02010413          	addi	s0,sp,32
4000003c:	fea42623          	sw	a0,-20(s0)

}
40000040:	00000013          	nop
40000044:	01c12403          	lw	s0,28(sp)
40000048:	02010113          	addi	sp,sp,32
4000004c:	00008067          	ret

40000050 <interruptCtrl_init>:
{
  volatile uint32_t PENDINGS;
  volatile uint32_t MASKS;
} InterruptCtrl_Reg;

static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000050:	fe010113          	addi	sp,sp,-32
40000054:	00812e23          	sw	s0,28(sp)
40000058:	02010413          	addi	s0,sp,32
4000005c:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000060:	fec42783          	lw	a5,-20(s0)
40000064:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000068:	fec42783          	lw	a5,-20(s0)
4000006c:	fff00713          	li	a4,-1
40000070:	00e7a023          	sw	a4,0(a5)
}
40000074:	00000013          	nop
40000078:	01c12403          	lw	s0,28(sp)
4000007c:	02010113          	addi	sp,sp,32
40000080:	00008067          	ret

40000084 <uart_writeAvailability>:
	enum UartParity parity;
	enum UartStop stop;
	uint32_t clockDivider;
} Uart_Config;

static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000084:	fe010113          	addi	sp,sp,-32
40000088:	00812e23          	sw	s0,28(sp)
4000008c:	02010413          	addi	s0,sp,32
40000090:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000094:	fec42783          	lw	a5,-20(s0)
40000098:	0047a783          	lw	a5,4(a5)
4000009c:	0107d793          	srli	a5,a5,0x10
400000a0:	0ff7f793          	zext.b	a5,a5
}
400000a4:	00078513          	mv	a0,a5
400000a8:	01c12403          	lw	s0,28(sp)
400000ac:	02010113          	addi	sp,sp,32
400000b0:	00008067          	ret

400000b4 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400000b4:	fe010113          	addi	sp,sp,-32
400000b8:	00812e23          	sw	s0,28(sp)
400000bc:	02010413          	addi	s0,sp,32
400000c0:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400000c4:	fec42783          	lw	a5,-20(s0)
400000c8:	0047a783          	lw	a5,4(a5)
400000cc:	0187d793          	srli	a5,a5,0x18
}
400000d0:	00078513          	mv	a0,a5
400000d4:	01c12403          	lw	s0,28(sp)
400000d8:	02010113          	addi	sp,sp,32
400000dc:	00008067          	ret

400000e0 <uart_write>:

static void uart_write(Uart_Reg *reg, uint32_t data){
400000e0:	fe010113          	addi	sp,sp,-32
400000e4:	00112e23          	sw	ra,28(sp)
400000e8:	00812c23          	sw	s0,24(sp)
400000ec:	02010413          	addi	s0,sp,32
400000f0:	fea42623          	sw	a0,-20(s0)
400000f4:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400000f8:	00000013          	nop
400000fc:	fec42503          	lw	a0,-20(s0)
40000100:	f85ff0ef          	jal	ra,40000084 <uart_writeAvailability>
40000104:	00050793          	mv	a5,a0
40000108:	fe078ae3          	beqz	a5,400000fc <uart_write+0x1c>
	reg->DATA = data;
4000010c:	fec42783          	lw	a5,-20(s0)
40000110:	fe842703          	lw	a4,-24(s0)
40000114:	00e7a023          	sw	a4,0(a5)
}
40000118:	00000013          	nop
4000011c:	01c12083          	lw	ra,28(sp)
40000120:	01812403          	lw	s0,24(sp)
40000124:	02010113          	addi	sp,sp,32
40000128:	00008067          	ret

4000012c <uart_applyConfig>:

static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
4000012c:	fe010113          	addi	sp,sp,-32
40000130:	00812e23          	sw	s0,28(sp)
40000134:	02010413          	addi	s0,sp,32
40000138:	fea42623          	sw	a0,-20(s0)
4000013c:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000140:	fe842783          	lw	a5,-24(s0)
40000144:	00c7a703          	lw	a4,12(a5)
40000148:	fec42783          	lw	a5,-20(s0)
4000014c:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000150:	fe842783          	lw	a5,-24(s0)
40000154:	0007a783          	lw	a5,0(a5)
40000158:	fff78713          	addi	a4,a5,-1
4000015c:	fe842783          	lw	a5,-24(s0)
40000160:	0047a783          	lw	a5,4(a5)
40000164:	00879793          	slli	a5,a5,0x8
40000168:	00f76733          	or	a4,a4,a5
4000016c:	fe842783          	lw	a5,-24(s0)
40000170:	0087a783          	lw	a5,8(a5)
40000174:	01079793          	slli	a5,a5,0x10
40000178:	00f76733          	or	a4,a4,a5
4000017c:	fec42783          	lw	a5,-20(s0)
40000180:	00e7a623          	sw	a4,12(a5)
}
40000184:	00000013          	nop
40000188:	01c12403          	lw	s0,28(sp)
4000018c:	02010113          	addi	sp,sp,32
40000190:	00008067          	ret

40000194 <uart_read>:

static char uart_read(Uart_Reg *reg){
40000194:	fe010113          	addi	sp,sp,-32
40000198:	00112e23          	sw	ra,28(sp)
4000019c:	00812c23          	sw	s0,24(sp)
400001a0:	02010413          	addi	s0,sp,32
400001a4:	fea42623          	sw	a0,-20(s0)
	while(uart_readOccupancy(reg) == 0);
400001a8:	00000013          	nop
400001ac:	fec42503          	lw	a0,-20(s0)
400001b0:	f05ff0ef          	jal	ra,400000b4 <uart_readOccupancy>
400001b4:	00050793          	mv	a5,a0
400001b8:	fe078ae3          	beqz	a5,400001ac <uart_read+0x18>
	return reg->DATA;
400001bc:	fec42783          	lw	a5,-20(s0)
400001c0:	0007a783          	lw	a5,0(a5)
400001c4:	0ff7f793          	zext.b	a5,a5
}
400001c8:	00078513          	mv	a0,a5
400001cc:	01c12083          	lw	ra,28(sp)
400001d0:	01812403          	lw	s0,24(sp)
400001d4:	02010113          	addi	sp,sp,32
400001d8:	00008067          	ret

400001dc <vga_isBusy>:
  volatile uint32_t  FRAME_BASE;
  volatile uint32_t  DUMMY0[13];
  volatile Vga_Timing TIMING;
} Vga_Reg;

static uint32_t vga_isBusy(Vga_Reg *reg){
400001dc:	fe010113          	addi	sp,sp,-32
400001e0:	00812e23          	sw	s0,28(sp)
400001e4:	02010413          	addi	s0,sp,32
400001e8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400001ec:	fec42783          	lw	a5,-20(s0)
400001f0:	0007a783          	lw	a5,0(a5)
400001f4:	0027f793          	andi	a5,a5,2
400001f8:	00f037b3          	snez	a5,a5
400001fc:	0ff7f793          	zext.b	a5,a5
}
40000200:	00078513          	mv	a0,a5
40000204:	01c12403          	lw	s0,28(sp)
40000208:	02010113          	addi	sp,sp,32
4000020c:	00008067          	ret

40000210 <vga_run>:

static void vga_run(Vga_Reg *reg){
40000210:	fe010113          	addi	sp,sp,-32
40000214:	00812e23          	sw	s0,28(sp)
40000218:	02010413          	addi	s0,sp,32
4000021c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000220:	fec42783          	lw	a5,-20(s0)
40000224:	00100713          	li	a4,1
40000228:	00e7a023          	sw	a4,0(a5)
}
4000022c:	00000013          	nop
40000230:	01c12403          	lw	s0,28(sp)
40000234:	02010113          	addi	sp,sp,32
40000238:	00008067          	ret

4000023c <vga_stop>:

static void vga_stop(Vga_Reg *reg){
4000023c:	fe010113          	addi	sp,sp,-32
40000240:	00112e23          	sw	ra,28(sp)
40000244:	00812c23          	sw	s0,24(sp)
40000248:	02010413          	addi	s0,sp,32
4000024c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000250:	fec42783          	lw	a5,-20(s0)
40000254:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000258:	00000013          	nop
4000025c:	fec42503          	lw	a0,-20(s0)
40000260:	f7dff0ef          	jal	ra,400001dc <vga_isBusy>
40000264:	00050793          	mv	a5,a0
40000268:	fe079ae3          	bnez	a5,4000025c <vga_stop+0x20>
}
4000026c:	00000013          	nop
40000270:	00000013          	nop
40000274:	01c12083          	lw	ra,28(sp)
40000278:	01812403          	lw	s0,24(sp)
4000027c:	02010113          	addi	sp,sp,32
40000280:	00008067          	ret

40000284 <print>:
// static void random16byte(int argc, char **argv);
static void uart_put_hex8(Uart_Reg *reg, uint8_t hex);
extern int memcmp1(const void* s1, const void* s2, size_t n);
extern void print(char *str);

void print(char *str){
40000284:	fe010113          	addi	sp,sp,-32
40000288:	00112e23          	sw	ra,28(sp)
4000028c:	00812c23          	sw	s0,24(sp)
40000290:	02010413          	addi	s0,sp,32
40000294:	fea42623          	sw	a0,-20(s0)
	while(*str){
40000298:	0200006f          	j	400002b8 <print+0x34>
		uart_write(UART,*(str++));
4000029c:	fec42783          	lw	a5,-20(s0)
400002a0:	00178713          	addi	a4,a5,1
400002a4:	fee42623          	sw	a4,-20(s0)
400002a8:	0007c783          	lbu	a5,0(a5)
400002ac:	00078593          	mv	a1,a5
400002b0:	f0010537          	lui	a0,0xf0010
400002b4:	e2dff0ef          	jal	ra,400000e0 <uart_write>
	while(*str){
400002b8:	fec42783          	lw	a5,-20(s0)
400002bc:	0007c783          	lbu	a5,0(a5)
400002c0:	fc079ee3          	bnez	a5,4000029c <print+0x18>
	}
}
400002c4:	00000013          	nop
400002c8:	00000013          	nop
400002cc:	01c12083          	lw	ra,28(sp)
400002d0:	01812403          	lw	s0,24(sp)
400002d4:	02010113          	addi	sp,sp,32
400002d8:	00008067          	ret

400002dc <main>:

int main() {
400002dc:	fe010113          	addi	sp,sp,-32
400002e0:	00112e23          	sw	ra,28(sp)
400002e4:	00812c23          	sw	s0,24(sp)
400002e8:	02010413          	addi	s0,sp,32
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
400002ec:	00800793          	li	a5,8
400002f0:	fef42023          	sw	a5,-32(s0)
	uartConfig.parity = NONE;
400002f4:	fe042223          	sw	zero,-28(s0)
	uartConfig.stop = ONE;
400002f8:	fe042423          	sw	zero,-24(s0)
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
400002fc:	03500793          	li	a5,53
40000300:	fef42623          	sw	a5,-20(s0)
	uart_applyConfig(UART,&uartConfig);
40000304:	fe040793          	addi	a5,s0,-32
40000308:	00078593          	mv	a1,a5
4000030c:	f0010537          	lui	a0,0xf0010
40000310:	e1dff0ef          	jal	ra,4000012c <uart_applyConfig>
	// print("University of Electro-Communications (UEC), Tokyo, Japan\r\n");
	// print("電気通信大学、東京都、日本\r\n");
	// print("PHAM LAB ! 範研究室 !\r\n");


    print("\n\r-----------------------\n");
40000314:	400027b7          	lui	a5,0x40002
40000318:	6d478513          	addi	a0,a5,1748 # 400026d4 <vga_simRes_h160_v120+0x20>
4000031c:	f69ff0ef          	jal	ra,40000284 <print>
    print("\tEncrypt_ecb\r\n");
40000320:	400027b7          	lui	a5,0x40002
40000324:	6f078513          	addi	a0,a5,1776 # 400026f0 <vga_simRes_h160_v120+0x3c>
40000328:	f5dff0ef          	jal	ra,40000284 <print>
    // print("University of Electro-Communications (UEC), Tokyo, Japan\r\n");
    // print("電気通信大学、東京都、日本\r\n");
    // print("PHAM LAB ! 範研究室 !\r\n");

    // test_encrypt_ecb();
    test_encrypt_ecb_verbose();
4000032c:	0b0000ef          	jal	ra,400003dc <test_encrypt_ecb_verbose>
40000330:	00000793          	li	a5,0
    // test_encrypt_ecb_scan();

	// print("It's done, bruhh !\r\n");
}
40000334:	00078513          	mv	a0,a5
40000338:	01c12083          	lw	ra,28(sp)
4000033c:	01812403          	lw	s0,24(sp)
40000340:	02010113          	addi	sp,sp,32
40000344:	00008067          	ret

40000348 <irqCallback>:


void irqCallback(){
40000348:	ff010113          	addi	sp,sp,-16
4000034c:	00812623          	sw	s0,12(sp)
40000350:	01010413          	addi	s0,sp,16

}
40000354:	00000013          	nop
40000358:	00c12403          	lw	s0,12(sp)
4000035c:	01010113          	addi	sp,sp,16
40000360:	00008067          	ret

40000364 <phex>:

static void phex(uint8_t* str)
{
40000364:	fd010113          	addi	sp,sp,-48
40000368:	02112623          	sw	ra,44(sp)
4000036c:	02812423          	sw	s0,40(sp)
40000370:	03010413          	addi	s0,sp,48
40000374:	fca42e23          	sw	a0,-36(s0)
#if defined(AES256)
    uint8_t len = 32;
#elif defined(AES192)
    uint8_t len = 24;
#elif defined(AES128)
    uint8_t len = 16;
40000378:	01000793          	li	a5,16
4000037c:	fef40723          	sb	a5,-18(s0)
#endif

    unsigned char i;
    for (i = 0; i < len; ++i) {
40000380:	fe0407a3          	sb	zero,-17(s0)
40000384:	02c0006f          	j	400003b0 <phex+0x4c>
    	uart_put_hex8(UART, str[i]);
40000388:	fef44783          	lbu	a5,-17(s0)
4000038c:	fdc42703          	lw	a4,-36(s0)
40000390:	00f707b3          	add	a5,a4,a5
40000394:	0007c783          	lbu	a5,0(a5)
40000398:	00078593          	mv	a1,a5
4000039c:	f0010537          	lui	a0,0xf0010
400003a0:	240000ef          	jal	ra,400005e0 <uart_put_hex8>
    for (i = 0; i < len; ++i) {
400003a4:	fef44783          	lbu	a5,-17(s0)
400003a8:	00178793          	addi	a5,a5,1
400003ac:	fef407a3          	sb	a5,-17(s0)
400003b0:	fef44703          	lbu	a4,-17(s0)
400003b4:	fee44783          	lbu	a5,-18(s0)
400003b8:	fcf768e3          	bltu	a4,a5,40000388 <phex+0x24>
    }
//        printf("%.2x", str[i]);
    print("\n");
400003bc:	400027b7          	lui	a5,0x40002
400003c0:	70078513          	addi	a0,a5,1792 # 40002700 <vga_simRes_h160_v120+0x4c>
400003c4:	ec1ff0ef          	jal	ra,40000284 <print>
}
400003c8:	00000013          	nop
400003cc:	02c12083          	lw	ra,44(sp)
400003d0:	02812403          	lw	s0,40(sp)
400003d4:	03010113          	addi	sp,sp,48
400003d8:	00008067          	ret

400003dc <test_encrypt_ecb_verbose>:
//
static void test_encrypt_ecb_verbose(void)
{
400003dc:	f2010113          	addi	sp,sp,-224
400003e0:	0c112e23          	sw	ra,220(sp)
400003e4:	0c812c23          	sw	s0,216(sp)
400003e8:	0e010413          	addi	s0,sp,224

    uint8_t i;

    // 128bit key
    // uint8_t key[16] =        { (uint8_t) 0x2b, (uint8_t) 0x7e, (uint8_t) 0x15, (uint8_t) 0x16, (uint8_t) 0x28, (uint8_t) 0xae, (uint8_t) 0xd2, (uint8_t) 0xa6, (uint8_t) 0xab, (uint8_t) 0xf7, (uint8_t) 0x15, (uint8_t) 0x88, (uint8_t) 0x09, (uint8_t) 0xcf, (uint8_t) 0x4f, (uint8_t) 0x3c };
    uint8_t key[16] =  {0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c};
400003ec:	400027b7          	lui	a5,0x40002
400003f0:	73c78793          	addi	a5,a5,1852 # 4000273c <vga_simRes_h160_v120+0x88>
400003f4:	0007a603          	lw	a2,0(a5)
400003f8:	0047a683          	lw	a3,4(a5)
400003fc:	0087a703          	lw	a4,8(a5)
40000400:	00c7a783          	lw	a5,12(a5)
40000404:	fec42023          	sw	a2,-32(s0)
40000408:	fed42223          	sw	a3,-28(s0)
4000040c:	fee42423          	sw	a4,-24(s0)
40000410:	fef42623          	sw	a5,-20(s0)
   

    // 128bit text
    uint8_t plain_text[16] = { 0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a };
40000414:	400027b7          	lui	a5,0x40002
40000418:	74c78793          	addi	a5,a5,1868 # 4000274c <vga_simRes_h160_v120+0x98>
4000041c:	0007a603          	lw	a2,0(a5)
40000420:	0047a683          	lw	a3,4(a5)
40000424:	0087a703          	lw	a4,8(a5)
40000428:	00c7a783          	lw	a5,12(a5)
4000042c:	fcc42823          	sw	a2,-48(s0)
40000430:	fcd42a23          	sw	a3,-44(s0)
40000434:	fce42c23          	sw	a4,-40(s0)
40000438:	fcf42e23          	sw	a5,-36(s0)

    // print text to encrypt, key and IV
    // print("ECB encrypt:\r\n");

    print("\r\nplain text:\r\n");
4000043c:	400027b7          	lui	a5,0x40002
40000440:	70478513          	addi	a0,a5,1796 # 40002704 <vga_simRes_h160_v120+0x50>
40000444:	e41ff0ef          	jal	ra,40000284 <print>
    phex(plain_text);
40000448:	fd040793          	addi	a5,s0,-48
4000044c:	00078513          	mv	a0,a5
40000450:	f15ff0ef          	jal	ra,40000364 <phex>

    print("\r\nkey:\r\n");
40000454:	400027b7          	lui	a5,0x40002
40000458:	71478513          	addi	a0,a5,1812 # 40002714 <vga_simRes_h160_v120+0x60>
4000045c:	e29ff0ef          	jal	ra,40000284 <print>
    phex(key);
40000460:	fe040793          	addi	a5,s0,-32
40000464:	00078513          	mv	a0,a5
40000468:	efdff0ef          	jal	ra,40000364 <phex>

    // print the resulting cipher as 4 x 16 byte strings
    print("\r\nciphertext:\r\n");
4000046c:	400027b7          	lui	a5,0x40002
40000470:	72078513          	addi	a0,a5,1824 # 40002720 <vga_simRes_h160_v120+0x6c>
40000474:	e11ff0ef          	jal	ra,40000284 <print>
    struct AES_ctx ctx;
    AES_init_ctx(&ctx, key);
40000478:	fe040713          	addi	a4,s0,-32
4000047c:	f2040793          	addi	a5,s0,-224
40000480:	00070593          	mv	a1,a4
40000484:	00078513          	mv	a0,a5
40000488:	599000ef          	jal	ra,40001220 <AES_init_ctx>
    AES_ECB_encrypt(&ctx, plain_text);
4000048c:	fd040713          	addi	a4,s0,-48
40000490:	f2040793          	addi	a5,s0,-224
40000494:	00070593          	mv	a1,a4
40000498:	00078513          	mv	a0,a5
4000049c:	160020ef          	jal	ra,400025fc <AES_ECB_encrypt>
    phex(plain_text);
400004a0:	fd040793          	addi	a5,s0,-48
400004a4:	00078513          	mv	a0,a5
400004a8:	ebdff0ef          	jal	ra,40000364 <phex>
    print("\r\nFinish!\n");
400004ac:	400027b7          	lui	a5,0x40002
400004b0:	73078513          	addi	a0,a5,1840 # 40002730 <vga_simRes_h160_v120+0x7c>
400004b4:	dd1ff0ef          	jal	ra,40000284 <print>
}
400004b8:	00000013          	nop
400004bc:	0dc12083          	lw	ra,220(sp)
400004c0:	0d812403          	lw	s0,216(sp)
400004c4:	0e010113          	addi	sp,sp,224
400004c8:	00008067          	ret

400004cc <test_encrypt_ecb>:
static int test_encrypt_ecb(void)
{
400004cc:	f1010113          	addi	sp,sp,-240
400004d0:	0e112623          	sw	ra,236(sp)
400004d4:	0e812423          	sw	s0,232(sp)
400004d8:	0f010413          	addi	s0,sp,240
#elif defined(AES192)
    uint8_t key[] = { 0x8e, 0x73, 0xb0, 0xf7, 0xda, 0x0e, 0x64, 0x52, 0xc8, 0x10, 0xf3, 0x2b, 0x80, 0x90, 0x79, 0xe5,
                      0x62, 0xf8, 0xea, 0xd2, 0x52, 0x2c, 0x6b, 0x7b };
    uint8_t out[] = { 0xbd, 0x33, 0x4f, 0x1d, 0x6e, 0x45, 0xf2, 0x5f, 0xf7, 0x12, 0xa2, 0x14, 0x57, 0x1f, 0xa5, 0xcc };
#elif defined(AES128)
    uint8_t key[] = { 0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c };
400004dc:	400027b7          	lui	a5,0x40002
400004e0:	73c78793          	addi	a5,a5,1852 # 4000273c <vga_simRes_h160_v120+0x88>
400004e4:	0007a603          	lw	a2,0(a5)
400004e8:	0047a683          	lw	a3,4(a5)
400004ec:	0087a703          	lw	a4,8(a5)
400004f0:	00c7a783          	lw	a5,12(a5)
400004f4:	fec42023          	sw	a2,-32(s0)
400004f8:	fed42223          	sw	a3,-28(s0)
400004fc:	fee42423          	sw	a4,-24(s0)
40000500:	fef42623          	sw	a5,-20(s0)
    uint8_t out[] = { 0x3a, 0xd7, 0x7b, 0xb4, 0x0d, 0x7a, 0x36, 0x60, 0xa8, 0x9e, 0xca, 0xf3, 0x24, 0x66, 0xef, 0x97 };
40000504:	400027b7          	lui	a5,0x40002
40000508:	78478793          	addi	a5,a5,1924 # 40002784 <vga_simRes_h160_v120+0xd0>
4000050c:	0007a603          	lw	a2,0(a5)
40000510:	0047a683          	lw	a3,4(a5)
40000514:	0087a703          	lw	a4,8(a5)
40000518:	00c7a783          	lw	a5,12(a5)
4000051c:	fcc42823          	sw	a2,-48(s0)
40000520:	fcd42a23          	sw	a3,-44(s0)
40000524:	fce42c23          	sw	a4,-40(s0)
40000528:	fcf42e23          	sw	a5,-36(s0)
#endif

    uint8_t in[]  = { 0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a };
4000052c:	400027b7          	lui	a5,0x40002
40000530:	74c78793          	addi	a5,a5,1868 # 4000274c <vga_simRes_h160_v120+0x98>
40000534:	0007a603          	lw	a2,0(a5)
40000538:	0047a683          	lw	a3,4(a5)
4000053c:	0087a703          	lw	a4,8(a5)
40000540:	00c7a783          	lw	a5,12(a5)
40000544:	fcc42023          	sw	a2,-64(s0)
40000548:	fcd42223          	sw	a3,-60(s0)
4000054c:	fce42423          	sw	a4,-56(s0)
40000550:	fcf42623          	sw	a5,-52(s0)
    struct AES_ctx ctx;

    AES_init_ctx(&ctx, key);
40000554:	fe040713          	addi	a4,s0,-32
40000558:	f1040793          	addi	a5,s0,-240
4000055c:	00070593          	mv	a1,a4
40000560:	00078513          	mv	a0,a5
40000564:	4bd000ef          	jal	ra,40001220 <AES_init_ctx>
    AES_ECB_encrypt(&ctx, in);
40000568:	fc040713          	addi	a4,s0,-64
4000056c:	f1040793          	addi	a5,s0,-240
40000570:	00070593          	mv	a1,a4
40000574:	00078513          	mv	a0,a5
40000578:	084020ef          	jal	ra,400025fc <AES_ECB_encrypt>

    print("ECB encrypt: ");
4000057c:	400027b7          	lui	a5,0x40002
40000580:	75c78513          	addi	a0,a5,1884 # 4000275c <vga_simRes_h160_v120+0xa8>
40000584:	d01ff0ef          	jal	ra,40000284 <print>

    if (0 == memcmp1((char*) out, (char*) in, 16)) {
40000588:	fc040713          	addi	a4,s0,-64
4000058c:	fd040793          	addi	a5,s0,-48
40000590:	01000613          	li	a2,16
40000594:	00070593          	mv	a1,a4
40000598:	00078513          	mv	a0,a5
4000059c:	594000ef          	jal	ra,40000b30 <memcmp1>
400005a0:	00050793          	mv	a5,a0
400005a4:	00079c63          	bnez	a5,400005bc <test_encrypt_ecb+0xf0>
        print("SUCCESS!\n");
400005a8:	400027b7          	lui	a5,0x40002
400005ac:	76c78513          	addi	a0,a5,1900 # 4000276c <vga_simRes_h160_v120+0xb8>
400005b0:	cd5ff0ef          	jal	ra,40000284 <print>
	return(0);
400005b4:	00000793          	li	a5,0
400005b8:	0140006f          	j	400005cc <test_encrypt_ecb+0x100>
    } else {
        print("FAILURE!\n");
400005bc:	400027b7          	lui	a5,0x40002
400005c0:	77878513          	addi	a0,a5,1912 # 40002778 <vga_simRes_h160_v120+0xc4>
400005c4:	cc1ff0ef          	jal	ra,40000284 <print>
	return(1);
400005c8:	00100793          	li	a5,1
    }
}
400005cc:	00078513          	mv	a0,a5
400005d0:	0ec12083          	lw	ra,236(sp)
400005d4:	0e812403          	lw	s0,232(sp)
400005d8:	0f010113          	addi	sp,sp,240
400005dc:	00008067          	ret

400005e0 <uart_put_hex8>:
static void uart_put_hex8(Uart_Reg *reg, uint8_t hex) {
400005e0:	fd010113          	addi	sp,sp,-48
400005e4:	02112623          	sw	ra,44(sp)
400005e8:	02812423          	sw	s0,40(sp)
400005ec:	03010413          	addi	s0,sp,48
400005f0:	fca42e23          	sw	a0,-36(s0)
400005f4:	00058793          	mv	a5,a1
400005f8:	fcf40da3          	sb	a5,-37(s0)
  int num_nibbles = sizeof(hex) * 2;
400005fc:	00200793          	li	a5,2
40000600:	fef42423          	sw	a5,-24(s0)
  for (int nibble_idx = num_nibbles - 1; nibble_idx >= 0; nibble_idx--) {
40000604:	fe842783          	lw	a5,-24(s0)
40000608:	fff78793          	addi	a5,a5,-1
4000060c:	fef42623          	sw	a5,-20(s0)
40000610:	0580006f          	j	40000668 <uart_put_hex8+0x88>
    char nibble = (hex >> (nibble_idx * 4)) & 0xf;
40000614:	fdb44703          	lbu	a4,-37(s0)
40000618:	fec42783          	lw	a5,-20(s0)
4000061c:	00279793          	slli	a5,a5,0x2
40000620:	40f757b3          	sra	a5,a4,a5
40000624:	0ff7f793          	zext.b	a5,a5
40000628:	00f7f793          	andi	a5,a5,15
4000062c:	fef403a3          	sb	a5,-25(s0)
    uart_write(UART, (nibble < 0xa) ? ('0' + nibble) : ('a' + nibble - 0xa));
40000630:	fe744703          	lbu	a4,-25(s0)
40000634:	00900793          	li	a5,9
40000638:	00e7e863          	bltu	a5,a4,40000648 <uart_put_hex8+0x68>
4000063c:	fe744783          	lbu	a5,-25(s0)
40000640:	03078793          	addi	a5,a5,48
40000644:	00c0006f          	j	40000650 <uart_put_hex8+0x70>
40000648:	fe744783          	lbu	a5,-25(s0)
4000064c:	05778793          	addi	a5,a5,87
40000650:	00078593          	mv	a1,a5
40000654:	f0010537          	lui	a0,0xf0010
40000658:	a89ff0ef          	jal	ra,400000e0 <uart_write>
  for (int nibble_idx = num_nibbles - 1; nibble_idx >= 0; nibble_idx--) {
4000065c:	fec42783          	lw	a5,-20(s0)
40000660:	fff78793          	addi	a5,a5,-1
40000664:	fef42623          	sw	a5,-20(s0)
40000668:	fec42783          	lw	a5,-20(s0)
4000066c:	fa07d4e3          	bgez	a5,40000614 <uart_put_hex8+0x34>
  }
}
40000670:	00000013          	nop
40000674:	00000013          	nop
40000678:	02c12083          	lw	ra,44(sp)
4000067c:	02812403          	lw	s0,40(sp)
40000680:	03010113          	addi	sp,sp,48
40000684:	00008067          	ret

40000688 <test_encrypt_ecb_scan>:

static void test_encrypt_ecb_scan(void)
{
40000688:	f1010113          	addi	sp,sp,-240
4000068c:	0e112623          	sw	ra,236(sp)
40000690:	0e812423          	sw	s0,232(sp)
40000694:	0e912223          	sw	s1,228(sp)
40000698:	0f010413          	addi	s0,sp,240
    // Example of more verbose verification

    uint8_t i;

    // 128bit key
    uint8_t key[16] =        { (uint8_t) 0x2b, (uint8_t) 0x7e, (uint8_t) 0x15, (uint8_t) 0x16, (uint8_t) 0x28, (uint8_t) 0xae, (uint8_t) 0xd2, (uint8_t) 0xa6, (uint8_t) 0xab, (uint8_t) 0xf7, (uint8_t) 0x15, (uint8_t) 0x88, (uint8_t) 0x09, (uint8_t) 0xcf, (uint8_t) 0x4f, (uint8_t) 0x3c };
4000069c:	400027b7          	lui	a5,0x40002
400006a0:	73c78793          	addi	a5,a5,1852 # 4000273c <vga_simRes_h160_v120+0x88>
400006a4:	0007a603          	lw	a2,0(a5)
400006a8:	0047a683          	lw	a3,4(a5)
400006ac:	0087a703          	lw	a4,8(a5)
400006b0:	00c7a783          	lw	a5,12(a5)
400006b4:	fcc42e23          	sw	a2,-36(s0)
400006b8:	fed42023          	sw	a3,-32(s0)
400006bc:	fee42223          	sw	a4,-28(s0)
400006c0:	fef42423          	sw	a5,-24(s0)
    // 512bit text
    uint8_t plain_text[16];

    // print text to encrypt, key and IV
    print("ECB encrypt scan:\r\n");
400006c4:	400027b7          	lui	a5,0x40002
400006c8:	79478513          	addi	a0,a5,1940 # 40002794 <vga_simRes_h160_v120+0xe0>
400006cc:	bb9ff0ef          	jal	ra,40000284 <print>
    // scan for input plaintext from uart
    for (i = (uint8_t) 0; i < (uint8_t) 16; i++)
400006d0:	fe0407a3          	sb	zero,-17(s0)
400006d4:	04c0006f          	j	40000720 <test_encrypt_ecb_scan+0x98>
        {
            plain_text[i] = uart_read(UART);
400006d8:	fef44483          	lbu	s1,-17(s0)
400006dc:	f0010537          	lui	a0,0xf0010
400006e0:	ab5ff0ef          	jal	ra,40000194 <uart_read>
400006e4:	00050793          	mv	a5,a0
400006e8:	00078713          	mv	a4,a5
400006ec:	ff048793          	addi	a5,s1,-16
400006f0:	008787b3          	add	a5,a5,s0
400006f4:	fce78e23          	sb	a4,-36(a5)
            uart_put_hex8(UART,plain_text[i]);
400006f8:	fef44783          	lbu	a5,-17(s0)
400006fc:	ff078793          	addi	a5,a5,-16
40000700:	008787b3          	add	a5,a5,s0
40000704:	fdc7c783          	lbu	a5,-36(a5)
40000708:	00078593          	mv	a1,a5
4000070c:	f0010537          	lui	a0,0xf0010
40000710:	ed1ff0ef          	jal	ra,400005e0 <uart_put_hex8>
    for (i = (uint8_t) 0; i < (uint8_t) 16; i++)
40000714:	fef44783          	lbu	a5,-17(s0)
40000718:	00178793          	addi	a5,a5,1
4000071c:	fef407a3          	sb	a5,-17(s0)
40000720:	fef44703          	lbu	a4,-17(s0)
40000724:	00f00793          	li	a5,15
40000728:	fae7f8e3          	bgeu	a5,a4,400006d8 <test_encrypt_ecb_scan+0x50>
        }

    print("\r\nplain text:\r\n");
4000072c:	400027b7          	lui	a5,0x40002
40000730:	70478513          	addi	a0,a5,1796 # 40002704 <vga_simRes_h160_v120+0x50>
40000734:	b51ff0ef          	jal	ra,40000284 <print>
    phex(plain_text);
40000738:	fcc40793          	addi	a5,s0,-52
4000073c:	00078513          	mv	a0,a5
40000740:	c25ff0ef          	jal	ra,40000364 <phex>

    print("\r\nkey:\r\n");
40000744:	400027b7          	lui	a5,0x40002
40000748:	71478513          	addi	a0,a5,1812 # 40002714 <vga_simRes_h160_v120+0x60>
4000074c:	b39ff0ef          	jal	ra,40000284 <print>
    phex(key);
40000750:	fdc40793          	addi	a5,s0,-36
40000754:	00078513          	mv	a0,a5
40000758:	c0dff0ef          	jal	ra,40000364 <phex>

    // print the resulting cipher as 4 x 16 byte strings
    print("\r\nciphertext:\r\n");
4000075c:	400027b7          	lui	a5,0x40002
40000760:	72078513          	addi	a0,a5,1824 # 40002720 <vga_simRes_h160_v120+0x6c>
40000764:	b21ff0ef          	jal	ra,40000284 <print>
    struct AES_ctx ctx;
    AES_init_ctx(&ctx, key);
40000768:	fdc40713          	addi	a4,s0,-36
4000076c:	f1c40793          	addi	a5,s0,-228
40000770:	00070593          	mv	a1,a4
40000774:	00078513          	mv	a0,a5
40000778:	2a9000ef          	jal	ra,40001220 <AES_init_ctx>
    AES_ECB_encrypt(&ctx, plain_text);
4000077c:	fcc40713          	addi	a4,s0,-52
40000780:	f1c40793          	addi	a5,s0,-228
40000784:	00070593          	mv	a1,a4
40000788:	00078513          	mv	a0,a5
4000078c:	671010ef          	jal	ra,400025fc <AES_ECB_encrypt>
    phex(plain_text);
40000790:	fcc40793          	addi	a5,s0,-52
40000794:	00078513          	mv	a0,a5
40000798:	bcdff0ef          	jal	ra,40000364 <phex>
    print("\r\n");
4000079c:	400027b7          	lui	a5,0x40002
400007a0:	7a878513          	addi	a0,a5,1960 # 400027a8 <vga_simRes_h160_v120+0xf4>
400007a4:	ae1ff0ef          	jal	ra,40000284 <print>
}
400007a8:	00000013          	nop
400007ac:	0ec12083          	lw	ra,236(sp)
400007b0:	0e812403          	lw	s0,232(sp)
400007b4:	0e412483          	lw	s1,228(sp)
400007b8:	0f010113          	addi	sp,sp,240
400007bc:	00008067          	ret

400007c0 <memcpy1>:

#define unlikely(X) __builtin_expect (!!(X), 0)
extern int memcmp1(const void* s1, const void* s2, size_t n);
void *
memcpy1(void *__restrict aa, const void *__restrict bb, size_t n)
{
400007c0:	f9010113          	addi	sp,sp,-112
400007c4:	06812623          	sw	s0,108(sp)
400007c8:	07010413          	addi	s0,sp,112
400007cc:	f8a42e23          	sw	a0,-100(s0)
400007d0:	f8b42c23          	sw	a1,-104(s0)
400007d4:	f8c42a23          	sw	a2,-108(s0)
    t tt = *b; \
    a++, b++; \
    *(a - 1) = tt; \
  }

  char *a = (char *)aa;
400007d8:	f9c42783          	lw	a5,-100(s0)
400007dc:	fef42623          	sw	a5,-20(s0)
  const char *b = (const char *)bb;
400007e0:	f9842783          	lw	a5,-104(s0)
400007e4:	fef42423          	sw	a5,-24(s0)
  char *end = a + n;
400007e8:	fec42703          	lw	a4,-20(s0)
400007ec:	f9442783          	lw	a5,-108(s0)
400007f0:	00f707b3          	add	a5,a4,a5
400007f4:	fcf42e23          	sw	a5,-36(s0)
  uintptr_t msk = sizeof (long) - 1;
400007f8:	00300793          	li	a5,3
400007fc:	fcf42c23          	sw	a5,-40(s0)
  if (unlikely ((((uintptr_t)a & msk) != ((uintptr_t)b & msk))
40000800:	fec42703          	lw	a4,-20(s0)
40000804:	fe842783          	lw	a5,-24(s0)
40000808:	00f74733          	xor	a4,a4,a5
4000080c:	fd842783          	lw	a5,-40(s0)
40000810:	00f777b3          	and	a5,a4,a5
40000814:	00f037b3          	snez	a5,a5
40000818:	0ff7f793          	zext.b	a5,a5
4000081c:	00079a63          	bnez	a5,40000830 <memcpy1+0x70>
40000820:	f9442783          	lw	a5,-108(s0)
40000824:	0047b793          	sltiu	a5,a5,4
40000828:	0ff7f793          	zext.b	a5,a5
4000082c:	06078863          	beqz	a5,4000089c <memcpy1+0xdc>
	       || n < sizeof (long)))
    {
small:
40000830:	00000013          	nop
40000834:	0080006f          	j	4000083c <memcpy1+0x7c>
    BODY (la, lb, long);

  a = (char *)la;
  b = (const char *)lb;
  if (unlikely (a < end))
    goto small;
40000838:	00000013          	nop
      if (__builtin_expect (a < end, 1))
4000083c:	fec42703          	lw	a4,-20(s0)
40000840:	fdc42783          	lw	a5,-36(s0)
40000844:	00f737b3          	sltu	a5,a4,a5
40000848:	0ff7f793          	zext.b	a5,a5
4000084c:	04078463          	beqz	a5,40000894 <memcpy1+0xd4>
	while (a < end)
40000850:	0380006f          	j	40000888 <memcpy1+0xc8>
	  BODY (a, b, char);
40000854:	fe842783          	lw	a5,-24(s0)
40000858:	0007c783          	lbu	a5,0(a5)
4000085c:	faf403a3          	sb	a5,-89(s0)
40000860:	fec42783          	lw	a5,-20(s0)
40000864:	00178793          	addi	a5,a5,1
40000868:	fef42623          	sw	a5,-20(s0)
4000086c:	fe842783          	lw	a5,-24(s0)
40000870:	00178793          	addi	a5,a5,1
40000874:	fef42423          	sw	a5,-24(s0)
40000878:	fec42783          	lw	a5,-20(s0)
4000087c:	fff78793          	addi	a5,a5,-1
40000880:	fa744703          	lbu	a4,-89(s0)
40000884:	00e78023          	sb	a4,0(a5)
	while (a < end)
40000888:	fec42703          	lw	a4,-20(s0)
4000088c:	fdc42783          	lw	a5,-36(s0)
40000890:	fcf762e3          	bltu	a4,a5,40000854 <memcpy1+0x94>
      return aa;
40000894:	f9c42783          	lw	a5,-100(s0)
40000898:	2880006f          	j	40000b20 <memcpy1+0x360>
  if (unlikely (((uintptr_t)a & msk) != 0))
4000089c:	fec42703          	lw	a4,-20(s0)
400008a0:	fd842783          	lw	a5,-40(s0)
400008a4:	00f777b3          	and	a5,a4,a5
400008a8:	00f037b3          	snez	a5,a5
400008ac:	0ff7f793          	zext.b	a5,a5
400008b0:	04078663          	beqz	a5,400008fc <memcpy1+0x13c>
    while ((uintptr_t)a & msk)
400008b4:	0380006f          	j	400008ec <memcpy1+0x12c>
      BODY (a, b, char);
400008b8:	fe842783          	lw	a5,-24(s0)
400008bc:	0007c783          	lbu	a5,0(a5)
400008c0:	fcf40ba3          	sb	a5,-41(s0)
400008c4:	fec42783          	lw	a5,-20(s0)
400008c8:	00178793          	addi	a5,a5,1
400008cc:	fef42623          	sw	a5,-20(s0)
400008d0:	fe842783          	lw	a5,-24(s0)
400008d4:	00178793          	addi	a5,a5,1
400008d8:	fef42423          	sw	a5,-24(s0)
400008dc:	fec42783          	lw	a5,-20(s0)
400008e0:	fff78793          	addi	a5,a5,-1
400008e4:	fd744703          	lbu	a4,-41(s0)
400008e8:	00e78023          	sb	a4,0(a5)
    while ((uintptr_t)a & msk)
400008ec:	fec42703          	lw	a4,-20(s0)
400008f0:	fd842783          	lw	a5,-40(s0)
400008f4:	00f777b3          	and	a5,a4,a5
400008f8:	fc0790e3          	bnez	a5,400008b8 <memcpy1+0xf8>
  long *la = (long *)a;
400008fc:	fec42783          	lw	a5,-20(s0)
40000900:	fef42223          	sw	a5,-28(s0)
  const long *lb = (const long *)b;
40000904:	fe842783          	lw	a5,-24(s0)
40000908:	fef42023          	sw	a5,-32(s0)
  long *lend = (long *)((uintptr_t)end & ~msk);
4000090c:	fd842783          	lw	a5,-40(s0)
40000910:	fff7c713          	not	a4,a5
40000914:	fdc42783          	lw	a5,-36(s0)
40000918:	00f777b3          	and	a5,a4,a5
4000091c:	fcf42823          	sw	a5,-48(s0)
  if (unlikely (la < (lend - 8)))
40000920:	fd042783          	lw	a5,-48(s0)
40000924:	fe078793          	addi	a5,a5,-32
40000928:	fe442703          	lw	a4,-28(s0)
4000092c:	00f737b3          	sltu	a5,a4,a5
40000930:	0ff7f793          	zext.b	a5,a5
40000934:	1a078c63          	beqz	a5,40000aec <memcpy1+0x32c>
      while (la < (lend - 8))
40000938:	16c0006f          	j	40000aa4 <memcpy1+0x2e4>
	  long b0 = *lb++;
4000093c:	fe042783          	lw	a5,-32(s0)
40000940:	00478713          	addi	a4,a5,4
40000944:	fee42023          	sw	a4,-32(s0)
40000948:	0007a783          	lw	a5,0(a5)
4000094c:	fcf42623          	sw	a5,-52(s0)
	  long b1 = *lb++;
40000950:	fe042783          	lw	a5,-32(s0)
40000954:	00478713          	addi	a4,a5,4
40000958:	fee42023          	sw	a4,-32(s0)
4000095c:	0007a783          	lw	a5,0(a5)
40000960:	fcf42423          	sw	a5,-56(s0)
	  long b2 = *lb++;
40000964:	fe042783          	lw	a5,-32(s0)
40000968:	00478713          	addi	a4,a5,4
4000096c:	fee42023          	sw	a4,-32(s0)
40000970:	0007a783          	lw	a5,0(a5)
40000974:	fcf42223          	sw	a5,-60(s0)
	  long b3 = *lb++;
40000978:	fe042783          	lw	a5,-32(s0)
4000097c:	00478713          	addi	a4,a5,4
40000980:	fee42023          	sw	a4,-32(s0)
40000984:	0007a783          	lw	a5,0(a5)
40000988:	fcf42023          	sw	a5,-64(s0)
	  long b4 = *lb++;
4000098c:	fe042783          	lw	a5,-32(s0)
40000990:	00478713          	addi	a4,a5,4
40000994:	fee42023          	sw	a4,-32(s0)
40000998:	0007a783          	lw	a5,0(a5)
4000099c:	faf42e23          	sw	a5,-68(s0)
	  long b5 = *lb++;
400009a0:	fe042783          	lw	a5,-32(s0)
400009a4:	00478713          	addi	a4,a5,4
400009a8:	fee42023          	sw	a4,-32(s0)
400009ac:	0007a783          	lw	a5,0(a5)
400009b0:	faf42c23          	sw	a5,-72(s0)
	  long b6 = *lb++;
400009b4:	fe042783          	lw	a5,-32(s0)
400009b8:	00478713          	addi	a4,a5,4
400009bc:	fee42023          	sw	a4,-32(s0)
400009c0:	0007a783          	lw	a5,0(a5)
400009c4:	faf42a23          	sw	a5,-76(s0)
	  long b7 = *lb++;
400009c8:	fe042783          	lw	a5,-32(s0)
400009cc:	00478713          	addi	a4,a5,4
400009d0:	fee42023          	sw	a4,-32(s0)
400009d4:	0007a783          	lw	a5,0(a5)
400009d8:	faf42823          	sw	a5,-80(s0)
	  long b8 = *lb++;
400009dc:	fe042783          	lw	a5,-32(s0)
400009e0:	00478713          	addi	a4,a5,4
400009e4:	fee42023          	sw	a4,-32(s0)
400009e8:	0007a783          	lw	a5,0(a5)
400009ec:	faf42623          	sw	a5,-84(s0)
	  *la++ = b0;
400009f0:	fe442783          	lw	a5,-28(s0)
400009f4:	00478713          	addi	a4,a5,4
400009f8:	fee42223          	sw	a4,-28(s0)
400009fc:	fcc42703          	lw	a4,-52(s0)
40000a00:	00e7a023          	sw	a4,0(a5)
	  *la++ = b1;
40000a04:	fe442783          	lw	a5,-28(s0)
40000a08:	00478713          	addi	a4,a5,4
40000a0c:	fee42223          	sw	a4,-28(s0)
40000a10:	fc842703          	lw	a4,-56(s0)
40000a14:	00e7a023          	sw	a4,0(a5)
	  *la++ = b2;
40000a18:	fe442783          	lw	a5,-28(s0)
40000a1c:	00478713          	addi	a4,a5,4
40000a20:	fee42223          	sw	a4,-28(s0)
40000a24:	fc442703          	lw	a4,-60(s0)
40000a28:	00e7a023          	sw	a4,0(a5)
	  *la++ = b3;
40000a2c:	fe442783          	lw	a5,-28(s0)
40000a30:	00478713          	addi	a4,a5,4
40000a34:	fee42223          	sw	a4,-28(s0)
40000a38:	fc042703          	lw	a4,-64(s0)
40000a3c:	00e7a023          	sw	a4,0(a5)
	  *la++ = b4;
40000a40:	fe442783          	lw	a5,-28(s0)
40000a44:	00478713          	addi	a4,a5,4
40000a48:	fee42223          	sw	a4,-28(s0)
40000a4c:	fbc42703          	lw	a4,-68(s0)
40000a50:	00e7a023          	sw	a4,0(a5)
	  *la++ = b5;
40000a54:	fe442783          	lw	a5,-28(s0)
40000a58:	00478713          	addi	a4,a5,4
40000a5c:	fee42223          	sw	a4,-28(s0)
40000a60:	fb842703          	lw	a4,-72(s0)
40000a64:	00e7a023          	sw	a4,0(a5)
	  *la++ = b6;
40000a68:	fe442783          	lw	a5,-28(s0)
40000a6c:	00478713          	addi	a4,a5,4
40000a70:	fee42223          	sw	a4,-28(s0)
40000a74:	fb442703          	lw	a4,-76(s0)
40000a78:	00e7a023          	sw	a4,0(a5)
	  *la++ = b7;
40000a7c:	fe442783          	lw	a5,-28(s0)
40000a80:	00478713          	addi	a4,a5,4
40000a84:	fee42223          	sw	a4,-28(s0)
40000a88:	fb042703          	lw	a4,-80(s0)
40000a8c:	00e7a023          	sw	a4,0(a5)
	  *la++ = b8;
40000a90:	fe442783          	lw	a5,-28(s0)
40000a94:	00478713          	addi	a4,a5,4
40000a98:	fee42223          	sw	a4,-28(s0)
40000a9c:	fac42703          	lw	a4,-84(s0)
40000aa0:	00e7a023          	sw	a4,0(a5)
      while (la < (lend - 8))
40000aa4:	fd042783          	lw	a5,-48(s0)
40000aa8:	fe078793          	addi	a5,a5,-32
40000aac:	fe442703          	lw	a4,-28(s0)
40000ab0:	e8f766e3          	bltu	a4,a5,4000093c <memcpy1+0x17c>
  while (la < lend)
40000ab4:	0380006f          	j	40000aec <memcpy1+0x32c>
    BODY (la, lb, long);
40000ab8:	fe042783          	lw	a5,-32(s0)
40000abc:	0007a783          	lw	a5,0(a5)
40000ac0:	faf42423          	sw	a5,-88(s0)
40000ac4:	fe442783          	lw	a5,-28(s0)
40000ac8:	00478793          	addi	a5,a5,4
40000acc:	fef42223          	sw	a5,-28(s0)
40000ad0:	fe042783          	lw	a5,-32(s0)
40000ad4:	00478793          	addi	a5,a5,4
40000ad8:	fef42023          	sw	a5,-32(s0)
40000adc:	fe442783          	lw	a5,-28(s0)
40000ae0:	ffc78793          	addi	a5,a5,-4
40000ae4:	fa842703          	lw	a4,-88(s0)
40000ae8:	00e7a023          	sw	a4,0(a5)
  while (la < lend)
40000aec:	fe442703          	lw	a4,-28(s0)
40000af0:	fd042783          	lw	a5,-48(s0)
40000af4:	fcf762e3          	bltu	a4,a5,40000ab8 <memcpy1+0x2f8>
  a = (char *)la;
40000af8:	fe442783          	lw	a5,-28(s0)
40000afc:	fef42623          	sw	a5,-20(s0)
  b = (const char *)lb;
40000b00:	fe042783          	lw	a5,-32(s0)
40000b04:	fef42423          	sw	a5,-24(s0)
  if (unlikely (a < end))
40000b08:	fec42703          	lw	a4,-20(s0)
40000b0c:	fdc42783          	lw	a5,-36(s0)
40000b10:	00f737b3          	sltu	a5,a4,a5
40000b14:	0ff7f793          	zext.b	a5,a5
40000b18:	d20790e3          	bnez	a5,40000838 <memcpy1+0x78>
  return aa;
40000b1c:	f9c42783          	lw	a5,-100(s0)
}
40000b20:	00078513          	mv	a0,a5
40000b24:	06c12403          	lw	s0,108(sp)
40000b28:	07010113          	addi	sp,sp,112
40000b2c:	00008067          	ret

40000b30 <memcmp1>:
int memcmp1(const void* s1, const void* s2, size_t n)
{
40000b30:	fd010113          	addi	sp,sp,-48
40000b34:	02812623          	sw	s0,44(sp)
40000b38:	03010413          	addi	s0,sp,48
40000b3c:	fca42e23          	sw	a0,-36(s0)
40000b40:	fcb42c23          	sw	a1,-40(s0)
40000b44:	fcc42a23          	sw	a2,-44(s0)
  if ((((uintptr_t)s1 | (uintptr_t)s2) & (sizeof(uintptr_t)-1)) == 0) {
40000b48:	fdc42703          	lw	a4,-36(s0)
40000b4c:	fd842783          	lw	a5,-40(s0)
40000b50:	00f767b3          	or	a5,a4,a5
40000b54:	0037f793          	andi	a5,a5,3
40000b58:	0e079063          	bnez	a5,40000c38 <memcmp1+0x108>
    const uintptr_t* u1 = s1;
40000b5c:	fdc42783          	lw	a5,-36(s0)
40000b60:	fef42623          	sw	a5,-20(s0)
    const uintptr_t* u2 = s2;
40000b64:	fd842783          	lw	a5,-40(s0)
40000b68:	fef42423          	sw	a5,-24(s0)
    const uintptr_t* end = u1 + (n / sizeof(uintptr_t));
40000b6c:	fd442783          	lw	a5,-44(s0)
40000b70:	ffc7f793          	andi	a5,a5,-4
40000b74:	fec42703          	lw	a4,-20(s0)
40000b78:	00f707b3          	add	a5,a4,a5
40000b7c:	fef42223          	sw	a5,-28(s0)
    while (u1 < end) {
40000b80:	0300006f          	j	40000bb0 <memcmp1+0x80>
      if (*u1 != *u2)
40000b84:	fec42783          	lw	a5,-20(s0)
40000b88:	0007a703          	lw	a4,0(a5)
40000b8c:	fe842783          	lw	a5,-24(s0)
40000b90:	0007a783          	lw	a5,0(a5)
40000b94:	02f71663          	bne	a4,a5,40000bc0 <memcmp1+0x90>
        break;
      u1++;
40000b98:	fec42783          	lw	a5,-20(s0)
40000b9c:	00478793          	addi	a5,a5,4
40000ba0:	fef42623          	sw	a5,-20(s0)
      u2++;
40000ba4:	fe842783          	lw	a5,-24(s0)
40000ba8:	00478793          	addi	a5,a5,4
40000bac:	fef42423          	sw	a5,-24(s0)
    while (u1 < end) {
40000bb0:	fec42703          	lw	a4,-20(s0)
40000bb4:	fe442783          	lw	a5,-28(s0)
40000bb8:	fcf766e3          	bltu	a4,a5,40000b84 <memcmp1+0x54>
40000bbc:	0080006f          	j	40000bc4 <memcmp1+0x94>
        break;
40000bc0:	00000013          	nop
    }
    n -= (const void*)u1 - s1;
40000bc4:	fec42703          	lw	a4,-20(s0)
40000bc8:	fdc42783          	lw	a5,-36(s0)
40000bcc:	40f707b3          	sub	a5,a4,a5
40000bd0:	00078713          	mv	a4,a5
40000bd4:	fd442783          	lw	a5,-44(s0)
40000bd8:	40e787b3          	sub	a5,a5,a4
40000bdc:	fcf42a23          	sw	a5,-44(s0)
    s1 = u1;
40000be0:	fec42783          	lw	a5,-20(s0)
40000be4:	fcf42e23          	sw	a5,-36(s0)
    s2 = u2;
40000be8:	fe842783          	lw	a5,-24(s0)
40000bec:	fcf42c23          	sw	a5,-40(s0)
  }

  while (n--) {
40000bf0:	0480006f          	j	40000c38 <memcmp1+0x108>
    unsigned char c1 = *(const unsigned char*)s1++;
40000bf4:	fdc42783          	lw	a5,-36(s0)
40000bf8:	00178713          	addi	a4,a5,1
40000bfc:	fce42e23          	sw	a4,-36(s0)
40000c00:	0007c783          	lbu	a5,0(a5)
40000c04:	fef401a3          	sb	a5,-29(s0)
    unsigned char c2 = *(const unsigned char*)s2++;
40000c08:	fd842783          	lw	a5,-40(s0)
40000c0c:	00178713          	addi	a4,a5,1
40000c10:	fce42c23          	sw	a4,-40(s0)
40000c14:	0007c783          	lbu	a5,0(a5)
40000c18:	fef40123          	sb	a5,-30(s0)
    if (c1 != c2)
40000c1c:	fe344703          	lbu	a4,-29(s0)
40000c20:	fe244783          	lbu	a5,-30(s0)
40000c24:	00f70a63          	beq	a4,a5,40000c38 <memcmp1+0x108>
      return c1 - c2;
40000c28:	fe344703          	lbu	a4,-29(s0)
40000c2c:	fe244783          	lbu	a5,-30(s0)
40000c30:	40f707b3          	sub	a5,a4,a5
40000c34:	0180006f          	j	40000c4c <memcmp1+0x11c>
  while (n--) {
40000c38:	fd442783          	lw	a5,-44(s0)
40000c3c:	fff78713          	addi	a4,a5,-1
40000c40:	fce42a23          	sw	a4,-44(s0)
40000c44:	fa0798e3          	bnez	a5,40000bf4 <memcmp1+0xc4>
  }

  return 0;
40000c48:	00000793          	li	a5,0
}
40000c4c:	00078513          	mv	a0,a5
40000c50:	02c12403          	lw	s0,44(sp)
40000c54:	03010113          	addi	sp,sp,48
40000c58:	00008067          	ret

40000c5c <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000c5c:	fe010113          	addi	sp,sp,-32
40000c60:	00812e23          	sw	s0,28(sp)
40000c64:	02010413          	addi	s0,sp,32
40000c68:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000c6c:	fec42783          	lw	a5,-20(s0)
40000c70:	0047a783          	lw	a5,4(a5)
40000c74:	0107d793          	srli	a5,a5,0x10
40000c78:	0ff7f793          	zext.b	a5,a5
}
40000c7c:	00078513          	mv	a0,a5
40000c80:	01c12403          	lw	s0,28(sp)
40000c84:	02010113          	addi	sp,sp,32
40000c88:	00008067          	ret

40000c8c <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000c8c:	fe010113          	addi	sp,sp,-32
40000c90:	00812e23          	sw	s0,28(sp)
40000c94:	02010413          	addi	s0,sp,32
40000c98:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000c9c:	fec42783          	lw	a5,-20(s0)
40000ca0:	0047a783          	lw	a5,4(a5)
40000ca4:	0187d793          	srli	a5,a5,0x18
}
40000ca8:	00078513          	mv	a0,a5
40000cac:	01c12403          	lw	s0,28(sp)
40000cb0:	02010113          	addi	sp,sp,32
40000cb4:	00008067          	ret

40000cb8 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000cb8:	fe010113          	addi	sp,sp,-32
40000cbc:	00112e23          	sw	ra,28(sp)
40000cc0:	00812c23          	sw	s0,24(sp)
40000cc4:	02010413          	addi	s0,sp,32
40000cc8:	fea42623          	sw	a0,-20(s0)
40000ccc:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000cd0:	00000013          	nop
40000cd4:	fec42503          	lw	a0,-20(s0)
40000cd8:	f85ff0ef          	jal	ra,40000c5c <uart_writeAvailability>
40000cdc:	00050793          	mv	a5,a0
40000ce0:	fe078ae3          	beqz	a5,40000cd4 <uart_write+0x1c>
	reg->DATA = data;
40000ce4:	fec42783          	lw	a5,-20(s0)
40000ce8:	fe842703          	lw	a4,-24(s0)
40000cec:	00e7a023          	sw	a4,0(a5)
}
40000cf0:	00000013          	nop
40000cf4:	01c12083          	lw	ra,28(sp)
40000cf8:	01812403          	lw	s0,24(sp)
40000cfc:	02010113          	addi	sp,sp,32
40000d00:	00008067          	ret

40000d04 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000d04:	fe010113          	addi	sp,sp,-32
40000d08:	00812e23          	sw	s0,28(sp)
40000d0c:	02010413          	addi	s0,sp,32
40000d10:	fea42623          	sw	a0,-20(s0)
40000d14:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000d18:	fe842783          	lw	a5,-24(s0)
40000d1c:	00c7a703          	lw	a4,12(a5)
40000d20:	fec42783          	lw	a5,-20(s0)
40000d24:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000d28:	fe842783          	lw	a5,-24(s0)
40000d2c:	0007a783          	lw	a5,0(a5)
40000d30:	fff78713          	addi	a4,a5,-1
40000d34:	fe842783          	lw	a5,-24(s0)
40000d38:	0047a783          	lw	a5,4(a5)
40000d3c:	00879793          	slli	a5,a5,0x8
40000d40:	00f76733          	or	a4,a4,a5
40000d44:	fe842783          	lw	a5,-24(s0)
40000d48:	0087a783          	lw	a5,8(a5)
40000d4c:	01079793          	slli	a5,a5,0x10
40000d50:	00f76733          	or	a4,a4,a5
40000d54:	fec42783          	lw	a5,-20(s0)
40000d58:	00e7a623          	sw	a4,12(a5)
}
40000d5c:	00000013          	nop
40000d60:	01c12403          	lw	s0,28(sp)
40000d64:	02010113          	addi	sp,sp,32
40000d68:	00008067          	ret

40000d6c <uart_read>:
static char uart_read(Uart_Reg *reg){
40000d6c:	fe010113          	addi	sp,sp,-32
40000d70:	00112e23          	sw	ra,28(sp)
40000d74:	00812c23          	sw	s0,24(sp)
40000d78:	02010413          	addi	s0,sp,32
40000d7c:	fea42623          	sw	a0,-20(s0)
	while(uart_readOccupancy(reg) == 0);
40000d80:	00000013          	nop
40000d84:	fec42503          	lw	a0,-20(s0)
40000d88:	f05ff0ef          	jal	ra,40000c8c <uart_readOccupancy>
40000d8c:	00050793          	mv	a5,a0
40000d90:	fe078ae3          	beqz	a5,40000d84 <uart_read+0x18>
	return reg->DATA;
40000d94:	fec42783          	lw	a5,-20(s0)
40000d98:	0007a783          	lw	a5,0(a5)
40000d9c:	0ff7f793          	zext.b	a5,a5
}
40000da0:	00078513          	mv	a0,a5
40000da4:	01c12083          	lw	ra,28(sp)
40000da8:	01812403          	lw	s0,24(sp)
40000dac:	02010113          	addi	sp,sp,32
40000db0:	00008067          	ret

40000db4 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000db4:	fe010113          	addi	sp,sp,-32
40000db8:	00812e23          	sw	s0,28(sp)
40000dbc:	02010413          	addi	s0,sp,32
40000dc0:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000dc4:	fec42783          	lw	a5,-20(s0)
40000dc8:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000dcc:	fec42783          	lw	a5,-20(s0)
40000dd0:	0007a423          	sw	zero,8(a5)
}
40000dd4:	00000013          	nop
40000dd8:	01c12403          	lw	s0,28(sp)
40000ddc:	02010113          	addi	sp,sp,32
40000de0:	00008067          	ret

40000de4 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000de4:	fe010113          	addi	sp,sp,-32
40000de8:	00812e23          	sw	s0,28(sp)
40000dec:	02010413          	addi	s0,sp,32
40000df0:	fea42623          	sw	a0,-20(s0)
}
40000df4:	00000013          	nop
40000df8:	01c12403          	lw	s0,28(sp)
40000dfc:	02010113          	addi	sp,sp,32
40000e00:	00008067          	ret

40000e04 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000e04:	fe010113          	addi	sp,sp,-32
40000e08:	00812e23          	sw	s0,28(sp)
40000e0c:	02010413          	addi	s0,sp,32
40000e10:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000e14:	fec42783          	lw	a5,-20(s0)
40000e18:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000e1c:	fec42783          	lw	a5,-20(s0)
40000e20:	fff00713          	li	a4,-1
40000e24:	00e7a023          	sw	a4,0(a5)
}
40000e28:	00000013          	nop
40000e2c:	01c12403          	lw	s0,28(sp)
40000e30:	02010113          	addi	sp,sp,32
40000e34:	00008067          	ret

40000e38 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000e38:	fe010113          	addi	sp,sp,-32
40000e3c:	00812e23          	sw	s0,28(sp)
40000e40:	02010413          	addi	s0,sp,32
40000e44:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000e48:	fec42783          	lw	a5,-20(s0)
40000e4c:	0007a783          	lw	a5,0(a5)
40000e50:	0027f793          	andi	a5,a5,2
40000e54:	00f037b3          	snez	a5,a5
40000e58:	0ff7f793          	zext.b	a5,a5
}
40000e5c:	00078513          	mv	a0,a5
40000e60:	01c12403          	lw	s0,28(sp)
40000e64:	02010113          	addi	sp,sp,32
40000e68:	00008067          	ret

40000e6c <vga_run>:
static void vga_run(Vga_Reg *reg){
40000e6c:	fe010113          	addi	sp,sp,-32
40000e70:	00812e23          	sw	s0,28(sp)
40000e74:	02010413          	addi	s0,sp,32
40000e78:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000e7c:	fec42783          	lw	a5,-20(s0)
40000e80:	00100713          	li	a4,1
40000e84:	00e7a023          	sw	a4,0(a5)
}
40000e88:	00000013          	nop
40000e8c:	01c12403          	lw	s0,28(sp)
40000e90:	02010113          	addi	sp,sp,32
40000e94:	00008067          	ret

40000e98 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000e98:	fe010113          	addi	sp,sp,-32
40000e9c:	00112e23          	sw	ra,28(sp)
40000ea0:	00812c23          	sw	s0,24(sp)
40000ea4:	02010413          	addi	s0,sp,32
40000ea8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000eac:	fec42783          	lw	a5,-20(s0)
40000eb0:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000eb4:	00000013          	nop
40000eb8:	fec42503          	lw	a0,-20(s0)
40000ebc:	f7dff0ef          	jal	ra,40000e38 <vga_isBusy>
40000ec0:	00050793          	mv	a5,a0
40000ec4:	fe079ae3          	bnez	a5,40000eb8 <vga_stop+0x20>
}
40000ec8:	00000013          	nop
40000ecc:	00000013          	nop
40000ed0:	01c12083          	lw	ra,28(sp)
40000ed4:	01812403          	lw	s0,24(sp)
40000ed8:	02010113          	addi	sp,sp,32
40000edc:	00008067          	ret

40000ee0 <KeyExpansion>:
*/
#define getSBoxInvert(num) (rsbox[(num)])

// This function produces Nb(Nr+1) round keys. The round keys are used in each round to decrypt the states. 
static void KeyExpansion(uint8_t* RoundKey, const uint8_t* Key)
{
40000ee0:	fc010113          	addi	sp,sp,-64
40000ee4:	02812e23          	sw	s0,60(sp)
40000ee8:	04010413          	addi	s0,sp,64
40000eec:	fca42623          	sw	a0,-52(s0)
40000ef0:	fcb42423          	sw	a1,-56(s0)
  unsigned i, j, k;
  uint8_t tempa[4]; // Used for the column/row operations
  
  // The first round key is the key itself.
  for (i = 0; i < Nk; ++i)
40000ef4:	fe042623          	sw	zero,-20(s0)
40000ef8:	0c80006f          	j	40000fc0 <KeyExpansion+0xe0>
  {
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
40000efc:	fec42783          	lw	a5,-20(s0)
40000f00:	00279793          	slli	a5,a5,0x2
40000f04:	fc842703          	lw	a4,-56(s0)
40000f08:	00f70733          	add	a4,a4,a5
40000f0c:	fec42783          	lw	a5,-20(s0)
40000f10:	00279793          	slli	a5,a5,0x2
40000f14:	fcc42683          	lw	a3,-52(s0)
40000f18:	00f687b3          	add	a5,a3,a5
40000f1c:	00074703          	lbu	a4,0(a4)
40000f20:	00e78023          	sb	a4,0(a5)
    RoundKey[(i * 4) + 1] = Key[(i * 4) + 1];
40000f24:	fec42783          	lw	a5,-20(s0)
40000f28:	00279793          	slli	a5,a5,0x2
40000f2c:	00178793          	addi	a5,a5,1
40000f30:	fc842703          	lw	a4,-56(s0)
40000f34:	00f70733          	add	a4,a4,a5
40000f38:	fec42783          	lw	a5,-20(s0)
40000f3c:	00279793          	slli	a5,a5,0x2
40000f40:	00178793          	addi	a5,a5,1
40000f44:	fcc42683          	lw	a3,-52(s0)
40000f48:	00f687b3          	add	a5,a3,a5
40000f4c:	00074703          	lbu	a4,0(a4)
40000f50:	00e78023          	sb	a4,0(a5)
    RoundKey[(i * 4) + 2] = Key[(i * 4) + 2];
40000f54:	fec42783          	lw	a5,-20(s0)
40000f58:	00279793          	slli	a5,a5,0x2
40000f5c:	00278793          	addi	a5,a5,2
40000f60:	fc842703          	lw	a4,-56(s0)
40000f64:	00f70733          	add	a4,a4,a5
40000f68:	fec42783          	lw	a5,-20(s0)
40000f6c:	00279793          	slli	a5,a5,0x2
40000f70:	00278793          	addi	a5,a5,2
40000f74:	fcc42683          	lw	a3,-52(s0)
40000f78:	00f687b3          	add	a5,a3,a5
40000f7c:	00074703          	lbu	a4,0(a4)
40000f80:	00e78023          	sb	a4,0(a5)
    RoundKey[(i * 4) + 3] = Key[(i * 4) + 3];
40000f84:	fec42783          	lw	a5,-20(s0)
40000f88:	00279793          	slli	a5,a5,0x2
40000f8c:	00378793          	addi	a5,a5,3
40000f90:	fc842703          	lw	a4,-56(s0)
40000f94:	00f70733          	add	a4,a4,a5
40000f98:	fec42783          	lw	a5,-20(s0)
40000f9c:	00279793          	slli	a5,a5,0x2
40000fa0:	00378793          	addi	a5,a5,3
40000fa4:	fcc42683          	lw	a3,-52(s0)
40000fa8:	00f687b3          	add	a5,a3,a5
40000fac:	00074703          	lbu	a4,0(a4)
40000fb0:	00e78023          	sb	a4,0(a5)
  for (i = 0; i < Nk; ++i)
40000fb4:	fec42783          	lw	a5,-20(s0)
40000fb8:	00178793          	addi	a5,a5,1
40000fbc:	fef42623          	sw	a5,-20(s0)
40000fc0:	fec42703          	lw	a4,-20(s0)
40000fc4:	00300793          	li	a5,3
40000fc8:	f2e7fae3          	bgeu	a5,a4,40000efc <KeyExpansion+0x1c>
  }

  // All other round keys are found from the previous round keys.
  for (i = Nk; i < Nb * (Nr + 1); ++i)
40000fcc:	00400793          	li	a5,4
40000fd0:	fef42623          	sw	a5,-20(s0)
40000fd4:	22c0006f          	j	40001200 <KeyExpansion+0x320>
  {
    {
      k = (i - 1) * 4;
40000fd8:	fec42783          	lw	a5,-20(s0)
40000fdc:	fff78793          	addi	a5,a5,-1
40000fe0:	00279793          	slli	a5,a5,0x2
40000fe4:	fef42423          	sw	a5,-24(s0)
      tempa[0]=RoundKey[k + 0];
40000fe8:	fcc42703          	lw	a4,-52(s0)
40000fec:	fe842783          	lw	a5,-24(s0)
40000ff0:	00f707b3          	add	a5,a4,a5
40000ff4:	0007c783          	lbu	a5,0(a5)
40000ff8:	fcf40e23          	sb	a5,-36(s0)
      tempa[1]=RoundKey[k + 1];
40000ffc:	fe842783          	lw	a5,-24(s0)
40001000:	00178793          	addi	a5,a5,1
40001004:	fcc42703          	lw	a4,-52(s0)
40001008:	00f707b3          	add	a5,a4,a5
4000100c:	0007c783          	lbu	a5,0(a5)
40001010:	fcf40ea3          	sb	a5,-35(s0)
      tempa[2]=RoundKey[k + 2];
40001014:	fe842783          	lw	a5,-24(s0)
40001018:	00278793          	addi	a5,a5,2
4000101c:	fcc42703          	lw	a4,-52(s0)
40001020:	00f707b3          	add	a5,a4,a5
40001024:	0007c783          	lbu	a5,0(a5)
40001028:	fcf40f23          	sb	a5,-34(s0)
      tempa[3]=RoundKey[k + 3];
4000102c:	fe842783          	lw	a5,-24(s0)
40001030:	00378793          	addi	a5,a5,3
40001034:	fcc42703          	lw	a4,-52(s0)
40001038:	00f707b3          	add	a5,a4,a5
4000103c:	0007c783          	lbu	a5,0(a5)
40001040:	fcf40fa3          	sb	a5,-33(s0)

    }

    if (i % Nk == 0)
40001044:	fec42783          	lw	a5,-20(s0)
40001048:	0037f793          	andi	a5,a5,3
4000104c:	0c079263          	bnez	a5,40001110 <KeyExpansion+0x230>
      // This function shifts the 4 bytes in a word to the left once.
      // [a0,a1,a2,a3] becomes [a1,a2,a3,a0]

      // Function RotWord()
      {
        const uint8_t u8tmp = tempa[0];
40001050:	fdc44783          	lbu	a5,-36(s0)
40001054:	fef403a3          	sb	a5,-25(s0)
        tempa[0] = tempa[1];
40001058:	fdd44783          	lbu	a5,-35(s0)
4000105c:	fcf40e23          	sb	a5,-36(s0)
        tempa[1] = tempa[2];
40001060:	fde44783          	lbu	a5,-34(s0)
40001064:	fcf40ea3          	sb	a5,-35(s0)
        tempa[2] = tempa[3];
40001068:	fdf44783          	lbu	a5,-33(s0)
4000106c:	fcf40f23          	sb	a5,-34(s0)
        tempa[3] = u8tmp;
40001070:	fe744783          	lbu	a5,-25(s0)
40001074:	fcf40fa3          	sb	a5,-33(s0)
      // SubWord() is a function that takes a four-byte input word and 
      // applies the S-box to each of the four bytes to produce an output word.

      // Function Subword()
      {
        tempa[0] = getSBoxValue(tempa[0]);
40001078:	fdc44783          	lbu	a5,-36(s0)
4000107c:	00078713          	mv	a4,a5
40001080:	400037b7          	lui	a5,0x40003
40001084:	80c78793          	addi	a5,a5,-2036 # 4000280c <sbox>
40001088:	00e787b3          	add	a5,a5,a4
4000108c:	0007c783          	lbu	a5,0(a5)
40001090:	fcf40e23          	sb	a5,-36(s0)
        tempa[1] = getSBoxValue(tempa[1]);
40001094:	fdd44783          	lbu	a5,-35(s0)
40001098:	00078713          	mv	a4,a5
4000109c:	400037b7          	lui	a5,0x40003
400010a0:	80c78793          	addi	a5,a5,-2036 # 4000280c <sbox>
400010a4:	00e787b3          	add	a5,a5,a4
400010a8:	0007c783          	lbu	a5,0(a5)
400010ac:	fcf40ea3          	sb	a5,-35(s0)
        tempa[2] = getSBoxValue(tempa[2]);
400010b0:	fde44783          	lbu	a5,-34(s0)
400010b4:	00078713          	mv	a4,a5
400010b8:	400037b7          	lui	a5,0x40003
400010bc:	80c78793          	addi	a5,a5,-2036 # 4000280c <sbox>
400010c0:	00e787b3          	add	a5,a5,a4
400010c4:	0007c783          	lbu	a5,0(a5)
400010c8:	fcf40f23          	sb	a5,-34(s0)
        tempa[3] = getSBoxValue(tempa[3]);
400010cc:	fdf44783          	lbu	a5,-33(s0)
400010d0:	00078713          	mv	a4,a5
400010d4:	400037b7          	lui	a5,0x40003
400010d8:	80c78793          	addi	a5,a5,-2036 # 4000280c <sbox>
400010dc:	00e787b3          	add	a5,a5,a4
400010e0:	0007c783          	lbu	a5,0(a5)
400010e4:	fcf40fa3          	sb	a5,-33(s0)
      }

      tempa[0] = tempa[0] ^ Rcon[i/Nk];
400010e8:	fdc44703          	lbu	a4,-36(s0)
400010ec:	fec42783          	lw	a5,-20(s0)
400010f0:	0027d793          	srli	a5,a5,0x2
400010f4:	400036b7          	lui	a3,0x40003
400010f8:	a0c68693          	addi	a3,a3,-1524 # 40002a0c <Rcon>
400010fc:	00f687b3          	add	a5,a3,a5
40001100:	0007c783          	lbu	a5,0(a5)
40001104:	00f747b3          	xor	a5,a4,a5
40001108:	0ff7f793          	zext.b	a5,a5
4000110c:	fcf40e23          	sb	a5,-36(s0)
        tempa[2] = getSBoxValue(tempa[2]);
        tempa[3] = getSBoxValue(tempa[3]);
      }
    }
#endif
    j = i * 4; k=(i - Nk) * 4;
40001110:	fec42783          	lw	a5,-20(s0)
40001114:	00279793          	slli	a5,a5,0x2
40001118:	fef42023          	sw	a5,-32(s0)
4000111c:	fec42783          	lw	a5,-20(s0)
40001120:	ffc78793          	addi	a5,a5,-4
40001124:	00279793          	slli	a5,a5,0x2
40001128:	fef42423          	sw	a5,-24(s0)
    RoundKey[j + 0] = RoundKey[k + 0] ^ tempa[0];
4000112c:	fcc42703          	lw	a4,-52(s0)
40001130:	fe842783          	lw	a5,-24(s0)
40001134:	00f707b3          	add	a5,a4,a5
40001138:	0007c683          	lbu	a3,0(a5)
4000113c:	fdc44703          	lbu	a4,-36(s0)
40001140:	fcc42603          	lw	a2,-52(s0)
40001144:	fe042783          	lw	a5,-32(s0)
40001148:	00f607b3          	add	a5,a2,a5
4000114c:	00e6c733          	xor	a4,a3,a4
40001150:	0ff77713          	zext.b	a4,a4
40001154:	00e78023          	sb	a4,0(a5)
    RoundKey[j + 1] = RoundKey[k + 1] ^ tempa[1];
40001158:	fe842783          	lw	a5,-24(s0)
4000115c:	00178793          	addi	a5,a5,1
40001160:	fcc42703          	lw	a4,-52(s0)
40001164:	00f707b3          	add	a5,a4,a5
40001168:	0007c683          	lbu	a3,0(a5)
4000116c:	fdd44703          	lbu	a4,-35(s0)
40001170:	fe042783          	lw	a5,-32(s0)
40001174:	00178793          	addi	a5,a5,1
40001178:	fcc42603          	lw	a2,-52(s0)
4000117c:	00f607b3          	add	a5,a2,a5
40001180:	00e6c733          	xor	a4,a3,a4
40001184:	0ff77713          	zext.b	a4,a4
40001188:	00e78023          	sb	a4,0(a5)
    RoundKey[j + 2] = RoundKey[k + 2] ^ tempa[2];
4000118c:	fe842783          	lw	a5,-24(s0)
40001190:	00278793          	addi	a5,a5,2
40001194:	fcc42703          	lw	a4,-52(s0)
40001198:	00f707b3          	add	a5,a4,a5
4000119c:	0007c683          	lbu	a3,0(a5)
400011a0:	fde44703          	lbu	a4,-34(s0)
400011a4:	fe042783          	lw	a5,-32(s0)
400011a8:	00278793          	addi	a5,a5,2
400011ac:	fcc42603          	lw	a2,-52(s0)
400011b0:	00f607b3          	add	a5,a2,a5
400011b4:	00e6c733          	xor	a4,a3,a4
400011b8:	0ff77713          	zext.b	a4,a4
400011bc:	00e78023          	sb	a4,0(a5)
    RoundKey[j + 3] = RoundKey[k + 3] ^ tempa[3];
400011c0:	fe842783          	lw	a5,-24(s0)
400011c4:	00378793          	addi	a5,a5,3
400011c8:	fcc42703          	lw	a4,-52(s0)
400011cc:	00f707b3          	add	a5,a4,a5
400011d0:	0007c683          	lbu	a3,0(a5)
400011d4:	fdf44703          	lbu	a4,-33(s0)
400011d8:	fe042783          	lw	a5,-32(s0)
400011dc:	00378793          	addi	a5,a5,3
400011e0:	fcc42603          	lw	a2,-52(s0)
400011e4:	00f607b3          	add	a5,a2,a5
400011e8:	00e6c733          	xor	a4,a3,a4
400011ec:	0ff77713          	zext.b	a4,a4
400011f0:	00e78023          	sb	a4,0(a5)
  for (i = Nk; i < Nb * (Nr + 1); ++i)
400011f4:	fec42783          	lw	a5,-20(s0)
400011f8:	00178793          	addi	a5,a5,1
400011fc:	fef42623          	sw	a5,-20(s0)
40001200:	fec42703          	lw	a4,-20(s0)
40001204:	02b00793          	li	a5,43
40001208:	dce7f8e3          	bgeu	a5,a4,40000fd8 <KeyExpansion+0xf8>
  }
}
4000120c:	00000013          	nop
40001210:	00000013          	nop
40001214:	03c12403          	lw	s0,60(sp)
40001218:	04010113          	addi	sp,sp,64
4000121c:	00008067          	ret

40001220 <AES_init_ctx>:

void AES_init_ctx(struct AES_ctx* ctx, const uint8_t* key)
{
40001220:	fe010113          	addi	sp,sp,-32
40001224:	00112e23          	sw	ra,28(sp)
40001228:	00812c23          	sw	s0,24(sp)
4000122c:	02010413          	addi	s0,sp,32
40001230:	fea42623          	sw	a0,-20(s0)
40001234:	feb42423          	sw	a1,-24(s0)
  KeyExpansion(ctx->RoundKey, key);
40001238:	fec42783          	lw	a5,-20(s0)
4000123c:	fe842583          	lw	a1,-24(s0)
40001240:	00078513          	mv	a0,a5
40001244:	c9dff0ef          	jal	ra,40000ee0 <KeyExpansion>
}
40001248:	00000013          	nop
4000124c:	01c12083          	lw	ra,28(sp)
40001250:	01812403          	lw	s0,24(sp)
40001254:	02010113          	addi	sp,sp,32
40001258:	00008067          	ret

4000125c <AddRoundKey>:

// This function adds the round key to state.
// The round key is added to the state by an XOR function.
static void AddRoundKey(uint8_t round, state_t* state, const uint8_t* RoundKey)
{
4000125c:	fd010113          	addi	sp,sp,-48
40001260:	02812623          	sw	s0,44(sp)
40001264:	03010413          	addi	s0,sp,48
40001268:	00050793          	mv	a5,a0
4000126c:	fcb42c23          	sw	a1,-40(s0)
40001270:	fcc42a23          	sw	a2,-44(s0)
40001274:	fcf40fa3          	sb	a5,-33(s0)
  uint8_t i,j;
  for (i = 0; i < 4; ++i)
40001278:	fe0407a3          	sb	zero,-17(s0)
4000127c:	09c0006f          	j	40001318 <AddRoundKey+0xbc>
  {
    for (j = 0; j < 4; ++j)
40001280:	fe040723          	sb	zero,-18(s0)
40001284:	07c0006f          	j	40001300 <AddRoundKey+0xa4>
    {
      (*state)[i][j] ^= RoundKey[(round * Nb * 4) + (i * Nb) + j];
40001288:	fef44703          	lbu	a4,-17(s0)
4000128c:	fee44783          	lbu	a5,-18(s0)
40001290:	fd842683          	lw	a3,-40(s0)
40001294:	00271713          	slli	a4,a4,0x2
40001298:	00e68733          	add	a4,a3,a4
4000129c:	00f707b3          	add	a5,a4,a5
400012a0:	0007c603          	lbu	a2,0(a5)
400012a4:	fdf44783          	lbu	a5,-33(s0)
400012a8:	00279713          	slli	a4,a5,0x2
400012ac:	fef44783          	lbu	a5,-17(s0)
400012b0:	00f707b3          	add	a5,a4,a5
400012b4:	00279713          	slli	a4,a5,0x2
400012b8:	fee44783          	lbu	a5,-18(s0)
400012bc:	00f707b3          	add	a5,a4,a5
400012c0:	00078713          	mv	a4,a5
400012c4:	fd442783          	lw	a5,-44(s0)
400012c8:	00e787b3          	add	a5,a5,a4
400012cc:	0007c703          	lbu	a4,0(a5)
400012d0:	fef44683          	lbu	a3,-17(s0)
400012d4:	fee44783          	lbu	a5,-18(s0)
400012d8:	00e64733          	xor	a4,a2,a4
400012dc:	0ff77713          	zext.b	a4,a4
400012e0:	fd842603          	lw	a2,-40(s0)
400012e4:	00269693          	slli	a3,a3,0x2
400012e8:	00d606b3          	add	a3,a2,a3
400012ec:	00f687b3          	add	a5,a3,a5
400012f0:	00e78023          	sb	a4,0(a5)
    for (j = 0; j < 4; ++j)
400012f4:	fee44783          	lbu	a5,-18(s0)
400012f8:	00178793          	addi	a5,a5,1
400012fc:	fef40723          	sb	a5,-18(s0)
40001300:	fee44703          	lbu	a4,-18(s0)
40001304:	00300793          	li	a5,3
40001308:	f8e7f0e3          	bgeu	a5,a4,40001288 <AddRoundKey+0x2c>
  for (i = 0; i < 4; ++i)
4000130c:	fef44783          	lbu	a5,-17(s0)
40001310:	00178793          	addi	a5,a5,1
40001314:	fef407a3          	sb	a5,-17(s0)
40001318:	fef44703          	lbu	a4,-17(s0)
4000131c:	00300793          	li	a5,3
40001320:	f6e7f0e3          	bgeu	a5,a4,40001280 <AddRoundKey+0x24>
    }
  }
}
40001324:	00000013          	nop
40001328:	00000013          	nop
4000132c:	02c12403          	lw	s0,44(sp)
40001330:	03010113          	addi	sp,sp,48
40001334:	00008067          	ret

40001338 <SubBytes>:

// The SubBytes Function Substitutes the values in the
// state matrix with values in an S-box.
static void SubBytes(state_t* state)
{
40001338:	fd010113          	addi	sp,sp,-48
4000133c:	02812623          	sw	s0,44(sp)
40001340:	03010413          	addi	s0,sp,48
40001344:	fca42e23          	sw	a0,-36(s0)
  uint8_t i, j;
  for (i = 0; i < 4; ++i)
40001348:	fe0407a3          	sb	zero,-17(s0)
4000134c:	07c0006f          	j	400013c8 <SubBytes+0x90>
  {
    for (j = 0; j < 4; ++j)
40001350:	fe040723          	sb	zero,-18(s0)
40001354:	05c0006f          	j	400013b0 <SubBytes+0x78>
    {
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
40001358:	fee44703          	lbu	a4,-18(s0)
4000135c:	fef44783          	lbu	a5,-17(s0)
40001360:	fdc42683          	lw	a3,-36(s0)
40001364:	00271713          	slli	a4,a4,0x2
40001368:	00e68733          	add	a4,a3,a4
4000136c:	00f707b3          	add	a5,a4,a5
40001370:	0007c783          	lbu	a5,0(a5)
40001374:	00078613          	mv	a2,a5
40001378:	fee44683          	lbu	a3,-18(s0)
4000137c:	fef44783          	lbu	a5,-17(s0)
40001380:	40003737          	lui	a4,0x40003
40001384:	80c70713          	addi	a4,a4,-2036 # 4000280c <sbox>
40001388:	00c70733          	add	a4,a4,a2
4000138c:	00074703          	lbu	a4,0(a4)
40001390:	fdc42603          	lw	a2,-36(s0)
40001394:	00269693          	slli	a3,a3,0x2
40001398:	00d606b3          	add	a3,a2,a3
4000139c:	00f687b3          	add	a5,a3,a5
400013a0:	00e78023          	sb	a4,0(a5)
    for (j = 0; j < 4; ++j)
400013a4:	fee44783          	lbu	a5,-18(s0)
400013a8:	00178793          	addi	a5,a5,1
400013ac:	fef40723          	sb	a5,-18(s0)
400013b0:	fee44703          	lbu	a4,-18(s0)
400013b4:	00300793          	li	a5,3
400013b8:	fae7f0e3          	bgeu	a5,a4,40001358 <SubBytes+0x20>
  for (i = 0; i < 4; ++i)
400013bc:	fef44783          	lbu	a5,-17(s0)
400013c0:	00178793          	addi	a5,a5,1
400013c4:	fef407a3          	sb	a5,-17(s0)
400013c8:	fef44703          	lbu	a4,-17(s0)
400013cc:	00300793          	li	a5,3
400013d0:	f8e7f0e3          	bgeu	a5,a4,40001350 <SubBytes+0x18>
    }
  }
}
400013d4:	00000013          	nop
400013d8:	00000013          	nop
400013dc:	02c12403          	lw	s0,44(sp)
400013e0:	03010113          	addi	sp,sp,48
400013e4:	00008067          	ret

400013e8 <ShiftRows>:

// The ShiftRows() function shifts the rows in the state to the left.
// Each row is shifted with different offset.
// Offset = Row number. So the first row is not shifted.
static void ShiftRows(state_t* state)
{
400013e8:	fd010113          	addi	sp,sp,-48
400013ec:	02812623          	sw	s0,44(sp)
400013f0:	03010413          	addi	s0,sp,48
400013f4:	fca42e23          	sw	a0,-36(s0)
  uint8_t temp;

  // Rotate first row 1 columns to left  
  temp           = (*state)[0][1];
400013f8:	fdc42783          	lw	a5,-36(s0)
400013fc:	0017c783          	lbu	a5,1(a5)
40001400:	fef407a3          	sb	a5,-17(s0)
  (*state)[0][1] = (*state)[1][1];
40001404:	fdc42783          	lw	a5,-36(s0)
40001408:	0057c703          	lbu	a4,5(a5)
4000140c:	fdc42783          	lw	a5,-36(s0)
40001410:	00e780a3          	sb	a4,1(a5)
  (*state)[1][1] = (*state)[2][1];
40001414:	fdc42783          	lw	a5,-36(s0)
40001418:	0097c703          	lbu	a4,9(a5)
4000141c:	fdc42783          	lw	a5,-36(s0)
40001420:	00e782a3          	sb	a4,5(a5)
  (*state)[2][1] = (*state)[3][1];
40001424:	fdc42783          	lw	a5,-36(s0)
40001428:	00d7c703          	lbu	a4,13(a5)
4000142c:	fdc42783          	lw	a5,-36(s0)
40001430:	00e784a3          	sb	a4,9(a5)
  (*state)[3][1] = temp;
40001434:	fdc42783          	lw	a5,-36(s0)
40001438:	fef44703          	lbu	a4,-17(s0)
4000143c:	00e786a3          	sb	a4,13(a5)

  // Rotate second row 2 columns to left  
  temp           = (*state)[0][2];
40001440:	fdc42783          	lw	a5,-36(s0)
40001444:	0027c783          	lbu	a5,2(a5)
40001448:	fef407a3          	sb	a5,-17(s0)
  (*state)[0][2] = (*state)[2][2];
4000144c:	fdc42783          	lw	a5,-36(s0)
40001450:	00a7c703          	lbu	a4,10(a5)
40001454:	fdc42783          	lw	a5,-36(s0)
40001458:	00e78123          	sb	a4,2(a5)
  (*state)[2][2] = temp;
4000145c:	fdc42783          	lw	a5,-36(s0)
40001460:	fef44703          	lbu	a4,-17(s0)
40001464:	00e78523          	sb	a4,10(a5)

  temp           = (*state)[1][2];
40001468:	fdc42783          	lw	a5,-36(s0)
4000146c:	0067c783          	lbu	a5,6(a5)
40001470:	fef407a3          	sb	a5,-17(s0)
  (*state)[1][2] = (*state)[3][2];
40001474:	fdc42783          	lw	a5,-36(s0)
40001478:	00e7c703          	lbu	a4,14(a5)
4000147c:	fdc42783          	lw	a5,-36(s0)
40001480:	00e78323          	sb	a4,6(a5)
  (*state)[3][2] = temp;
40001484:	fdc42783          	lw	a5,-36(s0)
40001488:	fef44703          	lbu	a4,-17(s0)
4000148c:	00e78723          	sb	a4,14(a5)

  // Rotate third row 3 columns to left
  temp           = (*state)[0][3];
40001490:	fdc42783          	lw	a5,-36(s0)
40001494:	0037c783          	lbu	a5,3(a5)
40001498:	fef407a3          	sb	a5,-17(s0)
  (*state)[0][3] = (*state)[3][3];
4000149c:	fdc42783          	lw	a5,-36(s0)
400014a0:	00f7c703          	lbu	a4,15(a5)
400014a4:	fdc42783          	lw	a5,-36(s0)
400014a8:	00e781a3          	sb	a4,3(a5)
  (*state)[3][3] = (*state)[2][3];
400014ac:	fdc42783          	lw	a5,-36(s0)
400014b0:	00b7c703          	lbu	a4,11(a5)
400014b4:	fdc42783          	lw	a5,-36(s0)
400014b8:	00e787a3          	sb	a4,15(a5)
  (*state)[2][3] = (*state)[1][3];
400014bc:	fdc42783          	lw	a5,-36(s0)
400014c0:	0077c703          	lbu	a4,7(a5)
400014c4:	fdc42783          	lw	a5,-36(s0)
400014c8:	00e785a3          	sb	a4,11(a5)
  (*state)[1][3] = temp;
400014cc:	fdc42783          	lw	a5,-36(s0)
400014d0:	fef44703          	lbu	a4,-17(s0)
400014d4:	00e783a3          	sb	a4,7(a5)
}
400014d8:	00000013          	nop
400014dc:	02c12403          	lw	s0,44(sp)
400014e0:	03010113          	addi	sp,sp,48
400014e4:	00008067          	ret

400014e8 <xtime>:

static uint8_t xtime(uint8_t x)
{
400014e8:	fe010113          	addi	sp,sp,-32
400014ec:	00812e23          	sw	s0,28(sp)
400014f0:	02010413          	addi	s0,sp,32
400014f4:	00050793          	mv	a5,a0
400014f8:	fef407a3          	sb	a5,-17(s0)
  return ((x<<1) ^ (((x>>7) & 1) * 0x1b));
400014fc:	fef44783          	lbu	a5,-17(s0)
40001500:	00179793          	slli	a5,a5,0x1
40001504:	01879693          	slli	a3,a5,0x18
40001508:	4186d693          	srai	a3,a3,0x18
4000150c:	fef44783          	lbu	a5,-17(s0)
40001510:	0077d793          	srli	a5,a5,0x7
40001514:	0ff7f793          	zext.b	a5,a5
40001518:	00078713          	mv	a4,a5
4000151c:	00371713          	slli	a4,a4,0x3
40001520:	40f70733          	sub	a4,a4,a5
40001524:	00271713          	slli	a4,a4,0x2
40001528:	40f707b3          	sub	a5,a4,a5
4000152c:	0ff7f793          	zext.b	a5,a5
40001530:	01879793          	slli	a5,a5,0x18
40001534:	4187d793          	srai	a5,a5,0x18
40001538:	00f6c7b3          	xor	a5,a3,a5
4000153c:	01879793          	slli	a5,a5,0x18
40001540:	4187d793          	srai	a5,a5,0x18
40001544:	0ff7f793          	zext.b	a5,a5
}
40001548:	00078513          	mv	a0,a5
4000154c:	01c12403          	lw	s0,28(sp)
40001550:	02010113          	addi	sp,sp,32
40001554:	00008067          	ret

40001558 <MixColumns>:

// MixColumns function mixes the columns of the state matrix
static void MixColumns(state_t* state)
{
40001558:	fd010113          	addi	sp,sp,-48
4000155c:	02112623          	sw	ra,44(sp)
40001560:	02812423          	sw	s0,40(sp)
40001564:	03010413          	addi	s0,sp,48
40001568:	fca42e23          	sw	a0,-36(s0)
  uint8_t i;
  uint8_t Tmp, Tm, t;
  for (i = 0; i < 4; ++i)
4000156c:	fe0407a3          	sb	zero,-17(s0)
40001570:	2a00006f          	j	40001810 <MixColumns+0x2b8>
  {  
    t   = (*state)[i][0];
40001574:	fef44783          	lbu	a5,-17(s0)
40001578:	fdc42703          	lw	a4,-36(s0)
4000157c:	00279793          	slli	a5,a5,0x2
40001580:	00f707b3          	add	a5,a4,a5
40001584:	0007c783          	lbu	a5,0(a5)
40001588:	fef40723          	sb	a5,-18(s0)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
4000158c:	fef44783          	lbu	a5,-17(s0)
40001590:	fdc42703          	lw	a4,-36(s0)
40001594:	00279793          	slli	a5,a5,0x2
40001598:	00f707b3          	add	a5,a4,a5
4000159c:	0007c703          	lbu	a4,0(a5)
400015a0:	fef44783          	lbu	a5,-17(s0)
400015a4:	fdc42683          	lw	a3,-36(s0)
400015a8:	00279793          	slli	a5,a5,0x2
400015ac:	00f687b3          	add	a5,a3,a5
400015b0:	0017c783          	lbu	a5,1(a5)
400015b4:	00f747b3          	xor	a5,a4,a5
400015b8:	0ff7f713          	zext.b	a4,a5
400015bc:	fef44783          	lbu	a5,-17(s0)
400015c0:	fdc42683          	lw	a3,-36(s0)
400015c4:	00279793          	slli	a5,a5,0x2
400015c8:	00f687b3          	add	a5,a3,a5
400015cc:	0027c783          	lbu	a5,2(a5)
400015d0:	00f747b3          	xor	a5,a4,a5
400015d4:	0ff7f713          	zext.b	a4,a5
400015d8:	fef44783          	lbu	a5,-17(s0)
400015dc:	fdc42683          	lw	a3,-36(s0)
400015e0:	00279793          	slli	a5,a5,0x2
400015e4:	00f687b3          	add	a5,a3,a5
400015e8:	0037c783          	lbu	a5,3(a5)
400015ec:	00f747b3          	xor	a5,a4,a5
400015f0:	fef406a3          	sb	a5,-19(s0)
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
400015f4:	fef44783          	lbu	a5,-17(s0)
400015f8:	fdc42703          	lw	a4,-36(s0)
400015fc:	00279793          	slli	a5,a5,0x2
40001600:	00f707b3          	add	a5,a4,a5
40001604:	0007c703          	lbu	a4,0(a5)
40001608:	fef44783          	lbu	a5,-17(s0)
4000160c:	fdc42683          	lw	a3,-36(s0)
40001610:	00279793          	slli	a5,a5,0x2
40001614:	00f687b3          	add	a5,a3,a5
40001618:	0017c783          	lbu	a5,1(a5)
4000161c:	00f747b3          	xor	a5,a4,a5
40001620:	fef40623          	sb	a5,-20(s0)
40001624:	fec44783          	lbu	a5,-20(s0)
40001628:	00078513          	mv	a0,a5
4000162c:	ebdff0ef          	jal	ra,400014e8 <xtime>
40001630:	00050793          	mv	a5,a0
40001634:	fef40623          	sb	a5,-20(s0)
40001638:	fef44783          	lbu	a5,-17(s0)
4000163c:	fdc42703          	lw	a4,-36(s0)
40001640:	00279793          	slli	a5,a5,0x2
40001644:	00f707b3          	add	a5,a4,a5
40001648:	0007c683          	lbu	a3,0(a5)
4000164c:	fec44783          	lbu	a5,-20(s0)
40001650:	00078713          	mv	a4,a5
40001654:	fed44783          	lbu	a5,-19(s0)
40001658:	00f747b3          	xor	a5,a4,a5
4000165c:	0ff7f713          	zext.b	a4,a5
40001660:	fef44783          	lbu	a5,-17(s0)
40001664:	00e6c733          	xor	a4,a3,a4
40001668:	0ff77713          	zext.b	a4,a4
4000166c:	fdc42683          	lw	a3,-36(s0)
40001670:	00279793          	slli	a5,a5,0x2
40001674:	00f687b3          	add	a5,a3,a5
40001678:	00e78023          	sb	a4,0(a5)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
4000167c:	fef44783          	lbu	a5,-17(s0)
40001680:	fdc42703          	lw	a4,-36(s0)
40001684:	00279793          	slli	a5,a5,0x2
40001688:	00f707b3          	add	a5,a4,a5
4000168c:	0017c703          	lbu	a4,1(a5)
40001690:	fef44783          	lbu	a5,-17(s0)
40001694:	fdc42683          	lw	a3,-36(s0)
40001698:	00279793          	slli	a5,a5,0x2
4000169c:	00f687b3          	add	a5,a3,a5
400016a0:	0027c783          	lbu	a5,2(a5)
400016a4:	00f747b3          	xor	a5,a4,a5
400016a8:	fef40623          	sb	a5,-20(s0)
400016ac:	fec44783          	lbu	a5,-20(s0)
400016b0:	00078513          	mv	a0,a5
400016b4:	e35ff0ef          	jal	ra,400014e8 <xtime>
400016b8:	00050793          	mv	a5,a0
400016bc:	fef40623          	sb	a5,-20(s0)
400016c0:	fef44783          	lbu	a5,-17(s0)
400016c4:	fdc42703          	lw	a4,-36(s0)
400016c8:	00279793          	slli	a5,a5,0x2
400016cc:	00f707b3          	add	a5,a4,a5
400016d0:	0017c683          	lbu	a3,1(a5)
400016d4:	fec44783          	lbu	a5,-20(s0)
400016d8:	00078713          	mv	a4,a5
400016dc:	fed44783          	lbu	a5,-19(s0)
400016e0:	00f747b3          	xor	a5,a4,a5
400016e4:	0ff7f713          	zext.b	a4,a5
400016e8:	fef44783          	lbu	a5,-17(s0)
400016ec:	00e6c733          	xor	a4,a3,a4
400016f0:	0ff77713          	zext.b	a4,a4
400016f4:	fdc42683          	lw	a3,-36(s0)
400016f8:	00279793          	slli	a5,a5,0x2
400016fc:	00f687b3          	add	a5,a3,a5
40001700:	00e780a3          	sb	a4,1(a5)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
40001704:	fef44783          	lbu	a5,-17(s0)
40001708:	fdc42703          	lw	a4,-36(s0)
4000170c:	00279793          	slli	a5,a5,0x2
40001710:	00f707b3          	add	a5,a4,a5
40001714:	0027c703          	lbu	a4,2(a5)
40001718:	fef44783          	lbu	a5,-17(s0)
4000171c:	fdc42683          	lw	a3,-36(s0)
40001720:	00279793          	slli	a5,a5,0x2
40001724:	00f687b3          	add	a5,a3,a5
40001728:	0037c783          	lbu	a5,3(a5)
4000172c:	00f747b3          	xor	a5,a4,a5
40001730:	fef40623          	sb	a5,-20(s0)
40001734:	fec44783          	lbu	a5,-20(s0)
40001738:	00078513          	mv	a0,a5
4000173c:	dadff0ef          	jal	ra,400014e8 <xtime>
40001740:	00050793          	mv	a5,a0
40001744:	fef40623          	sb	a5,-20(s0)
40001748:	fef44783          	lbu	a5,-17(s0)
4000174c:	fdc42703          	lw	a4,-36(s0)
40001750:	00279793          	slli	a5,a5,0x2
40001754:	00f707b3          	add	a5,a4,a5
40001758:	0027c683          	lbu	a3,2(a5)
4000175c:	fec44783          	lbu	a5,-20(s0)
40001760:	00078713          	mv	a4,a5
40001764:	fed44783          	lbu	a5,-19(s0)
40001768:	00f747b3          	xor	a5,a4,a5
4000176c:	0ff7f713          	zext.b	a4,a5
40001770:	fef44783          	lbu	a5,-17(s0)
40001774:	00e6c733          	xor	a4,a3,a4
40001778:	0ff77713          	zext.b	a4,a4
4000177c:	fdc42683          	lw	a3,-36(s0)
40001780:	00279793          	slli	a5,a5,0x2
40001784:	00f687b3          	add	a5,a3,a5
40001788:	00e78123          	sb	a4,2(a5)
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
4000178c:	fef44783          	lbu	a5,-17(s0)
40001790:	fdc42703          	lw	a4,-36(s0)
40001794:	00279793          	slli	a5,a5,0x2
40001798:	00f707b3          	add	a5,a4,a5
4000179c:	0037c783          	lbu	a5,3(a5)
400017a0:	fee44703          	lbu	a4,-18(s0)
400017a4:	00e7c7b3          	xor	a5,a5,a4
400017a8:	fef40623          	sb	a5,-20(s0)
400017ac:	fec44783          	lbu	a5,-20(s0)
400017b0:	00078513          	mv	a0,a5
400017b4:	d35ff0ef          	jal	ra,400014e8 <xtime>
400017b8:	00050793          	mv	a5,a0
400017bc:	fef40623          	sb	a5,-20(s0)
400017c0:	fef44783          	lbu	a5,-17(s0)
400017c4:	fdc42703          	lw	a4,-36(s0)
400017c8:	00279793          	slli	a5,a5,0x2
400017cc:	00f707b3          	add	a5,a4,a5
400017d0:	0037c683          	lbu	a3,3(a5)
400017d4:	fec44783          	lbu	a5,-20(s0)
400017d8:	00078713          	mv	a4,a5
400017dc:	fed44783          	lbu	a5,-19(s0)
400017e0:	00f747b3          	xor	a5,a4,a5
400017e4:	0ff7f713          	zext.b	a4,a5
400017e8:	fef44783          	lbu	a5,-17(s0)
400017ec:	00e6c733          	xor	a4,a3,a4
400017f0:	0ff77713          	zext.b	a4,a4
400017f4:	fdc42683          	lw	a3,-36(s0)
400017f8:	00279793          	slli	a5,a5,0x2
400017fc:	00f687b3          	add	a5,a3,a5
40001800:	00e781a3          	sb	a4,3(a5)
  for (i = 0; i < 4; ++i)
40001804:	fef44783          	lbu	a5,-17(s0)
40001808:	00178793          	addi	a5,a5,1
4000180c:	fef407a3          	sb	a5,-17(s0)
40001810:	fef44703          	lbu	a4,-17(s0)
40001814:	00300793          	li	a5,3
40001818:	d4e7fee3          	bgeu	a5,a4,40001574 <MixColumns+0x1c>
  }
}
4000181c:	00000013          	nop
40001820:	00000013          	nop
40001824:	02c12083          	lw	ra,44(sp)
40001828:	02812403          	lw	s0,40(sp)
4000182c:	03010113          	addi	sp,sp,48
40001830:	00008067          	ret

40001834 <InvMixColumns>:
#if (defined(CBC) && CBC == 1) || (defined(ECB) && ECB == 1)
// MixColumns function mixes the columns of the state matrix.
// The method used to multiply may be difficult to understand for the inexperienced.
// Please use the references to gain more information.
static void InvMixColumns(state_t* state)
{
40001834:	fd010113          	addi	sp,sp,-48
40001838:	02112623          	sw	ra,44(sp)
4000183c:	02812423          	sw	s0,40(sp)
40001840:	02912223          	sw	s1,36(sp)
40001844:	03212023          	sw	s2,32(sp)
40001848:	03010413          	addi	s0,sp,48
4000184c:	fca42e23          	sw	a0,-36(s0)
  int i;
  uint8_t a, b, c, d;
  for (i = 0; i < 4; ++i)
40001850:	fe042623          	sw	zero,-20(s0)
40001854:	2710006f          	j	400022c4 <InvMixColumns+0xa90>
  { 
    a = (*state)[i][0];
40001858:	fdc42703          	lw	a4,-36(s0)
4000185c:	fec42783          	lw	a5,-20(s0)
40001860:	00279793          	slli	a5,a5,0x2
40001864:	00f707b3          	add	a5,a4,a5
40001868:	0007c783          	lbu	a5,0(a5)
4000186c:	fef405a3          	sb	a5,-21(s0)
    b = (*state)[i][1];
40001870:	fdc42703          	lw	a4,-36(s0)
40001874:	fec42783          	lw	a5,-20(s0)
40001878:	00279793          	slli	a5,a5,0x2
4000187c:	00f707b3          	add	a5,a4,a5
40001880:	0017c783          	lbu	a5,1(a5)
40001884:	fef40523          	sb	a5,-22(s0)
    c = (*state)[i][2];
40001888:	fdc42703          	lw	a4,-36(s0)
4000188c:	fec42783          	lw	a5,-20(s0)
40001890:	00279793          	slli	a5,a5,0x2
40001894:	00f707b3          	add	a5,a4,a5
40001898:	0027c783          	lbu	a5,2(a5)
4000189c:	fef404a3          	sb	a5,-23(s0)
    d = (*state)[i][3];
400018a0:	fdc42703          	lw	a4,-36(s0)
400018a4:	fec42783          	lw	a5,-20(s0)
400018a8:	00279793          	slli	a5,a5,0x2
400018ac:	00f707b3          	add	a5,a4,a5
400018b0:	0037c783          	lbu	a5,3(a5)
400018b4:	fef40423          	sb	a5,-24(s0)

    (*state)[i][0] = Multiply(a, 0x0e) ^ Multiply(b, 0x0b) ^ Multiply(c, 0x0d) ^ Multiply(d, 0x09);
400018b8:	feb44783          	lbu	a5,-21(s0)
400018bc:	00078513          	mv	a0,a5
400018c0:	c29ff0ef          	jal	ra,400014e8 <xtime>
400018c4:	00050793          	mv	a5,a0
400018c8:	00078513          	mv	a0,a5
400018cc:	c1dff0ef          	jal	ra,400014e8 <xtime>
400018d0:	00050793          	mv	a5,a0
400018d4:	00078513          	mv	a0,a5
400018d8:	c11ff0ef          	jal	ra,400014e8 <xtime>
400018dc:	00050793          	mv	a5,a0
400018e0:	00078513          	mv	a0,a5
400018e4:	c05ff0ef          	jal	ra,400014e8 <xtime>
400018e8:	fea44783          	lbu	a5,-22(s0)
400018ec:	00078513          	mv	a0,a5
400018f0:	bf9ff0ef          	jal	ra,400014e8 <xtime>
400018f4:	00050793          	mv	a5,a0
400018f8:	00078513          	mv	a0,a5
400018fc:	bedff0ef          	jal	ra,400014e8 <xtime>
40001900:	fea44783          	lbu	a5,-22(s0)
40001904:	00078513          	mv	a0,a5
40001908:	be1ff0ef          	jal	ra,400014e8 <xtime>
4000190c:	00050793          	mv	a5,a0
40001910:	00078513          	mv	a0,a5
40001914:	bd5ff0ef          	jal	ra,400014e8 <xtime>
40001918:	00050793          	mv	a5,a0
4000191c:	00078513          	mv	a0,a5
40001920:	bc9ff0ef          	jal	ra,400014e8 <xtime>
40001924:	00050793          	mv	a5,a0
40001928:	00078513          	mv	a0,a5
4000192c:	bbdff0ef          	jal	ra,400014e8 <xtime>
40001930:	fe944783          	lbu	a5,-23(s0)
40001934:	00078513          	mv	a0,a5
40001938:	bb1ff0ef          	jal	ra,400014e8 <xtime>
4000193c:	fe944783          	lbu	a5,-23(s0)
40001940:	00078513          	mv	a0,a5
40001944:	ba5ff0ef          	jal	ra,400014e8 <xtime>
40001948:	00050793          	mv	a5,a0
4000194c:	00078513          	mv	a0,a5
40001950:	b99ff0ef          	jal	ra,400014e8 <xtime>
40001954:	00050793          	mv	a5,a0
40001958:	00078513          	mv	a0,a5
4000195c:	b8dff0ef          	jal	ra,400014e8 <xtime>
40001960:	00050793          	mv	a5,a0
40001964:	00078513          	mv	a0,a5
40001968:	b81ff0ef          	jal	ra,400014e8 <xtime>
4000196c:	fe844783          	lbu	a5,-24(s0)
40001970:	00078513          	mv	a0,a5
40001974:	b75ff0ef          	jal	ra,400014e8 <xtime>
40001978:	fe844783          	lbu	a5,-24(s0)
4000197c:	00078513          	mv	a0,a5
40001980:	b69ff0ef          	jal	ra,400014e8 <xtime>
40001984:	00050793          	mv	a5,a0
40001988:	00078513          	mv	a0,a5
4000198c:	b5dff0ef          	jal	ra,400014e8 <xtime>
40001990:	fe844783          	lbu	a5,-24(s0)
40001994:	00078513          	mv	a0,a5
40001998:	b51ff0ef          	jal	ra,400014e8 <xtime>
4000199c:	00050793          	mv	a5,a0
400019a0:	00078513          	mv	a0,a5
400019a4:	b45ff0ef          	jal	ra,400014e8 <xtime>
400019a8:	00050793          	mv	a5,a0
400019ac:	00078513          	mv	a0,a5
400019b0:	b39ff0ef          	jal	ra,400014e8 <xtime>
400019b4:	00050793          	mv	a5,a0
400019b8:	00078513          	mv	a0,a5
400019bc:	b2dff0ef          	jal	ra,400014e8 <xtime>
400019c0:	feb44783          	lbu	a5,-21(s0)
400019c4:	00078513          	mv	a0,a5
400019c8:	b21ff0ef          	jal	ra,400014e8 <xtime>
400019cc:	00050793          	mv	a5,a0
400019d0:	00078493          	mv	s1,a5
400019d4:	feb44783          	lbu	a5,-21(s0)
400019d8:	00078513          	mv	a0,a5
400019dc:	b0dff0ef          	jal	ra,400014e8 <xtime>
400019e0:	00050793          	mv	a5,a0
400019e4:	00078513          	mv	a0,a5
400019e8:	b01ff0ef          	jal	ra,400014e8 <xtime>
400019ec:	00050793          	mv	a5,a0
400019f0:	00f4c7b3          	xor	a5,s1,a5
400019f4:	0ff7f493          	zext.b	s1,a5
400019f8:	feb44783          	lbu	a5,-21(s0)
400019fc:	00078513          	mv	a0,a5
40001a00:	ae9ff0ef          	jal	ra,400014e8 <xtime>
40001a04:	00050793          	mv	a5,a0
40001a08:	00078513          	mv	a0,a5
40001a0c:	addff0ef          	jal	ra,400014e8 <xtime>
40001a10:	00050793          	mv	a5,a0
40001a14:	00078513          	mv	a0,a5
40001a18:	ad1ff0ef          	jal	ra,400014e8 <xtime>
40001a1c:	00050793          	mv	a5,a0
40001a20:	00f4c7b3          	xor	a5,s1,a5
40001a24:	0ff7f493          	zext.b	s1,a5
40001a28:	fea44783          	lbu	a5,-22(s0)
40001a2c:	00078513          	mv	a0,a5
40001a30:	ab9ff0ef          	jal	ra,400014e8 <xtime>
40001a34:	00050793          	mv	a5,a0
40001a38:	00078713          	mv	a4,a5
40001a3c:	fea44783          	lbu	a5,-22(s0)
40001a40:	00f747b3          	xor	a5,a4,a5
40001a44:	0ff7f913          	zext.b	s2,a5
40001a48:	fea44783          	lbu	a5,-22(s0)
40001a4c:	00078513          	mv	a0,a5
40001a50:	a99ff0ef          	jal	ra,400014e8 <xtime>
40001a54:	00050793          	mv	a5,a0
40001a58:	00078513          	mv	a0,a5
40001a5c:	a8dff0ef          	jal	ra,400014e8 <xtime>
40001a60:	00050793          	mv	a5,a0
40001a64:	00078513          	mv	a0,a5
40001a68:	a81ff0ef          	jal	ra,400014e8 <xtime>
40001a6c:	00050793          	mv	a5,a0
40001a70:	00f947b3          	xor	a5,s2,a5
40001a74:	0ff7f793          	zext.b	a5,a5
40001a78:	00f4c7b3          	xor	a5,s1,a5
40001a7c:	0ff7f493          	zext.b	s1,a5
40001a80:	fe944783          	lbu	a5,-23(s0)
40001a84:	00078513          	mv	a0,a5
40001a88:	a61ff0ef          	jal	ra,400014e8 <xtime>
40001a8c:	00050793          	mv	a5,a0
40001a90:	00078513          	mv	a0,a5
40001a94:	a55ff0ef          	jal	ra,400014e8 <xtime>
40001a98:	00050793          	mv	a5,a0
40001a9c:	00078713          	mv	a4,a5
40001aa0:	fe944783          	lbu	a5,-23(s0)
40001aa4:	00f747b3          	xor	a5,a4,a5
40001aa8:	0ff7f913          	zext.b	s2,a5
40001aac:	fe944783          	lbu	a5,-23(s0)
40001ab0:	00078513          	mv	a0,a5
40001ab4:	a35ff0ef          	jal	ra,400014e8 <xtime>
40001ab8:	00050793          	mv	a5,a0
40001abc:	00078513          	mv	a0,a5
40001ac0:	a29ff0ef          	jal	ra,400014e8 <xtime>
40001ac4:	00050793          	mv	a5,a0
40001ac8:	00078513          	mv	a0,a5
40001acc:	a1dff0ef          	jal	ra,400014e8 <xtime>
40001ad0:	00050793          	mv	a5,a0
40001ad4:	00f947b3          	xor	a5,s2,a5
40001ad8:	0ff7f793          	zext.b	a5,a5
40001adc:	00f4c7b3          	xor	a5,s1,a5
40001ae0:	0ff7f493          	zext.b	s1,a5
40001ae4:	fe844783          	lbu	a5,-24(s0)
40001ae8:	00078513          	mv	a0,a5
40001aec:	9fdff0ef          	jal	ra,400014e8 <xtime>
40001af0:	00050793          	mv	a5,a0
40001af4:	00078513          	mv	a0,a5
40001af8:	9f1ff0ef          	jal	ra,400014e8 <xtime>
40001afc:	00050793          	mv	a5,a0
40001b00:	00078513          	mv	a0,a5
40001b04:	9e5ff0ef          	jal	ra,400014e8 <xtime>
40001b08:	00050793          	mv	a5,a0
40001b0c:	00078713          	mv	a4,a5
40001b10:	fe844783          	lbu	a5,-24(s0)
40001b14:	00f747b3          	xor	a5,a4,a5
40001b18:	0ff7f793          	zext.b	a5,a5
40001b1c:	00f4c7b3          	xor	a5,s1,a5
40001b20:	0ff7f713          	zext.b	a4,a5
40001b24:	fdc42683          	lw	a3,-36(s0)
40001b28:	fec42783          	lw	a5,-20(s0)
40001b2c:	00279793          	slli	a5,a5,0x2
40001b30:	00f687b3          	add	a5,a3,a5
40001b34:	00e78023          	sb	a4,0(a5)
    (*state)[i][1] = Multiply(a, 0x09) ^ Multiply(b, 0x0e) ^ Multiply(c, 0x0b) ^ Multiply(d, 0x0d);
40001b38:	feb44783          	lbu	a5,-21(s0)
40001b3c:	00078513          	mv	a0,a5
40001b40:	9a9ff0ef          	jal	ra,400014e8 <xtime>
40001b44:	feb44783          	lbu	a5,-21(s0)
40001b48:	00078513          	mv	a0,a5
40001b4c:	99dff0ef          	jal	ra,400014e8 <xtime>
40001b50:	00050793          	mv	a5,a0
40001b54:	00078513          	mv	a0,a5
40001b58:	991ff0ef          	jal	ra,400014e8 <xtime>
40001b5c:	feb44783          	lbu	a5,-21(s0)
40001b60:	00078513          	mv	a0,a5
40001b64:	985ff0ef          	jal	ra,400014e8 <xtime>
40001b68:	00050793          	mv	a5,a0
40001b6c:	00078513          	mv	a0,a5
40001b70:	979ff0ef          	jal	ra,400014e8 <xtime>
40001b74:	00050793          	mv	a5,a0
40001b78:	00078513          	mv	a0,a5
40001b7c:	96dff0ef          	jal	ra,400014e8 <xtime>
40001b80:	00050793          	mv	a5,a0
40001b84:	00078513          	mv	a0,a5
40001b88:	961ff0ef          	jal	ra,400014e8 <xtime>
40001b8c:	fea44783          	lbu	a5,-22(s0)
40001b90:	00078513          	mv	a0,a5
40001b94:	955ff0ef          	jal	ra,400014e8 <xtime>
40001b98:	00050793          	mv	a5,a0
40001b9c:	00078513          	mv	a0,a5
40001ba0:	949ff0ef          	jal	ra,400014e8 <xtime>
40001ba4:	00050793          	mv	a5,a0
40001ba8:	00078513          	mv	a0,a5
40001bac:	93dff0ef          	jal	ra,400014e8 <xtime>
40001bb0:	00050793          	mv	a5,a0
40001bb4:	00078513          	mv	a0,a5
40001bb8:	931ff0ef          	jal	ra,400014e8 <xtime>
40001bbc:	fe944783          	lbu	a5,-23(s0)
40001bc0:	00078513          	mv	a0,a5
40001bc4:	925ff0ef          	jal	ra,400014e8 <xtime>
40001bc8:	00050793          	mv	a5,a0
40001bcc:	00078513          	mv	a0,a5
40001bd0:	919ff0ef          	jal	ra,400014e8 <xtime>
40001bd4:	fe944783          	lbu	a5,-23(s0)
40001bd8:	00078513          	mv	a0,a5
40001bdc:	90dff0ef          	jal	ra,400014e8 <xtime>
40001be0:	00050793          	mv	a5,a0
40001be4:	00078513          	mv	a0,a5
40001be8:	901ff0ef          	jal	ra,400014e8 <xtime>
40001bec:	00050793          	mv	a5,a0
40001bf0:	00078513          	mv	a0,a5
40001bf4:	8f5ff0ef          	jal	ra,400014e8 <xtime>
40001bf8:	00050793          	mv	a5,a0
40001bfc:	00078513          	mv	a0,a5
40001c00:	8e9ff0ef          	jal	ra,400014e8 <xtime>
40001c04:	fe844783          	lbu	a5,-24(s0)
40001c08:	00078513          	mv	a0,a5
40001c0c:	8ddff0ef          	jal	ra,400014e8 <xtime>
40001c10:	fe844783          	lbu	a5,-24(s0)
40001c14:	00078513          	mv	a0,a5
40001c18:	8d1ff0ef          	jal	ra,400014e8 <xtime>
40001c1c:	00050793          	mv	a5,a0
40001c20:	00078513          	mv	a0,a5
40001c24:	8c5ff0ef          	jal	ra,400014e8 <xtime>
40001c28:	00050793          	mv	a5,a0
40001c2c:	00078513          	mv	a0,a5
40001c30:	8b9ff0ef          	jal	ra,400014e8 <xtime>
40001c34:	00050793          	mv	a5,a0
40001c38:	00078513          	mv	a0,a5
40001c3c:	8adff0ef          	jal	ra,400014e8 <xtime>
40001c40:	feb44783          	lbu	a5,-21(s0)
40001c44:	00078513          	mv	a0,a5
40001c48:	8a1ff0ef          	jal	ra,400014e8 <xtime>
40001c4c:	00050793          	mv	a5,a0
40001c50:	00078513          	mv	a0,a5
40001c54:	895ff0ef          	jal	ra,400014e8 <xtime>
40001c58:	00050793          	mv	a5,a0
40001c5c:	00078513          	mv	a0,a5
40001c60:	889ff0ef          	jal	ra,400014e8 <xtime>
40001c64:	00050793          	mv	a5,a0
40001c68:	00078713          	mv	a4,a5
40001c6c:	feb44783          	lbu	a5,-21(s0)
40001c70:	00f747b3          	xor	a5,a4,a5
40001c74:	0ff7f493          	zext.b	s1,a5
40001c78:	fea44783          	lbu	a5,-22(s0)
40001c7c:	00078513          	mv	a0,a5
40001c80:	869ff0ef          	jal	ra,400014e8 <xtime>
40001c84:	00050793          	mv	a5,a0
40001c88:	00078913          	mv	s2,a5
40001c8c:	fea44783          	lbu	a5,-22(s0)
40001c90:	00078513          	mv	a0,a5
40001c94:	855ff0ef          	jal	ra,400014e8 <xtime>
40001c98:	00050793          	mv	a5,a0
40001c9c:	00078513          	mv	a0,a5
40001ca0:	849ff0ef          	jal	ra,400014e8 <xtime>
40001ca4:	00050793          	mv	a5,a0
40001ca8:	00f947b3          	xor	a5,s2,a5
40001cac:	0ff7f913          	zext.b	s2,a5
40001cb0:	fea44783          	lbu	a5,-22(s0)
40001cb4:	00078513          	mv	a0,a5
40001cb8:	831ff0ef          	jal	ra,400014e8 <xtime>
40001cbc:	00050793          	mv	a5,a0
40001cc0:	00078513          	mv	a0,a5
40001cc4:	825ff0ef          	jal	ra,400014e8 <xtime>
40001cc8:	00050793          	mv	a5,a0
40001ccc:	00078513          	mv	a0,a5
40001cd0:	819ff0ef          	jal	ra,400014e8 <xtime>
40001cd4:	00050793          	mv	a5,a0
40001cd8:	00f947b3          	xor	a5,s2,a5
40001cdc:	0ff7f793          	zext.b	a5,a5
40001ce0:	00f4c7b3          	xor	a5,s1,a5
40001ce4:	0ff7f493          	zext.b	s1,a5
40001ce8:	fe944783          	lbu	a5,-23(s0)
40001cec:	00078513          	mv	a0,a5
40001cf0:	ff8ff0ef          	jal	ra,400014e8 <xtime>
40001cf4:	00050793          	mv	a5,a0
40001cf8:	00078713          	mv	a4,a5
40001cfc:	fe944783          	lbu	a5,-23(s0)
40001d00:	00f747b3          	xor	a5,a4,a5
40001d04:	0ff7f913          	zext.b	s2,a5
40001d08:	fe944783          	lbu	a5,-23(s0)
40001d0c:	00078513          	mv	a0,a5
40001d10:	fd8ff0ef          	jal	ra,400014e8 <xtime>
40001d14:	00050793          	mv	a5,a0
40001d18:	00078513          	mv	a0,a5
40001d1c:	fccff0ef          	jal	ra,400014e8 <xtime>
40001d20:	00050793          	mv	a5,a0
40001d24:	00078513          	mv	a0,a5
40001d28:	fc0ff0ef          	jal	ra,400014e8 <xtime>
40001d2c:	00050793          	mv	a5,a0
40001d30:	00f947b3          	xor	a5,s2,a5
40001d34:	0ff7f793          	zext.b	a5,a5
40001d38:	00f4c7b3          	xor	a5,s1,a5
40001d3c:	0ff7f493          	zext.b	s1,a5
40001d40:	fe844783          	lbu	a5,-24(s0)
40001d44:	00078513          	mv	a0,a5
40001d48:	fa0ff0ef          	jal	ra,400014e8 <xtime>
40001d4c:	00050793          	mv	a5,a0
40001d50:	00078513          	mv	a0,a5
40001d54:	f94ff0ef          	jal	ra,400014e8 <xtime>
40001d58:	00050793          	mv	a5,a0
40001d5c:	00078713          	mv	a4,a5
40001d60:	fe844783          	lbu	a5,-24(s0)
40001d64:	00f747b3          	xor	a5,a4,a5
40001d68:	0ff7f913          	zext.b	s2,a5
40001d6c:	fe844783          	lbu	a5,-24(s0)
40001d70:	00078513          	mv	a0,a5
40001d74:	f74ff0ef          	jal	ra,400014e8 <xtime>
40001d78:	00050793          	mv	a5,a0
40001d7c:	00078513          	mv	a0,a5
40001d80:	f68ff0ef          	jal	ra,400014e8 <xtime>
40001d84:	00050793          	mv	a5,a0
40001d88:	00078513          	mv	a0,a5
40001d8c:	f5cff0ef          	jal	ra,400014e8 <xtime>
40001d90:	00050793          	mv	a5,a0
40001d94:	00f947b3          	xor	a5,s2,a5
40001d98:	0ff7f793          	zext.b	a5,a5
40001d9c:	00f4c7b3          	xor	a5,s1,a5
40001da0:	0ff7f713          	zext.b	a4,a5
40001da4:	fdc42683          	lw	a3,-36(s0)
40001da8:	fec42783          	lw	a5,-20(s0)
40001dac:	00279793          	slli	a5,a5,0x2
40001db0:	00f687b3          	add	a5,a3,a5
40001db4:	00e780a3          	sb	a4,1(a5)
    (*state)[i][2] = Multiply(a, 0x0d) ^ Multiply(b, 0x09) ^ Multiply(c, 0x0e) ^ Multiply(d, 0x0b);
40001db8:	feb44783          	lbu	a5,-21(s0)
40001dbc:	00078513          	mv	a0,a5
40001dc0:	f28ff0ef          	jal	ra,400014e8 <xtime>
40001dc4:	feb44783          	lbu	a5,-21(s0)
40001dc8:	00078513          	mv	a0,a5
40001dcc:	f1cff0ef          	jal	ra,400014e8 <xtime>
40001dd0:	00050793          	mv	a5,a0
40001dd4:	00078513          	mv	a0,a5
40001dd8:	f10ff0ef          	jal	ra,400014e8 <xtime>
40001ddc:	00050793          	mv	a5,a0
40001de0:	00078513          	mv	a0,a5
40001de4:	f04ff0ef          	jal	ra,400014e8 <xtime>
40001de8:	00050793          	mv	a5,a0
40001dec:	00078513          	mv	a0,a5
40001df0:	ef8ff0ef          	jal	ra,400014e8 <xtime>
40001df4:	fea44783          	lbu	a5,-22(s0)
40001df8:	00078513          	mv	a0,a5
40001dfc:	eecff0ef          	jal	ra,400014e8 <xtime>
40001e00:	fea44783          	lbu	a5,-22(s0)
40001e04:	00078513          	mv	a0,a5
40001e08:	ee0ff0ef          	jal	ra,400014e8 <xtime>
40001e0c:	00050793          	mv	a5,a0
40001e10:	00078513          	mv	a0,a5
40001e14:	ed4ff0ef          	jal	ra,400014e8 <xtime>
40001e18:	fea44783          	lbu	a5,-22(s0)
40001e1c:	00078513          	mv	a0,a5
40001e20:	ec8ff0ef          	jal	ra,400014e8 <xtime>
40001e24:	00050793          	mv	a5,a0
40001e28:	00078513          	mv	a0,a5
40001e2c:	ebcff0ef          	jal	ra,400014e8 <xtime>
40001e30:	00050793          	mv	a5,a0
40001e34:	00078513          	mv	a0,a5
40001e38:	eb0ff0ef          	jal	ra,400014e8 <xtime>
40001e3c:	00050793          	mv	a5,a0
40001e40:	00078513          	mv	a0,a5
40001e44:	ea4ff0ef          	jal	ra,400014e8 <xtime>
40001e48:	fe944783          	lbu	a5,-23(s0)
40001e4c:	00078513          	mv	a0,a5
40001e50:	e98ff0ef          	jal	ra,400014e8 <xtime>
40001e54:	00050793          	mv	a5,a0
40001e58:	00078513          	mv	a0,a5
40001e5c:	e8cff0ef          	jal	ra,400014e8 <xtime>
40001e60:	00050793          	mv	a5,a0
40001e64:	00078513          	mv	a0,a5
40001e68:	e80ff0ef          	jal	ra,400014e8 <xtime>
40001e6c:	00050793          	mv	a5,a0
40001e70:	00078513          	mv	a0,a5
40001e74:	e74ff0ef          	jal	ra,400014e8 <xtime>
40001e78:	fe844783          	lbu	a5,-24(s0)
40001e7c:	00078513          	mv	a0,a5
40001e80:	e68ff0ef          	jal	ra,400014e8 <xtime>
40001e84:	00050793          	mv	a5,a0
40001e88:	00078513          	mv	a0,a5
40001e8c:	e5cff0ef          	jal	ra,400014e8 <xtime>
40001e90:	fe844783          	lbu	a5,-24(s0)
40001e94:	00078513          	mv	a0,a5
40001e98:	e50ff0ef          	jal	ra,400014e8 <xtime>
40001e9c:	00050793          	mv	a5,a0
40001ea0:	00078513          	mv	a0,a5
40001ea4:	e44ff0ef          	jal	ra,400014e8 <xtime>
40001ea8:	00050793          	mv	a5,a0
40001eac:	00078513          	mv	a0,a5
40001eb0:	e38ff0ef          	jal	ra,400014e8 <xtime>
40001eb4:	00050793          	mv	a5,a0
40001eb8:	00078513          	mv	a0,a5
40001ebc:	e2cff0ef          	jal	ra,400014e8 <xtime>
40001ec0:	feb44783          	lbu	a5,-21(s0)
40001ec4:	00078513          	mv	a0,a5
40001ec8:	e20ff0ef          	jal	ra,400014e8 <xtime>
40001ecc:	00050793          	mv	a5,a0
40001ed0:	00078513          	mv	a0,a5
40001ed4:	e14ff0ef          	jal	ra,400014e8 <xtime>
40001ed8:	00050793          	mv	a5,a0
40001edc:	00078713          	mv	a4,a5
40001ee0:	feb44783          	lbu	a5,-21(s0)
40001ee4:	00f747b3          	xor	a5,a4,a5
40001ee8:	0ff7f493          	zext.b	s1,a5
40001eec:	feb44783          	lbu	a5,-21(s0)
40001ef0:	00078513          	mv	a0,a5
40001ef4:	df4ff0ef          	jal	ra,400014e8 <xtime>
40001ef8:	00050793          	mv	a5,a0
40001efc:	00078513          	mv	a0,a5
40001f00:	de8ff0ef          	jal	ra,400014e8 <xtime>
40001f04:	00050793          	mv	a5,a0
40001f08:	00078513          	mv	a0,a5
40001f0c:	ddcff0ef          	jal	ra,400014e8 <xtime>
40001f10:	00050793          	mv	a5,a0
40001f14:	00f4c7b3          	xor	a5,s1,a5
40001f18:	0ff7f493          	zext.b	s1,a5
40001f1c:	fea44783          	lbu	a5,-22(s0)
40001f20:	00078513          	mv	a0,a5
40001f24:	dc4ff0ef          	jal	ra,400014e8 <xtime>
40001f28:	00050793          	mv	a5,a0
40001f2c:	00078513          	mv	a0,a5
40001f30:	db8ff0ef          	jal	ra,400014e8 <xtime>
40001f34:	00050793          	mv	a5,a0
40001f38:	00078513          	mv	a0,a5
40001f3c:	dacff0ef          	jal	ra,400014e8 <xtime>
40001f40:	00050793          	mv	a5,a0
40001f44:	00078713          	mv	a4,a5
40001f48:	fea44783          	lbu	a5,-22(s0)
40001f4c:	00f747b3          	xor	a5,a4,a5
40001f50:	0ff7f793          	zext.b	a5,a5
40001f54:	00f4c7b3          	xor	a5,s1,a5
40001f58:	0ff7f493          	zext.b	s1,a5
40001f5c:	fe944783          	lbu	a5,-23(s0)
40001f60:	00078513          	mv	a0,a5
40001f64:	d84ff0ef          	jal	ra,400014e8 <xtime>
40001f68:	00050793          	mv	a5,a0
40001f6c:	00078913          	mv	s2,a5
40001f70:	fe944783          	lbu	a5,-23(s0)
40001f74:	00078513          	mv	a0,a5
40001f78:	d70ff0ef          	jal	ra,400014e8 <xtime>
40001f7c:	00050793          	mv	a5,a0
40001f80:	00078513          	mv	a0,a5
40001f84:	d64ff0ef          	jal	ra,400014e8 <xtime>
40001f88:	00050793          	mv	a5,a0
40001f8c:	00f947b3          	xor	a5,s2,a5
40001f90:	0ff7f913          	zext.b	s2,a5
40001f94:	fe944783          	lbu	a5,-23(s0)
40001f98:	00078513          	mv	a0,a5
40001f9c:	d4cff0ef          	jal	ra,400014e8 <xtime>
40001fa0:	00050793          	mv	a5,a0
40001fa4:	00078513          	mv	a0,a5
40001fa8:	d40ff0ef          	jal	ra,400014e8 <xtime>
40001fac:	00050793          	mv	a5,a0
40001fb0:	00078513          	mv	a0,a5
40001fb4:	d34ff0ef          	jal	ra,400014e8 <xtime>
40001fb8:	00050793          	mv	a5,a0
40001fbc:	00f947b3          	xor	a5,s2,a5
40001fc0:	0ff7f793          	zext.b	a5,a5
40001fc4:	00f4c7b3          	xor	a5,s1,a5
40001fc8:	0ff7f493          	zext.b	s1,a5
40001fcc:	fe844783          	lbu	a5,-24(s0)
40001fd0:	00078513          	mv	a0,a5
40001fd4:	d14ff0ef          	jal	ra,400014e8 <xtime>
40001fd8:	00050793          	mv	a5,a0
40001fdc:	00078713          	mv	a4,a5
40001fe0:	fe844783          	lbu	a5,-24(s0)
40001fe4:	00f747b3          	xor	a5,a4,a5
40001fe8:	0ff7f913          	zext.b	s2,a5
40001fec:	fe844783          	lbu	a5,-24(s0)
40001ff0:	00078513          	mv	a0,a5
40001ff4:	cf4ff0ef          	jal	ra,400014e8 <xtime>
40001ff8:	00050793          	mv	a5,a0
40001ffc:	00078513          	mv	a0,a5
40002000:	ce8ff0ef          	jal	ra,400014e8 <xtime>
40002004:	00050793          	mv	a5,a0
40002008:	00078513          	mv	a0,a5
4000200c:	cdcff0ef          	jal	ra,400014e8 <xtime>
40002010:	00050793          	mv	a5,a0
40002014:	00f947b3          	xor	a5,s2,a5
40002018:	0ff7f793          	zext.b	a5,a5
4000201c:	00f4c7b3          	xor	a5,s1,a5
40002020:	0ff7f713          	zext.b	a4,a5
40002024:	fdc42683          	lw	a3,-36(s0)
40002028:	fec42783          	lw	a5,-20(s0)
4000202c:	00279793          	slli	a5,a5,0x2
40002030:	00f687b3          	add	a5,a3,a5
40002034:	00e78123          	sb	a4,2(a5)
    (*state)[i][3] = Multiply(a, 0x0b) ^ Multiply(b, 0x0d) ^ Multiply(c, 0x09) ^ Multiply(d, 0x0e);
40002038:	feb44783          	lbu	a5,-21(s0)
4000203c:	00078513          	mv	a0,a5
40002040:	ca8ff0ef          	jal	ra,400014e8 <xtime>
40002044:	00050793          	mv	a5,a0
40002048:	00078513          	mv	a0,a5
4000204c:	c9cff0ef          	jal	ra,400014e8 <xtime>
40002050:	feb44783          	lbu	a5,-21(s0)
40002054:	00078513          	mv	a0,a5
40002058:	c90ff0ef          	jal	ra,400014e8 <xtime>
4000205c:	00050793          	mv	a5,a0
40002060:	00078513          	mv	a0,a5
40002064:	c84ff0ef          	jal	ra,400014e8 <xtime>
40002068:	00050793          	mv	a5,a0
4000206c:	00078513          	mv	a0,a5
40002070:	c78ff0ef          	jal	ra,400014e8 <xtime>
40002074:	00050793          	mv	a5,a0
40002078:	00078513          	mv	a0,a5
4000207c:	c6cff0ef          	jal	ra,400014e8 <xtime>
40002080:	fea44783          	lbu	a5,-22(s0)
40002084:	00078513          	mv	a0,a5
40002088:	c60ff0ef          	jal	ra,400014e8 <xtime>
4000208c:	fea44783          	lbu	a5,-22(s0)
40002090:	00078513          	mv	a0,a5
40002094:	c54ff0ef          	jal	ra,400014e8 <xtime>
40002098:	00050793          	mv	a5,a0
4000209c:	00078513          	mv	a0,a5
400020a0:	c48ff0ef          	jal	ra,400014e8 <xtime>
400020a4:	00050793          	mv	a5,a0
400020a8:	00078513          	mv	a0,a5
400020ac:	c3cff0ef          	jal	ra,400014e8 <xtime>
400020b0:	00050793          	mv	a5,a0
400020b4:	00078513          	mv	a0,a5
400020b8:	c30ff0ef          	jal	ra,400014e8 <xtime>
400020bc:	fe944783          	lbu	a5,-23(s0)
400020c0:	00078513          	mv	a0,a5
400020c4:	c24ff0ef          	jal	ra,400014e8 <xtime>
400020c8:	fe944783          	lbu	a5,-23(s0)
400020cc:	00078513          	mv	a0,a5
400020d0:	c18ff0ef          	jal	ra,400014e8 <xtime>
400020d4:	00050793          	mv	a5,a0
400020d8:	00078513          	mv	a0,a5
400020dc:	c0cff0ef          	jal	ra,400014e8 <xtime>
400020e0:	fe944783          	lbu	a5,-23(s0)
400020e4:	00078513          	mv	a0,a5
400020e8:	c00ff0ef          	jal	ra,400014e8 <xtime>
400020ec:	00050793          	mv	a5,a0
400020f0:	00078513          	mv	a0,a5
400020f4:	bf4ff0ef          	jal	ra,400014e8 <xtime>
400020f8:	00050793          	mv	a5,a0
400020fc:	00078513          	mv	a0,a5
40002100:	be8ff0ef          	jal	ra,400014e8 <xtime>
40002104:	00050793          	mv	a5,a0
40002108:	00078513          	mv	a0,a5
4000210c:	bdcff0ef          	jal	ra,400014e8 <xtime>
40002110:	fe844783          	lbu	a5,-24(s0)
40002114:	00078513          	mv	a0,a5
40002118:	bd0ff0ef          	jal	ra,400014e8 <xtime>
4000211c:	00050793          	mv	a5,a0
40002120:	00078513          	mv	a0,a5
40002124:	bc4ff0ef          	jal	ra,400014e8 <xtime>
40002128:	00050793          	mv	a5,a0
4000212c:	00078513          	mv	a0,a5
40002130:	bb8ff0ef          	jal	ra,400014e8 <xtime>
40002134:	00050793          	mv	a5,a0
40002138:	00078513          	mv	a0,a5
4000213c:	bacff0ef          	jal	ra,400014e8 <xtime>
40002140:	feb44783          	lbu	a5,-21(s0)
40002144:	00078513          	mv	a0,a5
40002148:	ba0ff0ef          	jal	ra,400014e8 <xtime>
4000214c:	00050793          	mv	a5,a0
40002150:	00078713          	mv	a4,a5
40002154:	feb44783          	lbu	a5,-21(s0)
40002158:	00f747b3          	xor	a5,a4,a5
4000215c:	0ff7f493          	zext.b	s1,a5
40002160:	feb44783          	lbu	a5,-21(s0)
40002164:	00078513          	mv	a0,a5
40002168:	b80ff0ef          	jal	ra,400014e8 <xtime>
4000216c:	00050793          	mv	a5,a0
40002170:	00078513          	mv	a0,a5
40002174:	b74ff0ef          	jal	ra,400014e8 <xtime>
40002178:	00050793          	mv	a5,a0
4000217c:	00078513          	mv	a0,a5
40002180:	b68ff0ef          	jal	ra,400014e8 <xtime>
40002184:	00050793          	mv	a5,a0
40002188:	00f4c7b3          	xor	a5,s1,a5
4000218c:	0ff7f493          	zext.b	s1,a5
40002190:	fea44783          	lbu	a5,-22(s0)
40002194:	00078513          	mv	a0,a5
40002198:	b50ff0ef          	jal	ra,400014e8 <xtime>
4000219c:	00050793          	mv	a5,a0
400021a0:	00078513          	mv	a0,a5
400021a4:	b44ff0ef          	jal	ra,400014e8 <xtime>
400021a8:	00050793          	mv	a5,a0
400021ac:	00078713          	mv	a4,a5
400021b0:	fea44783          	lbu	a5,-22(s0)
400021b4:	00f747b3          	xor	a5,a4,a5
400021b8:	0ff7f913          	zext.b	s2,a5
400021bc:	fea44783          	lbu	a5,-22(s0)
400021c0:	00078513          	mv	a0,a5
400021c4:	b24ff0ef          	jal	ra,400014e8 <xtime>
400021c8:	00050793          	mv	a5,a0
400021cc:	00078513          	mv	a0,a5
400021d0:	b18ff0ef          	jal	ra,400014e8 <xtime>
400021d4:	00050793          	mv	a5,a0
400021d8:	00078513          	mv	a0,a5
400021dc:	b0cff0ef          	jal	ra,400014e8 <xtime>
400021e0:	00050793          	mv	a5,a0
400021e4:	00f947b3          	xor	a5,s2,a5
400021e8:	0ff7f793          	zext.b	a5,a5
400021ec:	00f4c7b3          	xor	a5,s1,a5
400021f0:	0ff7f493          	zext.b	s1,a5
400021f4:	fe944783          	lbu	a5,-23(s0)
400021f8:	00078513          	mv	a0,a5
400021fc:	aecff0ef          	jal	ra,400014e8 <xtime>
40002200:	00050793          	mv	a5,a0
40002204:	00078513          	mv	a0,a5
40002208:	ae0ff0ef          	jal	ra,400014e8 <xtime>
4000220c:	00050793          	mv	a5,a0
40002210:	00078513          	mv	a0,a5
40002214:	ad4ff0ef          	jal	ra,400014e8 <xtime>
40002218:	00050793          	mv	a5,a0
4000221c:	00078713          	mv	a4,a5
40002220:	fe944783          	lbu	a5,-23(s0)
40002224:	00f747b3          	xor	a5,a4,a5
40002228:	0ff7f793          	zext.b	a5,a5
4000222c:	00f4c7b3          	xor	a5,s1,a5
40002230:	0ff7f493          	zext.b	s1,a5
40002234:	fe844783          	lbu	a5,-24(s0)
40002238:	00078513          	mv	a0,a5
4000223c:	aacff0ef          	jal	ra,400014e8 <xtime>
40002240:	00050793          	mv	a5,a0
40002244:	00078913          	mv	s2,a5
40002248:	fe844783          	lbu	a5,-24(s0)
4000224c:	00078513          	mv	a0,a5
40002250:	a98ff0ef          	jal	ra,400014e8 <xtime>
40002254:	00050793          	mv	a5,a0
40002258:	00078513          	mv	a0,a5
4000225c:	a8cff0ef          	jal	ra,400014e8 <xtime>
40002260:	00050793          	mv	a5,a0
40002264:	00f947b3          	xor	a5,s2,a5
40002268:	0ff7f913          	zext.b	s2,a5
4000226c:	fe844783          	lbu	a5,-24(s0)
40002270:	00078513          	mv	a0,a5
40002274:	a74ff0ef          	jal	ra,400014e8 <xtime>
40002278:	00050793          	mv	a5,a0
4000227c:	00078513          	mv	a0,a5
40002280:	a68ff0ef          	jal	ra,400014e8 <xtime>
40002284:	00050793          	mv	a5,a0
40002288:	00078513          	mv	a0,a5
4000228c:	a5cff0ef          	jal	ra,400014e8 <xtime>
40002290:	00050793          	mv	a5,a0
40002294:	00f947b3          	xor	a5,s2,a5
40002298:	0ff7f793          	zext.b	a5,a5
4000229c:	00f4c7b3          	xor	a5,s1,a5
400022a0:	0ff7f713          	zext.b	a4,a5
400022a4:	fdc42683          	lw	a3,-36(s0)
400022a8:	fec42783          	lw	a5,-20(s0)
400022ac:	00279793          	slli	a5,a5,0x2
400022b0:	00f687b3          	add	a5,a3,a5
400022b4:	00e781a3          	sb	a4,3(a5)
  for (i = 0; i < 4; ++i)
400022b8:	fec42783          	lw	a5,-20(s0)
400022bc:	00178793          	addi	a5,a5,1
400022c0:	fef42623          	sw	a5,-20(s0)
400022c4:	fec42703          	lw	a4,-20(s0)
400022c8:	00300793          	li	a5,3
400022cc:	d8e7d663          	bge	a5,a4,40001858 <InvMixColumns+0x24>
  }
}
400022d0:	00000013          	nop
400022d4:	00000013          	nop
400022d8:	02c12083          	lw	ra,44(sp)
400022dc:	02812403          	lw	s0,40(sp)
400022e0:	02412483          	lw	s1,36(sp)
400022e4:	02012903          	lw	s2,32(sp)
400022e8:	03010113          	addi	sp,sp,48
400022ec:	00008067          	ret

400022f0 <InvSubBytes>:


// The SubBytes Function Substitutes the values in the
// state matrix with values in an S-box.
static void InvSubBytes(state_t* state)
{
400022f0:	fd010113          	addi	sp,sp,-48
400022f4:	02812623          	sw	s0,44(sp)
400022f8:	03010413          	addi	s0,sp,48
400022fc:	fca42e23          	sw	a0,-36(s0)
  uint8_t i, j;
  for (i = 0; i < 4; ++i)
40002300:	fe0407a3          	sb	zero,-17(s0)
40002304:	07c0006f          	j	40002380 <InvSubBytes+0x90>
  {
    for (j = 0; j < 4; ++j)
40002308:	fe040723          	sb	zero,-18(s0)
4000230c:	05c0006f          	j	40002368 <InvSubBytes+0x78>
    {
      (*state)[j][i] = getSBoxInvert((*state)[j][i]);
40002310:	fee44703          	lbu	a4,-18(s0)
40002314:	fef44783          	lbu	a5,-17(s0)
40002318:	fdc42683          	lw	a3,-36(s0)
4000231c:	00271713          	slli	a4,a4,0x2
40002320:	00e68733          	add	a4,a3,a4
40002324:	00f707b3          	add	a5,a4,a5
40002328:	0007c783          	lbu	a5,0(a5)
4000232c:	00078613          	mv	a2,a5
40002330:	fee44683          	lbu	a3,-18(s0)
40002334:	fef44783          	lbu	a5,-17(s0)
40002338:	40003737          	lui	a4,0x40003
4000233c:	90c70713          	addi	a4,a4,-1780 # 4000290c <rsbox>
40002340:	00c70733          	add	a4,a4,a2
40002344:	00074703          	lbu	a4,0(a4)
40002348:	fdc42603          	lw	a2,-36(s0)
4000234c:	00269693          	slli	a3,a3,0x2
40002350:	00d606b3          	add	a3,a2,a3
40002354:	00f687b3          	add	a5,a3,a5
40002358:	00e78023          	sb	a4,0(a5)
    for (j = 0; j < 4; ++j)
4000235c:	fee44783          	lbu	a5,-18(s0)
40002360:	00178793          	addi	a5,a5,1
40002364:	fef40723          	sb	a5,-18(s0)
40002368:	fee44703          	lbu	a4,-18(s0)
4000236c:	00300793          	li	a5,3
40002370:	fae7f0e3          	bgeu	a5,a4,40002310 <InvSubBytes+0x20>
  for (i = 0; i < 4; ++i)
40002374:	fef44783          	lbu	a5,-17(s0)
40002378:	00178793          	addi	a5,a5,1
4000237c:	fef407a3          	sb	a5,-17(s0)
40002380:	fef44703          	lbu	a4,-17(s0)
40002384:	00300793          	li	a5,3
40002388:	f8e7f0e3          	bgeu	a5,a4,40002308 <InvSubBytes+0x18>
    }
  }
}
4000238c:	00000013          	nop
40002390:	00000013          	nop
40002394:	02c12403          	lw	s0,44(sp)
40002398:	03010113          	addi	sp,sp,48
4000239c:	00008067          	ret

400023a0 <InvShiftRows>:

static void InvShiftRows(state_t* state)
{
400023a0:	fd010113          	addi	sp,sp,-48
400023a4:	02812623          	sw	s0,44(sp)
400023a8:	03010413          	addi	s0,sp,48
400023ac:	fca42e23          	sw	a0,-36(s0)
  uint8_t temp;

  // Rotate first row 1 columns to right  
  temp = (*state)[3][1];
400023b0:	fdc42783          	lw	a5,-36(s0)
400023b4:	00d7c783          	lbu	a5,13(a5)
400023b8:	fef407a3          	sb	a5,-17(s0)
  (*state)[3][1] = (*state)[2][1];
400023bc:	fdc42783          	lw	a5,-36(s0)
400023c0:	0097c703          	lbu	a4,9(a5)
400023c4:	fdc42783          	lw	a5,-36(s0)
400023c8:	00e786a3          	sb	a4,13(a5)
  (*state)[2][1] = (*state)[1][1];
400023cc:	fdc42783          	lw	a5,-36(s0)
400023d0:	0057c703          	lbu	a4,5(a5)
400023d4:	fdc42783          	lw	a5,-36(s0)
400023d8:	00e784a3          	sb	a4,9(a5)
  (*state)[1][1] = (*state)[0][1];
400023dc:	fdc42783          	lw	a5,-36(s0)
400023e0:	0017c703          	lbu	a4,1(a5)
400023e4:	fdc42783          	lw	a5,-36(s0)
400023e8:	00e782a3          	sb	a4,5(a5)
  (*state)[0][1] = temp;
400023ec:	fdc42783          	lw	a5,-36(s0)
400023f0:	fef44703          	lbu	a4,-17(s0)
400023f4:	00e780a3          	sb	a4,1(a5)

  // Rotate second row 2 columns to right 
  temp = (*state)[0][2];
400023f8:	fdc42783          	lw	a5,-36(s0)
400023fc:	0027c783          	lbu	a5,2(a5)
40002400:	fef407a3          	sb	a5,-17(s0)
  (*state)[0][2] = (*state)[2][2];
40002404:	fdc42783          	lw	a5,-36(s0)
40002408:	00a7c703          	lbu	a4,10(a5)
4000240c:	fdc42783          	lw	a5,-36(s0)
40002410:	00e78123          	sb	a4,2(a5)
  (*state)[2][2] = temp;
40002414:	fdc42783          	lw	a5,-36(s0)
40002418:	fef44703          	lbu	a4,-17(s0)
4000241c:	00e78523          	sb	a4,10(a5)

  temp = (*state)[1][2];
40002420:	fdc42783          	lw	a5,-36(s0)
40002424:	0067c783          	lbu	a5,6(a5)
40002428:	fef407a3          	sb	a5,-17(s0)
  (*state)[1][2] = (*state)[3][2];
4000242c:	fdc42783          	lw	a5,-36(s0)
40002430:	00e7c703          	lbu	a4,14(a5)
40002434:	fdc42783          	lw	a5,-36(s0)
40002438:	00e78323          	sb	a4,6(a5)
  (*state)[3][2] = temp;
4000243c:	fdc42783          	lw	a5,-36(s0)
40002440:	fef44703          	lbu	a4,-17(s0)
40002444:	00e78723          	sb	a4,14(a5)

  // Rotate third row 3 columns to right
  temp = (*state)[0][3];
40002448:	fdc42783          	lw	a5,-36(s0)
4000244c:	0037c783          	lbu	a5,3(a5)
40002450:	fef407a3          	sb	a5,-17(s0)
  (*state)[0][3] = (*state)[1][3];
40002454:	fdc42783          	lw	a5,-36(s0)
40002458:	0077c703          	lbu	a4,7(a5)
4000245c:	fdc42783          	lw	a5,-36(s0)
40002460:	00e781a3          	sb	a4,3(a5)
  (*state)[1][3] = (*state)[2][3];
40002464:	fdc42783          	lw	a5,-36(s0)
40002468:	00b7c703          	lbu	a4,11(a5)
4000246c:	fdc42783          	lw	a5,-36(s0)
40002470:	00e783a3          	sb	a4,7(a5)
  (*state)[2][3] = (*state)[3][3];
40002474:	fdc42783          	lw	a5,-36(s0)
40002478:	00f7c703          	lbu	a4,15(a5)
4000247c:	fdc42783          	lw	a5,-36(s0)
40002480:	00e785a3          	sb	a4,11(a5)
  (*state)[3][3] = temp;
40002484:	fdc42783          	lw	a5,-36(s0)
40002488:	fef44703          	lbu	a4,-17(s0)
4000248c:	00e787a3          	sb	a4,15(a5)
}
40002490:	00000013          	nop
40002494:	02c12403          	lw	s0,44(sp)
40002498:	03010113          	addi	sp,sp,48
4000249c:	00008067          	ret

400024a0 <Cipher>:
#endif // #if (defined(CBC) && CBC == 1) || (defined(ECB) && ECB == 1)

static void Cipher(state_t* state, const uint8_t* RoundKey)
{ // uncomment print.. and uart_state().. if needed
400024a0:	fd010113          	addi	sp,sp,-48
400024a4:	02112623          	sw	ra,44(sp)
400024a8:	02812423          	sw	s0,40(sp)
400024ac:	03010413          	addi	s0,sp,48
400024b0:	fca42e23          	sw	a0,-36(s0)
400024b4:	fcb42c23          	sw	a1,-40(s0)
  uint8_t round = 0;
400024b8:	fe0407a3          	sb	zero,-17(s0)
  // Add the First round key to the state before starting the rounds.
//  print("\r\nStart state!\r\n");
//  uart_state(UART, state);
  AddRoundKey(0, state, RoundKey); 
400024bc:	fd842603          	lw	a2,-40(s0)
400024c0:	fdc42583          	lw	a1,-36(s0)
400024c4:	00000513          	li	a0,0
400024c8:	d95fe0ef          	jal	ra,4000125c <AddRoundKey>
//  uart_state(UART, state);

  // There will be Nr rounds.
  // The first Nr-1 rounds are identical.
  // These Nr-1 rounds are executed in the loop below.
  for (round = 1; round < Nr; ++round)
400024cc:	00100793          	li	a5,1
400024d0:	fef407a3          	sb	a5,-17(s0)
400024d4:	03c0006f          	j	40002510 <Cipher+0x70>
  {
	SubBytes(state);
400024d8:	fdc42503          	lw	a0,-36(s0)
400024dc:	e5dfe0ef          	jal	ra,40001338 <SubBytes>
//	print("\r\nAfter subbyte!\r\n");
//	uart_state(UART, state);
    ShiftRows(state);
400024e0:	fdc42503          	lw	a0,-36(s0)
400024e4:	f05fe0ef          	jal	ra,400013e8 <ShiftRows>
//    print("\r\nAfter shiftrow!\r\n");
//    uart_state(UART, state);
    MixColumns(state);
400024e8:	fdc42503          	lw	a0,-36(s0)
400024ec:	86cff0ef          	jal	ra,40001558 <MixColumns>
//    print("\r\nAfter mix column!\r\n");
//    uart_state(UART, state);
    AddRoundKey(round, state, RoundKey);
400024f0:	fef44783          	lbu	a5,-17(s0)
400024f4:	fd842603          	lw	a2,-40(s0)
400024f8:	fdc42583          	lw	a1,-36(s0)
400024fc:	00078513          	mv	a0,a5
40002500:	d5dfe0ef          	jal	ra,4000125c <AddRoundKey>
  for (round = 1; round < Nr; ++round)
40002504:	fef44783          	lbu	a5,-17(s0)
40002508:	00178793          	addi	a5,a5,1
4000250c:	fef407a3          	sb	a5,-17(s0)
40002510:	fef44703          	lbu	a4,-17(s0)
40002514:	00900793          	li	a5,9
40002518:	fce7f0e3          	bgeu	a5,a4,400024d8 <Cipher+0x38>
//    uart_state(UART, state);
  }
  
  // The last round is given below.
  // The MixColumns function is not here in the last round.
  SubBytes(state);
4000251c:	fdc42503          	lw	a0,-36(s0)
40002520:	e19fe0ef          	jal	ra,40001338 <SubBytes>
//  print("\r\nAfter subbyte!\r\n");
//  	uart_state(UART, state);
  ShiftRows(state);
40002524:	fdc42503          	lw	a0,-36(s0)
40002528:	ec1fe0ef          	jal	ra,400013e8 <ShiftRows>
//  print("\r\nAfter shiftrow!\r\n");
//  	uart_state(UART, state);
  AddRoundKey(Nr, state, RoundKey);
4000252c:	fd842603          	lw	a2,-40(s0)
40002530:	fdc42583          	lw	a1,-36(s0)
40002534:	00a00513          	li	a0,10
40002538:	d25fe0ef          	jal	ra,4000125c <AddRoundKey>
//  print("\r\nAfter last add round key!\r\n");
//  	uart_state(UART, state);
}
4000253c:	00000013          	nop
40002540:	02c12083          	lw	ra,44(sp)
40002544:	02812403          	lw	s0,40(sp)
40002548:	03010113          	addi	sp,sp,48
4000254c:	00008067          	ret

40002550 <InvCipher>:


#if (defined(CBC) && CBC == 1) || (defined(ECB) && ECB == 1)
static void InvCipher(state_t* state, const uint8_t* RoundKey)
{
40002550:	fd010113          	addi	sp,sp,-48
40002554:	02112623          	sw	ra,44(sp)
40002558:	02812423          	sw	s0,40(sp)
4000255c:	03010413          	addi	s0,sp,48
40002560:	fca42e23          	sw	a0,-36(s0)
40002564:	fcb42c23          	sw	a1,-40(s0)
  uint8_t round = 0;
40002568:	fe0407a3          	sb	zero,-17(s0)
//  UART0_REG(AES_REG_TRIGGER) = 1;
  // Add the First round key to the state before starting the rounds.
  AddRoundKey(Nr, state, RoundKey); 
4000256c:	fd842603          	lw	a2,-40(s0)
40002570:	fdc42583          	lw	a1,-36(s0)
40002574:	00a00513          	li	a0,10
40002578:	ce5fe0ef          	jal	ra,4000125c <AddRoundKey>

  // There will be Nr rounds.
  // The first Nr-1 rounds are identical.
  // These Nr-1 rounds are executed in the loop below.
  for (round = (Nr - 1); round > 0; --round)
4000257c:	00900793          	li	a5,9
40002580:	fef407a3          	sb	a5,-17(s0)
40002584:	03c0006f          	j	400025c0 <InvCipher+0x70>
  {
    InvShiftRows(state);
40002588:	fdc42503          	lw	a0,-36(s0)
4000258c:	e15ff0ef          	jal	ra,400023a0 <InvShiftRows>
    InvSubBytes(state);
40002590:	fdc42503          	lw	a0,-36(s0)
40002594:	d5dff0ef          	jal	ra,400022f0 <InvSubBytes>
    AddRoundKey(round, state, RoundKey);
40002598:	fef44783          	lbu	a5,-17(s0)
4000259c:	fd842603          	lw	a2,-40(s0)
400025a0:	fdc42583          	lw	a1,-36(s0)
400025a4:	00078513          	mv	a0,a5
400025a8:	cb5fe0ef          	jal	ra,4000125c <AddRoundKey>
    InvMixColumns(state);
400025ac:	fdc42503          	lw	a0,-36(s0)
400025b0:	a84ff0ef          	jal	ra,40001834 <InvMixColumns>
  for (round = (Nr - 1); round > 0; --round)
400025b4:	fef44783          	lbu	a5,-17(s0)
400025b8:	fff78793          	addi	a5,a5,-1
400025bc:	fef407a3          	sb	a5,-17(s0)
400025c0:	fef44783          	lbu	a5,-17(s0)
400025c4:	fc0792e3          	bnez	a5,40002588 <InvCipher+0x38>
  }
  
  // The last round is given below.
  // The MixColumns function is not here in the last round.
  InvShiftRows(state);
400025c8:	fdc42503          	lw	a0,-36(s0)
400025cc:	dd5ff0ef          	jal	ra,400023a0 <InvShiftRows>
  InvSubBytes(state);
400025d0:	fdc42503          	lw	a0,-36(s0)
400025d4:	d1dff0ef          	jal	ra,400022f0 <InvSubBytes>
  AddRoundKey(0, state, RoundKey);
400025d8:	fd842603          	lw	a2,-40(s0)
400025dc:	fdc42583          	lw	a1,-36(s0)
400025e0:	00000513          	li	a0,0
400025e4:	c79fe0ef          	jal	ra,4000125c <AddRoundKey>
//  UART0_REG(AES_REG_TRIGGER) = 0;
}
400025e8:	00000013          	nop
400025ec:	02c12083          	lw	ra,44(sp)
400025f0:	02812403          	lw	s0,40(sp)
400025f4:	03010113          	addi	sp,sp,48
400025f8:	00008067          	ret

400025fc <AES_ECB_encrypt>:
#endif // #if (defined(CBC) && CBC == 1) || (defined(ECB) && ECB == 1)
#if defined(ECB) && (ECB == 1)


void AES_ECB_encrypt(const struct AES_ctx* ctx, uint8_t* buf)
{
400025fc:	fe010113          	addi	sp,sp,-32
40002600:	00112e23          	sw	ra,28(sp)
40002604:	00812c23          	sw	s0,24(sp)
40002608:	02010413          	addi	s0,sp,32
4000260c:	fea42623          	sw	a0,-20(s0)
40002610:	feb42423          	sw	a1,-24(s0)
  // The next function call encrypts the PlainText with the Key using AES algorithm.
  Cipher((state_t*)buf, ctx->RoundKey);
40002614:	fec42783          	lw	a5,-20(s0)
40002618:	00078593          	mv	a1,a5
4000261c:	fe842503          	lw	a0,-24(s0)
40002620:	e81ff0ef          	jal	ra,400024a0 <Cipher>
}
40002624:	00000013          	nop
40002628:	01c12083          	lw	ra,28(sp)
4000262c:	01812403          	lw	s0,24(sp)
40002630:	02010113          	addi	sp,sp,32
40002634:	00008067          	ret

40002638 <AES_ECB_decrypt>:

void AES_ECB_decrypt(const struct AES_ctx* ctx, uint8_t* buf)
{
40002638:	fe010113          	addi	sp,sp,-32
4000263c:	00112e23          	sw	ra,28(sp)
40002640:	00812c23          	sw	s0,24(sp)
40002644:	02010413          	addi	s0,sp,32
40002648:	fea42623          	sw	a0,-20(s0)
4000264c:	feb42423          	sw	a1,-24(s0)
  // The next function call decrypts the PlainText with the Key using AES algorithm.
  InvCipher((state_t*)buf, ctx->RoundKey);
40002650:	fec42783          	lw	a5,-20(s0)
40002654:	00078593          	mv	a1,a5
40002658:	fe842503          	lw	a0,-24(s0)
4000265c:	ef5ff0ef          	jal	ra,40002550 <InvCipher>
}
40002660:	00000013          	nop
40002664:	01c12083          	lw	ra,28(sp)
40002668:	01812403          	lw	s0,24(sp)
4000266c:	02010113          	addi	sp,sp,32
40002670:	00008067          	ret
