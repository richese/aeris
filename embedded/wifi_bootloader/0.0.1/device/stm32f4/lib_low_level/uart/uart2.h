#ifndef _UART2_H_
#define _UART2_H_

#include "../lib_low_level.h"

#define UART2_BAUD_RATE 		9600
//#define UART2_BAUD_RATE 		57600
//#define UART2_BAUD_RATE 		115200


void uart2_write(char c);
char uart2_read();
i16 uart2_read_nonblocking();
void uart2_init();

#endif