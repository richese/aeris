#ifndef _ROBOT_BRAIN_H_
#define _ROBOT_BRAIN_H_

#include "../common.h"


class CRobotBrain
{
	private:
		struct sRobot robot;
		
	public:
		CRobotBrain(struct sRobot robot);
		~CRobotBrain();

		void process(struct sRobot *robot);
};


#endif