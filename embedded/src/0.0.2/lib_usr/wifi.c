#include "wifi.h"

#include "stdarg.h"


#define WIFI_SSID		"disconnected"
#define WIFI_PASS		"veryhard"


//#define WIFI_CONNECT "AT+CWJAP="disconnected","veryhard""
/*

AT+CIPSTART="TCP","192.168.2.2", 8000

AT+CIPSTART="TCP","root.cz", 80

AT+CIPCLOSE


AT+CIFSR

AT+CIPSTART=4,"TCP","google.com", 80
*/



void wifi_print_init()
{
	uart2_init(9600);
	timer_delay_ms(100);
}



unsigned int wifi_strlen_(char *s)
{
	unsigned int len = 0;
	while (s[len] != '\0')
		len++;
	return len;
}

void wifi_putc_(char c)
{
	uart2_write(c);
}

char wifi_getc_()
{
	char res = uart2_read();

	return res;
}

i16 wifi_getc_nonblocking()
{
	i16 res = uart2_read_nonblocking();

	return res;
}

void wifi_puts_(char *s)
{
	u32 ptr = 0;
	
	while (s[ptr]!='\0')
	{
		wifi_putc_(s[ptr]);
		ptr++;
	}

}


/*print signed int number*/
void wifi_puti_(i32 n)
{
	char flag = 0, s[12];
	u32 ptr;

	if (n < 0)
 	{
  		n = -n;
		flag = 1;
	}

	s[11] = '\0';
	ptr = 10;
	
	do
	{
    	s[ptr] = '0' + (n%10);
    	n/= 10;
    	ptr--;	
	} 
    while (n != 0); 
 
	if (flag)
		s[ptr] = '-';
	else
		ptr++;

	wifi_puts_(s + ptr);
}


/*print unsigned int number*/
void wifi_putui_(u32 n)
{
	char s[12];
	u32 ptr;

	s[11] = '\0';
	ptr = 10;

	do
	{
    	s[ptr] = '0' + (n%10);
    	n/= 10;
    	ptr--;	
	} 
    while (n != 0); 

	ptr++;
	wifi_puts_(s + ptr);
}



/*print unsigned int as hex*/
void wifi_putx_(u32 n)
{
	char s[12];
	u8 tmp;
	u32 ptr;

	s[11] = '\0';
	ptr = 10;
 
	do
	{
    	tmp=n&0x0F;		/*modulo 16*/
    	if (tmp < 10)	
     		s[ptr] = '0' + tmp;
    	else
     		s[ptr] = 'a' + tmp - 10;

    	n>>= 4;		/*div 16*/
    	ptr--;	
   	} 
    while (n != 0); 
	
	ptr++;
 	wifi_puts_(s + ptr);
}


/*
 print formated string
 know formats : %i, %u, %x, %c, %s
*/
void wifi_printf(char *s, ...)
{
	unsigned int s_ptr;

	va_list args;				/*begin stack working*/
	va_start(args,s);
	s_ptr = 0;

	while (s[s_ptr] != '\0')			/*scan string*/
 	{
		if (s[s_ptr] != '%')
		{
			wifi_putc_(s[s_ptr]);			/*if no % print char*/
			s_ptr++;
   		}
		else
		{					/*switch %? argumet*/
	    	s_ptr++;
							/*print correct argument, get value from stack : va_arg*/
	    
	    	switch (s[s_ptr])
	    	{					
	     		case 'i': wifi_puti_(va_arg(args, int)); break;	
	     		case 'u': wifi_putui_(va_arg(args, int)); break;
	     		case 'x': wifi_putx_(va_arg(args, int)); break;
	     		case 'c': wifi_putc_(va_arg(args, int)); break;		/*yeah, stack is 32bit alligment, dont take char or u16*/
	     		case 's': wifi_puts_((char*)va_arg(args, int)); break; 
	     		case '%': wifi_putc_('%'); break;
	    	}
		
			s_ptr++;	
	   	}
	}

	va_end(args);				/*stack working end*/
}


u32 wifi_get_response(char *buffer, u32 buffer_size, u32 time_out)
{
	u32 ptr = 0;

	time_t time_stop = timer_get_time() + time_out;

	do
	{
		i16 c = wifi_getc_nonblocking();

		if (c != -1)
		{
			buffer[ptr] = c;
			ptr++;
			if ((c == '\n') || (c == '\0'))
				break;
		}
	}
	while ( (ptr < (buffer_size-1) ) && (time_stop >= timer_get_time()));

	buffer[ptr] = '\0';

	if (ptr >= (buffer_size-1))
		return 1;
	
	if (time_stop < timer_get_time())
		return 2;

	return 0;
}

u32 wifi_wait_for_response(char *response_str, u32 time_out)
{
	u32 ptr = 0;

	time_t time_stop = timer_get_time() + time_out;

	do
	{
		i16 c = wifi_getc_nonblocking();

		if (c != -1)
		{
			if (response_str[ptr] == c)
				ptr++;
			else
				ptr = 0;			

			if (response_str[ptr] == '\0')
				return 0;
		}
	}
	while (time_stop >= timer_get_time());

	return 1;
}


