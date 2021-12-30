#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>
// #include <gpio.h>
#include "../libs/aes.h"
#include <uart.h>

#include "riscv.h"
#include "reg.h"
#include "top_defines.h"
#include "lib.h"

static void phex(uint8_t* str);
// static int test_encrypt_ecb(void);
// static void test_encrypt_ecb_verbose(void);
// static void test_encrypt_ecb_scan(void);
// static void test_encrypt_ecb_freerunning(void);
static void flashes(void);
static void uart_put_hex8(Uart_Reg *reg, uint8_t hex);
extern int memcmp1(const void* s1, const void* s2, size_t n);
extern void print(char *str);

void print(char *str){
	while(*str){
		uart_write(UART,*(str++));
	}
}

int main() {
    
	uint32_t CORE_HZ;
	uint16_t gpio_in;

	// gpio_in = (GPIO_A_BASE->INPUT)&0xff;
    gpio_in = 19;
	CORE_HZ = (gpio_in + 1) * 1000000;

	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
	uartConfig.parity = NONE;
	uartConfig.stop = ONE;
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
	uart_applyConfig(UART,&uartConfig);


	TIMER_A->LIMIT = ~0;
	TIMER_A->CLEARS_TICKS = 0x00010001;

    GPIO_A_BASE->OUTPUT_ENABLE = 0xFFFF;
    GPIO_A_BASE->OUTPUT = 0x0001;


    while(1){
	for (uint32_t j = 0; j < 200000; j++) {
        if (j == 150000)
        {
            GPIO_A_BASE->OUTPUT = 0x0000;
        } else if (j == 0){
            GPIO_A_BASE->OUTPUT = 0x000F;
        }            
    }}
}


int exception_addr;
int exception_instr;
int exception_cause;
void irqCallback(){
    static int trap_induced_ebreak = 0;

    int mepc    = csr_read(mepc);       // Address of trap
    int mtval   = csr_read(mtval);      // Instruction value of trap
    int mcause  = csr_read(mcause);     // Reason for the trap

    // Grab trap exception status registers and store them in some global
    // variables for each access by debugger. 
    if (!trap_induced_ebreak){
        exception_addr  = mepc;
        exception_instr = mtval;
        exception_cause = mcause;
    }

    // Insert an EBREAK instruction so that the CPU will halt, and a connected debugger
    // will report the halt to the user.
    // However, only do this once, because when a debugger isn't connect, you get
    // an endless cascade of EBREAKs which will ultimately crash the stack.
    if (!trap_induced_ebreak){
        trap_induced_ebreak = 1;
        asm volatile (
            "ebreak\n"
        );
    }

    // Add endless loop so that we stay in the trap function after the first EBREAK, or when 
    // the VexRiscv has been configured without EBREAK instruction support.
    while(1)
        ;
}

#include <time.h>
clock_t	clock(){
	return TIMER_A->VALUE;
}
//
static void phex(uint8_t* str)
{

#if defined(AES256)
    uint8_t len = 32;
#elif defined(AES192)
    uint8_t len = 24;
#elif defined(AES128)
    uint8_t len = 16;
#endif

    unsigned char i;
    for (i = 0; i < len; ++i) {
    	uart_put_hex8(UART, str[i]);
    }
//        printf("%.2x", str[i]);
    // print("\n");
}

static void flashes(void)
{
    
    for (uint32_t j = 0; j < 200000; j++) {
        if (j < 100000)
        {
            GPIO_A_BASE->OUTPUT = 0x0000;
        } else {
            GPIO_A_BASE->OUTPUT = 0xFFFF;
        }            
    }

}
