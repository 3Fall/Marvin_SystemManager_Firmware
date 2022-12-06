#include <avr/io.h>
#include "spiSlave.hpp"

.global __vector_16 //export the symbol

__vector_16:
	push r1 //save system state
	in r1, SREG
	push r1
	push r16 //SPI0.DATA
	push r17 //work reg

	push r30 //spi_state.dme_ptr
	push r31 // high ^

	lds r16, SPI0_DATA
	lds r30, SPI_STATE_DMA_PTR
	lds r31, SPI_STATE_DMA_PTR + 1

	lds r17, SPI_STATE_ACTIVE //if (!spi_state.active) goto is_inactive
	and r17, r17
	breq activate

	lds r17, SPI0_INTFLAGS 
	andi r17, SPI_TXCIE_bm
	brne last_packet //if (SPI0.INTFLAGS & SPI_TXCIE_bm == 0): goto last_packet

//if(spi_state.active && !(SPI0.INTFLAGS & SPI_TXCIE_bm))):
	ld r17, Z //data = *spi_state.dma_pointer
	sts SPI0_DATA, r17

	lds r17, SPI_STATE_DIRECTION//if (spi_state.direction) *spi_state.dma_pointer = data;
	sbrc r17, 0
	st Z, r16 

	inc r30 //magick to minimise number of operands, while preventing overflows, little endian
	sts SPI_STATE_DMA_PTR, r30

	rjmp end

//if(!spi_state.active && !(SPI0.INTFLAGS & SPI_TXCIE_bm)))
activate:
	bst r16, 7 //spi_State.directrion = (SPI0.DATA >> 7)
	eor r17, r17 //r17 = 0
	bld r17, 0
	sts SPI_STATE_DIRECTION, r17

	//spi_state.dma_pointer = (uint8_t*)((int)spi_state.dma_base_address | data);
	//SPI0.DATA = *spi_state.dma_base_address;
	eor r30, r30
	sts SPI_STATE_DMA_PTR, r16
	ld r16, Z
	sts SPI0_DATA, r16

	rjmp end	

//if(spi_state.active && (SPI0.INTFLAGS & SPI_TXCIE_bm)))
last_packet: 
	//SPI0.INTFLAGS |= SPI_TXCIF_bm;
	ldi r17, SPI_TXCIF_bm
	sts SPI0_INTFLAGS, r17

	eor r1,r1; r1 = 1
	inc r1

	eor r17, r17
	sts SPI_STATE_ACTIVE, r17 ;spi_state.active = 0
	sts SPI_STATE_SHOULD_SWAP, r1 ;spi_state.active = 1
	
	lds r17, SPI_STATE_DIRECTION ;if(spi_state.direction)	spi_state.written = true;
	sbrc r17, 0
	sts SPI_STATE_WRITTEN, r1 ;spi_state.written = 1

	eor r30, r30 ;SPI0.DATA = *spi_state.dma_base_address
	ld r16, Z
	sts SPI0_DATA, r16

//pop all registers off the stack
end:
	pop r31
	pop r30
	pop r17
	pop r16
	pop r1
	out SREG, r1
	pop r1

	reti