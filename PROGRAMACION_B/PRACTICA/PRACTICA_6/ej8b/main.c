#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct nodo{
  char dato;
  struct nodo *sig;}nodo;

typedef nodo* tListaC;

void muestraContenido(tListaC lc);
int poseenVoc(tListaC lc);
int estaOrdenada(tListaC lc);
void elimina(tListaC *lc, int p);

int main(){
    tListaC lc;
    int p;

    //cargaLista(&l);
    muestraContenido(lc);
    printf("\nLa cantidad de nodos que poseen vocales son %d\n",poseenVoc(lc));
    if (estaOrdenada(lc))
        printf("La lista esta ordenada\n");
    else
        printf("La lista no esta ordenada\n");
    printf("Ingrese una posicion a eliminar\n");
    scanf("%d",&p);
    elimina(&lc,p);

    return 0;
}

void muestraContenido(tListaC lc){
  tListaC aux;

  if(lc!=NULL){
    aux=lc->sig;
    do{
      printf("%c ",aux->dato);
      aux=aux->sig;
    }while (aux != lc->sig);
  }
}

int poseenVoc(tListaC lc){
  tListaC aux;
  char car;
  int cont=0;

  if(lc != NULL){
    aux=lc->sig;
    do{
      car=toupper(aux->dato);
      if(car=='A' || car=='E' || car=='I'  || car=='O' || car=='U')
        cont++;
      aux = aux->sig;
    }while(aux != lc->sig);
  }

  return cont;
}

int estaOrdenada(tListaC lc){
  tListaC ant, act;

  if (lc != NULL){
    act=lc->sig;
    do{
      ant=act;
      act=act->sig;
    }while(act != lc && ant<act);
  }
  return act==lc && ant<=act;
}

void elimina(tListaC *lc, int p){
  tListaC ant,act;
  int i=1;

  if (*lc != NULL){
    ant = *lc;
    act = (*lc)->sig;
    while(act!= *lc && i<p){
      i++;
      ant=act;
      act=act->sig;
    }
    if(i==p){
      if(act==*lc)
        if(act->sig==*lc)
         *lc = NULL;
        else{
          ant->sig=act->sig;
          *lc = ant;
        }
      else
        ant->sig=act->sig;
      free(act);
    }
  }
}
