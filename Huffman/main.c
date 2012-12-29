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

/*
 * Array of structions, one per letter, holding the count of occurrences of the 
 * letter and final Huffman code for the letter (generated during tree traversal).
 * This combines the declaration of the structure type and its fields with an 
 * array whose elements are of the structure type.
 */
 
 static struct letter_data {
    int ld_count ;
    char *ld_code ;
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
 * At the end the list will have the HTreeNode for the letter with the lowest 
 * count at the front, and HTreeNode for the most frequent letter at the end.
 */
static void initialize_ordered_list() {
     /* FILL IN */

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
     /* FILL IN */
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
 */
static void traverse_tree( HTreeNode *root, char *prefix ) {
    /*
       * The node is a leaf it it has no descendant nodes. Since the tree is 
	   * a complete binary tree we need only check one of the two descendant 
	   * links. If this is a leaf, the code for the letter is the prefix - 
	   * make a copy and then free up storage for the Huffman Tree Node 
	   * (we don't need it any longer).
    */

     /* FILL IN */
    
    /*
       * Allocate space a string to hold the prefix plus one additional
       * character (be careful in computing the amount of space you need!).
       * Extend the prefix with a "0" and process the left tree.
       * Extend the prefix with a "1" and process the right tree.
       * When done, free up the space used by the local string used for
       *    extension *as well as* the space used by the Huffman Tree Node
       *    just processed - we don't need it any longer.
    */

     /* FILL IN */
}
 
 /*
  * Print the final code for each letter in the table.
  */
static void print_codes() {
     /* FILL IN */
}
