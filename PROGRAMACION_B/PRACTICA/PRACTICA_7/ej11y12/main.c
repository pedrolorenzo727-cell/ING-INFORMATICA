#include <stdio.h>
#include <stdlib.h>

typedef int tElememtoA;

typedef struct nodo{
    tElememtoA dato;
    struct nodo *izq, *der;
} nodo;
typedef nodo * tArbol;

void addnodo(tArbol* a, tElememtoA e);
int minimoABB(tArbol a);
int cantElem(tArbol abb, int a, int b);

int main(){
  tArbol abb;
  int a,b;

  addnodo(&abb, 5);
  addnodo(&abb->izq, 3);
  addnodo(&abb->izq->izq, 2);
  addnodo(&abb->izq->izq->izq, -10);
  addnodo(&abb->izq->der, 4);
  addnodo(&abb->der, 7);
  addnodo(&abb->der->izq, 6);
  addnodo(&abb->der->der, 10);

  printf("El minimo del arbol es %d\n",minimoABB(abb));
  printf("Ingrese dos valores del arbol (1ro<2do) \n");
  scanf("%d %d", &a, &b);
  printf("La cantidad de valores mayores a %d y menores que %d son %u\n", a, b, cantElem(abb, a, b));

 return 0;

}

void addnodo(tArbol* a, tElememtoA e) {
    *a = (tArbol)malloc(sizeof(nodo));
    (*a)->dato = e;
    (*a)->izq = NULL;
    (*a)->der = NULL;
}

int minimoABB(tArbol a){
  if (a != NULL){
    while(a->izq != NULL)
      a=a->izq;
    return a->dato;
  }
  else
    return 9999;
}

int cantElem(tArbol abb, int a, int b){
  if(abb!=NULL){
    if (abb->dato > a && abb->dato < b)
      return 1 + cantElem(abb->der, a, b) + cantElem(abb->izq, a, b);
    else
      if (abb->dato < a)
        return cantElem(abb->der, a, b);
      else
          return cantElem(abb->izq, a, b);
  }
  else
    return 0;
}
