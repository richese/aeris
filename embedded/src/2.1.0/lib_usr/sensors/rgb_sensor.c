#include "rgb_sensor.h"

u8 rgb_raw[RGB_SENSORS_COUNT];


u32 rgb_sensor_init()
{
	u32 i;

	for (i = 0; i < RGB_SENSORS_COUNT; i++)
	{
		g_rgb.r[i] = 0x00;
		g_rgb.g[i] = 0x00;
		g_rgb.b[i] = 0x00;

		g_rgb.proximity[i] = 0x00;
		g_rgb.ambient[i] = 0x00;
	}

	led_on(LED_W);

	rgb_i2c_init();

	rgb_i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_ATIME, 0xFF); 			/*2.4ms time*/
	rgb_i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_WTIME, 0xFF); 			/*2.4ms time*/

	rgb_i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_CONFIG, 0); 				/*dont wait long*/
	rgb_i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_ENABLE, (1<<1)|(1<<0));	/*power on, RGBC enable*/

	/*
		proximity sensor setup
		100mA LED current
		use IR diode
		60x GAIN
	*/
	rgb_i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_CONTROL, (1<<5)|(1<<0)|(1<<1));

	rgb_sensor_read();

	/*check correct sensor bus ID*/
	u8 tmp[RGB_SENSORS_COUNT];
	u32 rgb_error_result = 0;
	rgb_i2c_read_reg(RGB_ADDRESS, RGB_COMMAND|RGB_ID, tmp);

	for (i = 0; i < RGB_SENSORS_COUNT; i++)
	{
		if (tmp[i] != RGB_ID_VALUE)
			rgb_error_result|=(1<<i);
	}


	return rgb_error_result;
}

void rgb_sensor_uninit()
{
	led_off(LED_W);

	//TODO
	rgb_i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_ENABLE, 0);	/*power off*/
}


void rgb_sensor_read()
{
	u32 i;

	rgb_i2cStart();
	rgb_i2cWrite(RGB_ADDRESS);
	rgb_i2cWrite(RGB_COMMAND|RGB_CDATAL|(1<<5));

	rgb_i2cStart();
	rgb_i2cWrite(RGB_ADDRESS|0x01);

	rgb_i2cRead(1, rgb_raw);
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		g_rgb.ambient[i] = rgb_raw[i];

	rgb_i2cRead(1, rgb_raw);
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		g_rgb.ambient[i]|= ((u16)rgb_raw[i])<<8;

	rgb_i2cRead(1, rgb_raw);
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		g_rgb.r[i] = rgb_raw[i];

	rgb_i2cRead(1, rgb_raw);
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		g_rgb.r[i]|= ((u16)rgb_raw[i])<<8;

	rgb_i2cRead(1, rgb_raw);
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		g_rgb.g[i] = rgb_raw[i];

	rgb_i2cRead(1, rgb_raw);
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		g_rgb.g[i]|= ((u16)rgb_raw[i])<<8;

	rgb_i2cRead(1, rgb_raw);
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		g_rgb.b[i] = rgb_raw[i];

	rgb_i2cRead(1, rgb_raw);
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		g_rgb.b[i]|= ((u16)rgb_raw[i])<<8;


	rgb_i2cRead(1, rgb_raw);
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		g_rgb.proximity[i] = rgb_raw[i];

	rgb_i2cRead(0, rgb_raw);
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		g_rgb.proximity[i]|= ((u16)rgb_raw[i])<<8;

	rgb_i2cStop();
}

void rgb_get_line_position()
{
	u32 i;

	i32 w[] = {32, 64, 96, 128};

	i32 rgb_sum = 0;
	i32 pos_value = 0;
	i32 w_tmp = 0;
	for (i = 0; i< RGB_SENSORS_COUNT; i++)
	{
		w_tmp += (g_rgb.ambient[i] - g_rgb.background_norm[i])*w[i];
		rgb_sum += (g_rgb.ambient[i] - g_rgb.background_norm[i]);
	}

	pos_value = w_tmp/rgb_sum - 32 - 39;

	g_line_position.white_on_line = 0;

	if (rgb_sum > RGB_WHITE_LINE_TRESHOLD)
	{
		g_line_position.white_on_line = 1;
		g_line_position.white = pos_value;
	}


//	printf_("%i %i\n", g_line_position.white_on_line, g_line_position.white);
/*
	i32 res = 0;
	u32 max_idx = 0;
	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		if (g_rgb.ambient[i] > g_rgb.ambient[max_idx])
		{
			max_idx = i;
		}

	switch (max_idx)
	{
		case 0: res = -2; break;
		case 1: res = -1; break;
		case 2: res = 1; break;
		case 3: res = 2; break;
	}

return res;
	*/
}

void rgb_set_background()
{
	i32 i,j;
//clear
	for (j=0; j<RGB_SENSORS_COUNT; j++)
	{
		g_rgb.background_norm[j]=0;
	}
//count new value
	for (i=0; i<SET_BACKGROUND_COUNT; i++)
	{
		for (j=0; j<RGB_SENSORS_COUNT; j++)
		{
			g_rgb.background_norm[j]+=g_rgb.ambient[j];
		}
	}

	for (j=0; j<RGB_SENSORS_COUNT; j++)
	{
		g_rgb.background_norm[j]=g_rgb.background_norm[j]/SET_BACKGROUND_COUNT;
	}
}
