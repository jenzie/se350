/**
author: Jenny Zhen
date: 01.16.13
language: C
assignment: Practicum 02 - Queues
	https://mycourses.rit.edu/d2l/lms/content/viewer/view.d2l?tId=2342069&ou=422264
*/

/*
 * Implementation file for the doubly ended queue (dequeue)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "dequeue.h"

/********
 **
 ** INSTRUCTIONS
 **
 ** This the empty skeleton file for the implemenation of the
 ** double ended queue. Read the header file dequeue.h and 
 ** to see the documentation for each of the functions as well as how these
 ** are used in practice. To receive full credit, you must implement all of
 ** the following deq_* functions:
 */

bool deq_is_empty(node *deqhead){
    return deq_size( deqhead ) == 0 ;
}

int deq_size(node *deqhead){		
    int counter = 0 ;  // keep track of count
	node *temp = deqhead; // temp pointer to loop through queue
	
	if( temp != NULL ) {
		// fprintf(stderr, "size: %d\n", counter);
		while( temp != NULL ) {
			temp = temp->link ;
			counter++ ; 
			// fprintf(stderr, "size: %d\n", counter);
		}
	}
	return counter ;
}

void deq_put_head(node **deqhead, char *value){
    node *newNode = malloc( sizeof( node ) ) ;
	newNode->contents = malloc( sizeof( char * ) ) ;
	newNode->contents = strcpy( newNode->contents, value ) ;
	newNode->link = *deqhead ;
	*deqhead = newNode ;
	//fprintf(stderr, "newval: , size: %d\n", deq_size(deqhead));
}

void deq_put_tail(node **deqhead, char *value){
	node *temp = *deqhead ;

	node *newNode = malloc( sizeof( node ) ) ;
	newNode->contents = malloc( sizeof( char * ) ) ;
	newNode->contents = strcpy( newNode->contents, value ) ;
	newNode->link = NULL ;
    
	// check if queue is already empty
	if( deq_is_empty( temp ) ) {
		*deqhead = newNode ;
		return;
	}

	// loop for the last node on queue
	if( temp->link != NULL ) {
		while( temp->link != NULL ) {
			temp = temp->link ;
		}
	}
	temp->link = newNode ;
}

void deq_get_head(node **deqhead, char *value){
	node *temp = *deqhead ;
	
    if( deq_is_empty( temp ) )
		return ;
	
	value = strcpy( value, temp->contents ) ;
	*deqhead = temp->link ;
	free( temp->contents ) ;
	free( temp ) ;
}

void deq_get_tail(node **deqhead, char *value){
	node *temp = *deqhead, *temp_prev = *deqhead ;
	
	// check is queue is empty
	if( deq_is_empty( temp ) )
		return ;
	
	if( temp->link == NULL ) {
		free(temp->contents);
		free(temp);
		return;
	}
	
	while( temp->link != NULL ) {
		temp_prev = temp ;
		temp = temp->link ;
	}
	//fprintf(stderr, "val: %s, size: %d \n", temp->contents, deq_size(deqhead));
	value = strcpy( value, temp->contents ) ;
	/*if( deq_size( deqhead ) == 1 ) {
		free( temp->contents ) ;
		free( temp ) ;
		*deqhead = NULL ;
		return;
	}*/
	free( temp->contents ) ;
	free( temp ) ;
	temp_prev->link = NULL ;
}