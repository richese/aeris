#ifndef _NODE_H_
#define _NODE_H_

#include "../common/common.h"


class CNode
{
  private:
      class CClient *client;
      u32 period;
      struct sNodeData node_data;

  public:
      CNode(char *serial_port_name = NULL, u32 baud_rate = 0);
      ~CNode();

      float rnd();
      void process();

      i32 process_reading(u32 log_enabled);
      void print();
};

#endif
