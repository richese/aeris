#include "ant_bot.h"
#include "ant_config.h"

CAntBot::CAntBot()
{
  agent_interface.id = cfg_get_unique_id() + rand();

  agent_interface.param = 0;
  agent_interface.value = 0;
  agent_interface.color_intensity = 1.0;

  agent_interface.time_stamp = get_ms_time();
  agent_interface.type = AGENT_TYPE_BOT;
  agent_interface.type_behaviour = ROBOT_TYPE_ANT;
  agent_interface.type_interaction = AGENT_TYPE_INTERACTION_WEAK;
  agent_interface.size = AGENT_BOT_SIZE;

  agent_interface.request =  AGENT_REQUEST_NULL;

  agent_interface.x = rnd_()*POSITION_MAX_X; //*x_max;
  agent_interface.y = rnd_()*POSITION_MAX_Y; //*y_max;
  agent_interface.z = 0.0*rnd_()*0.99;//*z_max;

  agent_interface.roll = 0.0;
  agent_interface.pitch = 0.0;
  agent_interface.yaw = 0.0;

  agent_interface.size = AGENT_BOT_SIZE;
  agent_interface.dt = cfg_get_dt();

  agent_interface.action_type = ACTION_TYPE_NULL;

  agent_interface.type_interaction = AGENT_TYPE_INTERACTION_NULL;

  dx = 0.0;
  dy = 0.0;
  dz = 0.0;
  dyaw = 0.0;


  rx = 0.0;
  ry = 0.0;
  rz = 0.0;

  client = new CClient();

  state = 0;
}

CAntBot::~CAntBot()
{
  delete client;
}


void CAntBot::process()
{
  float base_dx =   agent_interface.state[STATE_POSITION_X_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0 + ROBOT_TYPE_BASE)*3] - agent_interface.x;
  float base_dy =   agent_interface.state[STATE_POSITION_Y_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0 + ROBOT_TYPE_BASE)*3] - agent_interface.y;
  float base_dz =   agent_interface.state[STATE_POSITION_Z_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0 + ROBOT_TYPE_BASE)*3] - agent_interface.z;

  float food_dx =   agent_interface.state[STATE_POSITION_X_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0 + ROBOT_TYPE_FOOD)*3] - agent_interface.x;
  float food_dy =   agent_interface.state[STATE_POSITION_Y_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0 + ROBOT_TYPE_FOOD)*3] - agent_interface.y;
  float food_dz =   agent_interface.state[STATE_POSITION_Z_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0 + ROBOT_TYPE_FOOD)*3] - agent_interface.z;

  float pheromone_dx =   agent_interface.state[STATE_POSITION_X_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0+ROBOT_TYPE_PHEROMONE)*3] - agent_interface.x;
  float pheromone_dy =   agent_interface.state[STATE_POSITION_Y_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0+ROBOT_TYPE_PHEROMONE)*3] - agent_interface.y;
  float pheromone_dz =   agent_interface.state[STATE_POSITION_Z_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0+ROBOT_TYPE_PHEROMONE)*3] - agent_interface.z;

  float pheromone_intensity = agent_interface.state[STATE_PHEROMONE_OFS];

  float base_distance = sqrt(base_dx*base_dx + base_dy*base_dy + base_dz*base_dz);
  float food_distance = sqrt(food_dx*food_dx + food_dy*food_dy + food_dz*food_dz);
  float pheromone_distance = sqrt(food_dx*food_dx + food_dy*food_dy + food_dz*food_dz);

  float k = 2.0;
  float alpha = 1.0 - pheromone_intensity;


  if (rand_() < 0.1)
  {
    rx = sgn(rnd_());
    ry = sgn(rnd_());
    rz = sgn(rnd_());
  }



  switch (state)
  {
    case 0:

            dx = (1.0 - alpha)*sgn(pheromone_dx) + alpha*rx;
            dy = (1.0 - alpha)*sgn(pheromone_dy) + alpha*ry;
            dz = 0.0;

            /*
            dx = sgn(food_dx);
            dy = sgn(food_dy);
            dz = sgn(food_dz);
            */

            agent_interface.type_interaction = AGENT_TYPE_INTERACTION_NULL;


            if (food_distance < 10.0)
              state = 1;
            break;

    case 1:
            /*
            dx = (1.0 - alpha)*sgn(pheromone_dx) + alpha*rx;
            dy = (1.0 - alpha)*sgn(pheromone_dy) + alpha*ry;
            dz = 0.0;
            */

            dx = sgn(base_dx);
            dy = sgn(base_dy);
            dz = sgn(base_dz);

            agent_interface.type_interaction = AGENT_TYPE_INTERACTION_WEAK;

            if (base_distance < 10.0)
              state = 0;
            break;
  }



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
