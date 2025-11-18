program ej2;
const
  a1 = 1;
var
  k : byte;
  tK, tk1 : word;
begin
     writeln('Ingrese k');
     readln(k);
     tK  := a1 + 3*(k - 1); (*Voy a operar con este valor, lo guardo en una variable*)
     writeln('El termino ', k, '-enesimo es ', tK);
     tk1 := a1 + 3*(k);
     writeln('La diferencia entre el termino ', k, '-enesimo y el termino ', k + 1, ' -enesimo es ',  tK - tk1);
     readln();
end.

