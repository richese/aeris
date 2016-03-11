#include "robot_visualisation.h"


#include <X11/X.h>
#include <X11/Xlib.h>
#include <GL/gl.h>
#include <GL/glx.h>
#include <GL/glu.h>
#include <GL/freeglut.h>
#include <GL/glut.h>


CRobotVisualisation::CRobotVisualisation(u32 enable_opengl)
{
  u32 j;

  terminal_width = 128;
  terminal_height = 32;
  time_out_deadline = 1000.0*60.0; //one minute

  cm_size = 10.0*100.0/81.0;

  /*
  screen_width = 1920;
  screen_height = 1080;
  */

  screen_width = 640;
  screen_height = screen_width*9.0/16.0;

  u32 robots_max_count = 1024;

  /*
  for (j = 0; j < 200; j++)
    printf("\n");

  clear();
  */

  struct sRobotData robot;
  robot.robot_id = 0;
  robot.type = 0;
  robot.time_stamp = get_ms_time();


  for (j = 0; j < robots_max_count; j++)
    robots.push_back(robot);

  if (enable_opengl)
  {
    visualise_init();
  }

  client = new CClient();
}

CRobotVisualisation::~CRobotVisualisation()
{
  delete client;
}

i32 CRobotVisualisation::process_reading(u32 log_enabled)
{
  struct sPacket rx_packet, tx_packet;

  tx_packet.destination = cfg_get_server_id();
  tx_packet.source = cfg_get_unique_id();
  tx_packet.type = PACKET_TYPE_COMMON_ROBOT_READ_REQUEST;
  tx_packet.param = 0;

  i32 res;
  res = client->connect_to_server(&rx_packet, &tx_packet);

  if (res < 0)
    g_error_log_add((char*)"connection error", 10, res);

  //check connection, packet type and new data
  if ((res == 0) && (rx_packet.type == PACKET_TYPE_COMMON_ROBOT_READ_REQUEST) &&  (rx_packet.param == PACKET_PARAM_OK))
  {
    robot_data_from_packet(rx_packet, &robot_data);
    refresh(robot_data);
    return 0;
  }

  return -1;
}


void CRobotVisualisation::refresh(struct sRobotData robot_data)
{
  u32 j;
  i32 idx = -1;
  for (j = 0; j < robots.size(); j++)
  {
    if (robots[j].robot_id == robot_data.robot_id)
    {
      idx = j;
      break;
    }
  }

  if (idx == -1)
    for (j = 0; j < robots.size(); j++)
      if (robots[j].robot_id == 0)
      {
        idx = j;
        break;
      }

  if (idx != -1)
    robots[idx] = robot_data;
  else
    g_debug_log_add((char*)"robot visualisation",(char*)"no space for more robots");

  //forget old robots
  for (j = 0; j < robots.size(); j++)
  {
    if ((robots[j].time_stamp + time_out_deadline) < get_ms_time())
      robots[j].robot_id = 0;
  }
}

void CRobotVisualisation::print()
{
  i32 x = rand()%terminal_width;
  i32 y = rand()%terminal_height;
  u32 c = ' ';

  if (robot_data.type != 0)
    c = 'A' + (robot_data.type%27);

  x = terminal_width*(robot_data.x_pos + 1.0)/2.0;
  if (x < 0)
    x = 0;
  if (x >= terminal_width)
    x = terminal_width;


  y = terminal_height*(robot_data.y_pos + 1.0)/2.0;
  if (y < 0)
    y = 0;
  if (y >= terminal_height)
    y = terminal_height;


	printf("%c[%d;%df",0x1B,(u32)y,(u32)x);
	printf("%c", c);
}

void CRobotVisualisation::clear()
{
  i32 x, y;

  for (y = 0; y <= terminal_height; y++)
  for (x = 0; x <= terminal_width; x++)
  {
    char c = ' ';
    printf("%c[%d;%df",0x1B,(u32)y,(u32)x);
    printf("%c", c);
  }
}





void point_rotate(float *x_res, float *y_res, float x, float y, float angle)
{
  *x_res = cos(angle)*x - sin(angle)*y;
  *y_res = sin(angle)*x + cos(angle)*y;
}


