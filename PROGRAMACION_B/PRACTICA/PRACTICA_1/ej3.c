#include <stdio.h>
#define num 15

void main() {
    //Inciso A
    char A;
    A = 'a';
    printf(" %c ", A);
    printf(" %d ", A);
    A = 'a' + 10;
    printf(" %c ", A);
    printf(" %d\n ", A);

    //Inciso B
    int B;
    B = 5;
    printf(" %d ", B);
    printf(" %c ", B);
    B = 5 + 'A';
    printf(" %d ", B);
    printf(" %c\n ", B);

    //Inciso C
    printf(" %d ",num);
    printf(" %c\n ",num);

    //Inciso D
    num = 5 + 'A';
    printf(" %d ",num);
    printf(" %c\n ",num);

}
