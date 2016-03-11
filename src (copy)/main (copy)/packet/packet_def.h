#ifndef _PACKET_DEF_H_
#define _PACKET_DEF_H_

#include "../common/common.h"
#include "node_data.h"
#include "robot_data.h"

#define PACKET_SIZE         ((u32)256)
#define PACKET_DATA_SIZE    ((u32)(PACKET_SIZE - 4*sizeof(u32)))

struct sPacket
{
  u32 destination;
  u32 source;
  u32 type;
  u32 param;

  u8 data[PACKET_DATA_SIZE];
};








#define PACKET_PARAM_NULL                     ((u32)0)
#define PACKET_PARAM_OK                       ((u32)1)
#define PACKET_PARAM_ERROR                    ((u32)2)
#define PACKET_PARAM_NO_DATA                  ((u32)3)

#define PACKET_TYPE_NULL                      ((u32)0)
#define PACKET_TYPE_PING                      ((u32)1)
#define PACKET_TYPE_COMMON_DATA               ((u32)2)



#define PACKET_TYPE_IO_MODULE                  ((u32)1000)
#define PACKET_TYPE_IO_MODULE_READ_REQUEST     ((u32)1001)
#define PACKET_TYPE_IO_MODULE_STATE            ((u32)1002)
#define PACKET_TYPE_IO_MODULE_CONTROLL         ((u32)1003)
#define PACKET_TYPE_IO_MODULE_FIRMWARE         ((u32)1004)
#define PACKET_TYPE_IO_MODULE_1                ((u32)1005)
#define PACKET_TYPE_IO_MODULE_2                ((u32)1006)
#define PACKET_TYPE_IO_MODULE_3                ((u32)1007)
#define PACKET_TYPE_IO_MODULE_4                ((u32)1008)


#define PACKET_TYPE_COMMON_NODE                     ((u32)2000)
#define PACKET_TYPE_COMMON_NODE_READ_REQUEST        ((u32)2001)
#define PACKET_TYPE_COMMON_NODE_STATE               ((u32)2002)
#define PACKET_TYPE_COMMON_NODE_CONTROLL            ((u32)2003)
#define PACKET_TYPE_COMMON_NODE_FIRMWARE            ((u32)2004)
#define PACKET_TYPE_COMMON_NODE_1                   ((u32)2005)
#define PACKET_TYPE_COMMON_NODE_2                   ((u32)2006)
#define PACKET_TYPE_COMMON_NODE_3                   ((u32)2007)
#define PACKET_TYPE_COMMON_NODE_4                   ((u32)2008)


#define PACKET_TYPE_COMMON_ROBOT                    ((u32)3000)
#define PACKET_TYPE_COMMON_ROBOT_READ_REQUEST       ((u32)3001)
#define PACKET_TYPE_COMMON_ROBOT_STATE              ((u32)3002)
#define PACKET_TYPE_COMMON_ROBOT_CONTROLL           ((u32)3003)
#define PACKET_TYPE_COMMON_ROBOT_FIRMWARE           ((u32)3004)
#define PACKET_TYPE_COMMON_ROBOT_1                  ((u32)3005)
#define PACKET_TYPE_COMMON_ROBOT_2                  ((u32)3006)
#define PACKET_TYPE_COMMON_ROBOT_3                  ((u32)3007)
#define PACKET_TYPE_COMMON_ROBOT_4                  ((u32)3008)

#endif
