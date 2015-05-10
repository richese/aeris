#include "collective_brain.h"

CCollectiveBrain::CCollectiveBrain(u32 width, u32 height)
{
	u32 i, j;

	for (j = 0; j < height; j++)
	{
		std::vector<float> tmp;
		for (i = 0; i < width; i++)
			tmp.push_back(0.0);

		q.push_back(tmp);
	}
}

CCollectiveBrain::~CCollectiveBrain()
{
 
}

i32 CCollectiveBrain::load_from_file(char *file_name)
{
	FILE *f;
	u32 read_res;

	f = fopen(file_name, "r");

	if (f == NULL)
		return -1;

	u32 magic = 0;
	u32 width = 0;
	u32 height = 0;
	
	read_res = fread(&magic, sizeof(magic),  1, f);

	if (magic != COLLECTIVE_BRAIN_MAGIC)
		return -2;

	q_mutex.lock();

	read_res = fread(&width, sizeof(width),  1, f);
	read_res = fread(&height, sizeof(height),  1, f);

	u32 i, j;

	for (j = 0; j < q.size(); j++)
		q[j].clear();

	q.clear();

	for (j = 0; j < height; j++)
	{
		std::vector<float> tmp;
		for (i = 0; i < width; i++)
		{
			float v = 0.0;
			read_res = fread(&v, sizeof(v),  1, f);
			tmp.push_back(v);
		}

		q.push_back(tmp);
	}

	q_mutex.unlock();

	if (read_res != 0)
		return 0;

	return -3;
}

i32 CCollectiveBrain::save_to_file(char *file_name)
{
	FILE *f;
	u32 write_res;

	f = fopen(file_name, "w");

	if (f == NULL)
		return -1;

	u32 magic = COLLECTIVE_BRAIN_MAGIC;
	u32 width = q[0].size();
	u32 height = q.size();

	write_res = fwrite(&magic, sizeof(magic),  1, f);
	write_res = fwrite(&width, sizeof(width),  1, f);
	write_res = fwrite(&height, sizeof(height),  1, f);

	u32 i, j;

	q_mutex.lock();
	for (j = 0; j < height; j++)
	{
		std::vector<float> tmp;
		for (i = 0; i < width; i++)
		{
			float v = q[j][i];
			write_res = fwrite(&v, sizeof(v),  1, f);
			tmp.push_back(v);
		}

		q.push_back(tmp);
	}
	q_mutex.unlock();

	if (write_res != 0)
		return 0;

	return -2;
}

u32 CCollectiveBrain::get_height()
{
	return q.size();
}

u32 CCollectiveBrain::get_width()
{
	return q[0].size();
}



float CCollectiveBrain::get_output(u32 x, u32 y)
{
	q_mutex.lock();
	float res = q[y][x];
	q_mutex.unlock();

	return res;
}

void CCollectiveBrain::set_value(u32 x, u32 y, float value)
{
	q_mutex.lock();
	q[y][x] = value;
	q_mutex.unlock();
}


void CCollectiveBrain::merge_max(u32 x, u32 y, float value)
{
	q_mutex.lock();
	q[y][x] = max(q[y][x], value);
	q_mutex.unlock();
}

void CCollectiveBrain::merge_min(u32 x, u32 y, float value)
{
	q_mutex.lock();
	q[y][x] = min(q[y][x], value);
	q_mutex.unlock();
}

void CCollectiveBrain::merge_average(u32 x, u32 y, float value, float weight)
{
	if (weight < 0.0)
		weight = 0.0;

	if (weight > 1.0)
		weight = 1.0;

	q_mutex.lock();
	q[y][x] = weight*q[y][x] + (1.0 - weight)*value;
	q_mutex.unlock();
}







std::vector<float> CCollectiveBrain::get_output_row(u32 row)
{
	return q[row];
}
	
void CCollectiveBrain::set_value_row(std::vector<float> q, u32 row)
{
	u32 i;
	for (i = 0; i < this->q[row].size(); i++)
		this->q[row][i] = q[i];
}

void CCollectiveBrain::merge_max_row(std::vector<float> q, u32 row)
{
	u32 i;
	for (i = 0; i < this->q[row].size(); i++)
		merge_max(i, row, q[i]);
}

void CCollectiveBrain::merge_min_row(std::vector<float> q, u32 row)
{
	u32 i;
	for (i = 0; i < this->q[row].size(); i++)
		merge_min(i, row, q[i]);
}

void CCollectiveBrain::merge_average_row(std::vector<float> q, float weight, u32 row)
{
	u32 i;
	for (i = 0; i < this->q[row].size(); i++)
		merge_average(i, row, q[i], weight);
}

std::vector<std::vector<float>> CCollectiveBrain::get_output_all()
{
	return q;
}



void CCollectiveBrain::set_value_all(std::vector<std::vector<float>> q)
{
	u32 i, j;
	for (j = 0; j < this->q.size(); j++)
		for (i = 0; i < this->q[j].size(); i++)
			set_value(i, j, q[j][i]);	
}

void CCollectiveBrain::merge_max_all(std::vector<std::vector<float>> q)
{
	u32 i, j;
	for (j = 0; j < this->q.size(); j++)
		for (i = 0; i < this->q[j].size(); i++)
			merge_max(i, j, q[j][i]);	
}

void CCollectiveBrain::merge_min_all(std::vector<std::vector<float>> q)
{
	u32 i, j;
	for (j = 0; j < this->q.size(); j++)
		for (i = 0; i < this->q[j].size(); i++)
			merge_min(i, j, q[j][i]);	
}

void CCollectiveBrain::merge_average_all(std::vector<std::vector<float>> q, float weight)
{
	u32 i, j;
	for (j = 0; j < this->q.size(); j++)
		for (i = 0; i < this->q[j].size(); i++)
			merge_average(i, j, q[j][i], weight);		
}