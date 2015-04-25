#include "robot_test.h"

CRobotTest::CRobotTest()
{
	u32 tmp = 16;

	robot_init.inputs_count = 0;
	robot_init.outputs_count = 2;
	robot_init.actions_per_state = 4;
	robot_init.states_count = tmp*tmp;	
	robot_init.type = 0; 


	std::vector<float> position_max;

	u32 i;
	for (i = 0; i < robot_init.outputs_count; i++)
		position_max.push_back(tmp);

	robot_init.position_max = position_max;


	robot_init.path_max_length = 64;
	
	environment = new CEnvironment(16, robot_init);
}

CRobotTest::~CRobotTest()
{
	delete environment;
}

void CRobotTest::run(u32 iterations)
{
	u32 n;
	for (n = 0; n < iterations; n++)
	{
		environment->process(n);
	}

	environment->print();

	printf("test done\n");
}