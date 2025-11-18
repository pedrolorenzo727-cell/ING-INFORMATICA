#include <stdio.h>
#include <stdlib.h>
#define MAX 10
#define INF 9999

void muestraCamino(int vecP[], int origen, int act);

int main(){
  int vecP[MAX]={0,0,4,0,3}, vertV; //mAdy[MAX][MAX], vecD[MAX];

  //cargaDigrafo(mAdy, &n);
  //dijkstra(mAdy, n, vecD, vecP);

  printf("Ingrese el vertice\n");
  scanf("%d", &vertV);
  muestraCamino(vecP, 0, vertV-1);

  return 0;
}

void muestraCamino(int vecP[], int origen, int act){
  if (vecP[act]==0)
    printf("%d %d ", origen+1, act+1);
  else{
    muestraCamino(vecP, origen , vecP[act]-1);
    printf("%d ",act+1);
  }
}
