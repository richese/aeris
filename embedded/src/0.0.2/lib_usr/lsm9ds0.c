#include "lsm9ds0.h"
/*
#include "gyro.h"
#include "mag.h"
#include "accelerometer.h"
*/
u32 gyro_init_lsm9ds0(struct sGyro *gyro)
{ 
    gyro->x = 0;
    gyro->y = 0;
    gyro->z = 0;

	#ifdef I2C_SWITCH
    if (gyro->i2c_switch_adr)
    {
        /*set i2c switch to sensor adress on switch*/
        i2c_switch_set(gyro->i2c_switch_adr, 
                       gyro->sensor_adress_on_switch);
    }
    #endif

	/*enable gyro, xyz axis, 200Hz, 70Hz cut off*/
	//DR 01 = 190 Hz; BW 11 = cutoff 70 Hz; PD = 1 normal power mode; ZXY = 111 enable 
	i2c_write_reg(gyro->sensor_adress, GYRO_CTRL_REG1, (0<<7)|(1<<6) | (1<<5)|(1<<4) | (1<<3) | (1<<2)|(1<<1)|(1<<0) );
	//imu_write_reg(gyro->sensor_adress, GYRO_CTRL_REG2, (1<<5)|(1<<1)|(1<<0));/*enable high pass filter, 2Hz*/
	i2c_write_reg(gyro->sensor_adress, GYRO_CTRL_REG2, 0);		/*dont use high pass filter*/
	i2c_write_reg(gyro->sensor_adress, GYRO_CTRL_REG3, 0);		/*no interrupt*/
	i2c_write_reg(gyro->sensor_adress, GYRO_CTRL_REG4, (1<<4));	/*500dpi*/
	i2c_write_reg(gyro->sensor_adress, GYRO_CTRL_REG5, 0);
	//imu_write_reg(gyro->sensor_adress, GYRO_CTRL_REG5, (1<<4));	/*enable high pass filter*/

	if (i2c_read_reg(gyro->sensor_adress, GYRO_WHO_AM_I) != GYRO_WHO_AM_I_ID)
		return 1;

	return 0;
}

void gyro_read_lsm9ds0(struct sGyro *gyro)
{
    #ifdef I2C_SWITCH
    if (gyro->i2c_switch_adr)
    {
        /*set i2c switch to sensor adress on switch*/
        i2c_switch_set(gyro->i2c_switch_adr, 
                       gyro->sensor_adress_on_switch);
    }
    #endif

	u16 tmp;
	tmp = (u16)i2c_read_reg(gyro->sensor_adress, GYRO_OUT_X_LSB);
	tmp|= ((u16)i2c_read_reg(gyro->sensor_adress, GYRO_OUT_X_MSB))<<8;
	gyro->x = tmp;

	tmp = (u16)i2c_read_reg(gyro->sensor_adress, GYRO_OUT_Y_LSB);
	tmp|= ((u16)i2c_read_reg(gyro->sensor_adress, GYRO_OUT_Y_MSB))<<8;
	gyro->y = tmp;

	tmp = (u16)i2c_read_reg(gyro->sensor_adress, GYRO_OUT_Z_LSB);
	tmp|= ((u16)i2c_read_reg(gyro->sensor_adress, GYRO_OUT_Z_MSB))<<8;
	gyro->z = tmp;
}

u32 mag_init_lsm9ds0(struct sMag *mag)
{
    mag->x = 0;
    mag->y = 0;
    mag->z = 0;

    #ifdef I2C_SWITCH
    if (mag->i2c_switch_adress)
    {
        /*set i2c switch to sensor adress on switch*/
        i2c_switch_set(mag->i2c_switch_adress, 
                       mag->sensor_adress_on_switch);
    }
    #endif

    /*acc 200Hz, acc x,y,z axis enable*/
    i2c_write_reg(mag->sensor_adress, CTRL_REG1_XM, (1<<6)|(1<<5)|(1<<4) | (1<<2)|(1<<1)|(1<<0) );
    /*acc 2g*/
    i2c_write_reg(mag->sensor_adress, CTRL_REG2_XM, 0);
    /*mag 6.25Hz, mag low ress*/
    i2c_write_reg(mag->sensor_adress, CTRL_REG5_XM, (1<<2) );
    /*mag 4 gauss default*/
    //i2c_write_reg(mag->sensor_adress, CTRL_REG6_XM, (1<<5) );
    /*default acc internal filter bypassed*/
    //i2c_write_reg(mag->sensor_adress, CTRL_REG7_XM, (1<<1));

    if (i2c_read_reg(mag->sensor_adress, MAG_WHO_AM_I_XM) != MAG_WHO_AM_I_XM_ID)
        return 1;
    return 0;
}

