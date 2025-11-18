#define MAX_NOM 30
#define MAX_TEL 12
#define MAX_CONT 500

typedef struct{
    char nombre[MAX_NOM],telefono[MAX_TEL];
}contacto;

typedef contacto tva[MAX_CONT];

typedef struct {
    tva vecCont;
    int n;
} tAgenda;

void iniciarAgenda(tAgenda *pAgenda);
void insertaOrdenado(tAgenda *pAgenda, contacto nuevoCont);
void agregaContacto(tAgenda *agenda);
void listarAgenda(tAgenda agenda);
int buscaContacto(tAgenda agenda, char nombre[]);
