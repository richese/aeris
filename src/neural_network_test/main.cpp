#include "common.h"
#include "nn_test.h"



int main()
{
	srand(time(NULL));

	class CNNTest *nn_test;

	nn_test = new CNNTest();

	u32 i;
	for (i = 0; i < 100000; i++)
	{
		nn_test->run_test();
		if ((i%100) == 0)
			nn_test->print();
	}

	delete nn_test;

	printf("program done\n");
	return 0;
} 