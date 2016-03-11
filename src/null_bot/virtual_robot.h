#ifndef _VIRTUAL_ROBOT_H_
#define _VIRTUAL_ROBOT_H_

#include "../common/common.h"


class CVirtualRobot
{
  private:

    float dx;
    float dy;
    float dz;
    float dyaw;

    class CClient *client;

    struct sAgentInterface agent_interface;

  public:
    CVirtualRobot();
    ~CVirtualRobot();

    void process();
};


#endif
