#include <stdio.h>
#include <stdlib.h>
typedef int tElememtoA;

typedef struct nodo{
    tElememtoA dato;
    struct nodo *izq, *der;
} nodo;
typedef nodo * tArbol;

void addnodo(tArbol* a, tElememtoA e);
int suma(tArbol a, int x, int niv);

int main(){
  tArbol a;
  unsigned int x;

  addnodo(&a, 5);
  addnodo(&a->izq, 8);
  addnodo(&a->izq->izq, 3);
  addnodo(&a->izq->der, 6);
  addnodo(&a->der, 4);
  addnodo(&a->der->izq, 1);
  addnodo(&a->der->izq->der, 2);

  printf("Ingrese un nivel\n");
  scanf("%u",&x);
  printf("La suma del contenido de los nodos que tienen grado 1 y estan en el nivel %u es %d\n",x,suma(a,x,1));

 return 0;

}

void addnodo(tArbol* a, tElememtoA e) {
    *a = (tArbol)malloc(sizeof(nodo));
    (*a)->dato = e;
    (*a)->izq = NULL;
    (*a)->der = NULL;
}

int suma(tArbol a, int x, int niv){
  if (a != NULL)
    if(niv!=x)
      return suma(a->der, x, niv+1) + suma(a->izq, x, niv+1);
    else
      if (a->der==NULL && a->izq != NULL || a->der!=NULL && a->izq==NULL)//a->der!=a->izq
        return a->dato;
      else
        return 0;
  else
    return 0;
}
