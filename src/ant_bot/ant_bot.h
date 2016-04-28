#ifndef _ANT_BOT_H_
#define _ANT_BOT_H_

#include "../common/common.h"


class CAntBot
{
  private:

    u32 state;

    float dx;
    float dy;
    float dz;
    float dyaw;

    float rx, ry, rz;

    class CClient *client;

    struct sAgentInterface agent_interface;

  public:
    CAntBot();
    ~CAntBot();

    void process();
};


#endif
