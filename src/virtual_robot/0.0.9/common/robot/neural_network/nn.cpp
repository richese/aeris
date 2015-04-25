#include "nn.h"

void nn_layer_init(struct sNNLayer *nn_layer, u32 input_size, u32 output_size, u32 order, float weight_range, u32 neuron_type)
{
	nn_layer->input_size = input_size;
	nn_layer->output_size = output_size;
	nn_layer->order = order;
	nn_layer->weight_range = weight_range;
	nn_layer->neuron_type = neuron_type;

	u32 j, i;

	nn_layer->input = (float*)malloc(nn_layer->input_size*sizeof(float));
	for (i = 0; i < nn_layer->input_size; i++)
		nn_layer->input[i] = 0.0;

	nn_layer->output = (float*)malloc(nn_layer->output_size*sizeof(float));
	for (i = 0; i < nn_layer->output_size; i++)
		nn_layer->output[i] = 0.0;

	nn_layer->error = (float*)malloc(nn_layer->output_size*sizeof(float));
	for (i = 0; i < nn_layer->output_size; i++)
		nn_layer->error[i] = 0.0;

	/*
		u32 _input_size;
		float *_input;
		float **w;
	*/
	nn_layer->_input_size = 0;

	for (j = 1; j < nn_layer->order; j++)
	{
		for (i = 0; i < nn_layer->input_size; i++)
			nn_layer->_input_size++;
	}

	for (j = 0; j < nn_layer->input_size; j++)
	{
		for (i = 0; i < (j + 1); i++)
			nn_layer->_input_size++;
	}
	

	nn_layer->_input = (float*)malloc(nn_layer->_input_size*sizeof(float));
	for (i = 0; i < nn_layer->_input_size; i++)
		nn_layer->_input[i] = 0.0;

	nn_layer->w = (float**)malloc(nn_layer->output_size*sizeof(float*));
	for (j = 0; j < nn_layer->output_size; j++)
	{
		nn_layer->w[j] = (float*)malloc(nn_layer->_input_size*sizeof(float));
		for (i = 0; i < nn_layer->_input_size; i++)
			nn_layer->w[j][i] = nn_rnd()*nn_layer->weight_range*0.1;
	}
}

void nn_layer_uninit(struct sNNLayer *nn_layer)
{
	if (nn_layer->input != NULL)
	{
		free(nn_layer->input);
		nn_layer->input = NULL;
	}

	if (nn_layer->output != NULL)
	{
		free(nn_layer->output);
		nn_layer->output = NULL;
	}

	if (nn_layer->error != NULL)
	{
		free(nn_layer->error);
		nn_layer->error = NULL;
	}

	if (nn_layer->_input != NULL)
	{
		free(nn_layer->_input);
		nn_layer->_input = NULL;
	}

	if (nn_layer->w != NULL)
	{
		u32 i;
		for (i = 0; i < nn_layer->output_size; i++)
			free(nn_layer->w[i]);
		free(nn_layer->w);
		nn_layer->w = NULL;
	}
}

void nn_layer_process(struct sNNLayer *nn_layer, float *input)
{
	u32 j, i, ptr = 0;

	for (j = 1; j < nn_layer->order; j++)
		for (i = 0; i < nn_layer->input_size; i++)
		{
			nn_layer->_input[ptr] = pow(input[i], j);
			ptr++;
		}

	for (j = 0; j < nn_layer->input_size; j++)
		for (i = 0; i < (j + 1); i++)
		{
			nn_layer->_input[ptr] = input[i]*input[j];
			ptr++;
		}

	for (j = 0; j < nn_layer->output_size; j++)
	{
		float sum = 0.0;
		for (i = 0; i < nn_layer->_input_size; i++)
			sum+= nn_layer->w[j][i]*nn_layer->_input[i];

		if (sum > 1.0)
			sum = 1.0;

		if (sum < -1.0)
			sum = -1.0;

		nn_layer->output[j] = sum;
	}
}

void nn_layer_learn(struct sNNLayer *nn_layer, float *error, float lc)
{
	u32 j, i;
	for (j = 0; j < nn_layer->output_size; j++)
		for (i = 0; i < nn_layer->_input_size; i++)
		{
			float dw = nn_layer->w[j][i] + lc*error[j]*nn_layer->_input[i];
			if (dw > nn_layer->weight_range)
				dw = nn_layer->weight_range;

			if (dw < -nn_layer->weight_range)
				dw = -nn_layer->weight_range;

			nn_layer->w[j][i] = dw;
		}

	for (j = 0; j < nn_layer->output_size; j++)
		nn_layer->error[j] = 0.0;

	for (j = 0; j < nn_layer->output_size; j++)
		for (i = 0; i < nn_layer->input_size; i++)
			nn_layer->error[i]+= error[j]*nn_layer->input[i];
}

float nn_rnd()
{
	return ((rand()%2000000) - 1000000)/1000000.0;
}