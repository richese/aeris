#ifndef _AGENT_GROUP_H_
#define _AGENT_GROUP_H_


#include "../common.h"

class CAgentGroup
{
  private:
    pthread_mutex_t mutex;
    double agent_life_time_ms;

    std::vector<class CAgentInterface *> agent_group;

  public:
    CAgentGroup(u32 maximum_agents_count, double agent_life_time_ms = 1000.0);
    ~CAgentGroup();

    /*
      update agent using it's unique id
      if agent doesnt exist, create new and update it

      than calls call_back function,
      and refresh data in agent_group

      return 0 if success
    */
    i32 update_agent(struct sAgentInterface *agent_interface, i32(*call_back)(struct sAgentInterface *) = NULL);

    /*
      fill agent in group with agent_interface value

      return 0 if success
    */
    i32 get_agent(struct sAgentInterface *agent_interface, u32 idx);


    u32 get_size();

    void kill_zombies();


  };

#endif
