#include "pheromone_brain.h"


	
CPheromoneBrain::CPheromoneBrain(struct sRobot robot, class CCollectiveBrain *collective_brain)
{
	pheromone_level = 1.0;
}

CPheromoneBrain::~CPheromoneBrain()
{

}

void CPheromoneBrain::process(struct sRobot *robot)
{
	//TODO add more realistic difference equation, 
	//see papers about real ant's pheromones

	float alpha = robot->dt/(robot->dt + 1000.0);
	pheromone_level = pheromone_level*(1.0-alpha);

	//refresh value if robot with same color steps on pheromone
	switch (robot->type)
	{
		case ROBOT_TYPE_RED_PHEROMONE: 	if (robot->sensors[ROBOT_SENSOR_RED_DISTANCE_IDX] < robot->colision_distance)
											pheromone_level+= 0.2;
										break;

		case ROBOT_TYPE_GREEN_PHEROMONE:if (robot->sensors[ROBOT_SENSOR_GREEN_DISTANCE_IDX] < robot->colision_distance)
											pheromone_level+= 0.2;
										break;

		case ROBOT_TYPE_BLUE_PHEROMONE: if (robot->sensors[ROBOT_SENSOR_BLUE_DISTANCE_IDX] < robot->colision_distance)
											pheromone_level+= 0.2;
										break;
	}

	if (pheromone_level > 1.0)
		pheromone_level = 1.0;
	

	robot->parameter_f = pheromone_level;
	if (pheromone_level < 0.1)
		robot->request = REQUEST_ROBOT_DELETE;
}