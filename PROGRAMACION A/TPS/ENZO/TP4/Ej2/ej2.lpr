program ej2;

function factorial (n : byte):longint;
var
  i : byte;
  aux : longint;
begin
  aux := 1;
  for i := n downto 1 do
    aux := aux*i;
  factorial := aux;
end;

var
  n : byte;

begin
  writeln('Ingrese n');
  readln(n);
  writeln('Factorial de ', n, ': ', factorial(n));
  readln();
end.

