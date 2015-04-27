#ifndef _ROBOT_RED_BRAIN_H_
#define _ROBOT_RED_BRAIN_H_

#include "../common.h"

#include "collective_brain.h"
#include "q_learning.h"


class CRobotRedBrain
{
	private:
			struct sRobot robot;
			class CCollectiveBrain *collective_brain;

	public:
		CRobotRedBrain(struct sRobot robot, class CCollectiveBrain *collective_brain = NULL);
		~CRobotRedBrain();

		void process(struct sRobot *robot_);
};

#endif