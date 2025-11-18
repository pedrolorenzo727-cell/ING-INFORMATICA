program ej7;
type
  st10 = string[10];

function impuesto (monto : real; tipo : char):real;
const
  IVA = 21;
  recargo = 10;
var
  aux : real;
begin
  aux := monto*IVA/100;
  if tipo = 'N' then
     aux := aux + monto*recargo/100;
  impuesto := aux;
end;

function escribirTipo(tipo : char):string;
begin
  if tipo = 'S' then
     escribirTipo := 'Responsable Incripto'
  else
    escribirTipo := 'No es Responsable Inscripto';
end;

var
  archE : text;
  nombre, nombreMin : st10;
  i, n : byte;
  tipo : char;
  monto, total, totalMin : real;
begin
    assign(archE, 'Entrada.txt');
    reset(archE);
    totalMin := 99999;
    readln(archE, n);
    while not eof(archE) do
    begin
      total := 0;
      readln(archE, nombre);
      readln(archE, tipo);
      tipo := upcase(tipo);
      for i := 1 to n do
      begin
           readln(archE, monto);
           total := total + monto;
      end;
      writeln('Nombre: ', nombre);
      writeln('Tipo: ', escribirTipo(tipo));
      writeln('IVA: $', impuesto(total,tipo):4:2);

      if (total < totalMin) and (tipo = 'S') then
      begin
        totalMin := total;
        nombreMin := nombre;
      end;
    end;
    close(archE);
    if totalMin <> 99999 then
       writeln('Empresa de tipo responsable inscripto que menos facturo: ', nombreMin)
    else
      writeln('No hay responsables inscriptos');
    readln();
end.

