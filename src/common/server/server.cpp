#include "server.h"

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/select.h>


CServer::CServer(class CAgentGroup *agent_group, i32(*call_back)(struct sAgentInterface *))
{
  this->agent_group = agent_group;
  this->portno = cfg_get_server_port();
  this->call_back = call_back;

  server_thread = NULL;
}

CServer::~CServer()
{
  server_run = 0;
  if (server_thread != NULL) {
    server_thread->join();
    delete server_thread;
  }
}

i32 CServer::start()
{
  server_run = 1;

  server_thread = new std::thread(&CServer::start_, this);

  return 0;
}




i32 CServer::start_()
{
  struct sockaddr_in serv_addr;

  i32 server_listen_fd;

  server_listen_fd = socket(AF_INET, SOCK_STREAM, 0);

  if (server_listen_fd < 0)
    error(-3);

  memset(&serv_addr, '0', sizeof(serv_addr));

  serv_addr.sin_family = AF_INET;
  serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
  serv_addr.sin_port = htons(portno);

  if (bind(server_listen_fd, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0)
    error(-4);

  if (listen(server_listen_fd, 10) < 0)
    error(-5);

  while (server_run)
  {
    fd_set listen_fd_set;
    struct timeval listen_timeout;

    FD_ZERO(&listen_fd_set);
    FD_SET(server_listen_fd, &listen_fd_set);
    listen_timeout.tv_sec = 1;
    listen_timeout.tv_usec = 0;

    if (select(server_listen_fd + 1, &listen_fd_set, NULL, NULL, &listen_timeout) < 0) {
      error(-6);
    }

    if (FD_ISSET(server_listen_fd, &listen_fd_set)) {
      int conn_fd;
      struct sockaddr_in client;
      int c = sizeof(struct sockaddr_in);

      conn_fd = accept(server_listen_fd, (struct sockaddr *)&client, (socklen_t*)&c);

      if (conn_fd < 0)
        error(-7);

      struct sAgentInterface agent_interface;
      //read data from connection
      if (read(conn_fd, (u8*)(&agent_interface), sAgentInterfaceSIZE) < 0)
        error(-8);

      i32 error_res = agent_group->update_agent(&agent_interface, call_back);
      (void)error_res;

      if (write(conn_fd, (u8*)(&agent_interface), sAgentInterfaceSIZE) < 0)
        error(-9);

      close(conn_fd);
    }
  }

  close(server_listen_fd);

  return 0;
}

void CServer::error(i32 error_res)
{
  g_error_log_add((char*)"server init failed", ERROR_SERVER_INIT_FAILED, error_res);
  exit(0);
}

void CServer::kill_zombies()
{
  agent_group->kill_zombies();
}
