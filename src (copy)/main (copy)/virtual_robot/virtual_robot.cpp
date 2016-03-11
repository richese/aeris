#include "virtual_robot.h"


/*

struct sRobotData
{
  u32     robot_id;
  double  time_stamp;
  u32     type;                           //robot type 20

  u32     state;
  u32     flags;

  float   fitness;                        //fitness function in GA

  float   x_pos, y_pos, angle_pos;        //robot position and angle - for visualisation
  float   color_r, color_g, color_b;      //robot color
  u16     s_r[4], s_g[4], s_b[4], s_a[4]; //rgba sensors

  u16     s_p[6];                         //proximity sensors
  u16   front_sensor;

  float   roll, pitch, yaw;               //robot angles from IMU
  float   left_motor, right_motor;        //motor state

  float   target_x, target_y;             //target position
};

*/

float rnd()
{
  return ((rand()%200000) - 100000)/100000.0;
}

float x_max = 1155.0/2.0; //1155mm
float y_max = 650.0/2.0;  //650mm
float z_max = 0.0;

CVirtualRobot::CVirtualRobot()
{
  robot_data.type = rand()%27;
  robot_data.x_pos = rnd()*0.99*x_max;
  robot_data.y_pos = rnd()*0.99*y_max;
  robot_data.z_pos = rnd()*0.00*z_max;

  robot_data.roll = 0.0;
  robot_data.pitch = 0.0;
  robot_data.yaw = rnd()*3.14159*2.0;


  float size = 1.0/16.0;

  robot_data.width = 10.0; //size*(rnd() + 1.0)/2.0;
  robot_data.height = 10.0; //size*(rnd() + 1.0)/2.0;
  robot_data.depth = 10.0; //size*(rnd() + 1.0)/2.0;

  robot_data.color_r = (rnd() + 1.0)/2.0;
  robot_data.color_g = (rnd() + 1.0)/2.0;
  robot_data.color_b = (rnd() + 1.0)/2.0;

  robot_data.robot_id = cfg_get_unique_id() + rand();

  dx = 0.0;
  dy = 0.0;
  dz = 0.0;
  dyaw = 0.0;

  client = new CClient();
}

CVirtualRobot::~CVirtualRobot()
{
  delete client;
}


void CVirtualRobot::process()
{
  if ((rand()%100) < 10)
  {
      dx = 4.0*rnd();
      dy = 4.0*rnd();
      dz = 4.0*rnd();
      dyaw = 0.1*rnd();
  }

  robot_data.x_pos+= dx;
  robot_data.y_pos+= dy;
  robot_data.z_pos = 0.0;

  robot_data.yaw+= dyaw;

  if (robot_data.x_pos > x_max)
    robot_data.x_pos = x_max;

  if (robot_data.x_pos < -x_max)
    robot_data.x_pos = -x_max;

  if (robot_data.y_pos > y_max)
    robot_data.y_pos = y_max;

  if (robot_data.y_pos < -y_max)
    robot_data.y_pos = -y_max;

  if (robot_data.z_pos > z_max)
    robot_data.z_pos = z_max;

  if (robot_data.z_pos < -z_max)
    robot_data.z_pos = -z_max;

  robot_data.time_stamp = get_ms_time();

  struct sPacket rx_packet, tx_packet;

  tx_packet.destination = cfg_get_server_id();
  tx_packet.source = cfg_get_unique_id();
  tx_packet.type = PACKET_TYPE_COMMON_ROBOT;
  tx_packet.param = 0;

  packet_from_robot_data(&tx_packet, robot_data);

  i32 res;
  res = client->connect_to_server(&rx_packet, &tx_packet);

  if (res < 0)
    g_error_log_add((char*)"connection error", 10, res);
}
