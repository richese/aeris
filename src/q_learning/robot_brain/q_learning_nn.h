#ifndef _Q_LEARNING_NN_H_
#define _Q_LEARNING_NN_H_

#include "../common.h"
#include "action_nn.h"
#include "neural_network.h"

class CQlearningNN
{
	private:

		std::vector<float> state_range_min, state_range_max;
		u32 hidden_neurons_count, neuron_type;
		float gamma, eta;

		std::vector<std::vector<float>> action_output;

		u32 action_idx, action_idx_prev;
		std::vector<float> state, state_prev;
		float reward, reward_prev;

		float q_res;

		std::vector<float> nn_input;


		class CNeuralNetwork *nn;

		
	public:

		CQlearningNN(	std::vector<float> state_range_min, std::vector<float> state_range_max, 
						u32 hidden_neurons_count, u32 neuron_type, 
						float gamma = 0.9, float eta = 0.01, 
						std::vector<std::vector<float>> *action_init = NULL);

		~CQlearningNN();

		void process(std::vector<float> state, float reward);

		std::vector<float> get_action();
		u32 get_action_idx();
		float get_action_q();
};

#endif