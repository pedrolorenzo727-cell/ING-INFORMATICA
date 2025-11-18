#include <stdio.h>

void quehace(int n){
  if (n>0){
    quehace(--n);
    printf("%d ",n);
  }
}

void fact(int n, long *res){
  if (n==0)
    *res =1;
  else{
    fact(n-1,res);
    *res*=n;
  }
}
int main (){
  unsigned int n=1;
  long res;
  quehace(6);
  fact(n,&res);
  printf("\n el factorial de %u es %d",n,res);
 return 0;
}
