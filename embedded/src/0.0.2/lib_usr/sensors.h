#ifndef _SENSORS_H_
#define _SENSORS_H_

#include "../device/device.h"
/*
struct sSensors
{
	struct sMag3110 mag3110[MAG3110_COUNT];
	struct sImu	imu[IMU_COUNT];
};
*/

void sensors_init();
void sensors_read();

/*
void sensor_adr_set(struct *sensor_struct,
					u8 sensor_adress, 
					u8 i2c_switch_adress,
					u8 sensor_adress_on_switch);
*/

#endif