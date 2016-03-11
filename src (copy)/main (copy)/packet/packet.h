#ifndef _PACKET_H_
#define _PACKET_H_

#include "../common/common.h"

void packet_init(struct sPacket *packet);

void packet_from_common_data(struct sPacket *packet, u8 *data);
void common_data_from_packet(struct sPacket packet, u8 *data);

void packet_from_node_data(struct sPacket *packet, struct sNodeData node_data);
void node_data_from_packet(struct sPacket packet, struct sNodeData *node_data);

void packet_from_robot_data(struct sPacket *packet, struct sRobotData robot_data);
void robot_data_from_packet(struct sPacket packet, struct sRobotData *robot_data);

#endif
