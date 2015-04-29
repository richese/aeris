#ifndef _K_MEANS_H_
#define _K_MEANS_H_

#include "common.h"


class CKMeans
{
	private:
			float speed;
			std::vector<std::vector<float>> centroids;
	public:
			CKMeans(u32 centroids_count, u32 dimension, float speed = 0.01);
			~CKMeans();

			u32 process(std::vector<float> input);

			std::vector<float> get_centroid(u32 centroid_idx);
};


#endif