#ifndef _TEST_H_
#define _TEST_H_

#include "../os/suzuha_os.h"
#include "../lib_usr/lib_usr.h"
#include "movements.h"


#define  LINE_WHITE     (u32)(0)
#define  LINE_RED       (u32)(1)
#define  LINE_GREEN     (u32)(2)
#define  LINE_BLUE      (u32)(3)


void sensor_test();
void imu_test();

void motors_test();

void go_forward_test();
void rotation_test();

void line_follower_test(u32 line_color);

#endif
