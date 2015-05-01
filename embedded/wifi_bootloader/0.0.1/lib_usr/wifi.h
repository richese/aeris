#ifndef _WIFI_H_
#define _WIFI_H_

#include "../device/device.h"

#include "s_packet.h"

#define WIFI_BUFFER_SIZE	(u32)128

struct sWifi
{
	u32 state;
	u8 buffer[WIFI_BUFFER_SIZE];
};

struct sWifi g_wifi;

u32 wifi_init();

#endif
