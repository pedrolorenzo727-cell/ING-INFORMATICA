#include <stdio.h>

void Cuadrado(unsigned int);

void main(){
  unsigned int n;

  printf("Ingrese un N \n");
  scanf(" %u",&n);
  Cuadrado(n);
}

void Cuadrado(unsigned int n){
  unsigned int i=1,j;

  for (;i<=n; i++){
    for (j=1;j<=n;j++)
      if (i==1 || i==n || j==1 || j==n)
        printf(" #");
    else
        printf("  ");
    printf("\n");
  }
}
