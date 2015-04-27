#ifndef _ROBOT_GREEN_BRAIN_H_
#define _ROBOT_GREEN_BRAIN_H_

#include "../common.h"

#include "collective_brain.h"
#include "q_learning.h"


class CRobotGreenBrain
{
	private:
			struct sRobot robot;
			class CCollectiveBrain *collective_brain;

	public:
		CRobotGreenBrain(struct sRobot robot, class CCollectiveBrain *collective_brain = NULL);
		~CRobotGreenBrain();

		void process(struct sRobot *robot_);
};

#endif