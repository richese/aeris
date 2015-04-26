#ifndef _PHEROMONE_BRAIN_H_
#define _PHEROMONE_BRAIN_H_

#include "../common.h"

class CPheromoneBrain
{
	private:
		u32 type;
		float pheromone_level;

	public:
		CPheromoneBrain(struct sRobot robot, class CCollectiveBrain *collective_brain = NULL);
		~CPheromoneBrain();

		void process(struct sRobot *robot);
};


#endif