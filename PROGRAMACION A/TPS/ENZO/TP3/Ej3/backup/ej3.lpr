program ej3;
var
  n, i, cont : byte;
  num, numAnt : integer;

begin
  writeln('Ingrese n');
  readln(n);
  cont := 0;
  if n <> 0 then
  begin
     writeln('Ingrese un numero');
     readln(numAnt);
  end;
  for i := 2 to n do
  begin
      writeln('Ingrese un numero');
      readln(num);
      if num > numAnt then
         cont := cont + 1;
      numAnt := num;
  end;

  writeln('Veces que un numero supera al interior: ', cont);
  readln();
end.

