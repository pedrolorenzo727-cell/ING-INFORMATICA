program ej4;
function potencia (x, n : integer):real;
var
  i : byte;
  aux : real;
  absoluto : word;
begin
    aux := 1;
    absoluto := abs(n);
    for i := 1 to absoluto do
        aux := aux*x;
    if n < 0 then
       aux := 1/aux;
  potencia := aux;
end;

var
  x, n : integer;
begin
  writeln('Ingrese x y n');
  readln(x, n);
  writeln(x, ' elevado a ', n, ': ', potencia(x,n):4:2);
  readln();
end.

