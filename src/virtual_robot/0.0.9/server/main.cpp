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
	server_main();

	return 0;
} 