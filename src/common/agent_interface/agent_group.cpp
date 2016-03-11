#include "agent_group.h"


CAgentGroup::CAgentGroup(u32 maximum_agents_count, double agent_life_time_ms )
{
  u32 i;

  this->agent_life_time_ms = agent_life_time_ms;

  for (i = 0; i < maximum_agents_count; i++)
  {
    class CAgentInterface *agent_interface;
    agent_interface = new CAgentInterface();
    agent_group.push_back(agent_interface);
  }


  pthread_mutex_init(&mutex, NULL);
}

CAgentGroup::~CAgentGroup()
{
  u32 i;
  for (i = 0; i < agent_group.size(); i++)
    delete agent_group[i];
}


i32 CAgentGroup::update_agent(struct sAgentInterface *agent_interface, i32(*call_back)(struct sAgentInterface *))
{
  i32 res = -1;

  u32 i;
  i32 idx = -1;

  //find agent in group
  for (i = 0; i < agent_group.size(); i++)
  {
    if (agent_group[i]->get().id == agent_interface->id)
    {
      idx = i;
      break;
    }
  }

  //no agent in list, find place for new
  if (idx == -1)
  {
    pthread_mutex_lock(&mutex);
    for (i = 0; i < agent_group.size(); i++)
      if (agent_group[i]->get().id == 0)
      {
        idx = i;
        agent_group[i]->set_id(1);
        break;
      }
    pthread_mutex_unlock(&mutex);

    // printf("new agent connected with id %u\n", agent_interface->id);
  }

  if (idx != -1)
  {
    agent_group[idx]->set(*agent_interface);

    if (call_back != NULL)
    {
      struct sAgentInterface agent_interface_tmp;
      agent_interface_tmp = agent_group[idx]->get();
      res = call_back(&agent_interface_tmp);

      agent_group[idx]->set(agent_interface_tmp);

      *agent_interface = agent_group[idx]->get();
    }
    else
      res = 0;
  }

  return res;
}

void CAgentGroup::kill_zombies()
{
  u32 i;
  pthread_mutex_lock(&mutex);
  for (i = 0; i < agent_group.size(); i++)
    if (agent_group[i]->get().id != 0)
    {
      if ( ((get_ms_time() > agent_group[i]->get().time_stamp + agent_life_time_ms)) &&
          (agent_group[i]->get().time_stamp > 0.01) )
        agent_group[i]->set_id(0);
    }
  pthread_mutex_unlock(&mutex);
}

i32 CAgentGroup::get_agent(struct sAgentInterface *agent_interface, u32 idx)
{
  i32 res = -1;
  pthread_mutex_lock(&mutex);

  if (idx < agent_group.size())
  {
    *agent_interface = agent_group[idx]->get();
    res = 0;
  }
  else
  {
    agent_interface->id = 0;
    res = -1;
  }

  pthread_mutex_unlock(&mutex);

  return res;
}

u32 CAgentGroup::get_size()
{
  u32 res;

  res = agent_group.size();

  return res;
}
