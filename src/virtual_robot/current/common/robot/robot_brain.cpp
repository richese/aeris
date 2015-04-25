#include "robot_brain.h"

CRobotBrain::CRobotBrain(struct sRobot robot, class CCollectiveBrain *collective_brain)
{
	this->robot = robot;

	this->collective_brain = collective_brain;
}
 

CRobotBrain::~CRobotBrain()
{

}

void CRobotBrain::process(struct sRobot *robot)
{
	this->robot = *robot;

	switch (robot->type)
	{
		case ROBOT_TYPE_RED_ROBOT: 		red_robot_process(); break;
		case ROBOT_TYPE_GREEN_ROBOT:	green_robot_process(); break;
		case ROBOT_TYPE_BLUE_ROBOT: 	blue_robot_process(); break;

		case ROBOT_TYPE_RED_PHEROMONE: 	blue_robot_process(); break;
		case ROBOT_TYPE_BLUE_PHEROMONE: 	blue_robot_process(); break;
		case ROBOT_TYPE_GREEN_PHEROMONE: 	blue_robot_process(); break;
		default : break;
	}

	*robot = this->robot;
} 

void CRobotBrain::red_robot_process()
{
	u32 i;
 
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		this->robot.d[i] = sgn( this->robot.sensors[ROBOT_SENSOR_RED_TARGET_POSITION_0_IDX + i] - 
									this->robot.sensors[ROBOT_SENSOR_POSITION_0_IDX + i]);


	if (robot.sensors[ROBOT_SENSOR_RED_TARGET_DISTANCE_IDX] < robot.colision_distance)
		robot.request = REQUEST_ROBOT_RESPAWN;

	u32 tmp = 10000/robot.dt;

	if ((rand()%tmp) == 0)
		robot.request = REQUEST_ROBOT_RESPAWN;

	if ((rand()%1000) == 0)
		robot.request = REQUEST_ROBOT_DELETE;
}

void CRobotBrain::green_robot_process()
{
	u32 i;
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		this->robot.d[i] = rnd_()*0.1;
}


void CRobotBrain::blue_robot_process()
{
	u32 i;
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		this->robot.d[i] = sgn( this->robot.sensors[ROBOT_SENSOR_BLUE_TARGET_POSITION_0_IDX + i] - 
									this->robot.sensors[ROBOT_SENSOR_POSITION_0_IDX + i]);


	//if (robot.sensors[ROBOT_SENSOR_BLUE_TARGET_DISTANCE_IDX] < robot.colision_distance)
	if (robot.sensors[ROBOT_SENSOR_BLUE_TARGET_DISTANCE_IDX] < robot.colision_distance)
		robot.request = REQUEST_ROBOT_RESPAWN;
	
	u32 tmp = 10000/robot.dt;

	if ((rand()%tmp) == 0)
		robot.request = REQUEST_ROBOT_RESPAWN;

	if ((rand()%1000) == 0)
		robot.request = REQUEST_ROBOT_DELETE;
} 