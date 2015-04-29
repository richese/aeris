#ifndef _ROBOT_BLUE_BRAIN_H_
#define _ROBOT_BLUE_BRAIN_H_

#include "../common.h"

#include "collective_brain.h"
#include "q_learning.h"
#include "action.h"


class CRobotBlueBrain
{
	private:
			struct sRobot robot;
			class CCollectiveBrain *collective_brain;


			class CQLearning *q_learning;
			class CAction *actions;

	public:
		CRobotBlueBrain(struct sRobot robot, class CCollectiveBrain *collective_brain = NULL);
		~CRobotBlueBrain();

		void process(struct sRobot *robot_);
};

#endif