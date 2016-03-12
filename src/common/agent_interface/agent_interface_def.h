#ifndef _AGENT_INTERFACE_DEF_H_
#define _AGENT_INTERFACE_DEF_H_

#include "../common.h"
#include "actions_type_def.h"


#define ACTION_VECTOR_SIZE    ((u32)64)
#define STATE_VECTOR_SIZE     ((u32)64)


struct sAgentInterface
{
  u32 id;
  u32 param;
  double time_stamp;

  u32 action_type;
  u32 type;
  u32 type_behaviour;
  u32 type_interaction;

  i32 value;
  float color_intensity;


  //position
  float x, y, z;

  //angles
  float roll, pitch, yaw;

  float size, dt;

  float action[ACTION_VECTOR_SIZE];
  float state[STATE_VECTOR_SIZE];
};

#define sAgentInterfaceSIZE  (sizeof(struct sAgentInterface))


#define AGENT_STATE_DX_IDX        ((u32)0)
#define AGENT_STATE_DY_IDX        ((u32)1)
#define AGENT_STATE_DZ_IDX        ((u32)2)

#define AGENT_STATE_ROLL_IDX      ((u32)3)
#define AGENT_STATE_PITCH_IDX     ((u32)4)
#define AGENT_STATE_DYAW_IDX      ((u32)5)


#endif
