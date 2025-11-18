#include <stdio.h>
#include <stdlib.h>

int minimo(int [][3], int, int, int);

int main(){
    int mat[3][3]={{-3,2,1},{0,5,6},{3,9,5}};
    int n=3;

    printf("El minimo de la matriz es %d\n",minimo(mat,n-1,n-1,n-1));

    return 0;
}

int minimo (int mat [][3], int i, int j, int n){
  int aux;

  if (i==0 && j==0)
    aux=mat[i][j];
  else{
    if (j==0)
      aux= minimo(mat,i-1,n,n);
    else
        aux= minimo(mat,i,j-1,n);
    if (mat[i][j]<aux)
        aux=mat[i][j];
  }
  return aux;

}
