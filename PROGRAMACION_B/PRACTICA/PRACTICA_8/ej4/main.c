#include <stdio.h>
#include <stdlib.h>
#define MAX 10

void retornaSubyacente(int mAdy[][MAX]);

int main()
{
    int mAdy[MAX][MAX], n, m;

    //cargaMatriz(mAdy);
    retornaSubyacente(mAdy);

    return 0;
}


void retornaSubyacente(int mAdy[][MAX]){
  int i,j;

  for (i=0; i<n; i++)
    for (j=0; j<n; j++)
      if (mAdy[i][j] && mAdy[j][i]==0)
        mAdy[j][i]=1;
      else
        if (mAdy[j][i] && mAdy[i][j]==0)
          mAdy[i][j]=1;
}
