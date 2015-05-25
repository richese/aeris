#ifndef _NN_TEST_H_
#define _NN_TEST_H_

#include "nn.h"
#include "neural_network.h"

// #define NN_TEST 1


class CNNTest
{
	private:
		u32 inputs_count, hidden_neurons_count, outputs_count;
		float eta, weight_range;

		#ifdef NN_TEST
		class CNN *nn;
		#else
		class CNeuralNetwork *nn;
		#endif

		std::vector<float> input, required_output, output;

		float error_filter = 0.0;

	public:

		CNNTest();
		~CNNTest();


		void set_input();
		void set_required_output();

		void run_test();
		void print();

		void print_vector(std::vector<float> v);

};

#endif