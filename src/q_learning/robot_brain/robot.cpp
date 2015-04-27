#include "robot.h"

CRobot::CRobot(struct sRobotInitStruct robot_init, std::vector<float> *initial_position, class CCollectiveBrain *collective_brain)
{
	state = 0;
	action_id = 0;
	reward = 0.0;

	this->robot_init = robot_init;

	u32 i, j;

	for (j = 0; j < robot_init.inputs_count; j++)
		input.push_back(0.0);

	for (j = 0; j < robot_init.outputs_count; j++)
		output.push_back(0.0);

	for (j = 0; j < robot_init.outputs_count; j++)
		position.push_back(0.0);

	if (initial_position != NULL)
	{
		for (j = 0; j < robot_init.outputs_count; j++)
			position[j]	= (*initial_position)[j];
	}

	for (j = 0; j < robot_init.path_max_length; j++)
		path.push_back(position);


	alpha = 0.7;
	gamma = 0.9;
	
	float states_density = 1.0/16.0;
	std::vector<float> state_range_min, state_range_max;


	std::vector<std::vector<float>> action_init;

	for (j = 0; j < robot_init.position_max.size(); j++)
	{
		state_range_min.push_back(0.0);
		state_range_max.push_back(robot_init.position_max[j]);
	}
		
	for (j = 0; j < robot_init.actions_per_state; j++)
	{	
		std::vector<float> tmp;
		for (i = 0; i < robot_init.outputs_count; i++)
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
	
	this->collective_brain = collective_brain;
	q_learning 	= new CQLearning(state_range_min, state_range_max, states_density, robot_init.actions_per_state, gamma, alpha);
	actions 	= new CAction(q_learning->get_states_count(), robot_init.actions_per_state, robot_init.outputs_count, &action_init);
}

CRobot::~CRobot()
{
	if (actions != NULL)
	{
		delete actions;
		actions = NULL;
	} 

	if (q_learning != NULL)
	{
		delete q_learning;
		q_learning = NULL;
	}
}



void CRobot::set_input(std::vector<float> input)
{
	u32 j;
	for (j = 0; j < this->input.size(); j++)
		this->input[j] = input[j];
}

void CRobot::set_position(std::vector<float> position)
{
	u32 j;
	for (j = 0; j < this->position.size(); j++)
		this->position[j] = position[j];

	for (j = 0; j < robot_init.path_max_length; j++)
		path[j] = this->position;

}


void CRobot::set_reward(float reward)
{
	this->reward = reward;
}


struct sAction CRobot::get_output_action()
{
	return actions->get(state, action_id);
}
		
std::vector<float> CRobot::get_output()
{
	return actions->get(state, action_id).action;
}

u32 CRobot::get_output_action_id()
{
	return action_id;
}

u32 CRobot::get_output_action_fitness()
{
	return actions->get(state, action_id).fitness;
}


std::vector<float> CRobot::get_position()
{
	return position;
}

u32 CRobot::get_state()
{
	return state;
}

u32 CRobot::get_type()
{
	return robot_init.type;
}

void CRobot::reset()
{
	state = 0;
	action_id = 0;

	u32 j;

	for (j = 0; j < this->position.size(); j++)
		position[j] = 0.0;
}

void CRobot::process(float reward)
{
	u32 i;
	std::vector<float> state_vect;

	state_vect = position;
	q_learning->process(state_vect, reward, 0.1);
	state = q_learning->get_state_idx();
	action_id =  q_learning->get_output_id();
}

void CRobot::print()
{
	u32 i;

	CLog *log_q_learing;

	log_q_learing = new CLog((char*)"q_map.txt", 5);

	float error_average = 0.0;
	float error_max = 0.0;
	float error_cnt = 0.0;

	std::vector<std::vector<float>> q;
	q = q_learning->get_q();

	float x, y;

	float step = 1.0/2.0;
 
	for (y = 0.0; y < robot_init.position_max[1]; y+=step)
	{
		for (x = 0.0; x < robot_init.position_max[0]; x+=step)
		{
			std::vector<float> state;

			state.push_back(x);
			state.push_back(y);

			u32 state_idx = q_learning->get_state_index_in_table(state);

			float max_v = 0.0;
			for (i = 0; i < q[state_idx].size(); i++)
				if (q[state_idx][i] > max_v)
					max_v = q[state_idx][i];
			
			printf("%6.4f ", max_v); 

			log_q_learing->add(0, x);
			log_q_learing->add(1, y);
			log_q_learing->add(2, max_v);


			float target_x = robot_init.position_max[0]/2.0;
			float target_y = robot_init.position_max[1]/2.0;
			float dist = abs_(x - target_x) + abs_(y - target_y);
			dist = pow(0.9, dist);

			float error = dist - max_v;

			log_q_learing->add(3, dist);

			log_q_learing->add(4, error);

			error_average+= abs_(error);

			if (abs_(error) > error_max)
				error_max = abs_(error);

			error_cnt++;
		}

		printf("\n");
	}

	printf("\n");

	log_q_learing->save();

	printf("average error %f\n", error_average/error_cnt);
	printf("maximum error %f\n", error_max);
}
 
void CRobot::merge_q(std::vector<std::vector<float>> q)
{ 
	q_learning->merge_q(q);
}

std::vector<std::vector<float>> CRobot::get_q()
{
	return q_learning->get_q();
}
