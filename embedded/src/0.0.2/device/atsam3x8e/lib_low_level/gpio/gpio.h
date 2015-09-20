#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"

/*on PIOB */
#define LED_G_PIO	PIOB
#define LED_G		(1<<27)

#define LED_0		(LED_G)
#define LED_1		(LED_G)


void gpio_init();
void led_on(u32 led);
void led_off(u32 led);


u32 get_key();

#endif