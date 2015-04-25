#ifndef _CLIENT_H_
#define _CLIENT_H_

#include "common.h"

class CClient
{
	public:
		CClient();
		~CClient();

		i32 main(struct sRobot *rx_packet, struct sRobot *tx_packet);
};

#endif