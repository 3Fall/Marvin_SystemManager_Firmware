#include <Arduino.h>
#include <spiSlave.hpp>
#include "pins.h"
#include <avr/io.h>


SPI_STATE_t spi_state;

void spi_slave_init() {
	asm volatile("in __tmp_reg__, __SREG__" "\n\t"
				"cli" "\n\t"
				"push __tmp_reg__": : );
	pinMode(SPI_SS_PIN, INPUT);
	pinMode(SPI_MISO_PIN, OUTPUT);

	SPI0.CTRLA = SPI_ENABLE_bm;
	SPI0.CTRLB = /*SPI_BUFEN_bm | SPI_BUFWR_bm | */ SPI_MODE_3_gc;
	SPI0.INTCTRL = /*SPI_RXCIE_bm | SPI_DREIE_bm | SPI_TXCIE_bm |*/ SPI_IE_bm;

	spi_state.transmission_state = SPI_TRANSACTION_STATUS::IDLE;

	asm volatile("pop __tmp_reg__" "\n\t"
				"out __SREG__, __tmp_reg__": : );
}

bool spi_is_transmitting() { return ~SPI_SS_VPORT.IN & (1 << SPI_SS_PPIN); }

void _spi_swap_buffers_unchecked() {
	byte x = *(uint8_t*)((int)&spi_state.access_base_address + 1); //take high byte
	byte y = *(uint8_t*)((int)&spi_state.dma_base_address + 1);

	*(uint8_t*)((int)&spi_state.access_base_address + 1) = y;
	*(uint8_t*)((int)&spi_state.dma_base_address + 1) = x;
}

void spi_swap_buffers() {
	//wait for SS pin to go high
	while(!(SPI_SS_VPORT.IN & (1<< SPI_SS_PPIN)));
	_spi_swap_buffers_unchecked();	
}
//reference impl in C
/*
void spi_on_ss_transission() {
	if(VPORTA.IN & (1 << 4)) {
		spi_state.transmission_state = SPI_TRANSACTION_STATUS::IDLE;
	} else {
		SPI0.DATA = *spi_state.dma_base_address; //put first byte into shift
		spi_state.transmission_state = SPI_TRANSACTION_STATUS::INIT;
	}
}


void spi_on_interrupt() {
	uint8_t data = SPI0.DATA;
	if(spi_state.transmission_state == SPI_TRANSACTION_STATUS::INIT) {
		*(uint8_t*)(void*)spi_state.dma_pointer = data;
		SPI0.DATA = *spi_state.dma_pointer;
		spi_state.transmission_state = (data >> 7) ? SPI_TRANSACTION_STATUS::WRITE: SPI_TRANSACTION_STATUS::READ;
	} else {
		SPI0.DATA = *spi_state.dma_pointer;
		if(spi_state.transmission_state == SPI_TRANSACTION_STATUS::WRITE) 
			*spi_state.dma_pointer = data;
		
		uint8_t pos = (int)(void*)spi_state.dma_pointer;
		*(uint8_t*)(void*)&spi_state.dma_pointer = ++pos;
	}	
}
*/