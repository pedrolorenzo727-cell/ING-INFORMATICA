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

  iniciaP(P);
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
  TElementoP x;

  if (!vaciaP(*P)){
    sacaP(P,&x);
    muestraDatos(P);
    printf("%c ",x);
    poneP(P,x);
  }
}

