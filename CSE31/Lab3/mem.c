#include <stdio.h>
#include <stdlib.h>
// #include <malloc.h>

 int main() {
	int num;
	int *ptr;
	int **handle;

	num = 14;
	ptr = (int *)malloc(2 * sizeof(int));
	*ptr = num;
	handle = (int **)malloc(1 * sizeof(int *));
	*handle = ptr;

	// Insert extra code here
  printf("Address of num: %u\n", &num );
  printf("Address of ptr: %u\n", &ptr);
  printf("Addlress of *ptr: %u\n", &(*ptr));
  printf("Address of handle: %u\n", &handle);
  printf("Address of *handle: %u\n", &(*handle));
  printf("Address of **handle: %u\n", &(**handle));
  printf("Contents of ptr: %u\n", ptr);
  printf("Contents of ptr: %u\n", *ptr);
  printf("Contents of ptr: %u\n", *handle);

  free(ptr);
  free(handle);

	return 0;
}
