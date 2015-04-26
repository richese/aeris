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
	pheromone_level = pheromone_level*0.995;

	//refresh value if robot with same color steps on pheromone
	switch (robot->type)
	{
		case ROBOT_TYPE_RED_PHEROMONE: 	if (robot->sensors[ROBOT_SENSOR_RED_DISTANCE_IDX] < robot->colision_distance)
											pheromone_level = 1.0;
										break;

		case ROBOT_TYPE_GREEN_PHEROMONE:if (robot->sensors[ROBOT_SENSOR_GREEN_DISTANCE_IDX] < robot->colision_distance)
											pheromone_level = 1.0;
										break;

		case ROBOT_TYPE_BLUE_PHEROMONE: if (robot->sensors[ROBOT_SENSOR_BLUE_DISTANCE_IDX] < robot->colision_distance)
											pheromone_level = 1.0;
										break;
	}
	

	robot->parameter_f = pheromone_level;
	if (pheromone_level < 0.1)
		robot->request = REQUEST_ROBOT_DELETE;
}