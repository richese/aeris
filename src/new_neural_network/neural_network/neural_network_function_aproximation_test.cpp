#include "neural_network_function_aproximation_test.h"



CNeuralNetworkFunctionAproximationTest::CNeuralNetworkFunctionAproximationTest(u32 neuron_type)
{
	u32 inputs_count = 4;
	u32 outputs_count = 1;

	//u32 neuron_type = NEURON_TYPE_COMMON;
	//u32 neuron_type = NEURON_TYPE_TAYLOR;
	//u32 neuron_type = NEURON_TYPE_MIXED;  


	float eta = 0.1;
	float gamma = 0.0;
 
	NeuralNetworkInitStructure_init(&nn_init_structure, 3, 1.0, 5, neuron_type, eta, gamma);

	/*
	nn_init_structure.init_vector[0] = inputs_count;
	nn_init_structure.init_vector[1] = 8;
	nn_init_structure.init_vector[2] = 4;
	nn_init_structure.init_vector[3] = outputs_count;
	*/

	nn_init_structure.init_vector[0] = inputs_count;
	nn_init_structure.init_vector[1] = 8;
	nn_init_structure.init_vector[2] = outputs_count;


	neural_network = new CNeuralNetwork(nn_init_structure);

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
	error_filtered = 1.0;//outputs_count;
}

CNeuralNetworkFunctionAproximationTest::~CNeuralNetworkFunctionAproximationTest()
{
	delete neural_network;
}


void CNeuralNetworkFunctionAproximationTest::run_test()
{ 
	u32 j;
 
	u32 learning_patterns = 5000;
	u32 testing_patterns = 10000;

	set_input();
	set_required_output();

	char log_str[256];

	char learning_result_file_name[]="function_aproximation/result.txt";

	log = new CLog((char*)learning_result_file_name,  
			   (char*)"function_aproximation/result_conditions.txt", 
			   input.size() + output.size()*2 + 1);

	log->add_condition((char*)"experiment name : two inputs multiplexer");

	log->add_condition((char*)"conditions : ");
	
	sprintf(log_str,"	neuron type %i", nn_init_structure.neuron_type);
	log->add_condition(log_str);

	sprintf(log_str,"	input vector size %i", input.size());
	log->add_condition(log_str);

	sprintf(log_str,"	output vector size %i", output.size());
	log->add_condition(log_str);

	sprintf(log_str,"	layers count %i", nn_init_structure.init_vector_size-1);
	log->add_condition(log_str);

	sprintf(log_str,"	weight range <%6.3f, %6.3f>", -nn_init_structure.weight_range, nn_init_structure.weight_range);
	log->add_condition(log_str);	

	sprintf(log_str,"	polynom order %u", nn_init_structure.order);
	log->add_condition(log_str);	

	sprintf(log_str,"	eta %f", nn_init_structure.learning_constant_eta);
	log->add_condition(log_str);
	
	sprintf(log_str,"	gamma %f", nn_init_structure.learning_constant_gamma);
	log->add_condition(log_str);

	sprintf(log_str,"	bias value : input[%i] = %f ", input.size()-1, input[input.size()-1]);
	log->add_condition(log_str);

	sprintf(log_str,"	learning patterns count %u", learning_patterns);
	log->add_condition(log_str);

	sprintf(log_str,"	testing patterns count %u", testing_patterns);
	log->add_condition(log_str);	


	sprintf(log_str,"	layers configuration : ");
	log->add_condition(log_str);	

	for (j = 0; j < nn_init_structure.init_vector_size-1; j++)
	{
		sprintf(log_str,"		layer %i : inputs count %i , outputs count %i", j, nn_init_structure.init_vector[j], nn_init_structure.init_vector[j+1]);
		log->add_condition(log_str);	
	}

	sprintf(log_str,"	input example : ");
	log->add_condition(log_str);	


	for (j = 0; j < input.size(); j++)
	{
		sprintf(log_str,"		input[%u] = %f ", j, input[j]);
		log->add_condition(log_str);
	}



	sprintf(log_str,"	required output example : ");
	log->add_condition(log_str);	

	for (j = 0; j < required_output.size(); j++)
	{
		sprintf(log_str,"		required_output[%u] = %f ", j, required_output[j]);
		log->add_condition(log_str);
	}


	log->add_condition((char*)"aproximated function : ");

	/*
	log->add_condition((char*)"		required_output[0] = input[0]*input[1];");
	log->add_condition((char*)"		required_output[1] = -input[0]*input[1];");
	*/

	/*
	log->add_condition((char*)"		required_output[0] = sin(input[0]) * cos(input[1]);");
	log->add_condition((char*)"		required_output[1] = cos(input[0]) * sin(input[1]);");
	*/
	
	/*
	log->add_condition((char*)"		float x = input[0];");
	log->add_condition((char*)"		float y = input[1];");
	log->add_condition((char*)"		float  phi = input[2]*M_PI/2.0");

	log->add_condition((char*)"		required_output[0] = (x*cos(phi) - y*sin(phi))/2.0;");
	log->add_condition((char*)"		required_output[1] = (x*sin(phi) + y*cos(phi))/2.0;");
	*/

	log->add_condition((char*)"		float a = input[0];");
	log->add_condition((char*)"		float b = input[1];");
	log->add_condition((char*)"		float s = (input[2] + 1.0)/2.0;");
	log->add_condition((char*)"		required_output[0] = a*s + b*(1.0 - s);");
	

	for (j = 0; j < learning_patterns; j++)
	{
		process(1);
	}

	reset();

	

	for (j = 0; j < testing_patterns; j++)
		process(0);


	printf("\n%6.4f\n", get_error()/testing_patterns);

	log->add_condition((char*)"results : ");

	sprintf(log_str,"		total error %f", get_error());
	log->add_condition(log_str);

	sprintf(log_str,"		average error %f", get_error()/testing_patterns);
	log->add_condition(log_str);

	sprintf(log_str,"		learning result file name %s", learning_result_file_name);
	log->add_condition(log_str);


	log->save();
}

