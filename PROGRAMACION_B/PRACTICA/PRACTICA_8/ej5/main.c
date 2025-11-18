#include <stdio.h>
#include <stdlib.h>

int gradoEntrada(int mAdy[][10], int vert, int n);
int gradoSalida(int mAdy[][10], int vert, int n);


int main()
{
    int mAdy[10][10],gEnt,gSal, vert, n;

    //cargaMatriz(mAdy, &n);
    printf("Ingrese un vertice\n");
    scanf("%d",&vert);
    gEnt=gradoEntrada(mAdy, vert-1, n);
    printf("El grado de entrada del vertice es %d\n",gEnt);
    gSal=gradoSalida(mAdy,vert-1, n);
    printf("El grado de salida del vertice es %d\n",gSal);
    printf("El grado total del vertice es %d\n",gSal+gEnt-mAdy[vert-1][vert-1]);

    return 0;

}

int gradoEntrada(int mAdy[][10], int vert, int n){
  int i, cont=0;

  for (i=0; i<n; i++)
    if (mAdy[i][vert])
      cont ++;

  return cont;
}

int gradoSalida(int mAdy[][10], int vert, int n){
  int j, cont=0;

  for (j=0; j<n; j++)
    if (mAdy[vert][j])
      cont++;

  return cont;
}
