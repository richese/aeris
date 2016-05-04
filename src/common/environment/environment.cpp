#include "environment.h"

CEnvironment *g_env;

i32 call_back_handler(struct sAgentInterface *agent_interface)
{
  return g_env->call_back(agent_interface);
}


CEnvironment::CEnvironment( struct sMapInit map_init, char *map_file_name,
                u32 maximum_agents_count, double agent_life_time_ms,
                bool visualisation_enabled
              )
{
  g_env = this;
  agent_group = new CAgentGroup(maximum_agents_count, agent_life_time_ms);

  map = new CMap(agent_group, map_init, map_file_name);

  server = new CServer(agent_group, call_back_handler);
  server->start();

  this->visualisation_enabled = visualisation_enabled;
  visualisation_thread = NULL;
  if (visualisation_enabled)
    visualisation_thread = new std::thread(&CEnvironment::visualisation_refresh, this);
}


CEnvironment::~CEnvironment()
{
  visualisation_enabled = false;
  if (visualisation_thread != NULL) {
    visualisation_thread->join();
    delete visualisation_thread;
  }
  delete server;
  delete map;
  delete agent_group;
}


void CEnvironment::visualisation_refresh()
{
    class CRobotVisualisation *robot_visualisation;
    robot_visualisation = new CRobotVisualisation(1, agent_group);
    robot_visualisation->clear();

    double time = get_ms_time();
    double k = 0.9;

    while (visualisation_enabled)
    {
        double time_start = get_ms_time();
        robot_visualisation->visualise_refresh();
        double time_stop = get_ms_time();

        time = k*time + (1.0-k)*(time_stop - time_start);

        printf("FPS %f\n", 1.0/(0.001*time) );
        usleep(1000*20);
    }

    delete robot_visualisation;
}


i32 CEnvironment::call_back(struct sAgentInterface *agent_interface)
{
  //it's visualisation request
  if (agent_interface->type == AGENT_TYPE_VISUALISATION)
  {
    struct sAgentInterface agent_interface_tmp;

    //use param as IDX for required agent data
    u32 idx = agent_interface->param;
    i32 res = agent_group->get_agent(&agent_interface_tmp, idx);

    //check if agent exist
    if (res == 0)
    {
      //in param return it's ID
      agent_interface_tmp.param = agent_interface_tmp.id;

      //use correct ID
      agent_interface_tmp.id = agent_interface->id;

      //in action type return agents count
      agent_interface_tmp.action_type = agent_group->get_size();


      *agent_interface = agent_interface_tmp;
    }
    else
    {
      agent_interface->param = 0;
      agent_interface->action_type = agent_group->get_size();
    }

    return 0;
  }

  /*
  u32 i;
  for (i = 0; i <STATE_VECTOR_SIZE; i++)
    agent_interface->state[i] = 0.0;
    */

  if (agent_interface->request == AGENT_REQUEST_RESPAWN)
  {
    agent_interface->request = AGENT_REQUEST_NULL;
    agent_interface->x = rnd_()*POSITION_MAX_X; //*x_max;
    agent_interface->y = rnd_()*POSITION_MAX_Y; //*y_max;
    agent_interface->z = 0.0*rnd_()*0.99;//*z_max;
  }


  if (agent_interface->type == AGENT_TYPE_BOT)
  {
    process_bot_collisions(agent_interface);
    return 0;
  }



  //TODO
  //implement map objects colisions and actions executing
  return 0;
}

void CEnvironment::kill_zombies()
{
  server->kill_zombies();
}


