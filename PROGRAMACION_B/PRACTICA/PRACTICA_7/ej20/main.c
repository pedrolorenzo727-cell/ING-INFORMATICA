#include <stdio.h>
#include <stdlib.h>

typedef struct nodo{
  int dato;
  struct nodo *der, *izq;
} nodo;

typedef nodo *tArbol;

int cantNodosNivImp(tArbol a, int niv);
int cumple(tArbol a, int k);
void prom(tArbol a, int k, int *sum, int *cont);
int altura(tArbol a);
int gradoNodo(tArbol a);
int gradoArb(tArbol a);


int main(){
    tArbol a;
    int acum, cont;

    //cargaArbol(&a);

    printf("La cantidad de nodos en niveles impares: %u\n",cantNodosNivImp(a, 1));
    prom(a, 2, &acum, &cont);
    if (cont)
      printf("Promedio de las claves de grado 2: %.1f\n", (float) acum/cont);
    else
        printf("No hay nodos de grado 2\n");
    printf("La altura del arbol original era %d\n",altura(a));
    printf("El grado del arbol original era %d\n", gradoArb(a));


    return 0;
}

int cantNodosNivImp(tArbol a, int niv){
    if (a != NULL)
        return (niv % 2) + cantNodosNivImp(a->der, niv) + cantNodosNivImp(a->izq, niv+1);
    else
        return 0;
}

int cumple(tArbol a, int k){
  int cont=0;

  a=a->izq;
  while(a != NULL){
    cont++;
    a=a->der;
  }
  return cont==k;

}

void prom(tArbol a, int k, int *sum, int *cont){

  if (a!=NULL){
    if (cumple(a,k)){
       *cont +=1;
       *sum += a->dato;
    }
    prom(a->izq, k, sum, cont);
    prom(a->der, k, sum, cont);
  }
}

int altura(tArbol a){
  int profIzq, profDer;

 if (a != NULL){
    profIzq=altura(a->izq)+1;
    profDer=altura(a->der);
    return (profIzq>profDer)? profIzq:profDer;
 }
 else
    return -1;
}

int gradoNodo(tArbol a){

  int cont=0;

  a=a->izq;
  while (a != NULL){
    cont ++;
    a= a->der;
  }

  return cont;
}

int gradoArb(tArbol a){
  int izq, der, aux;

  if (a != NULL){
    izq = gradoArb(a->izq);
    der = gradoArb(a->der);
    aux= gradoNodo(a);

    if (aux > izq && aux > der)
      return aux;
    else
      if (izq >= aux && izq>=der)
        return izq;
    else
      return der;
  }
  else
    return 0;
}


