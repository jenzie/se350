/**
author: Jenny Zhen
date: 12.17.12
language: C
assignment: Linked List
	Functions to sort a singly linked list of integers.
	http://www.se.rit.edu/~se350/Class_Activities/08_Memory/C_Memory_Activity.html
*/
/*
 * Simple list manipulation exercise.
 * 1. Create a list of integers.
 * 2. Print the list.
 * 3. Sort the list.
 * 4. Print the list
 * 5. Free the list nodes.
 */

#include <stdlib.h>
#include <stdio.h>

struct node {
	int value ;
	struct node *next ;
} ;

extern struct node *mk_node(int v) ;
extern void print_list(struct node *head) ;
extern struct node *sort_list(struct node *head) ;
extern void free_list(struct node *head) ;

/*
 * Arrays of integers terminated with a zero.
 */

int empty[]	= { 0 } ;
int one[]	= { 1, 0 } ;
int two[]	= { 2, 5, 0 } ;
int general[]	= { 3, 8, 2, 5, 1, 9, 0 } ;

/*
 * Array of arrays.
 *
 * Pointers to each of the subarrays,
 * terminated by a NULL program.
 *
 * Also create a parallel array naming the test.
 */

int *a_of_a[] = { empty, one, two, general, NULL } ;

char *test_name[] = { "empty", "one value", "two value", "general", NULL } ;

/*
 * Main driver program.
 *   - For each test array:
 *     * Creates list from array.
 *     * Prints the list.
 *     * Sorts the list.
 *     * Prints it.
 *     * Frees the list.
 */

int main() {
	struct node *head ;	/* head of the current list */
	struct node *curp ;	/* current node inserted in list */

	int *cur_test ;		/* current array of test values */

	/*
	 * Outer loop iterates through the array of arrays.
	 */

	int i ;
	for( i = 0 ; (cur_test = a_of_a[i]) != NULL ; i++ ) {

		/*
		 * Inner loop to create list.
		 */

		head = NULL ;
		int j ;
		for ( j = 0 ; cur_test[j] != 0 ; ++j ) {
			curp = mk_node( cur_test[j] ) ;
			curp->next = head ;
			head = curp ;
		}

		/*
		 * Print / Sort / Print / Free the List
		 */

		printf("Original %s list\n", test_name[i]) ;
		print_list(head) ;

		printf("Sort %s list\n", test_name[i]) ;
		head = sort_list(head) ;

		printf("Print sorted %s list\n", test_name[i]) ;
		print_list(head) ;

		printf("Free %s list\n", test_name[i]) ;
		free_list(head) ;

		printf("\n") ;
	}

	return 0 ;
}

/*
 * Return a new node with 'v' as the label and a NULL next link.
 */

struct node *mk_node(int v) {
	struct node *temp = malloc( sizeof( struct node ) ) ;
	temp->value = v ;
	temp->next = NULL ;
	return temp ;
}

/*
 * Print the list headed by 'head', one value per line.
 */

void print_list(struct node *head) {
	struct node *temp_ptr = head ;

	// loop until end of list
	while( temp_ptr != NULL ) {
		printf( "%d\n", temp_ptr->value ) ;
		temp_ptr = temp_ptr->next ;
	}
}

/*
 * Sort the list headed by 'head', returning a pointer to the node
 * that ends up at the head of the list.
 */

struct node *sort_list(struct node *head) {
	/*
	"swap(x,y)"
	temp = x ;
	x = y ;
	y = temp ;
	*/
	return head ;
}

/*
 * Free all the nodes in the list headed by 'head'.
 */

void free_list(struct node *head) {
	if( head == NULL )
		return ;

	struct node *temp_ptr = head->next ; // the next node after head

	// should've reverse deallocate memory
	while( temp_ptr != NULL ) {
		printf("free: %d\n", head->value);
		head->value = 0 ;
		free( head ) ;
		head = temp_ptr ;
		temp_ptr = temp_ptr->next ;
	}
	printf("free: %d\n", head->value);
	head->value = 0 ;
	free( head ) ;
}
