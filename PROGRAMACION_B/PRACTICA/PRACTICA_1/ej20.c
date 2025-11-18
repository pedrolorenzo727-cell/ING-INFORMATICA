#include <stdio.h>

void convierte(int [],unsigned int *,int);
void muestra(int [], unsigned int);

void main(){
  unsigned int n=0;
  int num,vec[10];

  printf("Ingrese un numero decimal\n");
  scanf(" %d",&num);
  convierte(vec,&n,num);
  muestra(vec,n);
}

void convierte(int vec[], unsigned int *pn, int num){
  while (num>0){
    vec[*pn] = num%2;
    *pn += 1;
    num /= 2;
  }
}
void muestra(int vec[], unsigned int n){
  int i;

  printf("El numero en binario es: \n");
  if (!n)
    printf("0");
  else
    for (i=n-1;i>=0; i--)
      printf("%d",vec[i]);
}
