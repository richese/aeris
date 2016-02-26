#ifndef _RGB_SENSOR_H_
#define _RGB_SENSOR_H_

#include "../lib_usr.h"
#include "rgb_i2c.h"

#define RGB_SENSORS_COUNT		(4)

struct sRGBSensor
{
	i16 r[RGB_SENSORS_COUNT];
	i16 g[RGB_SENSORS_COUNT];
	i16 b[RGB_SENSORS_COUNT];

	i16 ambient[RGB_SENSORS_COUNT];
	i16 proximity[RGB_SENSORS_COUNT];
};

volatile struct sRGBSensor g_rgb;


u32 rgb_sensor_init();
void rgb_sensor_uninit();

void rgb_sensor_read();

#endif
