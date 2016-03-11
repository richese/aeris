#ifndef _LOAD_CFG_H_
#define _LOAD_CFG_H_


#include "common.h"

#define SERVER_NAME_MAX_LENGTH  250

#define CFG_FILE_NAME	"../../config.txt"



i32 cfg_load(char *file_name);
u32 cfg_get_port();
char* cfg_get_server_name();

u64 cfg_get_id();
#endif