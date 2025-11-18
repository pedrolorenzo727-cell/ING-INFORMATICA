#include <stdio.h>

void main() {
  int num,suma=0;
  FILE *arch;

  arch= fopen("ej28.txt","rt");
  while (fscanf(arch,"%u",&num)==1){
    suma+= num;
    printf("%d ",num);
  }
  fclose(arch);
  printf("La suma de los numeros es %d",suma);
}

