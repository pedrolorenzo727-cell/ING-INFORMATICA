#include <stdio.h>
#include <stdlib.h>

void creaVariables(int **, int **, int **);
void muestraSuma(int , int , int);
void muestraProd(int , int , int);
void liberaMem(int *, int *, int *);

int main(){
    int *a, *b, *c;

    creaVariables(&a,&b,&c);
    muestraSuma(*a,*b,*c);
    muestraProd(*a,*b,*c);
    liberaMem(a,b,c);

    return 0;
}

void creaVariables(int **a, int **b, int **c){
    *a= (int *) malloc(sizeof(int));
    *b= (int *) malloc(sizeof(int));
    *c= (int *) malloc(sizeof(int));
    printf("ingrese tres numeros enteros\n");
    scanf("%d %d %d", *a, *b, *c);
}

void muestraSuma(int a, int b, int c){
    printf("Su suma es: %d\n", a+b+c);
}

void muestraProd(int a, int b, int c){
  printf("Su producto es %d", a*b*c);
}

void liberaMem(int *a, int *b, int *c){
  free(a); free(b); free(c);
}
