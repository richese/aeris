#include "server.h"

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>


CServer::CServer( double force_disconnect_deadline)
{
  u32 j;

  this->portno = cfg_get_server_port();
  this->force_disconnect_deadline = force_disconnect_deadline;

  this->wr_ptr = 0;

  struct sPacket packet;
  packet_init(&packet);

  for (j = 0; j < SERVER_RECEIVED_PACKET_FIFO_SIZE; j++)
    rx_packets.push_back(packet);


  struct sClient server_packet;
  // server_packet.mutex = 0;
  server_packet.time_stamp = get_ms_time();
  server_packet.rw_flag = 0;
  server_packet.rx_packet = packet;
  server_packet.tx_packet = packet;
  server_packet.rd_ptr = 0;

  server_packet.tx_packet.source = cfg_get_server_id();

  for (j = 0; j < SERVER_MAX_CLIENTS_COUNT; j++)
    clients.push_back(server_packet);

  for (j = 0; j < SERVER_MAX_CLIENTS_COUNT; j++)
    pthread_mutex_init(&clients[j].mutex, NULL);
}

CServer::~CServer()
{
  server_run = 0;

  // join(server_thread);
}


i32 CServer::start()
{
  server_run = 1;

  //run this as another thread
  i32 error_res = start_();

  if (error_res < 0)
    g_error_log_add((char*)"server init failed", ERROR_SERVER_INIT_FAILED, error_res);

  return error_res;
}

