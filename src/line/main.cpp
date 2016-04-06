#include "../common/common.h"
#include "virtual_robot.h"

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

  u32 j, robots_count = 300;
  std::vector<class CVirtualRobot*> robots;

  for (j = 0; j < robots_count; j++)
  {
    float t = 2.0*PI*j/robots_count;
    float r = 200.0;
    float x = r*(16.0/9.0)*cos(t);
    float y = r*sin(t);
    robots.push_back(new CVirtualRobot(x, y, AGENT_TYPE_BEHAVIOUR_TYPE_0));
  }

  for (j = 0; j < robots_count; j++)
  {
    float t = 2.0*PI*j/robots_count;
    float r = 200.0;
    float x = r*(16.0/9.0)*cos(t);
    float y = r*sin(t);
    robots.push_back(new CVirtualRobot(x, y, AGENT_TYPE_BEHAVIOUR_TYPE_1));
  }

  for (j = 0; j < robots_count; j++)
  {
    float t = 2.0*PI*j/robots_count;
    float r = 200.0;
    float x = r*(16.0/9.0)*cos(t);
    float y = r*sin(t);
    robots.push_back(new CVirtualRobot(x, y, AGENT_TYPE_BEHAVIOUR_TYPE_2));
  }

  while (getch() == -1)
  {
    for (j = 0; j < robots.size(); j++)
      robots[j]->process();

    usleep(1000*cfg_get_dt());
  }

  for (j = 0; j < robots_count; j++)
    delete robots[j];

  g_debug_log_add((char*)"main",(char*)"program done");
  return 0;
}
