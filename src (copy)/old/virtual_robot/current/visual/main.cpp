#include "visualisation.h"


void visualisation_main()
{
	class CVisualisation *visualisation;

	visualisation = new CVisualisation();

	while (getch() != 27)
	{
		visualisation->main();
	}
	
	delete visualisation;
}

int main()
{
	visualisation_main();
	return 0;
}