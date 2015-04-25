#ifndef _C_ROBOT_H_
#define _C_ROBOT_H_

#include "../common.h"

class CRobot
{
	private:
		struct sRobot robot;
		class CRobotBrain *robot_brain;
		class CClient *client;

		u32 state; 
	public:
		CRobot(u32 robot_type = ROBOT_TYPE_COMMON);
		~CRobot();

		void main();

};


#endif