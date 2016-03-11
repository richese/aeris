#ifndef _MAP_H_
#define _MAP_H_

#include "../common.h"

struct sMapInit
{
  bool random_map;
  u32 random_items_count;

  float group_leave_probality;
};

class CMap
{
  public:
    CMap(class CAgentGroup *agent_group, struct sMapInit map_init, char *map_file_name = NULL);
    ~CMap();
};


#endif
