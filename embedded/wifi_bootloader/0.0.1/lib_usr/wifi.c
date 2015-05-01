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
	uart2_init();
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
		}
	}
	while ( (ptr < (buffer_size-1) ) && (time_stop <= timer_get_time()) );

	buffer[ptr] = '\0';

	if (ptr >= buffer_size)
		return 1;
	
	if (time_stop > timer_get_time())
		return 2;

	return 0;
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


u32 wifi_init()
{
	u32 res;

	g_wifi.state = 0;

	printf_("initializing wifi\n");

	// WIFI_EN = 1;

	wifi_print_init();

	wifi_printf("AT+CWMODE=1\n");
	wifi_printf("AT+RST\n");

	res = wifi_get_response((char*)g_wifi.buffer, WIFI_BUFFER_SIZE, 3000);
	
	if (res == 0)
	{
		printf_("wifi : %s\n", g_wifi.buffer);
	}
	 

	wifi_printf("AT+CWJAP=\"%s\",\"%s\"\n", WIFI_SSID, WIFI_PASS);

	res = wifi_get_response((char*)g_wifi.buffer, WIFI_BUFFER_SIZE, 10000);
	
	if (res == 0)
	{
		printf_("wifi : %s\n", g_wifi.buffer);
	}


	//wifi_printf("AT+CIFSR");



	return 0;
}
