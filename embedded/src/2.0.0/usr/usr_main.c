#include "usr_main.h"
#include "sensors.h"
#include "test.h"

#include "../lib_usr/drv8830.h"

void main_thread()
{
	printf_(OS_WELCOME_MESSAGE);

	timer_delay_ms(300);

	drv8830_init();

	create_thread(rgb_sensor_thread, rgb_sensor_thread_stack, sizeof(rgb_sensor_thread_stack), PRIORITY_MAX);
	create_thread(i2c_sensor_thread, i2c_sensor_thread_stack, sizeof(i2c_sensor_thread_stack), PRIORITY_MAX);
	create_thread(adc_sensor_thread, adc_sensor_thread_stack, sizeof(adc_sensor_thread_stack), PRIORITY_MAX);

	while (get_key() == 0)
	{
		led_on(LED_0);
		timer_delay_ms(100);

		led_off(LED_0);
		timer_delay_ms(200);
	}

	while (1)
	{
		//user code here
	}
}
