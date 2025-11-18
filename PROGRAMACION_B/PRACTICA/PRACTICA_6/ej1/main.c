#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct nodo{
  char dato;
  struct nodo *sig;}nodo;

typedef nodo* tLista;

void cargaLista(tLista *l);
void muestraContenido(tLista l);
int poseenVoc(tLista l);
int estaOrdenada(tLista l);
void elimina(tLista *L, int p);

int main(){
    tLista l;
    int p;

    cargaLista(&l);
    muestraContenido(l);
    printf("\nLa cantidad de nodos que poseen vocales son %d\n",poseenVoc(l));
    if (estaOrdenada(l))
        printf("La lista esta ordenada\n");
    else
        printf("La lista no esta ordenada\n");
    printf("Ingrese una posicion a eliminar\n");
    scanf("%d",&p);
    elimina(&l,p);
    muestraContenido(l);

    return 0;
}

void cargaLista(tLista *l){
  FILE *arch;
  char car;
  tLista aux;

  *l=NULL;
  arch=fopen("ej1.txt","rt");
  if(arch==NULL)
    printf("Error al abrir el archivo\n");
  else{
    while (fscanf(arch,"%c ",&car)==1){
      aux= (tLista) malloc(sizeof(nodo));
      aux->dato = car;
      aux->sig = *l;
      *l=aux;
    }
    fclose(arch);
  }
}

void muestraContenido(tLista l){
  tLista aux;

  aux=l;
  while(aux!=NULL){
    printf("%c ",aux->dato);
    aux = aux->sig;
  }
}

int poseenVoc(tLista l){
  tLista aux;
  int cont=0;
  char car;

  aux=l;
  while(aux!=NULL){
    car=toupper(aux->dato);
    if(car=='A' || car=='E' || car=='I'  || car=='O' || car=='U')
        cont++;
    aux = aux->sig;
  }
  return cont;
}

int estaOrdenada(tLista l){
  tLista aux;
  char ant;

  aux=l;
  if(aux!=NULL){
    ant=aux->dato;
    aux=aux->sig;
    while(aux!=NULL && ant>aux->dato){
      ant = aux->dato;
      aux = aux->sig;
    }
    return aux==NULL;
  }
  else
    return 0;
}

void elimina(tLista *l, int p){
  tLista ant,act;
  int i;

  if(*l != NULL)
    if(p==1){
      act=*l;
      *l=(*l)->sig;
      free(act);
    }
    else{
      act=*l;
      i=1;
      while(act!=NULL && i<p ){
        i++;
        ant=act;
        act=act->sig;
      }
      if (act!=NULL){
        ant->sig=act->sig;
        free(act);
      }
    }
}
