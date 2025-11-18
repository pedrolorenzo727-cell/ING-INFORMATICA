#include <stdio.h>
#include <stdlib.h>
#define MAX 10

typedef struct{
  int grado, vertice;
}tReg;

void generaVec(int vecGr[], int mAdy[][MAX], int i, int j, int n, int gr);
//int vertMayorGrEnt(int mAdy[][MAX], int i, int j, int n, int gr, int maxGr);
int vertAdy(int mAdy[][MAX], int i, int j, int n, int vertAct, int costo);
void generaVecReg(tReg vecReg[], int *pm, int mAdy[][MAX], int i, int j, int n, int gr);
void vertMayorGrEnt(int mAdy[][10], int i, int j, int n, int gr, int *maxGr, int *vertMax){


int main(){

    int mAdy[MAX][MAX], vecGr[MAX], n, costo, m, maxGr=0, vertMax=-1;
    tReg vecReg[MAX];

    //cargaMatriz(mAdy,&n);

    generaVec(vecGr, mAdy, n-1, n-1, n-1, 0);
    vertMayorGrEnt(mAdy,n-1,,n-1,n-1,0,&maxGr,&vertMax);
    printf("El vertice con mayor grado de entrada es %d\n",vertMax);//vertMayorGrEnt(mAdy,n-1,n-1,n-1,0,0));
    printf("Ingrese un costo a superar\n");
    scanf("%d",&costo);
    if (vertAdy(mAdy, 0, 0, n-1, 0,costo))
      printf("El grafo cumple con tener todos los vertices con al menos un vertice adyacente de costo mayor a %d",costo);
    else
        printf("El grafo no cumple la condicion para todos los vertices");
    generaVecReg(vecReg, &m, mAdy, n-1, n-1, n-1, 0);

    return 0;
}

//inciso A
void generaVec(int vecGr[], int mAdy[][MAX], int i, int j, int n, int gr){

  if (i>=0){
    if (mAdy[i][j]==1)
      gr++;
    if (j==0){
        vecGr[i]=gr;
        generaVec(vecGr, mAdy, i-1, n, n, 0);
    }
    else
      generaVec(vecGr, mAdy, i, j-1, n, gr);
  }
}

//inciso B
int vertMayorGrEnt(int mAdy[][MAX], int i, int j, int n, int gr, int maxGr){//void
  int vert;

  if (j>=0){
    if(i=0)
      vert=vertMayorGrEnt(mAdy, n, j-1, n, gr, maxGr);
    else
      vert=vertMayorGrEnt(mAdy, i-1, j, n, gr, maxGr);
    if (mAdy[i][j])
      gr++;
    if (i==n)
      if (gr>maxGr){
        maxGr=gr;
        vert=j;
      }

    return vert;
  }
  else
    return -1;
}

void vertMayorGrEnt(int mAdy[][10], int i, int j, int n, int gr, int *maxGr, int *vertMax){
  if(j>=0){
    if (mAdy[i][j])
      gr++;
i
    if(i==0){
        if (gr>(*maxGr)){
          *maxGr=gr;
          *vertMax=j;
      }
      vertMayorGrEnt(mAdy,n,j-1,n,0,maxGr,vertMax);
    }
    else
      vertMayorGrEnt(mAdy,i-1,j,n,gr,maxGr,vertMax);
  }
}

//inciso C
int vertAdy(int mAdy[][MAX], int i, int j, int n, int vertAct, int costo){

  if(j>n)
    return 0;
  else
    if (vertAct>n)
     return 1;
    else
      if (mAdy[i][j]>costo)
        return vertAdy(mAdy, 0, vertAct+1, n, vertAct+1, costo);
      else
        if (i<vertAct)
          return vertAdy(mAdy, i+1, j, n, vertAct, costo);
        else
          return vertAdy(mAdy, i, j+1, n, vertAct, costo);
}

//inciso D
void generaVecReg(tReg vecReg[], int *pm, int mAdy[][MAX], int i, int j, int n, int gr){
  tReg aux;

  if (i>=0){
    if (mAdy[i][j])
      gr++;
    if (j==0){
      if (gr>3){
        aux.grado=gr;
        aux.vertice=i;
        vecReg[*pm]=aux;
        (*pm)++;
      }
      generaVecReg(vecReg, pm, mAdy, i-1, n, n, 0);
    }
    else
      generaVecReg(vecReg, pm, mAdy, i, j-1, n, gr);
  }
}

