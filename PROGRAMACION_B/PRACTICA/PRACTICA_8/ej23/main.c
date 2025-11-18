#include <stdio.h>
#include <stdlib.h>
#define MAX 3
#define INF 9999

void muestraCamino(int matP[][MAX], int i, int j);

int main(){
  int matP[MAX][MAX]={{0,3,0},
                {0,0,1},
                {2,0,0}}, vertV, origen; //mAdy[MAX][MAX], matD[MAX][MAX];

  //cargaDigrafo(mAdy, &n);
  //floyd(mAdy, n, matD, matP);

  printf("Ingrese el vertice origen y el vertice destino\n");
  scanf("%d %d",&origen, &vertV);
  muestraCamino(matP, origen-1, vertV-1);

  return 0;
}

void muestraCamino(int matP[][MAX], int i, int j){
  if (matP[i][j]==0)
    printf("%d ", i+1);
  else{
    muestraCamino(matP, i , matP[i][j]-1);
    muestraCamino(matP, matP[i][j]-1 , j);
    printf("%d ",j+1);
  }
}
