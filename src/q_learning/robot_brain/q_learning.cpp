#include "q_learning.h"

CQLearning::CQLearning(std::vector<float> state_range_min, std::vector<float> state_range_max,
					   float states_density, u32 actions_per_state, float gamma, float alpha)
{
	u32 i, j;

	action_id = 0;
 	
 	state_idx = 0;
	state_prev_idx = 0;
	action_id_prev = 0;

	this->reward = 0.0;
	this->reward_prev = 0.0;

	this->gamma = gamma;
	this->alpha = alpha;

	this->states_density = states_density;
	this->state_range_min = state_range_min;
	this->state_range_max = state_range_max;

	float tmp = 1.0;

	for (i = 0; i < this->state_range_max.size(); i++)
		tmp = tmp*1.0/this->states_density;

	u32 states_count = tmp;

	printf("states count %u\n", states_count);

	for (j = 0; j < states_count; j++)
	{
		std::vector<float> tmp;
		for (i = 0; i < actions_per_state; i++)
			tmp.push_back(0.0);

		q.push_back(tmp);
	}
}

CQLearning::~CQLearning()
{

}



void CQLearning::process(std::vector<float> state, float reward, float explore_prob)
{
	u32 i, j;

	explore_prob = 0.01;
	//find action using current state and fitness as probability
	action_id = select_action(2.0, explore_prob);

	this->state = state; 


	state_idx = get_state_index_in_table(this->state);

	u32 max_i = 0;
	for (i = 0; i < q[state_idx].size(); i++)
	{
		if (q[state_idx][i] > q[state_idx][max_i])
			max_i = i;
	}

	q[state_prev_idx][action_id_prev] = alpha*q[state_prev_idx][action_id_prev] +
										(1.0 - alpha)*(reward_prev + gamma*q[state_idx][max_i]);

	reward_prev = reward;
	state_prev_idx = state_idx;
	action_id_prev = action_id;
}


u32 CQLearning::get_states_count()
{
	return q.size();
}

u32 CQLearning::get_state_idx()
{
	return state_idx;
}

u32 CQLearning::get_output_id()
{
	return action_id;
} 

std::vector<std::vector<float>> CQLearning::get_q()
{
	return q;
}

void CQLearning::merge_q(std::vector<std::vector<float>> q)
{
	u32 j, i;
	for (j = 0; j < this->q.size(); j++)
		for (i = 0; i < this->q[j].size(); i++)
			this->q[j][i] = max(this->q[j][i], q[j][i]);

	normalise();
}


u32 CQLearning::get_state_index_in_table(std::vector<float> state)
{
	u32 i;

	//check state range
	for (i = 0; i < state.size(); i++)
	{	
		if (state[i] > state_range_max[i])
			state[i] = state_range_max[i];

		if (state[i] < state_range_min[i])
			state[i] = state_range_min[i];
	}

	//normalise state into interval <-1, 1>
	for (i = 0; i < state.size(); i++)
	{
		float k = (1.0 - (-1.0) )/(state_range_max[i] - state_range_min[i]);
		float q = 1.0 - k*state_range_max[i];
		state[i] = k*state[i] + q;
	}


	float tmp = 0.0;

	
	for (i = 0; i < state.size(); i++)
		tmp+= ((state[i] + 1.0)/2.0)/pow(states_density, i+1);

	if (tmp < 0.0)
	{
		tmp = 0.0;
	}

	if (tmp > (q.size()-1))
	{
		tmp = q.size()-1;
	}

	return tmp;
}


u32 CQLearning::select_action(float k, float explore_prob)
{
	u32 i;

	float sum = 0.0;
	float sum_tmp = 0.0;
	float p = abs_(rnd_());
 


	u32 non_visited_action_id = 0;
	bool non_visited_action_found = false;

	for (i = 0; i < q[state_idx].size(); i++)
	{
		sum+= pow(k, q[state_idx][i]);
		if (abs_(q[state_idx][i]) == 0.0)
		{
			non_visited_action_id = i;
			non_visited_action_found = true;
		}
	}

	p = abs_(rnd_());

	if ( (non_visited_action_found == true) && (p < explore_prob ) )
	{
		return non_visited_action_id;
	}
	else
	for (i = 0; i < q[state_idx].size(); i++)
	{
		sum_tmp+= pow(k, q[state_idx][i]);

		if (p < (sum_tmp/sum))
			return i;
	}

	return 0;
}

void CQLearning::normalise()
{
	float max_v = 0.0;
	u32 i, j;

	for (j = 0; j < this->q.size(); j++)
		for (i = 0; i < this->q[j].size(); i++)
			max_v = max(this->q[j][i], max_v);

	if (max_v != 0.0)
		for (j = 0; j < this->q.size(); j++)
			for (i = 0; i < this->q[j].size(); i++)
				this->q[j][i]/= max_v;
}


void CQLearning::print()
{
	u32 j, i;

	printf("\n\nQ table:\n");

	for (j = 0; j < q.size(); j++)
	{
		float max_v = 0.0;
		for (i = 0; i < q[j].size(); i++)
			if (q[j][i] > max_v)
				max_v = q[j][i];

		printf("%6.5f ", max_v);
	}

	printf("\n\n");
}