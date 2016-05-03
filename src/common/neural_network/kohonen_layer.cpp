#include "kohonen_layer.h"

/*
struct sKohonenLayerInit
{
  u32 neurons_count, iput_vector_size, output_vector_size;
  float eta, alpha;
};

class CKohonenLayer
{
  private:
    struct sKohonenLayerInit init_struct;

    float **w;
    float **output;
    float *distances;

  public:
    CKohonenLayer(struct sKohonenLayerInit init_struct);
    ~CKohonenLayer();

    void process(float *input, bool learn = false);

    */


CKohonenLayer::CKohonenLayer(struct sKohonenLayerInit init_struct)
{
  u32 j, i;
  this->init_struct = init_struct;
  winning_neuron_idx = 0;

  w = (float**)malloc(this->init_struct.neurons_count*sizeof(float*));
  for (j = 0; j < this->init_struct.neurons_count; j++)
  {
    w[j] = (float*)malloc(this->init_struct.input_vector_size*sizeof(float));

    for (i = 0; i < this->init_struct.input_vector_size; i++)
      w[j][i] = rnd_();
  }

  input = (float*)malloc(this->init_struct.input_vector_size*sizeof(float));

  for (i = 0; i < this->init_struct.input_vector_size; i++)
    input[i] = 0.0;


  output = (float**)malloc(this->init_struct.neurons_count*sizeof(float*));
  for (j = 0; j < this->init_struct.neurons_count; j++)
  {
    output[j] = (float*)malloc(this->init_struct.output_vector_size*sizeof(float));

    for (i = 0; i < this->init_struct.output_vector_size; i++)
      output[j][i] = 0.0;
  }

  distances = (float*)malloc(this->init_struct.neurons_count*sizeof(float));
  for (j = 0; j < this->init_struct.neurons_count; j++)
    distances[j] = 0.0;


  output_lc = (float*)malloc(this->init_struct.output_vector_size*sizeof(float));
  for (j = 0; j < this->init_struct.output_vector_size; j++)
    output_lc[j]= 0.0;

  v = (float*)malloc(this->init_struct.neurons_count*sizeof(float));
  for (i = 0; i < this->init_struct.neurons_count; i++)
    v[i] = 0.0;

}

CKohonenLayer::~CKohonenLayer()
{
  u32 i;

  free(v);
  free(output_lc);
  free(distances);
  for (i = 0; i < init_struct.neurons_count; i++) {
    free(output[i]);
  }
  free(output);
  free(input);
  for (i = 0; i < init_struct.neurons_count; i++) {
    free(w[i]);
  }
  free(w);
}


void CKohonenLayer::process(float *input)
{
  u32 j, i;
  winning_neuron_idx = 0;

  float sum_all = 0.0;

  for (i = 0; i < this->init_struct.input_vector_size; i++)
    this->input[i] = input[i];

  for (j = 0; j < this->init_struct.neurons_count; j++)
  {
    float sum = 0.0;
    for (i = 0; i < this->init_struct.input_vector_size; i++)
      sum+=pow(w[j][i] - this->input[i], 2.0);

    distances[j] = sum;
    sum_all+= sum;

    if (distances[j] <= distances[winning_neuron_idx])
      winning_neuron_idx = j;
  }



  for (j = 0; j < this->init_struct.output_vector_size; j++)
  {
    output_lc[j]= 0.0;
    for (i = 0; i < this->init_struct.neurons_count; i++)
      output_lc[j]+= v[i]*exp(-distances[i]*distances[i])*output[i][j];
  }
}


void CKohonenLayer::learn_w()
{
  u32 j, i;
  j = winning_neuron_idx;
  float eta = this->init_struct.eta;

  for (i = 0; i < this->init_struct.input_vector_size; i++)
    w[j][i] = (1.0 - eta)*w[j][i] + eta*input[i];
}

void CKohonenLayer::learn_output(float *requred_output, bool learn_lc)
{
  u32 j, i;

  if (learn_lc == false)
  {
    j = winning_neuron_idx;
    float alpha = this->init_struct.alpha;

    for (i = 0; i < this->init_struct.output_vector_size; i++)
      output[j][i] = (1.0 - alpha)*output[j][i] + alpha*requred_output[i];

    return;
  }
}

u32 CKohonenLayer::get_winning_neuron_idx()
{
  return winning_neuron_idx;
}

float* CKohonenLayer::get_output()
{
  return output[winning_neuron_idx];
}

float* CKohonenLayer::get_output_lc()
{
  return output_lc;
}
