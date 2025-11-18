#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"

void ingresaDNIS(TPila *P);
void muestraDNISinv(TPila *P, int n);
void muestraDNISord(TPila *P, int n);

int main(){
    TPila P;
    int n;

    iniciaP(&P);
    ingresaDNIS(&P);
    printf("Ingresa N");
    scanf("%d",&n);
    muestraDNISinv(&P,n);
    muestraDNISord(&P,n);

    return 0;
}

void ingresaDNIS(TPila *P){
  TElementoP x;
  char res;

  printf("Desea ingresar un DNI?\n");
  scanf("%c",&res);
  while(res=='S'){
    printf("Ingrese un dni\n");
    scanf("%s", x.dato);
    poneP(P,x);
    printf("Desea ingresar un DNI?\n");
    scanf(" %c",&res);
  }
}

void muestraDNISinv(TPila *P, int n){
  TElementoP x;
  TPila Paux;
  int i;

  printf("Muestra en orden inverso\n");
  iniciaP(&Paux);
  for (i=1; i<=n; i++) {
    sacaP(P,&x);
    printf(" %s -",x.dato);
    poneP(&Paux,x);
  }

  printf("\n")
  while(!vaciaP(Paux)){
    sacaP(&Paux,&x);
    poneP(P,x);
  }
}

void muestraDNISord(TPila *P, int n){
  TElementoP x;
  TPila Paux;
  int i;

  iniciaP(&Paux);
  for (i=1; i<=n; i++) {
    sacaP(P,&x);
    poneP(&Paux,x);
  }

  printf("Muestra en orden de sufragio\n");
  while(!vaciaP(Paux)){
    sacaP(&Paux,&x);
    printf(" %s -",x.dato);
    poneP(P,x);
  }
}



