#ifndef _ADC_SENSOR_H_
#define _ADC_SENSOR_H_

#include "../device/device.h"


struct sADCsensor
{
  i32 bat_voltage, charging_state, front_sensor;
};

struct sADCsensor g_adc;

//GPIOA
#define ADC_FRONT_SENSOR          1

//GPIOA
#define ADC_BAT_VOLTAGE_SENSOR    8

//GPIOB
#define ADC_CHARGING_SENSOR       0


u32 adc_sensor_init();
void adc_sensor_read();


#endif
