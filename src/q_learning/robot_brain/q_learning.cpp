#include "q_learning.h"

CQLearning::CQLearning( 
						float states_density, 
						u32 actions_per_state, 
						u32 state_dimensions,
						float gamma, float alpha
						)
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
	
	associative_array = new CAssociativeArray(state_dimensions, states_density);

	for (i = 0; i < state_dimensions; i++)
		state.push_back(0.0);

	for (j = 0; j < associative_array->get_size(); j++)
	{
		std::vector<float> tmp;
		for (i = 0; i < actions_per_state; i++)
			tmp.push_back(-1.0);

		q.push_back(tmp);
	}
}

CQLearning::~CQLearning()
{

}



void CQLearning::process(std::vector<float> state, float reward, float k, float explore_prob)
{
	u32 i;

	//find action using current state and fitness as probability
	action_id = select_action(k, explore_prob);

	this->state = state; 

	state_idx = associative_array->get(this->state);

	u32 max_i = 0;
	for (i = 0; i < q[state_idx].size(); i++)
	{
		if (q[state_idx][i] > q[state_idx][max_i])
			max_i = i;
	}

	q[state_prev_idx][action_id_prev] = 
							alpha*q[state_prev_idx][action_id_prev] +
							(1.0 - alpha)*tanh(reward_prev + gamma*q[state_idx][max_i]);

	reward_prev = reward;
	state_prev_idx = state_idx;
	action_id_prev = action_id;
}

/*
u32 CQLearning::get_states_count()
{
	return q.size();
}

u32 CQLearning::get_state_idx()
{
	return state_idx;
}
*/

u32 CQLearning::get_output_id()
{
	return action_id;
} 


float CQLearning::get_max_q(std::vector<float> state)
{
	u32 state_idx = associative_array->get(state);

	u32 i, max_i = 0;
	for (i = 0; i < q[state_idx].size(); i++)
	{
		if (q[state_idx][i] > q[state_idx][max_i])
			max_i = i;
	}

	return q[state_idx][max_i];
}

std::vector<std::vector<float>> CQLearning::get_q()
{
	return q;
}

float CQLearning::get_q(u32 state_id, u32 action_id)
{
	return q[state_id][action_id];
}
 
void CQLearning::set_q(u32 state_id, u32 action_id, float value)
{
	q[state_id][action_id] = value;
}

void CQLearning::merge(CQLearning *q_learning)
{
	u32 j, i;

	//merge values, in fact, it's max from tables
	for (j = 0; j < q.size(); j++)
		for (i = 0; i < q[j].size(); i++)
		{
			float tmp = max(q_learning->get_q(j, i), q[j][i]);
			q_learning->set_q(j, i, tmp);

			//rewrite local table
			q[j][i] = tmp;
		}

	/*

	//TODO
	normalise();
	q_learning->normalise();

	*/
	
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
		if (q[state_idx][i] == -1.0)
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
	normalise_mat(&this->q);
}