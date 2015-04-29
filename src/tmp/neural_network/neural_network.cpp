#include "neural_network.h"


CNeuralNetwork::CNeuralNetwork(u32 inputs_count, u32 neuron_type, u32 hidden_neurons_count, u32 outputs_count, u32 order)
{
	u32 j; 

	for (j = 0; j < inputs_count; j++)
		input.push_back(0.0);

	for (j = 0; j < hidden_neurons_count; j++)
		hidden_output.push_back(0.0);

	for (j = 0; j < outputs_count; j++)
		output.push_back(0.0);
	
	this->weight_range = 1.0;
		
	for (j = 0; j < hidden_neurons_count; j++)
	{
		class CNeuron *neuron;

		neuron = new CNeuron(inputs_count, neuron_type, weight_range, order);

		hidden_neurons.push_back(neuron);
	}

	for (j = 0; j < outputs_count; j++)
	{
		class CNeuron *neuron;

		neuron = new CNeuron(hidden_neurons_count, neuron_type, weight_range, order);

		output_neurons.push_back(neuron);
	}
}

CNeuralNetwork::~CNeuralNetwork()
{
	u32 j;

	for (j = 0; j < hidden_neurons.size(); j++)
		delete hidden_neurons[j];

	for (j = 0; j < output_neurons.size(); j++)
		delete output_neurons[j];

}

void CNeuralNetwork::process(std::vector<float> input)
{
	u32 j;

	for (j = 0; j < this->input.size(); j++)
		this->input[j] = input[j];

	for (j = 0; j < hidden_neurons.size(); j++)
	{
		hidden_neurons[j]->process(this->input);
		hidden_output[j] = hidden_neurons[j]->get();
	}

	for (j = 0; j < output_neurons.size(); j++)
	{
		output_neurons[j]->process(hidden_output);
		output[j] = output_neurons[j]->get();
	}
}

std::vector<float> CNeuralNetwork::get()
{
	return output;
}

void CNeuralNetwork::learn(std::vector<float> required_output, float lc)
{	
	u32 j, i;
	std::vector<float> error;

	for (j = 0; j < output.size(); j++)
		error.push_back(required_output[j] - output[j]);

	for (j = 0; j < output.size(); j++)
		output_neurons[j]->learn(error[j], lc);

	for (j = 0; j < hidden_neurons.size(); j++)
	{		
		float sum = 0.0;

		for (i = 0; i < output.size(); i++)
			sum+= output_neurons[i]->get_error_input()[j];
			
		hidden_neurons[j]->learn(sum, lc);
	}
}

void CNeuralNetwork::set_learning_pattern(std::vector<float> lp)
{
	u32 j;

	for (j = 0; j < hidden_neurons.size(); j++)
		hidden_neurons[j]->set_learning_pattern(lp);

	for (j = 0; j < output_neurons.size(); j++)
		output_neurons[j]->set_learning_pattern(lp);
}

u32 CNeuralNetwork::get_learning_pattern_size()
{
	return output_neurons[0]->get_learning_pattern_size();
}

float CNeuralNetwork::rnd()
{
	return ((rand()%2000000) - 1000000)/1000000.0;	
}