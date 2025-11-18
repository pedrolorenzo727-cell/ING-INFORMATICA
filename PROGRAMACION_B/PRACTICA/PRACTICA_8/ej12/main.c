#include <stdio.h>
#include <stdlib.h>
#define MAX 7
#include "colasE.h"
#include "pilas.h"

typedef struct nodo{
  int dato;
  struct nodo *sig;}nodo;

typedef nodo * tLista;

void profundidad(tLista vecList[], int n, int ini);
void amplitud(tLista vecList[], int n, int ini);
void CCC(tLista vecList[], int n);
int todosVisit(int vecVis[], int n);

int main(){
  int n, ini;
  tLista vecList[MAX];

  //cargaListas(vecList,&n);
  printf("ingrese el nodo inicial\n");
  scanf("%d",&ini);
  amplitud(mAdy, n, ini-1);
  printf("\n");
  profundidad(mAdy, n, ini-1);
  printf("\n");
  CCC(mAdy,n);

  return 0;
}

int todosVisit(int vecVis[], int n){
  int i=0;

  while (i<n && vecVis[i])
    i++;
  return i==n;
}

//inciso A
void profundidad(tLista vecList[], int n, int ini){
  int vecVis[MAX]={0}, vert;
  tPila p;
  tLista aux;

  iniciaP(&p);
  poneP(&p, ini);
  printf("%d ",ini+1);
  vecVis[ini]=1;

  while (!todosVisit(vecVis,n)){
    vert=consultaP(p);
    aux=vec[vert];
    while(aux != NULL && vecVis[aux->dato]==1))
      aux=aux->sig;
    if(aux!=NULL){
      poneP(&p,aux->dato);
      printf("%d ",aux->dato);
      vecVis[aux->dato]=1;
    }
    else
      sacaP(&p,&vert);
  }
}

//inciso B
void amplitud(tLista vecList[], int n, int ini){
  int vecVis[MAX]={0}, vert;
  tCola c;
  tLista aux;

  iniciaC(&c);
  poneC(&c,ini);
  vecVis[ini]=1;
  printf("%d ",ini+1);
  while (!todosVisit(vecVis,n)){
    sacaC(&c, &vert);
    aux=vecList[vert];
    while(aux!=NULL){
      if (vecVis[aux->dato]==0){
        poneC(&c,j);
        vecVis[j]=1;
        printf("%d ",j+1);
      }
      aux=aux->sig;
   }
  }
}

//inciso C
void CCC(tLista vecList[], int n){
  int vecVis[MAX]={0}, vert, i, ccc=1;
  tCola c;
  tLista aux;

  iniciaC(&c);
  poneC(&c,0);
  vecVis[0]=1;

  while (!todosVisit(vecVis,n)){
    if (vaciaC(c)){
      ccc++;
      i=0;
      while(vecVis[i]!=0)
        i++;
      poneC(&c, i);
      vecVis[i]=1;
    }
    else{
      sacaC(&c, &vert);
      aux=vecList[vert];
      while(aux!=NULL){
        if (vecVis[aux->dato]==0){
          poneC(&c,j);
          vecVis[j]=1;
        }
        aux=aux->sig;
     }
    }
  }

  printf("La cantidad de componentes conexas son %d\n",ccc);
}
