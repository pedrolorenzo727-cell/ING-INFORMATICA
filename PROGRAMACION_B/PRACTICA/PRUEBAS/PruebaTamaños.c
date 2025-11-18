#include <stdio.h>

void main() {
    printf("char: %u bytes\n", sizeof(char));
    printf("int: %u bytes\n", sizeof(int));
    printf("long int: %u bytes\n", sizeof(long int));
    printf("float: %u bytes\n", sizeof(float));
    printf("double: %u bytes\n", sizeof(double));
    printf("word: %u bytes",sizeof(unsigned int));
}
