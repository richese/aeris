#ifndef _LSM9DS0_H_
#define _LSM9DS0_H_

#include "../device/device.h"
#include "gyro.h"
#include "accel.h"
#include "mag.h"

#define GYRO_LSM9DS0_ADDRESS	(0xD4)

#define	GYRO_WHO_AM_I		0x0F
#define	GYRO_WHO_AM_I_ID	212

#define GYRO_CTRL_REG1 		0x20
#define GYRO_CTRL_REG2 		0x21
#define GYRO_CTRL_REG3 		0x22
#define GYRO_CTRL_REG4 		0x23
#define	GYRO_CTRL_REG5		0x24

#define GYRO_OUT_X_LSB 		0x28
#define GYRO_OUT_X_MSB 		0x29
#define GYRO_OUT_Y_LSB 		0x2A
#define GYRO_OUT_Y_MSB 		0x2B
#define GYRO_OUT_Z_LSB 		0x2C
#define GYRO_OUT_Z_MSB 		0x2D

#define ACC_MAG_LSM9DS0_ADDRESS		(0x3C)

//MAGNETOMETER
#define MAG_OUT_X_LSB		0x08		/*data*/
#define MAG_OUT_X_MSB		0x09		/*data*/
#define MAG_OUT_Y_LSB		0x0A		/*data*/
#define MAG_OUT_Y_MSB		0x0B		/*data*/
#define MAG_OUT_Z_LSB		0x0C		/*data*/
#define MAG_OUT_Z_MSB		0x0D		/*data*/
#define MAG_WHO_AM_I_XM		0x0F		/*0xC4*/
#define MAG_WHO_AM_I_XM_ID	  73		

#define MAG_OFF_X_LSB		0x16		/*0x00*/
#define MAG_OFF_X_MSB		0x17		/*0x00*/
#define MAG_OFF_Y_LSB		0x18		/*0x00*/
#define MAG_OFF_Y_MSB		0x19		/*0x00*/
#define MAG_OFF_Z_LSB		0x1A		/*0x00*/
#define MAG_OFF_Z_MSB		0x1B		/*0x00*/

//ACCELEROMETER
#define ACC_STATUS				0x27

#define ACC_OUT_X_LSB			0x28
#define ACC_OUT_X_MSB			0x29
#define ACC_OUT_Y_LSB			0x2A
#define ACC_OUT_Y_MSB			0x2B
#define ACC_OUT_Z_LSB			0x2C
#define ACC_OUT_Z_MSB			0x2D

//ACC and MAG common controll registers
#define CTRL_REG0_XM	0x1F		/*0x00*/
#define CTRL_REG1_XM	0x20		/*0x00*/
#define CTRL_REG2_XM	0x21		/*0x00*/
#define CTRL_REG3_XM	0x22		/*0x00*/
#define CTRL_REG4_XM	0x23		/*0x00*/
#define CTRL_REG5_XM	0x24		/*0x00*/
#define CTRL_REG6_XM	0x25		/*0x00*/
#define CTRL_REG7_XM	0x26		/*0x00*/

u32 mag_init_lsm9ds0(struct sMag *sensor_struct);
u32 accel_init_lsm9ds0(struct sAccel *sensor_struct);
u32 gyro_init_lsm9ds0(struct sGyro *sensor_struct);

void mag_read_lsm9ds0(struct sMag *sensor_struct);
void accel_read_lsm9ds0(struct sAccel *sensor_struct);
void gyro_read_lsm9ds0(struct sGyro *sensor_struct);

#endif