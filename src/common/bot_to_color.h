#ifndef _BOT_TO_COLOR_H_
#define _BOT_TO_COLOR_H_

#include "common.h"


struct sBotColor
{
  float r, g, b;
};

struct sBotColor bot_to_color(struct sAgentInterface agent_interface);


#endif
