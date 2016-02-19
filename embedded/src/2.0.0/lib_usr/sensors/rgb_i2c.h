#ifndef _RGB_I2C_H_
#define _RGB_I2C_H_

#include "../lib_usr.h"

/*this on GPIOA*/
#define RGB_SDA_0     	4
#define RGB_SDA_1     	5
#define RGB_SDA_2     	6
#define RGB_SDA_3     	7

/*this on GPIOC*/
#define RGB_SCL     		13

/*APDS-9950 RGB sensor*/
#define RGB_ADDRESS		(0x39<<1)

#define RGB_COMMAND		(1<<7)

#define RGB_ENABLE		0x00
#define RGB_ATIME			0x01
#define RGB_WTIME			0x03
#define RGB_AILTL			0x04
#define RGB_AILTH			0x05

#define RGB_AIHTL			0x06
#define RGB_AIHTH			0x07

#define RGB_PILTL			0x08
#define RGB_PILTH			0x09

#define RGB_PIHTL			0x0A
#define RGB_PIHTH			0x0B

#define RGB_PERS			0x0C
#define RGB_CONFIG			0x0D
#define RGB_PPULSE			0x0E

#define RGB_CONTROL			0x0F
#define RGB_ID				0x12
#define RGB_ID_VALUE				0x69

#define RGB_STATUS 			0x13

#define RGB_CDATAL			0x14
#define RGB_CDATAH			0x15
#define RGB_RDATAL			0x16
#define RGB_RDATAH			0x17
#define RGB_GDATAL			0x18
#define RGB_GDATAH			0x19
#define RGB_BDATAL			0x1A
#define RGB_BDATAH			0x1B
#define RGB_PDATAL 			0x1C
#define RGB_PDATAH 			0x1D



void rgb_i2c_init();

void rgb_i2cStart();
void rgb_i2cStop();
void rgb_i2cWrite(u8 a);
void rgb_i2cRead(u8 ack, u8 *result);

void rgb_i2c_write_reg(u8 dev_adr, u8 reg_adr, u8 value);
void rgb_i2c_read_reg(u8 dev_adr, u8 reg_adr, u8 *res);



#endif
