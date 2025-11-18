program ej3;
Var
  Temp:real;

begin
  writeln('Ingrese la temperatura actual');
  readln(Temp);
  If temp<0 then
    writeln('No salgo de casa')
  else                       //temperatura mayor a 0 grados
    If temp<20 then
      writeln('Hace frio')
    else                   //temperatura mayor a 20 grados
      If temp<29 then
        writeln('Barbaro')
      else                  //temperatura mayor a 29 grados
        writeln('Que calor!!');
  readln;
end.

