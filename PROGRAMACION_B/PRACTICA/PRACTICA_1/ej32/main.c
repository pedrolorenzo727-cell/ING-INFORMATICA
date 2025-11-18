#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef char st20[20];

typedef struct{
  st20 ciudad;
  unsigned short int dia;
  float tMax,tMin;
} tReg;

void cargaArchivo();
void corteDeControl();

int main(){

    cargaArchivo();
    corteDeControl();

    return 0;
}

void cargaArchivo(){
  FILE *archB, *archT;
  tReg dato;

  archB=fopen("ej32.DAT","wb");
  archT=fopen("ej32.TXT","rt");

  while (fscanf(archT,"%s %u %f %f", dato.ciudad, &dato.dia, &dato.tMax, &dato.tMin)==4)
    fwrite(&dato, sizeof(tReg), 1, archB);
  fclose(archB);
  fclose(archT);
}

void corteDeControl(){
  FILE *archB;
  tReg dato;
  st20 ciudadAct, ciudadTMin;
  float tMax,tMin,tMinTot;

  if ((archB = fopen("ej32.DAT","rb"))!= NULL){
    tMinTot=100;
    printf("Ciudad              TempMax   TempMin\n");
    fread(&dato, sizeof(tReg), 1, archB);
    while(!feof(archB)){
      strcpy(ciudadAct,dato.ciudad);
      tMax=0;
      tMin=100;
      while ( !feof(archB) && strcmp(ciudadAct,dato.ciudad)==0){
        if (dato.tMax>tMax)
            tMax=dato.tMax;
        if (dato.tMin<tMin){
            tMin=dato.tMin;
            if (tMin<tMinTot){
              tMinTot=tMin;
              strcpy(ciudadTMin,dato.ciudad);
            }
        }
        fread(&dato, sizeof(tReg), 1, archB);
      }
      printf("%-20s %4.1f %10.1f\n",ciudadAct, tMax, tMin);
    }
    printf("La ciudad que tuvo la menor temperatura en el mes fue %s con %.1f °C",ciudadTMin,tMinTot);

    fclose(archB);

  }
  else
    printf("error al abrir el archivo");
}

