#include "robot_blue_brain.h"


CRobotBlueBrain::CRobotBlueBrain(struct sRobot robot, class CCollectiveBrain *collective_brain)
{
	this->robot = robot;
	this->collective_brain = collective_brain;
}

CRobotBlueBrain::~CRobotBlueBrain()
{

}

void CRobotBlueBrain::process(struct sRobot *robot_)
{
	this->robot = *robot_;

	u32 i;
 
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		robot.d[i] = sgn( robot.sensors[ROBOT_SENSOR_BLUE_TARGET_POSITION_0_IDX + i] - 
						 robot.sensors[ROBOT_SENSOR_POSITION_0_IDX + i]);


	if (robot.sensors[ROBOT_SENSOR_BLUE_TARGET_DISTANCE_IDX] < robot.colision_distance)
		robot.request = REQUEST_ROBOT_RESPAWN;

	if ((rand()%100) == 0)
		robot.request = REQUEST_ROBOT_ADD_BLUE_PHEROMONE;

	u32 tmp = 10000/robot.dt;

	if ((rand()%tmp) == 0)
		robot.request = REQUEST_ROBOT_RESPAWN;


	*robot_ = this->robot;
}