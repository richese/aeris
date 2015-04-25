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

	public:
		CRobotBrain(struct sRobot robot, class CCollectiveBrain *collective_brain = NULL);
		~CRobotBrain();

		void process(struct sRobot *robot);


	private:
		void red_robot_process();
		void green_robot_process();
		void blue_robot_process();
};


#endif