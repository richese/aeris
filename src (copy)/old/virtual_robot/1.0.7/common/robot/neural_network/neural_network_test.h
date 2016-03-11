#ifndef _NEURAL_NETWORK_TEST_H_
#define _NEURAL_NETWORK_TEST_H_

#include "neural_network.h"
//#include "neural_network_fast.h"

class CNeuralNetworkTest
{
	private:
		std::vector<float> input;
		std::vector<float> output;
		std::vector<float> required_output;

		class CNeuralNetwork *neural_network;

		float error_now, error_total, error_filtered;
	public:
		CNeuralNetworkTest();
		~CNeuralNetworkTest();

		void process(u32 learn = 0);

		void print();

		float get_error();
		float get_error_filtered();
		void reset();


	private:
		void set_input();
		void set_required_output();
		float rnd();
};

#endif