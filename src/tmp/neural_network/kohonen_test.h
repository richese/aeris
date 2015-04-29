#ifndef _KOHONEN_TEST_H_
#define _KOHONEN_TEST_H_

#include "../common.h"
#include "neural_network_kohonen.h"

class CKohonenTest
{
	private:
		class CNeuralNetworkKohonen *k_nn;

		u32 x_size;
		u32 y_size;
		u32 input_size;
		float weight_range;
		float lc;
		float lc2;

		u32 output_size;

		std::vector<float> input, output;
		float input_state;
	public:
		CKohonenTest();
		~CKohonenTest();

		void run_test();


		void set_input();
		float rnd();

		u32 target_in_obstacle(float x0, float y0, float x1, float y1);

};

#endif