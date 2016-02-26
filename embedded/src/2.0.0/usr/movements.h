#ifndef _MOVEMENTS_H_
#define _MOVEMENTS_H_

#include "../lib_usr/lib_usr.h"

void go_forward(u32 time_ms, i32 speed, u8 (*term_function)());
void rotate_angle(i32 angle, u8 (*term_function)());



#endif
