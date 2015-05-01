#include "uart2.h"
#include "stm32f4xx_usart.h"


#define USART_2   USART2

void uart2_write(char c)
{
	while( !(USART_2->SR & 0x00000040) )
		__asm("nop");
	
	USART_2->DR = c;
}
 

char uart2_read()
{
	char res;

	while( !(USART_2->SR & USART_SR_RXNE) )
		__asm("nop");

	res = USART_2->DR;

    return res;
}

i16 uart2_read_nonblocking()
{
  char res;

  if  ((USART_2->SR & USART_SR_RXNE) == 0)
    return -1;

  res = USART_2->DR;

  return res;
}

void uart2_init()
{
  GPIO_InitTypeDef  GPIO_InitStructure;
  USART_InitTypeDef USART_InitStructure;

	RCC_APB2PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
 
  //Connect USART pins to A
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_3;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOA, &GPIO_InitStructure);
 
  GPIO_PinAFConfig(GPIOA, GPIO_PinSource2, GPIO_AF_USART2);
  GPIO_PinAFConfig(GPIOA, GPIO_PinSource3, GPIO_AF_USART2); 

  USART_InitStructure.USART_BaudRate = UART_BAUD_RATE;
  USART_InitStructure.USART_WordLength = USART_WordLength_8b;
  USART_InitStructure.USART_StopBits = USART_StopBits_1;
  USART_InitStructure.USART_Parity = USART_Parity_No;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
 
  USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
 
  USART_Init(USART_2, &USART_InitStructure);
  USART_Cmd(USART_2, ENABLE);
}
