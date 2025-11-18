program ej1;
function esLetra (car : char):boolean;
begin
  car := upcase(car);
  esLetra := car in ['A'..'Z'];
end;

var
  car : char;
begin
  writeln('Ingrese un caracter');
  readln(car);
  if esLetra (car) then
     writeln('Es letra')
  else
    writeln('No es letra');
  readln();
end.

