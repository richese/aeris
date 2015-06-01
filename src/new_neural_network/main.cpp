#include "common.h"
#include "neural_network/neural_network_function_aproximation_test.h"

void test()
{
	class CNeuralNetworkFunctionAproximationTest *aproximation_test;
	
	aproximation_test = new CNeuralNetworkFunctionAproximationTest(NEURON_TYPE_COMMON);
	//aproximation_test = new CNeuralNetworkFunctionAproximationTest(NEURON_TYPE_TAYLOR);
	//aproximation_test = new CNeuralNetworkFunctionAproximationTest(NEURON_TYPE_MIXED);

  
	aproximation_test->run_test();
	delete aproximation_test;
}

int main()
{
	srand(time(NULL));
	test();

	printf("program done\n");
	return 0;
} 
