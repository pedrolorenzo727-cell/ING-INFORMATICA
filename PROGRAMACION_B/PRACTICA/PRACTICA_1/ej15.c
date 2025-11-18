#include <stdio.h>

int Consecutivos(int,int,int);

void main(){
  int a,b,c;

  printf("Ingrese tres numeros enteros \n");
  scanf("%d %d %d",&a,&b,&c);
  if (Consecutivos(a,b,c))
    printf("Los tres numeros son consecutivos entre si");
  else
    printf("Los tres numeros no son consecutivos entre si");
}

int Consecutivos(int a, int b, int c){
  return (a+1==b && b+1==c || a-1==b && b-1==c);
}
