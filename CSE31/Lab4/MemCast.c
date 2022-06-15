#include <stdio.h>

int main() {
	int i;
	int four_ints[4];
	char* four_c;

	for(i=0; i<4; i++)
        four_ints[i] = 2;

	printf("%x\n", four_ints[0]);

    four_c = (char*)four_ints;

	for(i=0; i<4; i++)
        four_c[i] = 'A'; // ASCII value of 'A' is 65 or 0x41 in Hex.

	printf("\nPrinting four_ints[]: \n");
	for(i = 0; i < 4; i++){
			printf("four_ints[%d]: %x\n",i, four_ints[i]);
		}
	printf("\nPrinting four_c (values): \n");
	for(i = 0; i < 16; i++){
			printf("four_c[%d]: %x\n",i, *four_c);
			four_c++;
	}

	printf("\nPrinting four_c addresses and hex values: \n\n");

	for(i = 0; i < 4; i++){
	printf("Printing four_int[%d] address: %p\n",i, &four_ints[i]);
	}

	printf("\nPrinting four_c addresses and hex values: \n\n");

	four_c = &four_ints[0]; 
	for(i = 0; i < 16; i++){
	printf("Printing four_c[%d] address: %p\n",i, four_c);	
	four_c++;
	}

	return 0;

}
