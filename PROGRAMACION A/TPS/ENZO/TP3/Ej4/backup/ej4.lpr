program ej4;
var
  n, i, dif, difMax, posParMax : byte;
  pri, seg : integer;

begin
  writeln('Ingrese n');
  readln(n);
  difMax := 0;
  posParMax := 0;
  if n <> 0 then
  begin
    writeln('Ingrese un numero');
    readln(pri);
  end;
  for i := 2 to n do
  begin
    writeln('Ingrese un numero');
    readln(seg);
    if pri - seg > difMax then
    begin
       difMax := pri - seg;
       posParMax := i - 1;
    end;
    pri := seg;
  end;

  writeln('Maxima diferencia: ', difMax);
  writeln('Par: ', posParMax);
  readln();
end.

