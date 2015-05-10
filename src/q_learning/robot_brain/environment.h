#ifndef _ENVIRONMENT_H_
#define _ENVIRONMENT_H_

#include "robot_brain.h"

class CEnvironment
{
	private:

		struct sRobot robot_init;
		std::vector<class CRobotBrain *> robots;
		std::vector<struct sRobot> s_robots;
		

		class CRobotBrain *collective_robot;

	public:
		CEnvironment(u32 robots_count, struct sRobot robot_init);
		CEnvironment(char *file_name);

		~CEnvironment();	


		void process(u32 iteration = 0);
		void print();

	private:
		void respawn(struct sRobot *robot); 
};

#endif
