program ej9;
var
  archE : text;
  num, numAnt : integer;
  ordenados : boolean;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  ordenados := true;
  readln(archE, numAnt);
  while not eof(archE) and ordenados do
  begin
       readln(archE, num);
       ordenados := num > numAnt;
       numAnt := num;
  end;
  close(archE);
  if ordenados then
     writeln('Los numeros estan ordenados de forma ascendente')
  else
      writeln('Los numeros no estan ordenados de forma ascendente');
  readln();
end.

