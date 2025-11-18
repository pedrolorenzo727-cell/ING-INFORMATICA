#include <stdio.h>
#include <string.h>
#include "contactos.h"

void iniciarAgenda(tAgenda *pAgenda){
  pAgenda->n=0;
}

void insertaOrdenado(tAgenda *pAgenda, contacto nuevoCont){
  int j;

  j=pAgenda->n - 1;
  while(j>=0 && strcmp(pAgenda->vecCont[j].nombre,nuevoCont.nombre)>0){
    strcpy(pAgenda->vecCont[j+1].nombre, pAgenda->vecCont[j].nombre);
    strcpy(pAgenda->vecCont[j+1].telefono, pAgenda->vecCont[j].telefono);
    j=j-1;
  }
  strcpy(pAgenda->vecCont[j+1].nombre,nuevoCont.nombre);
  strcpy(pAgenda->vecCont[j+1].telefono,nuevoCont.telefono);
  pAgenda->n +=1;
}

void agregaContacto(tAgenda *pAgenda){
    contacto nuevoCont;

    printf("Ingrese el nombre del contacto: \n");
    scanf("%s",nuevoCont.nombre);
    printf("Ingrese el telefono: \n");
    scanf("%s",nuevoCont.telefono);
    insertaOrdenado(pAgenda,nuevoCont);
}

void listarAgenda(tAgenda agenda){
    int i;

    printf("Contacto  Nombre    Telefono\n");
    for (i=0; i<agenda.n; i++)
        printf("%-4u%-10s%-12s\n",i,agenda.vecCont[i].nombre,agenda.vecCont[i].telefono);
}

int buscaContacto(tAgenda agenda, char nombre[]){
    int i;

    i=0;
    while(i<agenda.n-1 && strcmp(agenda.vecCont[i].nombre,nombre)<0 )
        i +=1;
    if (strcmp(agenda.vecCont[i].nombre,nombre)==0)
        return 1;
    else
        return 0;
}

