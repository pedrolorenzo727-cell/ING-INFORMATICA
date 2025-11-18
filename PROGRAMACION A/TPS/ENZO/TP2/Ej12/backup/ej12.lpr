program ej12;
var
  dia : byte;
begin
  writeln('Ingrese un dia');
  readln(dia);
  case dia mod 7 of
       0 : writeln('Es domingo');
       1 : writeln('Es lunes');
       2 : writeln('Es martes');
       3 : writeln('Es miercoles');
       4 : writeln('Es jueves');
       5 : writeln('Es viernes');
       6 : writeln('Es sabado');
  end;
  readln();
end.

