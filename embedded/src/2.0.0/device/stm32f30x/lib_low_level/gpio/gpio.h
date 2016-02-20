#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"
#include "stm32f30x_gpio.h"


//GPIOB PB15, green led
#define LED_0		((u32)(1<<15))
#define LED_G		(LED_0)

//GPIOA PA3, white leds
#define LED_1		((u32)(1<<3))
#define LED_W		(LED_1)


//GPIOA PA0, wifi RST
#define WIFI_RST ((u32)(1<<0))

//key on PB9
#define KEY 		(1<<9)


void gpio_init();
void led_on(u32 led);
void led_off(u32 led);
u32 get_key();

#endif
