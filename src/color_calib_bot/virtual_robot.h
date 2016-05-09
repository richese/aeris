#ifndef _VIRTUAL_ROBOT_H_
#define _VIRTUAL_ROBOT_H_

#include "../common/common.h"


class CVirtualRobot
{
  private:
    u32 state;
    u32 behaviour;
    u32 counter;

    class CClient *client;
    struct sAgentInterface agent_interface;

  public:
    CVirtualRobot();
    ~CVirtualRobot();

    void process();
};


#endif
