#include "environment.h"


float vect_dist(float *va, float *vb, u32 size)
{
	float res = 0.0;
	u32 j;

	for (j = 0; j < size; j++)
	{
		float tmp = va[j] - vb[j];
		res+= tmp*tmp;
	}

	return sqrt(res);
}

CEnvironment::CEnvironment(u32 robots_count, struct sRobot robot_init)
{
 	u32 j;

 	this->robot_init = robot_init;

 	//this robot is for sharing solution
 	collective_robot = new CRobotBrain(robot_init, NULL);

 	for (j = 0; j < robots_count; j++)
 	{
 		class CRobotBrain *robot; 


 		respawn(&robot_init);

 		robot = new CRobotBrain(robot_init, collective_robot);

 		robots.push_back(robot);

 		s_robots.push_back(robot_init);
 	}
}

CEnvironment::CEnvironment(char *file_name)
{

}

CEnvironment::~CEnvironment()
{
	u32 j;
	for (j = 0; j < robots.size(); j++)
		if (robots[j] != NULL)
		{
			delete robots[j];
			robots[j] = NULL;
		}

	delete collective_robot;
}

void CEnvironment::process(u32 iteration)
{
	u32 j, i;

	float target_position[ROBOT_SPACE_DIMENSION];

	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++) 
	{
		target_position[i] = robot_init.position_max[i]/2.0;
	}
	

	for (j = 0; j < robots.size(); j++)
	{
		float target_dist  = vect_dist(target_position, s_robots[j].position, ROBOT_SPACE_DIMENSION);
		
		float reward = 0.0;


		if (target_dist < 0.01)
			reward+= 1.0; 	
		

		s_robots[j].reward = reward;

		s_robots[j].sensors[ROBOT_SENSOR_POSITION_0_IDX] = s_robots[j].position[0];
		s_robots[j].sensors[ROBOT_SENSOR_POSITION_1_IDX] = s_robots[j].position[1];

		

		robots[j]->process(&s_robots[j]);

		// non zero reward, add some information into collective brain
		if (reward != 0.0)
		{
			robots[j]->merge();
			
			//send this information to all robots
			for (i = 0; i < robots.size(); i++)
				robots[i]->merge();
		}
	
		if (vect_dist(target_position, s_robots[j].position, ROBOT_SPACE_DIMENSION) < 0.01)
		{
			respawn(&s_robots[j]);
			printf("robot %u on target\n", j);
		}
		else
		{
			for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
			{
				float tmp = s_robots[j].position[i] + s_robots[j].d[i];


				if ( (tmp >= 0.0) && (tmp < robot_init.position_max[i] ) )
					s_robots[j].position[i] = tmp;
			}
		}

	}
}

void CEnvironment::print()
{
 	collective_robot->print();
}
 

void CEnvironment::respawn(struct sRobot *robot)
{
	u32 i;

	std::vector<float> position;
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
	{
		float tmp = floor(abs_(rnd_()*robot_init.position_max[i]));
		
		robot->position[i] = tmp;
		robot->position_max[i] = robot_init.position_max[i];

		robot->force_max[i] = 0.0;
		robot->force[i] = 0.0;
		robot->d[i] = 0.0;

		robot->angles[i] = 0.0;
	}

	for (i = 0; i < ROBOT_SENSORS_COUNT; i++)
		robot->sensors[i] = 0.0;
}