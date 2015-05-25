#include "nn.h"


CNN::CNN(u32 inputs_count, u32 hidden_neurons_count,
			float eta, float weight_range)
{
	this->inputs_count = inputs_count;
	this->hidden_neurons_count = hidden_neurons_count;
	this->eta = eta;
	this->weight_range = weight_range;

	u32 i, j;

	for (i = 0; i < inputs_count; i++)
		input.push_back(0.0);

	for (i = 0; i < hidden_neurons_count; i++)
		hidden_output.push_back(0.0);

	output.push_back(0.0);


	w = (float**)malloc(hidden_neurons_count*sizeof(float*));
	for (j = 0; j < hidden_neurons_count; j++)
	{
		w[j] = (float*)malloc(inputs_count*sizeof(float));
		for (i = 0; i < inputs_count; i++)
			w[j][i] = 0.1*rnd_()*weight_range;
	}

	v = (float*)malloc(hidden_neurons_count*sizeof(float));
	for (j = 0; j < hidden_neurons_count; j++)
		v[j] = 0.1*rnd_()*weight_range;
}

CNN::~CNN()
{
	u32 i;
	for (i = 0; i < inputs_count; i++)
		free(w[i]);

	free(w);

	free(v);
}


void CNN::process(std::vector<float> input_)
{
	u32 i, j;

	this->input = input_;

	float sum;
	for (j = 0; j < hidden_neurons_count; j++)
	{
		sum = 0.0;
		for (i = 0; i < inputs_count; i++)
			sum+= w[j][i]*this->input[i];

		hidden_output[j] = tanh(sum);
	}

	sum = 0.0;
	for (i = 0; i < hidden_neurons_count; i++)
		sum+= v[i]*hidden_output[i];

	if (sum > 1.0)
		sum = 1.0;

	if (sum < -1.0)
		sum = -1.0;

	output[0] = sum;
}

std::vector<float> CNN::get()
{
	return output;
}

void CNN::learn(float required_output)
{
	u32 i, j;

	float error = required_output - output[0];
	std::vector<float> hidden_error;

	for (i = 0; i < hidden_neurons_count; i++)
	{
		v[i]+= eta*error*hidden_output[i];

		if (v[i] > weight_range)
			v[i] = weight_range;

		if (v[i] < -weight_range)
			v[i] = -weight_range;

		hidden_error.push_back(error*v[i]);
	}

	for (j = 0; j < hidden_neurons_count; j++)
	{
		for (i = 0; i < inputs_count; i++)
		{
			float dw;
			
			/*
			dw = eta*hidden_error[j]*
				(1.0 - tanh(hidden_output[j])*tanh(hidden_output[j]))*
				input[i];
			*/
			
			dw = eta*hidden_error[j]*input[i];

			w[j][i]+= dw;

			if (w[j][i] > weight_range)
				w[j][i] = weight_range;

			if (w[j][i] < -weight_range)
				w[j][i] = -weight_range;
		}
	}
}


float** CNN::get_w()
{
	return w;
}

float* CNN::get_v()
{
	return v;
}


void CNN::merge_weights(float **w_, float *v_, float weight)
{
	if (weight < 0.0)
		weight = 0.0;

	if (weight > 1.0)
		weight = 1.0;

	u32 i, j;
	for (j = 0; j < hidden_neurons_count; j++)
		for (i = 0; i < inputs_count; i++) 
			w[j][i] = weight*w[j][i] + (1.0 - weight)*w_[j][i];

	for (i = 0; i < hidden_neurons_count; i++) 
		v[i] = weight*v[i] + (1.0 - weight)*v_[i];

}