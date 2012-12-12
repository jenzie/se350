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

#define MAXINPUT (100) /* maximum number of input characters */

/* char *input is a C string*/
void read_data(char *C, int *I, double *D) {
	int i = 0, c = 0 ; /* indices for input array and temp array */
	char delimiter = '$'; /* delimiter to separate input values */
	int nchar ; /* next character read */
	char input[MAXINPUT + 1] ; /* array of characters representing the input */
	char temp1[MAXINPUT + 1], temp2[MAXINPUT + 1]; /* temporary array of characters to convert */

	/* store input in char array */
	while((nchar = getchar()) != EOF) {
		input[i] = nchar ;
		i++;
	}
	
	/* check if the first char in input is followed by delimiter */
	i = 1;
	if(input[i] == delimiter) {
		/* store first char */
		*C = input[i - 1];
		i++;
	}

	/* loop through input array until end delimiter is found */
	while(input[i] != delimiter) {
		temp1[c] = input[i];
		i++;	c++;
	}
	*I = atoi(temp1); /* found integer */
	i++;	c = 0;
	
	/* loop through input array until end delimiter is found */
	while(input[i] != delimiter) {
		temp2[c] = input[i];
		i++;	c++;
	}
	*D = atof(temp2); /* found double */
}
