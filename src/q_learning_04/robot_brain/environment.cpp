#include "environment.h"


float vect_dist(std::vector<float> *va, std::vector<float> *vb)
{
	float res = 0.0;
	u32 j;

	for (j = 0; j < va->size(); j++)
	{
		float tmp = (*va)[j] - (*vb)[j];
		res+= tmp*tmp;
	}

	return sqrt(res);
}

CEnvironment::CEnvironment(u32 agents_count)
{
 	u32 j;


 	u32 outputs_count = 2;
 	u32 inputs_count = 2;
 	u32 actions_per_state = 4;
 	
 	//float state_density = 1.0/9.0;
 	float state_density = 1.0/9.0;
 	//float state_density = 1.0/5.0;
 	
 	u32 id = 0;
 	u32 type = AGENT_TYPE_NULL;
 	s_agent_init(
				 	&agent_init,
				 	id, type,
					outputs_count, inputs_count,
					actions_per_state,
					state_density
				);


 	//this robot is for sharing solution
 	collective_agent = new CAgent(agent_init, NULL);

 	for (j = 0; j < agents_count; j++)
 	{
 		id++;
 		agent_init.id = id;
 		

 		agent_init.type = AGENT_TYPE_COMMON;

 		//agent_init.type = AGENT_TYPE_GREEDY;

 		//agent_init.type = AGENT_TYPE_EXPLORER;

 		/*
 		if ((j%8) == 0)
 			agent_init.type = AGENT_TYPE_EXPLORER;
 		else
 			agent_init.type = AGENT_TYPE_GREEDY;
		*/

 		class CAgent *agent;  		

 		respawn(&agent_init);

 		agent = new CAgent(agent_init, collective_agent);
 		agents.push_back(agent);

 		s_agents.push_back(agent_init);
 	}

 	printf("init done\n");
}

CEnvironment::~CEnvironment()
{
	u32 j;
	for (j = 0; j < agents.size(); j++)
		if (agents[j] != NULL)
		{
			delete agents[j];
			agents[j] = NULL;
		}

	if (collective_agent != NULL)
	{
		delete collective_agent;
		collective_agent = NULL;
	}

 	printf("uninit done\n");
}

void CEnvironment::process()
{
	u32 j, i;

	std::vector<float> target_position;

	for (i = 0; i < agent_init.inputs_count; i++) 
		target_position.push_back(0.0);
	

	for (j = 0; j < agents.size(); j++)
	{
		float target_min_dist = s_agents[j].state_density*0.01;

		float target_dist  = vect_dist(&target_position, &s_agents[j].state);
		float reward = 0.0;

		if (target_dist < target_min_dist)
			reward+= 1.0;
		
		//reward = 1.0 - target_dist;
		
		s_agents[j].reward = reward; 

		agents[j]->process(&s_agents[j]);

		// non zero reward -> some information found,
		// add this into collective brain
		if (reward != 0.0)
		{
			agents[j]->merge();

			//send this information to all robots
			for (i = 0; i < agents.size(); i++)
				agents[i]->merge();
		}
	
		if (target_dist < target_min_dist)
		{
			printf("robot %u on target, score %f\n", j, s_agents[j].score);

			s_agents[j].reward = 0.0; 

			respawn(&s_agents[j]);
		}
		else 
		{
			for (i = 0; i < s_agents[j].inputs_count; i++) 
			{
				float tmp = 0.0;
				
				tmp = 	s_agents[j].state[i] + 
						s_agents[j].output_action.action[i]*s_agents[j].state_density;
				
				if (tmp > 1.0)
					tmp = 1.0;

				if (tmp < -1.0)
					tmp = -1.0;

				s_agents[j].state[i] = tmp;
			}
		}
	}
}

void CEnvironment::print(std::vector<float> subspace)
{
	u32 i;
	//send this information to all robots
	for (i = 0; i < agents.size(); i++)
		agents[i]->merge();

 	collective_agent->print(subspace);
}
 
void CEnvironment::respawn(struct sAgent *agent)
{
	u32 i;
	for (i = 0; i < agent->inputs_count; i++)
		agent->state[i] = rnd_();

	agent->score = 0.0;
}