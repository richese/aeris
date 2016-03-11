#ifndef _CLIENT_H_
#define _CLIENT_H_

#include "../common/common.h"

class CClient
{
  public:
      CClient();
      ~CClient();

      i32 connect_to_server(struct sPacket *rx_packet, struct sPacket *tx_packet);
};

#endif
