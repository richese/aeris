#include "robot_green_brain.h"


CRobotGreenBrain::CRobotGreenBrain(struct sRobot robot, class CCollectiveBrain *collective_brain)
{
	this->robot = robot;
	this->collective_brain = collective_brain;
}

CRobotGreenBrain::~CRobotGreenBrain()
{

}

void CRobotGreenBrain::process(struct sRobot *robot_)
{
	this->robot = *robot_;

	u32 i;
 
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		robot.d[i] = sgn( robot.sensors[ROBOT_SENSOR_GREEN_TARGET_POSITION_0_IDX + i] - 
						 robot.sensors[ROBOT_SENSOR_POSITION_0_IDX + i]);


	if (robot.sensors[ROBOT_SENSOR_GREEN_TARGET_DISTANCE_IDX] < robot.colision_distance)
		robot.request = REQUEST_ROBOT_RESPAWN;

	if ((rand()%100) == 0)
		robot.request = REQUEST_ROBOT_ADD_GREEN_PHEROMONE;

	u32 tmp = 10000/robot.dt;

	if ((rand()%tmp) == 0)
		robot.request = REQUEST_ROBOT_RESPAWN;


	*robot_ = this->robot;
}