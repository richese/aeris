#ifndef _WIFI_H_
#define _WIFI_H_

#include "../device/device.h"

#include "s_packet.h"

#define WIFI_BUFFER_SIZE	(u32)128


#define WIFI_ENABLE_GPIO		GPIOA
#define WIFI_ENABLE_PIN			(1<<4)

#define WIFI_DEBUG	1

char g_server_ip[] = "192.168.2.6\0";
u32 g_server_port = 8000;

struct sWifi
{
	u32 state;
	u8 buffer[WIFI_BUFFER_SIZE];
	u32 server_port;
	char *server_ip;
};

struct sWifi g_wifi;

u32 wifi_init();

#endif
