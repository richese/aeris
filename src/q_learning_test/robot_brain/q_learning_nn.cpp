#include "q_learning_nn.h"

CQLearningNN::CQLearningNN(
								u32 state_dimensions,

								float gamma, float eta,
								u32 neuron_type,
								u32 hidden_neurons_count,
								class CAction *actions
							)
{
	u32 i;

	action_id = 0;
	action_id_prev = 0;

	this->reward = 0.0;
	this->reward_prev = 0.0;

	this->gamma = gamma;
	this->eta = eta;

	for (i = 0; i < state_dimensions; i++)
	{
		state.push_back(0.0);
		state_prev.push_back(0.0);
	}

	this->actions = actions;

	NeuralNetworkInitStructure_init(&nn_init,
									3, 1.0, 4, neuron_type, this->eta, 0.1);

	//neural network input : state and action vector size, +1 for bias
	nn_init.init_vector[0] = state_dimensions + actions->get_actions_per_state() + 1;
	nn_init.init_vector[1] = hidden_neurons_count;
	nn_init.init_vector[2] = 1;

	nn = new CNeuralNetwork(nn_init);
	//nn = new CNN(nn_init.init_vector[0], nn_init.init_vector[1], this->eta, 1.0);



	for (i = 0; i < (state_dimensions + actions->get_actions_per_state() + 1); i++)
	{
		nn_input.push_back(0.0);
		nn_input_prev.push_back(0.0);
	}

	for (i = 0; i < actions->get_actions_per_state(); i++)
		nn_output.push_back(0.0);
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
	u32 i, j;


	//find action using current state and fitness as probability
	this->action_id_prev = this->action_id;
	this->action_id = select_action(k, explore_prob);

	float nn_res_max = -1.0;


	this->reward = reward;
	this->state = state;


	u32 max_j = 0;

	for (j = 0; j < actions->get_actions_per_state(); j++)
	{
		struct sAction action = actions->get(0, j);

		std::vector<float> nn_input_test;
		for (i = 0; i < this->state.size(); i++)
			nn_input_test.push_back(this->state[i]);

		for (i = 0; i < action.action.size(); i++)
			nn_input_test.push_back(action.action[i]);

		nn_input_test.push_back(1.0); //bias


		nn->process(nn_input_test);

		std::vector<float> tmp = nn->get();

		nn_output[j] = tmp[0];

		if (nn_output[j] > nn_res_max)
		{
			this->nn_input = nn_input_test;
			nn_res_max = nn_output[j];
			max_j = j;
		}
	}


	std::vector<float> required_output;
	nn->process(nn_input_prev);
	required_output.push_back(tanh(reward_prev + gamma*nn_res_max));

	nn->learn(required_output);


	//nn->learn(reward_prev + gamma*nn_res_max);

	action_id_prev = action_id;
	nn_input_prev = nn_input;

	this->state_prev = this->state;
	this->reward_prev = this->reward;
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
	return action_id;
}


float CQLearningNN::get_max_q(std::vector<float> state)
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

		nn_output[j] = nn->get()[0];

		if (nn_output[j] > nn_res_max)
		{
			nn_input_prev = nn_input;
			nn_res_max = nn_output[j];
			max_j = j;
		}
	}

	return nn_res_max;
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
	u32 i;

	float sum = 0.0;
	float sum_tmp = 0.0;
	float p = abs_(rnd_());

	u32 non_visited_action_id = 0;
	bool non_visited_action_found = false;

	for (i = 0; i < nn_output.size(); i++)
	{
		sum+= pow(k, nn_output[i]);
		if (nn_output[i] == -1.0)
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
	for (i = 0; i < nn_output.size(); i++)
	{
		sum_tmp+= pow(k, nn_output[i]);

		if (p < (sum_tmp/sum))
			return i;
	}

	return 0;
}
