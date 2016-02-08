#include "neuron.h"
#include <math.h>

CNeuron::CNeuron(u32 inputs_count, u32 type, float weights_range, u32 order)
{
	this->inputs_count = inputs_count;
	this->type = type;
	this->weights_range = weights_range;
	this->order = order;
		
	this->output = 0.0;

	u32 i, j, k;

	float tmp = 0.01;

	for (j = 0; j < inputs_count; j++)
	{
		w.push_back(0.1*rnd()*weights_range);
		input.push_back(0.0);
	}

	if (type == NEURON_TYPE_TAYLOR)
	{
		for (k = 2; k < order; k++)
			for (j = 0; j < inputs_count; j++)
			{
				w.push_back(tmp*rnd()*weights_range);
				input.push_back(0.0);	
			}
	}

	if (type == NEURON_TYPE_MIXED)
	{
		for (j = 0; j < inputs_count; j++)
			for (i = j; i < inputs_count; i++)
			{
				w.push_back(tmp*rnd()*weights_range);
				input.push_back(0.0);
			} 

		for (k = 3; k < order; k++)
			for (j = 0; j < inputs_count; j++)
			{
				w.push_back(tmp*rnd()*weights_range);
				input.push_back(0.0);
			}
	}

	for (j = 0; j < inputs_count; j++)
		error.push_back(0.0);



	u32 lp_size = 10;
	for (j = 0; j < lp_size; j++)
		learning_pattern.push_back(0.0);

	learning_pattern[0] = 1.0;
	learning_pattern[7] = 0.1;
}

CNeuron::~CNeuron()
{

}

float CNeuron::get()
{
	return output;
}


std::vector<float> CNeuron::get_error_input()
{
	return error;
}


float CNeuron::process(std::vector<float> input)
{
	u32 i, j, k;
	u32 ptr = 0;

	for (j = 0; j < inputs_count; j++)
	{
		this->input[ptr] = input[j]; 
		ptr+= 1;
	}


	if (type == NEURON_TYPE_TAYLOR)
	{
		for (k = 2; k < order; k++)
			for (j = 0; j < inputs_count; j++)
			{
				this->input[ptr] = pow(input[j], k);
				ptr+= 1;
			}
	}

	if (type == NEURON_TYPE_MIXED)
	{
		for (j = 0; j < inputs_count; j++)
			for (i = j; i < inputs_count; i++)
			{
				this->input[ptr] = input[j]*input[i];
				ptr+= 1;
			}	

		for (k = 3; k < order; k++)
			for (j = 0; j < inputs_count; j++)
			{
				this->input[ptr] = pow(input[j], k);
				ptr+= 1;
			}
	}


	float sum = 0.0;
	for (i = 0; i < w.size(); i++)
		sum+= w[i]*this->input[i]; 

	if (type == NEURON_TYPE_COMMON)
		sum = tanh(sum);
		
	if (sum > 1.0)
		sum = 1.0;
		
	if (sum < -1.0)
		sum = -1.0;
		
	output = sum;
	return output; 
}

void CNeuron::learn(float error, float lc)
{
	u32 i, j, k;

	for (i = 0; i < w.size(); i++)
	{
		if (lc != 0.0)
		{
			float dw = lc*error*input[i];
			w[i]+= dw;
		}	
		else
		{
			float w_new = 0.0;

			w_new+= learning_pattern[0]*w[i];			//1.0
			w_new+= learning_pattern[1]*input[i];
			w_new+= learning_pattern[2]*error;
			w_new+= learning_pattern[3]*w[i]*w[i];
			w_new+= learning_pattern[4]*input[i]*input[i];
			w_new+= learning_pattern[5]*error*error;
			w_new+= learning_pattern[6]*w[i]*input[i];
			w_new+= learning_pattern[7]*input[i]*error; //0.1
			w_new+= learning_pattern[8]*w[i]*error;
			w_new+= learning_pattern[9]*w[i]*input[i]*error;
	
			w[i] = w_new;
		}

		if (w[i] > weights_range)
			w[i] = weights_range;

		if (w[i] < -weights_range)
			w[i] = -weights_range;
	}

	for (j = 0; j < this->error.size(); j++)
		this->error[j] = 0.0;

	u32 ptr = 0;
	for (j = 0; j < inputs_count; j++)
	{
		this->error[j]+= error*w[ptr];
		ptr+= 1;
	}


	if (type == NEURON_TYPE_TAYLOR)
	{
		for (k = 2; k < order; k++)
			for (j = 0; j < inputs_count; j++)
			{
				this->error[j]+= w[ptr]*pow(error, k);
				ptr+= 1;
			}
	}
	
	if (type == NEURON_TYPE_MIXED)
	{
		for (j = 0; j < inputs_count; j++)
			for (i = j; i < inputs_count; i++)
			{
				this->error[j]+= error*w[ptr];
				ptr+= 1;
			}	

		for (k = 3; k < order; k++)
			for (j = 0; j < inputs_count; j++)
			{
				this->error[j]+= w[ptr]*pow(error, k);
				ptr+= 1;
			}
	}
}

float CNeuron::rnd()
{
	return ((rand()%2000000) - 1000000)/1000000.0;
}

void CNeuron::set_learning_pattern(std::vector<float> lp)
{
	u32 j;
	for (j = 0; j < learning_pattern.size(); j++)
		learning_pattern[j] = lp[j];
}

u32 CNeuron::get_learning_pattern_size()
{
	return learning_pattern.size();
}

void CNeuron::print()
{
	u32 i;
	for (i = 0; i < w.size(); i++)
		printf("%6.3f ", w[i]);
}