void mag_read_lsm9ds0(struct sMag *mag)
{ 
    #ifdef I2C_SWITCH
    if (mag->i2c_switch_adress)
    {
        /*set i2c switch to sensor adress on switch*/
        i2c_switch_set(mag->i2c_switch_adress, 
                       mag->sensor_adress_on_switch);
    }
    #endif

	u16 tmp;

	tmp = ((u16)i2c_read_reg(mag->sensor_adress, MAG_OUT_X_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(mag->sensor_adress, MAG_OUT_X_LSB));
	mag->x = tmp;

		
	tmp = ((u16)i2c_read_reg(mag->sensor_adress, MAG_OUT_Y_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(mag->sensor_adress, MAG_OUT_Y_LSB));
	mag->y = tmp;

	tmp = ((u16)i2c_read_reg(mag->sensor_adress, MAG_OUT_Z_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(mag->sensor_adress, MAG_OUT_Z_LSB));
	mag->z = tmp;
}

u32 accel_init_lsm9ds0(struct sAccel *accel)
{
    accel->x = 0;
    accel->y = 0;
    accel->z = 0;

    #ifdef I2C_SWITCH
    if (accel->i2c_switch_adr)
    {
        /*set i2c switch to sensor adress on switch*/
        i2c_switch_set(accel->i2c_switch_adr, 
                       accel->sensor_adress_on_switch);
    }
    #endif

     /*acc 200Hz, acc x,y,z axis enable*/
    i2c_write_reg(accel->sensor_adress, CTRL_REG1_XM, (1<<6)|(1<<5)|(1<<4) | (1<<2)|(1<<1)|(1<<0) );
    /*acc 2g*/
    i2c_write_reg(accel->sensor_adress, CTRL_REG2_XM, 0);
    /*mag 6.25Hz, mag low ress*/
    i2c_write_reg(accel->sensor_adress, CTRL_REG5_XM, (1<<2) );
    /*mag 4 gauss default*/
    //i2c_write_reg(accel->sensor_adress, CTRL_REG6_XM, (1<<5) );
    /*default acc internal filter bypassed*/
    //i2c_write_reg(accel->sensor_adress, CTRL_REG7_XM, (1<<1));

    if (i2c_read_reg(accel->sensor_adress, MAG_WHO_AM_I_XM) != MAG_WHO_AM_I_XM_ID)
        return 1;

    return 0;
}

void accel_read_lsm9ds0(struct sAccel *accel)
{
    #ifdef I2C_SWITCH
    if (accel->i2c_switch_adr)
    {
        /*set i2c switch to sensor adress on switch*/
        i2c_switch_set(accel->i2c_switch_adr, 
                       accel->sensor_adress_on_switch);
    }
    #endif

    u16 tmp;
    
    tmp = ((u16)i2c_read_reg(accel->sensor_adress, ACC_OUT_X_MSB))<<8;
    tmp|= (u16)i2c_read_reg(accel->sensor_adress, ACC_OUT_X_LSB);
    accel->x = tmp;

    tmp = ((u16)i2c_read_reg(accel->sensor_adress, ACC_OUT_Y_MSB))<<8;
    tmp|= (u16)i2c_read_reg(accel->sensor_adress, ACC_OUT_Y_LSB);
    accel->y = tmp;

    tmp = ((u16)i2c_read_reg(accel->sensor_adress, ACC_OUT_Z_MSB))<<8;
    tmp|= (u16)i2c_read_reg(accel->sensor_adress, ACC_OUT_Z_LSB);
    accel->z = tmp;
}