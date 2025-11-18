#include <stdio.h>
#define MAX 50

typedef char st15[15];
typedef struct{
    st15 nom;
    unsigned int edad;
} regPer;

typedef regPer tvr[MAX];

void cargaVector(tvr, unsigned int *);
void listado(tvr, unsigned int, unsigned int);
float porcenMayores(tvr, unsigned int);

int main(){
  tvr vecPer;
  unsigned int n,x;

  cargaVector(vecPer,&n);
  printf("Ingrese una edad\n");
  scanf("%u",&x);
  listado(vecPer,n,x);
  printf("Las personas mayores de edad son el %.2f%%\n",porcenMayores(vecPer,n));

  return 0;
}

void cargaVector(tvr vecPer, unsigned int *pn){
  FILE *arch;
  regPer persona;

  *pn=0;
  arch=fopen("ej25.txt","rt");
  fscanf(arch,"%s %u",persona.nom,&persona.edad);
  while (!feof(arch)){
    *pn +=1;
    vecPer[*pn-1]=persona;
    fscanf(arch,"%s %u",persona.nom,&persona.edad);
  }
  fclose(arch);
}

void listado(tvr vecPer, unsigned int n, unsigned int x){
  unsigned int i=0;

  printf("Personas de mas de %u años\n",x);
  for (;i<n;i++)
    if (vecPer[i].edad > x)
      printf("%s \n",vecPer[i].nom);
}

float porcenMayores(tvr vecPer, unsigned int n){
  unsigned int i=0, cont=0;

  for(;i<n;i++)
    if (vecPer[i].edad >= 18)
      cont++;

  return (float) cont/n*100;
}


