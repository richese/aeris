#include "q_learning_nn.h"


void q_res_nn_init(struct sQResNN *q_res, u32 state_dimensions, u32 action_size)
{
	u32 i;

	q_res->q = 0.0;
	q_res->q_max = 0.0;
	q_res->action_id = 0;

	q_res->action.fitness = 0.0;
	q_res->action.usability = 0.0;

	q_res->reward = 0.0;

	for (i = 0; i < state_dimensions; i++)
		q_res->state.push_back(0.0);

	for (i = 0; i < action_size; i++)
		q_res->action.action.push_back(0.0);

	for (i = 0; i < (state_dimensions + action_size + 1); i++)
		q_res->nn_input.push_back(0.0);
}

CQLearningNN::CQLearningNN(
							u32 neuron_type,
							u32 hidden_neurons_count,
							u32 state_dimensions,
							u32 gamma, u32 eta,
							class CAction *actions
						)
{
	u32 i;

	this->gamma = gamma;
	this->eta = eta;

	this->actions = actions;

	NeuralNetworkInitStructure_init(&nn_init,
									3, 2.0, 2, neuron_type, this->eta, 0.1);

	//neural network input : state and action vector size, +1 for bias
	nn_init.init_vector[0] = state_dimensions + actions->get_actions_per_state() + 1;
	nn_init.init_vector[1] = hidden_neurons_count;
	nn_init.init_vector[2] = 1;

	nn = new CNeuralNetwork(nn_init);

	for (i = 0; i < (state_dimensions + actions->get_action_size() + 1); i++)
		nn_input.push_back(0.0);

	q_res_nn_init(&q_res, state_dimensions, actions->get_action_size());
	q_res_nn_init(&q_res_prev, state_dimensions, actions->get_action_size());
}

CQLearningNN::~CQLearningNN()
{
	NeuralNetworkInitStructure_uninit(&nn_init);
	delete nn;
}



void CQLearningNN::process(	std::vector<float> state, float reward,
							float k, float explore_prob
							)
{
	u32 i, j, ptr;

	//find action using current state and fitness as probability


	q_res.state = state;
	q_res.action_id = select_action(k, explore_prob);
	q_res.action = actions->get(0, q_res.action_id);


	//calculate action reward
	ptr = 0;
	for (i = 0; i < q_res.state.size(); i++)
		q_res.nn_input[ptr++] = q_res.state[i];

	for (i = 0; i < q_res.action.action.size(); i++)
		q_res.nn_input[ptr++] = q_res.action.action[i];

	q_res.nn_input[ptr++] = 1.0;
	nn->process(q_res.nn_input);
	q_res.q = nn->get()[0];
	q_res.reward = reward;

	float q_max = -1.0;

	std::vector<float> nn_output;
	for (j = 0; j < actions->get_actions_per_state(); j++)
	{
		struct sAction action = actions->get(0, j);

		ptr = 0;

		for (i = 0; i < q_res.state.size(); i++)
			nn_input[ptr++] = q_res.state[i];

		for (i = 0; i < action.action.size(); i++)
			nn_input[ptr++] = action.action[i];

		nn_input[ptr++] = 1.0;

		nn->process(nn_input);

		float tmp = nn->get()[0];

		nn_output.push_back(tmp);

		if (tmp > q_max)
			q_max = tmp;
	}
	q_res.q_max = q_max;


	float required_output = q_res_prev.reward + gamma*q_res.q_max;
	std::vector<float> required_output_;
	required_output_.push_back(required_output);

	nn->process(q_res_prev.nn_input);
	nn->learn(required_output_);

	q_res_prev = q_res;

/*
	float required_output = q_res.reward

	this->reward_prev + gamma*q_max;

	struct sAction action = actions->get(0, this->action_id_prev);
	std::vector<float> nn_input_test;
	for (i = 0; i < this->state.size(); i++)
		nn_input_test.push_back(this->state_prev[i]);

	for (i = 0; i < action.action.size(); i++)
		nn_input_test.push_back(action.action[i]);

	nn_input_test.push_back(1.0);


	nn->process(nn_input_test);

	std::vector<float> required_output_;
	required_output_.push_back(required_output);

	nn->learn(required_output_);


	this->reward_prev = this->reward;
	this->state_prev = this->state;
	this->action_id_prev = this->action_id;
*/
	/*
	u32 i, j;

	//find action using current state and fitness as probability
	this->action_id_prev = this->action_id;

	this->action_id = select_action(k, explore_prob);

	float nn_res_max = -1.0;

	this->reward = reward;
	this->state = state;

	for (j = 0; j < actions->get_actions_per_state(); j++)
	{
		struct sAction action = actions->get(0, j);

		std::vector<float> nn_input_test;
		for (i = 0; i < this->state.size(); i++)
			nn_input_test.push_back(this->state[i]);

		for (i = 0; i < action.action.size(); i++)
			nn_input_test.push_back(action.action[i]);

		nn_input_test.push_back(1.0);

		nn->process(nn_input_test);

		nn_output[j] = nn->get()[0];

		if (nn_output[j] > nn_res_max)
		{
			this->nn_input = nn_input_test;
			nn_res_max = nn_output[j];
		}
	}

	struct sAction action = actions->get(0, action_id);
	std::vector<float> nn_input_test;
	for (i = 0; i < this->state.size(); i++)
		nn_input_test.push_back(this->state[i]);

	for (i = 0; i < action.action.size(); i++)
		nn_input_test.push_back(action.action[action_id]);

	nn_input_test.push_back(1.0);

	// nn_input = nn_input_test;


	std::vector<float> required_output;
	nn->process(nn_input_prev);

	float tmp = reward_prev + gamma*nn_res_max;
	required_output.push_back(tanh(tmp));

	nn->learn(required_output);


	action_id_prev = action_id;
	nn_input_prev = nn_input;

	this->state_prev = this->state;
	this->reward_prev = this->reward;
	*/
}

