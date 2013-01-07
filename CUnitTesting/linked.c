
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
    while (current->next != NULL) {
      current = current->next;
    }
    current->next = newNode;
  }
}

/************************************************************
 CopyList - return new copy of list
 ************************************************************/
struct node* CopyList(struct node* head) {
 
 /* More practice !!!! */  

  return NULL;;
}

/************************************************************
 SortedInsert - insert node at proper place in sorted list
			Called by SortList()
 ************************************************************/
void SortedInsert(struct node** headRef, struct node* newNode) {
  struct node* current;

  /* Your Code Here */
}

/************************************************************
 SortList - sort list by popping the top node off and calling
		 SortedInsert to build a new sorted list
 ************************************************************/
void SortList(struct node** headRef) {

/* Your Code Here */
  
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
