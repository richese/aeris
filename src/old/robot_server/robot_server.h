#ifndef _ROBOT_SERVER_H_
#define _ROBOT_SERVER_H_

#include "common.h"


class CRobotServer
{
	private:
		
		std::thread *server_main_thread;

	public:
		CRobotServer();
		~CRobotServer();


		void server_run();
};

#endif