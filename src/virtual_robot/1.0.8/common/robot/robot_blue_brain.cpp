#include "robot_blue_brain.h"


CRobotBlueBrain::CRobotBlueBrain(struct sRobot robot, class CCollectiveBrain *collective_brain)
{
	this->robot = robot;
	this->collective_brain = collective_brain;

	std::vector<float> state_range_min, state_range_max;

	u32 i, j;

	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
	{
		state_range_min.push_back(-robot.position_max[i]);
		state_range_max.push_back(-robot.position_max[i]);
	}

	u32 actions_per_state = 4;

	float states_density = 1.0/16.0;
	float gamma = 0.7;
	float alpha = 0.9;

	std::vector<std::vector<float>> action_init;

	for (j = 0; j < actions_per_state; j++)
	{	
		std::vector<float> tmp;
		for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		{
			float f = 0.0;

			if (i == (j/2))
			{
				if ((j%2) == 0)
					f = 1.0;
				else
					f = -1.0;
			}
			
			tmp.push_back(f);
			}

		action_init.push_back(tmp);	
	}
	
	q_learning = new CQLearning(state_range_min, state_range_max, states_density, actions_per_state, gamma, alpha);
	actions 	= new CAction(q_learning->get_states_count(), actions_per_state, ROBOT_SPACE_DIMENSION, &action_init);
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
	
	
	// robot.request = REQUEST_ROBOT_ADD_BLUE_PHEROMONE;

	robot.fitness = 0.0;
	robot.reward = 0.0;

	if (robot.sensors[ROBOT_SENSOR_BLUE_TARGET_DISTANCE_IDX] < robot.colision_distance)
	{
		robot.reward = robot.sensors[ROBOT_SENSOR_REWARD_IDX];
		robot.request = REQUEST_ROBOT_RESPAWN;
		robot.fitness = 0.01;

		q_learning->print();
	}

	std::vector<float> state_vect;

	state_vect.push_back(robot.sensors[ROBOT_SENSOR_POSITION_0_IDX]);
	state_vect.push_back(robot.sensors[ROBOT_SENSOR_POSITION_1_IDX]);

	q_learning->process(state_vect, robot.reward, 0.1);
	u32 state = q_learning->get_state_idx();
	u32 action_id =  q_learning->get_output_id();

	std::vector<float> res;
	res = actions->get(state, action_id).action;

	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		robot.d[i] = 2.0*res[i];


	u32 tmp = (1000*10)/robot.dt;
	if ((rand()%tmp) == 0)
		robot.request = REQUEST_ROBOT_RESPAWN;

	*robot_ = this->robot;
}