#ifndef _S_ROBOT_H_
#define _S_ROBOT_H_

#include "../common.h"

#define ROBOT_MOVEABLE_FLAG				((u32)(1<<31))

#define ROBOT_TYPE_NULL					((u32)0)
#define ROBOT_TYPE_VISUALISATION		((u32)1)
#define ROBOT_TYPE_WALL					((u32)2)
#define ROBOT_TYPE_COMMON				(((u32)3)|ROBOT_MOVEABLE_FLAG)
#define ROBOT_TYPE_TARGET				(((u32)4)|ROBOT_MOVEABLE_FLAG)

#define REQUEST_NULL					((u32)0)
#define REQUEST_ROBOT_SUCESS			((u32)1)
#define REQUEST_ROBOT_FAILED			((u32)2)
#define REQUEST_ROBOT_DATA				((u32)3)
#define REQUEST_ROBOT_RESPAWN			((u32)4)

#define ROBOT_SPACE_DIMENSION	(u32)2
#define ROBOT_SENSORS_COUNT		(u32)4 
 

#define ROBOT_SENSOR_TARGET_DISTANCE_IDX	(u32)0
#define ROBOT_SENSOR_TARGET_ANGLE_0_IDX		(u32)1
#define ROBOT_SENSOR_TARGET_ANGLE_1_IDX		(u32)2
#define ROBOT_SENSOR_TARGET_ANGLE_2_IDX		(u32)3

struct sRobot
{
	u64 id;							//robot unique ID
	u32 type;						//robot type identificator

	u32 request;					//request for server,	REQUEST_NULL if nothing required
	u32 parameter;					//parameter for request

	float d[ROBOT_SPACE_DIMENSION];			//robot position difference
	float position[ROBOT_SPACE_DIMENSION];	//robot position
	float sensors[ROBOT_SENSORS_COUNT];		//sensors input

	float angles[ROBOT_SPACE_DIMENSION];				//angles
	
	float dt;
	double time;
};

#endif