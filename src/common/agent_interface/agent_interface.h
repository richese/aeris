#ifndef _AGENT_INTERFACE_H_
#define _AGENT_INTERFACE_H_

#include "../common.h"


class CAgentInterface
{
  private:
    pthread_mutex_t mutex;
    struct sAgentInterface agent_interface;

  public:
    CAgentInterface(u32 id = 0);
    ~CAgentInterface();

    void set(struct sAgentInterface agent_interface);
    void set_id(u32 id);
    struct sAgentInterface get();
};

#endif
