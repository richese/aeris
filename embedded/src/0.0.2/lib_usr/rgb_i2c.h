#ifndef _RGB_I2C_H_
#define _RGB_I2C_H_

#include "../device/device.h"

//create i2c switch routine
//#define RGB_SENSORS_COUNT_BOT			(6)

//use michaels paralell routine from follower robot
#define RGB_SENSORS_COUNT_TOP			(3)

struct sRGBSensor
{
	u8 sensor_adress;
	u8 i2c_switch_adress;
	u8 sensor_adress_on_switch;
	
	i16 r;
	i16 g;
	i16 b;

	i16 ambient;
	i16 proximity;
};

struct sRGBSensor g_rgb_paralel[RGB_SENSORS_COUNT_TOP];

void rgb_init(struct sRGBSensor *sensor_struct);
void rgb_read(struct sRGBSensor *sensor_struct);

/*this on GPIO? GPIOC*/ 
#define RGB_SDA_0     	0
#define RGB_SDA_1     	1
#define RGB_SDA_2     	2

/*GPIOD*/
#define RGB_SCL			2

/*APDS-9950 RGB sensor*/
#define RGB_ADDRESS		(0x39<<1)

#ifndef APDS_9950

#define APDS_9950

#define RGB_COMMAND			(1<<7)

#define RGB_ENABLE			0x00
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

#endif

#endif