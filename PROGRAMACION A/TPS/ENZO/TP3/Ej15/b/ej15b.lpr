program ej15b;
var
  archE : text;
  car, car1, car2 : char;
  cont : byte;
  letra: boolean;
begin
  assign(archE, '../Entrada.txt');
  reset(archE);
  cont := 0;
  writeln('Ingrese caracter');
  readln(car);
  car := upcase(car);
  car1 := ' ';
  while car1 <> '.' do
  begin
      read(archE, car2);
      car2 := upcase(car2);
      if (car1 = ' ') and (car2 <> ' ') then
             letra := false
      else
            if (car1 = car) and not letra then
            begin
                 cont := cont + 1;
                 letra := true;
            end;
      car1 := car2;
  end;
  close(archE);
  writeln('Cantidad de palabras que contienen ', car, ': ', cont);
  readln();
end.

