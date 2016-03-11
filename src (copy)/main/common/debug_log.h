#ifndef _DEBUG_LOG_H_
#define _DEBUG_LOG_H_

#include "common.h"


i32 g_debug_log_init(char *debug_log_file_name);
i32 g_debug_log_add(char *source_name, char *message);

#endif
