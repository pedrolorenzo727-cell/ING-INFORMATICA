#define MAX 50

typedef struct{
  char dato [MAX];
}TElementoP;

typedef struct {
TElementoP datos[MAX];

int tope; } TPila;

void poneP(TPila *P, TElementoP x);

void sacaP(TPila *P, TElementoP* x) ;

TElementoP consultaP(TPila P);

int vaciaP(TPila P);

void iniciaP (TPila *P);
