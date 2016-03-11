#include "error_log.h"

pthread_mutex_t g_error_log_mutex;
char g_error_log_file_name[1024];


i32 g_error_log_init(char *error_log_file_name)
{
  sprintf(g_error_log_file_name, "%s", error_log_file_name);

  i32 res = 0;
  FILE *g_error_log_fd;

  g_error_log_fd = fopen(g_error_log_file_name,"a+");

  if (g_error_log_fd == NULL)
    res = -1;
  else
    res = 0;

  fclose(g_error_log_fd);

  pthread_mutex_init(&g_error_log_mutex, NULL);

  return res;
}


i32 g_error_log_add(char *error_name, u32 error_code, i32 error_result)
{
  pthread_mutex_lock(&g_error_log_mutex);
  i32 res = 0;

  #if ERROR_LOG_ENABLE == 1

  FILE *g_error_log_fd;
  g_error_log_fd = fopen(g_error_log_file_name,"a+");

  if (g_error_log_fd == NULL)
    res = -1;
  else
  {
    fprintf(g_error_log_fd,"%s > %f > %u %i\n", error_name, get_ms_time(), error_code, error_result);
    fclose(g_error_log_fd);

    #if ERROR_LOG_PRINT_ENABLE
    printf("ERROR : %s > %f > %u %i\n", error_name, get_ms_time(), error_code, error_result);
    #endif

    res = 0;
  }

  #endif

  pthread_mutex_unlock(&g_error_log_mutex);
  return res;
}
