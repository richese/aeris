#ifndef _NEURAL_NETWORK_KOHONEN_H_
#define _NEURAL_NETWORK_KOHONEN_H_

#include "../common.h"

class CNeuralNetworkKohonen
{
	private:

		float **w;

		u32 x_size, y_size, neurons_count, input_size, winning_neuron_idx;
		float weight_range, lc, lc2;
		u32 plane;


		float *input, *output;
		std::vector<float> output_v;

	public:
		CNeuralNetworkKohonen(	u32 x_size, 
								u32 y_size, 
								u32 input_size, 
								float weight_range = 1.0, 
								float lc = 0.01, 
								float lc2 = 0.1);

		~CNeuralNetworkKohonen();

		void process(std::vector<float> input);
		void learn();
		
		std::vector<float> get();

		u32 get_id();
		float get_min_dist();
		float* get_w(u32 neuron_idx);

	private:
		float rnd();		
		float distance(u32 neuron_idx);
};

#endif