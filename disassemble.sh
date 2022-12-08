#!/bin/bash
avr-objdump -D .pio/build/ATtiny3227/firmware.elf > disassembly.S
