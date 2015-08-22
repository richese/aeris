#include "rgb_i2c.h"
#include "pca9548a.h"
#include "../device/stm32f4/lib_low_level/i2c/i2c.h"
 
#define RGB_I2C_DELAY_LOOPS 1

void rgb_i2c_delay()
{
    u32 loops = RGB_I2C_DELAY_LOOPS;
    while (loops--)
        __asm("nop"); 
} 

u16 g_rgb_all_mask;
 
void RGBSetLowSDA() 
{
    GPIO_InitTypeDef GPIO_InitStruct;

    GPIO_InitStruct.GPIO_Pin = g_rgb_all_mask&((1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)); 

    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
    GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
    GPIO_Init(GPIOC, &GPIO_InitStruct);

    //GPIOC->BRR = g_rgb_all_mask&((1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2));
    GPIO_ResetBits(GPIOC, g_rgb_all_mask&((1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)) );

    rgb_i2c_delay();
} 

void RGBSetHighSDA() 
{    
    GPIO_InitTypeDef GPIO_InitStruct; 

    GPIO_InitStruct.GPIO_Pin = g_rgb_all_mask&((1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)); 

    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
    //GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
    GPIO_Init(GPIOC, &GPIO_InitStruct);

    //GPIOC->BSRR = g_rgb_all_mask&((1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2));
    GPIO_SetBits(GPIOC, g_rgb_all_mask&((1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)) );

    rgb_i2c_delay(); 
} 

void RGBSetLowSCL() 
{   
    //GPIOD->BRR = 1<<RGB_SCL;
    GPIO_ResetBits(GPIOD, 1<<RGB_SCL);
    rgb_i2c_delay();
} 

