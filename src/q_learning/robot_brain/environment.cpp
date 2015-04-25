#include "environment.h"


float vect_dist(std::vector<float> va, std::vector<float> vb)
{
	float res = 0.0;
	u32 j;

	for (j = 0; j < va.size(); j++)
	{
		float tmp = va[j] - vb[j];
		res+= tmp*tmp;
	}

	return sqrt(res);
}

CEnvironment::CEnvironment(u32 robots_count, struct sRobotInitStruct robot_init)
{
 	u32 j;

 	this->robot_init = robot_init;

 	for (j = 0; j < robots_count; j++)
 	{
 		class CRobot *robot;
 		robot = new CRobot(robot_init);

 		robots.push_back(robot);
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
}

void CEnvironment::process(u32 iteration)
{
	u32 j, i;

	std::vector<float> target_position, trap_position;

	for (i = 0; i < robot_init.outputs_count; i++) 
	{
		target_position.push_back(robot_init.position_max[i]/2.0);
		trap_position.push_back(robot_init.position_max[i]/3.0);
	}
	

	for (j = 0; j < robots.size(); j++)
	{
		std::vector<float> robot_output, robot_position;

		robot_output = robots[j]->get_output();
		robot_position = robots[j]->get_position();

		float target_dist  = vect_dist(target_position, robot_position);
		float trap_dist  = vect_dist(trap_position, robot_position);
		
		float reward = 0.0;

		//reward = 1.0/(1.0 + target_dist);

		if (target_dist < 0.01)
			reward+= 1.0; 
		/*
		if (trap_dist < 2.0)
			reward = -10.0; 
		*/

		robots[j]->process(reward);
	
		if (vect_dist(target_position, robot_position) < 0.01)
		{		
			for (i = 0; i < robots.size(); i++)
				robots[i]->merge_q(robots[j]->get_q());

			respawn(j);
			printf("robot %u on target\n", j);
		}
		else
		{
			for (i = 0; i < robot_init.outputs_count; i++)
			{
				float tmp = robot_position[i] + robot_output[i]; 

				if ( (tmp >= 0.0) && (tmp < robot_init.position_max[i] ) )
					robot_position[i] = tmp;
			}

			robots[j]->set_position(robot_position);
		}

	}
}

void CEnvironment::print()
{
	robots[0]->print();
}
 

void CEnvironment::respawn(u32 robot_id)
{
	u32 i;

	std::vector<float> position;
	for (i = 0; i < robot_init.outputs_count; i++)
	{
		position.push_back( floor(abs_(rnd_()*robot_init.position_max[i])));
	}

	robots[robot_id]->reset();
	robots[robot_id]->set_position(position);
}