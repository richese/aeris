#ifndef _PHEROMONE_BOT_H_
#define _PHEROMONE_BOT_H_

#include "../common/common.h"


class CPheromoneBot
{
  private:

    float dx;
    float dy;
    float dz;
    float dyaw;

    class CClient *client;

    struct sAgentInterface agent_interface;

    float life_time;
  public:
    CPheromoneBot();
    ~CPheromoneBot();

    void process();
};


#endif
