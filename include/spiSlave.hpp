#pragma once

//base address of the spi state buffer.
#define TRANSMISSION_STATE_IOREG GPIOR3

#if !defined (__ASSEMBLER__)
#include <Arduino.h>

struct SPI_STATE_t {
	uint8_t buffer[2][256] __attribute__ ((aligned (256)));
	uint8_t transaction_status;
	uint8_t *dma_base_address, *dma_pointer;
	uint8_t *access_base_address;
} __attribute__ ((packed))  ;

//TODO: align to 256-byte boundary
extern SPI_STATE_t spi_state;
extern void on_spi_write();

void spi_slave_init();

//extern void spi_on_interrupt();
//extern void spi_on_ss_transission();

inline bool spi_is_transmitting();
void spi_swap_buffers();

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

#define SS_VPORT_IN VPORTA_IN
#define SS_VPORT_NUM 4
#define SS_PORT_INTERRUPT_VECT PORTA_PORT_vect
#endif