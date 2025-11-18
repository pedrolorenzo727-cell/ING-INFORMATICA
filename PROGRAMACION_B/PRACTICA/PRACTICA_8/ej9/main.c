#include <stdio.h>
#include <stdlib.h>
#define MAX 10

typedef struct nodo{
  int dato;
  struct nodo *sig;}nodo;

typedef nodo * tLista;

void grados(tLista vecList[], int vecGrs[], int n);
int vertMaxGrEnt(int vecGrs[], int n);

int main(){

  tLista vecList[MAX];
  int vecGrs[MAX]={0}, n;

  //cargavec(vecList, &n);

  grados(vecList, vecGrs, n);
  printf("El vertice con mayor grado de entrada es: %d", vertMaxGrEnt(vecGrs, n)+1);

  return 0;
}

void grados(tLista vecList[], int vecGrs[], int n){
  tLista aux;
  int i;

  for (i=0; i<n; i++){
    aux=vecList[i];
    while (aux != NULL){
      vecGrs[aux->dato-1]+=1;
      aux=aux->sig;
    }
  }

}
int vertMaxGrEnt(int vecGrs[], int n){
  int max, i, vert;

  max=vecGrs[0];
  vert=0;
  for (i=1; i<n; i++)
    if (vecGrs[i]>max){
      max=vecGrs[i];
      vert=i;
    }

  return vert;
}

