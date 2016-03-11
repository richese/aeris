#include "client.h"


#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>

CClient::CClient()
{

}

CClient::~CClient()
{

}

i32 CClient::connect_to_server(struct sPacket *rx_packet, struct sPacket *tx_packet)
{
  packet_init(rx_packet);

  tx_packet->source = cfg_get_unique_id();
  tx_packet->destination = cfg_get_server_id();


  int sockfd = 0;
  struct sockaddr_in serv_addr;

  if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
      return -1;

  serv_addr.sin_addr.s_addr = inet_addr(cfg_get_ip());
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_port = htons(cfg_get_server_port());

  if( connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
     return -3;

  if( send(sockfd, (u8*)tx_packet, PACKET_SIZE, 0) < 0)
      return -5;

  if( recv(sockfd, (u8*)rx_packet, PACKET_SIZE, 0) < 0)
      return -6;

  close(sockfd);

  return 0;
}
