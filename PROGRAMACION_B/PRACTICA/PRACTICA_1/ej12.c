#include <stdio.h>

void main() {
  int num,suma=0;
  printf("Ingrese un numero natural (0 para finalizar)\n");
  scanf(" %d",&num);
  while (num!=0) {
    suma+= num;
    scanf("%d",&num);
  }
  printf("La suma de los numeros es %d",suma);
}
