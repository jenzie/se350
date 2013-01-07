/*
 * linkedtest - unit test cases for linked.c using simplectest
 * Tom Reichlmayr, RIT, 12/18/2006
 */
/************************************************************
 main - test functions in this package
 ************************************************************/
/*
*/

#include "../simplectest/tests.h"
#include "linked.h"
#include <stdlib.h>

// Start the overall test suite, "main()" starts here
START_TESTS()
// these variables are visible to all test case macros
    struct node* testlist = NULL ;
    int val ;

// "helper" functions could also be created as necessary, i.e. like JUnit setup()

START_TEST("list length of one")
    Push( &testlist, 1) ;
    ASSERT_EQUALS( 1, Length( testlist ) ) ;
END_TEST()

START_TEST("add a second node")
    Push( &testlist, 2) ;
    ASSERT_EQUALS( 2, Length( testlist ) ) ;
END_TEST()

START_TEST("pop top element of list")
	val = Pop( &testlist ) ;
	ASSERT_EQUALS( 2, val ) ;
END_TEST()

START_TEST("add more nodes")
    Push( &testlist, 2 ) ;
	Push( &testlist, 3 ) ;
	Push( &testlist, 4 ) ;
	Push( &testlist, 5 ) ;
	Push( &testlist, 6 ) ;
    ASSERT_EQUALS( 6, Length( testlist ) ) ;
END_TEST()

START_TEST("Copy the list; check size and values")
	struct node* copy = CopyList( testlist ) ;
	ASSERT_EQUALS( 6, Length( copy ) ) ;
	
	struct node* current = testlist ;
	int counter = 6 ;
	while( current != NULL ) {
		ASSERT_EQUALS( counter, current->data ) ;
		current = current->next ;
		counter-- ;
	}
END_TEST()

START_TEST("Insert node in middle of list")
	Push( &testlist, 8 ) ;
	Push( &testlist, 10 ) ;
	ASSERT_EQUALS( 8, Length( testlist ) ) ;
	
	struct node* newN1 = Create( 7 ) ;
	struct node* newN2 = Create( 9 ) ;
	struct node* newN3 = Create( 11 ) ;
	SortedInsert( &testlist, newN1 ) ;
	SortedInsert( &testlist, newN2 ) ;
	SortedInsert( &testlist, newN3 ) ;
	ASSERT_EQUALS( 11, Length( testlist ) ) ;
	
	struct node* current = testlist ;
	int counter = 11 ;
	while( current != NULL ) {
		ASSERT_EQUALS( counter, current->data ) ;
		current = current->next ;
		counter-- ;
	}
END_TEST()

START_TEST("Sort an unsorted list")
	testlist = NULL ;
	int counter = 0 ;
	
	while( counter < 11 ) {
		Push( &testlist, counter ) ;
		counter++ ;
	}
	fprintf(stderr, "finished adding\n");
	SortList( &testlist ) ;
	fprintf(stderr, "finished sorting\n");
	ASSERT_EQUALS( 11, Length( testlist ) ) ;
	
	struct node* current = testlist ;
	counter = 11 ;
	while( current != NULL ) {
		ASSERT_EQUALS( counter, current->data ) ;
		current = current->next ;
		counter-- ;
	}
END_TEST()

// End the overall test suite
END_TESTS()
