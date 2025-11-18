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
    muestraDNISinv(&P,n); printf("\n");
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

  if (n){
    sacaP(P,&x);
    printf(" %s -",x.dato);
    muestraDNISinv(P,n-1);
    poneP(P,x);
  }
}

void muestraDNISord(TPila *P, int n){
  TElementoP x;

  if(n){
    sacaP(P,&x);
    muestraDNISord(P,n-1);
    printf(" %s -",x.dato);
    poneP(P,x);
  }
}
