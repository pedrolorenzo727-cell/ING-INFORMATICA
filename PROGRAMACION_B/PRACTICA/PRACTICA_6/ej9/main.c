#include <stdio.h>
#include <stdlib.h>

typedef struct nodo{
 int dato;
 struct nodo * sig;} nodo;

typedef nodo * tLista;

typedef struct nodoD{
 int dato;
 struct nodoD *ant, *sig;} nodoD;

typedef nodoD * pNodoD;

typedef struct {
 pNodoD pri, ult;} tListaD;

void cargaLista(tLista *ls);
void copiaListas (tLista ls, tLista *lc, tListaD *ld);

int main(){
    tLista ls,lc;
    tListaD ld;

    cargaLista(&ls);
    copiaListas(ls, &lc, &ld);

    return 0;
}

void cargaLista(tLista *ls){
  FILE *arch;
  int num;
  tLista aux;

  *ls=NULL;
  arch=fopen("ej9.txt","rt");
  if(arch==NULL)
    printf("Error al abrir el archivo\n");
  else{
    while (fscanf(arch,"%d ",&num)==1){
      aux= (tLista) malloc(sizeof(nodo));
      aux->dato = num;
      aux->sig = *l;
      *l=aux;
    }
    fclose(arch);
  }
}

void copiaListas(tLista ls, tLista *lc, tListaD *ld){
   pNodoD nuevoD;
   tLista auxC,ant,pri;

   ld->pri=NULL;
   ld->ult=NULL;

   while(ls != NULL){
    nuevoD=(pNodoD) malloc(sizeof(nodoD));
    nuevoD->dato=ls->dato;
    nuevoD->sig=NULL;

    if(ld.pri==NULL){
      (*ld).pri=nuevoD;
       nuevoD->ant=NULL;
       (*ld).ult=nuevoD;
    }
    else{
        nuevoD->ant=(*ld).ult;
        nuevoD->ant->sig=nuevo;
        (*ld).ult=nuevoD;
    }

    ls=ls->sig;
   }

  *lc=NULL;
  while(ls != NULL){
    nuevoC=(tLista) malloc(sizeof(nodo));
    nuevoC->dato=ls->dato;
    *lc=nuevoC;

    if(*lc==NULL)
      pri=nuevoC;
    else
      ant->sig=nuevoC;
    nuevoC->sig=pri;
    ant=nuevoC;

    ls=ls->sig;
  }
}
