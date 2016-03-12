#ifndef _VIRTUAL_ROBOT_H_
#define _VIRTUAL_ROBOT_H_

#include "../common/common.h"


class CVirtualRobot
{
  private:
    float t, init_x, init_y;

    float dx;
    float dy;
    float dz;
    float dyaw;

    class CClient *client;

    u32 state;

    struct sAgentInterface agent_interface;

  public:
    CVirtualRobot(float init_x, float init_y);
    ~CVirtualRobot();

    void process();
};


#endif
