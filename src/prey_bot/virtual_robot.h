#ifndef _VIRTUAL_ROBOT_H_
#define _VIRTUAL_ROBOT_H_

#include "../common/common.h"


class CVirtualRobot
{
  private:

    float dx;
    float dy;
    float dz;
    float dyaw;

    float dx_tmp, dy_tmp;

    class CClient *client;

    struct sAgentInterface agent_interface;

    class CKohonenLayer *knn;

  public:
    CVirtualRobot(class CKohonenLayer *knn = NULL);
    ~CVirtualRobot();

    void process();
};


#endif
