#include "movements.h"

#define MOTOR_FORWARD_KP		0.5
#define MOTOR_FORWARD_KD		1.0
#define MOTOR_FORWARD_KS		0.01
#define MOTOR_ROTATE_KS		 0.05
#define MOTOR_ROTATE_KPOS	 0.60
#define MOTOR_ROTATE_KNEG	 0.55

void go_forward(u32 time_ms, i32 speed, u8 (*term_function)())
{
	time_t time_stop = timer_get_time() + time_ms;

	u32 dt = 10;

	float e0 = 0.0, e1 = 0.0;
	float yaw = 0.0;

	float speed_ = 0.0;

	float k;

	if (speed > 0)
		k = 1.0;
	else
		k = -1.0;

	while (timer_get_time() < time_stop)
	{
		event_timer_wait(EVENT_TIMER_0_ID);

		yaw+= (float)g_lsm9ds0_imu.gz_comp*(dt/1000.0)*0.0003; //*(90.0/272063.0);

		e1 = e0;
		e0 = 0.0 - yaw;

		float dif = MOTOR_FORWARD_KP*e0 + MOTOR_FORWARD_KD*(e0 - e1);

		if (dif > 1.0)
			dif = 1.0;
		if (dif < -1.0)
			dif = -1.0;

		if (speed_ < 1.0)
			speed_+= MOTOR_FORWARD_KS;

		g_motors.left = speed*speed_ + SPEED_MAX*dif*k;
		g_motors.right = speed*speed_ - SPEED_MAX*dif*k;

		if (term_function != NULL)
		{
			if (term_function() == 0)
				break;
		}
	}

	g_motors.left = 0;
	g_motors.right = 0;
	timer_delay_ms(100);
}

void rotate_angle(i32 angle, u8 (*term_function)())
{
	u32 dt = 10;

	float yaw = 0.0, angle_ = (angle*PI_)/180.0;
	float speed_ = 0.0;

	if (angle > 0)
		angle_*= MOTOR_ROTATE_KPOS;
	else
		angle_*= MOTOR_ROTATE_KNEG;

	while (yaw < m_abs(angle_))
	{
		event_timer_wait(EVENT_TIMER_0_ID);

		yaw+= m_abs((float)g_lsm9ds0_imu.gz_comp*(dt/1000.0)*0.0003); //*(90.0/272063.0);

		if (speed_ < 0.75)
			speed_+= MOTOR_ROTATE_KS;

		if (angle_ > 0.0)
		{
			g_motors.left = +SPEED_MAX*speed_;
			g_motors.right = -SPEED_MAX*speed_;
		}
		else
		{
			g_motors.left = -SPEED_MAX*speed_;
			g_motors.right = +SPEED_MAX*speed_;
		}

		if (term_function != NULL)
		{
			if (term_function() == 0)
				break;
		}
	}

	g_motors.left = 0;
	g_motors.right = 0;
	timer_delay_ms(100);
}
