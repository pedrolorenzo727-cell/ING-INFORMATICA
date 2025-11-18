#define MAX 50
typedef char tElementoC;

typedef struct {
   tElementoC datos[MAX];
   int pri, ult; } tCola;

void iniciaC (tCola *C);

int vaciaC(tCola C);

void poneC (tCola *C, tElementoC X);

void sacaC (tCola *C, tElementoC *X);

tElementoC consultaC (tCola C);
