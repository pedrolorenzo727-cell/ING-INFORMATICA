program ej24;
var
  archE, archS : text;
  car1, car2, i : char;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  assign(archS, 'Salida.txt');
  rewrite(archS);
  read(archE, car1);
  while car1 <> '.' do
  begin
    read(archE, car2);
    if (car1 in ['a'..'z']) and (car2 in ['0'..'9']) then
    begin
       for i := '1' to car2 do
           write(archS, car1);
       read(archE,car2);
    end
    else
        write(archS, car1);
    car1 := car2;
  end;
  close(archE);
  close(archS);
end.

