#include "app_core.h"


#define TOOL_NULL		(u32)0
#define TOOL_DELETE		(u32)1
#define TOOL_WALL		(u32)2

#define TOOL_RED_ROBOT		(u32)3
#define TOOL_RED_TARGET		(u32)4
#define TOOL_RED_PATH		(u32)5

#define TOOL_GREEN_ROBOT	(u32)6
#define TOOL_GREEN_TARGET	(u32)7
#define TOOL_GREEN_PATH		(u32)8

#define TOOL_BLUE_ROBOT		(u32)9
#define TOOL_BLUE_TARGET	(u32)10
#define TOOL_BLUE_PATH		(u32)11

#define TOOL_PATH			(u32)12
#define TOOL_TARGET			(u32)13
#define TOOL_SOURCE			(u32)14
#define TOOL_DESTINATION	(u32)15

CAppCore::CAppCore()
{
	tool_id = TOOL_NULL;
	file_name = NULL;

	map = new CMap(0, 0, 34, 19, 55.0, 55.0);

	printf("core created\n");
}

CAppCore::~CAppCore()
{

}

void CAppCore::on_delete()
{
	tool_id = TOOL_DELETE;
}

void CAppCore::on_wall()
{
	tool_id = TOOL_WALL;
}

void CAppCore::on_red_robot()
{
	tool_id = TOOL_RED_ROBOT;	
}

void CAppCore::on_red_target()
{
	tool_id = TOOL_RED_TARGET;
}

void CAppCore::on_red_path()
{
	tool_id = TOOL_RED_PATH;
}

void CAppCore::on_green_robot()
{
	tool_id = TOOL_GREEN_ROBOT;
}

void CAppCore::on_green_target()
{
	tool_id = TOOL_GREEN_TARGET;
}

void CAppCore::on_green_path()
{
	tool_id = TOOL_GREEN_PATH;
}


void CAppCore::on_blue_robot()
{
	tool_id = TOOL_BLUE_ROBOT;
}

void CAppCore::on_blue_target()
{
	tool_id = TOOL_BLUE_TARGET;
}

void CAppCore::on_blue_path()
{
	tool_id = TOOL_BLUE_PATH;
}


void CAppCore::on_path()
{
	tool_id = TOOL_PATH;
}

void CAppCore::on_target()
{
	tool_id = TOOL_TARGET;
}

void CAppCore::on_source()
{
	tool_id = TOOL_SOURCE;
}

void CAppCore::on_destination()
{
	tool_id = TOOL_DESTINATION;
}

    
void CAppCore::on_new(char* file_name)
{
	this->file_name = NULL;

	if (file_name != NULL)
	{
		printf("new file name %s\n", file_name);
		this->file_name = file_name;

		map->init(0, 0, 34, 19, 55.0, 55.0);
		map->save(this->file_name);
	}
}

void CAppCore::on_open(char* file_name)
{
	if (file_name != NULL)
	{
		printf("open file name %s\n", file_name);
		this->file_name = file_name;

		map->init(0, 0, 34, 19, 55.0, 55.0);
		map->load(this->file_name);
	}
}

int CAppCore::on_save(char* file_name)
{
	if (file_name != NULL)
	{
		this->file_name = file_name;
		if (map->save(this->file_name) < 0)
			return -1;

		return 0;
	}

	return -1;
}

void CAppCore::on_save_as(char* file_name)
{
	if (file_name != NULL)
	{
		printf("save as file name %s\n", file_name);
		this->file_name = file_name;

		map->save(this->file_name);
	}
}


