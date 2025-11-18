#include "colasE.h"

void iniciaC (tCola *C) {
  (*C).pri= (*C).ult=-1; // C->pri = C -> ult = -1;
}
int vaciaC(tCola C){
 return C.pri==-1;
}
void poneC (tCola *C, tElementoC X) {
  if ((*C).ult != MAX-1) {
    if ((*C).pri==-1)
     (*C).pri = 0;
     (*C).datos[++((*C).ult)]=X;
   }
}

void sacaC (tCola *C, tElementoC *X) {
  if ((*C).pri != -1) { // !vaciaC(*C)
    *X = (*C).datos[(*C).pri];
   if ((*C).pri == (*C).ult)
     iniciaC(C);
   else
     (*C).pri +=1;
 }
}
tElementoC consultaC (tCola C){
  if (C.pri !=-1)
   return C.datos[C.pri];
}
