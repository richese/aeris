#include "agent_interface.h"

CAgentInterface::CAgentInterface(u32 id)
{
  agent_interface.id = 0;
  agent_interface.param = 0;
  agent_interface.value = 0;
  agent_interface.time_stamp = get_ms_time();
  agent_interface.type = AGENT_TYPE_NULL;
  agent_interface.type_behaviour = AGENT_TYPE_BEHAVIOUR_NULL;
  agent_interface.type_interaction = AGENT_TYPE_INTERACTION_NULL;

  agent_interface.x = 0.0;
  agent_interface.y = 0.0;
  agent_interface.z = 0.0;

  agent_interface.roll = 0.0;
  agent_interface.pitch = 0.0;
  agent_interface.yaw = 0.0;

  agent_interface.size = 1.0;
  agent_interface.dt = 1.0/20.0;



  agent_interface.action_type = ACTION_TYPE_NULL;

  if (id != 0)
    agent_interface.id = cfg_get_unique_id();

  u32 i;
  for (i = 0; i < ACTION_VECTOR_SIZE; i++)
    agent_interface.action[i] = 0.0;

  for (i = 0; i < STATE_VECTOR_SIZE; i++)
    agent_interface.state[i] = 0.0;

  pthread_mutex_init(&mutex, NULL);
}

CAgentInterface::~CAgentInterface()
{
  pthread_mutex_destroy(&mutex);
}

void CAgentInterface::set(struct sAgentInterface agent_interface)
{
  pthread_mutex_lock(&mutex);
  this->agent_interface = agent_interface;
  pthread_mutex_unlock(&mutex);
}

void CAgentInterface::set_id(u32 id)
{
  pthread_mutex_lock(&mutex);
  this->agent_interface.id = id;
  pthread_mutex_unlock(&mutex);
}


struct sAgentInterface CAgentInterface::get()
{
  struct sAgentInterface res;
  pthread_mutex_lock(&mutex);
  res = this->agent_interface;
  pthread_mutex_unlock(&mutex);

  return res;
}
