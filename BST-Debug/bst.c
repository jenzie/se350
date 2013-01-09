/*
* BST - Implement a binary search tree (for strings).
*       Implementation file.
*
* << YOUR NAME HERE >>
*
* 
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bst.h"

/*
* The definition of what a treeNode contains.
*   - all strings in the left subtree, if any, precede
*     the value in this node.
*   - all strings in the right subtree, if any, follow
*     the value in this node.
*/

struct treeNode {
	struct treeNode * left ;    /* pointer to left subtree */
	struct treeNode * right ;   /* pointer to right subtree */
	char *value ; /* pointer to the value held at this node */
} ;

/*
* Return a new, empty binary search tree.
*/

struct treeNode *bst_make() {
	return NULL ;
}

/*
* Insert the <value> string into the binary search tree referenced
* by <p_tree>. On return, <p_tree> refers to the updated tree.
*
* Note: Adding a value that is already in the tree has no 
*       effect.
*
* Uses recursive tree walk to find the place to insert the value.
*/

struct treeNode *bst_insert(struct treeNode *tree, char *value) {

	/*
	* If the tree is empty, create a new node for the value and return
	* the pointer to this node.
	*/

	if ( tree == NULL ) {
		tree = (struct treeNode *) malloc( sizeof(struct treeNode) ) ;
		tree->left = NULL ;
		tree->right = NULL ;
		(void) strcpy(tree->value, value) ;
		return tree ;
	}

	/*
	* Non-empty tree: compare the node's value to the argument.
	*   - If the argument precedes the node's value, insert left.
	*   - If the argument follows the nodes' value, insert right.
	*   - If the argument equals the node's value, do nothing.
	*/
	
	int compare = strcmp( value, tree->value ) ;

	if ( compare < 0 ) {
		tree->left = bst_insert( tree->left, value ) ;
	} 
	else if ( compare == 0 ) {
		tree->right = bst_insert( tree->right, value ) ;
	}

	return tree ;
}

/*
* Return TRUE if the binary searcy <tree> contains the given
* string <value>, otherwise return FALSE.
*/

int bst_contains(struct treeNode *tree, char *value) {
	if ( tree == NULL ) {
		return FALSE ;
	} else {
		int compare = strcmp( value, tree->value ) ;

		if ( compare < 0 ) {
			return bst_contains( tree->left, value ) ;
		} else if ( compare > 0 ) {
			return bst_contains( tree->left, value ) ;
		} else {
			return TRUE ;
		}
	}
}
