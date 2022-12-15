//3Fall (C) 2022

//Defines all the hardware connections

#pragma once

#include <Arduino.h>

#define PAC1954_I2C_ADDR 0x10

#define RSENSE_CH1 0
#define RSENSE_CH2 0
#define RSENSE_CH3 0
#define RSENSE_CH4 0

#define VRAIL_VBUS_CH1 0
#define VRAIL_VBUS_CH2 0
#define VRAIL_VBUS_CH3 0
#define VRAIL_VBUS_CH4 0

#define VBAT_EN_PIN PIN_PC3
#define V5P_EN_PIN PIN_PC4
#define V5L_EN_PIN PIN_PC5
#define V3L3_EN_PIN PIN_PB7

#define LED_R_PIN PIN_PB3
#define LED_G_PIN PIN_PB4
#define LED_B_PIN PIN_PB5

#define PAC_ALERT_1_PIN PIN_PA6
#define PAC_ALERT_2_PIN PIN_PA7

#define OUT_ALERT_PIN PIN_PA5

#define SPI_MOSI_PIN PIN_SPI_MOSI
#define SPI_MISO_PIN PIN_SPI_MISO
#define SPI_SCK_PIN PIN_SPI_SCK
#define SPI_SS_PIN PIN_SPI_SS

#define SPI_SS_PORT PORTA
#define SPI_SS_VPORT VPORTA
#define SPI_SS_PPIN 4
#define SPI_SS_PINCTRL PORTA.PIN4CTRL