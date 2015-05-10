#ifndef _ROBOT_H_
#define _ROBOT_H_

#include "../common.h"


#include "q_learning.h"

// #include "q_learning_nn.h"


// #define Q_LEARNING_NEURAL_NETWORK 1



struct sRobotInitStruct
{
	u32 inputs_count;			//sensor inputs
	u32 outputs_count;			//actuators outputs
	
	u32 actions_per_state;		//count of actions which can be performed in state	

	u32 states_count;			//count of all states, yeah, this may be huge
	u32 type;

	u32 path_max_length;

	std::vector<float> position_max;
};


class CRobot
{
	private:
		std::vector<float> output, input, position;
		std::vector<std::vector<float>> path;

		struct sRobotInitStruct robot_init;

		class CAction *actions;

		#ifdef Q_LEARNING_NEURAL_NETWORK
		class CQlearningNN *q_learning;
		#else 
		class CQLearning *q_learning;
		#endif

		//learning parameters
		float gamma, alpha;
		float reward;

		u32 state, action_id;

		class CRobot *collective_robot;

	public:
		CRobot(struct sRobotInitStruct robot_init,
			   std::vector<float> *initial_position = NULL, 
			   	class CRobot *collective_robot = NULL);
		
		~CRobot();


		void set_input(std::vector<float> input);
		void set_position(std::vector<float> position);

		void set_reward(float reward = 0.0);

		
		struct sAction get_output_action();

		std::vector<float> get_output();
		u32 get_output_action_id();
		u32 get_output_action_fitness();

		std::vector<float> get_position();
		std::vector<float> get_path(u32 idx);
	
		u32 get_state();
		u32 get_type();

		void reset();

		void process(float reward = 0.0);

		void print();

		void merge();


		#ifdef Q_LEARNING_NEURAL_NETWORK
		CQLearningNN* get_brain();
		#else 
		CQLearning* get_brain();
		#endif
};

#endif
