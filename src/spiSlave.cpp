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
		"lds r16, %[spi0data] \n\t"
		"eor %[state_active], %[state_active]\n\t" //if spi_state.active
		"sbrc r16, 0\n\t" 
		"rjmp [inactive]\n\t"
		"st %a[dma_ptr], r16\n\t"
		"inactive:\n\t"
		"ret\n\t"
		"transfer_complete:\n\t"
		"ret"
		: 
		: [spi0data] "i" (SPI0.DATA), [dma_ptr] "e" (spi_state.dma_pointer), [spi0intflags] "i" (&SPI0.INTFLAGS),
			[state_active] "r" (spi_state.active)
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