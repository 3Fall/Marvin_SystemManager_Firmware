#include <Arduino.h>
#include "spiSlave.hpp"

void setup() {
}

void loop() {


}

void on_spi_write() {
	
}

ISR(SPI0_INT_vect) {
	spi_on_interrupt();
}