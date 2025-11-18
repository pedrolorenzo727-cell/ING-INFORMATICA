#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"

void cargaPila(TPila *P);
void transforma(TPila *P);
void muestra(TPila *P);

int main(){
    TPila P;

    cargaPila(&P);
    transforma(&P);
    muestra(&P);

    return 0;
}

void cargaPila(TPila *P){
  FILE *arch;
  int num;

  iniciaP(P);
  arch=fopen("ej8.txt","rt");
  if (arch==NULL)
    printf("No se pudo abrir el archivo");
  else{
    while(fscanf(arch,"%d",&num)==1)
      poneP(P,num);
    fclose(arch);
  }
}

void transforma(TPila *P){
  TElementoP x;

  if (!vaciaP(*P)){
    sacaP(P,&x);
    transforma(P);
    poneP(P,x*(-1));
  }
}

void muestra(TPila *P){
  TElementoP x;

  while(!vaciaP(*P)){
    sacaP(P,&x);
    printf("%d ",x);
  }
}