void RGBSetHighSCL()
{
    //GPIOD->BSRR = 1<<RGB_SCL;
    GPIO_SetBits(GPIOD, 1<<RGB_SCL);
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
 
    GPIO_Init(GPIOD, &GPIO_InitStruct);


    GPIO_InitStruct.GPIO_Pin = g_rgb_all_mask&((1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)); 

    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
    GPIO_Init(GPIOC, &GPIO_InitStruct);

    GPIO_SetBits(GPIOC, g_rgb_all_mask&((1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)) );


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


/*parallel write to multiple targets with same i2c adress on same i2c bus*/
void rgb_i2cWrite(u8 a)
{
    u8  i;

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

/*parallel read from multiple SDA source on same i2c*/
void rgb_i2cRead(u8 ack, u8 *result)
{
    u32  i, j;

    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
    	result[i] = 0x00;

    RGBSetLowSCL();
    RGBSetHighSDA(); 

    //for i < 8 ???? 8bit data word
    for (i = 0; i < 8; i++)
    {
  	    for (j = 0; j < RGB_SENSORS_COUNT_TOP; j++)
	        result[j] = result[j] << 1;

        RGBSetHighSCL();

        u32 tmp = GPIOA->IDR;
        
        if (tmp&(1<<RGB_SDA_0))
            result[0]|= 1;

        if (tmp&(1<<RGB_SDA_1))
            result[1]|= 1; 

        if (tmp&(1<<RGB_SDA_2))
            result[2]|= 1;

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
    rgb_i2cWrite(dev_adr);  /*slave address, write command*/
    rgb_i2cWrite(reg_adr);  /*send reg address*/
    rgb_i2cWrite(value);
    rgb_i2cStop();
} 

void rgb_i2c_read_reg(u8 dev_adr, u8 reg_adr, u8 *res)
{  
    rgb_i2cStart();
    rgb_i2cWrite(dev_adr);  /*slave address, write command*/
    rgb_i2cWrite(reg_adr);  /*send reg address*/
    
    rgb_i2cStart();
    rgb_i2cWrite(dev_adr|0x01); /*slave address, read command*/
    rgb_i2cRead(0, res);   /*read data*/
    rgb_i2cStop();
} 

//doriesit nove indeovanie a inicializaciu rgb na inej i2c zbernici
void rgb_init(struct sRGBSensor *rgb)
{
	u32 i;

	for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
	{
		rgb[i].r = 0x00;
		rgb[i].g = 0x00;
		rgb[i].b = 0x00;

		rgb[i].proximity = 0x00;
		rgb[i].ambient = 0x00;
	}

    #ifdef I2C_SWITCH
    if (rgb[0].i2c_switch_adress)
    {
        /*set i2c switch to sensor adress on switch*/
        i2c_switch_set(rgb[0].i2c_switch_adress, 
                       rgb[0].sensor_adress_on_switch);
    }
    #endif


    g_rgb_all_mask = 0xffff;

	rgb_i2c_init();

	rgb_i2c_write_reg(rgb[0].sensor_adress, RGB_COMMAND|RGB_ATIME, 0xFF); 			/*2.4ms time*/
	rgb_i2c_write_reg(rgb[0].sensor_adress, RGB_COMMAND|RGB_WTIME, 0xFF); 			/*2.4ms time*/

	rgb_i2c_write_reg(rgb[0].sensor_adress, RGB_COMMAND|RGB_CONFIG, 0); 				/*dont wait long*/
    rgb_i2c_write_reg(rgb[0].sensor_adress, RGB_COMMAND|RGB_ENABLE, (1<<1)|(1<<0));  /*power on, RGBC enable*/


	/*
		proximity sensor setup
		100mA LED current
		use IR diode
		60x GAIN
	*/ 
	rgb_i2c_write_reg(rgb[0].sensor_adress, RGB_COMMAND|RGB_CONTROL, (1<<5)|(1<<0)|(1<<1));
 

    /*proximity enable*/
    RGBSetHighSDA();
    g_rgb_all_mask = 0x0000;
    rgb_i2c_write_reg(rgb[0].sensor_adress, RGB_COMMAND|RGB_ENABLE, (1<<2)|(1<<1)|(1<<0));  /*power on, RGBC enable*/

    rgb_i2c_write_reg(rgb[0].sensor_adress, RGB_COMMAND|RGB_PPULSE, 8);
    g_rgb_all_mask = 0xffff;    
} 

u8 rgb_raw[RGB_SENSORS_COUNT_TOP];

void rgb_read(struct sRGBSensor *rgb)
{
	/*TOP PARALLEL RGB SENSORS READ*/

    #ifdef I2C_SWITCH
    if (rgb[0].i2c_switch_adress)
    {
        /*set i2c switch to sensor adress on switch*/
        i2c_switch_set(rgb[0].i2c_switch_adress, 
                       rgb[0].sensor_adress_on_switch);
    }
    #endif


	u32 i;

    rgb_i2cStart();
    rgb_i2cWrite(rgb[0].sensor_adress);  
    rgb_i2cWrite(RGB_COMMAND|RGB_CDATAL|(1<<5));  
        
    rgb_i2cStart();
    rgb_i2cWrite(rgb[0].sensor_adress|0x01);  

    rgb_i2cRead(1, rgb_raw); 
    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
        rgb[i].ambient = rgb_raw[i];

    rgb_i2cRead(1, rgb_raw); 
    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
        rgb[i].ambient|= ((u16)rgb_raw[i])<<8;
    
    rgb_i2cRead(1, rgb_raw); 
    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
        rgb[i].r = rgb_raw[i];

    rgb_i2cRead(1, rgb_raw); 
    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
        rgb[i].r |= ((u16)rgb_raw[i])<<8;
    

    rgb_i2cRead(1, rgb_raw); 
    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
        rgb[i].g = rgb_raw[i];

    rgb_i2cRead(1, rgb_raw); 
    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
        rgb[i].g |= ((u16)rgb_raw[i])<<8;
        

    rgb_i2cRead(1, rgb_raw); 
    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
        rgb[i].b = rgb_raw[i];

    rgb_i2cRead(1, rgb_raw); 
    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
        rgb[i].b |= ((u16)rgb_raw[i])<<8;
    

    rgb_i2cRead(1, rgb_raw); 
    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
        rgb[i].proximity = rgb_raw[i];

    rgb_i2cRead(0, rgb_raw); 
    for (i = 0; i < RGB_SENSORS_COUNT_TOP; i++)
        rgb[i].proximity |= ((u16)rgb_raw[i])<<8;

    rgb_i2cStop();
}