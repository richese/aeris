#ifndef _ERROR_H_
#define _ERROR_H_

#include "common.h"

i32 g_error_log_init(char *error_log_file_name);
i32 g_error_log_add(char *error_name, u32 error_code, i32 error_result);

#endif
