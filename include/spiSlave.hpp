#pragma once
 
#define _ptr_len 2 //sizeof((void*))

#define SPI_STATE_BASE 0x3400
#define SPI_STATE_ACTIVE (0x3400 + 2*256)
#define SPI_STATE_DIRECTION (SPI_STATE_ACTIVE + 1)
#define SPI_STATE_SHOULD_SWAP (SPI_STATE_DIRECTION + 1)
#define SPI_STATE_WRITTEN (SPI_STATE_SHOULD_SWAP + 1)
#define SPI_STATE_DMA_BASE_ADDRESS SPI_STATE_WRITTEN + 1
#define SPI_STATE_DMA_PTR SPI_STATE_DMA_BASE_ADDRESS + 2


#if !defined (__ASSEMBLER__)
#include <Arduino.h>

struct SPI_STATE_t {
	uint8_t buffer[2][256];
	bool active, direction, shouldSwap, written;
	uint8_t *dma_base_address, *dma_pointer;
	uint8_t *access_base_address;
} __attribute__ ((packed));

//TODO: align to 256-byte boundary
extern SPI_STATE_t spi_state __attribute__ ((address (SPI_STATE_BASE)));
extern void on_spi_write();

void spi_slave_init();

inline bool spi_is_transmitting();
extern void spi_on_interrupt();
void spi_swap_buffers();

#endif