void CAppCore::on_click(int x, int y, float reward, int int_param, float float_param)
{ 
	printf("click %u [%i %i] ", tool_id, x, y);
	printf("parameters : %f %i %f\n", reward, int_param, float_param);
 
	struct sMapField field;

	field = map->get_at(x, y); 

	field.reward = reward;
	field.parameter_int = int_param;
	field.parameter_f = float_param;


	switch (tool_id)
	{
		case TOOL_DELETE: 
						field.type = MAP_FIELD_TYPE_EMPTY; 

						field.color[0] = COLOR_EMPTY_R;
						field.color[1] = COLOR_EMPTY_G;
						field.color[2] = COLOR_EMPTY_B;

						break;

		case TOOL_WALL: 
						field.type = MAP_FIELD_TYPE_WALL; 
						
						field.color[0] = COLOR_WALL_R;
						field.color[1] = COLOR_WALL_G;
						field.color[2] = COLOR_WALL_B;

						break;



		case TOOL_RED_ROBOT: 
						field.type = MAP_FIELD_TYPE_RED_ROBOT; 
						
						field.color[0] = COLOR_RED_ROBOT_R;
						field.color[1] = COLOR_RED_ROBOT_G;
						field.color[2] = COLOR_RED_ROBOT_B;

						break;

		case TOOL_RED_TARGET: 
						field.type = MAP_FIELD_TYPE_RED_TARGET; 
						
						field.color[0] = COLOR_RED_TARGET_R;
						field.color[1] = COLOR_RED_TARGET_G;
						field.color[2] = COLOR_RED_TARGET_B;

						break;


		case TOOL_RED_PATH: 
						field.type = MAP_FIELD_TYPE_RED_PATH; 
						
						field.color[0] = COLOR_RED_PATH_R;
						field.color[1] = COLOR_RED_PATH_G;
						field.color[2] = COLOR_RED_PATH_B;
			
						break;



		case TOOL_GREEN_ROBOT: 
						field.type = MAP_FIELD_TYPE_GREEN_ROBOT; 
						
						field.color[0] = COLOR_GREEN_ROBOT_R;
						field.color[1] = COLOR_GREEN_ROBOT_G;
						field.color[2] = COLOR_GREEN_ROBOT_B;

						break;

		case TOOL_GREEN_TARGET: 
						field.type = MAP_FIELD_TYPE_GREEN_TARGET; 
						
						field.color[0] = COLOR_GREEN_TARGET_R;
						field.color[1] = COLOR_GREEN_TARGET_G;
						field.color[2] = COLOR_GREEN_TARGET_B;

						break;


		case TOOL_GREEN_PATH: 
						field.type = MAP_FIELD_TYPE_GREEN_PATH; 
						
						field.color[0] = COLOR_GREEN_PATH_R;
						field.color[1] = COLOR_GREEN_PATH_G;
						field.color[2] = COLOR_GREEN_PATH_B;
			
						break;



		case TOOL_BLUE_ROBOT: 
						field.type = MAP_FIELD_TYPE_BLUE_ROBOT; 
						
						field.color[0] = COLOR_BLUE_ROBOT_R;
						field.color[1] = COLOR_BLUE_ROBOT_G;
						field.color[2] = COLOR_BLUE_ROBOT_B;

						break;

		case TOOL_BLUE_TARGET: 
						field.type = MAP_FIELD_TYPE_BLUE_TARGET; 
						
						field.color[0] = COLOR_BLUE_TARGET_R;
						field.color[1] = COLOR_BLUE_TARGET_G;
						field.color[2] = COLOR_BLUE_TARGET_B;

						break;


		case TOOL_BLUE_PATH: 
						field.type = MAP_FIELD_TYPE_BLUE_PATH; 
						
						field.color[0] = COLOR_BLUE_PATH_R;
						field.color[1] = COLOR_BLUE_PATH_G;
						field.color[2] = COLOR_BLUE_PATH_B;
			
						break;						





		case TOOL_PATH: 
						field.type = MAP_FIELD_TYPE_PATH; 
						
						field.color[0] = COLOR_PATH_R;
						field.color[1] = COLOR_PATH_G;
						field.color[2] = COLOR_PATH_B;

						break;

		case TOOL_TARGET: 
						field.type = MAP_FIELD_TYPE_TARGET; 
						
						field.color[0] = COLOR_TARGET_R;
						field.color[1] = COLOR_TARGET_G;
						field.color[2] = COLOR_TARGET_B;

						break;


		case TOOL_SOURCE: 
						field.type = MAP_FIELD_TYPE_SOURCE; 
						
						field.color[0] = COLOR_SOURCE_R;
						field.color[1] = COLOR_SOURCE_G;
						field.color[2] = COLOR_SOURCE_B;

						break;

		case TOOL_DESTINATION: 
						field.type = MAP_FIELD_TYPE_DESTINATION; 
						
						field.color[0] = COLOR_DESTINATION_R;
						field.color[1] = COLOR_DESTINATION_G;
						field.color[2] = COLOR_DESTINATION_B;

						break;						

							
	}

	map->set_at(x, y, field);
}


void CAppCore::on_paint()
{

} 

struct sMapField CAppCore::get_field(unsigned int x, unsigned int y)
{
	return map->get_at(x, y);
}


unsigned int CAppCore::get_width()
{
	return map->get_width();
}

unsigned int CAppCore::get_height()
{
	return map->get_height();
}