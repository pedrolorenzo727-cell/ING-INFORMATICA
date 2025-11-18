#include <stdio.h>
#include <stdlib.h>

// eliminar todos los nodos de la LC cuyo valor sea  X

typedef struct nodo{
  int dato;
  struct nodo* sig;}nodo;

typedef nodo * tListaC;

void eliminaSucesivos(tListaC *LC, int x);

int main(){
    tListaC LC;
    int x=10;

    eliminaSucesivos(&LC, x);

    return 0;
}

void eliminaSucesivos(tListaC *LC, int x){
  tListaC elim, act, ant;

  if(*LC != NULL){
    ant = *LC;
    act = (*LC)->sig;
    while(act != *LC){
      if (act->dato == x){
        elim=act;
        act=act->sig;
        ant->sig=act;
        free(elim);
      }
      else{
        ant=act;
        act=act->sig;
      }
    }
    if(act->dato==x){
        if(act->sig==act)
            *LC=NULL;
        else{
            ant->sig=(*LC)->sig;
            *LC = ant;
        }
        free(act);
    }

  }
}
