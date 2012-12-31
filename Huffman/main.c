/**
author: Jenny Zhen
date: 01.18.13
language: C
file: main.c
assignment: Huffman (Project02)
	http://www.se.rit.edu/~se350/Projects/Project2/Huffman/Huffman%20Code%20Problem.html
*/

/*
  * Program to create a Huffman code for letters in a document read from 
  * standard input.
  */

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <assert.h>
#include <string.h>

#include "HuffmanTree.h"
#include "OrderedList.h"

#define NLETTERS (26)
#define PRINT_TREE_0

/*
 * Array of structions, one per letter, holding the count of occurrences of the 
 * letter and final Huffman code for the letter (generated during tree traversal).
 * This combines the declaration of the structure type and its fields with an 
 * array whose elements are of the structure type.
 */
 
 static struct letter_data {
    int ld_count ;
    char* ld_code ;
 } data[NLETTERS] ;

/*****
 * Local functions.
 *****/
 
 /*
  * Read the standard input file and accumulate letter counts in array "count".
  */
static void read_file() ;

/*
 * Initialize the ordered list with 26 HTreeNodes, 
 * one for each letter (with its count).
 */
static void initialize_ordered_list() ;

/*
 * Build the huffman coding tree. Assumes the ordered list is populated with 
 * leaf nodes holding letters and their counts.
 * At exit, there is one node in the ordered list, namely the root of the 
 * whole Huffman coding tree.
*/
static void build_huffman_tree() ;

/*
 * Traverse the tree given in the first argument, using the prefix to the final 
 * code given in the second argument.
 *    For leaf nodes, the prefix *is* the final code, so we store it in the 
 * 		structure in the original table reserved for the given letter.
 *    For interior nodes, the prefix has "0" appended for the left subtree and 
 * 		"1" appended for the right subtree. By appending we end up with a code 
 * 		that is parsed left to right.
 */
static void traverse_tree( HTreeNode *root, char *prefix ) ;
 
 /*
  * Print the final code for each letter in the table.
  */
static void print_codes() ;

/*
 * Main driver program.
 * The arguments are ignored.
 */
int main ( int ac, char **av ) {
 
    read_file() ;
     
    initialize_ordered_list() ;
    build_huffman_tree() ;
    traverse_tree( ol_remove(), "" ) ;
    print_codes() ;

    exit(0) ;
}

 /*
  * Read the standard input file and accumulate the letter counts in the 
  * "ld_count" fields array "data".
  */
static void read_file()  {
    int next_char ;
    
    while ( (next_char = getchar()) != EOF ) {
        if ( isalpha( next_char ) ) {
            int index = next_char - ( isupper( next_char ) ? 'A' : 'a' ) ;
            ++data[index].ld_count ;
        }
    }
    return ;
}

/*
 * Initialize ordered list with HTreeNodes, one for each letter (with its count).
 * The end the list will have the HTreeNode for the letter with the lowest 
 * count at the front, and HTreeNode for the most frequent letter at the end.
 */
static void initialize_ordered_list() {
    int index = 0 ; // index for data[] array of letter counts
	
	while( index < NLETTERS ) {
		HTreeNode *node ;
		node = mk_tree( index + 'A', data[ index ].ld_count, NULL, NULL );
		ol_insert( node ) ;
		index++ ;
	}

    assert( ol_size() == NLETTERS ) ;  /* invariant at this point */
    return ;
}

