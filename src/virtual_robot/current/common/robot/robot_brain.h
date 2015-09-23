/**
  @file   robot_brain.h
  @Author michal chovanec
  @date   April, 2015
  @brief  Main AI interface with robot
*/

#ifndef _ROBOT_BRAIN_H_
#define _ROBOT_BRAIN_H_

#include "../common.h"

#include "collective_brain.h"
#include "q_learning.h"

#include "pheromone_brain.h"

#include "robot_red_brain.h"
#include "robot_green_brain.h"
#include "robot_blue_brain.h"

#include "path_brain.h"



/**
 * @name    CRobotBrain
 * @brief   robot artificial intelligence main interface
 *
 * This API provides certain actions as an example.
 *
 * @param [in] repeat  Number of times to do nothing.
 *
 * @retval TRUE   Successfully did nothing.
 * @retval FALSE  Oops, did something.
 *
 * Example Usage:
 * @code
 	brain = CRobotBrain(struct sRobot robot, class CCollectiveBrain *collective_brain = NULL);
 	 ...
 	 while (run)
 	 {
		moves_update(&robot);
		sensors_update(&robot);

		brain->process(&robot);
 	 }
 * @endcode
 */
class CRobotBrain
{
	private:
		struct sRobot robot;
		class CCollectiveBrain *collective_brain;

		class CPheromoneBrain *pheromone_brain;

		class CRobotRedBrain *robot_red_brain;
		class CRobotGreenBrain *robot_green_brain;
		class CRobotBlueBrain *robot_blue_brain;


        class CPathBrain *path_brain;

	public:
		CRobotBrain(struct sRobot robot, class CCollectiveBrain *collective_brain = NULL);
		~CRobotBrain();

		void process(struct sRobot *robot);

		struct sRobot get();
	private:
		void red_robot_process();
		void green_robot_process();
		void blue_robot_process();
};


#endif
