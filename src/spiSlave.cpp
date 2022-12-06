#include <spiSlave.hpp>
#include "pins.h"


SPI_STATE_t spi_state;

void spi_slave_init() {
	asm volatile("in __tmp_reg__, __SREG__" "\n\t"
				"cli" "\n\t"
				"push __tmp_reg__": : );
	pinMode(SPI_SS_PIN, INPUT);
	SPI0.CTRLA = /*SPI_MASTER_bm*/ 0;
	SPI0.CTRLB = SPI_BUFEN_bm /*| SPI_BUFWR_bm*/ | SPI_MODE_3_gc;
	SPI0.INTCTRL = SPI_RXCIE_bm /*| SPI_DREIE_bm*/ | SPI_TXCIE_bm | SPI_IE_bm;
	SPI0.CTRLA = SPI_ENABLE_bm;
	SPI0.DATA = 0;
	asm volatile("pop __tmp_reg__" "\n\t"
				"out __SREG__, __tmp_reg__": : );
}

inline void disableDREI() { SPI0.INTCTRL = (SPI0.INTCTRL & ~(SPI_DREIE_bm)); } 
inline void enableDREI() { SPI0.INTCTRL = (SPI0.INTCTRL | (SPI_DREIE_bm)); } 

bool spi_is_transmitting() { return ~SPI_SS_VPORT.IN & (1 << SPI_SS_PPIN); }

void _spi_swap_buffers_unchecked() {
	byte x = *(uint8_t*)((int)&spi_state.access_base_address + 1); //take high byte
	byte y = *(uint8_t*)((int)&spi_state.dma_base_address + 1);

	*(uint8_t*)((int)&spi_state.access_base_address + 1) = y;
	*(uint8_t*)((int)&spi_state.dma_base_address + 1) = x;
}


void spi_on_interrupt() {
	asm volatile (
		"and %[state_active], %[state_active]\n\t" 
		"breq inactive\n\t" //if !spi_state.active: goto inactive

		"andi %[spi0intflags], %[spiTXCIEbm]\n\t"
		"brne transfer_complete\n\t" //if SPI0.INTFLAGS & SPI_TXCIE_bm == 0: goto transfer_complete

		"sbrc %[state_dir], 0\n\t" //if (spi_state.direction) *spi_state.dma_pointer = data;
		"st %a[dma_ptr], %[spi0data]\n\t"

		"ld %[spi0data], %a[dma_ptr]\n\t" //SPI0.DATA = *spi_state.dma_pointer;

		"inc %A[dma_ptr]\n\t" //inc lower byte of spi_state.dma_pointer
		"sts %[dma_ptr_ptr], %A[dma_ptr]\n\t"

		"rjmp finish\n\t"

		"inactive:\n\t"
		"bst %[spi0data], 7\n\t" //spi_state.direction = (data >> 7);
		"bld %[state_dir], 0\n\t"
		
		"eor %A[dma_ptr], %A[dma_ptr]\n\t" //spi_state.dma_pointer = spi_state.dma_base_ptr => low(spi_state.dma_pointer) = 0
		"ld __tmp_reg__, %a[dma_ptr]\n\t" 
		"mov %A[dma_ptr], %[spi0data]\n\t" //ow(spi_state.dma_pointer) = SPI0.DATA
		"mov %[spi0data],  __tmp_reg__\n\t" //SPI0.DATA = *spi_state.dma_base_ptr

		"rjmp finish\n\t"
		"transfer_complete:\n\t"
		"ori %[spi0intflags], %[spiTXCIEbm]\n\t"
		"ldi %[state_active], 0\n\t"
		

		"finish:\n\t"
		: [state_active] "=r" (spi_state.active), [state_dir] "=r" (spi_state.direction), [spi0data] "=r" (SPI0.DATA)
		: [spiTXCIEbm] "M" (SPI_TXCIE_bm), [dma_ptr_ptr] "i" (&spi_state.dma_pointer), [dma_base_high] "i" ((int)&spi_state.dma_base_address + 1),
			[dma_ptr] "e" (spi_state.dma_pointer),
			"[state_active]"  (spi_state.active), "[state_dir]" (spi_state.direction), "[spi0data]" (SPI0.DATA), [spi0intflags] "r" (&SPI0.INTFLAGS)
		: "r16", "r17"
	);

	uint8_t data = SPI0.DATA;

	if(spi_state.active && !(SPI0.INTFLAGS & SPI_TXCIE_bm)) {
		SPI0.DATA = *spi_state.dma_pointer;
		// && ((uint8_t)spi_state.dma_pointer & (1 << 7)))
		if(spi_state.direction)
			*spi_state.dma_pointer = data;

		//magick to minimise number of operands, while preventing overflows, little endian
		uint8_t pos = (int)(void*)spi_state.dma_pointer;
		*(uint8_t*)(void*)&spi_state.dma_pointer = ++pos;
	} else if(!spi_state.active) {
		//first transfer
		spi_state.direction = (data >> 7);
		spi_state.dma_pointer = (uint8_t*)((int)spi_state.dma_base_address | data);
		SPI0.DATA = *spi_state.dma_base_address;
	} else {
		//Transfer completed - reset peripheral
		SPI0.INTFLAGS |= SPI_TXCIF_bm; //clear by hand
		spi_state.active = false;
		spi_state.shouldSwap = true;
		if(spi_state.direction)	spi_state.written = true;
		SPI0.DATA = *spi_state.dma_base_address;
	}
}

void spi_swap_buffers() {
	//wait for SS pin to go high
	while(!(SPI_SS_VPORT.IN & (1<< SPI_SS_PPIN)));
	_spi_swap_buffers_unchecked();	
}