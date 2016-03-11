#ifndef _CLIENTS_H_
#define _CLIENTS_H_

#include "../common/common.h"


struct sClientMonitor
{
  pthread_mutex_t mutex;
  double time_stamp;

  struct sPacket rx_packet;   /*received data*/
  struct sPacket tx_packet;   /*data for transmission*/
};

class CClientMonitor
{
  private:
    double client_life_time, time;
    pthread_mutex_t mutex;
    std::vector<struct sClientMonitor> clients;

  public:
    CClientMonitor(u32 maximum_clients_count, double client_life_time);
    ~CClientMonitor();

    i32 set_item(struct sPacket rx_packet)
    struct sPacket get_item(struct sPacket rx_packet);
};

#endif
