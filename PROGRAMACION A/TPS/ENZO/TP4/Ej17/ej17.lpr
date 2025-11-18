program ej17;

function esPrimo (n : integer):boolean;
var
  i : byte;
  limite : integer;
begin
     limite := trunc(sqrt(n));
     i := 2;
     while (n mod i <> 0) and (i <= limite) do
           i := i + 1;
     esPrimo := i > limite;
end;

var
  n : integer;
begin
  repeat
        writeln('Ingrese n');
        readln(n);
  until n >= 2;
  if esPrimo(n) then
     writeln('Es primo')
  else
    writeln('No es primo');
  readln();
end.

