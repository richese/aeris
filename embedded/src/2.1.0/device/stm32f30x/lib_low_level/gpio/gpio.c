#include "gpio.h"


void gpio_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOC, ENABLE);


	GPIO_InitStructure.GPIO_Pin = LED_0;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(GPIOB, &GPIO_InitStructure);


  GPIO_InitStructure.GPIO_Pin = LED_1;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(GPIOA, &GPIO_InitStructure);


	GPIO_InitStructure.GPIO_Pin = WIFI_RST;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(GPIOA, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = KEY;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(GPIOB, &GPIO_InitStructure);

	led_on(LED_0);
  led_off(LED_1);
	led_off(WIFI_RST);

	u32 loops = 10000;
	while (loops--)
		__asm("nop");
	led_on(WIFI_RST);
}

void led_on(u32 led)
{
  //green led on
	if (led&LED_0)
		GPIOB->BSRR = LED_0;

  //white led on
  if (led&LED_1)
  	GPIOA->BRR = LED_1;

	//wifi rst to one
	if (led&WIFI_RST)
		GPIOA->BSRR = WIFI_RST;
}

void led_off(u32 led)
{
  //green led off
	if (led&LED_0)
		GPIOB->BRR = LED_0;

  //white led off
  if (led&LED_1)
  	GPIOA->BSRR = LED_1;

	//wifi rst to zero
	if (led&WIFI_RST)
		GPIOA->BRR = WIFI_RST;
}

u32 get_key()
{
	return (~GPIOB->IDR)&KEY;
}
