#include "neural_network_test.h" 

CNeuralNetworkTest::CNeuralNetworkTest()
{
	u32 inputs_count = 4;
	u32 hidden_neurons_count = 4; 
	u32 outputs_count = 2;
	u32 order = 5;

	//u32 neuron_type = NEURON_TYPE_COMMON;
	//u32 neuron_type = NEURON_TYPE_TAYLOR;
	u32 neuron_type = NEURON_TYPE_MIXED; 

	neural_network = new CNeuralNetwork(inputs_count, neuron_type, hidden_neurons_count, outputs_count, order );

	u32 j;

	for (j = 0; j < inputs_count; j++)
		input.push_back(0.0);
	
	for (j = 0; j < outputs_count; j++)
	{
		output.push_back(0.0);
		required_output.push_back(0.0);
	}
	
	error_now = 0.0;
	error_total = 0.0;
	error_filtered = outputs_count;
}

CNeuralNetworkTest::~CNeuralNetworkTest()
{
	delete neural_network;
}

void CNeuralNetworkTest::process(u32 learn)
{
	u32 j;

	set_input();
	set_required_output();

	neural_network->process(input);

	if (learn != 0)
		neural_network->learn(required_output, 0.1);

	for (j = 0; j < output.size(); j++)
		output[j] = neural_network->get()[j];

	error_now = 0.0;
	
	for (j = 0; j < output.size(); j++)
	{
		float tmp = (required_output[j] - output[j]);
		if (tmp < 0.0)
			tmp = -tmp;

		error_now+= tmp;
	}

	float k = 0.98;

	error_filtered = k*error_filtered + (1.0 - k)*error_now;
	error_total+= error_now;
}



void CNeuralNetworkTest::print()
{
	u32 j;
	
	for (j = 0; j < input.size(); j++)
		printf("%6.3f ", input[j]);
	
	printf(" | ");

	for (j = 0; j < required_output.size(); j++)
		printf("%6.3f ", required_output[j]);

	printf(" | ");

	for (j = 0; j < output.size(); j++)
		printf("%6.3f ", output[j]);
		
	printf(" | ");

	printf("%6.3f", error_now);
	printf("\n");
}


float CNeuralNetworkTest::get_error()
{
	return error_total;
}

float CNeuralNetworkTest::get_error_filtered()
{
	return error_filtered;
}

void CNeuralNetworkTest::reset()
{
	error_total = 0.0;
} 


void CNeuralNetworkTest::set_input()
{
	u32 j;
	for (j = 0; j < input.size(); j++)
		input[j] = rnd();

	// last input use as bias (constant input) 
	input[input.size() - 1] = 1.0;
}
 
void CNeuralNetworkTest::set_required_output()
{
	//multiplication
	//required_output[0] = input[0]*input[1];
	//required_output[1] = -input[0]*input[1];

	//tanh
	//required_output[0] = tanh(input[0]);
	//required_output[1] = tanh(input[1]);

	//sin cos addition 
	//required_output[0] = (sin(2.1*input[0]) + cos(1.3*input[1]))/2.0;
	//required_output[1] = (cos(1.7*input[0]) + sin(1.9*input[1]))/2.0;

	//sin cos mixing
	//required_output[0] = (sin(input[0]) * cos(input[1]))/1.0;
	//required_output[1] = (cos(input[0]) * sin(input[1]))/1.0;

	//point rotation
	
	float x = input[0];
	float y = input[1];
	float phi = input[2];

	required_output[0] = (x*cos(phi) - y*sin(phi))/2.0;
	required_output[1] = (x*sin(phi) + y*cos(phi))/2.0;
}

float CNeuralNetworkTest::rnd()
{
	return ((rand()%2000000) - 1000000)/1000000.0;
}