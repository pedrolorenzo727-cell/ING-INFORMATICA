#include <stdio.h>
#include <stdlib.h>
typedef int tElememtoA;

typedef struct nodo{
    tElememtoA dato;
    struct nodo *izq, *der;
} nodo;
typedef nodo * tArbol;

void addnodo(tArbol* a, tElememtoA e);

int main(){
  tArbol a;
  int x;

  addnodo(&a, 5);
  addnodo(&a->izq, 3);
  addnodo(&a->izq->izq, 2);
  addnodo(&a->izq->der, 4);
  addnodo(&a->der, 8);
  addnodo(&a->der->izq, 6);

 return 0;

}

void addnodo(tArbol* a, tElememtoA e) {
  tArbol aux, ant;

  aux= *a;
    while (aux != NULL){
      ant=aux;
      if (e<aux->dato)
          aux = aux->izq;
      else
          aux = aux->der;
    }
      aux = (tArbol)malloc(sizeof(nodo));
      aux->dato = e;
      aux->izq = NULL;
      aux->der = NULL;
      if (e>ant->dato)
        ant->der = aux;
      else
        ant->izq = aux;
}
