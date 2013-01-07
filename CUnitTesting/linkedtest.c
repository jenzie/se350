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
	struct node* current = copy ;
	int counter = 6 ;
	while( current != NULL ) {
		ASSERT_EQUALS( counter, current->data ) ;
		current = current->next ;
		counter-- ;
	}
	ASSERT_EQUALS( 6, Length( copy ) ) ;
END_TEST()

START_TEST("Insert node in middle of list")
	Push( &testlist, 9 ) ;
	Push( &testlist, 12 ) ;
	ASSERT_EQUALS( 8, Length( testlist ) ) ;
END_TEST()

// End the overall test suite
END_TESTS()   
