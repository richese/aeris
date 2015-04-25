#ifndef _Q_LEARNING_H_
#define _Q_LEARNING_H_

#include "action.h"

class CQLearning
{
	private:
		std::vector<std::vector<float>> q;

		u32 action_id;
		u32 state_idx, state_prev_idx, action_id_prev;

		std::vector<float> state_range_min, state_range_max, state;

		float states_density;

		float reward, reward_prev;
		float gamma, alpha;

	public:
		CQLearning(std::vector<float> state_range_min, std::vector<float> state_range_max, float states_density, u32 actions_per_state, float gamma = 0.9, float alpha = 0.0);
		~CQLearning(); 

		void process(std::vector<float> state, float reward, float explore_prob = 0.0);

		u32 get_states_count();

		struct sAction get_output();
		u32 get_state_idx();
		u32 get_output_id();
		
		std::vector<std::vector<float>> get_q();
		void merge_q(std::vector<std::vector<float>> q);

	private:
		u32 select_action(float k = 2.0, float explore_prob = 0.0);
		void normalise();
};

#endif