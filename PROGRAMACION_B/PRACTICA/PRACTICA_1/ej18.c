#include <stdio.h>

void duplica_for(int [], unsigned int);
void duplica_while(int [], unsigned int);
void duplica_dow(int [], unsigned int);
void muestra_vec(int [], unsigned int);

void main(){
  int vec[]={3,10,-5,4,25,100,100};

  //duplica_for(vec,7);
  duplica_while(vec,7);
  //duplica_dow(vec,7);
  muestra_vec(vec,7);
}

void duplica_for(int vec[], unsigned int n){
  unsigned int i;

  for (i=0; i<n; i=i+2;)
    vec[i]*=2;
}

void duplica_while(int vec[], unsigned int n){
  unsigned int i=2;

  while (i<n) {
    vec[i]*=2;
    i=i+2;
  }
}

void duplica_dow(int vec[], unsigned int n){
  unsigned int i=0;

  if (n)
    do {
      vec[i]*=2;
      i=i+2;
    }
    while (i<n);
}




void muestra_vec(int vec[],unsigned int n){
  unsigned int i;

  for (i=0; i<n; i++)
    printf(" %d ",vec[i]);
}
