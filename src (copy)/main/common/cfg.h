#ifndef _CFG_H_
#define _CFG_H_

#include "common.h"

i32 cfg_init(char *cfg_file_name);

char* cfg_get_ip();
u32 cfg_get_server_port();
u32 cfg_get_server_id();
u32 cfg_get_unique_id();


#endif
