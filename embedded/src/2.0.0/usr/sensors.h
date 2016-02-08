#ifndef _SENSORS_H_
#define _SENSORS_H_

#include "error.h"

#include "../lib_usr/lsm9ds0.h"
#include "../lib_usr/rgb_sensor.h"
#include "../lib_usr/adc_sensor.h"

#define SENSOR_THREAD_STACK_SIZE  128

#define RGB_SAMPLIG_PERIOD		   (u32)4
#define I2C_SAMPLIG_PERIOD	     (u32)10
#define ADC_SAMPLIG_PERIOD	     (u32)100

thread_stack_t i2c_sensor_thread_stack[SENSOR_THREAD_STACK_SIZE];
thread_stack_t rgb_sensor_thread_stack[SENSOR_THREAD_STACK_SIZE];
thread_stack_t adc_sensor_thread_stack[SENSOR_THREAD_STACK_SIZE];

void rgb_sensor_thread();
void i2c_sensor_thread();
void adc_sensor_thread();


#endif
