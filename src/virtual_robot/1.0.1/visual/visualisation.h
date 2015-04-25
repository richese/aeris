#ifndef _VISUALISATION_H_
#define _VISUALISATION_H_

#include "common.h"


class CVisualisation
{
	private:

		struct sRobot robot;
		class CClient *client;

		u32 robot_idx;
		

	public:
		CVisualisation();
		~CVisualisation();

		void main();	

	private:
		void randering_thread_main_loop_func();	
};

#endif