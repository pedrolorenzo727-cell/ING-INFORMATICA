typedef int tElementoP;

typedef struct nodop {
  tElementoP dato;
  struct nodop *sig; } nodop;

typedef nodop *tPila;

void poneP(tPila *P, tElementoP x);

void sacaP(tPila *P, tElementoP* x) ;

tElementoP consultaP(tPila P);

int vaciaP(tPila P);

void iniciaP (tPila *P);
