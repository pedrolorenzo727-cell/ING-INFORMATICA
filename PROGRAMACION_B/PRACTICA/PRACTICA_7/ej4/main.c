


void arrgrado2(arbol a, char v[N], int dimv) {//v[] int *dimv
  if (a != NULL) {
    if(a->izq != NULL && a->der == NULL) {/* grado 2 */ //a->der != NULL
      (*dimv)++;
      v[dimv] = a->dato; //v[*dimv], se deberia invertir el incremento con la asignacion
    }
    else
      arrgrado2(a->izq, v[], dimv);//v
    arrgrado2(a->der, v[], dimv);//v
 }  // se debe recorrer todo el arbol, por lo que los dos llamados deben ir fuera del else
}
