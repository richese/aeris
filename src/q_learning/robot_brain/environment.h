#ifndef _ENVIRONMENT_H_
#define _ENVIRONMENT_H_

#include "robot.h"

class CEnvironment
{
	private:

		struct sRobotInitStruct robot_init;
		std::vector<class CRobot *> robots;

	public:
		CEnvironment(u32 robots_count, struct sRobotInitStruct robot_init);
		CEnvironment(char *file_name);

		~CEnvironment();	


		void process(u32 iteration = 0);
		void print();

	private:
		void respawn(u32 robot_id); 
};

#endif
