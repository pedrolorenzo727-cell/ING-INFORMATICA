#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "colasE.h"
#include "pilas.h"
#define ABC 27

typedef TPila tvc[ABC];

void cargaCola(tCola *c);
void iniciaVec(tvc vecComp);
void cargaPilas(tvc vecComp, tCola *c);
void muestra(TPila *p, char letra);

int main(){
  tvc vecComp;
  char letra;
  tCola c;

  cargaCola(&c);
  iniciaVec(vecComp);
  cargaPilas(vecComp,&c);
  printf("Ingrese una letra del abecedario\n");
  scanf(" %c",&letra);
  letra=toupper(letra);
  muestra(&vecComp[letra-'A'],letra);

  return 0;
}

void cargaCola(tCola *c){
  FILE *arch;
  tElementoC x;

  iniciaC(c);
  arch=fopen("ej15.txt","rt");
  if (arch==NULL)
    printf("Error al abrir archivo");
  else{
    while(fscanf(arch,"%s %s",x.nombre,x.apellido)==2)
        poneC(c,x);
    fclose(arch);
  }
}

void iniciaVec(tvc vecComp){
  int i;

  for(i=0; i<27; i++)
    iniciaP(&vecComp[i]);
}

void cargaPilas(tvc vecComp, tCola *c){
  tElementoC elemC;

  while(!vaciaC(*c)){
    sacaC(c,&elemC);
   // strcpy(elemP.apellido,elemC.apellido);
   // strcpy(elemP.nombre,elemC.nombre);
   // elemP=elemC;
    poneP(&vecComp[elemC.apellido[0]-'A'],elemC);
  }
}

void muestra(TPila *p, char letra){
  TElementoP elem;

  if (!vaciaP(*p)){
    printf("Los competidores de apellido empezado por %c son:\n",letra);
    while(!vaciaP(*p)){
      sacaP(p,&elem);
      printf("%s\t %s\n",elem.apellido,elem.nombre);
    }
  }
  else
    printf("No se registraron competidores con apellido empezado por %c",letra);
}
