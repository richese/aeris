#ifndef _BASE_BOT_H_
#define _BASE_BOT_H_

#include "../common/common.h"


class CBaseBot
{
  private:

    float dx;
    float dy;
    float dz;
    float dyaw;

    class CClient *client;

    struct sAgentInterface agent_interface;

  public:
    CBaseBot();
    ~CBaseBot();

    void process();
};


#endif
