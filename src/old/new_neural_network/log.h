#ifndef _LOG_H_
#define _LOG_H_

#include <string>
#include "common.h"


class CLog
{
	private:
		FILE *file, *condition_file;
		char *file_name, *experiment_contition_file_name;

		std::vector<std::vector<float>> log_data;
		std::vector<std::string> condition_data;
	public:
		CLog(char *file_name, char *experiment_contition_file_name, u32 axis_count);
		~CLog(); 

		void add(u32 axis, float value);
		void add_condition(char *text);
		void save();
};

#endif