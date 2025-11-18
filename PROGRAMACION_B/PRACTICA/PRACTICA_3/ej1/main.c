#include <stdio.h>
#include <stdlib.h>

long calculaProd(int, int);
void cocRes(int, int, int *, int *);
void maximoVoid(int V[],int n,int *pMax);
int maximoInt(int V[], int n);

int main(){
    int V[]={20,1,-9,15,2,1,3,7,9,21}, n=10, a=-15, b=4, coc, resto, max;

    printf("El producto entre %d y %d es: %d ",a,b,calculaProd(a,b));
    cocRes(a,b,&coc,&resto);
    printf("\n El resultado de la division %d/%d es el siguiente:\n Cociente:%d\n Resto:%d",a,b,coc,resto);
    maximoVoid(V,n-1,&max);
    printf("\nEl maximo del vector es %d ",max);
    printf("\nEl maximo del vector es %d ",maximoInt(V,n-1));

    return 0;
}
//INCISO A
long calculaProd(int a, int b){
  if (b==0 || a==0)
    return 0;
  else
    if (abs(b)==1)
      return (b<0)? -a:a;
    else
      if (a>0 && b>0 || a<0 && b<0)
        return abs(a) + calculaProd(abs(a),abs(b)-1);
      else
        if (a<0)
          return a + calculaProd(a,b-1);
        else
          return -a + calculaProd(a,b+1);
}

//INCISO B
void cocRes(int a, int b, int *pCoc, int *pResto){
  if (a<b)
    *pResto=a;
  else{
    *pCoc +=1;
    cocRes(a-b,b,pCoc,pResto);
  }
}

//INCISO C
void maximoVoid(int V[], int n, int *pMax){
  if (n==0)
   *pMax=V[n];
  else{
    maximoVoid(V,n-1,pMax);
    if (V[n]>*pMax)
      *pMax=V[n];
  }
}

int maximoInt(int V[], int n){
  int aux;

  if (n>0){
    aux=maximoInt(V,n-1);
    if (V[n]>aux)
      aux=V[n];
  }
  else
    aux=V[n];
  return aux;
}


