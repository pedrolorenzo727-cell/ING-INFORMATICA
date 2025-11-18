#include <stdio.h>
#include <stdlib.h>

typedef int tElememtoA;

typedef struct nodo{
    tElememtoA dato;
    struct nodo *izq, *der;
} nodo;
typedef nodo * tArbol;

void addnodo(tArbol* a, tElememtoA e);
int esABB(tArbol a, int min, int max);


int main(){
  tArbol a;

  addnodo(&a, 5);
  addnodo(&a->izq, 3);
  addnodo(&a->izq->izq, 2);
  addnodo(&a->izq->der, 4);
  addnodo(&a->der, 7);
  addnodo(&a->der->izq, 6);
  addnodo(&a->der->der, 10);

  if(esABB(a, -9999, 9999))
    printf("Es un arbol binario de busqueda\n");
  else
    printf("No es un arbol binario de busqueda\n");

 return 0;

}

void addnodo(tArbol* a, tElememtoA e) {
    *a = (tArbol)malloc(sizeof(nodo));
    (*a)->dato = e;
    (*a)->izq = NULL;
    (*a)->der = NULL;
}

int esABB(tArbol a, int min, int max){
  if (a==NULL)
    return 1;
  else
    if (a->dato <= min || a->dato >= max)
      return 0;
    else
        return esABB(a->izq, min, a->dato) && esABB(a->der, a->dato, max);
}