u32 wifi_str_compare(char *sa, char *sb)
{
	u32 i;

	i = 0;
	while ((sa[i] != '\0') && (sb[i] != '\0'))
	{
		if (sa[i] != sb[i])
			return 0;
		i++;
	}

	if ((sa[i] == '\0') && (sb[i] == '\0'))
		return 1;

	return 0;
}


/*
AT+RST
AT+CWMODE=1
AT+CWJAP="disconnected","veryhard"


AT+CIPSTART="TCP","192.168.2.6",8000
AT+CIPSEND=16
SOMEDATA1234
AT+CIPCLOSE
*/

u32 wifi_open(char *domain, u32 port, u32 time_out)
{
	u32 res;

	wifi_printf("AT+CIPSTART=\"TCP\",\"%s\",%u\n\r", domain, port);

	res = wifi_wait_for_response("OK", time_out);
	if (res != 0)
	{
		wifi_printf("AT+CIPCLOSE\n\r");
		return 1;
	}

	return 0;
}

u32 wifi_close(u32 time_out)
{
	u32 res;

	wifi_printf("AT+CIPCLOSE\n\r");

	res = wifi_wait_for_response("OK", time_out);
	if (res != 0)
	{
		return 1;
	}

	return 0;
}

u32 wifi_send_packet(u8 *tx_buffer, u32 tx_buffer_length, u8 *rx_buffer, u32 rx_buffer_length, u32 time_out)
{
	u32 i, res;

	wifi_printf("AT+CIPSEND=%u\n\r", tx_buffer_length);
	res = wifi_wait_for_response(">", time_out);
	if (res != 0)
	{
		return 2;
	}

	for (i = 0; i < tx_buffer_length; i++)
		wifi_putc_(tx_buffer[i]);

	res = wifi_wait_for_response("OK", time_out);
	if (res != 0)
	{
		return 3;
	}

	// +IPD,19:
	res = wifi_wait_for_response("+IPD", time_out);
	if (res != 0)
	{
		return 4;
	}

	res = wifi_wait_for_response(":", time_out);
	if (res != 0)
	{
		return 5;
	}


	time_t time_stop = timer_get_time() + time_out;

	u32 ptr = 0;
	do
	{
		i16 c = wifi_getc_nonblocking();

		if (c != -1)
		{
			rx_buffer[ptr] = c;
			ptr++;

			if ((ptr >= rx_buffer_length) || (c == '\n'))
				break;
		}
	}
	while (time_stop >= timer_get_time());

	if (time_stop < timer_get_time())
		res = 6;
	else
		res = 0;


	return res;
}

u8 rx_buffer[32];


u32 wifi_init()
{
	u32 res;

	g_wifi.state = 0;
	g_wifi.server_ip = g_server_ip;
	g_wifi.server_port = g_server_port;


	#ifdef WIFI_DEBUG
	printf_("initializing wifi\n");
	#endif

	GPIO_InitTypeDef  GPIO_InitStructure;

	GPIO_InitStructure.GPIO_Pin = WIFI_ENABLE_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(WIFI_ENABLE_GPIO, &GPIO_InitStructure);
	WIFI_ENABLE_GPIO->BSRRH = WIFI_ENABLE_PIN;

	timer_delay_ms(100);
	wifi_print_init();

	WIFI_ENABLE_GPIO->BSRRL = WIFI_ENABLE_PIN;
	timer_delay_ms(1000);


	wifi_printf("AT+RST\n");
	res = wifi_wait_for_response("OK", 1000);

	if (res != 0)
	{
		#ifdef WIFI_DEBUG
		printf_("reseting wifi error\n");
		#endif

		return 1;
	} 

	timer_delay_ms(2000);

	wifi_printf("AT+CWMODE=1\n\r");
	res = wifi_wait_for_response("OK", 200);

	if (res != 0)
	{
		#ifdef WIFI_DEBUG
		printf_("setting wifi error\n");
		#endif

		return 2;
	}

	/*
	wifi_printf("AT+CIPMUX=1\n\r");
	res = wifi_wait_for_response("OK", 2000);
	*/


	//AT+CWJAP="disconnected","veryhard"
	wifi_printf("AT+CWJAP=\"%s\",\"%s\"\n\r", WIFI_SSID, WIFI_PASS);
	res = wifi_wait_for_response("OK", 25000);

	if (res != 0)
	{
		#ifdef WIFI_DEBUG
		printf_("connecting to \"%s\" error\n", WIFI_SSID);
		#endif

		return 3;
	}


	#ifdef WIFI_DEBUG
	printf_("sucess connected to \"%s\" \n", WIFI_SSID);
	#endif

	while (1)
	{
		u8 tx_buffer[] = "some text to server\n";

		res = wifi_open(g_wifi.server_ip, g_wifi.server_port, 300);

		if (res == 0)
			res = wifi_send_packet(tx_buffer, wifi_strlen_((char*)tx_buffer), rx_buffer, 32, 500);

		wifi_close(50);


		printf_("request sended with %u\n", res);
		if (res == 0)
		{
			u32 i;
			printf_("received data :>");
			for (i = 0; i < 32; i++)
				putc_(rx_buffer[i]);
			printf_("<\n");
		}

		timer_delay_ms(1000);
	}
		 
	return 0;
}
