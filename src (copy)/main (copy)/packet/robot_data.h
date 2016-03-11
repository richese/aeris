#ifndef _ROBOT_data_H_
#define _ROBOT_data_H_

#include "../common/common.h"

struct sRobotData
{
  u32     robot_id;
  double  time_stamp;
  u32     type;                           //robot type 20

  u32     state;
  u32     flags;

  float   fitness;                        //fitness function in GA

  float   width, height, depth;           //robot dimensions
  float   x_pos, y_pos, z_pos;        //robot position
  float   roll, pitch, yaw;               //robot angles
  float   color_r, color_g, color_b;      //robot color


  u16     s_r[4], s_g[4], s_b[4], s_a[4]; //rgba sensors
  u16     s_p[6];                         //proximity sensors
  u16     front_sensor;

  float   left_motor, right_motor;        //motor state
  float   target_x, target_y, target_z;   //target position
};


#define ROBOT_DATA_SIZE         ((u32)sizeof(struct sRobotData))


#define ROBOT_STATE_NULL            (u32)0
#define ROBOT_STATE_NULL_STR        (char*)"robot state null"

#define ROBOT_STATE_IDLE            (u32)1
#define ROBOT_STATE_IDLE_STR        (char*)"robot state idle"

#define ROBOT_STATE_CHARGING        (u32)2
#define ROBOT_STATE_CHARGING_STR    (char*)"robot state charging"

#define ROBOT_STATE_ERROR           (u32)3
#define ROBOT_STATE_ERROR_STR       (char*)"robot state error"

#define ROBOT_STATE_RUNNING         (u32)4
#define ROBOT_STATE_RUNNING_STR     (char*)"robot state running"


#define ROBOT_COMMAND_NULL          (u32)0
#define ROBOT_COMMAND_WRITE_ONLY    (u32)1
#define ROBOT_COMMAND_WRITE_READ    (u32)2
#define ROBOT_COMMAND_READ_ONLY     (u32)3

#endif
