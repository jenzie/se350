/**
author: Jenny Zhen
date: 01.07.13
language: C
file: linked.c
assignment: C Unit Testing
	http://www.se.rit.edu/~se350/Class_Activities/07_CUnitTesting/CTestIntro.htm
*/

/* linked - linked list functions
   Mark Ardis, RIT, 10/30/2006
   T. Reichlmayr, RIT, 12/13/2010
*/

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

struct node {
	int data;
	struct node* next;
};

/************************************************************
 Length - return length of a list
 ************************************************************/
int Length(struct node* head) {
	struct node* current;
	int count;

	current = head;
	count = 0;
	while (current != NULL) {
		count++;
		current = current->next;
	}
	return count;
}

/************************************************************
 Create - return a new node with the data value
 ************************************************************/
struct node* Create( int value ) {
	struct node* newNode ;
	newNode = malloc( sizeof( struct node ) ) ;
	newNode->data = value ;
	newNode->next = NULL ;
	return newNode ;
}

/************************************************************
 Push - add new node at beginning of list
 ************************************************************/
void Push(struct node** headRef, int data) {
	struct node* newNode;

	newNode = malloc(sizeof(struct node));

	newNode->data = data;
	newNode->next = *headRef;
	*headRef = newNode;
}

/************************************************************
 Pop - delete node at beginning of non-empty list and return its data
 ************************************************************/
int Pop(struct node** headRef) {
	struct node* current;
	int val;

	current = *headRef;
	assert(current != NULL);

	*headRef = current->next;
	val = current->data;
	free(current);

	return(val);
}

/************************************************************
 AppendNode - add new node at end of list
 ************************************************************/
void AppendNode(struct node** headRef, int data) {
	struct node* newNode;
	struct node* current;

	newNode = malloc(sizeof(struct node));
	newNode->data = data;
	newNode->next = NULL;

	current = *headRef;
	/* special case for empty list */
	if (current == NULL) {
		*headRef = newNode;
	} else {
		while (current->next != NULL)
			current = current->next;
		current->next = newNode;
	}
}

/************************************************************
 CopyList - return new copy of list
 ************************************************************/
struct node* CopyList(struct node* head) {
	struct node* current = head ; // current node in original list
	struct node* newHead = NULL ; // head for the new list
	struct node* newCurrent = NULL ; // current node in new list

	while( current != NULL ) {
		struct node* newNode ;
		newNode = malloc(sizeof(struct node)) ;
		newNode->data = current->data ;
		newNode->next = NULL ;
	  
		// check if the new list is empty; append otherwise
		if( newHead == NULL ) {
			newHead = newNode ;
			newCurrent = newHead ;
		} else {
			newCurrent->next = newNode ;
			newCurrent = newCurrent->next ;
		}
		current = current->next ;
	}
	return newHead;
}

/************************************************************
 SortedInsert - insert node at proper place in sorted list
				in descending order
			Called by SortList()
 ************************************************************/
void SortedInsert(struct node** headRef, struct node* newNode) {
	struct node* current = *headRef ;

	if( current == NULL || (current != NULL && current->data <= newNode->data) ) {
		newNode->next = current ;
		*headRef = newNode ;
		return ;
	}
	
	while( current->next != NULL && current->next->data > newNode->data )
		current = current->next ;

	newNode->next = current->next ;
	current->next = newNode ;
}

/************************************************************
 SortList - sort list by popping the top node off and calling
		 SortedInsert to build a new sorted list
 ************************************************************/
void SortList(struct node** headRef) {
	struct node** newHead = malloc( sizeof( struct node ) ) ;
	struct node* newNode ;
	
	while( *headRef != NULL ) {
		// pop off head and create new node using returned value from Pop()
		newNode = Create( Pop( headRef ) ) ;
		
		// insert node into sorted list
		SortedInsert( newHead, newNode ) ;
	}
	*headRef = *newHead ;
}

/************************************************************
 PrintList - print data values in list
 ************************************************************/
void PrintList(struct node* head) {
	struct node* current;
 
	printf("List: <");
	current = head;
	if (current != NULL) {
		printf("%d", current->data);
		current = current->next;
	}
	while (current != NULL) {
		printf(", %d", current->data);
		current = current->next;
	}
	printf(">\n");
}