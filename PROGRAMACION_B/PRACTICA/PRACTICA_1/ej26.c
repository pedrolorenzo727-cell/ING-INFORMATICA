#include <stdio.h>

typedef char st15[15];
typedef struct{
    st15 nom;
    unsigned int matricula;
    float promedio;
} tRegAlu;

void leeVariable(tRegAlu *pr);
void muestraVariable(tRegAlu);

int main(){
  tRegAlu alumno;

  leeVariable(&alumno);
  muestraVariable(alumno);

  return 0;
}

void leeVariable(tRegAlu *pr){

  printf("Ingrese el nombre de un alumno\n");
  gets((*pr).nom);
  printf("Ingrese la matricula del alumno\n");
  scanf("%u",&(*pr).matricula);
  printf("Ingrese el promedio del alumno\n");
  scanf("%f",&(*pr).promedio);
}

void muestraVariable(tRegAlu alumno){

  printf("Nombre del alumno %s\n",alumno.nom);
  printf("Matricula del alumno %u\n",alumno.matricula);
  printf("Promedio del alumno %.2f\n",alumno.promedio);
}
