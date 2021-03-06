/**
  @file   s_robot.h
  @Author michal chovanec
  @date   April, 2015
  @brief  robot structure
*/

#ifndef _S_ROBOT_H_
#define _S_ROBOT_H_

#include "../common.h"

#define ROBOT_MOVEABLE_FLAG				((u32)(1<<31))
#define ROBOT_SOLID_FLAG				((u32)(1<<30))
#define ROBOT_STRONG_SOLID_FLAG			((u32)(1<<29))
#define ROBOT_3D_FLAG					((u32)(1<<28))


#define ROBOT_TYPE_NULL					((u32)0)
#define ROBOT_TYPE_VISUALISATION		((u32)1)
#define ROBOT_TYPE_WALL					(((u32)2)|ROBOT_SOLID_FLAG|ROBOT_STRONG_SOLID_FLAG|ROBOT_3D_FLAG)
#define ROBOT_TYPE_COMMON				(((u32)3)|ROBOT_MOVEABLE_FLAG|ROBOT_SOLID_FLAG|ROBOT_3D_FLAG)
#define ROBOT_TYPE_TARGET				(((u32)4))


#define ROBOT_TYPE_PATH 				((u32)5)
#define ROBOT_TYPE_SOURCE 				((u32)6)
#define ROBOT_TYPE_DESTINATION			((u32)7)


#define ROBOT_TYPE_RED_ROBOT 			((u32)8|ROBOT_MOVEABLE_FLAG|ROBOT_SOLID_FLAG|ROBOT_3D_FLAG)
#define ROBOT_TYPE_RED_TARGET			((u32)9)
#define ROBOT_TYPE_RED_PATH				((u32)10)

#define ROBOT_TYPE_GREEN_ROBOT 			((u32)11|ROBOT_MOVEABLE_FLAG|ROBOT_SOLID_FLAG|ROBOT_3D_FLAG)
#define ROBOT_TYPE_GREEN_TARGET			((u32)12)
#define ROBOT_TYPE_GREEN_PATH			((u32)13)

#define ROBOT_TYPE_BLUE_ROBOT 			((u32)14|ROBOT_MOVEABLE_FLAG|ROBOT_SOLID_FLAG|ROBOT_3D_FLAG)
#define ROBOT_TYPE_BLUE_TARGET			((u32)15)
#define ROBOT_TYPE_BLUE_PATH			((u32)16)


#define ROBOT_TYPE_RED_PHEROMONE		((u32)16)
#define ROBOT_TYPE_BLUE_PHEROMONE		((u32)17)
#define ROBOT_TYPE_GREEN_PHEROMONE		((u32)18)


#define ROBOT_TYPE_COUNT				(u32)19
#define ROBOT_TYPE_MASK					(u32)0x0000ffff


#define ROBOT_FORCE_MAX					(float)10.0









#define REQUEST_NULL					((u32)0)
#define REQUEST_ROBOT_SUCESS			((u32)1)
#define REQUEST_ROBOT_FAILED			((u32)2)
#define REQUEST_ROBOT_DATA				((u32)3)
#define REQUEST_ROBOT_RESPAWN			((u32)4)
#define REQUEST_ROBOT_DELETE			((u32)5)

#define REQUEST_ROBOT_ADD_RED_PHEROMONE			((u32)6)
#define REQUEST_ROBOT_ADD_GREEN_PHEROMONE		((u32)7)
#define REQUEST_ROBOT_ADD_BLUE_PHEROMONE		((u32)8)

#define ROBOT_SPACE_DIMENSION	(u32)2

#define ROBOT_SENSORS_COUNT		(u32)25

  

#define ROBOT_SENSOR_REWARD_IDX				(u32)0
#define ROBOT_SENSOR_COLISION_IDX			(u32)1

#define ROBOT_SENSOR_POSITION_0_IDX			(u32)2
#define ROBOT_SENSOR_POSITION_1_IDX			(u32)3
#define ROBOT_SENSOR_POSITION_2_IDX			(u32)4


#define ROBOT_SENSOR_TARGET_POSITION_0_IDX	(u32)5
#define ROBOT_SENSOR_TARGET_POSITION_1_IDX	(u32)6
#define ROBOT_SENSOR_TARGET_POSITION_2_IDX	(u32)7
#define ROBOT_SENSOR_TARGET_DISTANCE_IDX	(u32)8

#define ROBOT_SENSOR_RED_TARGET_POSITION_0_IDX	(u32)9
#define ROBOT_SENSOR_RED_TARGET_POSITION_1_IDX	(u32)10
#define ROBOT_SENSOR_RED_TARGET_POSITION_2_IDX	(u32)11
#define ROBOT_SENSOR_RED_TARGET_DISTANCE_IDX	(u32)12

#define ROBOT_SENSOR_GREEN_TARGET_POSITION_0_IDX	(u32)13
#define ROBOT_SENSOR_GREEN_TARGET_POSITION_1_IDX	(u32)14
#define ROBOT_SENSOR_GREEN_TARGET_POSITION_2_IDX	(u32)15
#define ROBOT_SENSOR_GREEN_TARGET_DISTANCE_IDX		(u32)16

#define ROBOT_SENSOR_BLUE_TARGET_POSITION_0_IDX		(u32)17
#define ROBOT_SENSOR_BLUE_TARGET_POSITION_1_IDX		(u32)18
#define ROBOT_SENSOR_BLUE_TARGET_POSITION_2_IDX		(u32)19
#define ROBOT_SENSOR_BLUE_TARGET_DISTANCE_IDX		(u32)20




#define ROBOT_SENSOR_COLISION_POSITION_0_IDX	(u32)21
#define ROBOT_SENSOR_COLISION_POSITION_1_IDX	(u32)22
#define ROBOT_SENSOR_COLISION_POSITION_2_IDX	(u32)23
#define ROBOT_SENSOR_COLISION_DISTANCE_IDX		(u32)24



struct sRobot
{
	u64 id;							//robot unique ID
	u32 type;						//robot type identificator

	u32 request;					//request for server,	REQUEST_NULL if nothing required
	u32 parameter;					//parameter for request

	float force_max[ROBOT_SPACE_DIMENSION];
	float force[ROBOT_SPACE_DIMENSION];
	float d[ROBOT_SPACE_DIMENSION];			//robot position difference
	float position[ROBOT_SPACE_DIMENSION];	//robot position
	float position_max[ROBOT_SPACE_DIMENSION];
	float sensors[ROBOT_SENSORS_COUNT];		//sensors input

	float angles[ROBOT_SPACE_DIMENSION];				//angles
	
	float dt;						//time step
	double time;					//real time

	
	// int parameter from map @see struct sMapField
	i32 parameter_int;				

	// float parameter from map @see struct sMapField
	float parameter_f;

	float reward, colision_distance;
};

#endif