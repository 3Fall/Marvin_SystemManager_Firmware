#include <Arduino.h>
#include "spiSlave.hpp"

void setup() {
}

void loop() {


}

ISR(SPI0_INT_vect) {
	spi_on_interrupt();
}