#include <stdio.h>
#include <stdlib.h>
#define MAX 10

typedef struct nodo{
  int dato;
  struct nodo *sig;}nodo;

typedef nodo * tLista;

/*typedef struct{
  int indice;
  tLista l;} tDato;
*/
int gradoEntrada(tLista vecList[], int vert, int n);
int gradoSalida(tLista vecList[], int vert);
int bucle(tLista vecList[], int vert);


int main()
{
    tLista vecList[MAX];
    int gEnt,gSal, vert, n;

    //cargaVec(vecList, &n);

    printf("Ingrese un vertice\n");
    scanf("%d",&vert);
    gEnt=gradoEntrada(vecList, vert-1,n);
    printf("El grado de entrada del vertice es %d\n",gEnt);
    gSal=gradoSalida(vecList,vert-1);
    printf("El grado de salida del vertice es %d\n",gSal);
    printf("El grado total del vertice es %d\n",gSal+gEnt-bucle(vecList,vert-1));

    return 0;

}

int gradoEntrada(tLista vecList[], int vert, int n){
  tLista aux;
  int i, cont=0, encuentra;

  for (i=0; i<n; i++){
    aux=vecList[i];
    encuentra=0;
    while (aux!=NULL && !encuentra){
      if (aux->dato==vert){
        cont++;
        encuentra=1;
      }
      aux=aux->sig;
    }
  }
  return cont;
}

int gradoSalida(tLista vecList[], int vert){
  int cont;
  tLista aux;

  aux=vecList[vert];

  while(aux!=NULL){
    cont++;
    aux=aux->sig;
  }

  return cont;
}

int bucle(tLista vecList[], int vert){
  tLista aux;
  int existe=0;

  aux=vecList[vert];
  while(aux!=NULL && !existe){
    existe=aux->dato==vert;
    aux=aux->sig;
  }

  return existe;
}
