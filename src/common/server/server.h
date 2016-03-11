#ifndef _SERVER_H_
#define _SERVER_H_

#include "../common.h"


#define SERVER_MAX_THREADS_COUNT    ((u32)10)

class CServer
{
  private:
      u32 server_run;
      u32 portno;

      class CAgentGroup *agent_group;

      i32 (*call_back)(struct sAgentInterface *);

       std::thread *server_thread;

  public:
      CServer(class CAgentGroup *agent_group, i32(*call_back)(struct sAgentInterface *));
      ~CServer();

      i32 start();

      void kill_zombies();

  private:
      i32 start_();
      void error(i32 error_res);

};

#endif
