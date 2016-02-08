#include "../common/common.h"

int main()
{
  if ( g_debug_log_init((char*)"debug_log.txt") != 0)
  {
    printf("debug log opening error\n");
    return -1;
  }

  if (g_error_log_init((char*)"error_log.txt") != 0)
  {
    printf("error log opening error\n");
    return -1;
  }

  if (cfg_init((char*)"../../configure.txt") != 0)
  {
    printf("config file opening error\n");
    return -1;
  }

  class CClient *client;
  client = new CClient();

  while (1)
  {
    struct sPacket rx_packet, tx_packet;

    tx_packet.destination = cfg_get_server_id();
    tx_packet.source = cfg_get_unique_id();
    tx_packet.type = PACKET_TYPE_PING;
    tx_packet.param = 0;

    u32 j;
    for (j = 0; j < PACKET_DATA_SIZE; j++)
      tx_packet.data[j] = rand()%256;


    i32 res, ping_res;
    res = client->connect_to_server(&rx_packet, &tx_packet);

    ping_res = 1;
    for (j = 0; j < PACKET_DATA_SIZE; j++)
    {
      if  (rx_packet.data[j] != ((tx_packet.data[j] + 101)%256))
      {
        ping_res = -j;
        break;
      }
    }

    printf("client %u connecting to %s result %i, ping res %i\n", cfg_get_unique_id(), cfg_get_ip(), res, ping_res);

    if ((ping_res < 0) || (res < 0))
      g_error_log_add((char*)"ping error", 10, ping_res);


    usleep(1000*20);
  }

  delete client;

  g_debug_log_add((char*)"main",(char*)"program done");
  return 0;
}
