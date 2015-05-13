#ifndef _Q_LEARNING_H_
#define _Q_LEARNING_H_

#include "action.h"


class CQLearning
{
	private:
		class CAssociativeArray *associative_array;
		std::vector<std::vector<float>> q;
				

		u32 action_id;
		u32 state_idx, state_prev_idx, action_id_prev;

		u32 state_dimensions;

		float states_density;

		float reward, reward_prev;
		float gamma, alpha;
		

		std::vector<float> state;

	public:
		CQLearning(	float states_density,
					u32 state_dimensions,
					u32 actions_per_state, 
					float gamma = 0.9, float alpha = 0.0);

		~CQLearning(); 

		void process(std::vector<float> state, float reward, float k = 2.0, float explore_prob = 0.0);

		u32 get_states_count();

		u32 get_state_idx();
		u32 get_output_id();
		
		float get_max_q(std::vector<float> state);

		std::vector<std::vector<float>> get_q();
		float get_q(u32 state_id, u32 action_id);

		void set_q(u32 state_id, u32 action_id, float value);
		void merge(CQLearning *q_learning);

	private:
		u32 select_action(float k = 2.0, float explore_prob = 0.0);
		void normalise();
};

#endif