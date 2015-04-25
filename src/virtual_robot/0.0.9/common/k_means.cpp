#include "k_means.h"

CKMeans::CKMeans(u32 centroids_count, u32 dimension, float speed)
{
	u32 j, i;

	for (j = 0; j < centroids_count; j++)
	{
		std::vector<float> tmp;
		for (i = 0; i < dimension; i++)
			tmp.push_back(rnd_());

		centroids.push_back(tmp);
	}

	this->speed = speed;
}

CKMeans::~CKMeans()
{

}

u32 CKMeans::process(std::vector<float> input)
{
	u32 i, j;
	u32 dist_min_idx = 0;
	float dist_min_value = input.size()*10.0;

	for (j = 0; j < centroids.size(); j++)
	{
		float dist = 0.0;

		for (i = 0; i < centroids[j].size(); i++)
			dist+= abs_(centroids[j][i] - input[i]);

		if (dist < dist_min_value)
		{
			dist_min_value = dist;
			dist_min_idx = j;
		}
	}

	j = dist_min_idx;
	for (i = 0; i < centroids[j].size(); i++)
		centroids[j][i] = (1.0 - speed)*centroids[j][i] + speed*input[i];

	return dist_min_idx;
}

std::vector<float> CKMeans::get_centroid(u32 centroid_idx)
{
	return centroids[centroid_idx];
}