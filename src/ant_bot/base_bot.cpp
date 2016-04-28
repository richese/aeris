#include "base_bot.h"
#include "ant_config.h"


CBaseBot::CBaseBot()
{
  agent_interface.id = cfg_get_unique_id() + rand();

  agent_interface.param = 0;
  agent_interface.value = 0;
  agent_interface.color_intensity = 1.0;

  agent_interface.time_stamp = get_ms_time();
  agent_interface.type = AGENT_TYPE_BOT;
  agent_interface.type_behaviour = ROBOT_TYPE_BASE;
  agent_interface.type_interaction = AGENT_TYPE_INTERACTION_WEAK;
  agent_interface.size = AGENT_BOT_SIZE*3.0;
  agent_interface.request =  AGENT_REQUEST_NULL;

  agent_interface.x = 0.1*rnd_()*POSITION_MAX_X; //*x_max;
  agent_interface.y = 0.1*rnd_()*POSITION_MAX_Y; //*y_max;
  agent_interface.z = 0.0*rnd_()*0.99;//*z_max;

  agent_interface.roll = 0.0;
  agent_interface.pitch = 0.0;
  agent_interface.yaw = 0.0;

  agent_interface.dt = cfg_get_dt();

  agent_interface.action_type = ACTION_TYPE_NULL;

  dx = 0.0;
  dy = 0.0;
  dz = 0.0;
  dyaw = 0.0;

  client = new CClient();
}

CBaseBot::~CBaseBot()
{
  delete client;
}


void CBaseBot::process()
{
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
