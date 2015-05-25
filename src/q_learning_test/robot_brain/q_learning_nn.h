#ifndef _Q_LEARNING_NN_H_
#define _Q_LEARNING_NN_H_

#include "action.h"
#include "neural_network.h"

#include "nn.h"

class CQLearningNN
{
	private:
		u32 action_id;
		u32 action_id_prev;

		u32 state_dimensions;


		float reward, reward_prev;
		std::vector<float> state, state_prev;

		float gamma, eta;
		

		class CAction *actions;
		class CNeuralNetwork *nn;
		//class CNN *nn;
		struct sNeuralNetworkInitStructure nn_init;

		std::vector<float> nn_input, nn_input_prev, nn_output;


	public:
		CQLearningNN(	u32 state_dimensions,

						float gamma = 0.9, float eta = 0.01,
						u32 neuron_type = NEURON_TYPE_COMMON,
						u32 hidden_neurons_count = 10,
						class CAction *actions = NULL
					);

		~CQLearningNN(); 

		void process(	std::vector<float> state, 
						float reward, 
						float k = 2.0, float explore_prob = 0.0
						);

		u32 get_states_count();

		u32 get_state_idx();
		u32 get_output_id();
		
		float get_max_q(std::vector<float> state);

		void merge(CQLearningNN *q_learning);

	private:
		u32 select_action(float k = 2.0, float explore_prob = 0.0);
};

#endif