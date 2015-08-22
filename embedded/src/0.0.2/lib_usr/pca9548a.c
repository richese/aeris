#include "pca9548a.h"

void i2c_switch_init()
{
	//PB1 reset pin
	GPIO_InitTypeDef GPIO_InitStruct; 

    GPIO_InitStruct.GPIO_Pin = (1<<I2C_RESET_PIN); 

    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
    //GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
    GPIO_InitStruct.GPIO_PuPd = GPIO_OType_PP; // this disables resistor
    GPIO_Init(GPIOB, &GPIO_InitStruct);

    //GPIOB->BSRR = (1<<I2C_RESET_PIN);
    GPIO_SetBits(GPIOB, (1<<I2C_RESET_PIN));

    i2c_switch_reset();
}

u32 i2c_switch_set(u8 i2c_switch_adr,
				   u8 sensor_adress_on_switch)
{
	i2cStart();
	i2cWrite(i2c_switch_adr);
	i2cWrite(sensor_adress_on_switch);
	i2cStop();
	return (0);
}

void i2c_switch_reset()
{
	//GPIOB->BRR = (1<<I2C_RESET_PIN);
	GPIO_ResetBits(GPIOB, (1<<I2C_RESET_PIN));
	/*delay atleast 4ns*/
	u32 i = 10;
	while(i--)
	{
		__asm("nop");
	}
	//GPIOB->BSRR = (1<<I2C_RESET_PIN);
	GPIO_SetBits(GPIOB, (1<<I2C_RESET_PIN));

  //PB1 low on pin, reset time min 4ns
}

u8 i2c_switch_read_status()
{
	i2cStart();
	i2cWrite(I2C_SWITCH_ADR);
	u8 res = i2cRead(0);
	i2cStop();
	return (res);
}