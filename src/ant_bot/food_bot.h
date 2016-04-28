#ifndef _FOOD_BOT_H_
#define _FOOD_BOT_H_

#include "../common/common.h"


class CFoodBot
{
  private:

    float dx;
    float dy;
    float dz;
    float dyaw;

    class CClient *client;

    struct sAgentInterface agent_interface;

  public:
    CFoodBot();
    ~CFoodBot();

    void process();
};


#endif
