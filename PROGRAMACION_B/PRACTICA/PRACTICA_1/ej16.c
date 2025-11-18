#include <stdio.h>

void convierte(unsigned int);

void main(){
  unsigned int segs;

  printf("Ingrese una cantidad de segundos \n");
  scanf("%u",&segs);
  convierte(segs);
}

void convierte (unsigned int segs){
  unsigned int horas=0, mins=0;

  if (segs>59){
    mins = segs/60;
    segs = segs - mins*60;
    if (mins>59){
      horas = mins/60;
      mins = mins - horas*60;
    }
  }
  printf("%u Horas %u Minutos %u Segundos",horas,mins,segs);
}
