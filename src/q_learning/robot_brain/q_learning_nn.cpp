#include "q_learning_nn.h"

 


CQlearningNN::CQlearningNN(	std::vector<float> state_range_min, std::vector<float> state_range_max, 
							u32 hidden_neurons_count, u32 neuron_type, 
							float gamma, float eta, std::vector<std::vector<float>> *action_init)
{
	u32 i, j;


	this->state_range_min = state_range_min;
	this->state_range_max = state_range_max;

	this->hidden_neurons_count = hidden_neurons_count;
	this->neuron_type = neuron_type;

	this->gamma = gamma;
	this->eta = eta;
		

	for (j = 0; j < action_output.size(); j++)
	{
		std::vector<float> tmp;

		for (i = 0; i < action_output[j].size(); j++)
			tmp.push_back(0.0);

		this->action_output.push_back(tmp);
	}

	q_res = 0.0;

	for (i = 0; i < state.size(); i++)
		this->state_prev.push_back(0.0);
	
	for (i = 0; i < state.size(); i++)
		this->state.push_back(0.0);

	this->reward_prev = 0.0;
	this->reward = 0.0;

	this->action_idx = 0;
	this->action_idx_prev = 0;


	for (i = 0; i < state.size(); i++)
		nn_input.push_back(0.0);

	for (i = 0; i < action_output[action_idx].size(); i++)
		nn_input.push_back(0.0);

	
	u32 init_vector[3];

	init_vector[0] = nn_input.size();
	init_vector[1] = hidden_neurons_count;
	init_vector[2] = 1;

	struct sNeuralNetworkInitStructure nn_init_structure;

	NeuralNetworkInitStructure_init(&nn_init_structure, 3, 1.0, 3, NEURON_TYPE_MIXED, eta);

	for (i = 0; i < 3; i++)
		nn_init_structure.init_vector[i] = init_vector[i];


}

CQlearningNN::~CQlearningNN()
{


}


void CQlearningNN::process(std::vector<float> state, float reward)
{
	this->state_prev = this->state;
	this->state = state;

	this->reward_prev = this->reward;
	this->reward = reward;

	u32 i, j;

	u32 ptr = 0;

	for (i = 0; i < state.size(); i++)
	{
		nn_input[ptr] = state[i];
		ptr++;
	}

	for (i = 0; i < action_output[action_idx].size(); i++)
	{
		nn_input[ptr] = action_output[action_idx][i];
		ptr++;
	}
}


std::vector<float> CQlearningNN::get_action()
{
	return action_output[action_idx];

}

u32 CQlearningNN::get_action_idx()
{
	return action_idx;
}

float CQlearningNN::get_action_q()
{
	return q_res;
}