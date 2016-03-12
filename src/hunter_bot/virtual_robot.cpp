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
  agent_interface.time_stamp = get_ms_time();
  agent_interface.color_intensity = 1.0;

  agent_interface.type = AGENT_TYPE_BOT;
  agent_interface.type_behaviour = AGENT_TYPE_BEHAVIOUR_TYPE_1;
  agent_interface.type_interaction = AGENT_TYPE_INTERACTION_WEAK;
  agent_interface.size = AGENT_BOT_SIZE;

  agent_interface.x = rnd_()*POSITION_MAX_X; //*x_max;
  agent_interface.y = rnd_()*POSITION_MAX_Y; //*y_max;
  agent_interface.z = 0.0*rnd_()*0.99;//*z_max;

  agent_interface.roll = 0.0;
  agent_interface.pitch = 0.0;
  agent_interface.yaw = 0.0;

  agent_interface.size = AGENT_BOT_SIZE;
  agent_interface.dt = cfg_get_dt();

  agent_interface.action_type = ACTION_TYPE_NULL;

  dx = 0.0;
  dy = 0.0;
  dz = 0.0;
  dyaw = 0.0;

  client = new CClient();
}

CVirtualRobot::~CVirtualRobot()
{
  delete client;
}


void CVirtualRobot::process()
{
  dx = sgn(agent_interface.state[STATE_POSITION_X_OFS + AGENT_TYPE_BEHAVIOUR_TYPE_0*3] - agent_interface.x);
  dy = sgn(agent_interface.state[STATE_POSITION_Y_OFS + AGENT_TYPE_BEHAVIOUR_TYPE_0*3] - agent_interface.y);

  agent_interface.action[0] = dx*0.2;
  agent_interface.action[1] = dy*0.2;
  agent_interface.action[2] = dz*0.2;

  agent_interface.time_stamp = get_ms_time();
  i32 res  = client->process(&agent_interface);

  if (res < 0)
  {
    g_error_log_add((char*)"connection error", 10, res);
  }
}
