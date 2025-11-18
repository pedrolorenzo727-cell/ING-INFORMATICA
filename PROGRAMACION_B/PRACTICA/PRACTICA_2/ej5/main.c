#include <stdio.h>
#include <stdlib.h>
#define MAX 50

typedef int * tVec[MAX];

void cargaArreglo(tVec, unsigned int *);
void muestraPos(tVec, unsigned int);

int main()
{
    tVec vec;
    unsigned int n;

    cargaArreglo(vec, &n);
    muestraPos(vec,n);

    return 0;
}

void cargaArreglo(tVec vec, unsigned int *pn){
  FILE *arch;
  int num;

  *pn=0;
  arch= fopen("ej5.TXT","rt");
  while (fscanf(arch,"%d",&num)==1){
    vec[*pn]= (int *) malloc(sizeof(int));
    *vec[*pn]=num;
    *pn +=1;
  }
  fclose(arch);
}

void muestraPos(tVec vec, unsigned int n){
  unsigned int i;

  printf("Los elementos positivos son:\n");

  for(i=0; i<n; i++){
    if(*vec[i]>0)
      printf(" %d",*vec[i]);
    free(vec[i]);
  }

}
