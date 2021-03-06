/**
author: Jenny Zhen
date: 01.18.13
language: C
file: OrderedList.h
assignment: Huffman (Project02)
	http://www.se.rit.edu/~se350/Projects/Project2/Huffman/Huffman%20Code%20Problem.html
*/

/*
 * Interface to a module supporting an ordered list of HTreeNodes - ordering 
 * is by increasing count field.
*/
 
#ifndef ORDERED_NODE_LIST
#define ORDERED_NODE_LIST
 
#include "HuffmanTree.h"

/*
 * Insert the specified HTreeNode into the ordered list in the proper position
 * according to increasing count.
 */
void ol_insert(HTreeNode *t) ;

/*
 * Return the current size of the list of HTreeNodes.
 */

int ol_size() ;

/*
 * Remove the first HTreeNode in the list and return a pointer
 * to it. If the list is empty, NULL is returned.
 */

HTreeNode *ol_remove() ;
#endif
