#include "kohonen_test.h"

CKohonenTest::CKohonenTest()
{
	x_size = 8;
	y_size = 8;
	input_size = 2;
	weight_range = 1.0;
	lc = 0.1;
	lc2 = 0.0001;

	output_size = x_size*y_size;

	k_nn = new CNeuralNetworkKohonen(	x_size, 
										y_size, 
										input_size, 
										weight_range, 
										lc, 
										lc2);


	u32 i;

	for (i = 0; i < input_size; i++)
		input.push_back(0.0);

	for (i = 0; i < output_size; i++)
		output.push_back(0.0);

	input_state = 0.0;
}


CKohonenTest::~CKohonenTest()
{
	delete k_nn;

}
		
void CKohonenTest::run_test()
{
	CLog *log, *network_output_log, *distances_log;

	log = new CLog((char*)"robot_targets/input.txt", 2);

	u32 n;
	for (n = 0; n < 10000; n++)
	{
		set_input();

		k_nn->process(input);
		k_nn->learn();

		log->add(0, input[0]);
		log->add(1, input[1]);
	}

	log->save();


	u32 j, i;

	network_output_log = new CLog((char*)"robot_targets/network_output.txt", input_size);
	for (j = 0; j < output_size; j++)
	{
		for (i = 0; i < input_size; i++)
			network_output_log->add(i, k_nn->get_w(j)[i]);
	}

	network_output_log->save();


	distances_log = new CLog((char*)"robot_targets/distances_output.txt", input_size + 1);
	for (n = 0; n < 10000; n++)
	{
		set_input();

		k_nn->process(input);
	
		distances_log->add(0, input[0]);
		distances_log->add(1, input[1]);
		distances_log->add(2, k_nn->get_min_dist());
	}

	// distances_log->normalize(2);

	distances_log->save();
}


u32 CKohonenTest::target_in_obstacle(float x0, float y0, float x1, float y1)
{
	if ( 
		(input[0] > x0) && (input[0] < x1) &&
		(input[1] > y0) && (input[1] < y1)
		)
		return 1;

	return 0;
}

void CKohonenTest::set_input()
{
	u32 states_count = 8;

	u32 i;
	for (i = 0 ; i < input_size; i++)
		input[i] = 0.0;

	// do
	{
		if (rnd() > 0.9)
			input_state = 2.0*M_PI*((rand()%states_count)/(1.0*states_count));

		float r = rnd();
		float phi = input_state + 0.8*M_PI*rnd()/states_count;

		input[0] = r*cos(phi);
		input[1] = r*sin(phi);
	}
		// while (target_in_obstacle(-0.6, -0.4, -0.4, 0.4) != 0);

}

float CKohonenTest::rnd()
{
	return ((rand()%2000000) - 1000000)/1000000.0;
}
