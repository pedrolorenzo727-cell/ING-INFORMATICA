#define max(a,b) (((a)>(b))? (a):(b))
#define alfab(c) ((((c) >= 'A' && (c) <= 'Z') || ((c) >= 'a' && (c) <= 'z') ? 1 : 0))
#include <stdio.h>

void main() {
  int a,b;
  char c;
  printf("Ingrese dos numeros enteros\n");
  scanf("%d %d",&a,&b);
  printf("El maximo de los dos es %d\n",max(a,b));
  printf("Ingrese un caracter\n");
  scanf(" %c",&c);
  if (alfab(c))
    printf("El caracter es alfabetico");
  else
    printf("El caracter no es alfabetico");
}
