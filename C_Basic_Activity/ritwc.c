/**
author: Jenny Zhen
date: 11.28.12
language: C
assignment: Word Count
	Returns the number of lines, words, and characters in a file.
	Run using "ritwc < filename.txt"
	http://www.se.rit.edu/~se350/Class_Activities/01_SimpleC/WordCount/WordCount.html
*/

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#define FALSE (0)
#define TRUE  (1)

int main() {
	int tot_chars = 0 ;	/* total characters */
	int tot_lines = 0 ;	/* total lines */
	int tot_words = 0 ;	/* total words */
	int nchar ; /* next character read */
	int wasSpace = 0; /* was last character a whitespace? */

	/** assign getchar() to nchar, loop until end of file */
	while((nchar = getchar()) != EOF) {
		/** if character is a whitespace (space, newline, tab) */
		if(isspace(nchar)) {
			/** check if it is a newline character */
			if(nchar == '\n')
				++tot_lines;
			/** check if previous character was a space */
			if(!wasSpace)
				++tot_words;
			/** flag to indicate this character was a space */
			wasSpace = 1;
		/** remove the flag since this character is not a space */
		} else
			wasSpace = 0;
		/** increment number of characters no matter what */
		++tot_chars;
	}

	/** print results as number of lines, words, and characters */
	printf("%d %d %d\n",tot_lines, tot_words, tot_chars);

	return 0 ;
}
