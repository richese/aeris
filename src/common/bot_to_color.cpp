#include "bot_to_color.h"

struct sBotColor bot_to_color(struct sAgentInterface agent_interface)
{
  float r = 1.0, g = 1.0, b = 1.0;

  switch (agent_interface.type_behaviour)
  {
    case AGENT_TYPE_BEHAVIOUR_NULL:   r = 1.0, g = 1.0, b = 1.0; break;

    case AGENT_TYPE_BEHAVIOUR_TYPE_0: r = 0.0, g = 0.0, b = 1.0; break;
    case AGENT_TYPE_BEHAVIOUR_TYPE_1: r = 1.0, g = 0.0, b = 0.0; break;
    case AGENT_TYPE_BEHAVIOUR_TYPE_2: r = 0.0, g = 1.0, b = 0.0; break;

    case AGENT_TYPE_BEHAVIOUR_TYPE_3: r = 0.0, g = 1.0, b = 1.0; break;
    case AGENT_TYPE_BEHAVIOUR_TYPE_4: r = 1.0, g = 1.0, b = 0.0; break;
    case AGENT_TYPE_BEHAVIOUR_TYPE_5: r = 1.0, g = 0.0, b = 1.0; break;

    case AGENT_TYPE_BEHAVIOUR_TYPE_6: r = 0.0, g = 1.0, b = 0.5; break;
    case AGENT_TYPE_BEHAVIOUR_TYPE_7: r = 0.5, g = 1.0, b = 0.0; break;
    case AGENT_TYPE_BEHAVIOUR_TYPE_8: r = 1.0, g = 0.0, b = 0.0; break;
  }

  struct sBotColor res;
  res.r = r;
  res.g = g;
  res.b = b;

  return res;
}

struct sBotColor uint_to_color(u32 color, u32 colors_count)
{
  struct sBotColor res;
  res.r = ((color + (colors_count*0)/3)%colors_count)*1.0/colors_count;
  res.g = ((color + (colors_count*1)/3)%colors_count)*1.0/colors_count;
  res.b = ((color + (colors_count*2)/3)%colors_count)*1.0/colors_count;

  return res;
}
