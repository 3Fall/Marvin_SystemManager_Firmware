#include <Arduino.h>
#include "spiSlave.hpp"
#include "PAC194x_5x.h"

bool bufferSwapped = false;
//All values have to be cached
PPAC194X5X_DEVICE_CONTEXT pac_device;
SPI_STATE_t spi_state;

void setup() {
	spi_slave_init();

	PAC194X5X_i2cParams param;
	param.i2cAddress = 0x69;
	float a = 0;
	uint32_t b = 0;
	PAC194x5x_Device_Initialize(param, pac_device, &a, &b);
}

void loop() {
	if(bufferSwapped) {

	};

}



void on_spi_write() {
	bufferSwapped = true;
}
