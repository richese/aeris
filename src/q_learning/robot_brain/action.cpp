#include "action.h"

CAction::CAction(u32 states_count, u32 actions_per_state, u32 action_width)
{
	u32 k, j, i;

	for (k = 0; k < states_count; k++)
	{
		//actions in one state
		std::vector<struct sAction> actions_tmp;

		//actions initialziation
		for (j = 0; j < actions_per_state; j++)
		{
			struct sAction action;

			for (i = 0; i < action_width; i++)
				action.action.push_back(0.0);

			for (i = 0; i < action_width; i++)
			{
				float v = 0.0;

				if ((j%2) == 0)
					v = 1.0; 
				else
					v = -1.0;

				if ((j/2) != i)
					v = 0.0;

				// v = rnd();
				action.action[i] = v;
			}

			
			action.fitness = ACTION_FITNESS_MIN;
			actions_tmp.push_back(action);
		}

		actions.push_back(actions_tmp);
	}
}

CAction::~CAction()
{

}

struct sAction CAction::get(u32 state, u32 id)
{
	return actions[state][id];
} 

void CAction::set(u32 state, u32 id, struct sAction action, float weight)
{
	u32 i;

	for (i = 0; i < actions[state][id].action.size(); i++)
	{
		float res = actions[state][id].action[i]*(1.0 - weight) + action.action[i]*weight;
		actions[state][id].action[i] = res;
	}
}

void CAction::set_fitness(u32 state, u32 id, float fitness)
{
	actions[state][id].fitness = fitness;
}

u32 CAction::get_states_count()
{
	return actions.size();
}

u32 CAction::get_actions_per_state()
{
	return actions[0].size();
}