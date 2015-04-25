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
	if ((robot->type&ROBOT_MOVEABLE_FLAG) == 0)
		return;

	this->robot = *robot;

	if (robot->type == ROBOT_TYPE_TARGET)
	{
		u32 i;

		float sum = 0.0;
		for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		{
			float tmp = this->robot.position[i] - ((i32)(this->robot.position[i]/10))*10;
			sum+= tmp*tmp;
		}

		float dist = sqrt(sum)/10.0;

		///if ( rand_() < (0.001 + dist*0.01) )
		if ( (rand_() < 0.001) || 
			 ( (dist > 0.1) && (rand_() < 0.01) ) 
			 )
		{
			this->robot.request = REQUEST_ROBOT_RESPAWN;
			this->robot.parameter = 0;
		} 
	}
	else 
	{
		u32 i;
		for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
			this->robot.d[i] = rnd_()*0.1;

		if (this->robot.angles[0] < this->robot.sensors[ROBOT_SENSOR_TARGET_ANGLE_0_IDX])
			this->robot.angles[0]+= 0.03;
		else
			this->robot.angles[0]-= 0.03;

		// printf("\n %i %f %f \n", this->robot.id, this->robot.position[0], this->robot.position[0]);
	}

	*robot = this->robot;
}