#include "load_cfg.h"



struct sCFG
{
	u32 port;
	u64 device_id;
	char server_name[SERVER_NAME_MAX_LENGTH + 1];
};

struct sCFG g_cfg;


unsigned long hash(unsigned char *str)
{
	unsigned long hash = 5381;
	int c;

	while ((c = *str++) != 0)
		hash = ((hash << 5) + hash) + c; /* hash * 33 + c */

	return hash;
}


i32 cfg_load(char *file_name)
{
	FILE *f;
	f = fopen(file_name, "r");

	if (f == NULL)
		return -1;

	i32 res;

	res = fscanf(f,"%s", g_cfg.server_name);
	if (res < 0)
		return -2;

	int port = 0;
	res = fscanf(f,"%i", &port);
	if (res < 0)
		return -3;

	g_cfg.port = port;

	fclose(f);

	g_cfg.device_id = hash((unsigned char*)g_cfg.server_name);
	g_cfg.device_id+= getpid();
	g_cfg.device_id+= get_ms_time()*1000000; 

	srand(g_cfg.device_id);

	return 1;
}


u32 cfg_get_port()
{
	return g_cfg.port;
}

char* cfg_get_server_name()
{
	return g_cfg.server_name;
}

u64 cfg_get_id()
{
	return g_cfg.device_id;
}