#include <integ/levi_interp.hpp>

int main(int argc, char** argv)
{
	LeviInterpreter levi;

	
	levi.execute("function fibonacci(n)				             "
				"{												 "
				"    if (n <= 1) return n;						 "
				"    return fibonacci(n - 2) + fibonacci(n - 1); "
				"}                                               "
				"                                                "
				"print fibonacci(20);                            " );
	
}


//(void)*f(int)
/*
void  fibonaci(int) {
	
}

int main(int argc, char** argv)
{
	LeviInterpreter levi;
	LeviFunct levi.create_funct("fibonaci",'',);
	
	
		
	levi.execute("function sum(n)				             "
				"{												 "
				"   print fibonacci(20);      
					if (n <= 1) return n;						 "
				"    return fibonacci(n - 2) + fibonacci(n - 1); "
				"}                                               "
				"                                                "
				"print fibonacci(20);                            " 
	");
	
	levi.execute( "");
	
}
*/
