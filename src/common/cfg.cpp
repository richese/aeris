#include "cfg.h"

struct sCFG
{
  u32 server_id, server_port;
  char server_ip[256];
  u32 unique_id;
  float dt;
}
  g_cfg;


i32 cfg_init(char *cfg_file_name)
{
  FILE *f;

  f = fopen(cfg_file_name, "r");
  if (f == NULL)
    return -1;

  i32 res = 0;
  res = fscanf(f,"%s", g_cfg.server_ip);
  res = fscanf(f,"%u", &g_cfg.server_port);
  res = fscanf(f,"%u", &g_cfg.server_id);
  res = fscanf(f,"%f", &g_cfg.dt);

  (void)res;

  g_cfg.unique_id = 0;
  do
  {
    g_cfg.unique_id = g_cfg.server_id + getpid() + get_ms_time()*1000000 + rand();
  }
  while (g_cfg.unique_id == 0);

  fclose(f);

  return 0;
}

char* cfg_get_ip()
{
  return g_cfg.server_ip;
}

u32 cfg_get_server_port()
{
  return g_cfg.server_port;
}

u32 cfg_get_server_id()
{
  return g_cfg.server_id;
}

u32 cfg_get_unique_id()
{
  return g_cfg.unique_id;
}

float cfg_get_dt()
{
  return g_cfg.dt;
}
