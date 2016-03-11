#ifndef _SERVER_H_
#define _SERVER_H_

#include "../common/common.h"


#define SERVER_NAME                   (char*)"server"

/*
	pthread_mutex_init(&g_debug_log.mutex, NULL);
  pthread_mutex_lock(&g_debug_log.mutex);
  pthread_mutex_unlock(&g_debug_log.mutex);
  pthread_mutex_t mutex;
*/

struct sClient
{
  pthread_mutex_t mutex;
  double time_stamp;

  u32 rw_flag;
  u32 rd_ptr;

  struct sPacket rx_packet;   /*received data*/
  struct sPacket tx_packet;   /*data for transmission*/
};

#define PACKET_READ_FLAG      (1<<0)
#define PACKET_WRITE_FLAG     (1<<1)


class CServer
{
  private:
      u32 server_run;
      u32 portno;

      double force_disconnect_deadline;

      u32 wr_ptr;
      std::vector<struct sPacket> rx_packets;

      std::vector<struct sClient> clients;

  public:
      CServer(double force_disconnect_deadline);
      ~CServer();

      i32 start();

      void process(struct sServerPacket server_packet);
      struct sPacket get_server_packet(u32 idx);
      void set_server_packet(u32 idx, struct sPacket tx_packet);

      void disconnect_unused_clients();

      void print_client(struct sClient client);

  private:
      i32 start_();
      i32 process_data(struct sPacket *rx_packet, struct sPacket *tx_packet);

      void ping_request_callback(u32 idx);
      void node_read_request_callback(u32 idx);
      void robot_read_request_callback(u32 idx);


};

#endif
