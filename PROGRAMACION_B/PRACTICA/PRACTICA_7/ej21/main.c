#include <stdio.h>
#include <stdlib.h>
#define MAX 10

typedef struct nodo{
  int dato;
  struct nodo *der, *izq;
} nodo;

typedef nodo *tArbol;

int altura(tArbol a){
int cantArboles(tArbol a, int k);
int maxClave(tArbol a);
void generaVec(tArbol a, int vec[], int *pn);
int gradoNodo(tArbol a, int k);
int verifica(tArbol a, int k);

int main()
{
    tArbol a;
    int k, vec[MAX], n=0;

    //cargaArbol(&a);
    printf("Ingrese un nivel minimo\n");
    scanf("%d",&k);
    printf("La cantidad de arboles del bosque que tenian altura al menos %d son %d\n", k,cantArboles(a,k));
    return 0;
}

//INCISO A
int cumpleAltura(tArbol a, int k, int alt){
  if (a == NULL)
    return 0;
  else
    if (alt==k)
      return 1;
    else
        return cumpleAltura(a->izq, k, alt+1) || cumpleAltura(a->der, k, alt);
}

int cantArboles(tArbol a, int k){
  int cont=0;

  while (a!=NULL){
    cont += k==0 || cumpleAltura(a->izq,k,1);
    a=a->der;
  }

  return cont;
}

//INCISO B
int maxClave(tArbol a){
  int maxDer, maxIzq;

  if (a != NULL){
    maxDer=maxClave(a->der);
    maxIzq=maxClave(a->izq);

    if (a->dato > maxDer && a->dato > maxIzq)
      return a->dato;
    else
        if (maxDer >= a->dato && maxDer >= maxIzq)
          return maxDer;
        else
          return maxIzq;
  }
  else
    return -9999;
}

void generaVec(tArbol a, int vec[], int *pn){
  int valor;

  while(a!=NULL){
    valor=maxClave(a->izq);
    if (a->dato > valor)
      vec[*pn]= a->dato;
    else
      vec[*pn]=valor;
    (*pn)++;
    a=a->der;
  }
}

//INCISO C
int cumpleGradoNodo(tArbol a, int k){

  int cont=0;

  a=a->izq;
  while (a != NULL && cont<=k){
    cont ++;
    a= a->der;
  }

  return cont==k;
}

int arbNodoGradK(tArbol a){

  if (a != NULL)
    if (cumpleGradoNodo(a))
      return 1;
    else
      return arbNodoGradK(a->izq) || arbNodoGradK(a->der);
}

int verifica(tArbol a){
  int cumple=1;

  while(a!=NULL && cumple){
    cumple=cumpleGradoNodo(a);
    if(!cumple)
      cumple=arbNodoGradK(a->izq);
    a=a->der;
  }

  return cumple;
}
