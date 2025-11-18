program ej5;
var
  k , q : integer;
  i : byte;

begin
  writeln('Ingrese K');
  readln(k);
  writeln('Ingrese Q');
  readln(q);
  i := 1;
  while k*i < q do
  begin
       write(k*i, ' ');
       i := i + 1;
  end;
  readln();
end.

