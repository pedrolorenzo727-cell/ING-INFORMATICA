#include <stdio.h>
#include <stdlib.h>

typedef struct nodo{
  int dato;
  struct nodo *sig;}nodo;

typedef nodo *tLista;

void generaInvertida(tLista *l, int vec[], int n);
void muestraContenido(tLista l);
void generaEnOrden(tLista *l, int vec[], int n);
void generaOrdenada(tLista *l, int vec[], int n);


int main(){
    int vec[]={3,4,1,6,-1,0,9,-4,3,5}, n=10;
    tLista l;

    generaInvertida(&l,vec,n);
    muestraContenido(l);
    generaEnOrden(&l,vec,n);
    muestraContenido(l);
    generaOrdenada(&l,vec,n);
    muestraContenido(l);

    return 0;
}

void muestraContenido(tLista l){
  tLista aux;

  aux=l;
  while(aux!=NULL){
    printf("%d ",aux->dato);
    aux = aux->sig;
  }
}

void generaInvertida(tLista *l, int vec[], int n){
  int i;
  tLista aux;

  *l=NULL;
  for (i=0; i<n; i++){
    aux=(tLista) malloc(sizeof(nodo));
    aux->sig=*l;
    aux->dato=vec[i];
    *l=aux;
  }
}

void generaEnOrden(tLista *l, int vec[], int n){
  tLista aux,nuevo;
  int i;

  *l=NULL;
  for (i=0; i<n; i++){
    nuevo= (tLista) malloc(sizeof(nodo));
    nuevo->sig=NULL;
    nuevo->dato=vec[i];
    if (*l == NULL)
      *l=nuevo;
    else{
        aux=*l;
        while(aux->sig !=NULL)
          aux = aux->sig;
        aux->sig=nuevo;
    }
  }
}

void generaOrdenada(tLista *l, int vec[], int n){
  tLista aux,ant,nuevo;
  int i;

  *l=NULL;
  for(i=0; i<n; i++){
    nuevo= (tLista) malloc(sizeof(nodo));
    nuevo->dato=vec[i];
      aux=*l;
      ant=NULL;
      while(aux != NULL && nuevo->dato>aux->dato){
        ant=aux;
        aux = aux->sig;
      }
      if(aux == *l){
        nuevo->sig=*l;
        *l=nuevo;
      }
      else{
        nuevo->sig=aux;
        ant->sig=nuevo;
      }
    }
  }
}
