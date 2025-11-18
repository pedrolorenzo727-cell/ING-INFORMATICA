#include <stdio.h>
#include <stdlib.h>

int busquedaLineal(int a[], int x, int n);
int busquedaBinaria(int a[], int x, int pri, int ult);

int main(){
  int a[]={-6,-1,0,2,5,6,8,9,10,22}, n=10, x,i;

  printf("Ingrese un valor a buscar\n");
  scanf("%d",&x);
  //i= busquedaLineal(a,x,n-1);
  i= busquedaBinaria(a,x,0,n-1);

  if (i!=-1)
    printf("El elemento se encuentra en la posicion %d",i+1 );
  else
    printf("El elemento no se encuentra en el vector");

  return 0;
}

int busquedaLineal(int a[], int x, int n){
  if (a[n]==x)
    return n;
  else
    if (n>0)
      return busquedaLineal(a,x,n-1);
    else
      return -1;
}

//-6,-1,0,2,5,6,8,9,10,22

int busquedaBinaria(int a[], int x, int pri, int ult){
  int medio=(pri+ult)/2;

  if (pri<=ult)
    if (a[medio]<x)
      return busquedaBinaria(a,x,medio+1,ult);
    else
      if (a[medio]>x)
        return busquedaBinaria(a,x,pri,medio-1);
      else
        return medio;
  else
    return -1;
}
