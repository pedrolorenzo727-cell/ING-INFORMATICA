#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct nodo{
  char dato;
  struct nodo *sig, *ant;} nodo;

typedef nodo *pNodo;

typedef struct{
  pNodo pri, ult;} tListaD;


void muestraContenido(tListaD ld);
int poseenVoc(tListaD ld);
int estaOrdenada(tListaD ld);
void elimina(tListaD *ld, int p);

int main(){
    tListaD ld;
    int p;

    //cargaLista(&ld);
    printf("\nLa cantidad de nodos que poseen vocales son %d\n",poseenVoc(ld));
    if (estaOrdenada(ld))
        printf("La lista esta ordenada\n");
    else
        printf("La lista no esta ordenada\n");
    printf("Ingrese una posicion a eliminar\n");
    scanf("%d",&p);
    elimina(&ld,p);

    return 0;
}

void muestraContenido(tListaD ld){
  pNodo aux;

  aux=ld.pri;
  while(aux != NULL){
    printf("%c ",aux->dato);
    aux=aux->sig;
  }
}

int poseenVoc(tListaD ld){
  pNodo aux;
  char car;
  int cont=0;

  aux = ld.pri;
  while (aux != NULL){
    car=toupper(aux->dato);
    if(car=='A' || car=='E' || car=='I'  || car=='O' || car=='U')
        cont++;
    aux= aux->sig;
  }

  return cont;
}

int estaOrdenada(tListaD ld){
  pNodo aux;
  int cumple=1;

  if(ld.pri != NULL){
    aux=ld.pri->sig;
    while (aux != NULL && cumple){
      if (aux->ant->dato > aux->dato)
        cumple=0;
      aux=aux->sig;
    }
  }

  return cumple;
}

void elimina(tListaD *ld, int p){
  pNodo act;
  int i=1;

  if (ld->pri != NULL){
    act=ld->pri;
    while(act != NULL && i<p){
      i++;
      act=act->sig;
    }
    if (act != NULL){
      if (act==ld->pri)//es el primero
        if(act->sig==NULL)//unico elemento
          ld->pri = ld->ult = NULL;
        else{
          act->sig->ant=NULL;
          ld->pri = act->sig;
        }
      else//no es el primero
        if (act == ld->ult){//es el ultimo
          act->ant->sig = NULL;
          ld->ult = act->ant;
        }
        else{//ni primero ni ultimo ni unico
          act->ant->sig=act->sig;
          act->sig->ant=act->ant;
        }
      free(act);
    }
  }
}
