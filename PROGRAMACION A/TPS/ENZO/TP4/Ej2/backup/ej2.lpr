program ej2;

function factorial (n : byte):longint;
var
  i : byte;
  aux : longint;
begin
  if (n = 0) or (n = 1) then
     aux := 1
  else
    for i := n downto 1 do
        aux := aux*(n - i);
end;

var
  n : byte;

begin
  writeln('Ingrese n');
  readln(n);
  writeln('Factorial de ', n, ': ', factorial(n));
  readln();
end.

