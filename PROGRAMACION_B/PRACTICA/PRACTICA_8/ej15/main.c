#include <stdio.h>
#include <stdlib.h>
#define MAX 7

typedef struct{
    int i,j;
}tArista;

void kruscal(int mAdy[][MAX], int n, int matKrusc);
void prim(int mAdy[][MAX], int n, int ini, int matPrim[][]);
void iniciaCC(int cc[], int n);
int cumple(int cc[], int n);
int todosVisit(int vecVis[], int n);

int main(){
  int mAdy[MAX][MAX]={{0,3,1,0,0,0,0},
                      {3,0,2,4,0,0,0},
                      {1,2,0,1,3,0,0},
                      {0,4,1,0,2,0,0},
                      {0,0,3,2,0,1,4},
                      {0,0,0,0,1,0,0},
                      {0,0,0,0,4,0,0}};
  int n=7, ini, matPrim[MAX][MAX]={0}, matKrusc[MAX][MAX]={0};

  kruscal(mAdy,n, matKrusc);
  printf("Ingrese el vertice inicial para prim\n");
  scanf("%d", &ini);
  prim(mAdy, n, ini, matPrim);

  return 0;
}

void iniciaCC(int cc[], int n){
  int i;

  for (i=0; i<n; i++)
    cc[i]=i;
}

int cumple(int cc[], int n){
  int j=1, aux;

  aux=cc[0];
  while(j<n && cc[j]==aux)
    j++;

  return j==n;
}

void kruscal(int mAdy[][MAX], int n, int matKrusc[][MAX]){
  int  cc[MAX], i, j, min;
  tArista aMin;

  iniciaCC(cc,n);
  while (!cumple(cc,n)){
    min=9999;
    for (i=0; i<n; i++)
      for (j=0; j<n; j++) ///INNECESARIO RECORRER TODA LA MATRIZ
        if (mAdy[i][j]!=0 && mAdy[i][j]<min && cc[i]!=cc[j]){
          aMin.i=i;
          aMin.j=j;
          min=mAdy[i][j];
    }
    for (i=0; i<n; i++)
      if (cc[i]==cc[aMin.j])
        cc[i]=cc[aMin.i];

    matKrusc[aMin.i][aMin.j]=matKrusc[aMin.j][aMin.i]=mAdy[aMin.i][aMin.j];
  }
}

int todosVisit(int vecVis[], int n){
  int i=0;

  while (i<n && vecVis[i])
    i++;
  return i==n;
}

void prim(int mAdy[][MAX], int n, int ini, int matPrim [][MAX]){
  int vecVis[MAX]={0}, min, i, j, cc[MAX];
  tArista aMin;

  iniciaCC(cc,n);
  vecVis[ini-1]=1;
  while(!todosVisit(vecVis,n)){
    min=9999;
    for (i=0; i<n; i++)
      if(vecVis[i]){
        for (j=0; j<n; j++)
          if (!vecVis[j] && mAdy[i][j]!=0 && mAdy[i][j]<min && cc[i]!=cc[j]){
            min=mAdy[i][j];
            aMin.i=i;
            aMin.j=j;
          }
      }
    for (i=0; i<n; i++)
      if (cc[i]==cc[aMin.j])
        cc[i]=cc[aMin.i];

    vecVis[aMin.j]=1;
    matPrim[aMin.i][aMin.j]=matPrim[aMin.j][aMin.i]=mAdy[aMin.i][aMin.j];
  }
}




