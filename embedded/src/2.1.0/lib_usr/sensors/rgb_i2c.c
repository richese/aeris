#include "rgb_i2c.h"

#define RGB_I2C_DELAY_LOOPS 1

void rgb_i2c_delay()
{
	u32 loops = RGB_I2C_DELAY_LOOPS;
	while (loops--)
		__asm("nop");
}

void RGBSetLowSDA()
{
	GPIO_InitTypeDef GPIO_InitStruct;

	GPIO_InitStruct.GPIO_Pin = (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3);

	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
	GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
	GPIO_Init(GPIOA, &GPIO_InitStruct);

	GPIOA->BRR = (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3);


	rgb_i2c_delay();
}

void RGBSetHighSDA()
{
	GPIO_InitTypeDef GPIO_InitStruct;

	GPIO_InitStruct.GPIO_Pin = (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3);

	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
	//GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
	GPIO_Init(GPIOA, &GPIO_InitStruct);

	GPIOA->BSRR = (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3);

	rgb_i2c_delay();
}

void RGBSetLowSCL()
{
	GPIOC->BRR = 1<<RGB_SCL;
	rgb_i2c_delay();
}

void RGBSetHighSCL()
{
	GPIOC->BSRR = 1<<RGB_SCL;
	rgb_i2c_delay();
}

void rgb_i2c_init()
{
	GPIO_InitTypeDef GPIO_InitStruct;

	GPIO_InitStruct.GPIO_Pin = (1<<RGB_SCL);
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP; // this sets the pin type to open drain
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor

	GPIO_Init(GPIOC, &GPIO_InitStruct);


	GPIO_InitStruct.GPIO_Pin = (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3);

	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
	GPIO_Init(GPIOA, &GPIO_InitStruct);

	GPIO_SetBits(GPIOA, (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3) );

	RGBSetHighSCL();
	RGBSetLowSDA();
	RGBSetHighSDA();
}



void rgb_i2cStart()
{
	RGBSetHighSCL();
	RGBSetHighSDA();

	RGBSetHighSCL();
	RGBSetLowSDA();

	RGBSetLowSCL();
	RGBSetHighSDA();
}


void rgb_i2cStop()
{
	RGBSetLowSCL();
	RGBSetLowSDA();

	RGBSetHighSCL();
	RGBSetLowSDA();

	RGBSetHighSCL();
	RGBSetHighSDA();
}



void rgb_i2cWrite(u8 a)
{
	u8	i;

	for (i=0; i<8; i++)
	{
		RGBSetLowSCL();

		if (a & 0x80)
			RGBSetHighSDA();
		else
			RGBSetLowSDA();

		RGBSetHighSCL();
		a <<= 1;
	}

	RGBSetLowSCL();
	RGBSetHighSDA();
	RGBSetHighSCL();

	RGBSetLowSCL();

	rgb_i2c_delay();
}


void rgb_i2cRead(u8 ack, u8 *result)
{
	u32	i, j;

	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		result[i] = 0x00;

	RGBSetLowSCL();
	RGBSetHighSDA();

	for (i = 0; i < 8; i++)
	{
		for (j = 0; j < RGB_SENSORS_COUNT; j++)
			result[j] = result[j] << 1;

		RGBSetHighSCL();

		u32 tmp = GPIOA->IDR;

		if (tmp&(1<<RGB_SDA_0))
			result[0]|= 1;

		if (tmp&(1<<RGB_SDA_1))
			result[1]|= 1;

		if (tmp&(1<<RGB_SDA_2))
			result[2]|= 1;

		if (tmp&(1<<RGB_SDA_3))
			result[3]|= 1;

		RGBSetLowSCL();
	}

	if (ack)
	{
		RGBSetLowSDA();
	}

	RGBSetHighSCL();
	RGBSetLowSCL();

	rgb_i2c_delay();
}


void rgb_i2c_write_reg(u8 dev_adr, u8 reg_adr, u8 value)
{
	rgb_i2cStart();
	rgb_i2cWrite(dev_adr);	/*slave address, write command*/
	rgb_i2cWrite(reg_adr);	/*send reg address*/
	rgb_i2cWrite(value);
	rgb_i2cStop();
}

void rgb_i2c_read_reg(u8 dev_adr, u8 reg_adr, u8 *res)
{
	rgb_i2cStart();
	rgb_i2cWrite(dev_adr);	/*slave address, write command*/
	rgb_i2cWrite(reg_adr);	/*send reg address*/

	rgb_i2cStart();
	rgb_i2cWrite(dev_adr|0x01); /*slave address, read command*/
	rgb_i2cRead(0, res);	 /*read data*/
	rgb_i2cStop();
}
