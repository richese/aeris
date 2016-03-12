#include "virtual_robot.h"


float rnd()
{
  return ((rand()%200000) - 100000)/100000.0;
}

CVirtualRobot::CVirtualRobot(class CKohonenLayer *knn)
{
  agent_interface.id = cfg_get_unique_id() + rand();

  this->knn = knn;

  agent_interface.param = 0;
  agent_interface.value = 0;

  agent_interface.time_stamp = get_ms_time();
  agent_interface.type = AGENT_TYPE_BOT;
  agent_interface.type_behaviour = AGENT_TYPE_BEHAVIOUR_TYPE_0;
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

  dx_tmp = 0.0;
  dy_tmp = 0.0;

  client = new CClient();
}

CVirtualRobot::~CVirtualRobot()
{
  delete client;
}


void CVirtualRobot::process()
{
  float knn_input[2];
  knn_input[0] = agent_interface.x;
  knn_input[1] = agent_interface.y;

  knn->process(knn_input);
  knn->learn_w();

  float dist =
            pow(agent_interface.state[STATE_POSITION_X_OFS + AGENT_TYPE_BEHAVIOUR_TYPE_1*3] - agent_interface.x, 2.0) +
            pow(agent_interface.state[STATE_POSITION_Y_OFS + AGENT_TYPE_BEHAVIOUR_TYPE_1*3] - agent_interface.y, 2.0);

  dist = sqrt(dist);

  if (dist < 60.0)
  {
    dx_tmp = -sgn(agent_interface.state[STATE_POSITION_X_OFS + AGENT_TYPE_BEHAVIOUR_TYPE_1*3] - agent_interface.x);
    dy_tmp = -sgn(agent_interface.state[STATE_POSITION_Y_OFS + AGENT_TYPE_BEHAVIOUR_TYPE_1*3] - agent_interface.y);
  }
  else
  {
    if ((rand()%100) < 5)
    {
      dx_tmp = rnd_();
      dy_tmp = rnd_();
    }
  }
  /*
  if ((rand()%100) < 2)
  {
    dx_tmp = rnd_();
    dx_tmp = rnd_();
  }
  */

  float required_output[2];
  required_output[0] = dx_tmp;
  required_output[1] = dy_tmp;

  knn->learn_output(required_output);

  dx = knn->get_output()[0];
  dy = knn->get_output()[1];
  u32 winning_neuron_idx = knn->get_winning_neuron_idx();

  agent_interface.value = winning_neuron_idx;


  agent_interface.action[0] = dx;
  agent_interface.action[1] = dy;
  agent_interface.action[2] = dz;

  agent_interface.action[5] = dyaw;

  agent_interface.time_stamp = get_ms_time();


  i32 res  = client->process(&agent_interface);

  if (res < 0)
  {
    g_error_log_add((char*)"connection error", 10, res);
  }
}
