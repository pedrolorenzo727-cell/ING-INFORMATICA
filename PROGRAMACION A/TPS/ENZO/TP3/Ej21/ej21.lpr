program ej21;
var
  archE : text;
  i, iMax, contElem, contElemMax : byte;
  finDeDatos : boolean;
  num, max : integer;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  contElem := 0;
  contElemMax := 0;
  i := 0;
  finDeDatos := false;
  max := 0;
  read(archE, num);
  while not finDeDatos do
  begin
    if num <> 0 then
    begin
       if num > max then
          max := num;
       contElem := contElem + 1;
       read(archE, num);
    end
    else
        begin
          read(archE, num);
          finDeDatos := num = 0;
          i := i + 1;
          writeln('Maximo del subconjunto ', i, ': ', max);
          max := 0;
          if contElem > contElemMax then
             begin
                  contElemMax := contElem;
                  iMax := i;
             end;
          contElem := 0;
        end;
  end;
  close(archE);
  writeln('Subconjunto con mas elementos: ', iMax);
  readln();
end.

