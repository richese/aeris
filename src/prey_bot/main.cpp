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

  struct sKohonenLayerInit kohonen_init;

  kohonen_init.neurons_count = 8;
  kohonen_init.input_vector_size = 2;
  kohonen_init.output_vector_size = 2;
  kohonen_init.eta = 0.1;
  kohonen_init.alpha = 0.3;

  class CKohonenLayer *knn = new CKohonenLayer(kohonen_init);

  u32 j, robots_count = 64;
  std::vector<class CVirtualRobot*> robots;

  for (j = 0; j < robots_count; j++)
    robots.push_back(new CVirtualRobot(knn));

  while (getch() == -1)
  {
    for (j = 0; j < robots_count; j++)
      robots[j]->process();

    usleep(1000*cfg_get_dt());
  }

  for (j = 0; j < robots_count; j++)
    delete robots[j];

  delete knn;

  g_debug_log_add((char*)"main",(char*)"program done");
  return 0;
}
