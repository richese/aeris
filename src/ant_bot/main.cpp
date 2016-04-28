#include "../common/common.h"

#include "food_bot.h"
#include "base_bot.h"
#include "ant_bot.h"
#include "pheromone_bot.h"

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

  u32 j;

  u32 food_count = 8;

  std::vector<class CFoodBot*> food;
  for (j = 0; j < food_count; j++)
    food.push_back(new CFoodBot());

  class CBaseBot base;


  u32 ants_count = 32;
  std::vector<class CAntBot*> ants;
  for (j = 0; j < ants_count; j++)
    ants.push_back(new CAntBot());



  u32 pheromones_count = 512;
  std::vector<class CPheromoneBot*> pheromones;
  for (j = 0; j < pheromones_count; j++)
    pheromones.push_back(new CPheromoneBot());

  while (getch() == -1)
  {
    for (j = 0; j < food.size(); j++)
      food[j]->process();

    base.process();

    for (j = 0; j < ants.size(); j++)
      ants[j]->process();

    for (j = 0; j < pheromones.size(); j++)
      pheromones[j]->process();

    usleep(1000*cfg_get_dt());
  }

  for (j = 0; j < food_count; j++)
    delete food[j];

  for (j = 0; j < ants_count; j++)
    delete ants[j];

  g_debug_log_add((char*)"main",(char*)"program done");
  return 0;
}
