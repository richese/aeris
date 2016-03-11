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

  class CNode *node;
  node = new CNode();


  while (getch() == -1)
  {
    i32 res = node->process_reading(1);

    if (res == 0)
    {
      // node->print();
    }
    else
    {
      // printf("waiting for data\n");
      usleep(1000*1000);
    }
  }

  delete node;

  g_debug_log_add((char*)"main",(char*)"program done");
  return 0;
}