/*
u32 CQLearningNN::get_states_count()
{
	return q.size();
}

u32 CQLearningNN::get_state_idx()
{
	return state_idx;
}
*/

u32 CQLearningNN::get_output_id()
{
	return q_res.action_id;
}


float CQLearningNN::get_max_q(std::vector<float> state)
{
	u32 i, j;

	float nn_res_max = -1.0;

	for (j = 0; j < actions->get_actions_per_state(); j++)
	{
		struct sAction action = actions->get(0, j);

		std::vector<float> nn_input;

		for (i = 0; i < state.size(); i++)
			nn_input.push_back(state[i]);

		for (i = 0; i < action.action.size(); i++)
			nn_input.push_back(action.action[i]);

		nn_input.push_back(1.0); //bias

		nn->process(nn_input);

		float res = nn->get()[0];

		if (res > nn_res_max)
		{
			nn_res_max = res;
		}
	}

	return nn_res_max;
}



float CQLearningNN::get_min_q(std::vector<float> state)
{
	u32 i, j;

	float nn_res_min = 1.0;

	for (j = 0; j < actions->get_actions_per_state(); j++)
	{
		struct sAction action = actions->get(0, j);

		std::vector<float> nn_input;

		for (i = 0; i < state.size(); i++)
			nn_input.push_back(state[i]);

		for (i = 0; i < action.action.size(); i++)
			nn_input.push_back(action.action[i]);

		nn_input.push_back(1.0); //bias

		nn->process(nn_input);

		float res = nn->get()[0];

		if (res < nn_res_min)
		{
			nn_res_min = res;
		}
	}

	return nn_res_min;
}


u32 CQLearningNN::get_max_q_id(std::vector<float> state)
{
	u32 max_j = 0, i, j;

	float nn_res_max = -1.0;

	for (j = 0; j < actions->get_actions_per_state(); j++)
	{
		struct sAction action = actions->get(0, j);

		std::vector<float> nn_input;

		for (i = 0; i < state.size(); i++)
			nn_input.push_back(state[i]);

		for (i = 0; i < action.action.size(); i++)
			nn_input.push_back(action.action[i]);

		nn_input.push_back(1.0); //bias

		nn->process(nn_input);

		float res = nn->get()[0];

		if (res > nn_res_max)
		{
			nn_res_max = res;
			max_j = j;
		}
	}

	return max_j;
}

void CQLearningNN::merge(CQLearningNN *q_learning)
{
	float w = 0.9;

	/*
	q_learning->nn->merge_weights(nn->get_weights(), w);
	nn->merge_weights(q_learning->nn->get_weights(), 0.0);


	q_learning->nn->merge_weights(nn->get_w(), nn->get_v(), w);
	nn->merge_weights(q_learning->nn->get_w(), q_learning->nn->get_v(), 0.0);
	*/
}

u32 CQLearningNN::select_action(float k, float explore_prob)
{
	u32 i, j;

	float sum = 0.0;
	float sum_tmp = 0.0;
	float p = abs_(rnd_());

	u32 non_visited_action_id = 0;
	bool non_visited_action_found = false;

	std::vector<float> q_output;

	u32 ptr;
	for (j = 0; j < actions->get_actions_per_state(); j++)
	{
		struct sAction action = actions->get(0, j);

		ptr = 0;

		for (i = 0; i < q_res.state.size(); i++)
			nn_input[ptr++] = q_res.state[i];

		for (i = 0; i < action.action.size(); i++)
			nn_input[ptr++] = action.action[i];

		nn_input[ptr++] = 1.0;

		nn->process(nn_input);

		float tmp = nn->get()[0];

		q_output.push_back(tmp);
	}

	for (i = 0; i < q_output.size(); i++)
	{
		sum+= pow(k, q_output[i]);
		if (q_output[i] == -1.0)
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
	for (i = 0; i < q_output.size(); i++)
	{
		sum_tmp+= pow(k, q_output[i]);

		if (p < (sum_tmp/sum))
			return i;
	}

	return 0;
}
