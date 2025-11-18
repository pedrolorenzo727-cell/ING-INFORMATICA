#include <stdio.h>
#include <stdlib.h>
#define MAX 10

typedef struct nodo{
  int dato;
  struct nodo *sig;}nodo;

typedef nodo * tLista;

int gradoVerticeM(int mAdy[][MAX], int vert, int n);
int gradoVerticeL(int vecAdy[], int vert, int n);
int gradoVerticeMM(int mAdy[][MAX], int vert, int n);

int main(){
  int mAdy[MAX][MAX], n, vert;
  tLista vecAdy[MAX];

  //cargaMatriz(mAdy, &n);
  //cargaLista(vecAdy, n);

  printf("El grado del vertice es %d\n",gradoVerticeM(mAdy, vert-1, n));
  printf("El grado del vertice es %d\n",gradoVerticeL(vecAdy, vert-1, n));
  printf("El grado del vertice es %d\n",gradoVerticeMM(vecAdy, vert-1, n));

  return 0;
}


int gradoVerticeM(int mAdy[][MAX], int vert, int n){
  int j, cont=0;

  for(j=0; j<n; j++)
    if (mAdy[vert][j])
      cont++;

  return cont;
}


int gradoVerticeL(int vecAdy[], int vert, int n){
  tLista aux;
  int cont=0;

  aux=vecAdy[vert];
  while(aux != NULL){
    cont++;
    aux=aux->sig;
  }

  return cont;
}

int gradoVerticeMM(int mAdy[][MAX], int vert, int n){
  int i,j, cont=0;

  for(i=0; i<vert; i++)
    if (mAdy[i][vert])
      cont++;
  for (j=vert; j<n; j++)
    if (mAdy[vert][j])
      cont++;

  return cont;
}
