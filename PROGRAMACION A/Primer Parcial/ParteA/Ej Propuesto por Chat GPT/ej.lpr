program ej;
type
  st10 = string[10];

var
  archE : text;
  nombre, nombreMax : st10;
  i, n, contEst, contEstSupX : byte;
  monto, total, montoMax, x : real;
  tipo : char;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n);
  writeln('Ingrese X');
  readln(x);
  montoMax := -1;
  contEst := 0;
  contEstSupX := 0;
  for i := 1 to n do
  begin
    readln(archE, nombre);
    readln(archE, tipo);
    tipo := upcase(tipo);
    total := 0;
    readln(archE, monto);
    while monto <> 0 do
    begin
         total := total + monto;
         readln(archE, monto);
    end;
    if tipo = 'P' then
       total := total*0.85
    else
        begin
          contEst := contEst + 1;
          if total > x then
             contEstSupX := contEstSupX + 1;
        end;
    writeln(nombre, ' facturo $', total:4:2);
    if total > montoMax then
    begin
      montoMax := total;
      nombreMax := nombre;
    end;
  end;
  close(archE);
  writeln(nombreMax, ' fue el que facturo mas');
  if contEst <> 0 then
     writeln('Porcentaje de empresas estatales que superaron $', x:4:2, ': ', contEstSupX*100/contEst :4:2, '%');
  readln();
end.

