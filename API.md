# API doc

| Byte Offset | Field byte length | Field Type | Name | Descritption | RW |
|-------------|-------------------|------------|------|--------------|----|
| 0x00 | 2  | bit-flag | System status | . | R |
| 0x02 | 2  | short-float | T1 | . | R |
| 0x04 | 2  | short-float | T2 | . | R |
| 0x06 | 2  | short-float | T3 | . | R |
| 0x08 | 2  | short-float | T_EXT | . | R |
| 0x0A | 4 | float | VBAT voltage | | R| 
| 0x0E | 4 | float | 3V3 voltage | | R |
| 0x12 | 4 | float | V5P voltage | | R| 
| 0x16 | 4 | float | V5L voltage | | R| 
| 0x1A | 4 | float | VBAT current | | R| 
| 0x1E | 4 | float | 3V3 current | | R |
| 0x22 | 4 | float | V5P current | | R| 
| 0x26 | 4 | float | V5L current | | R|
