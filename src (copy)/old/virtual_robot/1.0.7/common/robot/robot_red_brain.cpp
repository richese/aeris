#include "robot_red_brain.h"


CRobotRedBrain::CRobotRedBrain(struct sRobot robot, class CCollectiveBrain *collective_brain)
{
	this->robot = robot;
	this->collective_brain = collective_brain;
}

CRobotRedBrain::~CRobotRedBrain()
{

}

void CRobotRedBrain::process(struct sRobot *robot_)
{
	this->robot = *robot_;

	u32 i;
 
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		robot.d[i] = sgn( robot.sensors[ROBOT_SENSOR_RED_TARGET_POSITION_0_IDX + i] - 
						 robot.sensors[ROBOT_SENSOR_POSITION_0_IDX + i]);



	robot.request = REQUEST_ROBOT_ADD_RED_PHEROMONE;

	robot.fitness = 0.0;

	if (robot.sensors[ROBOT_SENSOR_RED_TARGET_DISTANCE_IDX] < robot.colision_distance)
	{
		robot.request = REQUEST_ROBOT_RESPAWN;
		robot.fitness = 0.01;
	}


	u32 tmp = (1000*10)/robot.dt;
	if ((rand()%tmp) == 0)
		robot.request = REQUEST_ROBOT_RESPAWN;
	*robot_ = this->robot;
}