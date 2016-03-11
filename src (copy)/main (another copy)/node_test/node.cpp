#include "node.h"


CNode::CNode(char *serial_port_name, u32 baud_rate)
{
  node_data.node_id = rand() + getpid();
  node_data.time_stamp = get_ms_time();
  node_data.voltage = 0.0;
  node_data.temperature = 0.0;
  node_data.humidity = 0.0;
  node_data.pressure = 0.0;
  node_data.light_intesity = 0.0;

  period = 100;

  client = new CClient();

}

CNode::~CNode()
{
  delete client;
}


float CNode::rnd()
{
  return ((rand()%20000000) - 10000000)/20000000.0;
}

void CNode::process()
{
  if ((u32)(rand()%1000) < period)
  {
    node_data.time_stamp = get_ms_time();
    node_data.voltage = 3.3*(rnd() + 1.0)/2.0;
    node_data.temperature = rnd()*50.0;
    node_data.humidity = (rnd() + 1.0)/2.0;
    node_data.pressure = 100*(rnd() + 1.0)/2.0;
    node_data.light_intesity = 1000*(rnd() + 1.0)/2.0;

    struct sPacket rx_packet, tx_packet;

    tx_packet.destination = cfg_get_server_id();
    tx_packet.source = cfg_get_unique_id();
    tx_packet.type = PACKET_TYPE_COMMON_NODE;
    tx_packet.param = 0;

    packet_from_node_data(&tx_packet, node_data);

    i32 res;
    res = client->connect_to_server(&rx_packet, &tx_packet);

    if (res < 0)
      g_error_log_add((char*)"connection error", 10, res);

    // printf("client %u connecting to %s result %i\n", cfg_get_unique_id(), cfg_get_ip(), res);
  }
}

i32 CNode::process_reading(u32 log_enabled)
{
  struct sPacket rx_packet, tx_packet;

  tx_packet.destination = cfg_get_server_id();
  tx_packet.source = cfg_get_unique_id();
  tx_packet.type = PACKET_TYPE_COMMON_NODE_READ_REQUEST;
  tx_packet.param = 0;

  i32 res;
  res = client->connect_to_server(&rx_packet, &tx_packet);

  if (res < 0)
    g_error_log_add((char*)"connection error", 10, res);

  //check connection, packet type and new data
  if ((res == 0) && (rx_packet.type == PACKET_TYPE_COMMON_NODE_READ_REQUEST) &&  (rx_packet.param == PACKET_PARAM_OK))
  {
    node_data_from_packet(rx_packet, &node_data);

    if (log_enabled != 0)
    {
      char node_name[256];
      sprintf(node_name,"node_log/%10u", node_data.node_id);
      FILE *f = fopen(node_name, "a+");

      fprintf(f,"%f %f %f %f %f %f\n",
          node_data.time_stamp,
          node_data.voltage,
          node_data.temperature,
          node_data.humidity,
          node_data.pressure,
          node_data.light_intesity
        );

      fclose(f);
    }

    return 0;
  }

  return -1;
}

void CNode::print()
{
  printf("\n");
  printf("id : %u\n", node_data.node_id);
  printf("  time stamp : %f\n", node_data.time_stamp);
  printf("  voltage : %6.3f\n", node_data.voltage);
  printf("  temperature : %6.3f\n", node_data.temperature);
  printf("  humidity : %6.3f\n", node_data.humidity);
  printf("  pressure : %6.3f\n", node_data.pressure);
  printf("  light intesity : %6.3f\n", node_data.light_intesity);
  printf("\n");
}
