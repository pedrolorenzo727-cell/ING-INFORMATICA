/*
#define <stdio.h>
#define N 9
int i;
for(i = 1; I < N; i++);
 printf("%d", &I);

 Errores:
   1- la variable i en la expresion 2 del for debe ir en minuscula y en el printf tambien
   2- N debe valer 16 o que la condicion sea i <= N con N=15
   3- muestra todos los numeros, debe mostrar solo impares
   4- no esta definido el main
   5- La directiva #define <stdio.h> es incorrecta, las librerias se incorporan con la directiva #include
   6- En el printf no va el&
   7- Al final de la sentencia del for no va ;
  Codigo corregido:
*/
#include <stdio.h>
#define N 16
void main() {
  int i;
  for(i = 1; i < N; i+=2)
    printf(" %d",i);
}
