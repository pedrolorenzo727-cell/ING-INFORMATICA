#include <stdio.h>
#include <stdlib.h>
#define MAX 50

int apareceX(float [][MAX], int, int, int, float);
void apareceXV(float [][MAX], int, int, int, float, int *);

int main(){
    float mat[MAX][MAX]={{1.9,9.3,3.2},{-1,3.2,2},{3.2,2,1},{8,7,1}};
    int n=4, m=3, cant;
    float x=3.2;

    printf("La cantidad de veces que aparece %.1f en la matriz es %d \n",x,apareceX(mat,n-1,m-1,m-1,x));
    apareceXV(mat,n-1,m-1,m-1,x,&cant);
    printf("La cantidad de veces que aparece %.1f en la matriz es %d \n",x,cant);

    return 0;
}

int apareceX(float mat[][MAX], int i, int j, int m, float x){
  if (i<0)
    return 0;
  else
    if (j==0)
      return (mat[i][j]==x) + apareceX(mat,i-1,m,m,x);
    else
        return (mat[i][j]==x) + apareceX(mat,i,j-1,m,x);
}

void apareceXV(float mat[][MAX], int i, int j, int m, float x, int *pCant){
  if(i<0)
    *pCant=0;
  else{
    if (j==0)
      apareceXV(mat,i-1,m,m,x,pCant);
    else
      apareceXV(mat,i,j-1,m,x,pCant);

    if (mat[i][j]==x)
      *pCant +=1;
  }

}
