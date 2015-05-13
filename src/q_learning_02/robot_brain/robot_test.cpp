#include "robot_test.h"

CRobotTest::CRobotTest()
{
	u32 tmp = 16;


	std::vector<float> position_max;

	u32 i;
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		robot_init.position_max[i] = tmp;

	
	environment = new CEnvironment(16, robot_init); //16 robots
	//environment = new CEnvironment(1, robot_init); //1 robots

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