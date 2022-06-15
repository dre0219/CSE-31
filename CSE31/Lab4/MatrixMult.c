
#include <stdio.h>
#include <malloc/malloc.h>

int** matMult(int **a, int **b, int size){
	int i, j, k, l;
	// (4) Implement your matrix multiplication here. You will need to create a new matrix to store the product.
	int **resultMat = (int**)malloc(size*sizeof(int*));
	for(i = 0; i < size; i++){
		 *(resultMat + i) = (int*)malloc(size*sizeof(int));
	 }
		int x = 0;
		for(j = 0; j < size; j++){

			for(k = 0; k < size; k++){

				for(l = 0; l < size; l++){

					x += (*(*(a + j) + k)) * (*(*(b + k) + l));

				}

				*(*(resultMat + j) + k) = x;
				x = 0;
			}
		}



	return resultMat;
}

void printArray(int **arr, int n){
	// (2) Implement your printArray function here
	int i, j;
	for(i = 0; i < n; i++){
		for(j = 0; j < n; j++){
			printf("%d ", *(*(arr + i) + j));
		}
		printf("\n");
	}
	printf("\n");

}

int main() {

	printf("Test 1...\n");
	int n = 2;
	int **matA, **matB, **matC;
	// (1) Define 2 n x n arrays (matrices).
	matA = (int**)malloc(n*sizeof(int*));
	matB = (int**)malloc(n*sizeof(int*));
	matC = (int**)malloc(n*sizeof(int*));
	printf("Test 1 Successful...\n");
	printf("Test 2...\n");
	int i, j;
	for(i = 0; i < n; i++){
		*(matA + i) = (int*)malloc(n*sizeof(int));
		*(matB + i) = (int*)malloc(n*sizeof(int));
		*(matC + i) = (int*)malloc(n*sizeof(int));
		for(j = 0; j < n; j++){
			*(*(matA + i) + j) = i+1;
			*(*(matB + i) + j) = j+i;
			*(*(matC + i) + j) = 0;
		}
	}
	printf("Test 2 Successful...\n");

	// (3) Call printArray to print out the 2 arrays here.
	printf("Matrix 1: \n");
	printArray(matA, n);
	printf("Matrix 2: \n");
	printArray(matB, n);

	//(5) Call matMult to multiply the 2 arrays here.
	matC = matMult(matA, matB, n);

	//(6) Call printArray to print out resulting array here.
	printArray(matC, n);


    return 0;
}
