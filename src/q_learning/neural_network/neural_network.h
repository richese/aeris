#ifndef _NEURAL_NETWORK_H_
#define _NEURAL_NETWORK_H_

#include "neuron.h"


class CNeuralNetwork
{
	private:
		std::vector<float> input;
		std::vector<float> hidden_output;
		std::vector<float> output;
		float weight_range;
		

		std::vector<CNeuron *> hidden_neurons;
		std::vector<CNeuron *> output_neurons;

	public:
		CNeuralNetwork(u32 inputs_count, u32 neuron_type, u32 hidden_neurons_count, u32 outputs_count, u32 order);
		~CNeuralNetwork();

		void process(std::vector<float> input);
		std::vector<float> get();
		
		void learn(std::vector<float> required_output, float lc = 0.01);

		void set_learning_pattern(std::vector<float> lp);
		u32 get_learning_pattern_size();

	private:
		float rnd();
};

#endif