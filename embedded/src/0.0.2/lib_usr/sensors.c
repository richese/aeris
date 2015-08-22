#include "sensors.h"
/*support define*/
#include "gyro.h"
#include "mag.h"
#include "accel.h"
#include "imu.h"
/*i2c switch define*/
#include "pca9548a.h"
/*sensor define*/
#include "rgb_i2c.h"
#include "mag3110.h"
#include "apds9950.h"
#include "lsm9ds0.h"

//MOVE TO H TO ACT AS GLOBAL

void sensors_init()
{
	/*2x same mag3110 on bot behind switch*/
	mag_adr_set(&g_mag_3110_bot[0], MAG3110_ADDR, I2C_SWITCH_ADR, (1<<6));
	mag_adr_set(&g_mag_3110_bot[1], MAG3110_ADDR, I2C_SWITCH_ADR, (1<<7));
	mag3110_init(&g_mag_3110_bot[0]);
	mag3110_init(&g_mag_3110_bot[1]);

	/*1x IMU lsm9ds0*/
	gyro_adr_set(&g_imu_lsm9ds0.gyro, GYRO_LSM9DS0_ADDRESS, 0, 0);
	mag_adr_set(&g_imu_lsm9ds0.mag, ACC_MAG_LSM9DS0_ADDRESS, 0, 0);
	accel_adr_set(&g_imu_lsm9ds0.accel, ACC_MAG_LSM9DS0_ADDRESS, 0, 0);

	imu_init(&g_imu_lsm9ds0);
	/*
	gyro_init_lsm9ds0(&g_imu_lsm9ds0.gyro);
	mag_init_lsm9ds0(&g_imu_lsm9ds0.mag);
	accel_init_lsm9ds0(&g_imu_lsm9ds0.accel);
	*/

	/*6x bot rgb sensors APDS9950 behind i2c switch*/
	rgb_adr_set(&g_rgb_bot[0], RGB_ADDRESS_APDS_9950, I2C_SWITCH_ADR, (1<<0));
	rgb_adr_set(&g_rgb_bot[1], RGB_ADDRESS_APDS_9950, I2C_SWITCH_ADR, (1<<1));
	rgb_adr_set(&g_rgb_bot[2], RGB_ADDRESS_APDS_9950, I2C_SWITCH_ADR, (1<<2));
	rgb_adr_set(&g_rgb_bot[3], RGB_ADDRESS_APDS_9950, I2C_SWITCH_ADR, (1<<3));
	rgb_adr_set(&g_rgb_bot[4], RGB_ADDRESS_APDS_9950, I2C_SWITCH_ADR, (1<<4));
	rgb_adr_set(&g_rgb_bot[5], RGB_ADDRESS_APDS_9950, I2C_SWITCH_ADR, (1<<5));

	u32 i;
	for (i = 0; i < APDS9950_BOT_COUNT; i++)
		rgb_init_apds9950(&g_rgb_bot[i]);

	/*paralel APDS9950 on top*/
	for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
		rgb_adr_set(&g_rgb_paralel[i], RGB_ADDRESS, 0, 0);
	rgb_init(g_rgb_paralel);
}

void sensors_read()
{
	/*2x same mag3110 on bot behind switch*/
	mag3110_read(&g_mag_3110_bot[0]);
	mag3110_read(&g_mag_3110_bot[1]);

	/*1x IMU lsm9ds0*/
	imu_read(&g_imu_lsm9ds0);

	/*
	gyro_read_lsm9ds0(&g_imu_lsm9ds0.gyro);
	mag_read_lsm9ds0(&g_imu_lsm9ds0.mag);
	accel_read_lsm9ds0(&g_imu_lsm9ds0.accel);
	*/
	 
	/*6x bot rgb sensors APDS9950 behind i2c switch*/
	u32 i;
	for (i = 0; i < APDS9950_BOT_COUNT; i++)
		rgb_read_apds9950(&g_rgb_bot[i]);

	/*3x paralel APDS9950 on top*/
	rgb_read(g_rgb_paralel);
}