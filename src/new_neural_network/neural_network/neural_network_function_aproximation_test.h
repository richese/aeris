#ifndef _NEURAL_NETWORK_FUNCTION_APROXIMATION_TEST_H_
#define _NEURAL_NETWORK_FUNCTION_APROXIMATION_TEST_H_


#include "neural_network.h"



class CNeuralNetworkFunctionAproximationTest
{
	private:
			std::vector<float> input;
			std::vector<float> output;
			std::vector<float> required_output;

			class CNeuralNetwork *neural_network;

			float error_now, error_total, error_filtered;

			struct sNeuralNetworkInitStructure nn_init_structure;

			class CLog *log; 

	public: 
			CNeuralNetworkFunctionAproximationTest(u32 neuron_type);
			~CNeuralNetworkFunctionAproximationTest();
			void run_test();

	private:
			
			void process(u32 learn);
			void print();

			float get_error();
			float get_error_filtered();

			void reset();
			void set_input();

			void set_required_output();
			float rnd();
};


#endif