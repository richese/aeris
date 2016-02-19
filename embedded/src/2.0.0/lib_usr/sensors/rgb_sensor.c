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
  rgb_i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_ENABLE, (1<<1)|(1<<0));  /*power on, RGBC enable*/

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
	rgb_i2c_read_reg(RGB_ADDRESS,  RGB_COMMAND|RGB_ID, tmp);

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
  rgb_i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_ENABLE, 0);  /*power off*/
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
