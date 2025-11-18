#include <stdio.h>
typedef struct{
    char patente[8],fecha[11],hora[6];
    unsigned int vel,velmax;} tRegRadar;

void generabinario(unsigned int *, unsigned int *);

int main(){
  unsigned int contMed, contReg;
  generabinario(&contMed,&contReg);
  printf("La cantidad de mediciones procesadas fueron %u\n",contMed);
  printf("La cantidad de registros generados en el binario fueron %u",contReg);

  return 0;
}

void generabinario(unsigned int *pContMed, unsigned int *pContReg){
  FILE *archt, *archb;
  tRegRadar medicion;

  *pContMed=*pContReg=0;
  archt=fopen("ej30.txt","rt");
  archb=fopen("ej30.DAT","wb");

  while (fscanf(archt,"%s %u %u %s %s",medicion.patente, &medicion.vel, &medicion.velmax, medicion.fecha, medicion.hora)==5){
    *pContMed +=1;
    if (medicion.vel > medicion.velmax*1.20){
      *pContReg +=1;
      fwrite(&medicion, sizeof(tRegRadar), 1, archb);
    }
  }
  fclose(archb);
  fclose(archt);
}
