#ifndef _COLLECTIVE_BRAIN_H_
#define _COLLECTIVE_BRAIN_H_

#include "../common.h"

#define COLLECTIVE_BRAIN_MAGIC 	(u32)0xFFAB2358



class CCollectiveBrain
{
	private:

		std::mutex q_mutex;

		std::vector<std::vector<float>> q;

	public:
		CCollectiveBrain(u32 width, u32 height);
		~CCollectiveBrain();

		i32 load_from_file(char *file_name);
		i32 save_to_file(char *file_name);


		float get_output(u32 x, u32 y);

		void set_value(u32 x, u32 y, float value);

		void merge_max(u32 x, u32 y, float value);
		void merge_min(u32 x, u32 y, float value);
		void merge_average(u32 x, u32 y, float value, float weight);
};

#endif