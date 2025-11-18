#include <stdio.h>
#include <stdlib.h>
#define MAX_CAR 30

typedef char st30[MAX_CAR];

typedef struct nodito{
  st30 nombre;
  int edad;
  char estado;
  struct nodito *sig;}nodito;

typedef nodito* tSubLista;

typedef struct nodo{
  st30 equipo;
  int puntaje;
  tSubLista sub;
  struct nodo *sig;}nodo;

typedef nodo* tLista;

void listaJugadores(tLista l, char letra);
void listaClubes(tLista l, int x);
int verifica(tLista l, st30 e, int p);
void elimina(tLista l);

int main(){
    tLista l;
    char letra;
    int x,p;
    st30 e;

    printf("Ingrese una letra\n");
    scanf(" %c",&letra);
    listaJugadores(l,letra);
    printf("Ingrese un minimo de puntos\n");
    scanf("%d",&x);
    listaClubes(l,x);
    printf("Ingrese un equipo\n");
    scanf("%s",e);
    printf("ingrese un puntaje\n");
    scanf("%d",&p);
    if (verifica(l,e,p))
        printf("El equipo ingresado tiene el puntaje ingresado");
    else
        printf("El equipo ingresado no tiene los puntos ingresados");
    elimina(l);

    return 0;
}

void listaJugadores(tLista l, char letra){
  int cantJug=0,cantJugClub, maxJugClub=0;
  st30 clubMax;
  tLista act;
  tSubLista actS;

  act=l;
  while(act!= NULL){
    printf("Equipo: %s\n",act->equipo);
    actS=act->sub;
    cantJugClub=0;
    printf("Jugdores:\n");
    while(actS != NULL){
      if (actS->nombre[0]==letra){
        printf("%s\n",actS->nombre);
        cantJugClub ++;
      }
      actS=actS->sig;
    }
    if (cantJugClub>maxJugClub){
      maxJugClub=cantJugClub;
      strcpy(clubMax,act->equipo);
    }
    cantJug+= cantJugClub;
    act=act->sig;
  }
  printf("Cantidad de jugadores listados: %d",cantJug);
  printf("El club con mas jugadores que cumplen el criterio: %s",clubMax);

}

void listaClubes(tLista l, int x){
  tLista act;
  tSubLista actS;
  int contJug,acumEdad;

  act=l;
  while(act!=NULL && act->puntaje>=x){
    printf("Club: %s\n",act->equipo);
    printf("Jugadores: \n");
    actS=act->sub;
    contJug=acumEdad=0;
    while(actS!=NULL){
      printf("\t%s",actS->nombre);
      acumEdad +=actS->edad;
      contJug ++;
      actS=actS->sig;
    }
    printf("Edad promedio: %f",(float)acumEdad/contJug);
    act=act->sig;
  }
}

int verifica(tLista l, st30 e, int p){
  tLista act;

  act=l;
  while(act!=NULL && act->puntaje>p)
    act=act->sig;
  //if (act!=NULL && act->puntaje==p){
  while(act!=NULL && act->puntaje==p && act->equipo<e)
    act=act->sig;
  return act!=NULL && act->puntaje==p && strcmp(act->equipo,e)==0;
}

void elimina(tLista l){
  tSubLista actS,antS,elim;

  while(l!=NULL){
    actS=l->sub;
    antS=NULL;
    while(actS!=NULL)
      if(actS->estado=='S'){
        elim=actS;
        actS=actS->sig;
        if(actS==l->sub)
          l->sub=actS;
        else
          antS->sig=acts;
        free(elim);
      }
      else{
        antS=actS;
        actS=actS->sig;
      }
    l=l->sig;
    }
  }
}
