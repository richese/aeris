#include "../common/common.h"

int main()
{
  if ( g_debug_log_init((char*)"debug_log.txt") != 0)
  {
    printf("debug log opening error\n");
    return -1;
  }

  if (g_error_log_init((char*)"error_log.txt") != 0)
  {
    printf("error log opening error\n");
    return -1;
  }

  if (cfg_init((char*)"../../configure.txt") != 0)
  {
    printf("config file opening error\n");
    return -1;
  }

  double force_disconnect_deadline = 60.0*1000;
  class CServer *server;
  server = new CServer(force_disconnect_deadline);

  g_debug_log_add((char*)"main",(char*)"init done");

  server->start();

  delete server;

  g_debug_log_add((char*)"main",(char*)"program done");
  return 0;
}
