#include <avr/io.h>
#include "spiSlave.hpp"

;export the symbols
.global SPI0_INT_vect 
.global SS_PORT_INTERRUPT_VECT

.extern spi_state
;uses GPIOR? for transmission status instead of a memory location. thus it uses one less register and doesn't one more memory fetch

;-------------------------------------------------------------------------------------------------------------------------------
;PI*eye gives around 35 cycles of the hot path. at 20MHz we might try to at 3~4MHz, depending on stm's delay etc
SPI0_INT_vect:
#ifdef DEBUG
	sbi VPORTB_OUT, 1; DEBUG
#endif

	push r16
	in r16, SREG
	push r16 ;use r16 for SPI0.DATA
	push r30 ;use Z for spi_state.dma_pointer
	push r31

	lds r16, SPI0_INTFLAGS ; clear interupt flags

	lds r31, spi_state + SPI_STATE_DMA_PTR_OFFSET + 1 ; get high byte of the buffer address. We'll get the low byte later

	sbis TRANSMISSION_STATE_IOREG, 2; jump to 'activate' if not actively transfering
	rjmp activate

	lds r30, spi_state + SPI_STATE_DMA_PTR_OFFSET ;get low byte from memory

	ld r16, Z ;SPI0.DATA = *spi_state.dma_pointer
	sts SPI0_DATA, r16 ;14 cycles to get here

	lds r16, SPI0_DATA
	sbic TRANSMISSION_STATE_IOREG, 1; if(WRITE) *spi_state.dma_pointer = data
	st Z, r16

	;uint8_t pos = (int)(void*)spi_state.dma_pointer;
	;*(uint8_t*)(void*)&spi_state.dma_pointer = ++pos;
	inc r30
	sts spi_state + SPI_STATE_DMA_PTR_OFFSET, r30

	rjmp end_spi_int_vect
activate:
	;I skipped using intermidiate register for initial data, directly putting it into lower byte of the pointer and then going off there

	lds r30, SPI0_DATA ;*(uint8_t*)(void*)spi_state.dma_pointer = data;

	ld r16, Z ;SPI0.DATA = *spi_state.dma_pointer
	sts SPI0_DATA, r16

	sts spi_state + SPI_STATE_DMA_PTR_OFFSET, r30

	sbi TRANSMISSION_STATE_IOREG, 2 ;set transfering

	andi r30, (1<<7) 
	sbrc r30, 7
	sbi TRANSMISSION_STATE_IOREG, 1; set writing

end_spi_int_vect:
#ifdef DEUBG
	cbi VPORTB_OUT, 1;DEBUG
#endif

	pop r31
	pop r30
	pop r16
	out SREG, r16
	pop r16

	reti


;-------------------------------------------------------------------------------------------------------------------------------
SS_PORT_INTERRUPT_VECT: ;hot path CANNOT alter SREG. this shaves off 2 cycles
#ifdef DEBUG
	sbi VPORTB_OUT, 0; DEBUG
#endif

	push r16

	sbis SS_VPORT_IN, SS_VPORT_NUM
	rjmp L1
; SS low
; push the first byte onto bus, set to INIT
	push r30
	push r31

	ldi r30, 0 ; set low byte to 0
	lds r31, spi_state + SPI_STATE_DMA_PTR_OFFSET + 1 ; get high byte from memory

	ld r16, Z ; put first byte of the buffer onto the bus
	sts SPI0_DATA, r16
	;takes 11 cycles, not counting interrup, which takes 5. In total we need at least 17 cycles between SS going low and first SCK transission

	ldi r16, 1 ;set to init
	out TRANSMISSION_STATE_IOREG, r16

	pop r31
	pop r30

	rjmp L2

L1:
;SS HIGH
;Set TRANSMISSION_STATE to IDLE
	;spi_state.transaction_status = transmission state
	in r16, TRANSMISSION_STATE_IOREG
	sts spi_state + SPI_STATE_TRANSACTION_STATUS_OFFSET, r16

	;transmission done. transmission_state = IDLE
	clr r16
	out TRANSMISSION_STATE_IOREG, r16

L2:	
	sbi SS_VPORT_INTFLAGS, SS_VPORT_NUM ; clear PORT interrupt

	pop r16

#ifdef DEBUG
	cbi VPORTB_OUT, 0; DEBUG
#endif

	reti