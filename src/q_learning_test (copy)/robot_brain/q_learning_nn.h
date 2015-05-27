#ifndef _Q_LEARNING_NN_H_
#define _Q_LEARNING_NN_H_

#include "action.h"
#include "neural_network.h"

#include "nn.h"

struct sQResNN
{
	std::vector<float> state;
	struct sAction action;

	std::vector<float> nn_input;

	float q_max, q;
	u32 action_id;

	float reward;
};


class CQLearningNN
{
	private:
		u32 state_dimensions;
		float gamma, eta;


		class CAction *actions;
		class CNeuralNetwork *nn;
		//class CNN *nn;
		struct sNeuralNetworkInitStructure nn_init;

		std::vector<float> nn_input;

		struct sQResNN q_res, q_res_prev;

	public:
		CQLearningNN(	u32 neuron_type,
						u32 hidden_neurons_count,
						u32 state_dimensions,
						u32 gamma = 0.9, u32 eta = 0.01,
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
		float get_min_q(std::vector<float> state);
		u32 get_max_q_id(std::vector<float> state);


		void merge(CQLearningNN *q_learning);

	private:
		u32 select_action(float k = 2.0, float explore_prob = 0.0);

};

#endif
