#include "usr_main.h"



void main_thread()
{
	printf_(OS_WELCOME_MESSAGE);

	timer_delay_ms(500);
	device_wake_up();

	create_thread(device_rgb_sensors_thread, device_rgb_sensors_thread_stack, sizeof(device_rgb_sensors_thread_stack), PRIORITY_MAX);
	create_thread(device_i2c_thread, device_i2c_thread_stack, sizeof(device_i2c_thread_stack), PRIORITY_MAX);
	create_thread(device_wifi_thread, device_wifi_thread_stack, sizeof(device_wifi_thread_stack), PRIORITY_MAX);

	timer_delay_ms(200);

	while (1)
	{
		while (get_key() == 0)
		{
			led_on(LED_0);
			timer_delay_ms(100);

			led_off(LED_0);
			timer_delay_ms(200);

			device_sleep();
		}

		device_wake_up();
		timer_delay_ms(200);


		//sensor_test();
		//motors_test();
		//imu_test();

		go_forward_test();
		//rotation_test();

		//your code here
	}
}
