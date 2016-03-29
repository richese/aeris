#include "motors.h"


u32 motors_init()
{
	g_motors.left = 0;
	g_motors.right = 0;


	motors_update();

	return 0;
}

void motors_uninit()
{
	u8 tmp = (6<<2);
	i2c_write_reg(DRV8830_LEFT_ADDRESS, DRV8830_CONTROL_REG, tmp);
	i2c_write_reg(DRV8830_RIGHT_ADDRESS, DRV8830_CONTROL_REG, tmp);
}

void motors_update()
{
	i8 tmp_left = g_motors.left;
	i8 tmp_right = g_motors.right;


	if (tmp_left > SPEED_MAX)
		tmp_left = SPEED_MAX;

	if (tmp_left < -SPEED_MAX)
		tmp_left = -SPEED_MAX;

	if (tmp_right > SPEED_MAX)
		tmp_right = SPEED_MAX;

	if (tmp_right < -SPEED_MAX)
		tmp_right = -SPEED_MAX;



	u8 tmp = 0;

	if (tmp_left == 0)
	{
		tmp = (6<<2)|(1<<1)|(1<<0); //break
	}
	else
	{
		if (tmp_left > 0)
		{
			if (tmp_left < 6)					 //minimum voltage, see datasheet
				tmp_left = 6;

			tmp = (tmp_left<<2)|(1<<1); //set speed and way
		}
		else
		{
			tmp_left = -tmp_left;
			if (tmp_left < 6)					 //minimum voltage, see datasheet
				tmp_left = 6;

			tmp = (tmp_left<<2)|(1<<0); //set speed and way
		}
	}

	i2c_write_reg(DRV8830_LEFT_ADDRESS, DRV8830_CONTROL_REG, 0);
	i2c_write_reg(DRV8830_LEFT_ADDRESS, DRV8830_CONTROL_REG, tmp);


	if (tmp_right == 0)
	{
		tmp = (6<<2)|(1<<1)|(1<<0); //break
	}
	else
	if (tmp_right > 0)
	{
		if (tmp_right < 6)					 //minimum voltage, see datasheet
			tmp_right = 6;

		tmp = (tmp_right<<2)|(1<<0); //set speed and way
	}
	else
	{
		tmp_right = -tmp_right;
		if (tmp_right < 6)					 //minimum voltage, see datasheet
			tmp_right = 6;

		tmp = (tmp_right<<2)|(1<<1); //set speed and way
	}

	i2c_write_reg(DRV8830_RIGHT_ADDRESS, DRV8830_CONTROL_REG, 0);
	i2c_write_reg(DRV8830_RIGHT_ADDRESS, DRV8830_CONTROL_REG, tmp);

}
