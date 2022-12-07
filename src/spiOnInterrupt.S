#include <avr/io.h>
#include "spiSlave.hpp"

;export the symbols
.global SPI0_INT_vect 
.global SS_PORT_INTERRUPT_VECT

;-------------------------------------------------------------------------------------------------------------------------------
;PI*door gives around 35 cycles of the hot path. at 20MHz we might try to at 3~4MHz, depending on stm's delay etc
SPI0_INT_vect:
	push r16
	in r16, SREG
	push r16 ;use r16 for SPI0.DATA
	push r17 ;use r17 for spi_state.transmission_state
	push r30 ;use Z for spi_state.dma_pointer
	push r31

	lds r30, SPI_STATE_DMA_PTR
	lds r31, SPI_STATE_DMA_PTR + 1
	lds r17, SPI_STATE_TRANSMISSION_STATE

	bst r17, 2; transfer active bit into T
	brbc 6, activate; branch if not actively transfering

	ld r16, Z ;SPI0.DATA = *spi_state.dma_pointer
	sts SPI0_DATA, r16

	lds r16, SPI0_DATA
	sbrc r17, 1; if(WRITE) *spi_state.dma_pointer = data
	st Z, r6

	;uint8_t pos = (int)(void*)spi_state.dma_pointer;
	;*(uint8_t*)(void*)&spi_state.dma_pointer = ++pos;
	inc r30
	sts SPI_STATE_DMA_PTR, r30

	rjmp end_spi_int_vect
activate:
	;I skipped using intermidiate register for initial data, directly putting it into lower byte of the pointer and then going off there
	lds r30, SPI0_DATA;*(uint8_t*)(void*)spi_state.dma_pointer = data;
	ld r16, Z
	sts SPI0_DATA, r16;SPI0.DATA = *spi_state.dma_pointer

	ldi r17, 4; set actively transfering

	bst r30, 7; transfering R/W bit
	bld r17, 1

	sts SPI_STATE_TRANSMISSION_STATE, r17; store into memory

end_spi_int_vect:
	pop r31
	pop r30
	pop r17
	pop r16
	out SREG, r16
	pop r16

	reti

;-------------------------------------------------------------------------------------------------------------------------------

SS_PORT_INTERRUPT_VECT: ;hot path CANNOT alter SREG. this shaves off 2 cycles
	;push r17
	;in r17, SREG
	push r17

	sbis SS_VPORT_IN, SS_VPORT_NUM; SS low
	rjmp L1

	push r30
	push r31

	lds r30, SPI_STATE_DMA_PTR
	lds r31, SPI_STATE_DMA_PTR + 1

	ld r17, Z
	sts SPI0_DATA, r17
	;takes 12 cycles, not counting interrup, which takes 5. In total we need at least 17 cycles between SS going low and first SCK transission

	ldi r17, 1
	sts SPI_STATE_TRANSMISSION_STATE, r17

	pop r31
	pop r30

	rjmp L2

L1:
	in r17, SREG ;only here do we alter SREG
	push r17
	;transmission done. transmission_state = IDLE
	clr r17
	sts SPI_STATE_TRANSMISSION_STATE, r17

	pop r17
	out SREG, r17

L2:	
	pop r17
	;out SREG, r17
	;pop r17

	reti