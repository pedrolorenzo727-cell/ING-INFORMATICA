#include <stdio.h>
#include "colasE.h"
#include <string.h>

void cargaCola(tCola *c);
void muestraDatos(tCola *c);

int main(){
    tCola c;

    cargaCola(&c);
    muestraDatos(&c);

    return 0;
}

void cargaCola(tCola *c){
  FILE *arch;
  tElementoC x;

  iniciaC(c);
  arch=fopen("ej11.txt","rt");
  if(arch==NULL)
    printf("error al abrir el archivo");
  else{
    while(fscanf(arch,"%s %d %d",x.legajo,&x.arribo,&x.segsUso)==3)
        poneC(c,x);
    fclose(arch);
  }
}

void muestraDatos(tCola *c){
  tElementoC x;
  char maxLeg[MAX];
  int maxEsp=0, acumEsp=0, cantEmp=0, espera=0;
  unsigned long int tiempoAct=0;

  printf("Empleado    Empieza    Termina\n");

  while (!vaciaC(*c)){
    sacaC(c,&x);
    if (x.arribo<tiempoAct){
        espera=tiempoAct-x.arribo;
        acumEsp +=espera;
        if (espera>maxEsp){
            maxEsp=espera;
            strcpy(maxLeg,x.legajo);
        }
        tiempoAct +=x.segsUso;
    }
    else{
      tiempoAct=x.arribo + x.segsUso;
      espera=0;
    }

    printf("%s\t\t%d\t%d\t%d\n",x.legajo,tiempoAct-x.segsUso,tiempoAct,espera);

    cantEmp++;
  }

  if(maxEsp!=0)
    printf("El legajo con mayor tiempo de espera es %s\n",maxLeg);
  if (cantEmp!=0)
    printf("El tiempo promedio de espera fue %.1f\n",(float)acumEsp/cantEmp);
}
