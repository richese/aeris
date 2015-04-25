#ifndef _SERVER_H_
#define _SERVER_H_

#include "common.h"

#include "robot/s_robot.h"

#define VISUALISATION_IN_SERVER 	1

#define ROBOTS_IN_SERVER 			1


#ifdef ROBOTS_IN_SERVER
#ifndef VISUALISATION_IN_SERVER
	#define VISUALISATION_IN_SERVER 	1
#endif
#endif


class CServer
{
	private:
		std::vector<struct sRobot> robots;

		#ifdef ROBOTS_IN_SERVER
		std::vector<class CRobotBrain*> c_robots;
		#endif
		
		int server_listen_fd;
		u64 server_id;

		double time, time_refresh, print_time;
		float dt, position_max[ROBOT_SPACE_DIMENSION], colision_distance;

		std::thread *printing_thread;

		class CMap *map;
		std::vector<class CCollectiveBrain*> collective_brain;

	public:
		CServer();
		~CServer();

		i32 main();
		void print();

	private:
		void process_data(struct sRobot *rx_data, struct sRobot *tx_data);
		void respawn(struct sRobot *robot);


		i32 main_local();
		i32 main_remote();
		void robots_refresh();

		void init_robots(u32 robots_count);

		void update_position(u32 robot_idx);
		void update_sensors(u32 robot_idx);

};

#endif