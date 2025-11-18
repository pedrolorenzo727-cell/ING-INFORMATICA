#include <stdio.h>
#include <stdlib.h>
#define MAX 7
#include "colasE.h"
#include "pilas.h"

void profundidad(int mAdy[][MAX], int n, int ini);
void amplitud(int mAdy[][MAX], int n, int ini);
void CCC(int mAdy[][MAX], int n);
int todosVisit(int vecVis[], int n);

int main(){
  int mAdy[MAX][MAX]={{0,1,1,0,0,0,0},
                      {1,0,1,1,0,0,0},
                      {1,1,0,1,1,0,0},
                      {0,1,1,0,1,0,0},
                      {0,0,1,1,0,1,1},
                      {0,0,0,0,1,0,0},
                      {0,0,0,0,1,0,0}};
  int n=7, ini;

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
void profundidad(int mAdy[][MAX], int n, int ini){
  int vecVis[MAX]={0}, vert, j;
  tPila p;

  iniciaP(&p);
  poneP(&p, ini);
  printf("%d ",ini+1);
  vecVis[ini]=1;

  while (!todosVisit(vecVis,n)){
    vert=consultaP(p);
    j=0;
    while(j<n && (mAdy[vert][j]==0 || vecVis[j]==1))
      j++;
    if(mAdy[vert][j]==1 && vecVis[j]==0){
      poneP(&p,j);
      printf("%d ",j+1);
      vecVis[j]=1;
    }
    else
      sacaP(&p,&vert);
  }
}

//inciso B
void amplitud(int mAdy[][MAX], int n, int ini){
  int vecVis[MAX]={0}, vert, j;
  tCola c;

  iniciaC(&c);
  poneC(&c,ini);
  vecVis[ini]=1;
  printf("%d ",ini+1);
  while (!todosVisit(vecVis,n)){
    sacaC(&c, &vert);
    j=0;
    while(j<n){
      if (mAdy[vert][j] && vecVis[j]==0){
        poneC(&c,j);
        vecVis[j]=1;
        printf("%d ",j+1);
      }
      j++;
   }
  }
}

//inciso C
void CCC(int mAdy[][MAX], int n){
  int vecVis[MAX]={0}, vert, i, j, ccc=1;
  tCola c;

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
      j=0;
      while(j<n){
        if (mAdy[vert][j] && vecVis[j]==0){
          poneC(&c,j);
          vecVis[j]=1;
        }
        j++;
     }
    }
  }

  printf("La cantidad de componentes conexas son %d\n",ccc);
}
