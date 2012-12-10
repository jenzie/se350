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
*/

/*
 * Interface to the read_data module.
 *
 * The read_data routine reads one line of data, consisting of three fields,
 * and returns the values in the fields via reference parameters.
 *
 * The format of the input line is:
 *
 * C$I$D$
 *
 * where
 *
 * 	C is a single character
 * 	I is a string of digits representing a decimal integer
 * 	D is a string of digits representing a double precision number.
 * 	$ is a literal dollar sign character.
 *
 * Example Lines
 *
 * x$1234$3.14159$
 * T$98754$6.023$
 *
 * All input lines may be assumed to be legal, and there are at most 25
 * characters in the strings for the integer and double precision number.
 *
 * The calling sequence has three arguments:
 * 	- a pointer to a char variable.
 * 	- a pointer to an int variable.
 * 	- a pointer to a double precision variable.
 *
 * The routine
 * 	1. Reads the three fields into local variables (using getchar()),
 * 	2. Converts the two numeric fields from ASCII strings to numbers:
 * 		a) Use atoi for the integer.
 * 		b) Use atod for the double.
 * 	3. Uses the parameter pointers to store the three values in variables
 * 	   declared in the caller, and
 * 	4. Returns.
 */

#ifndef READ_DATA_H
#define READ_DATA_H

extern void read_data(char input[]) ;

#endif
