#include "neural_network_kohonen.h"


CNeuralNetworkKohonen::CNeuralNetworkKohonen(
		u32 x_size, 
		u32 y_size, 
		u32 input_size, 
		float weight_range,
		float lc, 
		float lc2
		)
{
	this->x_size = x_size;
	this->y_size = y_size;

	this->neurons_count = x_size*y_size;

	this->input_size = input_size;
	this->weight_range = weight_range;
	this->lc = lc;
	this->lc2 = lc2;
	

	winning_neuron_idx = 0;


	w = (float**)malloc(neurons_count*sizeof(float*));

	u32 i, j;
	for (j = 0; j < neurons_count; j++)
	{
		w[j] = (float*)malloc(input_size*sizeof(float));

		for (i = 0; i < input_size; i++)
			w[j][i] = weight_range*rnd();
	}

	input = (float*)malloc(input_size*sizeof(float));
	for (j = 0; j < input_size; j++)
		input[j] = 0.0;

	output = (float*)malloc(neurons_count*sizeof(float));
	for (j = 0; j < x_size*y_size; j++)
		output[j] = 0.0;


	for (j = 0; j < neurons_count; j++)
		output_v.push_back(0.0);

}

CNeuralNetworkKohonen::~CNeuralNetworkKohonen()
{
	u32 j;

	if (w != NULL)
	{
		for (j = 0; j < neurons_count; j++)
		{
			free(w[j]);
			w[j] = NULL;
		}

		free(w);
	}

	if (input != NULL)
	{
		free(input);
		input = NULL;
	}

	if (output != NULL)
	{
		free(output);
		output = NULL;
	}
}


float CNeuralNetworkKohonen::rnd()
{
	return ((rand()%2000000) - 1000000)/1000000.0;
}



void CNeuralNetworkKohonen::process(std::vector<float> input)
{
	u32 j, i;
	for (j = 0; j < input_size; j++)
	{
		this->input[j] = input[j];
	}

	float sum_min = 1.0;
	u32 sum_min_idx = 0;

	for (j = 0; j < neurons_count; j++)
	{
		float sum = 0.0;
		for (i = 0; i < input_size; i++)
		{
			float tmp = w[j][i] - this->input[i];
			if (tmp < 0.0)
				tmp = -tmp;
			sum+= tmp;
		}

		sum/= input_size*weight_range*2.0;

		output[j] = sum;

		if (sum < sum_min)
		{
			sum_min = sum;
			sum_min_idx = j;
		}
	}

	winning_neuron_idx = sum_min_idx;

	for (j = 0; j < neurons_count; j++)
		output_v[j] = output[j];
}

void CNeuralNetworkKohonen::learn()
{
	u32 j, i;

	for (j = 0; j < neurons_count; j++)
	{
		float lc = this->lc*distance(j);

		for (i = 0; i < input_size; i++)
		{
			w[j][i] = w[j][i]*(1.0 - lc) + input[i]*lc;
			
			if (w[j][i] > weight_range)
				w[j][i] = weight_range;

			if (w[j][i] < -weight_range)
				w[j][i] = -weight_range;
		}
	}
}

std::vector<float> CNeuralNetworkKohonen::get()
{
	return output_v;
}

u32 CNeuralNetworkKohonen::get_id()
{
	return winning_neuron_idx;
}

float CNeuralNetworkKohonen::get_min_dist()
{
	return output_v[winning_neuron_idx];
}

float* CNeuralNetworkKohonen::get_w(u32 neuron_idx)
{
	return w[neuron_idx];
}

float CNeuralNetworkKohonen::distance(u32 neuron_idx)
{
	//calculate euclidean distance in 2D surface
	float wx = winning_neuron_idx%x_size;
	float wy = winning_neuron_idx/x_size;

	float x = neuron_idx%x_size;
	float y = neuron_idx/x_size;

	float dist = sqrt((wx - x)*(wx - x) + (wy - y)*(wy - y));

	//normalize distance into <0, 1> interval
	dist = dist/sqrt(x_size*x_size + y_size*y_size);	

	dist = lc2/(lc2 + dist);

	/*
	if (neuron_idx == winning_neuron_idx)
		return 1.0;
	else
		return 0.0;
	*/
	
	return dist;
}