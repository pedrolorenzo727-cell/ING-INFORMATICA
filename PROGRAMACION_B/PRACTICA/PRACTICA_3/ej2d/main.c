#include <stdio.h>
#include <stdlib.h>
#define MAX 50

void devuelveMaximos(int [][MAX], int [], int, int, int, int);
void muestraVec(int [], int);


int main(){
    int mat[MAX][MAX]={{1,9,3},{-1,0,2},{3,2,1},{8,7,1}};
    int n=4, m=3;
    int vec[MAX];

    devuelveMaximos(mat,vec,n-1,m-1,m-1,-9999);
    muestraVec(vec,n);

    return 0;
}

void devuelveMaximos(int mat[][MAX], int vec[], int i, int j, int m, int max){
  if (i>=0){
    if (mat[i][j]>max)
      max=mat[i][j];

    if (j==0){
        vec[i]=max;
        devuelveMaximos(mat,vec,i-1,m,m,-9999);
    }
    else
        devuelveMaximos(mat,vec,i,j-1,m,max);

  }
}

void muestraVec( int vec[], int n){
  int i;

  printf("Los maximos de cada fila de la matriz son:\n");
  for (i=0; i<n; i++)
    printf("%d ",vec[i]);
}
