#include "test.h"


void sensor_test()
{
	while (1)
	{
		led_on(LED_0);

		printf_("LSM9DS0 : ");
		#ifdef USE_LSM9DS0
		printf_("%i %i %i , ", g_lsm9ds0_imu.gx, g_lsm9ds0_imu.gy, g_lsm9ds0_imu.gz);
		printf_("%i %i %i , ", g_lsm9ds0_imu.mx, g_lsm9ds0_imu.my, g_lsm9ds0_imu.mz);
		printf_("%i %i %i", g_lsm9ds0_imu.ax, g_lsm9ds0_imu.ay, g_lsm9ds0_imu.az);
		printf_("\n");
		#else
		printf_("not present\n");
		#endif

		printf_("\n");
		led_off(LED_0);
		timer_delay_ms(200);
	}
}

void rgb_sensor_test()
{
	u32 i;
	while (1)
	{
    led_on(LED_0);

		for (i = 0; i < RGB_SENSORS_COUNT; i++)
			printf_("%u ", g_rgb.ambient[i]);
		printf_("\n");

		for (i = 0; i < RGB_SENSORS_COUNT; i++)
			printf_("%u ", g_rgb.r[i]);
		printf_("\n");

		for (i = 0; i < RGB_SENSORS_COUNT; i++)
			printf_("%u ", g_rgb.g[i]);
		printf_("\n");

		for (i = 0; i < RGB_SENSORS_COUNT; i++)
			printf_("%u ", g_rgb.b[i]);
		printf_("\n");

		for (i = 0; i < RGB_SENSORS_COUNT; i++)
			printf_("%u ", g_rgb.proximity[i]);
		printf_("\n");

		printf_("\n");

		led_off(LED_0);
		timer_delay_ms(200);
	}
}


void motor_test()
{
	drv8834_run(30, 30);
	timer_delay_ms(1000);

	drv8834_run(-30, -30);
	timer_delay_ms(1000);

	drv8834_run(0, 0);
	timer_delay_ms(1000);
}

void rotation_test()
{
	i32 angle = 90;

	obstacle_rotate_robot(-angle);
	obstacle_rotate_robot(-angle);

	timer_delay_ms(500);

	obstacle_rotate_robot(angle);
	obstacle_rotate_robot(angle);

	timer_delay_ms(500);
}


void imu_test()
{
	float roll = 0.0;
	float pitch = 0.0;
	float yaw = 0.0, yaw_ofs = 0.0;;

	u32 dt = 10;

	u32 i, max = 100;
	for (i = 0; i < max; i++)
	{
		yaw_ofs+= g_lsm9ds0_imu.gz;
		timer_delay_ms(dt);
	}

	yaw_ofs/= max;

	while (1)
	{
		led_on(LED_0);

		roll = m_atan2(g_lsm9ds0_imu.ay, m_sqrt(g_lsm9ds0_imu.ax*g_lsm9ds0_imu.ax + g_lsm9ds0_imu.az*g_lsm9ds0_imu.az));
		pitch = m_atan2(g_lsm9ds0_imu.ax, m_sqrt(g_lsm9ds0_imu.ay*g_lsm9ds0_imu.ay + g_lsm9ds0_imu.az*g_lsm9ds0_imu.az));
		yaw+= (g_lsm9ds0_imu.gz - yaw_ofs)*(dt/1000.0)*0.0003; //*(90.0/272063.0);

		printf_("%i %i %i\n", (i32)(roll*180.0/PI_), (i32)(pitch*180.0/PI_), (i32)(yaw*180.0/PI_) );

		led_off(LED_0);

		timer_delay_ms(dt);
	}
}
