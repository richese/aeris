#ifndef _ROBOT_VISUALISATION_H_
#define _ROBOT_VISUALISATION_H_

#include "../common/common.h"


class CRobotVisualisation
{
  private:
      float cm_size;
      double time_out_deadline;

      i32 terminal_width;
      i32 terminal_height;

      u32 screen_width, screen_height;

      std::vector<struct sRobotData> robots;

      class CClient *client;
      struct sRobotData robot_data;

  public:
      CRobotVisualisation(u32 enable_opengl = 0);
      ~CRobotVisualisation();

      i32 process_reading(u32 log_enabled);


      void print();
      void clear();
      void refresh(struct sRobotData robot_data);


      void visualise_paint_robot(struct sRobotData robot_data);
      void visualise_refresh();
      void visualise_init();



};

#endif
