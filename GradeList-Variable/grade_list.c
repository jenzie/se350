/**
author: Jenny Zhen
date: 12.13.12
language: C
assignment: GradeList-Variable
	Computes the average and median for a list of grades, using a dynamic array.
	http://www.se.rit.edu/~se350/Class_Activities/05_Pointers/DynamicGrades/GradeList.html
*/

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define MAXNAME (20)
#define MAXGRADES (100)

/* function definitions */
static void print_grades() ;
static void sort_by_name() ;
static void sort_by_grade() ;

/* list of grade entries */
struct grade_entry {
    char *name ;
    int grade ;
} ;

struct grade_entry grade_list[MAXGRADES] ; /* declaration the list of structs */
int numgrades = 0 ; /* number of grades stored */

/* runs the program */
int main(int argc, char ** argv) {
	char i_name[MAXNAME + 1] ; /* name of current entry in file */
	int i_grade ;	/* grade of current entry in file */
	int i; /* counter */
	
	/* file i/o to read in file for grades */
	FILE *inputF ;
	char *mode = "r" ;
	
	/* store the file handle */
	inputF = fopen(argv[1], mode) ;

	/* if cannot read file */
	if(inputF == NULL) {
		fprintf(stderr, "Invalid input file.") ;
		exit(1) ;
	}

	/* pass in the address of "grade" */
	while(fscanf(inputF, "%s %d", i_name, &i_grade) != EOF) {
		i_name[0] = toupper(i_name[0]) ;
		struct grade_entry entry ;
		entry.name = calloc( strlen( i_name ) + 1, sizeof( char ) ) ;
		strncpy(entry.name, i_name, strlen( i_name ) ) ;
		entry.grade = i_grade ;
		grade_list[numgrades] = entry ;
		numgrades++ ;
	}

	printf("\nUnsorted data: \n");
	print_grades();
	
	printf("\nSort by name: \n");
	sort_by_name();
	print_grades();
		
	printf("\nSort by grade: \n");
	sort_by_grade();
	print_grades();
	
	printf("\nMean: %d\n", calcMean(grade_list, numgrades));
	printf("Median: %d\n", calcMedian(grade_list, numgrades));
	
	return 0;
}

/* loops through list of grades and prints the name and grade */
static void print_grades() {
	int i; /* counter */
	for(i = 0; i < numgrades; i++)
		printf("%s %d\n", grade_list[i].name, grade_list[i].grade);
}

/* sorts the list by name lexicographically using bubble sort */
static void sort_by_name() {
	int i, j; /* counter */
	char *temp_name ; /* name of temporary entry in file */
	int temp_grade ;	/* grade of temporary entry in file */
	
	// insertion sort
	for( i = 0; i < numgrades; i++ ) {
		temp_name = grade_list[i].name ;
		temp_grade = grade_list[i].grade ;
		
		for( j = i - 1; j >= 0; j-- ) {
			if( strcmp( grade_list[j].name, temp_name ) < 0 ) break ;
			grade_list[j+1].name = grade_list[j].name ;
			grade_list[j+1].grade = grade_list[j].grade ;
		}
		grade_list[j+1].name = temp_name ;
		grade_list[j+1].grade = temp_grade ;
	}
}

/* sorts the list by grade, in increasing order, using bubble sort */
static void sort_by_grade() {
	int i, j; /* counter */
	char *temp_name ; /* name of temporary entry in file */
	int temp_grade ;	/* grade of temporary entry in file */
	
	// insertion sort
	for( i = 0; i < numgrades; i++ ) {
		temp_name = grade_list[i].name ;
		temp_grade = grade_list[i].grade ;
		
		for( j= i - 1; j >= 0; j-- ) {
			if( grade_list[j].grade < temp_grade ) break ;
			grade_list[j+1].name = grade_list[j].name ;
			grade_list[j+1].grade = grade_list[j].grade ;
		}
		grade_list[j+1].name = temp_name ;
		grade_list[j+1].grade = temp_grade ;
	}
}

/* calculates the average of all grades */
int calcMean(struct grade_entry grade_list[], int numgrades) {
	int sumgrades = 0; /* sum of all grades */
	int i; /* counter */

	for(i = 0; i < numgrades; i++)
		sumgrades += grade_list[i].grade ;

	return (double)sumgrades / (double)numgrades ;
}

/* calculates the median of all grades */
int calcMedian(struct grade_entry grade_list[], int numgrades) {
	if(numgrades % 2 == 1)
		return (double) grade_list[numgrades / 2].grade ;
	if(numgrades % 2 == 0)
		return (double) (grade_list[(numgrades / 2) - 1].grade + grade_list[numgrades / 2].grade) / 2.0 ;
}

/* returns the minimum of the two */
int min(int a, int b) {
	if( a < b )
		return a ;
	return b ;
}