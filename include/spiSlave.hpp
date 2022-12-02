#pragma once
#include <Arduino.h>

struct SPI_STATE_t {
	uint8_t buffer[2][256];
	bool active, direction;
	uint8_t *base_address;
	uint8_t pointer;
};

//__attribute__ ((address (0x3500)))

extern SPI_STATE_t  spi_state;

void spi_slave_init();

inline bool spi_is_transmitting();
void spi_on_interrupt();
void swap_buffers();
