/**
author: Jenny Zhen
date: 01.18.13language: C
file: HuffmanTree.c
assignment: Huffman (Project02)
	http://www.se.rit.edu/~se350/Projects/Project2/Huffman/Huffman%20Code%20Problem.html
*/

/*
 * Implementation of the Huffman tree module.
 *
*/
 
 #include <stdlib.h>
 #include <assert.h>
 #include "HuffmanTree.h"

 /*
  * Helper function to create a new tree from two subtrees and
  * the desired root node label. The root node count is the sum
  * of the counts of the subtrees.
 */
 HTreeNode *mk_tree( char lab, int count, HTreeNode *left, HTreeNode *right) {
    HTreeNode node = calloc( 1, sizeof( HTreeNode ) ) ;
	node.ht_label = lab ;
	node.ht_count = count ;
	node.ht_left = left ;
	node.ht_right = right ;
	return node ;
}