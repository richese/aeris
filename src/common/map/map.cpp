#include "map.h"



CMap::CMap(class CAgentGroup *agent_group, struct sMapInit map_init, char *map_file_name)
{
  if (map_init.random_map == true)
  {
    struct sAgentInterface agent_interface;

    agent_interface.id = cfg_get_unique_id();
    agent_interface.param = 0;
    agent_interface.value = 0;
    agent_interface.color_intensity = 1.0;

    agent_interface.time_stamp = 0.0;
    agent_interface.type = AGENT_TYPE_BOT;
    agent_interface.type_behaviour = AGENT_TYPE_BEHAVIOUR_NULL;
    agent_interface.type_interaction = AGENT_TYPE_INTERACTION_STRONG;

    agent_interface.x = rnd_()*POSITION_MAX_X;
    agent_interface.y = rnd_()*POSITION_MAX_Y;
    agent_interface.z = rnd_()*POSITION_MAX_Z;

    agent_interface.roll = 0.0;
    agent_interface.pitch = 0.0;
    agent_interface.yaw = 0.0;

    agent_interface.size = AGENT_BOT_SIZE;
    agent_interface.dt = 1.0/20.0;


    u32 i;
    for (i = 0; i < ACTION_VECTOR_SIZE; i++)
      agent_interface.action[i] = 0.0;

    for (i = 0; i < STATE_VECTOR_SIZE; i++)
      agent_interface.state[i] = 0.0;


    for (i = 0; i < map_init.random_items_count; i++)
    {
      bool new_place = false;

      agent_interface.x+= rnd_()*POSITION_MAX_X*0.05;
      agent_interface.y+= rnd_()*POSITION_MAX_Y*0.05;
      agent_interface.yaw+= 0.03*rnd_()*2.0*PI;

      agent_interface.id++;
      if (agent_interface.id == 0)
        agent_interface.id++;


      if (
          (abs_(agent_interface.x) > POSITION_MAX_X) ||
          (abs_(agent_interface.y) > POSITION_MAX_Y) ||
          (abs_(agent_interface.z) > POSITION_MAX_Z)
        )
        new_place = true;

      if ((abs_(rnd_()) < map_init.group_leave_probality) || (new_place == true))
      {
        agent_interface.x = rnd_()*POSITION_MAX_X;
        agent_interface.y = rnd_()*POSITION_MAX_Y;
        agent_interface.yaw = rnd_()*2.0*PI;

        agent_interface.type = AGENT_TYPE_BOT;
        agent_interface.type_behaviour = AGENT_TYPE_BEHAVIOUR_NULL;
        agent_interface.type_interaction = AGENT_TYPE_INTERACTION_STRONG; //rand()%AGENT_TYPE_INTERACTION_COUNT;
      }

      // printf("%u  %f %f %f\n", agent_interface.id, agent_interface.x, agent_interface.y, agent_interface.z);

      agent_group->update_agent(&agent_interface, NULL);
    }
  }

  if (map_file_name != NULL)
  {
    //TODO load map from file
  }
}

CMap::~CMap()
{


}
