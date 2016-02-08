#include "path_brain.h"


CPathBrain::CPathBrain(struct sRobot robot, class CCollectiveBrain *collective_brain)
{
    path_level = 1.0;

    if (path_level > 1.0)
    	path_level = 1.0;
}

CPathBrain::~CPathBrain()
{

}

void CPathBrain::process(struct sRobot *robot_)
{
    float alpha = robot_->dt/(robot_->dt + 10000.0);
	path_level = path_level*(1.0 - alpha);

    if (path_level > 1.0)
		path_level = 1.0;

	robot_->parameter_f = path_level;

	if (path_level < 0.1)
		robot_->request = REQUEST_ROBOT_DELETE;
}
