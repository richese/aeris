#include "common.h"


void robot_main(u32 robot_type)
{
	class CRobot *robot;

	robot = new CRobot(robot_type);
	while (getch() != 27)
	{
		robot->main();
	}

	delete robot;
}

int main(int argc, char* argv[])
{
	i32 i;
	std::vector<std::string> params;

	for (i = 0; i < argc; i++)
		params.push_back(argv[i]);



	std::string::size_type sz; 
	i32 tmp = std::stoi (params[1],&sz);

	u32 robot_type = ROBOT_TYPE_WALL;

	if ( (tmp|ROBOT_MOVEABLE_FLAG) == ROBOT_TYPE_COMMON)
		robot_type = ROBOT_TYPE_COMMON;
	else
	if ( (tmp|ROBOT_MOVEABLE_FLAG) == ROBOT_TYPE_TARGET)
		robot_type = ROBOT_TYPE_TARGET;
	else
		robot_type = tmp;

	printf("%i\n", robot_type);


	usleep( 1000*(rand()%1000) );

	robot_main(robot_type);
	return 0;
}