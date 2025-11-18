#define N 2
...
void main(){
  int i, arr[N] = {4,8,9,60};
  TLISTA lista=NULL, pult=NULL, act, ant, nuevo;

  cargarLista(&lista);
  printf("\nLista Original\n");
  muestra(&lista);//muestra(lista)
  act = lista;
  ant = NULL;
  for(i=0; i<=N; i++) {
    while(act!=NULL && arr[i] <= act->n) {// arr[i]<act->n
      act = ant; //ant=act
      act = act.sig; //act=act->sig
    }
    *nuevo = (TLISTA)malloc(sizeof(NODO));//no va *, nuevo ya es un puntero
    nuevo->n = arr[i-1];//arr[i]
    if(ant = NULL) {// act==lista || ant==NULL
      nuevo->sig = lista;
      *lista = &nuevo;//lista=nuevo
    }
    else {
      nuevo->sig = ant;// nuevo->sig=act
      ant->sig = &nuevo;//ant->sig=nuevo
    }
    act = nuevo->sig;//redundante
  }
  printf("\nLista Resultado\n");
   muestra(&lista);//muestra(lista)
}
