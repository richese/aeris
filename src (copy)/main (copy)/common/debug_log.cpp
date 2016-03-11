#include "debug_log.h"


pthread_mutex_t g_debug_log_mutex;
char g_debug_log_file_name[1024];


i32 g_debug_log_init(char *debug_log_file_name)
{
  sprintf(g_debug_log_file_name, "%s", debug_log_file_name);

  i32 res = 0;
  FILE *g_debug_log_fd;

  g_debug_log_fd = fopen(g_debug_log_file_name,"a+");

  if (g_debug_log_fd == NULL)
    res = -1;
  else
    res = 0;

  fclose(g_debug_log_fd);

  pthread_mutex_init(&g_debug_log_mutex, NULL);

  return res;
}

i32 g_debug_log_add(char *source_name, char *message)
{
  i32 res = 0;
  pthread_mutex_lock(&g_debug_log_mutex);

  #if DEBUG_LOG_ENABLE == 1

  FILE *g_debug_log_fd;
  g_debug_log_fd = fopen(g_debug_log_file_name,"a+");

  if (g_debug_log_fd == NULL)
    res = -1;
  else
  {
    fprintf(g_debug_log_fd,"%s > %f > %s\n", source_name, get_ms_time(), message);
    fclose(g_debug_log_fd);

    #if DEBUG_LOG_PRINT_ENABLE == 1
    printf("%s > %f > %s\n", source_name, get_ms_time(), message);
    #endif

    res = 0;
  }

  #endif

  pthread_mutex_unlock(&g_debug_log_mutex);
  return res;
}
