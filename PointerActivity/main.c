/**
author: Jenny Zhen
date: 12.10.12
language: C
assignment: CPointers
	C pointer activity to pass variables by pointers.
	http://www.se.rit.edu/~se350/Class_Activities/05_Pointers/C%20Pointer%20Activity.html

	Input format:
	C$I$D$

	where
		C is a single character.
		I is a string of characters representing a legal decimal integer.
		D is a string of characters reprsenting a double precision number.
		$ is the literal dollar sign character; delimiter.

	Example
	W$1349$1.414$
	
	To Run:
	make
	make run
	W$1349$1.414$
	Ctrl + D
*/

/*
 * Driver program for the activity.
 * 	1. Declares local variables for the character, integer, and
 * 	   double precision values returned by read_data.
 * 	2. Calls read_data with pointers to the variables so that
 * 	   the values read can be returned.
 * 	3. On return, prints the character, integer, and double
 * 	   precision number using the following format string for
 * 	   printf:
 * 	   	"Character %c Integer %d Floating point %.4f\n"
 * 	   Note: you must also, of course, provide the values to
 * 	   be printed.
 *      4. Return a 0 to the operating system.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "read_data.h"

int main() {
	char C ; /* pointer for the character */
	int I ; /* pointer for the integer */
	double D ; /* pointer for the double */
	
	/* read the input and get address to associated values */
	read_data(&C, &I, &D);

	/* print out associated values retrieved from read_data() */
	printf("\nc: %c\ni: %d\nd: %g\n", C, I, D);

	return 0 ;
}
