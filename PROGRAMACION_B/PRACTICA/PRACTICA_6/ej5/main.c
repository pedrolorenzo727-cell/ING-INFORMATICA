#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"
#include "colasE.h"
#define IMP -9999

typedef struct nodo{
  tCola dato;
  struct nodo* sig;}nodo;

typedef nodo* tLista;

void cargaLista(tLista *l);
int maximo(tCola *c);
void generaPila(tLista l, tPila *p);
void muestraPila(tPila *p);

int main(){
    tLista l;
    tPila p;

    cargaLista(&l);
    generaPila(l,&p);
    muestraPila(&p);

    return 0;
}

void cargaLista(tLista *l){
  FILE *arch;
  tElementoC elem1,elem2,elem3,elem4;
  tLista nuevo;

  *l=NULL;
  arch=fopen("ej5.txt","rt");
  if(arch==NULL)
    printf("error al abrir archivo");
  else{
    while(fscanf(arch,"%d %d %d %d",&elem1, &elem2, &elem3, &elem4)==4){
      nuevo=(tLista) malloc(sizeof(nodo));
      iniciaC(&nuevo->dato);
      poneC(&nuevo->dato,elem1);
      poneC(&nuevo->dato,elem2);
      poneC(&nuevo->dato,elem3);
      poneC(&nuevo->dato,elem4);
      nuevo->sig=*l;
      *l=nuevo;
    }
    fclose(arch);
  }
}

int maximo(tCola *c){
  int max=IMP;
  tElementoC x;

  while(!vaciaC(*c)){
    sacaC(c,&x);
    if (x>max)
      max=x;
  }

  return max;
}

void generaPila(tLista l, tPila *p){
  tElementoP x;

  iniciaP(p);
  while(l!=NULL){
    x=maximo(&l->dato);
    poneP(p,x);
    l=l->sig;
  }
}

void muestraPila(tPila *p){
  tElementoP x;

  printf("Los maximos de las colas son:\n");
  while(!vaciaP(*p)){
    sacaP(p,&x);
    printf("%d ",x);
  }
}

