#include "q_learning.h"

CQLearning::CQLearning(std::vector<float> state_range, float states_density, u32 actions_per_state, float gamma, float alpha)
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

	this->state_range = state_range;

	float tmp = 1.0;

	for (i = 0; i < this->state_range.size(); i++)
		tmp = tmp*(this->state_range[i]*2.0)/states_density;

	u32 states_count = tmp;

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

void CQLearning::process(std::vector<float> state, float reward)
{
	u32 i, j;

	//find action using current state and fitness as probability
	action_id = select_action(2.0);

	this->state = state; 

	for (i = 0; i < this->state.size(); i++)
	{
		if (this->state[i] > state_range[i])
			this->state[i] = state_range[i];

		if (this->state[i] < -state_range[i])
			this->state[i] = -state_range[i];
	}

	float tmp = (this->state[0] + this->state_range[0])/2.0;

	for (i = 1; i < this->state.size(); i++)
		tmp = tmp*this->state_range[i] + (this->state[i] + this->state_range[i])/2.0;

	if (tmp < 0.0)
		tmp = 0.0;

	if (tmp > q.size())
		tmp = q.size();

	state_idx = tmp;

	u32 max_i = 0;
	for (i = 0; i < q[state_idx].size(); i++)
	{
		if (q[state_idx][i] > q[state_idx][max_i])
			max_i = i;
	}

	q[state_prev_idx][action_id_prev] = alpha*q[state_prev_idx][action_id_prev] +
										(1.0 - alpha)*(reward_prev + gamma*q[state_idx][max_i]);

	state_prev_idx = state_idx;
	reward_prev = reward;
	action_id_prev = action_id;
}


u32 CQLearning::get_states_count()
{
	return q.size();
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

	// normalise();
}





u32 CQLearning::select_action(float k, float explore_prob)
{
	u32 i;

	float sum = 0.0;
	float sum_tmp = 0.0;

	float p = abs_(rnd_());


	i32 non_visited_state_id = -1;

	for (i = 0; i < q[state_idx].size(); i++)
	{
		sum+= pow(k, q[state_idx][i]);
		if (abs_(q[state_idx][i]) < 0.00000001)
		{
			non_visited_state_id = i;
		}
	}

	if ( (non_visited_state_id != -1) && (explore_prob < abs_(rnd_())) )
	{
		return non_visited_state_id;
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