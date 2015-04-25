#include "robot_brain.h"

CRobotBrain::CRobotBrain(struct sRobot robot)
{
	this->robot = robot;
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
		default : break;
	}

	*robot = this->robot;
} 

void CRobotBrain::red_robot_process()
{
	u32 i;
 
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		this->robot.d[i] = 0.7*sgn( this->robot.sensors[ROBOT_SENSOR_RED_TARGET_POSITION_0_IDX + i] - 
									this->robot.sensors[ROBOT_SENSOR_POSITION_0_IDX + i]);

	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		this->robot.d[i]+= 0.2*rnd_();		


	//if (robot.sensors[ROBOT_SENSOR_RED_TARGET_DISTANCE_IDX] < robot.colision_distance)
	if ((rand()%10000) == 0)
		robot.request = REQUEST_ROBOT_RESPAWN;
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
		this->robot.d[i] = 0.7*sgn( this->robot.sensors[ROBOT_SENSOR_BLUE_TARGET_POSITION_0_IDX + i] - 
									this->robot.sensors[ROBOT_SENSOR_POSITION_0_IDX + i]);

	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		this->robot.d[i]+= 0.1*rnd_();		


	//if (robot.sensors[ROBOT_SENSOR_BLUE_TARGET_DISTANCE_IDX] < robot.colision_distance)
	if ((rand()%10000) == 0)
		robot.request = REQUEST_ROBOT_RESPAWN;
}