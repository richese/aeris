#include "../common/common.h"
#include "robot_visualisation.h"

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

  class CRobotVisualisation *robot_visualisation;
  robot_visualisation = new CRobotVisualisation(1);

  robot_visualisation->clear();


  double time_refresh = 0.0, refresh_period = cfg_get_dt();

  while (getch() == -1)
  {
    robot_visualisation->read_from_server();

    if (get_ms_time() > time_refresh)
    {
      robot_visualisation->print();
      robot_visualisation->visualise_refresh();
      robot_visualisation->kill_zombies();

      usleep(1000.0*cfg_get_dt());
      time_refresh = get_ms_time() + refresh_period;
    }
  }

  delete robot_visualisation;

  g_debug_log_add((char*)"main",(char*)"program done");
  return 0;
}
