#include "environment.h"

CEnvironment *g_env;

i32 call_back_handler(struct sAgentInterface *agent_interface)
{
  return g_env->call_back(agent_interface);
}


CEnvironment::CEnvironment( struct sMapInit map_init, char *map_file_name,
                u32 maximum_agents_count, double agent_life_time_ms
              )
{
  g_env = this;
  agent_group = new CAgentGroup(maximum_agents_count, agent_life_time_ms);

  map = new CMap(agent_group, map_init, map_file_name);

  server = new CServer(agent_group, call_back_handler);
  server->start();
}


CEnvironment::~CEnvironment()
{
  delete server;
  delete map;
  delete agent_group;
}

i32 CEnvironment::call_back(struct sAgentInterface *agent_interface)
{
  (void)agent_interface;

  //it's visualisation request
  if (agent_interface->type == AGENT_TYPE_VISUALISATION)
  {
    struct sAgentInterface agent_interface_tmp;

    //use param as IDX for required agent data
    u32 idx = agent_interface->param;
    i32 res = agent_group->get_agent(&agent_interface_tmp, idx);

    //check if agent exist
    if (res == 0)
    {
      //in param return it's ID
      agent_interface_tmp.param = agent_interface_tmp.id;

      //use correct ID
      agent_interface_tmp.id = agent_interface->id;

      //in action type return agents count
      agent_interface_tmp.action_type = agent_group->get_size();


      *agent_interface = agent_interface_tmp;
    }
    else
    {
      agent_interface->param = 0;
      agent_interface->action_type = agent_group->get_size();
    }

    return 0;
  }


  if (agent_interface->type == AGENT_TYPE_BOT)
  {


    // printf("%u %f %f\n", agent_interface->id, agent_interface->x, agent_interface->y);

    agent_interface->x+= agent_interface->action[0];
    agent_interface->y+= agent_interface->action[1];
    agent_interface->z+= agent_interface->action[2];

    agent_interface->roll+= agent_interface->action[3]*cfg_get_dt();
    agent_interface->pitch+= agent_interface->action[4]*cfg_get_dt();
    agent_interface->yaw+= agent_interface->action[5]*cfg_get_dt();


    if (agent_interface->x > POSITION_MAX_X)
      agent_interface->x = POSITION_MAX_X;
    if (agent_interface->x < -POSITION_MAX_X)
      agent_interface->x = -POSITION_MAX_X;

    if (agent_interface->y > POSITION_MAX_Y)
      agent_interface->y = POSITION_MAX_Y;
    if (agent_interface->y < -POSITION_MAX_Y)
      agent_interface->y = -POSITION_MAX_Y;

    if (agent_interface->z > POSITION_MAX_Z)
      agent_interface->z = POSITION_MAX_Z;
    if (agent_interface->z < -POSITION_MAX_Z)
      agent_interface->z = -POSITION_MAX_Z;

    return 0;
  }

  //TODO
  //implement map objects colisions and actions executing
  return 0;
}

void CEnvironment::kill_zombies()
{
  server->kill_zombies();
}
