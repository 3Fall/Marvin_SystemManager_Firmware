#include <Arduino.h>
#include "spiSlave.hpp"
#include "PAC194x_5x.h"

bool bufferSwapped = false;
//All values have to be cached
PPAC194X5X_DEVICE_CONTEXT pac_device;

void setup() {
	PAC194X5X_i2cParams param;
	param.i2cAddress = 0x69;
	PAC194x5x_Device_Initialize(param, pac_device, 1, 1);
}

void loop() {
	if(bufferSwapped) {

	};

}

void on_spi_write() {
	bufferSwapped = true;
}

ISR(SPI0_INT_vect) {
	spi_on_interrupt();
}