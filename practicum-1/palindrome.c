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
 * Check the provided line for a palindrome using advance() to 
 * move the left index from start of line and retreat() to move
 * the right index from the end of the line.
 * Returns 0 if not a palindrome, 1 if a valid palindrome
 */

int is_palindrome(char line[]) {
	int left = 0, right = strlen(line) - 1;

	// find intitial left and right indices of valid letters
	fprintf(stderr,"\nleft: %c right: %c\n", line[left], line[right]);
	right = retreat( right, line );
	left = advance( left, right, line );
	fprintf(stderr,"left: %c right: %c\n", line[left], line[right]);

	while( tolower(line[ left ]) == tolower(line[ right ]) ) {
		fprintf(stderr,"left: %d %c right: %d %c\n", left, line[left], right, line[right]);
		if( left != right && left + 1 != right ) {
			fprintf(stderr, "adv/ret\n");
			left++; // advance before checking if it's an alpha
			right--;  // retreat before checking if it's an alpha
			left = advance( left, right, line );
			right = retreat( right, line );
		}
		// midpoint cases
		else if( left == right ) {
			fprintf(stderr, "left=right\n");
			return line[ left ] == line [ right ];
		}
		else if( left +1 == right ) {
			fprintf(stderr, "left+1 = right\n");
			return line[ left ] == line [ right ];
		}
	}
	
	return 0 ;    /* not a palindrome */
}

/*
 * Advance the left index until either (a) we find a letter or (b) we hit
 * the right end. Return the final index.
 */

int advance(int pos, int end, char line[]) {
	
	
	while( !isalpha( line[pos] ) && pos < end )
		pos++;

	return pos ;
}

/*
 * Retreat the right index until (a) we find a letter or (b) we hit the left
 * end.
 */

int retreat(int pos, char line[]) {

	while( !isalpha( line[pos] ) && pos > 0 )
		pos--;

	return pos ;
}