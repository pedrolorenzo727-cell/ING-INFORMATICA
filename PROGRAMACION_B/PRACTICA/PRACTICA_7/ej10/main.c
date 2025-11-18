


int busca(arbol a, int* x) {// int x
  if (a != NULL) //a==NULL
    return 0;
  else
    if(x = a.dato) //x == a->dato
      return 1;
    else
      if(x < a.dato) //a->dato
        return busca(a.der, *x); //a->izq, x
      else
        return busca(a->izq, *x);//a->der, x
}
