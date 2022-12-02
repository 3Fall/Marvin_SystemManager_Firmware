#include <spiSlave.hpp>
#include "pins.h"


SPI_STATE_t spi_state;

void spi_slave_init() {
	cli();
	pinMode(SPI_SS_PIN, INPUT);
	SPI0.CTRLA = /*SPI_MASTER_bm*/ 0;
	SPI0.CTRLB = SPI_BUFEN_bm /*| SPI_BUFWR_bm*/ | SPI_MODE_3_gc;
	SPI0.INTCTRL = SPI_RXCIE_bm /*| SPI_DREIE_bm*/ | SPI_TXCIE_bm | SPI_IE_bm;
	SPI0.CTRLA = SPI_ENABLE_bm;
	SPI0.DATA = 0;
	sei();
}

inline void disableDREI() { SPI0.INTCTRL = (SPI0.INTCTRL & ~(SPI_DREIE_bm)); } 
inline void enableDREI() { SPI0.INTCTRL = (SPI0.INTCTRL | (SPI_DREIE_bm)); } 


bool spi_is_transmitting() { return ~SPI_SS_VPORT.IN & (1 << SPI_SS_PPIN); }

void spi_on_interrupt() {	
	uint8_t data = SPI0.DATA;

	if(spi_state.active && !(SPI0.INTFLAGS & SPI_TXCIE_bm)) {
		SPI0.DATA = *spi_state.dma_pointer;
		
		if(spi_state.direction && ((uint8_t)spi_state.dma_pointer & (1 << 7))) 
			*spi_state.dma_pointer = data;

		//magick to minimise number of operands
		uint8_t pos = (int)(void*)spi_state.dma_pointer;
		*(uint8_t*)(void*)&spi_state.dma_pointer = ++pos;

		//SPI0.INTFLAGS = SPI_DREIF_bm;
	} else if(!spi_state.active) {
		//first transfer
		spi_state.direction = (data >> 7);
		//spi_state.pointer = data | ~(1 << 7);
		spi_state.dma_pointer = (uint8_t*)((int)spi_state.dma_base_address + data);
		SPI0.DATA = 69; //TODO: PUT status byte in
	} else {
		//Transfer completed - reset perypherial
		SPI0.INTFLAGS |= SPI_TXCIF_bm; //clear by hand
		spi_state.active = false;
		//TODO: put status byte into the data reg
		SPI0.DATA = 69;
	}
}

void spi_swap_buffers() {
	while(!(SPI_SS_VPORT.IN & (1<< SPI_SS_PPIN));
	//TODO: swap nimbles
	      }

