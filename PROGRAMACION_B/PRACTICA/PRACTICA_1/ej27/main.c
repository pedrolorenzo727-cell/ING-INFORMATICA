#include <stdio.h>
#define MAX 100
#define TOPE 10

typedef struct{
    int fila,col,valor;
} tRegDato;

typedef tRegDato tvr[MAX];
typedef int tm[TOPE][TOPE];

void cargaMatriz(tm, int *, int *);
void generaArreglo(tm, int, int, tvr, int *);
void muestraArreglo(tvr, int);

int main(){
  tvr vec;
  tm mat;
  int n,m,p;

  cargaMatriz(mat, &n, &m);
  generaArreglo(mat, n, m, vec, &p);
  muestraArreglo(vec, p);

  return 0;
}

void cargaMatriz(tm mat, int *pn, int *pm){
  FILE *arch;
  int i,j;

  arch=fopen("ej27.txt","rt");

  fscanf(arch,"%d %d",pn,pm);
  for(i=0; i<*pn; i++)
    for(j=0; j<*pm; j++)
      fscanf(arch,"%d",&(mat[i][j]));
  fclose(arch);
}

void generaArreglo(tm mat, int n, int m, tvr vec, int *pp){
  int i,j,divisor=n+m;

  *pp=0;
  for (i=0; i<n; i++)
    for (j=0; j<m; j++)
      if (mat[i][j] % divisor == 0 && mat[i][j]!=0){
        vec[*pp].fila=i+1;
        vec[*pp].col=j+1;
        vec[*pp].valor=mat[i][j];
        (*pp)++;
       }
}

void muestraArreglo(tvr vec, int p){
  int i;

  printf("Los elementos divisibles por N+M son: \n");
  printf("Fila  Columna  Valor\n");
  for (i=0; i<p; i++)
    printf("%2d %8d %8d\n",vec[i].fila, vec[i].col, vec[i].valor);
}

