#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"

void ingresaDatos(TPila *P);
void muestraDatos(TPila *P);

int main(){
    TPila P;

    ingresaDatos(&P);
    muestraDatos(&P);

    return 0;
}

void ingresaDatos(TPila *P){
  FILE *arch;
  char car;

  arch=fopen("ej2.txt","rt");
  if (arch==NULL)
    printf("No se pudo abrir el archivo");
  else{
    while(fscanf(arch," %c",&car)==1){
      //if (car != '\n' && car != '\r')
        poneP(P,car);
    }
    fclose(arch);
  }
}

void muestraDatos(TPila *P){
  TElementoP car;
  TPila Paux;

  iniciaP(&Paux);
  while(!vaciaP(*P)){
    sacaP(P,&car);
    poneP(&Paux, car);
  }

  while(!vaciaP(Paux)){
    sacaP(&Paux, &car);
    printf(" %c",car);
    poneP(P,car);
  }
}
