#include "sensors.h"

void rgb_sensor_thread()
{
	u32 init_res = rgb_sensor_init();

	if (init_res != 0)
    abort_error_(ERROR_RGB_SENSOR, init_res);

 	event_timer_set_period(EVENT_TIMER_0_ID, RGB_SAMPLIG_PERIOD);

 	while (1)
 	{
 		event_timer_wait(EVENT_TIMER_0_ID);
		rgb_sensor_read();
 	}
}

void i2c_sensor_thread()
{
	u32 init_res;

	init_res = lsm9ds0_init();					/*IMU*/
	if (init_res != 0)
		abort_error_(ERROR_IMU, init_res);

 	event_timer_set_period(EVENT_TIMER_1_ID, I2C_SAMPLIG_PERIOD);

 	while (1)
 	{
 		event_timer_wait(EVENT_TIMER_1_ID);
 		lsm9ds0_read();
 	}
}

void adc_sensor_thread()
{
  u32 init_res;

  init_res = adc_sensor_init();
  if (init_res != 0)
    abort_error_(ERROR_ADC, init_res);

  event_timer_set_period(EVENT_TIMER_2_ID, I2C_SAMPLIG_PERIOD);

  while (1)
  {
    event_timer_wait(EVENT_TIMER_2_ID);
    adc_sensor_read();
  }
}
