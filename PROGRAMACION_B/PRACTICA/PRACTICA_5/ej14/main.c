#include <stdio.h>
#include "colasE.h"
#include "pilas.h"

void palindroma(tCola *c, int n, int *cumple );

int main(){
    tCola c;
    int i,n,cumple=1;
    tElementoC x;

    iniciaC(&c);
    printf("Ingrese la cantidad de letras de la palabra\n");
    scanf("%d",&n);
    for (i=1; i<=n; i++){
      printf("ingrese la letra %d\n",i);
      scanf(" %c",&x);
      poneC(&c,x);
    }
    palindroma(&c, n, &cumple);
    if(cumple)
      printf("Es palindroma");
    else
        printf("No es palindroma");

    return 0;
}

void palindroma(tCola *c, int n, int *cumple ){
  TPila p;
  TElementoP y;
  tElementoC x;
  int i;

  iniciaP(&p);
  for (i=1; i<=n/2; i++){
    sacaC(c,&x);
    poneP(&p,x);
  }
  if(n%2)
    sacaC(c,&x);
  while(!vaciaC(*c) && *cumple){
    sacaC(c,&x);
    sacaP(&p,&y);
    if(x!=y)
      *cumple=0;
  }
}
