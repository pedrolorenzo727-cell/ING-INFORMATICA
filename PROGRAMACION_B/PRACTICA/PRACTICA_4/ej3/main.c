#include <stdio.h>
#include <stdlib.h>
#include "contactos.h"

int main(){
    tAgenda agenda;
    int i;
    char res,nom[MAX_NOM];

    iniciarAgenda(&agenda);
    printf("Desea agegar contactos?(S/N)\n");
    scanf("%c",&res);
    while (res=='S'){
        agregaContacto(&agenda);
        printf("Desea agegar otro contacto?(S/N)\n");
        //fflush();
        scanf(" %c",&res);
    }

    listarAgenda(agenda);
    printf("Ingrese un nombre");
    scanf("%s",nom);
    if(buscaContacto(agenda,nom))
        printf("El nombre ingresado pertenece a uno de sus contactos");
    else
        printf("El nombre ingresado no pertenece a uno de sus contactos");

    return 0;
}
