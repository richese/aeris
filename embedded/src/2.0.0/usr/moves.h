#ifndef _MOVES_H_
#define _MOVES_H_


#include "../os/suzuha_os.h"
#include "../lib_usr/lsm9ds0.h"
#include "../lib_usr/drv8830.h"

#include "robot_config.h"
#include "pid.h"

void move_go_forward(u32 speed, u32 time);
void move_rotate_robot(i32 angle);


#endif
