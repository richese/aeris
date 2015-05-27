#ifndef _NN_H_
#define _NN_H_


#include "../common.h"


#define NEURON_TYPE_COMMON	((u32)1)
#define NEURON_TYPE_MIXED	((u32)2)

class CNN
{
	private:
		u32 inputs_count, hidden_neurons_count;
		float eta;

		std::vector<float> input, hidden_output;
		std::vector<float> output;

		float **w;
		float *v;

		float weight_range;

	public:
		CNN(u32 inputs_count, u32 hidden_neurons_count,
			float eta, float weight_range);

		~CNN();


		void process(std::vector<float> input_);
		std::vector<float> get();

		void learn(float required_output);


		float** get_w();
		float* get_v();

		void merge_weights(float **w_, float *v_, float weight = 0.5);

};


#endif