void CEnvironment::process_bot_collisions(struct sAgentInterface *agent_interface)
{
  u32 j, i;

  i32 interaction_null_idx = -1;
  i32 interaction_weak_idx = -1;
  i32 interaction_strong_idx = -1;
  i32 interaction_move_idx = -1;

  float interaction_null_dist = 1000000.0;
  float interaction_weak_dist = 1000000.0;
  float interaction_strong_dist = 1000000.0;
  float interaction_move_dist = 1000000.0;

  float dx = agent_interface->action[0]*0.3;
  float dy = agent_interface->action[1]*0.3;
  float dz = agent_interface->action[2]*0.3;

  float droll = agent_interface->action[3];
  float dpitch = agent_interface->action[4];
  float dyaw = agent_interface->action[5];

  float dt = cfg_get_dt();

  std::vector<float> behaviour_distance(AGENT_TYPE_BEHAVIOUR_TYPE_COUNT);

  agent_interface->state[STATE_PHEROMONE_OFS] = 0.0;
  for (j = 0; j < behaviour_distance.size(); j++)
    behaviour_distance[j] = 1000000.0;

  for (j = 0; j < agent_group->get_size(); j++)
  {
    struct sAgentInterface agent_interface_tmp;
    agent_group->get_agent(&agent_interface_tmp, j);

    if ((agent_interface_tmp.id == 0) || (agent_interface->id == agent_interface_tmp.id))
      continue;

    if (agent_interface_tmp.type != AGENT_TYPE_BOT)
      continue;


    float dist =
            pow((agent_interface->x - agent_interface_tmp.x), 2.0) +
            pow((agent_interface->y - agent_interface_tmp.y), 2.0) +
            pow((agent_interface->z - agent_interface_tmp.z), 2.0);

    dist = sqrt(dist);

    float colission_distance = (agent_interface->size*0.5 + agent_interface_tmp.size*0.5)*sqrt(2.0);

    if (dist < colission_distance)
    {
      switch (agent_interface_tmp.type_interaction)
      {
        case AGENT_TYPE_INTERACTION_NULL:
                                          if (dist < interaction_null_dist)
                                          {
                                            interaction_null_idx = j;
                                            interaction_null_dist = dist;
                                          }
                                          break;

        case AGENT_TYPE_INTERACTION_WEAK:
                                          if (dist < interaction_weak_dist)
                                          {
                                            interaction_weak_idx = j;
                                            interaction_weak_dist = dist;
                                          }
                                          break;

        case AGENT_TYPE_INTERACTION_STRONG:
                                          if (dist < interaction_strong_dist)
                                          {
                                            interaction_strong_idx = j;
                                            interaction_strong_dist = dist;
                                          }
                                          break;

        case AGENT_TYPE_INTERACTION_MOVE:
                                          if (dist < interaction_move_dist)
                                          {
                                            interaction_move_idx = j;
                                            interaction_move_dist = dist;
                                          }
                                          break;
      }
    }

    u32 type_idx = agent_interface_tmp.type_behaviour;

    if (interaction_weak_dist < behaviour_distance[AGENT_TYPE_BEHAVIOUR_TYPE_0+type_idx])
    {
      behaviour_distance[AGENT_TYPE_BEHAVIOUR_TYPE_0 + type_idx] = dist;
      agent_interface->state[STATE_POSITION_X_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0 + type_idx)*3] = agent_interface_tmp.x;
      agent_interface->state[STATE_POSITION_Y_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0 + type_idx)*3] = agent_interface_tmp.y;
      agent_interface->state[STATE_POSITION_Z_OFS + (AGENT_TYPE_BEHAVIOUR_TYPE_0 + type_idx)*3] = agent_interface_tmp.z;


      if (type_idx ==  AGENT_TYPE_BEHAVIOUR_TYPE_3)
        agent_interface->state[STATE_PHEROMONE_OFS] = agent_interface->color_intensity;
    }

  }


  if (interaction_move_idx != -1)
  {
    agent_interface->x+= dx*dt;
    agent_interface->y+= dy*dt;
    agent_interface->z+= dz*dt;

    struct sAgentInterface agent_interface_tmp;
    agent_group->get_agent(&agent_interface_tmp, interaction_move_idx);


    float dist_tmp =
            pow((agent_interface->x - agent_interface_tmp.x), 2.0) +
            pow((agent_interface->y - agent_interface_tmp.y), 2.0) +
            pow((agent_interface->z - agent_interface_tmp.z), 2.0);

    dist_tmp = sqrt(dist_tmp);

    if (dist_tmp < interaction_move_dist)
    {
      agent_interface_tmp.x+= dx*dt;
      agent_interface_tmp.y+= dy*dt;
      agent_interface_tmp.z+= dz*dt;

      agent_interface->x-= 0.5*dx*dt;
      agent_interface->y-= 0.5*dy*dt;
      agent_interface->z-= 0.5*dz*dt;
    }

    if (agent_interface_tmp.x > POSITION_MAX_X)
      agent_interface_tmp.x = POSITION_MAX_X;
    if (agent_interface_tmp.x < -POSITION_MAX_X)
      agent_interface_tmp.x = -POSITION_MAX_X;

    if (agent_interface_tmp.y > POSITION_MAX_Y)
      agent_interface_tmp.y = POSITION_MAX_Y;
    if (agent_interface_tmp.y < -POSITION_MAX_Y)
      agent_interface_tmp.y = -POSITION_MAX_Y;

    if (agent_interface_tmp.z > POSITION_MAX_Z)
      agent_interface_tmp.z = POSITION_MAX_Z;
    if (agent_interface_tmp.z < -POSITION_MAX_Z)
      agent_interface_tmp.z = -POSITION_MAX_Z;


    for (i = 0; i < STATE_VECTOR_SIZE; i++)
      agent_interface_tmp.state[i] = agent_interface->state[i];

    agent_group->update_agent(&agent_interface_tmp, NULL);


  }
  else
  if (interaction_strong_idx != -1)
  {
    agent_interface->x+= -0.1*dx*cfg_get_dt();
    agent_interface->y+= -0.1*dy*cfg_get_dt();
    agent_interface->z+= -0.1*dz*cfg_get_dt();
  }
  else
  {
    agent_interface->x+= dx*cfg_get_dt();
    agent_interface->y+= dy*cfg_get_dt();
    agent_interface->z+= dz*cfg_get_dt();
  }

  agent_interface->roll+= droll*cfg_get_dt();
  agent_interface->pitch+= dpitch*cfg_get_dt();
  agent_interface->yaw+= dyaw*cfg_get_dt();


  if (agent_interface->x > POSITION_MAX_X)
    agent_interface->x = POSITION_MAX_X;
  if (agent_interface->x < -POSITION_MAX_X)
    agent_interface->x = -POSITION_MAX_X;

  if (agent_interface->y > POSITION_MAX_Y)
    agent_interface->y = POSITION_MAX_Y;
  if (agent_interface->y < -POSITION_MAX_Y)
    agent_interface->y = -POSITION_MAX_Y;

  if (agent_interface->z > POSITION_MAX_Z)
    agent_interface->z = POSITION_MAX_Z;
  if (agent_interface->z < -POSITION_MAX_Z)
    agent_interface->z = -POSITION_MAX_Z;

}
