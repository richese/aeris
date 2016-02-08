#include "adc_sensor.h"

/*
//GPIOA
#define ADC_FRONT_SENSOR          1

//GPIOA
#define ADC_BAT_VOLTAGE_SENSOR    8

//GPIOB
#define ADC_CHARGING_SENSOR       0

*/

u32 adc_sensor_init()
{
  g_adc.bat_voltage = 0;
  g_adc.charging_state = 0;
  g_adc.front_sensor = 0;


/*
  ADC_InitTypeDef       ADC_InitStructure;
  GPIO_InitTypeDef      GPIO_InitStructure;

  GPIO_InitStructure.GPIO_Pin = 	ADC1_CH;

  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL ;
  GPIO_Init( GPIOA, &GPIO_InitStructure );

  RCC_ADCCLKConfig(RCC_ADC12PLLCLK_Div2);
  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_ADC12, ENABLE);

  RCC_ADCCLKConfig(RCC_ADC34PLLCLK_Div2);
  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_ADC34, ENABLE);

  ADC_InitStructure.ADC_AutoInjMode = ADC_AutoInjec_Disable;
  ADC_InitStructure.ADC_ContinuousConvMode = ADC_ContinuousConvMode_Disable;
  ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
  ADC_InitStructure.ADC_ExternalTrigConvEvent = ADC_ExternalTrigConvEvent_0;
  ADC_InitStructure.ADC_ExternalTrigEventEdge = ADC_ExternalTrigInjecEventEdge_None;
  ADC_InitStructure.ADC_NbrOfRegChannel = 1;
  ADC_InitStructure.ADC_OverrunMode = ADC_OverrunMode_Disable;
  ADC_InitStructure.ADC_Resolution = ADC_Resolution_12b;

  ADC_Init(ADC1, &ADC_InitStructure);
  ADC_Init(ADC2, &ADC_InitStructure);
  ADC_Init(ADC3, &ADC_InitStructure);


  ADC_RegularChannelConfig(ADC1, ADC_Channel_1, 1,  ADC_SampleTime_1Cycles5);
  ADC_RegularChannelConfig(ADC2, ADC_Channel_1, 1,  ADC_SampleTime_1Cycles5);
  ADC_RegularChannelConfig(ADC3, ADC_Channel_13, 1,  ADC_SampleTime_1Cycles5);


  ADC_Cmd(ADC1, ENABLE);
  ADC_Cmd(ADC2, ENABLE);
  ADC_Cmd(ADC3, ENABLE);
*/



  adc_sensor_read();
  return 0;
}

void adc_sensor_read()
{

}
