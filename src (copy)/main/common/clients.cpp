#include "clients.h"



struct sClientMonitor
{
  pthread_mutex_t mutex;
  double time_stamp;

  struct sPacket rx_packet;   /*received data*/
  struct sPacket tx_packet;   /*data for transmission*/
};

CClientMonitor::CClientMonitor(u32 maximum_clients_count, double client_life_time)
{
  this->client_life_time = client_life_time;
  pthread_mutex_init(&mutex);

  for (j = 0; j < maximum_clients_count; j++)
  {
    struct sClientMonitor init_item;

    pthread_mutex_init(&init_item.mutex);
    init_item.time_stamp = get_ms_time();
    packet_init(init_item.rx_packet);
    packet_init(init_item.tx_packet);

    clients.push_back(packet_init);
  }

  time = get_ms_time() + client_life_time;
}

CClientMonitor::~CClientMonitor()
{

}

i32 set_item(struct sPacket rx_packet)
{
  u32 i;
  
  i32 res = -1;
  for (i = 0; i < maximum_clients_count; i++)
  {
    if (rx_packet.source == clients[i].rx_packet.source)
    {
      pthread_mutex_lock(&clients[i].mutex);
      clients[i].rx_packet = rx_packet;
      clients[i].time_stamp = get_ms_time();
      res = 0;
      pthread_mutex_unlock(&clients[i].mutex);
      break;
    }
  }

  if (res == -1)
  {
    pthread_mutex_lock(&mutex);
    for (i = 0; i < maximum_clients_count; i++)
      if (clients[i].rx_packet.source == 0)
      {
        pthread_mutex_lock(&clients[i].mutex);
        struct sClientMonitor init_item;
        init_item.time_stamp = get_ms_time();
        init_item.rx_packet = rx_packet;
        packet_init(init_item.tx_packet);
        pthread_mutex_unlock(&clients[i].mutex);

        res = 0;
        break;
      }
    pthread_mutex_unlock(&mutex);
  }

  if (get_ms_time() > time)
  {
    for (i = 0; i < maximum_clients_count; i++)
    {
      pthread_mutex_lock(&clients[i].mutex);

      struct sClientMonitor init_item;
      init_item.time_stamp = get_ms_time();
      packet_init(init_item.rx_packet);
      packet_init(init_item.tx_packet);

      clients[i] = init_item;

      pthread_mutex_unlock(&clients[i].mutex);
    }

    time = get_ms_time() + client_life_time;
  }

  return res;
}

struct sPacket get_item(u32 idx)
{
  struct sPacket result;

  pthread_mutex_lock(&clients[idx].mutex);
  res  =  clients[i].rx_packet;
  pthread_mutex_unlock(&clients[idx].mutex);
  return res;
}
