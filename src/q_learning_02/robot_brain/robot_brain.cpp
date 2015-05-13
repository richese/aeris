#include "robot_brain.h"

/*
	private:
		struct sRobot robot;
		class CRobot *collective_robot;


		class CAction *actions;
		class CQLearning *q_learning;

		u32 action_id;

	public:
		CRobotBrain(struct sRobot robot, class CRobot *collective_robot = NULL);
		~CRobotBrain();

		struct sRobot get();
		void process(struct sRobot *robot);		
		void merge();

		CQLearning* get_brain();
*/

CRobotBrain::CRobotBrain(
							struct sRobot robot_init, 
							class CRobotBrain *collective_robot
						)
{
	this->robot = robot_init;
	this->collective_robot = collective_robot;


	u32 actions_per_state = ROBOT_SPACE_DIMENSION*2;

	u32 j, i;

	float alpha = 0.7;
	float gamma = 0.9;
	
	float states_density = 1.0/16.0;
	std::vector<float> state_range_min, state_range_max;

	std::vector<std::vector<float>> action_init;

	for (j = 0; j < ROBOT_SPACE_DIMENSION; j++)
	{
		state_range_min.push_back(0.0);
		state_range_max.push_back(robot_init.position_max[j]);
	}


	for (j = 0; j < actions_per_state; j++)
	{
		std::vector<float> tmp;
		for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		{
			tmp.push_back(0.0);


			if ( i == (j/2) )
			{
				if ((j%2) == 0)
					tmp[i] = 1.0;
				else
					tmp[i] = -1.0;
			}
		}

		action_init.push_back(tmp);	
	}

	actions = new CAction(1, action_init.size(), action_init[0].size(), &action_init);
	action_id = 0;


	q_learning = new CQLearning(
									state_range_min, 
									state_range_max, 
									states_density, 
									actions_per_state, 
									gamma, alpha
								);

}


CRobotBrain::~CRobotBrain()
{
	if (actions != NULL)
	{
		delete actions;
		actions = NULL;
	}

	if (q_learning != NULL)
	{
		delete q_learning;
		q_learning = NULL;
	}
}

struct sRobot CRobotBrain::get()
{
	return robot;
}

void CRobotBrain::process(struct sRobot *robot_)
{
	robot = *robot_;

	std::vector<float> state_vect;

	u32 i;
	for (i = 0; i < ROBOT_SENSORS_COUNT; i++)
		state_vect.push_back(0.0);

	state_vect[0]  = robot.sensors[ROBOT_SENSOR_POSITION_0_IDX];
	state_vect[1]  = robot.sensors[ROBOT_SENSOR_POSITION_1_IDX];
	

	q_learning->process(state_vect, robot.reward, 0.1);

	action_id =  q_learning->get_output_id();	

	action = actions->get(0, action_id);

	for (i = 0; i < action.action.size(); i++)
		robot.d[i] = action.action[i];

	*robot_ = robot;
} 

void CRobotBrain::merge()
{
	q_learning->merge(collective_robot->get_brain());
}

CQLearning* CRobotBrain::get_brain()
{
	return q_learning;
}


void CRobotBrain::print()
{
	u32 i;

	CLog *log_q_learing;

	log_q_learing = new CLog((char*)"q_map.txt", 5);

	float error_average = 0.0;
	float error_max = 0.0;
	float error_cnt = 0.0;

	std::vector<std::vector<float>> q;
	q = q_learning->get_q();

	float x, y;

	float step = 1.0/1.0;


	std::vector<float> state;
	std::vector<float> target_position;
	for (i = 0; i < ROBOT_SENSORS_COUNT; i++)
		state.push_back(0.0);
	

	for (i = 0; i < ROBOT_SPACE_DIMENSION; i++)
		target_position.push_back(robot.position_max[i]/2);

 
	for (y = 0; y < robot.position_max[1]; y+=step)
	{
		for (x = 0; x < robot.position_max[0]; x+=step)
		{
			state[ROBOT_SENSOR_POSITION_0_IDX] = x;
			state[ROBOT_SENSOR_POSITION_1_IDX] = y;	

			u32 state_idx = q_learning->get_state_index_in_table(state);

			float max_v = 0.0;
			for (i = 0; i < q[state_idx].size(); i++)
				if (q[state_idx][i] > max_v)
					max_v = q[state_idx][i];
			
			printf("%6.4f ", max_v); 

			log_q_learing->add(0, state[ROBOT_SENSOR_POSITION_0_IDX]);
			log_q_learing->add(1, state[ROBOT_SENSOR_POSITION_1_IDX]);
			log_q_learing->add(2, max_v);

			float dist = 0.0;
			for (i = 0; i < ROBOT_SENSORS_COUNT; i++)
				dist+= abs_(target_position[i] - state[i]);
			dist = pow(0.9, dist);

			float error = dist - max_v;

			log_q_learing->add(3, dist);
 
			log_q_learing->add(4, error);

			error_average+= abs_(error);

			if (abs_(error) > error_max)
				error_max = abs_(error);

			error_cnt++;
		}

		printf("\n");
	} 

	printf("\n");

	log_q_learing->save();

	printf("average error %f\n", error_average/error_cnt);
	printf("maximum error %f\n", error_max);	
}