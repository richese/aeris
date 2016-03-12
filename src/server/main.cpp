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

  struct sMapInit map_init;

  char *map_file_name = NULL;
  u32 maximum_agents_count = 1024;
  double agent_life_time_ms = 2000.0;

  map_init.random_map = true;
  map_init.random_items_count = 8;
  map_init.group_leave_probality = 0.8; //0.2;


  class CEnvironment *environment;
  environment = new CEnvironment(map_init, map_file_name, maximum_agents_count, agent_life_time_ms);

  g_debug_log_add((char*)"main",(char*)"init done");


  while (getch() == -1)
  {
    sleep(1);
    environment->kill_zombies();
  }


  delete environment;
  g_debug_log_add((char*)"main",(char*)"program done");
  return 0;
}
