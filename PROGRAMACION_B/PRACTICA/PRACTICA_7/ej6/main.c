#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_CAD 50

typedef struct nodo{
    char dato[MAX_CAD];
    struct nodo *izq, *der;
} nodo;

typedef nodo * tArbol;

void addnodo(tArbol* a, char cad[]);
void nivelMaxLong(tArbol a, int *nivMax, int *longMax, int niv);


int main(){
  tArbol a;
  int niv=0,longMax=0;

  addnodo(&a, "Casa");
  addnodo(&a->izq, "Arbol");
  addnodo(&a->izq->izq, "Ardines");
  addnodo(&a->izq->der, "Boca");
  addnodo(&a->der, "Museo");
  addnodo(&a->der->izq, "Futbol");
  addnodo(&a->der->izq->der, "Basquet");
  addnodo(&a->der->izq->der->der, "Pileta");
  addnodo(&a->der->izq->der->izq, "Cancha");

  nivelMaxLong(a,&niv,&longMax,1);
  printf("El nivel donde se encuentra la cadena de longitud maxima comenzada por A es %u\n",niv);

 return 0;

}

void addnodo(tArbol* a, char cad[]) {
    *a = (tArbol)malloc(sizeof(nodo));
    strcpy((*a)->dato, cad);
    (*a)->izq = NULL;
    (*a)->der = NULL;
}

void nivelMaxLong(tArbol a, int *nivMax, int *longMax, int niv){
  if(a!=NULL){
    if(a->dato[0]=='A' && strlen(a->dato) > *longMax){
      *nivMax = niv;
      *longMax = strlen(a->dato);
    }
    nivelMaxLong(a->izq, nivMax, longMax, niv+1);
    nivelMaxLong(a->der, nivMax, longMax, niv+1);
  }
}//hacer int

