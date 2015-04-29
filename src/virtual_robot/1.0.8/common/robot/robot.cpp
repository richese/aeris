#include "robot.h"


CRobot::CRobot(u32 robot_type)
{ 
	u32 i; 

    cfg_load((char*)CFG_FILE_NAME);

	robot.id = cfg_get_id();
	robot.type = robot_type;
	robot.request = REQUEST_NULL;
	robot.parameter = 0;

	robot.dt = 10.0;	//dt in ms
	robot.time = 0.0;

	robot.fitness = 0.0;

	for (i = 0; i < ROBOT_SENSORS_COUNT; i++)
		robot.sensors[i] = 0.0;

	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
	{
		robot.d[i] = 0.0;
		robot.position[i] = 0.0;
	}

	state = 0;

	robot_brain = new CRobotBrain(robot);
	client = new CClient();

	debug_log_add((char*)"robot init done");
}

CRobot::~CRobot()
{
	delete client;
	debug_log_add((char*)"robot uninit done");
}
 
void CRobot::main()
{
	struct sRobot tx_data, rx_data;

	/*

	u32 i;
	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		robot.d[i] = rnd_()*0.1 + 0.1;

	robot.yaw = 0.0*rnd_()*2.0*PI;
	*/ 



	robot_brain->process(&robot);



	tx_data = robot;
	i32 res = client->main(&rx_data, &tx_data);

	if (res == 1)
	{
		robot = rx_data;
		/*
		for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
			printf("%f ", robot.d[i]);
		printf("\n");
		*/
	}
}