/*
 * Build the huffman coding tree. Assumes the ordered list is initially 
 * populated with leaf nodes holding letters and their counts.
 *
 * While there are at least two nodes left in the list, remove the first two 
 * (with the lowest counts) and:
 *      + create a new node with these two nodes as children, 
 * 			smallest count to the left.
 *      + set the new node's count to the sum of the children's counts.
 *      + insert the new node into the list.
 * This is a linear process, in that for every two nodes removed, one is 
 * inserted, so the length of the list decreases by 1 each time through loop.
 *
 * On return, there is one node in the ordered list, namely the root of the 
 * whole Huffman coding tree.
*/
static void build_huffman_tree() {
	HTreeNode *left, *right ; // temporary pointers
    while( ol_size() > 1 ) {
		// remove the children from the linked list
		left = ol_remove() ;
		right = ol_remove() ;
		
		#ifdef PRINT_TREE
		fprintf(stderr, "%c with %d @ left; %c with %d @ right\n", left->ht_label, left->ht_count, right->ht_label, right->ht_count);
		if(left->ht_left != NULL)
			fprintf(stderr, "\tLchildL %c with %d; ", left->ht_left->ht_label, left->ht_left->ht_count);
		if(left->ht_right != NULL)
			fprintf(stderr, "\tLchildR %c with %d\n", left->ht_right->ht_label, left->ht_right->ht_count);
		if(right->ht_left != NULL)
			fprintf(stderr, "\tRchildL %c with %d; ", right->ht_left->ht_label, right->ht_left->ht_count);
		if(right->ht_right != NULL)
			fprintf(stderr, "\tRchildR %c with %d\n", right->ht_right->ht_label, right->ht_right->ht_count);
		#endif
		
		// create new root node with the children
		HTreeNode *parent = 
			mk_tree( '\0', (left->ht_count + right->ht_count), left, right ) ;
		
		// insert the parent of the children back into linked list
		ol_insert( parent ) ;
	}
}

/*
 * Traverse the Huffman coding tree given in the first argument,
 * with the prefix so far as a string second argument.
 *    For leaf nodes, the prefix *is* the final code, so we store *a copy* of 
 * 		 the prefix string in the structure in the original data table 
 * 		 associated this letter. That is, the copy is stored in the letter's 
 * 		 "ld_code" field.
 *    For interior nodes, a local string is allocated to hold the prefix with 
 * 		 "0" appended to traverse the left subtree and the prefix with "1" 
 * 		 appended to traverse the right subtree. By appending we end up with 
 * 		 a code that is parsed left to right.
 * 	  traverse_tree( ol_remove(), "" ) ;
 */
static void traverse_tree( HTreeNode *root, char *prefix ) {
    /*
       * The node is a leaf it it has no descendant nodes. Since the tree is 
	   * a complete binary tree we need only check one of the two descendant 
	   * links. If this is a leaf, the code for the letter is the prefix - 
	   * make a copy and then free up storage for the Huffman Tree Node 
	   * (we don't need it any longer).
    */

    if( root->ht_left == NULL && root->ht_right == NULL ) {
		char *final_prefix = calloc( strlen( prefix ), sizeof( char ) ) ;
		strncpy( final_prefix, prefix, strlen( prefix ) ) ;
		data[ root->ht_label - 'A' ].ld_code = final_prefix ;
		free( root ) ;
		return ;
    }
	
    /*
       * Allocate space a string to hold the prefix plus one additional
       * character (be careful in computing the amount of space you need!).
       * Extend the prefix with a "0" and process the left tree.
       * Extend the prefix with a "1" and process the right tree.
       * When done, free up the space used by the local string used for
       *    extension *as well as* the space used by the Huffman Tree Node
       *    just processed - we don't need it any longer.
    */
	char *new_prefix = calloc( strlen( prefix ) + 2, sizeof( char ) ) ;
	strncpy( new_prefix, prefix, strlen( prefix ) ) ;
	
    if( root->ht_left != NULL ) {
		new_prefix[ strlen( prefix ) ] = '0' ;
		traverse_tree( root->ht_left, new_prefix ) ;
	}
	if( root->ht_right != NULL ) {
		new_prefix[ strlen( prefix ) ] = '1' ;
		traverse_tree( root->ht_right, new_prefix ) ;
	}
	free( root ) ;
	free( new_prefix ) ;
	return ;
}
 
 /*
  * Print the final code for each letter in the table.
  */
static void print_codes() {
	int index ;
	
    // loop through the alphabet in the data[] array
	for( index = 0; index < NLETTERS; index++ ) {
		printf( "%c %s\n", index + 'A', data[ index ].ld_code ) ;
		free( data[ index ].ld_code ) ;
	}
}
