#ifndef _NEURON_H_
#define _NEURON_H_

#include "../common.h"


#define NEURON_TYPE_COMMON	((u32)1)
#define NEURON_TYPE_TAYLOR	((u32)2)
#define NEURON_TYPE_MIXED	((u32)3)

class CNeuron
{
	private:
		std::vector<float> w;
		std::vector<float> input;
		std::vector<float> error;
	
		u32 inputs_count, type, order;
		float weights_range;
		float output;

		std::vector<float> learning_pattern;
		
	public:
		CNeuron(u32 inputs_count, u32 type = NEURON_TYPE_COMMON, float weights_range = 1.0, u32 order = 1);
		~CNeuron();

		float get();
		std::vector<float> get_error_input();

		float process(std::vector<float> input);
		void learn(float error, float lc = 0.01);
		void set_learning_pattern(std::vector<float> lp);
		u32 get_learning_pattern_size();
		void print();

	private:
		float rnd();
};

#endif