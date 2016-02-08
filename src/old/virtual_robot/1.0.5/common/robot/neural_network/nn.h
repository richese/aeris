#ifndef _NN_H_
#define _NN_H_

#include "../../common.h"

struct sNNLayer
{
	u32 input_size, _input_size, output_size, order;
	float *input;

	float *_input;
	float **w;

	float *output;
	float *error;

	float weight_range;
	u32 neuron_type;
};


void nn_layer_init(struct sNNLayer *nn_layer, u32 input_size, u32 output_size, u32 order, float weight_range, u32 neuron_type);
void nn_layer_uninit(struct sNNLayer *nn_layer);

void nn_layer_process(struct sNNLayer *nn_layer, float *input);
void nn_layer_learn(struct sNNLayer *nn_layer, float *error, float lc);

float nn_rnd();

#endif