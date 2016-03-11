#ifndef _COMMON_H_
#define _COMMON_H_

#ifndef _BSD_SOURCE
#define _BSD_SOURCE
#endif

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
#include <vector>
#include <thread>
#include <mutex>
#include <unistd.h>
#include <string.h>

#include "int_def.h"
#include "log.h"
#include "math.h"

#include "debug_log.h"
#include "error_log.h"
#include "errors.h"
#include "getch.h"
#include "time.h"

#include "cfg.h"


#include "agent_interface/agent_type_def.h"
#include "agent_interface/actions_type_def.h"
#include "agent_interface/agent_interface_def.h"
#include "agent_interface/agent_interface.h"
#include "agent_interface/agent_group.h"

#include "bot_to_color.h"

#include "server/server.h"
#include "client/client.h"

#include "map/map.h"
#include "environment/environment.h"


#endif
