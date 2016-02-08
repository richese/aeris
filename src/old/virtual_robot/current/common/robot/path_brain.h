#ifndef _PATH_BRAIN_H_
#define _PATH_BRAIN_H_

#include "../common.h"

#include "collective_brain.h"
#include "q_learning.h"
#include "action.h"


class CPathBrain
{
	private:
			struct sRobot robot;
			class CCollectiveBrain *collective_brain;

            float path_level;

	public:
		CPathBrain(struct sRobot robot, class CCollectiveBrain *collective_brain = NULL);
		~CPathBrain();

		void process(struct sRobot *robot_);
};


#endif
