#ifndef _DRV_8830_H_
#define _DRV_8830_H_

#include "../device/device.h"

#define MOTOR_SPEED_MAX   ((i32)63)

#define DRV8830_LEFT_ADDRESS      0xC0
#define DRV8830_RIGHT_ADDRESS     0xC2


#define DRV8830_CONTROLL          0x00
#define DRV8830_FAULT             0x01

void drv8830_init();
void motor_run(i32 left, i32 right);

#endif
