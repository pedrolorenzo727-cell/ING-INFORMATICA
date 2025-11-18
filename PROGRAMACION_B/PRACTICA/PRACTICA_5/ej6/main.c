#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"

void cargaPila(TPila *P);
void cuentaCeros(TPila *P);
void obtienePromedio(TPila *P);
void calculaMaxMin(TPila *P);
void elimina(TPila *P);

int main(){
    TPila P;

    cargaPila(&P);
    cuentaCeros(&P);
    obtienePromedio(&P);
    calculaMaxMin(&P);
    elimina(&P);

    return 0;
}

void cargaPila(TPila *P){
  FILE *arch;
  int num;

  iniciaP(P);
  arch=fopen("ej6.txt","rt");
  if (arch==NULL)
    printf("No se pudo abrir el archivo");
  else{
    while(fscanf(arch,"%d",&num)==1)
      poneP(P,num);
    fclose(arch);
  }
}

void cuentaCeros(TPila *P){
  TPila Paux;
  TElementoP x;
  int cont=0;

  iniciaP(&Paux);
  while (!vaciaP(*P)){
    sacaP(P,&x);
    if (x==0)
      cont ++;
    poneP(&Paux,x);
  }
  while (!vaciaP(Paux)){
    sacaP(&Paux,&x);
    poneP(P,x);
    }
  printf("La cantidad de ceros de la pila son: %d\n",cont);
}

void obtienePromedio(TPila *P){
  int acum=0,cont=0;
  TPila Paux;
  TElementoP x;

  iniciaP(&Paux);
  while(!vaciaP(*P)){
    cont++;
    sacaP(P,&x);
    acum +=x;
    poneP(&Paux, x);
  }
  if (cont)
    printf("El promedio de los elementos es: %.2f\n",(float)acum/cont);
  else
    printf("No hay valores en la pila");

  while(!vaciaP(Paux)){
    sacaP(&Paux,&x);
    poneP(P,x);
  }
}

void calculaMaxMin(TPila *P){
  TPila Paux;
  TElementoP x;
  int max,min;

  max=min=consultaP(*P);

  iniciaP(&Paux);
  while(!vaciaP(*P)){
    sacaP(P,&x);
    if (x>max)
      max=x;
    else
      if (x<min)
        min=x;
    poneP(&Paux, x);
  }

  printf("El valor maximo de la Pila es: %d\n",max);
  printf("El valor minimo de la pila es: %d\n",min);

  while(!vaciaP(Paux)){
    sacaP(&Paux,&x);
    poneP(P,x);
  }
}

void elimina(TPila *P){
  TPila Paux;
  TElementoP x;
  int ult;

  iniciaP(&Paux);
  while (!vaciaP(*P)){
    sacaP(P,&x);
    poneP(&Paux,x);
  }
  ult=x;
  while(!vaciaP(Paux)){
    sacaP(&Paux,&x);
    if (x<=ult)
      poneP(P,x);
  }
  /*while(!vaciaP(*P)){
    sacaP(P,&x);
    printf("%d ",x);
  }*/
}

