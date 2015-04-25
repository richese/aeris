#ifndef _Q_LEARNING_H_
#define _Q_LEARNING_H_

#include "action.h"
#include "../neural_network/neural_network_kohonen.h"

class CQLearning
{
	private:
		class CAction *actions;


		std::vector<std::vector<float>> q;

		u32 action_id;
		u32 state, state_prev, action_id_prev;

		float reward, reward_prev;
		float gamma, alpha;

	public:
		CQLearning(class CAction *actions, float gamma = 0.9, float alpha = 0.0);
		~CQLearning(); 


		void process(u32 state, float reward);

		struct sAction get_output();
		u32 get_output_id();
		

		std::vector<std::vector<float>> get_q();
		void merge_q(std::vector<std::vector<float>> q);


	private:
		u32 select_action(float k = 2.0);
		void normalise();
};


#endif
