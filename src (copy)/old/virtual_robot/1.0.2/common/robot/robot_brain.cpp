#include "robot_brain.h"

CRobotBrain::CRobotBrain(struct sRobot robot, class CCollectiveBrain *collective_brain)
{
	this->robot = robot;

	this->collective_brain = collective_brain;

	switch (this->robot.type)
	{
		case ROBOT_TYPE_RED_PHEROMONE:
		case ROBOT_TYPE_GREEN_PHEROMONE:
		case ROBOT_TYPE_BLUE_PHEROMONE:
										// this->robot.parameter_f = 1.0; 
										pheromone_brain = new CPheromoneBrain(this->robot.type);
										break;
	}
}
 

CRobotBrain::~CRobotBrain()
{
	switch (this->robot.type)
	{
		case ROBOT_TYPE_RED_PHEROMONE:
		case ROBOT_TYPE_GREEN_PHEROMONE:
		case ROBOT_TYPE_BLUE_PHEROMONE:
										delete pheromone_brain;
										break;
	}
}

struct sRobot CRobotBrain::get()
{
	return this->robot;
}

void CRobotBrain::process(struct sRobot *robot)
{
	this->robot = *robot;

	switch (robot->type)
	{
		case ROBOT_TYPE_RED_ROBOT: 		red_robot_process(); break;
		case ROBOT_TYPE_GREEN_ROBOT:	green_robot_process(); break;
		case ROBOT_TYPE_BLUE_ROBOT: 	blue_robot_process(); break;

		case ROBOT_TYPE_RED_PHEROMONE: 		
		case ROBOT_TYPE_GREEN_PHEROMONE: 	
		case ROBOT_TYPE_BLUE_PHEROMONE: 	pheromone_brain->process(&this->robot); 
											break;

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

	if ((rand()%10) == 0)
		robot.request = REQUEST_ROBOT_ADD_RED_PHEROMONE;

	u32 tmp = 10000/robot.dt;

	if ((rand()%tmp) == 0)
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
		this->robot.d[i] = sgn( this->robot.sensors[ROBOT_SENSOR_BLUE_TARGET_POSITION_0_IDX + i] - 
									this->robot.sensors[ROBOT_SENSOR_POSITION_0_IDX + i]);


	//if (robot.sensors[ROBOT_SENSOR_BLUE_TARGET_DISTANCE_IDX] < robot.colision_distance)
	if (robot.sensors[ROBOT_SENSOR_BLUE_TARGET_DISTANCE_IDX] < robot.colision_distance)
		robot.request = REQUEST_ROBOT_RESPAWN;

	if ((rand()%10) == 0)
		robot.request = REQUEST_ROBOT_ADD_BLUE_PHEROMONE;
	
	u32 tmp = 10000/robot.dt;

	if ((rand()%tmp) == 0)
		robot.request = REQUEST_ROBOT_RESPAWN;
} 

/*
void CRobotBrain::red_robot_pheromone_process()
{
	robot.parameter_f = robot.parameter_f*0.97;

	if (robot.parameter_f < 0.1)
		robot.request = REQUEST_ROBOT_DELETE;
}

void CRobotBrain::green_robot_pheromone_process()
{
	robot.parameter_f = robot.parameter_f*0.971;

	if (robot.parameter_f < 0.1)
		robot.request = REQUEST_ROBOT_DELETE;
}

void CRobotBrain::blue_robot_pheromone_process()
{
	robot.parameter_f = robot.parameter_f*0.973;

	if (robot.parameter_f < 0.1)
		robot.request = REQUEST_ROBOT_DELETE;
}
*/