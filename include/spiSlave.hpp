#pragma once
#include <Arduino.h>

struct SPI_STATE_t {
	uint8_t buffer[2][256];
	bool active, direction, shouldSwap, written;
	uint8_t *dma_base_address, *dma_pointer;
	uint8_t *access_base_address;
};

//__attribute__ ((address (0x3500)))

//TODO: align to 256-byte boundary
extern "C" SPI_STATE_t  spi_state;
extern void on_spi_write();

void spi_slave_init();

inline bool spi_is_transmitting();
void spi_on_interrupt();
void spi_swap_buffers();
