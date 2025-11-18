#include <stdio.h>
#define MAX 10

typedef struct{
    unsigned int x,y;
} rPos;

void cargaMatriz(int mat[][MAX], unsigned int *pn, unsigned int *pm);
rPos buscaPos(int mat[][MAX], unsigned int n, unsigned int m, int x);
void muestraProm(int mat [][MAX], unsigned int n, unsigned int m);
float promMat(int mat[][MAX], unsigned int n, unsigned int m);
void superanProm(int mat [][MAX], unsigned int n, unsigned int m, float prom);

int main(){
  int mat[MAX][MAX], x;
  unsigned int n,m;
  rPos pos;

  cargaMatriz(mat,&n,&m);
  printf("Ingrese un valor a buscar\n");
  scanf("%d", &x);
  pos= buscaPos(mat,n,m,x);
  if (pos.x != 10)
    printf("La posicion en la que se encuentra el elemento es la [%u,%u]\n",pos.x,pos.y);
  else
    printf("No existe el elemento ingresado\n");
  muestraProm(mat,n,m);
  superanProm(mat,n,m,promMat(mat,n,m));
}

void cargaMatriz(int mat[][MAX], unsigned int *pn, unsigned int *pm){
  unsigned int i=0,j;
  FILE *arch;

  arch= fopen("ej24.txt","rt");
  fscanf(arch,"%u %u\n",pn,pm);
  for (;i<*pn;i++)
    for (j=0; j<*pm; j++)
      fscanf(arch,"%d",&mat[i][j]);
  fclose(arch);
}

//inciso A
rPos buscaPos(int mat[][MAX], unsigned int n, unsigned int m, int x){
  rPos pos;
  unsigned int i=0,j;
  pos.x=10;
  pos.y=10;

  while (i<n && mat[i][j] != x){
    j=0;
    while (j<m-1 && mat[i][j] != x)
      j++;
    if (mat[i][j] != x)
      i++;
    else {
      pos.x=i+1;
      pos.y=j+1;
    }
  }

return pos;
}

//inciso B
void muestraProm(int mat [][MAX], unsigned int n, unsigned int m){
  unsigned int i,j=0;
  int suma;
  float prom;

  printf("Columna    Promedio\n");
  for (; j<m; j++){
    suma=0;
    for(i=0; i<n; i++)
      suma += mat[i][j];

    printf("%4u %13.2f\n",j+1,(float)suma/n);
  }
}

//inciso C
float promMat(int mat[][MAX], unsigned int n, unsigned int m){
  unsigned int i=0,j;
  int suma=0;

  for (; i<n; i++)
    for (j=0; j<m; j++)
      suma += mat[i][j];

  return (float)suma/(n*m);
}

void superanProm(int mat [][MAX], unsigned int n, unsigned int m, float prom){
  unsigned int i=0, j, cont, ceros;

  for (; i<n; i++){
    cont=ceros=0;
    for (j=0; j<m; j++){
      if (mat[i][j]>prom)
        cont +=1;
      if (mat[i][j]==0)
        ceros +=1;
    }
    if (ceros>0)
      printf("Fila: %u  Cantidad de elementos que superan el promedio: %u\n",i+1,cont);
  }
}



