#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_CAR 20
#define ABC 26

typedef struct nodito{
  char titulo[MAX_CAR], autor[MAX_CAR];
  int anioEd;
  struct nodito* sig;}nodito;

typedef nodito* tSubLista;

typedef struct nodo{
  char autor[MAX_CAR];
  tSubLista sub;
  struct nodo* sig;}nodo;

typedef nodo* tLista;

typedef tListaA autores[ABC];

typedef struct nodoS{
  char socio[MAX_CAR];
  tSubLista sub;
  struct nodoS* sig;}nodoS;

typedef nodoS* tListaS;

void agregaLibro(autores vec[], char titulo[MAX_CAR], char autor[MAX_CAR], int anioEd);
void prestamo(autores vec[], tListaS l, char titulo[MAX_CAR], char autor[MAX_CAR], int anioEd, char socio[MAX_CAR]);
void devolucion(autores vec[], tListaS l, char titulo[MAX_CAR], char autor[MAX_CAR], int anioEd, char socio[MAX_CAR]);

int main(){
    autores vec[MAX_CAR];
    tListaS l;
    char titulo[MAX_CAR], autor[MAX_CAR], socio[MAX_CAR];
    int anioEd;

    //iniciaListas(vec);
    //cargaListas(vec);
    //cargaListaS(&l);

    printf("Ingrese los datos de un libro\n");
    scanf("%s %s %d",titulo, autor, &anioEd);
    agregaLibro(vec,titulo,autor,anioEd);

    printf("Ingrese los datos de un libro\n");
    scanf("%s %s %d",titulo, autor, &anioEd);
    printf("Ingrese el nombre del socio que solicita el libro\n");
    scanf("%s",socio);
    prestamo(vec,l,titulo,autor,anioEd,socio);
    devolucion(vec,l,titulo,autor,anioEd,socio);

    return 0;
}

void agregaLibro(autores vec[], char titulo[MAX_CAR], char autor[MAX_CAR], int anioEd){
  tSubLista actS, ants, nuevo;
  tLista act,ant, nuevoL;


  nuevo=(tSubLista) malloc(sizeof(nodito));
  nuevo->anioEd=anioEd;
  strcpy(nuevo->autor,autor);
  strcpy(nuevo->titulo,titulo);


  act=vec[autor[0]-'A'];
  while(act!=NULL && strcmp(act->autor,autor)<0){
    ant=act;
    act=act->sig;
  }
  if (act != NULL && strcmp(act->autor,autor)==0){
    actS=act->sub;
    antS=NULL;
    while(actS!=NULL && strcmp(actS->titulo,titulo)<0){
      antS=actS;
      actS=actS->sig;
    }
    nuevo->sig=actS;
    if (actS==act->sub)
      act->sub=nuevo;
    else
      antS->sig=nuevo;
  }
  else{
    nuevoL= (tLista) malloc(sizeof(nodo));
    strcpy(nuevoL->autor,autor);
    nuevoL->sub=nuevo;
    nuevo->sig=NULL;
    if (act==vec[autor[0]-'A']){
      nuevoL->sig=NULL;
      vec[autor[0]-'A']=nuevoL;
     }
    else{
        ant->sig=nuevoL;
        nuevoL->sig=act;
    }
  }
}

void inserta(autores vec[], char socio[MAX_CAR], tSubLista libro, tListaS l){
  tSubLista actS,antS;
  tListaS antSoc;

  antS=NULL;
  while(l!=NULL && strcmp(l->socio,socio)!=0){
    antSoc=l;
    l=l->sig;
  }
  if(l!=NULL && strcmp(l->socio,socio)==0){
    actS=l->sub;
    antS=NULL;
    while(actS!=NULL && strcmp(actS->titulo,titulo)<0){
      antS=actS;
      actS=actS->sig;
    }
    libro->sig=actS;
    if (actS==l->sub)
      l->sub=libro;
    else
      antS->sig=libro;
  }
}


void prestamo(autores vec[], tListaS l, char titulo[MAX_CAR], char autor[MAX_CAR], int anioEd, char socio[MAX_CAR]){
  tSubLista actS, antS;
  tLista act;

  act=vec[autor[0]-'A'];
  while(act!=NULL && strcmp(act->autor,autor)<0)
    act=act->sig;
  if(act != NULL && strcmp(act->autor,autor)==0){
    actS=act->sub;
    antS=NULL;
    while(actS!=NULL && strcmp(actS->titulo,titulo)<0){
      antS=actS,
      actS=actS->sig;
    }
    if (actS != NULL && strcmp(actS->titulo,titulo)==0){
      if(actS==act->sub)
        act->sub=actS->sig;
      else
        antS->sig=actS->sig;

      inserta(vec,socio,actS,l);
  }
}

