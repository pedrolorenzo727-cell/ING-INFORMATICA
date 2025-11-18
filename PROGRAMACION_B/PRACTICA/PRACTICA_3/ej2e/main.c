#include <stdio.h>
#include <stdlib.h>
#define MAX 50

void mezcla(int a[], int b[], int c[], int n, int m, int *pp, int i, int j);
void muestra(int c[], int p);

int main(){
    int a[]={-6,-1,0,2,5,6,8,9,10,22}, b[]={0,1,5,6,10,13,15,18,22,24}, c[MAX], n,m,p=0;

    n=m=10;
    mezcla(a,b,c,n-1,m-1,&p,0,0);
    muestra(c,p);

    return 0;
}

void mezcla(int a[], int b[], int c[], int n, int m, int *pp, int i, int j){
  if (i<=n && j<=m){
    if (a[i]<b[j]){
      c[*pp]=a[i];
      i++;
    }
    else
      if(b[j]<a[i]){
        c[*pp]=b[j];
        j++;
      }
      else{
        c[*pp]=a[i];
        i++;
        j++;
      }
    *pp +=1;
    mezcla(a,b,c,n,m,pp,i,j);
  }
  else
    if (i<=n){
     c[*pp]=a[i];
      i++;
    *pp +=1;
    mezcla(a,b,c,n,m,pp,i,j);
   }
   else
    if (j<=m){
      c[*pp]=b[j];
      j++;
    *pp +=1;
    mezcla(a,b,c,n,m,pp,i,j);
  }
}

void muestra(int c[], int p){
  int i;

  for(i=0; i<p; i++)
    printf("%d ",c[i]);
}