i32 CServer::start_()
{
  struct sockaddr_in serv_addr;

  i32 server_listen_fd;

  server_listen_fd = socket(AF_INET, SOCK_STREAM, 0);

  if (server_listen_fd < 0)
    return -3;

  memset(&serv_addr, '0', sizeof(serv_addr));

  serv_addr.sin_family = AF_INET;
  serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
  serv_addr.sin_port = htons(portno);

  if (bind(server_listen_fd, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0)
    return -4;

  if (listen(server_listen_fd, 10) < 0)
    return -5;

  while (server_run)
  {
    struct sockaddr_in client;
    int c = sizeof(struct sockaddr_in);

    int connfd = accept(server_listen_fd, (struct sockaddr *)&client, (socklen_t*)&c);

    if (connfd < 0)
        return -6;

    struct sPacket rx_packet;   /*received data*/
    struct sPacket tx_packet;   /*data for transmission*/

    if (read(connfd, (u8*)(&rx_packet), PACKET_SIZE) < 0)
        return -7;

    rx_packets[wr_ptr] = rx_packet;
    wr_ptr = (wr_ptr + 1)%rx_packets.size();


    i32 error_res = process_data(&rx_packet, &tx_packet);

    if (error_res < 0)
      g_debug_log_add(SERVER_NAME, (char*)"no space for more clients");

    if (write(connfd, (u8*)(&tx_packet), PACKET_SIZE) < 0)
        return -8;

    close(connfd);
  }

  return 0;
}

struct sPacket CServer::get_server_packet(u32 idx)
{
  struct sPacket result;
  packet_init(&result);

  if (idx < SERVER_MAX_CLIENTS_COUNT)
  {
    pthread_mutex_lock(&clients[idx].mutex);
    result = clients[idx].rx_packet;
    clients[idx].rw_flag&=~PACKET_READ_FLAG;
    pthread_mutex_unlock(&clients[idx].mutex);
  }

  return result;
}

void CServer::set_server_packet(u32 idx, struct sPacket tx_packet)
{
  if (idx < SERVER_MAX_CLIENTS_COUNT)
  {
    pthread_mutex_lock(&clients[idx].mutex);
    clients[idx].tx_packet = tx_packet;
    clients[idx].tx_packet.source = cfg_get_server_id();
    clients[idx].tx_packet.destination = clients[idx].rx_packet.source;
    clients[idx].rw_flag&=~PACKET_WRITE_FLAG;
    pthread_mutex_unlock(&clients[idx].mutex);
  }
}

void CServer::disconnect_unused_clients()
{
  u32 j;
  struct sPacket packet;
  packet_init(&packet);

  for (j = 0; j < SERVER_MAX_CLIENTS_COUNT; j++)
  {
    pthread_mutex_lock(&clients[j].mutex);

    if (get_ms_time() > (clients[j].time_stamp + force_disconnect_deadline))
    {
      char str[256];
      sprintf(str, "client disconnected with address %u ", clients[j].rx_packet.source);
      g_debug_log_add(SERVER_NAME, str);

      clients[j].time_stamp = get_ms_time();
      clients[j].rw_flag = 0;
      clients[j].rx_packet = packet;
      clients[j].tx_packet = packet;
      clients[j].tx_packet.source = cfg_get_server_id();
    }

    pthread_mutex_unlock(&clients[j].mutex);
  }

}

i32 CServer::process_data(struct sPacket *rx_packet, struct sPacket *tx_packet)
{
  u32 j;
  i32 idx = -1;

  packet_init(tx_packet);
  for (j = 0; j < SERVER_MAX_CLIENTS_COUNT; j++)
  {
    if (clients[j].rx_packet.source == rx_packet->source)
    {
      idx = j;
      break;
    }
  }

  if (idx == -1)
  {
    for (j = 0; j < SERVER_MAX_CLIENTS_COUNT; j++)
      if (clients[j].rx_packet.source == 0)
      {
        idx = j;

        char str[256];
        sprintf(str, "new client connected with address %u , idx %u", rx_packet->source, idx);
        g_debug_log_add(SERVER_NAME, str);
        break;
      }
  }

  //there is no space for more clients
  if (idx < 0)
    return -1;

  //update packet data
  pthread_mutex_lock(&clients[idx].mutex);

  clients[idx].rx_packet = *rx_packet;

  packet_init(& clients[idx].tx_packet);

  clients[idx].tx_packet.source = cfg_get_server_id();
  clients[idx].tx_packet.destination = clients[idx].rx_packet.source;
  clients[idx].tx_packet.type = PACKET_TYPE_NULL;
  clients[idx].tx_packet.param = PACKET_PARAM_NULL;


  if (clients[idx].rx_packet.type == PACKET_TYPE_PING)
  {
    ping_request_callback(idx);
  }

  if (clients[idx].rx_packet.type == PACKET_TYPE_COMMON_NODE_READ_REQUEST)
  {
    node_read_request_callback(idx);
  }

  if (clients[idx].rx_packet.type == PACKET_TYPE_COMMON_ROBOT_READ_REQUEST)
  {
    robot_read_request_callback(idx);
  }

  *tx_packet = clients[idx].tx_packet;

  clients[idx].time_stamp = get_ms_time();
  clients[idx].rw_flag = PACKET_READ_FLAG|PACKET_WRITE_FLAG;

  pthread_mutex_unlock(&clients[idx].mutex);

  #if SERVER_DEBUG_MODE == 1
  print_client(clients[idx]);
  #endif

  return 0;
}


void CServer::print_client(struct sClient client)
{
  printf("\npacket info : \n");
  printf(" dest %u src %u \n", client.rx_packet.destination, client.rx_packet.source);
  printf(" time %f flag %u\n", client.time_stamp, client.rw_flag);

  u32 j;

  printf(" ");
  for (j = 0; j < PACKET_DATA_SIZE; j++)
    printf("%x ", client.rx_packet.data[j]);
  printf("\n");

  printf(" ");
  for (j = 0; j < PACKET_DATA_SIZE; j++)
    printf("%x ", client.tx_packet.data[j]);
  printf("\n");

  printf("\n\n");
}

void CServer::ping_request_callback(u32 idx)
{
  u32 j;
  clients[idx].tx_packet.type = PACKET_TYPE_PING;
  for (j = 0; j < PACKET_DATA_SIZE; j++)
    clients[idx].tx_packet.data[j] = (clients[idx].rx_packet.data[j] + 101)%256;
}

void CServer::node_read_request_callback(u32 idx)
{
  clients[idx].tx_packet.type = PACKET_TYPE_COMMON_NODE_READ_REQUEST;
  clients[idx].tx_packet.param = PACKET_PARAM_NO_DATA;

  u32 j;

  for (j = 0; j < rx_packets.size(); j++)
  {
    if (clients[idx].rd_ptr == wr_ptr)
      break;

    clients[idx].rd_ptr = (clients[idx].rd_ptr + 1)%rx_packets.size();

    if (rx_packets[clients[idx].rd_ptr].type == PACKET_TYPE_COMMON_NODE)
    {
      clients[idx].tx_packet = rx_packets[clients[idx].rd_ptr];
      clients[idx].tx_packet.type = PACKET_TYPE_COMMON_NODE_READ_REQUEST;
      clients[idx].tx_packet.param = PACKET_PARAM_OK;
      break;
    }
  }
}

void CServer::robot_read_request_callback(u32 idx)
{
  clients[idx].tx_packet.type = PACKET_TYPE_COMMON_ROBOT_READ_REQUEST;
  clients[idx].tx_packet.param = PACKET_PARAM_NO_DATA;

  u32 j;

  for (j = 0; j < rx_packets.size(); j++)
  {
    if (clients[idx].rd_ptr == wr_ptr)
      break;

    clients[idx].rd_ptr = (clients[idx].rd_ptr + 1)%rx_packets.size();

    if (rx_packets[clients[idx].rd_ptr].type == PACKET_TYPE_COMMON_ROBOT)
    {
      clients[idx].tx_packet = rx_packets[clients[idx].rd_ptr];
      clients[idx].tx_packet.type = PACKET_TYPE_COMMON_ROBOT_READ_REQUEST;
      clients[idx].tx_packet.param = PACKET_PARAM_OK;
      break;
    }
  }
}
