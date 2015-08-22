#include "mag3110.h"
#include "pca9548a.h"

void mag3110_init(struct sMag *mag)
{	
    mag->x = 0;
	mag->y = 0;
	mag->z = 0;

	#ifdef I2C_SWITCH
	if (mag->i2c_switch_adr)
	{
    	/*set i2c switch to sensor adress on switch*/
    	i2c_switch_set(mag->i2c_switch_adr, 
   					   mag->sensor_adress_on_switch);
    }
    #endif
    //i2c_write_reg(mag->sensor_adress, MAG3110_CTRL_REG1, 0x81);	/*5Hz active mode*/
	i2c_write_reg(mag->sensor_adress, MAG3110_CTRL_REG1, (1<<0)); /*active mode*/
	//mag_write(MAG3110_CTRL_REG1, 0xA1);
	i2c_write_reg(mag->sensor_adress, MAG3110_CTRL_REG2, (1<<7)|(1<<5));			/*active mode, raw mode*/	
} 

 
void mag3110_read(struct sMag *mag)
{ 
	u16 tmp;

	#ifdef I2C_SWITCH
	if (mag->i2c_switch_adr)
	{
    	/*set i2c switch to sensor adress on switch*/
    	i2c_switch_set(mag->i2c_switch_adr, 
   					   mag->sensor_adress_on_switch);
    }
    #endif	

	tmp = ((u16)i2c_read_reg(mag->sensor_adress, MAG3110_X_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(mag->sensor_adress, MAG3110_X_LSB));
	mag->x = tmp;

			
	tmp = ((u16)i2c_read_reg(mag->sensor_adress, MAG3110_Y_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(mag->sensor_adress, MAG3110_Y_LSB));
	mag->y = tmp;

	tmp = ((u16)i2c_read_reg(mag->sensor_adress, MAG3110_Z_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(mag->sensor_adress, MAG3110_Z_LSB));
	mag->z = tmp;
}