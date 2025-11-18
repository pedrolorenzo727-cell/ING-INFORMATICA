#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"

void cargaPilas(TPila *P1, TPila *P2);
void sumaPilas(TPila *P1, TPila *P2, TPila *Psum);
void muestra(TPila *Psum);

int main(){
    TPila P1,P2, Psum;

    cargaPilas(&P1,&P2);
    sumaPilas(&P1,&P2,&Psum);
    muestra(&Psum);

    return 0;
}

void cargaPilas(TPila *P1, TPila *P2){
  TElementoP x;
  int n,i;

  iniciaP(P1); iniciaP(P2);
  printf("Ingrese la cantidad de digitos del primer numero\n");
  scanf("%d",&n);
  for (i=1; i<=n; i++){
    printf("Digito %d: ",i);
    scanf("%d",&x);
    poneP(P1,x);
  }

  printf("Ingrese la cantidad de digitos del segundo numero\n");
  scanf("%d",&n);
  for (i=1; i<=n; i++){
    printf("Digito %d: ",i);
    scanf("%d",&x);
    poneP(P2,x);
  }
}

void sumaPilas(TPila *P1, TPila *P2, TPila *Psum){
    TElementoP x,y;
    int aux=0,sum;

    iniciaP(Psum);
    while (!vaciaP(*P1) && !vaciaP(*P2)){
      sacaP(P1,&x); sacaP(P2,&y);
      sum= x + y + aux;
      if (sum>9){
        aux=1;
        poneP(Psum,sum%10);
      }
      else{
        aux=0;
        poneP(Psum,sum);
      }
    }
    while (!vaciaP(*P1)){
        sacaP(P1,&x);
        poneP(Psum,x);
    }
    while (!vaciaP(*P2)){
        sacaP(P2,&x);
        poneP(Psum,x);
    }
}

void muestra(TPila *Psum){
  TElementoP x;

  while(!vaciaP(*Psum)){
    sacaP(Psum,&x);
    printf("%d",x);
  }
}
