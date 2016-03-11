#ifndef _NODE_DATA_H_
#define _NODE_DATA_H_

#include "../common/common.h"

struct sNodeData
{
  u32   node_id;
  double time_stamp;
  float voltage;
  float temperature;
  float humidity;
  float pressure;
  float light_intesity;
};

#define NODE_DATA_SIZE         ((u32)sizeof(struct sNodeData))

#endif
