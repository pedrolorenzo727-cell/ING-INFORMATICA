#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"

void comprueba(TPila *P);
int seCorresponde(int aux, int x);

int main(){
    TPila P;

    comprueba(&P);

    return 0;
}

/*void comprueba(TPila *P){
  FILE *arch;
  TElementoP x;
  int cumple=1;

  iniciaP(P);
  arch=fopen("ej10.txt","rt");
  if (arch==NULL)
    printf("Error al abrir el archivo");
  else{
    while (fscanf(arch,"%c",&x)==1 && cumple )
        if (x=='(')
          poneP(P,x);
        else
        if (x==')'){
          if (vaciaP(*P))
            cumple=0;
          else
            sacaP(P,&x);

        }
    if (cumple && vaciaP(*P))
        printf("Cumple");
    else
        printf("No cumple");
    fclose(arch);
  }
}*/

int seCorresponde(int aux, int x){

switch (aux){
  case '(': return x==')';
            break;
  case '[': return x==']';
            break;
  case '{': return x=='}';
            break;
}

}

void comprueba(TPila *P){
  FILE *arch;
  TElementoP x,aux;
  int cumple=1;

  iniciaP(P);
  arch=fopen("ej10.txt","rt");
  if (arch==NULL)
    printf("Error al abrir el archivo");
  else{
    while (fscanf(arch,"%c",&x)==1 && cumple )
        if (x=='(' || x=='[' || x=='{')
          poneP(P,x);
        else
        if (x==')' || x==']' || x=='}'){
          if (vaciaP(*P))
            cumple=0;
          else{
            aux=consultaP(*P);
            if (seCorresponde(aux,x))
              sacaP(P,&x);
            else
                cumple=0;
          }

        }
    if (cumple && vaciaP(*P))
        printf("Cumple");
    else
        printf("No cumple");
    fclose(arch);
  }
}
