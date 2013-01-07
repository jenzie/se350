/*
 * linkedtest - unit test cases for linked.c using simplectest
 * Tom Reichlmayr, RIT, 12/18/2006
 */
/************************************************************
 main - test functions in this package
 ************************************************************/
/*
*/

#include "tests.h"
#include "linked.h"

// Start the overall test suite, "main()" starts here
START_TESTS()  
// these variables are visible to all test case macros
     struct node* testlist = NULL;
     int val;

// "helper" functions could also be created as necessary, i.e. like JUnit setup()

START_TEST("list length of one")
     Push( &testlist, 1);
     ASSERT_EQUALS( 1, Length( testlist ));
END_TEST()

START_TEST("add a second node and make this test fail")
     Push( &testlist, 2);
     ASSERT_EQUALS( 1, Length( testlist));
END_TEST()

START_TEST("pop top element of list")
	   val = Pop( &testlist );
	   ASSERT_EQUALS( 2, val );
END_TEST()


// End the overall test suite
END_TESTS()   
