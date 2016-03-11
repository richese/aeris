#ifndef _CLIENT_H_
#define _CLIENT_H_

#include "../common.h"

class CClient
{
  public:
      CClient();
      ~CClient();

      i32 process(struct sAgentInterface *agent_interface);
};

#endif
