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
	
	while( temp->link != NULL ) {
		temp = temp->link ;
		counter++ ;
	}
	return counter ;
}

void deq_put_head(node **deqhead, char *value){
    
}

void deq_put_tail(node **deqhead, char *value){
    
}

void deq_get_head(node **deqhead, char *value){
    
}

void deq_get_tail(node **deqhead, char *value){

}