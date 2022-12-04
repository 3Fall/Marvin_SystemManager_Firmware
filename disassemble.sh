#!/bin/bash
avr-objdump -d .pio/build/ATtiny3227/firmware.elf > disassembly.S
