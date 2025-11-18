#include <stdio.h>
typedef char st10[10];

typedef struct{
    st10 nombre,apellido,nacion;
    unsigned int puntaje;
} tRegTen;

void cargaBinario ();
void muestraDatos(unsigned int);

int main(){
  unsigned int pos;

  printf("Ingrese una posicion(0..14)\n");
  scanf("%u",&pos);
  cargaBinario();
  muestraDatos(pos);

  return 0;
}

void cargaBinario(){
  FILE *archT,*archB;
  tRegTen jugador;

  archB=fopen("ej31.DAT","wb");
  archT=fopen("ej31.TXT","rt");

  while (fscanf(archT,"%s %s %s %u\n",jugador.nombre, jugador.apellido, jugador.nacion, &jugador.puntaje)==4)
    fwrite(&jugador, sizeof(tRegTen), 1, archB);
  fclose(archB);
  fclose(archT);
}

void muestraDatos(unsigned int pos){
  FILE *archB;
  tRegTen jugador;

  archB=fopen("ej31.DAT","rb");
  fseek(archB,pos * sizeof(tRegTen),SEEK_SET);
  fread(&jugador, sizeof(tRegTen), 1, archB);
  printf("Los datos del jugador en la posicion %u son los siguientes:\n",pos);
  printf("Nombre: %s\nApellido: %s\nNacionalidad: %s\nPuntaje: %u\n",jugador.nombre, jugador.apellido, jugador.nacion, jugador.puntaje);
}
