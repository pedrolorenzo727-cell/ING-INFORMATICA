#include <stdio.h>
#include <stdlib.h>
#define MAX 50

typedef float tVec[MAX];

void cargaArreglo(tVec, unsigned int *);
void muestraPos(tVec, unsigned int);

int main()
{
    tVec *vec;
    unsigned int n;

    vec= (tVec *) malloc(sizeof(tVec));
    cargaArreglo(*vec, &n);
    muestraPos(*vec, n);

    free(vec);
    return 0;
}

void cargaArreglo(tVec vec, unsigned int *pn){
  unsigned int i;

  printf("Ingrese la cantidad de elementos del arreglo\n");
  scanf("%u",pn);

  for (i=0; i<*pn; i++){
    printf("Ingrese el elemento %u\n",i+1);
    scanf("%f",&vec[i]);
  }
}

void muestraPos(tVec vec, unsigned int n){
  unsigned int i;

  printf("Los elementos positivos son: \n");

  for(i=0; i<n; i++)
    if (*(vec+i)>0)
      printf(" %.2f",*(vec+i));
}
