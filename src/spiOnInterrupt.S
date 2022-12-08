#include <avr/io.h>
#include "spiSlave.hpp"

;export the symbols
.global SPI0_INT_vect 
.global SS_PORT_INTERRUPT_VECT

;uses GPIOR3 for transmission status instead of a memory location. thus it uses one less register and doesn't one more memory fetch

;-------------------------------------------------------------------------------------------------------------------------------
;PI*eye gives around 35 cycles of the hot path. at 20MHz we might try to at 3~4MHz, depending on stm's delay etc
SPI0_INT_vect:
	push r16
	in r16, SREG
	push r16 ;use r16 for SPI0.DATA
	push r30 ;use Z for spi_state.dma_pointer
	push r31

	lds r30, SPI_STATE_DMA_PTR
	lds r31, SPI_STATE_DMA_PTR + 1

	sbis TRANSMISSION_STATE_IOREG, 2; jump if not actively transfering
	rjmp activate

	ld r16, Z ;SPI0.DATA = *spi_state.dma_pointer
	sts SPI0_DATA, r16 ;13 cycles to get here

	lds r16, SPI0_DATA
	sbic TRANSMISSION_STATE_IOREG, 1; if(WRITE) *spi_state.dma_pointer = data
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

	sbi TRANSMISSION_STATE_IOREG, 2 ;set transfering

	andi r16, (1<<7)
	sbrc r16, 7
	sbi TRANSMISSION_STATE_IOREG, 1

end_spi_int_vect:
	pop r31
	pop r30
	pop r16
	out SREG, r16
	pop r16

	reti

;-------------------------------------------------------------------------------------------------------------------------------
SS_PORT_INTERRUPT_VECT: ;hot path CANNOT alter SREG. this shaves off 2 cycles
	push r16

	sbis SS_VPORT_IN, SS_VPORT_NUM; SS low
	rjmp L1

	push r30
	push r31

	lds r30, SPI_STATE_DMA_PTR
	lds r31, SPI_STATE_DMA_PTR + 1

	ld r16, Z
	sts SPI0_DATA, r16
	;takes 12 cycles, not counting interrup, which takes 5. In total we need at least 17 cycles between SS going low and first SCK transission

	ldi r16, 1 ;set to init
	;sts SPI_STATE_TRANSMISSION_STATE, r17
	out TRANSMISSION_STATE_IOREG, r16

	pop r31
	pop r30

	rjmp L2

L1:
	in r16, SREG ;only here do we alter SREG
	push r16
	;transmission done. transmission_state = IDLE
	clr r16
	out TRANSMISSION_STATE_IOREG, r16

	pop r16
	out SREG, r16

L2:	
	pop r16

	reti