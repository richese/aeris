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

i32 CClient::process(struct sAgentInterface *agent_interface)
{
  struct sAgentInterface agent_interface_tmp;

  int sockfd = 0;
  struct sockaddr_in serv_addr;

  if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
      return -1;

  serv_addr.sin_addr.s_addr = inet_addr(cfg_get_ip());
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_port = htons(cfg_get_server_port());

  if( connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
     return -3;

  if( send(sockfd, (u8*)agent_interface, sAgentInterfaceSIZE, 0) < 0)
      return -5; 

  if( recv(sockfd, (u8*)&agent_interface_tmp, sAgentInterfaceSIZE, 0) < 0)
      return -6;

  *agent_interface = agent_interface_tmp;

  close(sockfd);

  return 0;
}
