#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#define FALSE (0)
#define TRUE  (1)

#define NLETTERS (26)	/* size of array, one entry per letter */
#define MAXSTARS (70)	/* maximum number of stars in a histogram line */
#define A_VALUE  (65)   /* use to determine distance of char from capital 'A' */

int count[NLETTERS] ;	/* counts for each of the 26 letters */

/*
 * The declaration for the function to print a sequence of asterisks.
 */

extern void print_stars( int ns ) ;

int main() {
	int nchar ; /* next character read */
	int count = 0; /* count for current letter */
	int max_count = 0; /* highest frequency of letter */
	int i, j, k, m;

	/* assign getchar() to nchar, loop until end of file */
	while((nchar = getchar()) != EOF) {
		if(isalpha(nchar)) {
			toupper(nchar);
			count[nchar - A_VALUE] += 1;
		}
	}
	
	/* getting the highest count from all letters */
	for(i = 0; i < NLETTERS; i++) {
		if(count[i] > max_count)
			max_count = count[i];
	}

	/* scaling the count */
	int j;
	for(j = 0; j < NLETTERS; j++) {
		count = count[j];
		count[j] = (MAXSTARS * count) / count;
	}

	/* print the stars for the histogram */
	for(k = 0; k < NLETTERS; k++) {
		/* print out the letter value */
		printf("%c", (A_VALUE + k));
		print_stars( count[k] );
		printf("\n");
	}
	return 0 ;
}

/*
 * Print out 'ns' stars (asterisks)
 */

void print_stars( int ns ) {
	int m;

	/* print out the asterisks */
	for(m = 0; m < ns; m++)
		printf("%c", 42);

	return ;
}
