program ej15a;
var
  car1, car2, car: char;
  archE : text;
  cont : byte;

begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  cont := 0;
  car1 := ' ';
  writeln('Ingrese caracter');
  readln(car);
  car := upcase(car);
  while car1 <> '.' do
  begin
       read(archE, car2);
       car2 := upcase(car2);
       if (car1 = ' ') and (car2 = car) then
          cont := cont + 1;
       car1 := car2;
  end;
  close(ArchE);
  writeln('Cantidad de palabras que empiezan con ', car, ': ', cont);
  readln();
end.

