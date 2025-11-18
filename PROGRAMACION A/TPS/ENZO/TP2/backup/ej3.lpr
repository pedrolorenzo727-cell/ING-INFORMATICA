program ej3;
Var
  Temp:real;

begin
  writeln('Ingrese la temperatura actual');
  readln(Temp);
  If temp<0 then
    writeln('No salgo de casa')
  else
    If temp<20 then
      writeln('Hace frio')
    else
      If temp<29 then
        writeln('Barbaro')
      else
        writeln('Que calor!!');
  readln;
end.

