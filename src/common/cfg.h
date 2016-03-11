#ifndef _CFG_H_
#define _CFG_H_

#include "common.h"


#define  POSITION_MAX_X   ((float)1155.0/2.0)
#define  POSITION_MAX_Y   ((float)650.0/2.0)
#define  POSITION_MAX_Z   ((float)0.0/2.0)

i32 cfg_init(char *cfg_file_name);

char* cfg_get_ip();
u32 cfg_get_server_port();
u32 cfg_get_server_id();
u32 cfg_get_unique_id();
float cfg_get_dt();

#endif
