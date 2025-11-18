#include <stdio.h>
#include <stdlib.h>
#include "colasE.h"
#define CENT 9999

void cargaCola(tCola *c);
void muestraElem(tCola *c);

int main(){
  tCola c;

  cargaCola(&c);
  muestraElem(&c);

  return 0;
}

void cargaCola(tCola *c){
  FILE *arch;
  tElementoC x;

  iniciaC(c);
  arch= fopen("ej4.txt","rt");
  if(arch==NULL)
    printf("Error");
  else
    while(fscanf(arch,"%d", &x)==1)
      poneC(c,x);
    fclose(arch);
}

void muestraElem(tCola *c){
  tElementoC x;

  printf("Los elementos de la cola son: \n");
  poneC(c,CENT);
  sacaC(c,&x);

  while (x!=CENT){
    printf("%d - ",x);
    poneC(c,x);
    sacaC(c,&x);
  }
}
