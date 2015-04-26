#include "pheromone_brain.h"


	
CPheromoneBrain::CPheromoneBrain(u32 type)
{
	this->type = type;
	pheromone_level = 1.0;
}

CPheromoneBrain::~CPheromoneBrain()
{

}

void CPheromoneBrain::process(struct sRobot *robot)
{
	//TODO add more realistic difference equation, see papers about real ant's pheromones
	pheromone_level = pheromone_level*0.98;

	robot->parameter_f = pheromone_level;
	if (pheromone_level < 0.1)
		robot->request = REQUEST_ROBOT_DELETE;
}