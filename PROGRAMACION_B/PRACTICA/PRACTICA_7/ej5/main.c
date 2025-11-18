#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_CAD 50

typedef struct nodo{
    char dato[MAX_CAD];
    struct nodo *izq, *der;
} nodo;

typedef nodo * tArbol;

void addnodo(tArbol* a, char cad[]);
//void profundidad(tArbol a, int *prof, int niv);
//void longCadMasLar(tArbol a, int *longitud);
int cantHijosDer(tArbol a);
int profundidad(tArbol a);
int longCadMasLar(tArbol a);

int main(){
  tArbol a;
  int prof=0,longitud=0;

  addnodo(&a, "Casa");
  addnodo(&a->izq, "Arbol");
  addnodo(&a->izq->izq, "Jardin88888");
  addnodo(&a->izq->der, "Boca");
  addnodo(&a->der, "Museo");
  addnodo(&a->der->izq, "Futbol");
  addnodo(&a->der->izq->der, "Basquet456");
  addnodo(&a->der->izq->der->der, "Pileta");
  addnodo(&a->der->izq->der->izq, "Cancha");

  //profundidad(a,&prof,1);
  printf("La profundidad del arbol es %u\n",profundidad(a));
  //longCadMasLar(a,&longitud);
  printf("La longitud de la cadena mas larga es %u caracteres\n", longCadMasLar(a));
  printf("La cantidad de hijos derechos del arbol es %u\n",cantHijosDer(a));


 return 0;

}

void addnodo(tArbol* a, char cad[]) {
    *a = (tArbol)malloc(sizeof(nodo));
    strcpy((*a)->dato, cad);
    (*a)->izq = NULL;
    (*a)->der = NULL;
}

/*void profundidad(tArbol a, int *prof, int niv ){
  if (a!=NULL){
    if( niv > *prof)
        (*prof) ++;
    profundidad(a->izq,prof,niv+1);
    profundidad(a->der,prof,niv+1);
  }
}//plantearlo int
*/
int profundidad(tArbol a ){
 int profIzq, profDer;

 if (a != NULL){
    profIzq=profundidad(a->izq);
    profDer=profundidad(a->der);
    return (profIzq>profDer)? profIzq + 1:profDer + 1;
 }
 else
    return 0;
}

/*void longCadMasLar(tArbol a, int *longitud){
  if (a!=NULL){
    if(strlen(a->dato) > *longitud)
      *longitud = strlen(a->dato);
    longCadMasLar(a->izq,longitud);
    longCadMasLar(a->der,longitud);
  }
}//plantear int*/

int longCadMasLar(tArbol a){
  int aux1,aux2,act;

  if (a != NULL){
    aux1=longCadMasLar(a->izq);
    aux2=longCadMasLar(a->der);
    act=strlen(a->dato);
    if(act>=aux1 && act>=aux2)
      return act;
    else
      if (aux1>=aux2)
        return aux1;
      else
        return aux2;
  }
  else
    return 0;

}

int cantHijosDer(tArbol a){
  if (a!= NULL)
    return (a->der != NULL) + cantHijosDer(a->izq) + cantHijosDer(a->der);
  else
    return 0;
}
