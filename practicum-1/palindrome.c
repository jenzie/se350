/**
author: Jenny Zhen
date: 11.28.12
language: C
assignment: Palindrome (Practicum 01)
	https://mycourses.rit.edu/d2l/lms/content/viewer/view.d2l?tId=2342067&ou=422264
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAXLINE (80)

static int is_palindrome( char line[]);
static int advance(int pos, int end, char line[]) ;
static int retreat(int pos, char line[]) ;


/*
 * Driver main program for the palindrome program.
 * Read one line at a time from system input and 
 * calls is_palindrome function to determine if the 
 * line is a palindrome. Prints the line number and 
 * line contents if it is a palidrome, otherwise
 * nothing is printed. Program exits when end of
 * file is detected.
 */

/* DO NOT MODIFY THE MAIN FUNCTION */

int main() {
	char *line;
 	int nbytes = MAXLINE;
	int line_number = 0 ;

	line = (char *)malloc(nbytes+1);	/* same as: char line[MAXLINE+1] */

	for ( line_number = 1 ; getline(&line, &nbytes, stdin) != EOF ; line_number++ ) {
		if ( is_palindrome(line) ) 
			printf( "%d: %s\n", line_number, line) ;
		
	}
	return 0 ;
}


/*
 * Check the provided line for a palindrome using adavnce() to 
 * move the left index from start of line and retreat() to move
 * the right index from the end of the line.
 * Returns 0 if not a palindrome, 1 if a valid palindrome
 */

int is_palindrome(char line[]) {

	/* YOUR CODE GOES HERE */

	return 0 ;    /* not a palindrome */
}

/*
 * Advance the left index until either (a) we find a letter or (b) we hit
 * the right end. Return the final index.
 */

int advance(int pos, int end, char line[]) {
	
	/* YOUR CODE GOES HERE */

	return pos ;
}

/*
 * Retreat the right index until (a) we find a letter or (b) we hit the left
 * end.
 */

int retreat(int pos, char line[]) {

	/* YOUR CODE GOES HERE */

	return pos ;
}
