program ej3;
function suma (n : byte):word;
var
  i : byte;
  aux : word;
begin
  aux := 0;
  for i := 1 to n do
    aux := aux + i;
  suma := aux;
end;

var
  n : byte;
begin
  writeln('Ingrese n');
  readln(n);
  writeln('Suma de los primeros ', n, ' numeros: ', suma(n));
  readln();
end.

