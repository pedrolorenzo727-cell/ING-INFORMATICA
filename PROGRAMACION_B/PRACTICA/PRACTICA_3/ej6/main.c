#include <stdio.h>
#include <stdlib.h>
#define MAX 50

int verifica(int [][MAX], int, int, int, int , int, int);

int main(){
    int mat[MAX][MAX]={{1,6,15},{-1,3,2},{2,2,1},{8,1,1}};
    int n=4, m=3;

    if (verifica(mat,0,0,n-1,m-1,0,0))
      printf("la matriz cumple\n");
    else
      printf("la matriz no cumple\n");

    return 0;
}

int verifica(int mat [][MAX], int i, int j, int n, int m, int suma, int sumaAnt){
  if (j>m)
    return 1;
  else{
    suma +=mat[i][j];
    if (i<n)
      return verifica(mat,i+1,j,n,m,suma,sumaAnt);
    else
        if (j==0)
          if (suma % 2 ==0)
            return verifica(mat,0,j+1,n,m,0,suma);
          else
            return 0;
        else
          if (suma>sumaAnt)
            return verifica(mat,0,j+1,n,m,0,suma);
          else
            return 0;
    }
  }



