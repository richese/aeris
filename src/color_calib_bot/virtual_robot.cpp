#include "virtual_robot.h"


float rnd()
{
  return ((rand()%200000) - 100000)/100000.0;
}

CVirtualRobot::CVirtualRobot()
{
  agent_interface.id = cfg_get_unique_id() + rand();

  agent_interface.param = 0;
  agent_interface.value = 0;
  agent_interface.color_intensity = 1.0;

  agent_interface.time_stamp = get_ms_time();
  agent_interface.type = AGENT_TYPE_BOT;
  agent_interface.type_behaviour = AGENT_TYPE_BEHAVIOUR_COLOR_CALIB;
  agent_interface.type_interaction = AGENT_TYPE_INTERACTION_WEAK;
  agent_interface.size = AGENT_BOT_SIZE;

  agent_interface.request =  AGENT_REQUEST_NULL;

  agent_interface.x = 0;
  agent_interface.y = 0;
  agent_interface.z = 0.1;

  agent_interface.roll = 0.0;
  agent_interface.pitch = 0.0;
  agent_interface.yaw = 0.0;

  agent_interface.size = 1920;
  agent_interface.dt = cfg_get_dt();

  agent_interface.action_type = ACTION_TYPE_NULL;

  agent_interface.action[32] = AGENT_TYPE_BEHAVIOUR_TYPE_0;

  state = 0;
  behaviour = 0;
  counter = 0;

  client = new CClient();
}

CVirtualRobot::~CVirtualRobot()
{
  delete client;
}


void CVirtualRobot::process()
{
  agent_interface.action[0] = 0;
  agent_interface.action[1] = 0;
  agent_interface.action[2] = 0;

  agent_interface.time_stamp = get_ms_time();

  counter++;
  if (counter >= 100) {
    counter = 0;

    if (state == 0) {
      state = 1;
      behaviour = (behaviour + 1) % AGENT_TYPE_BEHAVIOUR_TYPE_COUNT;
    } else {
      state = 0;
    }

  }

  if (state == 0) {
    agent_interface.color_intensity = 0;
    agent_interface.action[32] = AGENT_TYPE_BEHAVIOUR_NULL;
  } else {
    agent_interface.color_intensity = 1;
    agent_interface.action[32] = behaviour;
  }

  u32 id1 = agent_interface.id;
  i32 res  = client->process(&agent_interface);
  u32 id2 = agent_interface.id;

  if (res < 0)
  {
    g_error_log_add((char*)"connection error", 10, res);
  }
}
