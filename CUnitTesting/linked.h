/* linked.h - linked defines 
   Tom Reichlmayr, RIT, 12/18/2006
*/

struct node {
	int data;
  	struct node* next;
};
extern int Length(struct node* head);
extern void Push(struct node** headRef, int data);
extern int Pop(struct node** headRef);
extern void AppendNode(struct node** headRef, int data); 
extern struct node* CopyList(struct node* head); 
extern void SortedInsert(struct node** headRef, struct node* newNode);
extern void SortList(struct node** headRef);


