#include <stdio.h>
#include <stdlib.h>
typedef int tElememtoA;

typedef struct nodo{
    tElememtoA dato;
    struct nodo *izq, *der;
} nodo;
typedef nodo * tArbol;

void addnodo(tArbol* a, tElememtoA e);
int sumaMult(tArbol a);
int cantHojas(tArbol a);
int buscaX(tArbol a, int x);

int main(){
  tArbol a;
  int x;

  addnodo(&a, 5);
  addnodo(&a->izq, 8);
  addnodo(&a->izq->izq, 3);
  addnodo(&a->izq->der, 6);
  addnodo(&a->der, 4);
  addnodo(&a->der->izq, 1);
  addnodo(&a->der->izq->der, 2);

  printf("La suma de los elementos multiplos de 3 del arbol es %d\n",sumaMult(a));
  printf("La cantidad de hojas del arbol es %d\n",cantHojas(a));
  printf("Ingrese un valor\n");
  scanf("%d",&x);
  if (buscaX(a,x))
    printf("El elemento se encuentra en el arbol\n");
  else
    printf("El elemento no se encuentra en el arbol\n");


 return 0;

}

void addnodo(tArbol* a, tElememtoA e) {
    *a = (tArbol)malloc(sizeof(nodo));
    (*a)->dato = e;
    (*a)->izq = NULL;
    (*a)->der = NULL;
}

int sumaMult(tArbol a){
  int aux=0;

  if (a != NULL){
    if (a->dato % 3 == 0)
      aux=a->dato;
    return aux + sumaMult(a->izq) + sumaMult(a->der);
  }
  else
    return 0;
  }

int cantHojas(tArbol a){

  if(a != NULL)
    if (a->der == NULL && a->izq == NULL)
      return 1;
    else
      return cantHojas(a->izq) + cantHojas(a->der);
  else
    return 0;
}
int buscaX(tArbol a, int x){

  if( a != NULL)
    return a->dato==x || buscaX(a->izq,x) || buscaX(a->der,x);
  else
    return 0;
}

