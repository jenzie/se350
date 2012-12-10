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
 * Implementation of the read_data module.
 *
 * See read_data.h for a description of the read_data function's
 * specification.
 *
 * Note that the parameter declarations in this module must be
 * compatible with those in the read_data.h header file.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "read_data.h"

void read_data(char input[]) {
	int i = 0, j = 0 ; /* index */
	char C ; /* local variable for the character */
	int I ; /* local variable for the integer */
	double D ; /* local variable for the double */
	char delimiter = '$'; /* delimiter to separate input values */

	/* check if the first char in input is followed by delimiter */
	if(strcmp(input[1], delimiter) == 0) {
		/* store first char */
		char C = input[i];
		i++;	j = i;
	}

	/* loop through input array until end delimiter is found */
	while(strcmp(input[j], delimiter) != 0)
		j++;

	I = atoi();

	return ;
}
