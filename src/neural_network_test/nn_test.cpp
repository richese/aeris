#include "nn_test.h"


CNNTest::CNNTest()
{
	inputs_count = 3 + 1;
	hidden_neurons_count = 16;
	eta = 0.01;
	weight_range = 1.0;

	outputs_count = 1;


	#ifdef NN_TEST
	nn = new CNN(inputs_count, hidden_neurons_count, eta, weight_range);
	#else
	struct sNeuralNetworkInitStructure nn_init;

	// u32 neuron_type = NEURON_TYPE_COMMON;
	u32 neuron_type = NEURON_TYPE_MIXED;

	NeuralNetworkInitStructure_init(&nn_init,
									3,
									weight_range,
									7,
									neuron_type,
									eta,
									0.1
									);

	nn_init.init_vector[0] = inputs_count;
	nn_init.init_vector[1] = hidden_neurons_count;
	nn_init.init_vector[2] = 1;


	nn = new CNeuralNetwork(nn_init);

	NeuralNetworkInitStructure_uninit(&nn_init);
	#endif



	u32 i;

	for (i = 0; i < inputs_count; i++)
		input.push_back(0.0);

	for (i = 0; i < outputs_count; i++)
		output.push_back(0.0);

	for (i = 0; i < outputs_count; i++)
		required_output.push_back(0.0);

	error_filter = 1.0;
}

  
CNNTest::~CNNTest()
{
	delete nn;	
}


void CNNTest::set_input()
{
	u32 i;

	for (i = 0; i < input.size(); i++)
		input[i] = rnd_();

	input[input.size() - 1] = 1.0; //bias
}

void CNNTest::set_required_output()
{
	u32 i;
	float res = 0.0;

	for (i = 0; i < (input.size()-1.0); i++)
		//res+= tanh(input[i] + input[i%2] + 0.0*input[i]*input[i%3]);
		res+= tanh(input[i] + input[i%2] + 4.0*input[i]*input[i%3]);
 

	res/= (input.size() - 1.0);

	required_output[0] = res;
}

void CNNTest::run_test()
{
	set_input();
	set_required_output();
 

	nn->process(input);
	output = nn->get();


	#ifdef NN_TEST
	nn->learn(required_output[0]);
	#else
	nn->learn(required_output);
	#endif
}

void CNNTest::print()
{
	u32 i;

	print_vector(input);
	printf(" : ");
	print_vector(required_output);
	print_vector(output);
	printf(" E : ");

	std::vector<float> error;
	for (i = 0; i < output.size(); i++)
	{
		float err = required_output[i] - output[i];
		error.push_back(err);

		float k = 0.99;
		error_filter = k*error_filter + (1.0 - k)*abs_(err);
	}

	print_vector(error);

	printf(" error %6.3f\n", error_filter);
}


void CNNTest::print_vector(std::vector<float> v)
{
	u32 i;
	for (i = 0; i < v.size(); i++)
		printf("%6.3f ", v[i]);
	printf(" ");
}