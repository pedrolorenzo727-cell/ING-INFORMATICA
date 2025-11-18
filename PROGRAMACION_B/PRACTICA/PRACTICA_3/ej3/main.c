#include <stdio.h>
#include <stdlib.h>

float prom(int [], int, int);

int main(){
  int vec[]={11,3,2,1,4,-6,0,3,1,2}, n=10;

  printf("El promedio de los elementos del vector es %.3f\n",prom(vec,n-1,n));

  return 0;
}

/*float prom(int vec[], int i, int n) {
  if (i == 0)
    return (float)vec[0] / n;
  else
    return (vec[i] + prom(vec, i-1, n) * n) / n;
}
*/
float prom(int vec[], int i, int n){
  if (i<0)
    return 0;
  else
    return (float) vec[i]/n + prom(vec,i-1,n);
}
//tambien valida
