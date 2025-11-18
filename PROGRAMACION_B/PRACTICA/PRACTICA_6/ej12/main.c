#include <stdio.h>
#include <stdlib.h>

typedef struct nodo{
  float prom;
  int cantElem;
  struct nodo *sig;}nodo;

typedef nodo *tListaS;

typedef struct nodito{
  int dato;
  struct nodito *sig;}nodito;

typedef nodito *tSubLista;

typedef struct nodoD{
 int lInf,lSup;
 tSubLista sub;
 struct nodoD *ant, *sig;} nodoD;

typedef nodoD * pNodoD;

typedef struct {
 pNodoD pri, ult;} tListaD;

void generaLista(tListaD ld, tListaS *ls);

int main(){
    tListaS ls;
    tListaD ld;

    //cargaLista(&ld);
    generaLista(ld,&ls);

    return 0;
}

void generaLista(tListaD ld, tListaS *ls){
  pNodoD aux;
  tSubLista auxS;
  int cont,acum,contNo;
  tListaS nuevo,ult;

  (*ls)=NULL;
  if(ld.pri != NULL){
    aux=ld.pri;
    while (aux != NULL){
      cont=acum=contNo=0;
      auxS=aux->sub;
      while (auxS != NULL){
        cont++;
        acum +=auxS->dato;
        if (auxS->dato<aux->lInf || auxS->dato>aux->lSup)
            contNo++;
        auxS=auxS->sig;
      }
      nuevo= (tListaS) malloc(sizeof(nodo));
      nuevo->cantElem=contNo;
      if(cont)
        nuevo->prom=(float)acum/cont;
      else
        nuevo->prom=0;

      nuevo->sig=NULL;
      if(*ls == NULL)
        *ls=nuevo;
      else
        ult->sig=nuevo;
      ult=nuevo;

      aux=aux->sig;
    }
  }
}
