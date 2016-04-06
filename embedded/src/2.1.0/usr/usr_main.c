#include "usr_main.h"



void main_thread()
{
	printf_(OS_WELCOME_MESSAGE);

	timer_delay_ms(500); //practical wait till thumb is out of reset
	device_wake_up();

	create_thread(device_rgb_sensors_thread, device_rgb_sensors_thread_stack, sizeof(device_rgb_sensors_thread_stack), PRIORITY_MAX);
	//line 48, 52, 53 commented wait for testing reasons
	create_thread(device_i2c_thread, device_i2c_thread_stack, sizeof(device_i2c_thread_stack), PRIORITY_MAX);
	create_thread(device_wifi_thread, device_wifi_thread_stack, sizeof(device_wifi_thread_stack), PRIORITY_MAX);

	timer_delay_ms(200); //practical to gyro setup wait

	rgb_set_background();

	while (1)
	{
		while (get_key() == 0)
		{
			//led_off(LED_0);
			led_on(LED_0);
			timer_delay_ms(100);

			led_off(LED_0);
			timer_delay_ms(200);

			device_sleep();
		}

		device_wake_up();
		timer_delay_ms(200);


		sensor_test();
		//motors_test();
		//imu_test();
		//go_forward_test();
		//rotation_test();


		//line_follower_test(LINE_RED);
		//line_follower_test(LINE_GREEN);
		//line_follower_test(LINE_BLUE);
		//your code here
		while (get_key() == 0)
		{
			rgb_get_line_position();
		}

	}
}
