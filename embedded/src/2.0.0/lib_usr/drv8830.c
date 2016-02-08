#include "drv8830.h"


void drv8830_init()
{
  motor_run(0, 0);
}

void motor_run(i32 left, i32 right)
{
  u8 bl = 0, br = 0;

  if (left > MOTOR_SPEED_MAX)
    left = MOTOR_SPEED_MAX;

  if (left < -MOTOR_SPEED_MAX)
    left = -MOTOR_SPEED_MAX;

  if (left == 0)
  {
    bl = (1<<0)|(1<<1);
  }

  if (left < 0)
  {
    left= -left;
    bl = (1<<0);
  }

  if (left > 0)
  {
    bl = (1<<1);
  }

  if (left < 0x05)
    left = 0x05;

  bl|= (left<<2);





  if (right > MOTOR_SPEED_MAX)
    right = MOTOR_SPEED_MAX;

  if (right < -MOTOR_SPEED_MAX)
    right = -MOTOR_SPEED_MAX;

  if (right == 0)
  {
    br = (1<<0)|(1<<1);   
  }

  if (right < 0)
  {
    right= -right;
    br = (1<<0);
  }

  if (right > 0)
  {
    br = (1<<1);
  }

  if (right < 0x05)
    right = 0x05;

  br|= (right<<2);

  i2c_write_reg(DRV8830_LEFT_ADDRESS, DRV8830_CONTROLL, bl);
  i2c_write_reg(DRV8830_RIGHT_ADDRESS, DRV8830_CONTROLL, br);
}
