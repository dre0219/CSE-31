#include<stdio.h>

#include<stdlib.h>

void printArr(int *a, int size){

    printf("printArr:");

    int i;

    for(i=0; i<size; i++){

        printf(" %d", a[i]);

    }

    printf("\n");

}

int *arrCopy(int *a, int size){

    int *temp = (int *)malloc(sizeof(int)*size);

    int i;

    for(i=0; i<size; i++){

        temp[i] = a[i];

    }

    return temp;

}

int main(){

    int n;

    int *arr;

    int *arr_copy;

    int i;

    printf("Enter size of array:\n");

    scanf("%d", &n);

    

    arr = (int *)malloc(sizeof(int)*n);

    for(i=0; i<n; i++){

        printf("Enter array content #%d: ", i+1);

        scanf("%d", &arr[i]);

    }

    printArr(arr, n);

    arr_copy = arrCopy(arr, n);

    printArr(arr_copy, n);

    return 0;

}
