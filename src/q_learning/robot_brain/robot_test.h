#ifndef _ROBOT_TEST_H_
#define _ROBOT_TEST_H_

#include "environment.h"

class CRobotTest
{
	private:
		struct sRobotInitStruct robot_init;
		class CEnvironment *environment;

	public:
		CRobotTest();
		~CRobotTest();

		void run(u32 iterations = 100);
};

#endif