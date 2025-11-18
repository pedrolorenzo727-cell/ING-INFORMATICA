#include <stdio.h>
#include <stdlib.h>
#include <n.ario>

int cantNodos(tArbol a, tPos p);
int clavesPares(tArbol a, tPos p);
int gradoArb(tArbol a, tPos p);
int cantNodos(tArbol a, tPos p, int niv);
int claveIgualCantHijos(tArbol a, tPos p);
void calaveIgualHijos(tArbol a, tPos p, int *cumple);
void promClaves(tArbol a, tPos p, int niv, int *cant, int *acum)

int main()
{
    tArbol a;
    int aux, cumple, cant, acum, k;

    printf("La cantidad de nodos que posee el arbol son %d\n", cantNodos(a,raiz(a)));
    aux=clavesPares(a,raiz(p));
    if (aux)
        printf("El porcentaje de claves pares es %.1f%%\n",(float)aux/cantNodos(a,raiz(p))*100);
    else
        printf("No hay nodos en el arbol\n");

    printf("El grado del arbol es %d\n"gradoArb(a,raiz(p)));
    printf("La cantidad de nodos de grado impar que hay en niveles impares son %d\n",cantNodos(a,raiz(p),1));
    if (claveIgualCantHijos(a,raiz(p))
        printf("El arbol cumple\n");
    else
        printf("El arbol no cumple\n");
    cumple=1;
    calaveIgualHijos(a,raiz(p), &cumple);
    cant=acum=0;
    printf("Ingrese un nivel para obtener el promedio de sus claves\n");
    scanf("%d",&k);
    promClaves(a, raiz(p), 1, k, &cant, &acum);
    if (cant)
      printf("El promedio de las claves del nivel %d es %.1f\n", k, (float)acum/cant);
    else
        printf("No existen claves en el nivel %d\n",k);

    return 0;
}

//inciso a
int cantNodos(tArbol a, tPos p){
  tPos aux;
  int cont=0;

  if (!nulo(p)){
    cont++;
    aux=hijoMasIzq(p,a);
    while(!nulo(aux)){
      cont += cantNodos(a,aux);
      aux=hermanoDer(aux,a);
    }
  }
  return cont;
}

//inciso b
int clavesPares(tArbol a, tPos p){
  tPos aux;
  int cont=0;

  if (!nulo(p)){
    cont += !(info(p,a)%2);
    aux=hijoMasIzq(p,a);
    while (!nulo(aux)){
      cont += clavesPares(a,aux);
      aux=hermanoDer(aux,a);
    }
  }
  return cont;
}

//inciso c
int gradoArb(tArbol a, tPos p){
  int grado, gradoMax, gradoHijoAct;
  tPos aux;

  if (!nulo(p)){
    grado=gradoHijoAct=gradoMax=0;
    aux=hijoMasIzq(p,a);
    while(!nulo(aux)){
      grado ++;
      gradoHijoAct=gradoArb(a,aux);
      if (gradoHijoAct>gradoMax)
        gradoMax=gradoHijoAct;
      aux=hermanoDer(aux,a);
    }
    return grado>gradoMax? grado:gradoMax;
  }
  else
    return 0;
}

//inciso D
int cantNodos(tArbol a, tPos p, int niv){
  tPos aux;
  int cantCumplen, grado;

  if(!nulo(p)){
    grado=cantCumplen=0;
    aux=hijoMasIzq(a,p);
    while(!nulo(aux)){
        grado++;
        cantCumplen+=cantNodos(a,aux,niv+1);
        aux=hermanoDer(aux,a);
    }
    return (grado%2 && niv%2)? cantCumplen+1:cantCumplen;
  }
  else
    return 0;
}

//inciso e int
int claveIgualCantHijos(tArbol a, tPos p){
  tPos aux;
  int cantHijos, cumple;

  if(!nulo(p)){
    cantHijos=0;
    cumple=1;
    aux=hijoMasIzq(p,a);
    if (!nulo(aux)){
      while(!nulo(aux) && cumple){
        cantHijos++;
        cumple=claveIgualCantHijos(a,aux);
        aux=hermanoDer(aux,a);
      }
      return cumple && info(p,a)==cantHijos;
    }
    else
      return 1;
  }
  else
    return 1;
}

//inciso e void
void calaveIgualHijos(tArbol a, tPos p, int *cumple){
    tPos aux;
    int cantHijos;

    if(!nulo(p)){
      cantHijos=0;
      aux=hijoMasIzq(p,a);
      if (!nulo(aux)){
        while(!nulo(aux) && (*cumple)){
          cantHijos++;
          claveIgualHijos(a, aux, cumple);
          aux=hermanoDer(aux,a);
        }
        *cumple= (*cumple) && info(p,a)==cantHijos;
    }
}

//inciso f
void promClaves(tArbol a, tPos p, int niv, int k, int *cant, int *acum){
  tPos aux;

  if(!nulo(p)){
    aux=hijoMasIzq(p,a);
    while(!nulo(aux)){
      promClaves(a,aux,niv+1,k,cant,acum);
      aux=hermanoDer(aux,a);
    }
    if(niv==k){
        (*cant)++;
        *acum += info(p,a);
      }
  }
}


