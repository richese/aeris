#include "packet.h"


void packet_init(struct sPacket *packet)
{
  u32 j;
  packet->destination = 0;
  packet->source = 0;
  packet->type = 0;
  packet->param = 0;

  for (j = 0; j < PACKET_DATA_SIZE; j++)
    packet->data[j] = 0;
}

void packet_from_common_data(struct sPacket *packet, u8 *data)
{
  u32 j;
  for (j = 0; j < PACKET_DATA_SIZE; j++)
    packet->data[j] = 0;

  for (j = 0; j < PACKET_DATA_SIZE; j++)
    packet->data[j] = data[j];
}


void common_data_from_packet(struct sPacket packet, u8 *data)
{
  u32 j;
  for (j = 0; j < PACKET_DATA_SIZE; j++)
    data[j] = packet.data[j];
}

void packet_from_node_data(struct sPacket *packet, struct sNodeData node_data)
{
  u32 j;
  for (j = 0; j < PACKET_DATA_SIZE; j++)
    packet->data[j] = 0;

  for (j = 0; j < NODE_DATA_SIZE; j++)
    packet->data[j] = ((u8*)&node_data)[j];
}

void node_data_from_packet(struct sPacket packet, struct sNodeData *node_data)
{
  u32 j;
  for (j = 0; j < NODE_DATA_SIZE; j++)
    ((u8*)node_data)[j] = packet.data[j];
}


void packet_from_robot_data(struct sPacket *packet, struct sRobotData robot_data)
{
  u32 j;
  for (j = 0; j < ROBOT_DATA_SIZE; j++)
    packet->data[j] = 0;

  for (j = 0; j < ROBOT_DATA_SIZE; j++)
    packet->data[j] = ((u8*)&robot_data)[j];
}

void robot_data_from_packet(struct sPacket packet, struct sRobotData *robot_data)
{
  u32 j;
  for (j = 0; j < ROBOT_DATA_SIZE; j++)
    ((u8*)robot_data)[j] = packet.data[j];
}
