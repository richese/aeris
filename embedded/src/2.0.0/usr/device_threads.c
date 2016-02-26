#include "device_threads.h"

volatile u8 device_sleep_flag = 0;


void device_sleep()
{
	device_sleep_flag = 0xff;
}

void device_wake_up()
{
	device_sleep_flag = 0;
}


void device_i2c_thread()
{
	u32 state = 0;
	u32 init_res;

 	event_timer_set_period(EVENT_TIMER_0_ID, I2C_SAMPLIG_PERIOD);

 	while (1)
 	{
		switch (state)
		{
			//init state
			case 0:
							motors_init();
							init_res = lsm9ds0_init();					/*IMU*/

							if (init_res != 0)
							{
								lsm9ds0_uninit();
								motors_uninit();
								abort_error_(ERROR_IMU, init_res);	/*init IMU error*/
							}

							state = 1;
							break;

			//common reading mode
			case 1:
							event_timer_wait(EVENT_TIMER_0_ID);
							lsm9ds0_read();
							motors_update();

							if (device_sleep_flag)
								state = 2;
							break;

			//sleep mode
			case 2:
							lsm9ds0_uninit();
							motors_uninit();

							timer_delay_ms(100);

							if (device_sleep_flag == 0)
								state = 0;
							break;
		}
 	}
}

void device_rgb_sensors_thread()
{
	u32 state = 0;
	u32 init_res;

	event_timer_set_period(EVENT_TIMER_1_ID, RGB_SAMPLIG_PERIOD);

	while (1)
	{
		event_timer_wait(EVENT_TIMER_1_ID);
		rgb_sensor_read();


		switch (state)
		{
			//init state
			case 0:
							init_res = rgb_sensor_init();							/*RGB init*/
							if (init_res != 0)
							{
								rgb_sensor_uninit();
								abort_error_(ERROR_RGB_SENSOR, init_res);	/*rgb sensors init error*/
							}
							state = 1;
							break;

			//common reading mode
			case 1:
							event_timer_wait(EVENT_TIMER_1_ID);
							rgb_sensor_read();

							if (device_sleep_flag != 0)
								state = 2;
							break;

			//sleep mode
			case 2:
							rgb_sensor_uninit();

							timer_delay_ms(100);

							if (device_sleep_flag == 0)
								state = 0;
							break;
		}
	}
}


#define RX_BUFFER_LENGTH 	128


void device_wifi_thread()
{
	u32 state = 0;
	u32 init_res;

	char tx_buffer[] = "esp8266 message";
	u32 tx_buffer_length = strlen_(tx_buffer);
	char rx_buffer[RX_BUFFER_LENGTH];


	while (1)
	{
		switch (state)
		{
			//init state
			case 0:
							led_on(WIFI_RST);
							init_res = esp8266_init(0);
							if (init_res != ESP8266_SUCCESS)
							{
								esp8266_uninit();
								abort_error_(ERROR_WIFI, init_res);	/*init WIFI error*/
							}

							state = 1;
							break;

			//common mode
			case 1:
		  				 esp8266_connect(WIFI_SERVER_IP, WIFI_TERMINAL_PORT,
																			tx_buffer,
																			tx_buffer_length,
																			rx_buffer,
																			RX_BUFFER_LENGTH);

						//	if (device_sleep_flag)
							//	state = 2;
							break;

			//sleep mode
			case 2:
							esp8266_uninit();

							timer_delay_ms(100);

							if (device_sleep_flag == 0)
								state = 0;
							break;
		}
	}
}
