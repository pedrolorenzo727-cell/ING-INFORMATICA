program ej10;
var
  archE : text;
  num, numAnt : integer;
  frec : byte;
  aux : string;

begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  read(archE, numAnt);
  frec := 1;
  writeln('Numero', 'Frecuencia':12);
  while not eof(archE) do
  begin
    read(archE, num);
    if num = numAnt then
       frec := frec + 1
    else
      begin
        str(numAnt,aux);
        writeln(numAnt, frec:(10 - length(aux)));
        frec := 1;
      end;
    numAnt := num;
  end;
  str(numAnt,aux);
  writeln(numAnt, frec:(10 - length(aux)));
  readln();
end.

