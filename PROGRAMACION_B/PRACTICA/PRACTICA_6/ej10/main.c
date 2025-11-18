#include <stdio.h>
#include <stdlib.h>

typedef struct nodoD{
 char dato;
 struct nodoD *ant, *sig;} nodoD;

typedef nodoD * pNodoD;

typedef struct {
 pNodoD pri, ult;} tListaD;

int esPalindroma(tListaD ld);

int main(){
    tListaD ld;

    if(esPalindroma(ld))
      printf("La palabra es palindroma");
    else
      printf("La palabra no es alindroma");

    return 0;
}

int esPalindroma(tListaD ld){
  pNodoD auxP,auxU;

  if(ld.pri != NULL){
    auxP=ld.pri;
    auxU=ld.ult;
    while(auxP->ant != auxU && auxP!=auxD && auxP->dato==auxU->dato){
      auxP=auxP->sig;
      auxU=auxU->ant;
    }

    return auxP->ant==auxU || auxP==auxD;
  }
}
