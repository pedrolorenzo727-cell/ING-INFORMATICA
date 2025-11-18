#include <stdio.h>

void carga_archivo();
void analiza_temp();

void main (){
  carga_archivo();
  analiza_temp();
}

void carga_archivo(){
  FILE *atemp, *archt;
  float temp;

  atemp= fopen("TEMPERATURAS.DAT","wb");
  archt= fopen("ej29.txt","rt");

  fscanf(archt,"%f",&temp);
  while (!feof(archt)){
    fwrite(&temp,sizeof(temp),1,atemp);
    fscanf(archt,"%f",&temp);
  }
  fclose(atemp);
  fclose(archt);
}

void analiza_temp(){
  FILE *atemp;
  float max=-50,min=99,temp,acum;
  unsigned int cont=0;

  atemp= fopen("TEMPERATURAS.DAT","rb");
  fread(&temp,sizeof(temp),1,atemp);
  while (!feof(atemp)){
    cont +=1;
    acum +=temp;
    if (temp<min)
        min=temp;
    if(temp>max)
        max=temp;
    fread(&temp,sizeof(temp),1,atemp);

  }
  fclose(atemp);
  if (cont != 0){
    printf("La temperatura promedio es %5.2f\n",acum/cont);
    printf("La temperatura maxima fue %5.2f\n",max);
    printf("La temperatura minima fue %5.2f\n",min);
  }
}
