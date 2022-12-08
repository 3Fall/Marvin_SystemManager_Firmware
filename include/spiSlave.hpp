#pragma once
 
#define _ptr_len 2 //sizeof((void*))

//base address of the spi state buffer.
#define SPI_STATE_BASE 0x3400
#define TRANSMISSION_STATE_IOREG GPIOR3

#if !defined (__ASSEMBLER__)
#include <Arduino.h>

struct SPI_STATE_t {
	uint8_t buffer[2][256];
	//init, write, active
	//uint8_t transmission_state;
	uint8_t transaction_status;
	uint8_t *dma_base_address, *dma_pointer;
	uint8_t *access_base_address;
} __attribute__ ((packed));

//TODO: align to 256-byte boundary
extern SPI_STATE_t spi_state __attribute__ ((address (SPI_STATE_BASE)));
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

//THESE are critical definition for the assembly
//#define SPI_STATE_TRANSMISSION_STATE (0x3400 + 2*256)
#define SPI_STATE_TRANSACTION_STATUS (0x3400 + 2*256) //(SPI_STATE_TRANSMISSION_STATE + 1)
#define SPI_STATE_DMA_BASE_ADDRESS SPI_STATE_TRANSACTION_STATUS + 1
#define SPI_STATE_DMA_PTR SPI_STATE_DMA_BASE_ADDRESS + 2

#define SS_VPORT_IN VPORTA_IN
#define SS_VPORT_NUM 4
#define SS_PORT_INTERRUPT_VECT PORTA_PORT_vect
#endif