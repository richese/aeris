#include "common.h"

void server_main()
{
	class CServer *server;
	server = new CServer();

	server->main();

	delete server;
}

int main()
{
	debug_log_init((char*)"server_debug_log.txt");
	server_main();

	return 0;
} 