#ifndef _VISUALISATION_GL_H_
#define _VISUALISATION_GL_H_

#include <stdio.h>
#include <signal.h> 
#include <X11/X.h> 
#include <X11/Xlib.h>
#include <GL/gl.h>  
#include <GL/glx.h>  
#include <GL/glu.h> 
#include <GL/freeglut.h> 
#include <GL/glut.h>

#include "common.h"

struct sVisualisation
{
	i32 window_width, window_height;

	float base_size, angle;

	float position_max_x;
	float position_max_y;
	float position_max_z;

	u32 view_state;

	std::thread *rendering_thread_main_loop;

	std::vector<struct sRobot> robots;

	std::mutex mutex;
};



void visualisation_render();
void visualisation_init();
void visualisation_rendering_thread();

void visualisation_update(struct sRobot robot);
#endif