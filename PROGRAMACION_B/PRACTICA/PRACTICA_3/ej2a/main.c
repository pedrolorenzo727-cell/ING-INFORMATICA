#include <stdio.h>
#include <stdlib.h>

int calculaSuma(int vec[], int n);
void muestraVec(int vec[], int n);
void muestraInvertido(int vec[], int n);


int main(){
  int vec[]={6,5,2,0,-5,4,1,-9,3,-6}, n=10;

  printf("La suma de los elementos del vector es %d\n",calculaSuma(vec,n-1));
  muestraVec(vec,n-1); printf("\n");
  muestraInvertido(vec,n-1);

  return 0;
}
// punto |
int calculaSuma(int vec[], int n){
  if (n==0)
    return vec[n];
  else
    return vec[n] + calculaSuma(vec,n-1);
}

//punto ||
void muestraVec(int vec[], int n){
  if (n>=0){
    muestraVec(vec,n-1);
    printf("%d ",vec[n]);
  }
}

//punto |||
void muestraInvertido(int vec[], int n){
  if (n>=0){
    printf("%d ",vec[n]);
    muestraInvertido(vec,n-1);
  }
}

