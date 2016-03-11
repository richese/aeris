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

  i32 res = 0;
  while (getch() == -1)
  {
    res = robot_visualisation->process_reading(0);

    if (res < 0)
    {
      robot_visualisation->visualise_refresh();
      usleep(1000*100);
    }
  }

  delete robot_visualisation;

  g_debug_log_add((char*)"main",(char*)"program done");
  return 0;
}
