#include <stdio.h>
#include <stdlib.h>
#define MAX 10

void vertMasAlcanz(int matR[][MAX], int i, int j, int n, int cont, int *maxCont, int *vert);

int main(){
    int matR[MAX][MAX], n, maxCont=0, vert;

    //cargaMatR(matR, n);
    vertMasAlcanz(matR, n-1, n-1, n-1, 0, &maxCont, &vert);

    printf("El vertice alcanzado por mayor cantidad de vertices es el %d\n", vert+1);

    return 0;
}

void vertMasAlcanz(int matR[][MAX], int i, int j, int n, int cont, int *maxCont, int *vert){
  if(j>=0){
    if (matR[i][j]==1)
      cont++;
    if(i==0){
      if (cont > *maxCont){
        *maxCont=cont;
        *vert=j;
      }
      vertMasAlcanz(matR, n, j-1, n, 0, maxCont, vert);
    }
    else
      vertMasAlcanz(matR, i-1, j, n, cont, maxCont, vert);
  }
}

