/**
author: Jenny Zhen
date: 11.28.12
language: C
assignment: Word Count
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

	while((nchar = getchar()) != EOF) {
		if(isspace(nchar)) {
			if(nchar == '\n')
				++tot_lines;
			if(!wasSpace)
				++tot_words;
			wasSpace = 1;
		} else
			wasSpace = 0;
		if(ispunct(nchar) && wasSpace)
			--tot_words;
		++tot_chars;
	}

	printf("%d %d %d\n",tot_lines, tot_words, tot_chars);

	return 0 ;
}
