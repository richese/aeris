#include "virtual_robot.h"


float rnd()
{
  return ((rand()%200000) - 100000)/100000.0;
}

CVirtualRobot::CVirtualRobot(float init_x, float init_y)
{
  this->init_x = init_x;
  this->init_y = init_y;

  agent_interface.id = cfg_get_unique_id() + rand();

  agent_interface.param = 0;
  agent_interface.value = 0;
  agent_interface.color_intensity = 1.0;

  agent_interface.time_stamp = get_ms_time();
  agent_interface.type = AGENT_TYPE_BOT;
  agent_interface.type_behaviour = AGENT_TYPE_BEHAVIOUR_NULL;
  agent_interface.type_interaction = AGENT_TYPE_INTERACTION_WEAK;
  agent_interface.size = AGENT_BOT_SIZE*10.0;

  agent_interface.x = init_x;
  agent_interface.y = init_y;
  agent_interface.z = 0.0;

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

  state = 100;
  t = 0.0;
}

CVirtualRobot::~CVirtualRobot()
{
  delete client;
}


void CVirtualRobot::process()
{
  t+= 1.0;

  /*
  if ((rand()%100) < 3)
  {
    dx = sgn(rnd_());
    dy = sgn(rnd_());
  }
  */

  dy = sin(t*0.05 + init_x/100.0);

  agent_interface.size = AGENT_BOT_SIZE*2.0;

  agent_interface.action[0] = dx;
  agent_interface.action[1] = dy;
  agent_interface.action[2] = dz;

  agent_interface.time_stamp = get_ms_time();
  i32 res  = client->process(&agent_interface);

  if ((rand()%100) < 1)
  {
    state = rand()%100;
  }

  if (state < 10)
    agent_interface.color_intensity = 0.0;
  else
    agent_interface.color_intensity = 1.0;


  if (res < 0)
  {
    g_error_log_add((char*)"connection error", 10, res);
  }
}
