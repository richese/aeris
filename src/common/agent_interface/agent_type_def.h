#ifndef _AGENT_TYPE_DEF_H_
#define _AGENT_TYPE_DEF_H_

#include "../common.h"

#define AGENT_BOT_SIZE                        10.0

#define AGENT_TYPE_NULL                       ((u32)0)
#define AGENT_TYPE_BOT                        ((u32)1)
#define AGENT_TYPE_VISUALISATION              ((u32)2)

/*
  differen behaviour's types, depend on implemented AI
*/
#define AGENT_TYPE_BEHAVIOUR_NULL             ((u32)0)
#define AGENT_TYPE_BEHAVIOUR_TYPE_0           ((u32)1)
#define AGENT_TYPE_BEHAVIOUR_TYPE_1           ((u32)2)
#define AGENT_TYPE_BEHAVIOUR_TYPE_2           ((u32)3)
#define AGENT_TYPE_BEHAVIOUR_TYPE_3           ((u32)4)
#define AGENT_TYPE_BEHAVIOUR_TYPE_4           ((u32)5)
#define AGENT_TYPE_BEHAVIOUR_TYPE_5           ((u32)6)
#define AGENT_TYPE_BEHAVIOUR_TYPE_6           ((u32)7)
#define AGENT_TYPE_BEHAVIOUR_TYPE_7           ((u32)8)
#define AGENT_TYPE_BEHAVIOUR_TYPE_8           ((u32)9)

#define AGENT_TYPE_BEHAVIOUR_TYPE_COUNT       ((u32)10)


/*
  this is object which can't be seen by virtual or real bot
  just for visualisation
*/
#define AGENT_TYPE_INTERACTION_NULL           ((u32)0)


/*
  this object can be seen and detectected, but can be moved through
*/
#define AGENT_TYPE_INTERACTION_WEAK           ((u32)1)


/*
  this object can be seen and detectected, but can't be moved through
  fe. walls or real robots
*/
#define AGENT_TYPE_INTERACTION_STRONG         ((u32)2)


/*
  this object can be seen and detectected, and can be also moved by other bot
*/
#define AGENT_TYPE_INTERACTION_MOVE           ((u32)3)


#define AGENT_TYPE_INTERACTION_COUNT          ((u32)4)



#define STATE_POSITION_X_OFS                  ((u32)0)
#define STATE_POSITION_Y_OFS                  ((u32)1)
#define STATE_POSITION_Z_OFS                  ((u32)2)


#define STATE_PHEROMONE_OFS                   ((u32)STATE_VECTOR_SIZE-1)


#endif
