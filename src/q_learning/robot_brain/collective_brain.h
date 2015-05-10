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
		u32 get_height();
		u32 get_width();

		float get_output(u32 x, u32 y);
		void set_value(u32 x, u32 y, float value);

		void merge_max(u32 x, u32 y, float value);
		void merge_min(u32 x, u32 y, float value);
		void merge_average(u32 x, u32 y, float value, float weight);

		std::vector<float> get_output_row(u32 row);
		void set_value_row(std::vector<float> q, u32 row);

		void merge_max_row(std::vector<float> q, u32 row);
		void merge_min_row(std::vector<float> q, u32 row);
		void merge_average_row(std::vector<float> q, float weight, u32 row);

		std::vector<std::vector<float>> get_output_all();
		void set_value_all(std::vector<std::vector<float>> q);

		void merge_max_all(std::vector<std::vector<float>> q);
		void merge_min_all(std::vector<std::vector<float>> q);
		void merge_average_all(std::vector<std::vector<float>> q, float weight);
};

#endif