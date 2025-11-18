program ej2;
const
  a1 = 1;
var
  k : byte;
begin
     writeln('Ingrese k');
     readln(k);
     writeln('El termino ', k, '-enesimo es ', a1 + 3*(k - 1));
     writeln('La diferencia entre el termino ', k, '-enesimo y el termino ', k + 1, ' -enesimo es ',  a1 + 3*(k - 1) - a1 + 3*(k));
     readln();
end.

