#include <stdio.h>
#include <stdlib.h>
#define MAX 50

typedef char tElememtoA;

typedef struct nodo{
    tElememtoA dato;
    struct nodo *izq, *der;
} nodo;
typedef nodo * tArbol;

void addnodo(tArbol* a, tElememtoA e);
void generaVec(tArbol a, char vec[], unsigned int *pn);
void muestraVec(char vec[], int n);

int main(){
  tArbol a;
  char vec[MAX];
  unsigned int n=0;

  addnodo(&a, 'e');
  addnodo(&a->izq, 'c');
  addnodo(&a->izq->izq, 'b');
  addnodo(&a->izq->der, 'd');
  addnodo(&a->der, 'g');
  addnodo(&a->der->izq, 'f');
  addnodo(&a->der->der, 'j');

  generaVec(a, vec, &n);
  muestraVec(vec,n);


 return 0;

}

void addnodo(tArbol* a, tElememtoA e) {
    *a = (tArbol)malloc(sizeof(nodo));
    (*a)->dato = e;
    (*a)->izq = NULL;
    (*a)->der = NULL;
}

void generaVec(tArbol a, char vec[], unsigned int *pn){
  if (a != NULL){
    generaVec(a->der,vec,pn);
    vec[*pn]=a->dato;
    (*pn)++;
    generaVec(a->izq,vec,pn);
  }
}

void muestraVec(char vec[], int n){
  int i;

  for (i=0; i<n; i++)
    printf("%c - ",vec[i]);
}
