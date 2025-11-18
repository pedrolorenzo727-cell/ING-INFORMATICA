program ej4;

function invCad (cad : string; n : byte):string;
begin
  if n = 1 then
     invCad := cad[n]
  else
    invCad := cad[n] + invCad(cad, n - 1);
end;

var
  cad : string;
  n : byte;
begin
  readln(cad);
  writeln(invCad(cad,length(cad)));
  readln();
end.

