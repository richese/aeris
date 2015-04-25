#include "q_learning.h"

CQLearning::CQLearning(class CAction *actions, float gamma, float alpha)
{
	action_id = 0;
 	
 	state = 0;
	state_prev = 0;
	action_id_prev = 0;

	this->actions = actions;

	this->reward = 0.0;
	this->reward_prev = 0.0;

	this->gamma = gamma;
	this->alpha = alpha;


	u32 i, j;
	for (j = 0; j < actions->get_states_count(); j++)
	{
		std::vector<float> tmp;
		for (i = 0; i < actions->get_actions_per_state(); i++)
			tmp.push_back(0.0);

		q.push_back(tmp);
	}
}

CQLearning::~CQLearning()
{

}

void CQLearning::process(u32 state, float reward)
{
	//find action using current state and fitness as probability
	action_id = select_action(2.0);

	u32 i;
	u32 max_i = 0;
	for (i = 0; i < q[state].size(); i++)
	{
		if (q[state][i] > q[state][max_i])
			max_i = i;
	}

	q[state_prev][action_id_prev] = alpha*q[state_prev][action_id_prev] +
									(1.0 - alpha)*(reward_prev + gamma*q[state][max_i]);

	state_prev = state;
	reward_prev = reward;
	action_id_prev = action_id;
}

struct sAction CQLearning::get_output()
{
	return actions->get(state, action_id);
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
		{
			this->q[j][i] = max(this->q[j][i], q[j][i]);
		}

	normalise();
}

u32 CQLearning::select_action(float k)
{
	u32 i;

	float sum = 0.0;
	float sum_tmp = 0.0;

	float p = abs_(rnd_());

	for (i = 0; i < q[state].size(); i++)
		sum+= pow(k, q[state][i]);
	
	for (i = 0; i < q[state].size(); i++)
	{
		sum_tmp+= pow(k, q[state][i]);
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