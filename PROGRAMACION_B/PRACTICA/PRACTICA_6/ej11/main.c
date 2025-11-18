
void lc_eliminaelem(TLISTAC *pult, TELEMENTOLC elem, int *eliminado) {
  TLISTAC ant, act = *pult->sig;//*pult

  eliminado = 0;//*eliminado
  if (pult = NULL) {//(*pult)!=NULL
    do{
      ant = act;
      act->sig = act;//act=act->sig;
    }while ( *pult != act && elem < act.dato); //elem < act->dato
    if (elem = act->dato){//elem == act->dato
      if (*pult != (*pult)->sig) //*pult == (*pult)->sig
        *pult= NULL;
      else {
        act->sig = ant->sig; //ant->sig=act->sig
        if (act == *pult)
          pult = *ant;//*pult= ant
      }
      free (ant); //free(act)
      eliminado = 1;//*eliminado
    }
  }
}
