#define MAXI 50

typedef int tElementoC;

typedef struct {
   tElementoC datos[MAXI];
   int pri, ult; } tCola;

void iniciaC (tCola *C);

int vaciaC(tCola C);

void poneC (tCola *C, tElementoC X);

void sacaC (tCola *C, tElementoC *X);

tElementoC consultaC (tCola C);