void CNeuralNetworkFunctionAproximationTest::process(u32 learn)
{
	u32 j;

	set_input();

	set_required_output();

	neural_network->process(input);

	if (learn != 0)
		neural_network->learn(required_output);

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

	u32 ptr = 0; 

	if (learn == 0)
	{
		for (j = 0; j < input.size(); j++)
			log->add(ptr++, input[j]);
		
		for (j = 0; j < required_output.size(); j++)
			log->add(ptr++, required_output[j]);

		for (j = 0; j < output.size(); j++)
			log->add(ptr++, output[j]);

		log->add(ptr++, error_filtered);
	}
}


void CNeuralNetworkFunctionAproximationTest::print()
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


float CNeuralNetworkFunctionAproximationTest::get_error()
{
	return error_total;
}

float CNeuralNetworkFunctionAproximationTest::get_error_filtered()
{
	return error_filtered;
}

void CNeuralNetworkFunctionAproximationTest::reset()
{
	error_total = 0.0;
} 


void CNeuralNetworkFunctionAproximationTest::set_input()
{
	u32 j;
	for (j = 0; j < input.size(); j++)
		input[j] = rnd();

	// last input use as bias (constant input) 
	input[input.size() - 1] = 1.0;
}
 
void CNeuralNetworkFunctionAproximationTest::set_required_output()
{
	//multiplication
	/*
	required_output[0] = input[0]*input[1];
	required_output[1] = -input[0]*input[1];
	*/


	//sin cos mixing
	/*
	required_output[0] = sin(input[0]) * cos(input[1]);
	required_output[1] = cos(input[0]) * sin(input[1]);
	*/

	//point rotation

	/*
	float x = input[0];
	float y = input[1];
	float phi = input[2]*M_PI/2.0;

	required_output[0] = (x*cos(phi) - y*sin(phi))/2.0;
	required_output[1] = (x*sin(phi) + y*cos(phi))/2.0;
	*/

	//multiplexer
	float a = input[0];
	float b = input[1];
	float s = (input[2] + 1.0)/2.0;
	required_output[0] = a*s + b*(1.0 - s);

}

float CNeuralNetworkFunctionAproximationTest::rnd()
{
	return ((rand()%2000000) - 1000000)/1000000.0;
}