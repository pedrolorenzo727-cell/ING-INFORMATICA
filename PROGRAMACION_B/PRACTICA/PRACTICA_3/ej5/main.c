#include <stdio.h>
#include <stdlib.h>
#define MAX 50

int esSimetrica(int mat[][MAX], int , int, int);

int main(){
    int mat[MAX][MAX]={{2,3,-1},{3,5,4},{-1,4,6}};
    int n=3;

    if (esSimetrica(mat,n-2,n-1,n-1))
      printf("La matriz es simetrica\n");
    else
      printf("La matriz no es simetrica\n");

    return 0;
}

int esSimetrica(int mat[][MAX], int i, int j, int n){

  if (i<0)
    return 1;
  else
    if (mat[i][j] != mat[j][i])
      return 0;
    else
      if (j==i+1)
        return esSimetrica(mat,i-1,n,n);
      else
        return esSimetrica(mat,i,j-1,n);

}