void CRobotVisualisation::visualise_paint_robot(struct sRobotData robot_data)
{
  float x = robot_data.x_pos;
  float y = robot_data.y_pos;
  float z = robot_data.z_pos;

  float yaw = robot_data.yaw;

  float width = robot_data.width*cm_size*0.1;
  float depth = robot_data.depth*cm_size*0.1;
  float height = robot_data.height*cm_size*0.1;

  float r = robot_data.color_r;
  float g = robot_data.color_g;
  float b = robot_data.color_b;

  float ax, ay;
  float bx, by;
  float cx, cy;
  float dx, dy;

  point_rotate(&ax, &ay, -width/2.0, -depth/2.0, yaw);
  point_rotate(&bx, &by, -width/2.0, depth/2.0, yaw);
  point_rotate(&cx, &cy, width/2.0, depth/2.0, yaw);
  point_rotate(&dx, &dy, width/2.0, -depth/2.0, yaw);

  glColor3f(r, g, b);

  glBegin(GL_QUADS);
  glVertex3f(x + ax, y + ay, z + 0.001);
  glVertex3f(x + bx, y + by, z + 0.001);
  glVertex3f(x + cx, y + cy, z + 0.001);
  glVertex3f(x + dx, y + dy, z + 0.001);

  /*
  glVertex3f(x + ax, y + ay, z + height);
  glVertex3f(x + bx, y + by, z + height);
  glVertex3f(x + cx, y + cy, z + height);
  glVertex3f(x + dx, y + dy, z + height);
  */
  glEnd();

  glBegin(GL_LINES);
  glVertex3f(x, y, z + 0.001);
  glVertex3f(x, y, z + 0.001 + 100.0);
  glEnd();
}

void CRobotVisualisation::visualise_refresh()
{
  glMatrixMode(GL_PROJECTION);
  glShadeModel(GL_SMOOTH);
  glEnable(GL_DEPTH_TEST);
  glMatrixMode(GL_MODELVIEW);

  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
  glLoadIdentity();

  glEnable(GL_DEPTH_TEST);
  glDepthFunc(GL_LEQUAL);

  glMatrixMode(GL_MODELVIEW);

  u32 g_view_state = 2;

  switch (g_view_state)
  {
    case 0:
          glTranslatef(0.0, 0.0, -1000.0);
          glRotatef(0.0, 0.0, 0.0, 0.0);
          break;

    case 1:
          glTranslatef(0.0, 0.0, -4.0);
          glRotatef(0.0, 0.0, 0.0, 0.0);
          break;


    case 2:
          glTranslatef(0.0, 0.0, -1000.0);
          glRotatef(-70.0, 1.0, 0.0, 0.0);
          break;
          /*
    case 3:
          glRotatef(-80.0, 1.0, 0.0, 0.0);
          glRotatef(-angle*180.0/PI + 90.0, 0.0, 0.0, 1.0);
          glTranslatef(-x + 0.3*sin(-angle + PI/2), -y + 0.3*cos(-angle + PI/2), -0.1);
          break;
            */
  }

  glClearColor(0.0, 0.0, 0.0, 0.0);

  u32 max_y = 100;
  u32 max_x = (max_y*16.0)/9.0;
  u32 j, i;

  for (j = 0; j < max_y; j++)
    for (i = 0; i < max_x; i++)
    {
      if ((j%2) == (i%2))
        glColor3f(0.05, 0.05, 0.05);
      else
        glColor3f(0.0, 0.0, 0.0);

      float size = cm_size;
      float x = size*(i - max_x/2.0);
      float y = size*(j - max_y/2.0);


      glBegin(GL_QUADS);
      glVertex3f(x - 0.5*size, y - 0.5*size, 0.0);
      glVertex3f(x + 0.5*size, y - 0.5*size, 0.0);
      glVertex3f(x + 0.5*size, y + 0.5*size, 0.0);
      glVertex3f(x - 0.5*size, y + 0.5*size, 0.0);
      glEnd();
    }

  for (j = 0; j < robots.size(); j++)
    if (robots[j].robot_id != 0)
      visualise_paint_robot(robots[j]);

  glutSwapBuffers();
}

void CRobotVisualisation::visualise_init()
{
  u32 window_width = screen_width;
  u32 window_height = screen_height;

  int num = 0;

  glutInit(&num, NULL);
  glutInitWindowSize(window_width, window_height);
  glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE);
  glutCreateWindow("robot visualisation");


  //glutIdleFunc(visualise_idle);
  //glutKeyboardFunc(visualise_process_keys);

  glViewport(0, 0, window_width, window_height);
  glMatrixMode(GL_PROJECTION);
  glEnable(GL_DEPTH_TEST);
  gluPerspective(45, (float) window_width / window_height, 0.1, 2000);
  glMatrixMode(GL_MODELVIEW);

//  rendering_thread = new std::thread(visualise_rendering_thread);
}
