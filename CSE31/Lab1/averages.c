≈#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[]) {
  int enteredNum, neg_Sum, neg_Pos, pos_Sum, neg_Tot, pos_Tot = 0;


printf("Please enter an integer:");

while(scanf("%d",&enteredNum ) == 1 &&  enteredNum != 0){ 
  printf("Please enter an integer:");

  if (enteredNum < 1) { // checks the entered number to see if that number should be added to the positive or negative variable
    neg_Sum = neg_Sum + enteredNum;   neg_Tot++; // keeps a running total of number of postive numbers have be inputted. Not their total amount, but how many physical pos numbers were inputted
  } else {

    pos_Sum = pos_Sum + enteredNum;
    pos_Tot++; // keeps a running total of number of negative numbers have be inputted. Not their total amount, but how many physical neg numbers were inputted
}
}
//  printf("test");


//Need a algo that takes neg and pos numbers for avg " divide by 2"


printf("Positive average: %d\n", pos_Tot == 0 ? 0 : pos_Sum/pos_Tot);
printf("Negative average: %d\n", neg_Tot == 0 ? 0 : neg_Sum/neg_Tot);

	return 0;
}
