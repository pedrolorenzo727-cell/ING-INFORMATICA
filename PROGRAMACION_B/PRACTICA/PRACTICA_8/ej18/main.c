#include <stdio.h>
#include <stdlib.h>
#define MAX 10
#define INF 9999

void generaMr(int matA[][MAX], int n, int matR[][MAX]);

int main(){
  int matAdy[MAX][MAX], matA[MAX][MAX], n;

  //cargaDigrafo(matAdy,&n);
  //floyd(matAdy,n,matA);

  generaMr(matA, n, matR);

  return 0;
}

void generaMr(int matA[][MAX], int n, int matR[][MAX]){
  int i, j;

  for (i=0; i<n; i++)
    for (j=0; j<n; j++)
      if(matA[i][j]==INF)
        matR[i][j]=0;
      else
        if (matA[i][j]!=0)
          matR[i][j]=1;
        else
          matR[i][j]=0;
}

