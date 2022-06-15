#include <stdio.h>
#include <stdlib.h>
// #include <malloc.h>

struct Node {
    int iValue;
    float fValue ;
    struct Node *next;
};

int main() {

    struct Node *head = (struct Node*) malloc(sizeof(struct Node));
    head->iValue = 5;
    head->fValue = 3.14;

	// Insert extra code here
  printf("\nAddress of head: %d \n", &head);
  printf("\nAddress of head: %d \n", &(*head));
  printf("Values of head: \n");
  printf("  * Value of i: %d \n", head->iValue);
  printf("  * Value of f: %f \n", head->fValue);
  printf("  * Address of i: %d \n", &(head->iValue));
  printf("  * Address of f: %d \n", &(head->fValue));
  printf("Address of next: %d \n", &(head->next));



	return 0;
}
