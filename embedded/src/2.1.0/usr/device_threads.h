#ifndef _DEVICE_THREADS_H_
#define _DEVICE_THREADS_H_

#include "error.h"

#include "../lib_usr/lib_usr.h"

#define I2C_SAMPLIG_PERIOD    (u32)10
#define RGB_SAMPLIG_PERIOD    (u32)10

#define SENSOR_THREAD_STACK_SIZE  128

thread_stack_t device_i2c_thread_stack[SENSOR_THREAD_STACK_SIZE];
thread_stack_t device_rgb_sensors_thread_stack[SENSOR_THREAD_STACK_SIZE];
thread_stack_t device_wifi_thread_stack[SENSOR_THREAD_STACK_SIZE];

void device_sleep();
void device_wake_up();

void device_i2c_thread();
void device_rgb_sensors_thread();

void device_wifi_thread();


#endif
