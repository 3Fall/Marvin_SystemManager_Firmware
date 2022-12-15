#include <Arduino.h>
#include "PAC194x_5x.h"

#include "spiSlave.hpp"
#include "pins.h"

PAC194X5X_DEVICE_CONTEXT pac_device;

inline void on_pac_error(uint16_t code) {
	if(code != PAC194X5X_SUCCESS) { 
		Serial.printf("Error occurred during PAC initialization 0x%x\n", code); 
		while(1); 
	} 
}

SPI_STATE_t spi_state;

void setup() {
	Serial.begin(115200);
	Serial.println("Hello!");

	spi_slave_init();

	uint32_t rsense_array[] = {
		RSENSE_CH1,
		RSENSE_CH2,
		RSENSE_CH3,
		RSENSE_CH4
	};

	float vrail_ratio_arr[] = {
		VRAIL_VBUS_CH1,
		VRAIL_VBUS_CH2,
		VRAIL_VBUS_CH3,
		VRAIL_VBUS_CH4
	};

	PAC194X5X_i2cParams i2c_param;
	i2c_param.i2cAddress = 0x69;

	//uint16_t errorCode = 

	on_pac_error(PAC194x5x_Device_Initialize(i2c_param, &pac_device, vrail_ratio_arr, rsense_array));
	
	PAC194X5X_CTRL_REGISTER ctrl_reg;

	on_pac_error(PAC194x5x_GetCtrl_reg(&pac_device, 2, &ctrl_reg));
}

uint8_t cnt = 0;

void loop() {
	/*volatile uint8_t status = spi_state.transaction_status;

	if(status) {
		*(uint8_t*)spi_get_access_buffer_ptr() = ++cnt;
		spi_swap_buffers();
		uint32_t val = *(uint32_t*)(spi_get_access_buffer_ptr() + (1 << 7));
		Serial.printf("Rec: %d, S: %d, at: %ld\n", val, status, millis());
		spi_state.transaction_status = 0;
	}*/
}
