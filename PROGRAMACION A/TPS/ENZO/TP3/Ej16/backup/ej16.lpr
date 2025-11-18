program ej16;
var
  archE : text;
  i, n, contV, contVMax : byte;
  patente, patenteMax : string[7];
  km, acumKm, kmMin, litros, litrosMin: real;

begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n);
  contVMax := 0;
  kmMin := 99999;
  for i := 1 to n do
  begin
    readln(archE, patente, litros);
    acumKm := 0;
    contV := 0;
    read(archE, km);
    while km <> 0 do
    begin
      acumKm := acumKm + km;
      contV := contV + 1;
      read(archE, km);
    end;
    readln(archE);
    writeln(patente);
    if acumKM <> 0 then
      writeln('Consumo: ', litros/acumKM :4:2);
    if contV > contVMax then
    begin
      contVMax := contV;
      patenteMax := patente;
    end;
    if acumKm < kmMin then
    begin
      kmMin := acumKm;
      litrosMin := litros;
    end;
  end;
  close(archE);
  writeln('Mas viajes: ', patenteMax);
  writeln('Litros de la patente con menos Km : ' , litrosMin:4:2);
  readln();
end.

