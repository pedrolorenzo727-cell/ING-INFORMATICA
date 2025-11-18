#include "pilas.h"
#include <stdlib.h>

void poneP(tPila *P, tElementoP x) {
 tPila N;
   N = (tPila)malloc(sizeof(nodop));
   N->dato = x;
   N->sig = *P;
   *P=N;
}
void sacaP(tPila *P, tElementoP * x) {
 tPila N;
 if (*P) { // if (*P != NULL)
   N = *P;
   *x = (*P)->dato;
   *P = (*P)->sig;
   free(N);
 }
}

tElementoP consultaP(tPila P) {
if (P) // if (P != NULL)
 return P->dato;
}

int vaciaP(tPila P) {
return (P == NULL);
}

void iniciaP(tPila *P) {
*P =NULL;
}
