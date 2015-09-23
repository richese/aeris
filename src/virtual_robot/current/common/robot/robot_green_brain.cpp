#include "robot_green_brain.h"


CRobotGreenBrain::CRobotGreenBrain(struct sRobot robot, class CCollectiveBrain *collective_brain)
{
	this->robot = robot;
	this->collective_brain = collective_brain;

	state = 0;
}

CRobotGreenBrain::~CRobotGreenBrain()
{

}

void CRobotGreenBrain::process(struct sRobot *robot_)
{
	this->robot = *robot_;

	u32 i;

	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		robot.d[i] = 0.0;
		/*
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		robot.d[i] = sgn( robot.sensors[ROBOT_SENSOR_GREEN_TARGET_POSITION_0_IDX + i] -
						 robot.sensors[ROBOT_SENSOR_POSITION_0_IDX + i]);
	*/

	float speed = 0.2;
	switch (state)
	{
		case 0: robot.d[0] = 1.0*speed; robot.d[1] = 0.0*speed; break;
		case 1: robot.d[0] = 0.0*speed; robot.d[1] = 1.0*speed; break;

		case 2: robot.d[0] = -1.0*speed; robot.d[1] = 0.0*speed; break;
		case 3: robot.d[0] = 0.0*speed; robot.d[1] = -1.0*speed; break;
	}

	if (rand_() < 0.001)
		state = (state+1)%4;

	//robot.request = REQUEST_ROBOT_ADD_GREEN_PHEROMONE;
	robot.request = REQUEST_ROBOT_ADD_PATH;

	robot.fitness = 0.0;

	if (robot.sensors[ROBOT_SENSOR_GREEN_TARGET_DISTANCE_IDX] < robot.colision_distance)
	{
		robot.request = REQUEST_ROBOT_RESPAWN;
		robot.fitness = 0.01;
	}


	*robot_ = this->robot;
}
