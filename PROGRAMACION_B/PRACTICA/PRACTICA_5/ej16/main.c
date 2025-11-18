#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"
#include "colasE.h"
#define MAX_JUG 5
#define CARTAS 40

typedef TPila tvp[MAX_JUG];

void cargaMazo(TPila *pMazo);
void iniciaVec(tvp vecPozos, int n);
void cargaCola(tCola *cTurnos, int n);
void juego(TPila *pMazo, tvp vecPozos, int n);
void puntajes(tvp vecPozos, int n, int *ganador);

int main(){
    int n, ganador;
    tvp vecPozos;
    TPila pMazo;

    cargaMazo(&pMazo);
    printf("Ingrese la cantidad de jugadores(<=5)\n");
    scanf("%d",&n);
    iniciaVec(vecPozos,n);
    juego(&pMazo, vecPozos, n);
    puntajes(vecPozos,n,&ganador);
    printf("El ganador es eL jugador %d",ganador);

    return 0;
}

void cargaMazo(TPila *pMazo){
  FILE *arch;
  TElementoP x;

  iniciaP(pMazo);
  arch=fopen("ej16.txt","rt");
  if (arch==NULL)
    printf("Error al abrir archivo");
  else{
    while (fscanf(arch,"%d %c",&x.valor,&x.palo)==2)
        poneP(pMazo, x);
    fclose(arch);
  }
}

void iniciaVec(tvp vecPozos, int n){
  int i;

  for(i=0; i<n; i++){
    iniciaP(&vecPozos[i]);
  }
}

void cargaCola(tCola *cTurnos, int n){
  int i;

  iniciaC(cTurnos);
  for (i=0; i<n; i++)
    poneC(cTurnos,i);
}

void juego(TPila *pMazo, tvp vecPozos, int n){

  TElementoP carta;
  tCola cTurnos;
  tElementoC x;

  cargaCola(&cTurnos,n);
  while(!vaciaP(*pMazo)){
    sacaP(pMazo,&carta);
    sacaC(&cTurnos,&x);
    poneC(&cTurnos,x);
    poneP(&vecPozos[x],carta);
  }
}

void puntajes(tvp vecPozos, int n, int *ganador){
  int vecAcum[MAX_JUG]={0}, i, pos, max=0;
  TElementoP x;

  for (i=0; i<n; i++)
    while(!vaciaP(vecPozos[i])){
        sacaP(&vecPozos[i],&x);
        if(x.palo==consultaP(vecPozos[i]).palo)
            vecAcum[i]+= x.valor*2;
        else
          vecAcum[i]+= x.valor;
    }

  for (i=0; i<n; i++)
  if (vecAcum[i]>max){
      max=vecAcum[i];
      pos=i;
  }
  *ganador=pos+1;
}
