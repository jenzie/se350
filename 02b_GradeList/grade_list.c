/**
author: Jenny Zhen
date: 12.05.12
language: C
assignment: GradeList
	Computes the average and median for a list of grades.
	http://www.se.rit.edu/~se350/Class_Activities/03_C_Structs_etc/Grades/GradeList.html
*/

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#define MAXNAME (20)
#define MAXGRADES (100)

struct grade_entry {
    char name[MAXNAME + 1] ;
    int  grade ;
} ;

int main(char file_name[]) {
	char i_name[MAX + 1] ; /* name of current entry in file */
	int i_grade ;	/* grade of current entry in file */
	int numgrades = 0 ; /* number of grades stored */
	struct grade_entry grade_list[MAXGRADES] ; /* list of grade entries */
	
	/* file i/o to read in file for grades */
	FILE *inputF ;
	char *mode = "r" ;
	
	inputF = fopen(file_name, mode) ;

	if(inputF == NULL) {
		fprintf(stderr, "Invalid input file.") ;
		exit(1) ;
	}

	/* pass in the address of "grade" */
	while(fscanf(inputF, "%s %d", i_name, &i_grade) != EOF) {
		struct grade_entry entry ;
		entry.name = i_name ;
		entry.grade = i_grade ;
		numgrades++ ;
	}

	calcMean(grade_list, numgrades);
	calcMedian(grade_list, numgrades);
}

int calcMean(grade_entry grade_list[], int numgrades) {
	int sum ; /* sum of all grades */
	int i;

	for(i = 0; i < numgrades; i++)
		sum += grade_list[i].grade ;

	return (double)sumgrades / (double)numgrades ;
}

int calcMedian(grade_entry grade_list[], int numgrades) {
	if(numgrades % 2 == 1)
		return (double) grade_list[numgrades / 2].grade ;
	if(numgrades % 2 == 0)
		return (double) (grade_list[(numgrades / 2) - 1].grade + grade_list[numgrades / 2]) / 2.0 ;
}