#pragma once

//base address of the spi state buffer.
#define TRANSMISSION_STATE_IOREG GPIOR3

#if !defined (__ASSEMBLER__)
#include <Arduino.h>

struct SPI_STATE_t {
	uint8_t buffer[2][256] __attribute__ ((aligned (256)));
	volatile uint8_t transaction_status;
	uint8_t *dma_base_address, *dma_pointer;
} __attribute__ ((packed));

//TODO: align to 256-byte boundary
extern SPI_STATE_t spi_state;

void spi_slave_init();

//extern void spi_on_interrupt();
//extern void spi_on_ss_transission();

inline bool spi_is_transmitting();
void spi_swap_buffers();

void* spi_get_access_buffer_ptr();

enum SPI_TRANSACTION_STATUS {
	IDLE = 0,
	INIT = 1,
	READ = 4,
	WRITE = 6
};

#else

#define SPI_STATE_TRANSACTION_STATUS_OFFSET 2*256 //(SPI_STATE_TRANSMISSION_STATE + 1)
#define SPI_STATE_DMA_BASE_ADDRESS_OFFSET SPI_STATE_TRANSACTION_STATUS_OFFSET + 1
#define SPI_STATE_DMA_PTR_OFFSET SPI_STATE_DMA_BASE_ADDRESS_OFFSET + 2

#define SS_VPORT_INTFLAGS VPORTA_INTFLAGS
#define SS_VPORT_IN VPORTA_IN
#define SS_VPORT_NUM 4
#define SS_PORT_INTERRUPT_VECT PORTA_PORT_vect
#endif