#include "../common/common.h"
#include "node.h"

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

  u32 j, nodes_count = 32;
  std::vector<class CNode*> nodes;

  for (j = 0; j < nodes_count; j++)
    nodes.push_back(new CNode());

  while (getch() == -1)
  {
    for (j = 0; j < nodes_count; j++)
    {
      nodes[j]->process();
    }

    usleep(1000*200);
  }

  for (j = 0; j < nodes_count; j++)
    delete nodes[j];


  g_debug_log_add((char*)"main",(char*)"program done");
  return 0;
}
