#ifndef _ROBOT_VISUALISATION_H_
#define _ROBOT_VISUALISATION_H_

#include "../common.h"
 

class CRobotVisualisation
{
  private:
      float cm_size;

      i32 terminal_width;
      i32 terminal_height;

      u32 screen_width, screen_height;
      u32 agent_idx;

      class CClient *client;

      class CAgentGroup *agent_group;


  public:
      CRobotVisualisation(u32 enable_opengl = 0, class CAgentGroup *agent_group = NULL);
      ~CRobotVisualisation();

      i32 read_from_server();


      void print();
      void clear();

      void visualise_paint_agent(struct sAgentInterface agent_interface);
      void visualise_refresh();
      void visualise_init();

      void kill_zombies();

      void print(float x, float y, float r, float g, float b, void *font, char *string);


};

#endif
