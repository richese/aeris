#ifndef _KOHONEN_LAYER_H_
#define _KOHONEN_LAYER_H_

#include "../common.h"

struct sKohonenLayerInit
{
  u32 neurons_count, input_vector_size, output_vector_size;
  float eta, alpha;
};

class CKohonenLayer
{
  private:
    struct sKohonenLayerInit init_struct;

    float **w;
    float *input;
    float **output;
    float *distances;

    float *output_lc, *v;

    u32 winning_neuron_idx;
  public:
    CKohonenLayer(struct sKohonenLayerInit init_struct);
    ~CKohonenLayer();

    void process(float *input);

    void learn_w();
    void learn_output(float *requred_output, bool learn_lc = false);

    u32 get_winning_neuron_idx();
    float* get_output();
    float* get_output_lc();

};

#endif
