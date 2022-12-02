# API doc

| Byte Offset | Field byte length | Field Type | Name | Descritption | RW |
|-------------|-------------------|------------|------|--------------|----|
| 0x00 | 2  | bit-flag | System status | . | R |
| 0x02 | 2  | short-float | T1 | Temperature 1 | R |
| 0x04 | 2  | short-float | T2 | Temperature 2 | R |
| 0x06 | 2  | short-float | T3 | Temperature 3 | R |
| 0x08 | 2  | short-float | T_EXT | Temperature External | R |
| 0x0A | 4 | float | VBAT voltage | | R| 
| 0x0D | 4 | float | 3V3 voltage | | R |
| 0x10 | 4 | float | V5P voltage | | R| 
| 0x14 | 4 | float | V5L voltage | | R| 
