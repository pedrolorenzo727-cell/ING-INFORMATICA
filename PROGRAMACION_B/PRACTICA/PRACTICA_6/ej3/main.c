#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX 10

typedef char st10[MAX];

typedef struct nodo{
  st10 palabra;
  int frecu;
  struct nodo *sig;}nodo;

typedef nodo * tLista;

void generaLista(tLista *l);
void muestraLista(tLista l);

int main(){
    tLista l;

    generaLista(&l);
    muestraLista(l);

    return 0;
}

void generaLista(tLista *l){
  FILE *arch;
  st10 palabra;
  tLista aux,ant,nuevo;

  *l=NULL;
  arch=fopen("ej3.txt","rt");
  if (arch==NULL)
    printf("Error a abrir el archivo");
  else{
    while(fscanf(arch,"%s ",palabra)==1){
      aux=*l;
      ant=NULL;
      while(aux != NULL && strcmp(palabra,aux->palabra)>0){
        ant=aux;
        aux=aux->sig;
      }
      if (aux!=NULL && strcmp(palabra,aux->palabra)==0)
        aux->frecu+=1;
      else{
        nuevo=(tLista) malloc(sizeof(nodo));
        strcpy(nuevo->palabra,palabra);
        nuevo->frecu=1;
        if (aux==*l){
          nuevo->sig=*l;
          *l=nuevo;
        }
        else{
            nuevo->sig=aux;
            ant->sig=nuevo;
        }
      }
    }
  }
  fclose(arch);
}
void muestraLista(tLista l){
  tLista aux;

  aux=l;
  while(aux!=NULL){
    printf("%s %d\n",aux->palabra, aux->frecu);
    aux = aux->sig;
  }
}
