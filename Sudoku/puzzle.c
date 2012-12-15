/**
author: Jenny Zhen
date: 12.16.12
language: C
assignment: Sudoku (Project01)
	http://www.se.rit.edu/~se350/Projects/Project1/Description.html
*/
/*
 * Implementation of the The Sudoku puzzle module.
 *
 * In keeping with standard Sudoku nomenclature, we use
 * 1-based indexing. Thus row indices, column indices,
 * and digits being placed must all be in the range 1 .. 9.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "puzzle.h"
#include "bool.h"

/*
 * The tables are 10x10 so that we can index from 1 .. 9 (the 0th row
 * and column are ignored). This wastes a tad of space, but is much
 * less likely to cause "off by 1" indexing errors.
 *
 * puzzle[i][j] is the number (0 .. 9) at row i, column j.
 *   0 represents a free (blank) puzzle location.
 *   Anything else represents the value at that location, and
 *     must be consistent with the rules of Sudoku.
 *
 * fixed[i][j] is true <=> row i, column j is fixed.
 *   That is, the value was part of the initial puzzle layout and
 *   cannot be erased.
 */

static short puzzle[10][10] ;
static bool  fixed[10][10] ;

/*
 * Functions to determine whether a row, a column, or the "region"
 * containing a row and column, contains the specified digit.
 */
static bool row_contains(int row, int digit) ;
static bool col_contains(int col, int digit) ;
static bool region_contains(int row, int col, int digit) ;

/*
 * Function to determine whether an integer - not the character for
 * a digit - is in the range 0 .. 9.
 */
static bool in_range(int value) ;

/*
 * Print support functions.
 *   print a line of dashes.
 *   print a row of values (with blanks for 0's).
 */
static void print_dashes() ;
static void print_row(int row) ;

/*
 * Initialize the puzzle so that (a) all values are zero (free)
 * and (b) none of the values are 'fixed' (uneraseable).
 */

extern void init_puzzle() {
	int num_rows = 10, num_cols = 10 ;
	int r_index = 0, c_index = 0 ;
	
	for( r_index; r_index < num_rows; r_index++ ) {
		for( c_index; c_index < num_cols; c_index++ ) {
			puzzle[r_index][c_index] = 0 ;
			fixed[r_index][c_index] = FALSE ;
		}
	}
}

/*
 * Read in the initial puzzle configuration.
 * Each line is 4 characters long:
 *   Row    as a character '0' .. '9'
 *   Column as character '0' .. '9'
 *   Digit  as character '0' .. '9'
 *   Terminating newline.
 * Exits with an error message if there are syntactic
 * or semantic errors with any configuration line.
 */

void configure(FILE *puzzle_file) {
	int line_num = 1 ; // used in case if there is a need to print errors
	char r_index, c_index, value ; // indices for row/column and the value
	
	while( fscanf( puzzle_file, "%c%c%c", &r_index, &c_index, &value ) != EOF ) {
		// check ranges 
		if( !in_range(r_index) || !in_range(c_index) || !in_range(value) ) {
			fprintf( stderr, 
				"Illegal format in configuration file at line %d", line_num ) ;
			exit( 1 ) ;
		}
		
		// check if a value is already stored at the location
		if( puzzle[r_index][c_index] != 0 ) (
			fprintf( stderr,
				"Illegal placement in configuration file at line %d", line_num );
			exit( 1 ) ;
		}
		
		// convert and store as integers
		puzzle[r_index - '0'][c_index - '0'] = value - '0' ;
		fixed[r_index - '0'][c_index - '0'] = TRUE ;
		line_num++;
		
		// get rid of any trailing characters for each line
		do value = fgetc(puzzle_file); while (value != '\n')
	}
}

/*
 * Print the puzzle to standard output using the
 * specified output format.
 * 	- Print an initial row of dashes.
 * 	- Print each row.
 * 	- Print a row of dashes after each 3rd row.
 */

void print_puzzle() {
	int num_rows = 10, r_index = 1 ;

	// initial row of dashes
	print_dashes() ;
	
	// print each row
	for( r_index; r_index < num_rows; r_index++ ) {
		print_row( r_index ) ;
		
		// check if it's a 3rd row
		if( r_index % 3 == 0 )
			print_dashes() ;
	}
}

/*
 * (Attempt to) add the specified digit at the given row and
 * column location on the puzzle.
 * The digit, row, and column must all be integers in
 * the range 1 .. 9.
 *
 * Return value is the status of the attempt (OP_OK is the only
 * status where the puzzle is actually changed).
 */

op_result add_digit(int row, int col, int digit) {
	if( !in_range( row ) || !in_range( col ) )
		return OP_BADARGS ;
	if( puzzle[row][col] != 0 )
		return OP_OCCUPIED ;
	
	puzzle[row][col] = digit ;
	return OP_OK ;
}

/*
 * (Attempt to) delete the digit at the given row and
 * column location on the puzzle the row and column
 * must both be integers in the range 1 .. 9
 *
 * Return value is the status of the attempt (OP_OK is the only
 * status where the puzzle actually changed).
 */

op_result erase_digit(int row, int col) {
	if( !in_range( row ) || !in_range( col ) )
		return OP_BADARGS ;
	if( puzzle[row][col] == 0 )
		return OP_EMPTY ;
	if( fixed[row][col] == TRUE )
		return OP_FIXED ;
	puzzle[row][col] = 0 ;
	return OP_OK ;
}

/*
 * Returns TRUE iff the given 'row' has the given 'digit' in it.
 */
static bool row_contains(int row, int digit) {
	return FALSE ;
}

/*
 * Returns TRUE iff the given 'col' has the given 'digit' in it.
 */
static bool col_contains(int col, int digit) {
	return FALSE ;
}

/*
 * Returns TRUE iff the region containing the cell at 'row' & 'col'
 * has the given digit in it.
 * NOTE: Finding the first row and column for the 'row'
 *       and 'col' is simple if you (a) remember that integer
 *       division discards the remainder and (b) translating
 *       the indices to 0 rather than 1 base makes things easier.
 * NOTE: A region is a 3 x 3 square.
 */
static bool region_contains(int row, int col, int digit) {
	return FALSE ;
}

/*
 * Return TRUE iff the value is in the Sudoku range (1 .. 9)
 */
static bool in_range(int value) {
	if( value < 1 || value > 9 )
		return FALSE ;
	return TRUE ;
}

/*
 * Print a row of 25 dashes.
 * This will line up correctly with the rows with data.
 */
static void print_dashes() {
	int num = 25 ; // number of dashes to print
	for( num; num > 0; num-- )
		printf("-") ;
	printf("\n") ;
}

/*
 * Print a row from the puzzle.
 *   Print an initial bar ('|').
 *   For each value in the row, print a space and either:
 *     - a space if the value is 0.
 *     - the CHARACTER code for the digit if non-zero.
 *   After the 3rd, 6th and 9th columns, print " |"
 */
static void print_row(int row) {
	int index = 1 ; // index/counter to loop through values in row
	int length = 10 ; // number of values in one row
	printf("|") ;
	for( index; index < length; index++ ) {
		if( puzzle[row][index] == 0 )
			printf("  ") ;
		else
			printf(" %d", puzzle[row][index]) ;
		if( index != 0 && index % 3 == 0 )
			printf(" |") ;
	}
	printf("\n");
}
