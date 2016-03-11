#include "client.h"

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <arpa/inet.h>


CClient::CClient()
{
	cfg_load((char*)CFG_FILE_NAME);
}

CClient::~CClient()
{

}

i32 CClient::main(struct sRobot *rx_packet, struct sRobot *tx_packet)
{
    int sockfd = 0;
    struct sockaddr_in serv_addr; 

    u32 ResultDataSize = sizeof(struct sRobot);

    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
        return -1;
  
    serv_addr.sin_addr.s_addr = inet_addr(cfg_get_server_name());
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(cfg_get_port()); 

    if( connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
        return -3;

    if( send(sockfd, (u8*)tx_packet, ResultDataSize, 0) < 0)
        return -5;
    
    if( recv(sockfd, (u8*)rx_packet, ResultDataSize, 0) < 0)
        return -6;

    close(sockfd);
    return 1;
}