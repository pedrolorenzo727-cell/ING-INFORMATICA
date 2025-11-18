#include <stdio.h>
#include <stdlib.h>
#define MAX 20

void leeVector(int vec[], unsigned int *pn);
//void menuOp(int vec[], unsigned int n);
void muestraImp(int vec[], unsigned int n);
void generaVec(int vec[], int vecDivK[], unsigned int n, unsigned int *pm, unsigned int k);
void muestraVec(int vecDivK[], unsigned int m);
int buscaX(int vec[], unsigned int n, int x);

int main() {
  int vec[MAX], vecDivK[MAX], k, x;
  unsigned int op, n, m,  i;

  leeVector(vec, &n);
  printf("menu de opciones\n");
  printf("1 - Muestra los elementos en posiciones impares\n");
  printf("2 - Genera y muestra vector con los divisibles por k(ingresado por el usuario)\n");
  printf("3 - Buscar algun valor\n");
  do{
    printf("Ingrese una opcion(0 para finalizar)\n");
    scanf("%u",&op);
    switch(op){
      case 1: muestraImp(vec, n);
      break;
      case 2: {
             printf("Ingrese un divisor\n");
             scanf("%d",&k);
             generaVec(vec,vecDivK, n, &m, k);
             muestraVec(vecDivK,m);
      }
      break;
      case 3: {
             printf("Ingrese un valor\n");
             scanf("%d",&x);
             i= buscaX(vec,n,x);
             if (i!=-1)
                printf("La posicion de %d es %u\n", x, i);
             else
                printf(" el valor %d no se encuentra en el arreglo\n", x);
      }
      break;
    }
  }
  while (op!=0);

  return 0;
}

void leeVector(int vec[], unsigned int *pn){
  unsigned int i;

  printf("Ingrese la cantidad de elementos del arreglo\n");
  scanf("%u", pn);

  for(i=0; i < *pn; i++){
    printf("ingrese el elemento %u\n",i);
    scanf("%d",&vec[i]);
  }
}

void muestraImp(int vec[], unsigned int n){
  unsigned int i=1;

  printf("Los elementos en posiciones impares son:\n");
  for (;i<n;i=i+2)
    printf("%d ",vec[i]);
  printf("\n");

}

void generaVec(int vec[], int vecDivK[], unsigned int n, unsigned int *pm, unsigned int k){
  unsigned int i=0;

  *pm=0;
  for(;i<n;i++)
    if (abs(vec[i])%k == 0 ){
      vecDivK[*pm]=vec[i];
      (*pm)++;

    }
}

void muestraVec(int vecDivK[], unsigned int m){
  unsigned int i;

  printf("El vector de los divisibles queda: \n");
  for(i=0; i<m; i++)
    printf("%4d",vecDivK[i]);
  printf("\n");
}

int buscaX(int vec[], unsigned int n, int x){
  unsigned int i=0;

  while(i<n-1 && vec[i]!=x )
    i++;
  if (vec[i]==x)
    return i;
  else
    return -1;
}

