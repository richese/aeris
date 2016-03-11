#include "virtual_robot.h"


float rnd()
{
  return ((rand()%200000) - 100000)/100000.0;
}

CVirtualRobot::CVirtualRobot()
{
  agent_interface.id = cfg_get_unique_id() + rand();

  agent_interface.param = 0;
  agent_interface.time_stamp = get_ms_time();
  agent_interface.type = AGENT_TYPE_BOT;
  agent_interface.type_behaviour = (rand()%AGENT_TYPE_BEHAVIOUR_TYPE_COUNT) + 1;
  agent_interface.type_interaction = AGENT_TYPE_INTERACTION_NULL;
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
  if ((rand()%100) < 2)
  {
      dx = rnd_();
      dy = rnd_();
      dz = 0.0*rnd_();
      dyaw = 0.1*rnd_();
  }

  agent_interface.action[0] = dx;
  agent_interface.action[1] = dy;
  agent_interface.action[2] = dz;

  agent_interface.action[5] = dyaw;

  agent_interface.time_stamp = get_ms_time();


  u32 id1 = agent_interface.id;
  i32 res  = client->process(&agent_interface);
  u32 id2 = agent_interface.id;

  if (res < 0)
  {
    g_error_log_add((char*)"connection error", 10, res);
  }
}
