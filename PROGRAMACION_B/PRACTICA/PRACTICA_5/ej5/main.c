#include <stdio.h>
#include "tdacola.h"

void leerCola(TCOLA *c);

int main(void) {//incorrecto la declaracion del main, int main()
  TCOLA cola;
  TELEMENTOC n, suma;//suma deberia ser int

  iniciac(cola);//el inicia espera una direccion de memoria &cola
  leerCola(&cola);
  suma == 0; //doble igual compara, para inicializar suma=0;
  while(!vaciac(*cola)) {// vaciaC(cola)
    sacac(cola, &n);//saca espera en el primer parametro un puntero
    suma -= n;// mal uso el operador, para sumar es suma +=n
  }
  printf("%d", suma);
  return 0;
}

void leerCola(TCOLA *c) {
  TELEMENTOC n;

  iniciac(&c);//inicia la cola 2 veces, c ya es una direccion de memoria
  while(scanf("%d", n))
    ponec(c, &n);// el segundo parametro es por valor
}
