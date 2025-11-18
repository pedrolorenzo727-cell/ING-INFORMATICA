#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define MAX_CAD 50

typedef struct nodo{
    char dato[MAX_CAD];
    struct nodo *izq, *der;
} nodo;

typedef nodo * tArbol;

void addnodo(tArbol* a, char cad[]);
void muestraGanador(tArbol a);
void muestraFinalistas(tArbol a);
void muestraSemifinalistas(tArbol a, int nivel);
void profundidad(tArbol a, int *prof, int niv);
void muestraTodos(tArbol a, int, int);

int main(){
  tArbol a;
  int prof=0;

  addnodo(&a, "Pedro");
  addnodo(&a->izq, "Matias");
  addnodo(&a->izq->izq, "Matias");
  addnodo(&a->izq->der, "Julian");
  addnodo(&a->der, "Pedro");
  addnodo(&a->der->izq, "Roberto");
  addnodo(&a->der->der, "Pedro");

  muestraGanador(a);
  muestraFinalistas(a);
  printf("Semifinalistas:\n");
  muestraSemifinalistas(a,1);
  profundidad(a,&prof,0);
  printf("\nTodos los competidores: \n");
  muestraTodos(a, prof, 1);
  printf("%u\n",prof);
  printf("\nSon %.0f competidores\n",exp2(prof-1));

 return 0;

}

void addnodo(tArbol* a, char cad[]) {
    *a = (tArbol)malloc(sizeof(nodo));
    strcpy((*a)->dato, cad);
    (*a)->izq = NULL;
    (*a)->der = NULL;
}

void muestraGanador(tArbol a){
  if (a!=NULL)
    printf("el ganador es: %s\n",a->dato);
}

void muestraFinalistas(tArbol a){
  if (a!=NULL)
    if (a->der!= NULL)//innecesario
        printf("Los finalistas son %s y %s\n",a->der->dato,a->izq->dato);
}

void profundidad(tArbol a, int *prof, int niv ){
  if (a!=NULL){
    niv ++;
    if( niv > *prof)
        (*prof) ++;
    profundidad(a->izq,prof,niv);
    profundidad(a->der,prof,niv);
  }
}

void muestraSemifinalistas(tArbol a, int nivel){
  if (a!=NULL)
    if (nivel == 3)
        printf("%s ", a->dato);
    else{
      muestraSemifinalistas(a->izq,nivel+1);
      muestraSemifinalistas(a->der,nivel+1);
    }
}

void muestraTodos(tArbol a, int prof, int niv){
  if (a!=NULL && niv!=prof){
    muestraTodos(a->der,prof,niv+1);
    muestraTodos(a->izq,prof,niv+1);
  }
  else
    if (niv==prof)
      printf("%s ",a->dato);
}


