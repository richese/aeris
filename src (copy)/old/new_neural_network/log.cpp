#include "log.h"

CLog::CLog(char *file_name, char *experiment_contition_file_name, u32 axis_count)
{	
	this->file_name = file_name; 
	file = fopen(file_name, "w");
	fclose(file);


	if (experiment_contition_file_name != NULL)
	{
		this->experiment_contition_file_name = experiment_contition_file_name; 
		condition_file = fopen(experiment_contition_file_name, "w");
		fclose(condition_file);		
	}

	u32 i;

	std::vector<float> log_line;

	for (i = 0; i < axis_count; i++)
		log_data.push_back(log_line);
}

CLog::~CLog()
{

}

void CLog::add(u32 axis, float value)
{
	log_data[axis].push_back(value);
}

void CLog::save()
{
	file = fopen(file_name, "w");

	u32 i, j;
	for (j = 0; j < log_data[0].size(); j++)
	{
		for (i = 0; i < log_data.size(); i++)
			fprintf(file, "%f ", log_data[i][j]);
		fprintf(file, "\n");
	}
	
	fclose(file);	


	condition_file = fopen(experiment_contition_file_name, "w");

	for (j = 0; j < condition_data.size(); j++)
	{
		fprintf(condition_file, "%s", condition_data[j].data());
		fprintf(condition_file, "\n");
	}
	
	fclose(condition_file);	
}


void CLog::add_condition(char *text)
{
	condition_data.push_back(text);
}