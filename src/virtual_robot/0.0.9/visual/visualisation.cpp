#include "visualisation.h"

extern struct sVisualisation g_visualisation;

CVisualisation::CVisualisation()
{
    cfg_load((char*)CFG_FILE_NAME);
	client = new CClient();
 
	robot.id = cfg_get_id();
	robot.type = ROBOT_TYPE_VISUALISATION;
	robot.request = REQUEST_ROBOT_DATA;
	robot.parameter = 0;

	robot.dt = 100.0;
	robot.time = 0.0;

	robot_idx = 0;
 
	u32 width = 1024;
	u32 height = 768;

	/*
	HDC hdc = GetDC (NULL);
	width = GetDeviceCaps (hdc, HORZRES);
	height = GetDeviceCaps (hdr, VERTRES);
	ReleaseDC (NULL, hdc);
	*/


	float size = 1.0;

	g_visualisation.window_width = width; 
    g_visualisation.window_height = height;   
 
	g_visualisation.size = 32.0; 
    g_visualisation.ratio = 0.03;

    g_visualisation.position_max_x = width;
    g_visualisation.position_max_y = height;
    g_visualisation.position_max_z = 2.0;

    visualisation_init();

	debug_log_add((char*)"visualisation init done");
}

CVisualisation::~CVisualisation()
{
	debug_log_add((char*)"visualisation uninit done");
}

void CVisualisation::main()
{
	struct sRobot tx_data, rx_data;

	robot.parameter = robot_idx;
	robot.type = ROBOT_TYPE_VISUALISATION;
	robot.request = REQUEST_ROBOT_DATA;
	
	tx_data = robot;
	i32 res = client->main(&rx_data, &tx_data);

	u32 i;
	if (res == 1)
	{
		if (rx_data.request == REQUEST_ROBOT_SUCESS)
		{
			// printf("robot id %lu\n", rx_data.id);
			
            if ( (rx_data.type == ROBOT_TYPE_WALL) || (rx_data.type&ROBOT_MOVEABLE_FLAG) )
                visualisation_update(rx_data);

			robot_idx++;     //request next robot number
            // usleep(robot.dt*1000);
		}
		else 
		{
			//receiving error or no more data
			robot_idx = 0;
            usleep(robot.dt*1000);
		}
	}
}